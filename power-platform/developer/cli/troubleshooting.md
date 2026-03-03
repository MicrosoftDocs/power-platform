---
title: Troubleshoot Microsoft Power Platform CLI
description: Troubleshoot Microsoft Power Platform CLI issues such as diagnostic logging and missing DotnetToolSettings.xml errors in local and CI environments.
#customer intent: As someone who uses PAC CLI, I might need to troubleshoot problems when PAC CLI isn't working correctly.
ms.author: anpetroc
author: petrochuk
ms.reviewer: jdaly
ms.date: 02/19/2026
ms.topic: how-to
---

# Troubleshoot Microsoft Power Platform CLI

Learn about some steps you can take to troubleshoot problems if the Power Platform CLI isn't working properly. This article contains information about:

- [When and how to use the `--log-to-console` parameter](#use-the-global---log-to-console-parameter)
- [How to resolve an error that says that the `DotnetToolSettings.xml` file is missing](#resolve-dotnettoolsettingsxml-missing)


## Use the global `--log-to-console` parameter

The global `--log-to-console` parameter sends PAC CLI diagnostic logs to console output so pipeline logs capture them immediately.

```powershell
pac --log-to-console <noun> <verb> [parameters]
```

### When to use this parameter

Use `--log-to-console` when:

- You're running PAC CLI on ephemeral runners (for example GitHub-hosted runners) where local files are discarded when the job ends.
- A pipeline fails before a separate log upload step can publish local PAC CLI logs.
- You need immediate diagnostics in Azure DevOps or GitHub Actions job logs to triage failed deployments.

`--log-to-console` is a global PAC CLI parameter. This means you can use it with any PAC CLI command.

### Examples

#### [GitHub Actions](#tab/githubactions)

```yaml
- name: Import solution with PAC CLI diagnostics
  run: pac --log-to-console solution import --path ContosoSolution.zip --environment ${{ secrets.ENVIRONMENT_URL }}
```

#### [Azure DevOps](#tab/azuredevops)

```yaml
- task: PowerShell@2
  displayName: Import solution with PAC CLI diagnostics
  inputs:
    targetType: inline
    script: |
      pac --log-to-console solution import --path "$(Build.SourcesDirectory)\ContosoSolution.zip" --environment "$(EnvironmentUrl)"
```

---

> [!NOTE]
> The [`pac package deploy` command](reference/package.md#pac-package-deploy) also has command-specific logging parameters (`--logConsole` and `--logFile`) for package deployment output.

## Resolve `DotnetToolSettings.xml` missing

If a PAC CLI command fails with a `DotnetToolSettings.xml` missing message, the installed .NET version usually doesn't match the PAC CLI major version.

This known .NET tool behavior is tracked in [dotnet/sdk issue #38172](https://github.com/dotnet/sdk/issues/38172).

### Cause

- PAC CLI 2.x and later versions are built with .NET 10 and require .NET 10 to be installed as a prerequisite.
- PAC CLI 1.x versions are built with .NET 9 and require .NET 9 to be installed as a prerequisite.
- If the required .NET version isn't installed, the error can appear as `DotnetToolSettings.xml` missing instead of a clearer runtime message.
- Even when multiple SDKs are installed, a local `global.json` can force `dotnet` to use an older SDK that can't run the tool.
- Some users reported this problem with older SDK patch trains. Updating to newer SDK patches can resolve the problem.

### How to fix it

Use the following steps to fix this error.

1. Check the PAC CLI version:

   ```powershell
   pac
   ```

1. Install the required .NET SDK or runtime for that PAC CLI major version:

   - PAC CLI 2.x or later -> install .NET 10
   - PAC CLI 1.x -> install .NET 9

1. Verify the required SDK is available on the machine or build agent:

   ```powershell
   dotnet --list-sdks
   ```

1. Check whether `dotnet` is pinned by `global.json` in the current directory tree:

   ```powershell
   dotnet --info
   ```

   If `global.json` points to an older SDK, update it or run from a directory that doesn't pin an incompatible SDK.

1. Run the PAC CLI command again.

In CI systems (GitHub Actions and Azure DevOps), explicitly install the required .NET version in the pipeline before PAC CLI runs.

If you see this error while installing a different package (not PAC CLI), verify the package is a .NET tool package. Non-tool NuGet packages can produce similar messages with `dotnet tool install`.

### See also

[Microsoft Power Platform CLI overview](introduction.md)   
[Power Platform CLI command reference](reference/index.md)   
[pac package command reference](reference/package.md)
