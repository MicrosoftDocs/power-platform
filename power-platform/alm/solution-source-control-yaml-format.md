---
title: "Solution YAML source control format reference"
description: "Reference for the YAML-based source control folder format used by Dataverse Git integration and SolutionPackager. This article covers folder structure, manifest files, supported component types, and multi-solution repositories."
ms.custom: ""
ms.date: 04/07/2026
ms.reviewer: "pehecke"
ms.topic: reference
author: caburk
ms.subservice: alm
ms.author: caburk
search.audienceType:
  - developer
---
# Solution YAML source control format reference

This article is a reference for the YAML-based source control format used when you:

- Commit solutions using native [Dataverse Git integration](git-integration/overview.md) in Power Apps.
- Extract solutions using `pac solution clone` or `pac solution sync`.
- Manually run SolutionPackager against a folder that contains YAML manifest files.

The YAML format differs from the classic XML layout. Understanding the structure is important when you want to manually pack a YAML folder back into a `.zip` file that Dataverse can import.

> [!IMPORTANT]
> YAML source control format support in the `pac` CLI requires Microsoft.PowerApps.CLI version 2.4.1 or later. Download the latest version from [NuGet](https://www.nuget.org/packages/Microsoft.PowerApps.CLI/2.4.1) or update via `pac install latest`. SolutionPackager.exe, which ships with the NuGet package, supports the YAML format from the same version.

## Folder structure overview

A YAML-format repository root contains the following top-level directories:

```
<repositoryRoot>/
├── solutions/
│   └── <SolutionUniqueName>/       (one subfolder per solution)
│       ├── solution.yml
│       ├── solutioncomponents.yml
│       ├── rootcomponents.yml
│       └── missingdependencies.yml
├── publishers/
│   └── <PublisherUniqueName>/      (one subfolder per publisher)
│       └── publisher.yml
├── entities/                        (entity components, if any)
│   └── <entity_schema_name>/
│       ├── attributes/
│       ├── formxml/
│       ├── savedqueries/
│       └── ...
├── workflows/                       (classic workflow definitions, if any)
├── modernflows/                     (Power Automate cloud flows, if any)
├── canvasapps/                      (canvas app .msapp files, if any)
│   └── <canvas_app_schema_name>/
│       └── <name>.msapp
├── environmentvariabledefinitions/  (environment variable definitions, if any)
├── connectors/                      (custom connectors, if any)
└── [other component folders]/
```

The `solutions/` and `publishers/` directories are required. All component folders at the root are optional and depend on what the solution contains.

> [!IMPORTANT]
> All YAML manifest files (`solution.yml`, `publisher.yml`, and so on) must be placed under their respective subdirectories (`solutions/<name>/`, `publishers/<name>/`). Placing them at the repository root prevents format detection and causes the SolutionPackager tool to fall back to the XML format — producing a misleading error about a missing `Customizations.xml`. More information: [SolutionPackager tool troubleshooting](solution-packager-tool.md#troubleshooting)

## Format auto-detection

SolutionPackager (and `pac solution pack`) auto-detect the format as follows:

| Condition | Detected format | Behavior |
|---|---|---|
| `solutions/*/solution.yml` found — one solution | YAML | Solution name inferred from the subfolder name |
| `solutions/*/solution.yml` found — multiple solutions | YAML | `/SolutionName` argument required to specify which solution to pack |
| No `solutions/` subdirectory present | XML (legacy) | Expects `Other\Solution.xml` and `Other\Customizations.xml` |

## Manifest files

### solution.yml

Located at `solutions/<SolutionUniqueName>/solution.yml`. Contains top-level solution metadata — the YAML equivalent of `solution.xml` in the XML format.

Key fields include the solution's unique name, version, friendly name, description, and a reference to the publisher.

### solutioncomponents.yml

Located at `solutions/<SolutionUniqueName>/solutioncomponents.yml`. Lists relative paths to all component files included in this solution. SolutionPackager reads this file during pack to locate component sources.

Example excerpt:

```yaml
- Path: entities/account
- Path: entities/contact
- Path: canvasapps/myapp_<guid>
- Path: publishers/MyPublisher
```

### rootcomponents.yml

Located at `solutions/<SolutionUniqueName>/rootcomponents.yml`. Lists the root-level components (typically tables and other top-level objects) that belong to this solution.

 > [!NOTE]
 > If a component is declared in `rootcomponents.yml` but its source files are absent from the folder
 > (for example, a canvas app `.msapp` file under `canvasapps/<name>/`), SolutionPackager emits a
 > warning and omits that component from the packed `.zip`. The pack operation still completes
 > successfully with exit code 0.
 >
 > Pack success does not guarantee import success. If `solutioncomponents.yml` omits required
 > dependency paths — such as parent entity folders or relationship definitions under
 > `entityrelationships/` — the solution packs without error but fails on import with a message like:
 > *"Attributes are missing associated relationship definitions."* Always ensure
 > `solutioncomponents.yml` includes all dependent entities and relationships, not just the
 > solution-owned ones.

### missingdependencies.yml

Located at `solutions/<SolutionUniqueName>/missingdependencies.yml`. Records any solution dependencies that weren't present when the solution was last exported. Used for informational purposes and to validate completeness on import.

### publisher.yml

Located at `publishers/<PublisherUniqueName>/publisher.yml`. Contains the publisher definition — unique name, display name, customization prefix, and option value prefix.

Minimal required structure:

```yaml
Publisher:
  UniqueName: mypublisher
  LocalizedNames:
    LocalizedName:
      '@description': My Publisher
      '@languagecode': '1033'
  Descriptions:
  EMailAddress:
    '@xsi:nil': 'true'
    '@xmlns:xsi': http://www.w3.org/2001/XMLSchema-instance
  SupportingWebsiteUrl:
    '@xsi:nil': 'true'
    '@xmlns:xsi': http://www.w3.org/2001/XMLSchema-instance
  CustomizationPrefix: myp
  CustomizationOptionValuePrefix: '12345'
  Addresses:
```

## Component type support

The following table lists how each component type is handled in the YAML format.

| Component type | In YAML format | Notes |
|---|---|---|
| Entities (tables), attributes, forms, views | ✓ YAML files | Stored as individual YAML files per subcomponent |
| Workflows (classic) | ✓ YAML files | Under `workflows/` |
| Modern flows (Power Automate cloud flows) | ✓ — YAML format only | Under `modernflows/`; not supported in XML format |
| Canvas apps | ✓ — YAML format only | `.msapp` binary under `canvasapps/<name>/`; not supported in XML format |
| Environment variable definitions | ✓ XML files | Individual `.xml` files under `environmentvariabledefinitions/` |
| Environment variable values | ✓ JSON file | Stored as `environment_variable_values.json` |
| Custom connectors | ✓ | Under `connectors/` |
| Plug-in assemblies | ✓ | Fully qualified type names remapped by default (`/remapPluginTypeNames`) |
| Web resources | ✓ | Under `webresources/` |
| Security roles | ✓ | Stored as XML internally; filtered per solution |
| Option sets (global) | ✓ | Stored as XML; filtered per solution |
| Dashboards | ✓ | Stored as XML; filtered per solution |
| Site maps | ✓ | Stored as XML; filtered per solution |
| Ribbon customizations | ✓ | Stored as XML; filtered per solution |
| Entity relationships | ✓ | Under `entityrelationships/` |

> [!NOTE]
> Components stored as XML internally are automatically converted between XML and YAML during pack and unpack operations. You can author them as YAML files; the tool handles the conversion.

## Multi-solution repositories

A single repository root can contain multiple solutions. All solutions share the same component folders; `solutioncomponents.yml` in each solution controls which component paths belong to that solution.

Example structure with two solutions:

```
<repositoryRoot>/
├── solutions/
│   ├── SolutionA/
│   │   ├── solution.yml
│   │   ├── solutioncomponents.yml    ← references entities/account, entities/contact
│   │   ├── rootcomponents.yml
│   │   └── missingdependencies.yml
│   └── SolutionB/
│       ├── solution.yml
│       ├── solutioncomponents.yml    ← references entities/lead, workflows/myflow
│       ├── rootcomponents.yml
│       └── missingdependencies.yml
├── publishers/
│   └── SharedPublisher/
│       └── publisher.yml
├── entities/
│   ├── account/
│   ├── contact/
│   └── lead/
└── workflows/
    └── myflow/
```

### Packing a specific solution from a multi-solution folder

Using SolutionPackager.exe:

```
SolutionPackager.exe /action:Pack /zipfile:SolutionA.zip /folder:C:\repos\myrepo /SolutionName:SolutionA
```

Using `pac solution pack` (single-solution folders only — for multi-solution, use SolutionPackager.exe directly with `/SolutionName`):

```powershell
pac solution pack --zipfile SolutionA.zip --folder C:\repos\myrepo
```

> [!NOTE]
> When using native Dataverse Git integration with environment binding, all solutions in the environment share a single repository root using the multi-solution layout. When using solution binding, each solution can be bound to a separate folder.

## Working with YAML format folders

### Pack a YAML folder into a .zip file

```powershell
# Using pac CLI (single solution in folder)
pac solution pack --zipfile C:\output\MySolution.zip --folder C:\repos\myrepo

# Using SolutionPackager.exe directly (also works for multi-solution with /SolutionName)
SolutionPackager.exe /action:Pack /zipfile:C:\output\MySolution.zip /folder:C:\repos\myrepo
```

### Obtain a complete YAML folder from Dataverse

The recommended way to get a complete, packable YAML folder is to use `pac solution clone`:

```powershell
pac solution clone --name MySolutionUniqueName --outputDirectory C:\repos\myrepo
```

This extracts the solution into the YAML format, including all component source files. Alternatively, use native Git integration to commit from Power Apps — the committed files are in YAML format and fully packable.

### Verify the folder before packing

Check that the `solutions/<name>/` folder exists and that all paths in `solutioncomponents.yml` resolve to actual files. Any missing paths result in warnings during pack and those components are omitted.

## Relationship to Dataverse Git integration

The YAML source control format is the canonical format used by [Dataverse Git integration](git-integration/overview.md). When makers commit solutions from Power Apps, the files written to Azure DevOps use this format. Code-first developers can work with the same repository using the CLI tools described here.

For information about connecting environments to Git, see [Dataverse Git integration setup](git-integration/connecting-to-git.md).

## Related content

- [SolutionPackager tool](solution-packager-tool.md)
- [Source control with solution files](use-source-control-solution-files.md)
- [pac solution pack](../developer/cli/reference/solution.md#pac-solution-pack)
- [pac solution unpack](../developer/cli/reference/solution.md#pac-solution-unpack)
- [Dataverse Git integration overview](git-integration/overview.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
