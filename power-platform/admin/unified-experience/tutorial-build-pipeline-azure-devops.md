---
title: "Tutorial: Set up a nightly build pipeline for finance and operations apps using Azure DevOps"
description: This tutorial demonstrates how to create an Azure DevOps build pipeline that compiles X++ code, generates a Power Platform unified package, and optionally includes Dataverse solutions.
author: laneswenka
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: reference
ms.date: 03/18/2026
ms.subservice: admin
ms.author: laswenka
search.audienceType:
  - admin
  - developer
---

# Tutorial: Set up a nightly build pipeline for finance and operations apps using Azure DevOps

Customers who develop X++ customizations for finance and operations apps need an automated build pipeline that compiles their code, creates a deployable package, and makes it available for release. By using unified environments in the Power Platform admin center, the build output is a **Power Platform unified package** that can optionally include Dataverse solutions alongside the X++ compiled output, all deployable through a single `pac package deploy` command.

In this tutorial, learn how to:

- Set up NuGet package feeds with the required build reference packages
- Create `packages.config` and `nuget.config` files for version management
- Build an Azure DevOps YAML pipeline that compiles X++ and produces a unified package on a nightly schedule
- Optionally include one or more Dataverse solutions in the unified package

As an example of this scenario, a customer has X++ customizations for Dynamics 365 Finance running on a unified environment. They want a nightly build that compiles their code, packages it alongside their Dataverse solutions, and publishes the artifacts for their release pipeline to deploy.

## Before you begin

- You need an [Azure DevOps](https://dev.azure.com) organization and project with a Git repository containing your X++ source code and Visual Studio solution.
- Install the [Dynamics 365 Finance and Operations Tools](https://marketplace.visualstudio.com/items?itemName=Dyn365FinOps.dynamics365-finops-tools) extension in your Azure DevOps organization.
- Install the [Power Platform Build Tools](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools) extension in your Azure DevOps organization.
- Your source repository must contain an X++ project (.rnrproj) for each package you need to build, and you must check in the model descriptor files under the metadata folder. For more information, see [Build automation that uses Microsoft-hosted agents and Azure Pipelines](/dynamics365/fin-ops-core/dev-itpro/dev-tools/hosted-build-automation).

## Step 1: Obtain the NuGet build reference packages

The X++ build process requires NuGet packages that contain the compiler tools and reference assemblies for the platform and application modules. A full build requires five packages:

| NuGet package | Purpose | LCS Shared Asset Library name |
|:-------------|:--------|:------------------------------|
| `Microsoft.Dynamics.AX.Platform.CompilerPackage` | X++ compiler (xppc.exe) and related build tools | PUXX/10.X.XX - Compiler Tools |
| `Microsoft.Dynamics.AX.Platform.DevALM.BuildXpp` | Compiled platform module references optimized for building | PUXX/10.X.XX - Platform Build Reference |
| `Microsoft.Dynamics.AX.Application1.DevALM.BuildXpp` | Compiled Application module references (part 1) | PUXX/10.X.XX - Application 1 Build Reference |
| `Microsoft.Dynamics.AX.Application2.DevALM.BuildXpp` | Compiled Application module references (part 2) | PUXX/10.X.XX - Application 2 Build Reference |
| `Microsoft.Dynamics.AX.ApplicationSuite.DevALM.BuildXpp` | Compiled Application Suite module references | PUXX/10.X.XX - Application Suite Build Reference |

> [!IMPORTANT]
> You can currently download these NuGet packages from the **Shared Asset Library** in [Microsoft Dynamics Lifecycle Services (LCS)](https://lcs.dynamics.com). Any customer operating unified environments in the Power Platform admin center can access the Shared Asset Library in LCS to download these assets. A replacement distribution mechanism that doesn't require LCS is coming soon. We'll update this tutorial when that capability is available.

> [!NOTE]
> The NuGet packages contain version details that must be equal to or lower than the version of your target finance and operations environment. When you apply a quality update to your environment, download the corresponding NuGet package versions to keep your build aligned. If you're only extending the platform (no Application Suite customizations), you might only need the `CompilerPackage` and `Platform.DevALM.BuildXpp` packages. However, most customers extending application functionality need all five.

### Publish packages to an Azure Artifacts feed

1. In your Azure DevOps project, go to **Artifacts** > **Create Feed**. Name the feed (for example, `FinOpsNuGet`) and select **Create**.
1. Download the NuGet packages from the LCS Shared Asset Library that match your target environment version.
1. Download [nuget.exe](https://www.nuget.org/downloads) and publish each package to your feed:

   ```powershell
   nuget.exe push -Source "https://pkgs.dev.azure.com/<org>/<project>/_packaging/<feed>/nuget/v3/index.json" -ApiKey AZ Microsoft.Dynamics.AX.Platform.CompilerPackage.nupkg
   nuget.exe push -Source "https://pkgs.dev.azure.com/<org>/<project>/_packaging/<feed>/nuget/v3/index.json" -ApiKey AZ Microsoft.Dynamics.AX.Platform.DevALM.BuildXpp.nupkg
   nuget.exe push -Source "https://pkgs.dev.azure.com/<org>/<project>/_packaging/<feed>/nuget/v3/index.json" -ApiKey AZ Microsoft.Dynamics.AX.Application1.DevALM.BuildXpp.nupkg
   nuget.exe push -Source "https://pkgs.dev.azure.com/<org>/<project>/_packaging/<feed>/nuget/v3/index.json" -ApiKey AZ Microsoft.Dynamics.AX.Application2.DevALM.BuildXpp.nupkg
   nuget.exe push -Source "https://pkgs.dev.azure.com/<org>/<project>/_packaging/<feed>/nuget/v3/index.json" -ApiKey AZ Microsoft.Dynamics.AX.ApplicationSuite.DevALM.BuildXpp.nupkg
   ```

1. Verify all five packages appear in your Azure DevOps Artifacts feed.

## Step 2: Add configuration files to your repository

Two configuration files control which NuGet packages are restored and where they come from. Add both files to a folder in your repository, such as `BuildPipeline/`.

### nuget.config

This file points NuGet to your Azure Artifacts feed. Replace the placeholder values with your organization, project, and feed names.

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <clear />
    <add key="FinOpsNuGet" value="https://pkgs.dev.azure.com/<org>/<project>/_packaging/<feed>/nuget/v3/index.json" />
  </packageSources>
</configuration>
```

### packages.config

This file specifies the exact versions of each NuGet package. Update the version numbers to match the packages you published to your feed.

```xml
<?xml version="1.0" encoding="utf-8"?>
<packages>
    <package id="Microsoft.Dynamics.AX.Platform.CompilerPackage" version="7.0.7367.146" targetFramework="net40" />
    <package id="Microsoft.Dynamics.AX.Platform.DevALM.BuildXpp" version="7.0.7367.146" targetFramework="net40" />
    <package id="Microsoft.Dynamics.AX.Application1.DevALM.BuildXpp" version="10.0.1935.21" targetFramework="net40" />
    <package id="Microsoft.Dynamics.AX.Application2.DevALM.BuildXpp" version="10.0.1935.21" targetFramework="net40" />
    <package id="Microsoft.Dynamics.AX.ApplicationSuite.DevALM.BuildXpp" version="10.0.1935.21" targetFramework="net40" />
</packages>
```

> [!TIP]
> The platform packages (`CompilerPackage` and `Platform.DevALM.BuildXpp`) use a `7.0.XXXX.XX` version scheme, while the application packages (`Application1`, `Application2`, and `ApplicationSuite`) use a `10.0.XXXX.XX` version scheme. These versions are independent and are updated with each quality update.

## Step 3: Create the build pipeline

Create a file named `nightly-build.yml` in your repository. This pipeline compiles the X++ code, creates a Power Platform unified package, and publishes the artifacts.

### Pipeline variables

The pipeline uses variables to avoid hardcoding version numbers and paths. When you update NuGet packages for a new quality update, change only the version variables.

### Full pipeline YAML

```yaml
trigger: none

schedules:
  - cron: '0 4 * * *'  # Runs at 4:00 AM UTC every day
    displayName: 'Nightly Build'
    branches:
      include:
        - master
    always: true

pool:
  vmImage: 'windows-latest'

variables:
  # -- NuGet package versions --
  # Update these when applying a new quality update to your environments
  PlatformVersion: '7.0.7367.146'
  ApplicationVersion: '10.0.1935.21'

  # -- Paths --
  NuGetConfigPath: '$(Build.SourcesDirectory)/BuildPipeline'
  NuGetInstallDir: '$(Build.SourcesDirectory)/NuGets'
  MetadataPath: '$(Build.SourcesDirectory)/XppMetadata'
  SolutionPath: '$(Build.SourcesDirectory)/VS_Solutions/DataverseIntegration/DataverseIntegration.sln'

  # -- NuGet package folder names (using -ExcludeVersion for stable paths) --
  CompilerPackage: '$(NuGetInstallDir)/Microsoft.Dynamics.AX.Platform.CompilerPackage'
  PlatformBuildRef: '$(NuGetInstallDir)/Microsoft.Dynamics.AX.Platform.DevALM.BuildXpp'
  App1BuildRef: '$(NuGetInstallDir)/Microsoft.Dynamics.AX.Application1.DevALM.BuildXpp'
  App2BuildRef: '$(NuGetInstallDir)/Microsoft.Dynamics.AX.Application2.DevALM.BuildXpp'
  AppSuiteBuildRef: '$(NuGetInstallDir)/Microsoft.Dynamics.AX.ApplicationSuite.DevALM.BuildXpp'

  # -- Unified package output --
  UnifiedPackageOutput: '$(Build.ArtifactStagingDirectory)/UnifiedPackage'

stages:
  - stage: Build
    displayName: 'Compile X++ and Create Unified Package'
    jobs:
      - job: BuildXpp
        displayName: 'Build X++ and package'
        timeoutInMinutes: 120
        steps:
          # -------------------------------------------------------
          # Step 1: Install NuGet packages
          # -------------------------------------------------------
          - task: NuGetCommand@2
            displayName: 'Restore NuGet build packages'
            inputs:
              command: 'custom'
              arguments: >
                install "$(NuGetConfigPath)/packages.config"
                -ConfigFile "$(NuGetConfigPath)/nuget.config"
                -OutputDirectory "$(NuGetInstallDir)"
                -ExcludeVersion
                -Verbosity Detailed
                -Noninteractive

          # -------------------------------------------------------
          # Step 2: Build the X++ solution
          # -------------------------------------------------------
          - task: VSBuild@1
            displayName: 'Build X++ solution'
            inputs:
              solution: '$(SolutionPath)'
              vsVersion: '17.0'
              msbuildArgs: >
                /p:BuildTasksDirectory="$(CompilerPackage)/DevAlm"
                /p:MetadataDirectory="$(MetadataPath)"
                /p:FrameworkDirectory="$(CompilerPackage)"
                /p:ReferenceFolder="$(PlatformBuildRef)/ref/net40;$(App1BuildRef)/ref/net40;$(App2BuildRef)/ref/net40;$(AppSuiteBuildRef)/ref/net40;$(MetadataPath);$(Build.BinariesDirectory)"
                /p:ReferencePath="$(CompilerPackage)"
                /p:OutputDirectory="$(Build.BinariesDirectory)"
                /p:CompilerMetadata="$(Build.BinariesDirectory)"

          # -------------------------------------------------------
          # Step 3: Install NuGet 3.3.0 (required for packaging)
          # -------------------------------------------------------
          - task: NuGetToolInstaller@1
            displayName: 'Install NuGet 3.3.0 for packaging'
            inputs:
              versionSpec: '3.3.0'

          # -------------------------------------------------------
          # Step 4: Create the Power Platform unified package
          # -------------------------------------------------------
          - task: XppCreatePackage@3
            displayName: 'Create Power Platform unified package'
            inputs:
              XppToolsPath: '$(CompilerPackage)'
              CreateCloudPackage: true
              CloudPackagePlatVersion: '$(PlatformVersion)'
              CloudPackageAppVersion: '$(ApplicationVersion)'
              CloudPackageOutputLocation: '$(UnifiedPackageOutput)'
              DeployablePackagePath: '$(Build.ArtifactStagingDirectory)/AXDeployableRuntime.zip'

          # -------------------------------------------------------
          # Step 5 (Optional): Add Dataverse solutions to the package
          # -------------------------------------------------------
          # If you have Dataverse solutions (managed .zip files) that
          # should be deployed alongside your X++ code, add them to
          # the unified package. Each solution becomes part of the
          # same package that pac package deploy will process.

          - task: PowerPlatformToolInstaller@2
            displayName: 'Install Power Platform Build Tools'
            condition: and(succeeded(), ne(variables['DataverseSolutionsPath'], ''))

          - task: PowerShell@2
            displayName: 'Add Dataverse solutions to unified package'
            condition: and(succeeded(), ne(variables['DataverseSolutionsPath'], ''))
            inputs:
              targetType: 'inline'
              script: |
                $solutionsPath = "$(DataverseSolutionsPath)"
                $packageFolder = "$(UnifiedPackageOutput)"

                if (-not (Test-Path $solutionsPath)) {
                    Write-Host "No Dataverse solutions path specified or found. Skipping."
                    exit 0
                }

                Write-Host "Looking for Dataverse solution .zip files in: $solutionsPath"
                $solutions = Get-ChildItem -Path $solutionsPath -Filter "*.zip" -File

                if ($solutions.Count -eq 0) {
                    Write-Host "No solution .zip files found. Skipping."
                    exit 0
                }

                # The unified package uses a specific folder structure.
                # Dataverse solutions go under the PackageDeployer/solutions subfolder.
                $targetDir = Join-Path $packageFolder "PkgFolder"
                if (-not (Test-Path $targetDir)) {
                    New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
                }

                foreach ($sol in $solutions) {
                    Write-Host "Adding solution: $($sol.Name)"
                    Copy-Item -Path $sol.FullName -Destination $targetDir
                }

                Write-Host "Added $($solutions.Count) Dataverse solution(s) to the unified package."

          # -------------------------------------------------------
          # Step 6: Publish build artifacts
          # -------------------------------------------------------
          - task: PublishBuildArtifacts@1
            displayName: 'Publish unified package artifact'
            inputs:
              PathtoPublish: '$(UnifiedPackageOutput)'
              ArtifactName: 'UnifiedPackage'

          - task: PublishBuildArtifacts@1
            displayName: 'Publish deployable runtime package artifact'
            inputs:
              PathtoPublish: '$(Build.ArtifactStagingDirectory)/AXDeployableRuntime.zip'
              ArtifactName: 'LCSPackage'
```

### Understanding the pipeline

The pipeline has six core steps:

| Step | Task | Purpose |
|:-----|:-----|:--------|
| 1 | `NuGetCommand@2` | Restores the compiler and reference packages from your Azure Artifacts feed. The `-ExcludeVersion` flag removes version numbers from folder names, so MSBuild paths stay stable across version updates. |
| 2 | `VSBuild@1` | Compiles the X++ solution using MSBuild with arguments that point to the NuGet package locations for the compiler, platform references, and application references. |
| 3 | `NuGetToolInstaller@1` | Installs NuGet 3.3.0, which is required by the packaging task. Versions 3.4 and later use semantic versioning that is incompatible with the deployable package format. |
| 4 | `XppCreatePackage@3` | Creates both a traditional deployable package (.zip) and a **Power Platform unified package**. The unified package is the format required for deploying to unified environments via `pac package deploy`. |
| 5 | `PowerShell@2` | (Optional) Adds Dataverse solution .zip files to the unified package so that X++ customizations and Dataverse solutions are deployed together as a single unit. |
| 6 | `PublishBuildArtifacts@1` | Publishes both package formats as pipeline artifacts for downstream release pipelines. |

## Step 4: Including Dataverse solutions (optional)

A key benefit of unified environments is that finance and operations X++ customizations and Dataverse solutions can be combined into a single deployable package. This means your release pipeline uses one `pac package deploy` command to deploy everything.

To include Dataverse solutions in your nightly build:

1. Add your Dataverse managed solution .zip files to a folder in your repository (for example, `DataverseSolutions/`).
1. Set the `DataverseSolutionsPath` variable in your pipeline:

   ```yaml
   variables:
     DataverseSolutionsPath: '$(Build.SourcesDirectory)/DataverseSolutions'
   ```

1. The pipeline's optional Step 5 automatically picks up any .zip files from that path and adds them to the unified package.

When the release pipeline later runs `pac package deploy`, it processes the entire unified package, deploying both the X++ runtime package to the finance and operations runtime and the Dataverse solutions to the Dataverse environment.

> [!NOTE]
> If you don't have Dataverse solutions to include, leave the `DataverseSolutionsPath` variable empty or remove it. Step 5's condition check skips the Dataverse steps automatically.

## Step 5: Updating package versions for quality updates

When you apply a new quality update (PQU) to your environments, update the build pipeline to match:

1. Download the new NuGet packages from the LCS Shared Asset Library.
1. Publish the new versions to your Azure Artifacts feed.
1. Update `packages.config` with the new version numbers.
1. Update the pipeline variables `PlatformVersion` and `ApplicationVersion` to match.

> [!TIP]
> Keep your `packages.config` version numbers in sync with the `PlatformVersion` and `ApplicationVersion` pipeline variables. The `packages.config` file controls which NuGet packages are restored, while the pipeline variables tell the `XppCreatePackage` task which platform and application version metadata to stamp into the unified package.

## Troubleshooting

| Issue | Resolution |
|:------|:-----------|
| Build fails with missing references | Ensure you publish all five NuGet packages to your Artifacts feed and that the versions in `packages.config` match. If you're only extending the platform, you still need `Application1`, `Application2`, and `ApplicationSuite` for reference resolution. |
| `XppCreatePackage` fails with version mismatch | The `CloudPackagePlatVersion` and `CloudPackageAppVersion` values must match the NuGet package versions you restored. |
| NuGet restore fails with 401 | Your pipeline's build service account needs **Reader** access to the Azure Artifacts feed. Go to **Artifacts** > **Feed settings** > **Permissions** and add the build service. |
| Packaging fails with semantic versioning error | Ensure Step 3 installs NuGet 3.3.0. Versions 3.4 and later introduce semantic versioning that is incompatible with the deployable package generation. |
| `fnomoduledefinition.json file not found` | The `CloudPackageOutputLocation` path might be incorrect, or the `XppToolsPath` might not point to a valid compiler package. Verify your variable paths. |

## Next steps

- [Tutorial: Schedule environment copy and automated data import using Azure DevOps](./tutorial-scheduled-copy-with-data-import.md)
- [Build automation that uses Microsoft-hosted agents and Azure Pipelines](/dynamics365/fin-ops-core/dev-itpro/dev-tools/hosted-build-automation)
- [Continuous integration and deployment for unified environments](/power-platform/developer/unified-experience/finance-operations-pipelines)
