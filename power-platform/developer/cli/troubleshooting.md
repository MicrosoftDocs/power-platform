---
title: Troubleshoot Microsoft Power Platform CLI
description: Troubleshoot Microsoft Power Platform CLI issues such as diagnostic logging and missing DotnetToolSettings.xml errors in local and CI environments.
ms.author: laswenka
author: laneswenka
ms.reviewer: jdaly
ms.date: 02/19/2026
ms.topic: how-to
---

# Troubleshoot Microsoft Power Platform CLI

Use this article to troubleshoot advanced PAC CLI scenarios.

## Troubleshooting topics

- [Log diagnostics to console](#use-global---log-to-console)
- [.NET prerequisite issues (`DotnetToolSettings.xml` missing)](#resolve-dotnettoolsettingsxml-missing)

## Use global `--log-to-console`

The global `--log-to-console` parameter sends PAC CLI diagnostic logs to console output so pipeline logs capture them immediately.

```powershell
pac --log-to-console <noun> <verb> [parameters]
```

### When to use this parameter

Use `--log-to-console` when:

- You're running PAC CLI on ephemeral runners (for example GitHub-hosted runners) where local files are discarded when the job ends.
- A pipeline fails before a separate log upload step can publish local PAC CLI logs.
- You need immediate diagnostics in Azure DevOps or GitHub Actions job logs to triage failed deployments.

### GitHub Actions example

```yaml
- name: Import solution with PAC CLI diagnostics
  run: pac --log-to-console solution import --path ContosoSolution.zip --environment ${{ secrets.ENVIRONMENT_URL }}
```

### Azure DevOps example

```yaml
- task: PowerShell@2
  displayName: Import solution with PAC CLI diagnostics
  inputs:
    targetType: inline
    script: |
      pac --log-to-console solution import --path "$(Build.SourcesDirectory)\ContosoSolution.zip" --environment "$(EnvironmentUrl)"
```

### Notes

- `--log-to-console` is a global PAC CLI parameter.
- `pac package deploy` also has command-specific logging parameters (`--logConsole` and `--logFile`) for package deployment output.

## Resolve `DotnetToolSettings.xml` missing

If PAC CLI fails with a `DotnetToolSettings.xml` missing message, the installed .NET version usually doesn't match the PAC CLI major version.

This known .NET tool behavior is tracked in [dotnet/sdk issue #38172](https://github.com/dotnet/sdk/issues/38172).

### Why this happens

- PAC CLI 2.x and later is built with .NET 10 and requires .NET 10 to be installed as a prerequisite.
- PAC CLI 1.x is built with .NET 9 and requires .NET 9 to be installed as a prerequisite.
- If the required .NET version isn't installed, the error can appear as `DotnetToolSettings.xml` missing instead of a clearer runtime message.
- Even when multiple SDKs are installed, a local `global.json` can force `dotnet` to use an older SDK that can't run the tool.
- Some users reported this with older SDK patch trains; updating to newer SDK patches can resolve it.

### How to fix it

1. Check the PAC CLI version:

   ```powershell
   pac
   ```

1. Install the required .NET SDK/runtime for that PAC CLI major version:

   - PAC CLI 2.x+ -> install .NET 10
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

If you see this while installing a different package (not PAC CLI), verify the package is a .NET tool package; non-tool NuGet packages can produce similar messages with `dotnet tool install`.

### See also

[Microsoft Power Platform CLI overview](introduction.md)<br />
[Power Platform CLI command reference](reference/index.md)<br />
[pac package command reference](reference/package.md)
