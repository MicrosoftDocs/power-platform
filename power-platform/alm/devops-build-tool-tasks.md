---
title: "Build tool tasks | Microsoft Docs"
description: "Learn about what build tool tasks are available plus some examples of tasks in Azure Pipelines."
author: marcelbf
ms.author: marcelbf
ms.subservice: alm
ms.date: 12/03/2024
ms.reviewer: pehecke
ms.topic: how-to
search.audienceType: 
  - developer
---

# Microsoft Power Platform Build Tools tasks

The available build tasks are described in the following sections. Afterwards, we showcase some example Azure Pipelines making use of these tasks. For information about the build tools and how to download them, see [Microsoft Power Platform Build Tools for Azure Pipelines](devops-build-tools.md).

## Helper task

The available helper tasks are described next.

### Power Platform Tool Installer

This task is required to be added once before any other Power Platform Build Tools tasks in build and
release pipelines. This task installs a set of Power Platform&ndash;specific tools required
by the agent to run the Microsoft Power Platform build tasks. This task doesn't require any
more configuration when added. This task contains parameters for the specific versions
of each of the tools that are being installed.

To stay up to date with the tool versions over time, make sure these parameters correspond
to the versions of the tools that are required for the pipeline to run properly.

#### YAML snippet (Installer)

```yml
# Installs default Power Platform Build Tools
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.tool-installer.PowerPlatformToolInstaller@2
  displayName: 'Power Platform Tool Installer'
```

```yml
# Installs specific versions of the Power Platform Build Tools
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.tool-installer.PowerPlatformToolInstaller@2
  displayName: 'Power Platform Tool Installer'
  inputs:
    DefaultVersion: false
    XrmToolingPackageDeploymentVersion: 3.3.0.928
```

#### Parameters (Installer)

| Parameters    | Description   |
|---------------|---------------|
| `DefaultVersion`<br/>Use default tool versions | Set to **true** to use the default version of all tools, otherwise **false**. Required (and **false**) when any tool versions are specified. |
| `PowerAppsAdminVersion`<br/>`XrmToolingPackageDeploymentVersion`<br/>`MicrosoftPowerAppsCheckerVersion`<br/>`CrmSdkCoreToolsVersion`<br/>Tool version | The specific version of the tool to use. |

### Power Platform WhoAmI

Verifies a Power Platform environment service connection by connecting and making a WhoAmI request. This task can be useful to include early in the pipeline, to verify connectivity before processing begins.

#### YAML snippet (WhoAmI)

```yml
# Verifies an environment service connection
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.whoami.PowerPlatformWhoAmi@2
  displayName: 'Power Platform WhoAmI'

  inputs: 
#   Service Principal/client secret (supports MFA)
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: 'My service connection'
```

```yml
# Verifies an environment service connection
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.whoami.PowerPlatformWhoAmi@2
  displayName: 'Power Platform WhoAmI'

  inputs:
#   Username/password (no MFA support)
    PowerPlatformEnvironment: 'My service connection'
```

#### Parameters (WhoAmI)

| Parameters    | Description   |
|---------------|---------------|
| `authenticationType`<br/>Type of authentication | (Optional) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint for the environment to connect to. Defined under **Service Connections** in **Project Settings**. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint for the environment to connect to. Defined under **Service Connections** in **Project Settings**. |

## Quality check

In the next section are the available tasks for checking the quality of a solution.

### Power Platform Checker

This task runs a static analysis check on your solutions
against a set of best-practice rules to identify any problematic patterns that
you might inadvertently introduced when building your solution.

#### YAML snippet (Checker)

```yml
# Static analysis check of your solution
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.checker.PowerPlatformChecker@2
  displayName: 'Power Platform Checker '
  inputs:
    PowerPlatformSPN: 'Dataverse service connection'
    RuleSet: '0ad12346-e108-40b8-a956-9a8f95ea18c9'
```

```yml
# Static analysis check of your solution
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.checker.PowerPlatformChecker@2
  displayName: 'Power Platform Checker '
  inputs:
    PowerPlatformSPN: 'Dataverse service connection'
    UseDefaultPACheckerEndpoint: false
    CustomPACheckerEndpoint: 'https://japan.api.advisor.powerapps.com/'
    FileLocation: sasUriFile
    FilesToAnalyzeSasUri: 'SAS URI'
    FilesToAnalyze: '**\*.zip'
    FilesToExclude: '**\*.tzip'
    RulesToOverride: 'JSON array'
    RuleSet: '0ad12346-e108-40b8-a956-9a8f95ea18c9'
```

#### Parameters (Checker)

| Parameters         | Description      |
|--------------------|------------------|
| `PowerPlatformSPN`<br/>Service Connection | (Required) A connection to a licensed Microsoft Power Platform environment is required to use the Power Platform checker. Service connections are defined in **Service Connections** under **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment)<p/>Note: Service Principal and username/password authentication methods are available for the checker task. For more information on how to configure service principals to be used with this task, see [Configure service principal connections for Power Platform environments](devops-build-tools.md#configure-service-connections-using-a-service-principal). |
| `UseDefaultPACheckerEndpoint`<br/>Use default Power Platform Checker endpoint | By default (**true**), the geographic location of the checker service uses the same geography as the environment you connect to. |
| `CustomPACheckerEndpoint`<br/>Custom PAC checker endpoint | Required when `UseDefaultPACheckerEndpoint` is **false**. You may specify another geo to use, for example `https://japan.api.advisor.powerapps.com.` For a list of available geographies, see [Use the Power Platform Checker API](/powerapps/developer/common-data-service/checker/webapi/overview#determine-a-geography). |
| `FileLocation`<br/>Location of files to analyze       | Required when referencing a file from a shared access signature (SAS) URL `sasUriFile`.<p/>Note: It's important to reference an exported solution file and not the unpacked source files in your repository. Both managed and unmanaged solution files can be analyzed. |
| `FilesToAnalyzeSasUri`<br/>SAS files to analyze | Required when `FileLocation` is set to `sasUriFile`. Enter the SAS URI. You can add more than one SAS URI through a comma (,) or semi-colon (;) separated list. |
| `FilesToAnalyze`<br/>Local files to analyze | Required when SAS files aren't analyzed. Specify the path and file name of the zip files to analyze. Wildcards can be used. For example, enter \*\*\\*.zip for all zip files in all subfolders. |
| `FilesToExclude`<br/>Local files to exclude | Specify the names of files to be excluded from the analysis. If more than one, provide through a comma (,) or semi-colon (;) separated list. This list can include a full file name or a name with leading or trailing wildcards, such as *jquery or form.js |
| `RulesToOverride`<br/>Rules to override | A JSON array containing rules and levels to override. Accepted values for OverrideLevel are: Critical, High, Medium, Low, Informational. Example: [{"Id":"meta-remove-dup-reg","OverrideLevel":"Medium"},{"Id":"il-avoid-specialized-update-ops","OverrideLevel":"Medium"}] |
| `RuleSet`<br/>Rule set | (Required) Specify which rule set to apply. The following two rule sets are available:<ul><li> Solution checker: This rule set is the same one that is run from the Power Apps [maker portal](https://make.powerapps.com).</li><li>AppSource: The extended rule set that is used to certify an application before it can be published to [AppSource](https://appsource.microsoft.com/).</li></ul>    |
| `ErrorLevel`<br/>Error Level | Combined with the error, threshold parameter defines the severity of errors and warnings that are allowed. Supported threshold values are \<level>IssueCount where level=Critical, High, Medium, Low, and Informational. |
| `ErrorThreshold`<br/>Error threshold | Defines the number of errors (>=0) of a specified level that are allowed for the checker to pass the solutions being checked. |
| `FailOnPowerAppsCheckerAnalysisError`<br/>Fail on error | When **true**, fail if the Power Apps Checker analysis is returned as Failed or FinishedWithErrors. |
| `ArtifactDestinationName`<br/>DevOps artifact name | Specify the Azure Artifacts name for the checker .sarif file. |

## Solution tasks

This set of tasks can automate solution actions. The environment tasks outlined later in this section that create, copy, or restore an environment overwrite the service connections with the newly created environments. These tasks make it possible to perform solution tasks against environments that are created on demand.

### Power Platform Import Solution

Imports a solution into a target environment.

#### YAML snippet (Import)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.import-solution.PowerPlatformImportSolution@2
  displayName: 'Power Platform Import Solution '
  inputs:
    PowerPlatformEnvironment: 'My service connection'
    SolutionInputFile: 'C:\Public\Contoso_sample_1_0_0_1_managed.zip'
    HoldingSolution: true
    OverwriteUnmanagedCustomizations: true
    SkipProductUpdateDependencies: true
    ConvertToManaged: true
```

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.import-solution.PowerPlatformImportSolution@2
  displayName: 'Power Platform Import Solution '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: 'Dataverse service connection '
    SolutionInputFile: 'C:\Public\Contoso_sample_1_0_0_1_managed.zip'
    AsyncOperation: true
    MaxAsyncWaitTime: 60
    PublishWorkflows: false
```

#### Parameters (Import)

| Parameters           | Description        |
|----------------------|--------------------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint that you want to import the solution into (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to import the solution into (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `SolutionInputFile`<br/>Solution input file | (Required) The path and file name of the solution .zip file to import into the target environment (for example, $(Build.ArtifactStagingDirectory)\$(SolutionName).zip). <p/>Note: Variables give you a convenient way to get key bits of data into various parts of your pipeline. See [Use predefined variables](/azure/devops/pipelines/build/variables) for a comprehensive list.  |
| `HoldingSolution`<br/>Import as a holding solution | An advance parameter (true\|false) used when a solution needs to be upgraded. This parameter hosts the solution in Dataverse but does not upgrade the solution until the Apply Solution Upgrade task is run. |
| `OverwriteUnmanagedCustomizations`<br/>Overwrite un-managed customizations | Specify whether to overwrite un-managed customizations (true\|false). |
| `SkipProductUpdateDependencies`<br/>Skip product update dependencies | Specify whether the enforcement of dependencies related to product updates should be skipped (true\|false). |
| `ConvertToManaged`<br/>Convert to managed | Specify whether to import as a managed solution (true\|false). |
| `AsyncOperation`<br/>Asynchronous import | If selected (**true**), the import operation will be performed asynchronously. This is recommended for larger solutions as this task will automatically timeout after 4 minutes otherwise. Selecting asynchronous will poll and wait until MaxAsyncWaitTime has been reached (true\|false). |
| `MaxAsyncWaitTime`<br/>Maximum wait time | Maximum wait time in minutes for the asynchronous operation; default is 60 min (1 hr), same as Azure DevOps default for tasks.|
| `PublishWorkflows`<br/>Activate processes after import | Specify whether any processes (workflows) in the solution should be activated after import (true\|false). |
| `UseDeploymentSettingsFile`<br/>Use deployment settings file | Connection references and environment variable values can be set using a [deployment settings](conn-ref-env-variables-build-tools.md#deployment-settings-file) file (true\|false). |
| `DeploymentSettingsFile`<br/>Deployment settings file | (Required when `UseDeploymentSettingsFile`=**true**) The path and file name of the deployment settings file. |

### Power Platform Add Solution Component

Adds a solution component to an unmanaged solution.

#### YAML snippet (Add)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.add-solution-component.PowerPlatformAddSolutionComponent@2
  displayName: 'Power Platform Add Solution Component '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: Build
    SolutionName: 'SampleSolution '
    Component: contact
    ComponentType: 1
    AddRequiredComponents: false
```

#### Parameters (Add)

| Parameters           | Description        |
|----------------------|--------------------------|
| `ComponentId`<br/>ID of the solution component | The schema name or ID of the component to add to the target solution. |
| `ComponentType`<br/>Power Platform environment URL | The value that represents the solution component that you are adding. See [Use predefined component types](/power-apps/developer/data-platform/reference/entities/solutioncomponent#componenttype-choicesoptions) for a comprehensive list of component values. |
| `SolutionUniqueName`<br/>Name of the solution | Unique name of the solution. |
| `AddRequiredComponents`<br/>Any components required from other solution dependent on the solution component | (Optional) Indicates whether other solution components that are required by the solution component that you are adding should also be added to the unmanaged solution.  |
| `Environment`<br/>Environment URL or ID | (Optional) Environment URL or ID of the target environment. |

### Power Platform Apply Solution Upgrade

Upgrades a solution that has been imported as a holding solution.

#### YAML snippet (Upgrade)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.apply-solution-upgrade.PowerPlatformApplySolutionUpgrade@2
  displayName: 'Power Platform Apply Solution Upgrade '
  inputs:
    PowerPlatformEnvironment: 'My service connection'
    SolutionName: 'Contoso_sample'
    AsyncOperation: false
```

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.apply-solution-upgrade.PowerPlatformApplySolutionUpgrade@2
  displayName: 'Power Platform Apply Solution Upgrade '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: 'Dataverse service connection '
    SolutionName: 'Contoso_sample'
    MaxAsyncWaitTime: 45
```

#### Parameters (Upgrade)

| Parameters           | Description        |
|----------------------|--------------------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint that you want to upgrade the solution into (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to upgrade the solution into (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `SolutionName`<br/>Solution name | (Required) The name of the solution to apply the upgrade. Always use the solution *Name* not its *Display Name*. |
| `AsyncOperation`<br/>Asynchronous upgrade | If selected (**true**), the upgrade operation will be performed as an asynchronous batch job. Selecting asynchronous will poll and wait until MaxAsyncWaitTime has been reached. |
| `MaxAsyncWaitTime`<br/>Maximum wait time | Maximum wait time in minutes for the asynchronous operation; default is 60 min (1 hr), same as Azure DevOps default for tasks.|
<!-- | Convert solution to managed| If selected, the import operation will convert the solution, if unmanaged, will be converted to managed| -->

> [!NOTE]
> Variables give you a convenient way to get key bits of data into various parts of your pipeline. See [Use predefined variables](/azure/devops/pipelines/build/variables) for a comprehensive list.
> You can pre-populate connection reference and environment variables information for the target environment while importing a solution using a deployment settings file.<p/>More information: [Pre-populate connection references and environment variables for automated deployments](conn-ref-env-variables-build-tools.md)

### Power Platform Export Solution

Exports a solution from a source environment.

#### YAML snippet (Export)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.export-solution.PowerPlatformExportSolution@2
  displayName: 'Power Platform Export Solution '
  inputs:
    PowerPlatformEnvironment: 'My service connection'
    SolutionName: 'Contoso_sample'
    SolutionOutputFile: 'C:\Public\Contoso_sample_1_0_0_1_managed.zip'
    Managed: true
    MaxAsyncWaitTime: 120
```

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.export-solution.PowerPlatformExportSolution@2
  displayName: 'Power Platform Export Solution '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: 'Dataverse service connection '
    SolutionName: 'Contoso_sample'
    SolutionOutputFile: 'C:\Public\Contoso_sample_1_0_0_1_managed.zip'
    Managed: true
    MaxAsyncWaitTime: 120
    ExportAutoNumberingSettings: true
    ExportCalendarSettings: true
    ExportCustomizationSettings: true
    ExportEmailTrackingSettings: true
    ExportGeneralSettings: true
    ExportIsvConfig: true
    ExportMarketingSettings: true
    ExportOutlookSynchronizationSettings: true
    ExportRelationshipRoles: true
    ExportSales: true
```

#### Parameters (Export)

| Parameters      | Description     |
|-----------------|---------------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint that you want to upgrade the solution into (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to upgrade the solution into (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `SolutionName`<br/>Solution name | (Required) The name of the solution to export. Always use the solution *Name* not its *Display Name*. |
| `SolutionOutputFile`<br/>Solution output file | (Required) The path and file name of the solution.zip file to export the source environment to (for example, $(Build.ArtifactStagingDirectory)\$(SolutionName).zip ). <p/>Note: Variables give you a convenient way to get key bits of data into various parts of your pipeline. See [Use predefined variables](/azure/devops/pipelines/build/variables) for a comprehensive list. |
| `AsyncOperation`<br/>Asynchronous export | If selected (**true**), the export operation will be performed as an asynchronous batch job. Selecting asynchronous will poll and wait until MaxAsyncWaitTime has been reached. |
| `MaxAsyncWaitTime`<br/>Maximum wait time | Maximum wait time in minutes for the asynchronous operation; default is 60 min (1 hr), same as Azure DevOps default for tasks.|
| `Managed`<br/>Export as managed | If selected (**true**), export the solution as a managed solution; otherwise export as an unmanaged solution. |
| `ExportAutoNumberingSettings`<br/>Export auto-numbering settings | Export auto-numbering settings (true\|false). |
| `ExportCalendarSettings`<br/>Export calendar settings |Export calendar settings (true\|false). |
| `ExportCustomizationSettings`<br/>Export customization settings | Export customization settings (true\|false). |
| `ExportEmailTrackingSettings`<br/>Export email tracking settings | Export email tracking settings (true\|false). |
| `ExportGeneralSettings`<br/>Export general settings | Export general settings (true\|false). |
| `ExportIsvConfig`<br/>Export ISV configuration | Export ISV configuration (true\|false). |
| `ExportMarketingSettings`<br/>Export marketing settings | Export marketing settings (true\|false). |
| `ExportOutlookSynchronizationSettings`<br/>Export Outlook sync settings | Export Outlook synchronization settings (true\|false). |
| `ExportRelationshipRoles`<br/>Export relationship roles | Export relationship roles (true\|false). |
| `ExportSales`<br/>Exports sales | Exports sales (true\|false). |

### Power Platform Unpack Solution

Takes a compressed solution file and decomposes it into multiple XML files so that these files can be more easily read and managed by a source control system.

#### YAML snippet (Unpack)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.unpack-solution.PowerPlatformUnpackSolution@2
  displayName: 'Power Platform Unpack Solution '
  inputs:
    SolutionInputFile: 'C:\Public\Contoso_sample_1_0_0_1_managed.zip'
    SolutionTargetFolder: 'C:\Public'
    SolutionType: Both
```

#### Parameters (Unpack)

| Parameters    | Description       |
|---------------|-------------------|
| `SolutionInputFile`<br/>Solution input file | (Required) The path and file name of the solution.zip file to unpack. |
| `SolutionTargetFolder`<br/>Target folder to unpack solution | (Required) The path and target folder you want to unpack the solution into. |
| `SolutionType`<br/>Type of solution | (Required) The type of solution you want to unpack. Options include: **Unmanaged** (recommended), **Managed**, and **Both**. |

### Power Platform Pack Solution

Packs a solution represented in source control into a solution.zip file that can be imported into another environment.

#### YAML snippet (Pack)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.pack-solution.PowerPlatformPackSolution@2
  displayName: 'Power Platform Pack Solution '
  inputs:
    SolutionSourceFolder: 'C:\Public'
    SolutionOutputFile: 'Contoso_sample_1_0_0_1_managed.zip'
    SolutionType: Managed
```

#### Parameters (Pack)

| Parameters       | Description     |
|------------------|-----------------|
| `SolutionOutputFile`<br/>Solution output file | (Required) The path and file name of the solution.zip file to pack the solution into. |
| `SolutionSourceFolder`<br/>Source folder of solution to pack | (Required) The path and source folder of the solution to pack. |
| `SolutionType`<br/>Type of solution | (Required) The type of solution you want to pack. Options include: **Managed** (recommended), **Unmanaged**, and **Both**. |

### Power Platform Delete Solution

Deletes a solution in the target environment.

#### YAML snippet (Delete)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.delete-solution.PowerPlatformDeleteSolution@2
  displayName: 'Power Platform Delete Solution '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: 'Dataverse service connection '
    SolutionName: 'Contoso_sample'
```

#### Parameters (Delete)

| Parameters       | Description     |
|------------------|-----------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint that you want to delete the solution (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to delete the solution (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `SolutionName`<br/>Solution name  | (Required) The name of the solution to delete. Always use the solution *Name* not its *Display Name*. |

### Power Platform Publish Customizations

Publishes all customizations in an environment.

#### YAML snippet (Publish)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.publish-customizations.PowerPlatformPublishCustomizations@2
  displayName: 'Power Platform Publish Customizations '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: 'Dataverse service connection '
```

#### Parameters (Publish)

| Parameters     | Description    |
|----------------|----------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint that you want to publish the customizations (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to publish the customizations (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |

### Power Platform Set Solution Version

Updates the version of a solution.

#### YAML snippet (Version)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.set-solution-version.PowerPlatformSetSolutionVersion@2
  displayName: 'Power Platform Set Solution Version '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: 'Dataverse service connection '
    SolutionName: 'Contoso_sample'
    SolutionVersionNumber: 1.0.0.0
```

#### Parameters (Version)

| Parameters    | Description   |
|---------------|---------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint that you want to set the solution version (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to set the solution version (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `SolutionName`<br/>Solution name  | (Required) The name of the solution to set the version for. Always use the solution *Name* not its *Display Name*. |
| `SolutionVersionNumber`<br/>Solution version number | (Required) Version number you want to set. |

While version number can be hardcoded in the pipeline, it is recommended to use an Azure DevOps pipeline variable like [BuildId](/azure/devops/pipelines/build/variables#build-variables).
This provides options to define the exact shape of version number under the "Options" tab, for example: $(Year:yyyy)-$(Month:MM)-$(Day:dd)-$(rev:rr)-3

This definition can then be used in the Set Solution Version task by setting the Version Number property with: $(Build.BuildId) instead of hard coding 20200824.0.0.2.

Alternatively a powershell inline task script $(Get-Date -Format yyyy.MM.dd.HHmm) output set to empty variable named SolutionVersion as Write-Host ("##vso[task.setvariable variable=SolutionVersion;]$version"), Set Solution Version as $(SolutionVersion).

### Power Platform Set Connection Variables

Sets BuildTools.* variables to provide custom script tasks access to use the service connection as a single source of truth.

#### YAML snippet (SetConnectionVariables)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.set-connection-variables.PowerPlatformSetConnectionVariables@2
  displayName: 'Power Platform Set Connection Variables '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: 'Dataverse service connection '
  timeoutInMinutes: 2
  retryCountOnTaskFailure: 5
```

#### Parameters (SetConnectionVariables)

| Parameters      | Description    |
|-----------------|----------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to set connection variables for. Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `timeoutInMinutes`<br/>Timeout | Specifies the maximum time, in minutes, that a task is allowed to execute before being canceled by server. A zero value indicates an infinite timeout.|
| `retryCountOnTaskFailure`<br/>Number of retries if task failed | Specifies the number of retries for this task that will happen in case of task failure. Not supported for agent-less tasks. |
| `ApplicationId`<br/>Application Id for login | (Required for username/password) Application Id to use for login (See additional note below). |
| `RedirectUri`<br/>Redirect URI of the specificed app | (Required for username/password) Redirect URI of the specified app. Needed when specifying an App Id. (See additional note below). |

> [!NOTE]
> When using the username/password authentication type, the Application Id and Redirect Uri will be required. This [authenticate oauth](/power-apps/developer/data-platform/authenticate-oauth) document has an explanation of why you need to create an app registration to authenticate with Dataverse.
> When you connect using username/password authentication, the connection behaves as an application which is connecting on behalf of a user to Dataverse.

### Power Platform Deploy Package

Deploys a package to an environment. Deploying a [package](/powerapps/developer/common-data-service/package-deployer/create-packages-package-deployer) as opposed to a single solution file provides an option to deploy multiple solutions, data, and code into an environment.

#### YAML snippet (Deploy)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.deploy-package.PowerPlatformDeployPackage@2
  displayName: 'Power Platform Deploy Package '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: 'Dataverse service connection '
    PackageFile: 'C:\Users\Public\package.dll'
    MaxAsyncWaitTime: 120
```

#### Parameters (Deploy)

| Parameters      | Description    |
|-----------------|----------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint that you want to deploy the package into (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to deploy the package into (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. More information: see `BuildTools.EnvironmentUrl` under [Power Platform Create Environment](#power-platform-create-environment) |
| `PackageFile`<br/>Package file | (Required) The path and file name of the package file assembly (.dll). |
| `MaxAsyncWaitTime`<br/>Maximum wait time | Maximum wait time in minutes for the asynchronous operation; default is 60 min (1 hr), same as Azure DevOps default for tasks.|

## Environment management tasks

Automate common Environment Lifecycle Management (ELM) tasks.

### Power Platform Create Environment

Creates a new environment. Creating a new environment also automatically creates `BuildTools.EnvironmentUrl`.

> [!IMPORTANT]
> When set, `BuildTools.EnvironmentUrl` will be used as the **default service connection** for subsequent tasks in the pipeline. Each task described in this article only uses the endpoint from the service connection when `BuildTools.EnvironmentUrl` is not set.<p/>
> A new environment can only be provisioned if your license or capacity
> allows for the creation of additional environments. For more information on how to view capacity see [Capacity page details](../admin/capacity-storage.md#capacity-page-details).

#### YAML snippet (Create-env)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.create-environment.PowerPlatformCreateEnvironment@2
  displayName: 'Power Platform Create Environment '
  inputs:
    PowerPlatformEnvironment: 'My service connection'
    DisplayName: 'First Coffee test'
    DomainName: firstcoffee
```

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.create-environment.PowerPlatformCreateEnvironment@2
  displayName: 'Power Platform Create Environment '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: 'Dataverse service connection '
    DisplayName: 'First Coffee prod'
    EnvironmentSku: Production
    AppsTemplate: 'D365_CustomerService,D365_FieldService'
    LocationName: canada
    LanguageName: 1036
    CurrencyName: ALL
    DomainName: firstcoffee
```

#### Parameters (Create-env)

| Parameters        | Description     |
|-------------------|-----------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint that you want to create the environment (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to create the environment (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `DisplayName`<br/>Display name | (Required) The display name of the environment created. |
| `LocationName`<br/>Deployment region | (Required) The region that the environment should be created in. |
| `EnvironmentSku`<br/>Environment type | (Required) The type of instance to deploy. Options are **Sandbox**, **Production**, **Trial**, and **SubscriptionBasedTrial**. |
| `AppsTemplate`<br/>Apps | For a non-trial environment type, the supported apps are D365_CustomerService, D365_FieldService, D365_ProjectServiceAutomation, and D365_Sales. |
| `CurrencyName`<br/>Currency | (Required) Base currency for the environment created. The currency cannot be updated after the environment is created. |
| `LanguageName`<br/>Language     | (Required) The base language in the environment. |
| `DomainName`<br/>Domain Name | (Required) This is the environment-specific string that forms part of the URL. For example, for an environment with the following URL: `https://powerappsbuildtasks.crm.dynamics.com/`, the domain name would be 'powerappsbuildtasks'. <p/>Note: If you enter a domain name that's already in use, the task appends a numeric value to the domain name, starting with 0. For the example above, the URL might become `https://powerappsbuildtasks0.crm.dynamics.com/`. |

### Power Platform Delete Environment

Deletes an environment.

#### YAML snippet (Delete-env)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.delete-environment.PowerPlatformDeleteEnvironment@2
  displayName: 'Power Platform Delete Environment '
  inputs:
    PowerPlatformEnvironment: 'My service connection'
```

#### Parameters (Delete-env)

| Parameters       | Description         |
|------------------|---------------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint that you want to delete the environment (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to delete the environment (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |

### Power Platform Assign User

Assign a user to a target environment with specified security role.

#### YAML snippet (AssignUser-env)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.assign-user.PowerPlatformAssignUser@2
  displayName: 'Power Platform Assign User '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: Build
    User: EnvironmentUsername
    Role: 'Environment Maker'
    ApplicationUser: true
```

#### Parameters (AssignUser-env)

| Parameters       | Description         |
|------------------|---------------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint for the environment that you want to assign the user to (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `User`<br/>Power Platform user name | Microsoft Entra object ID or user's principal name to assign to the target environment. |
| `Role`<br/>Security role name or ID | Security role name or ID to be assigned to the user. |
| `ApplicationUser`<br/>Power Platform application user name | Specifies whether the input user is an application user (true\|false). |

### Power Platform Reset Environment

Resets an environment.

#### YAML snippet (Reset-env)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.reset-environment.PowerPlatformResetEnvironment@2
  displayName: 'Power Platform Reset Environment '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: Build
    CurrencyName: ALL
    Purpose: 'Reset to PointInTime'
    AppsTemplate: 'D365_CustomerService,D365_FieldService'
```

#### Parameters (Reset-env)

| Parameters       | Description         |
|------------------|---------------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint that you want to reset the environment (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to reset the environment (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |

### Power Platform Backup Environment

Backs up an environment.

#### YAML snippet (Backup-env)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.backup-environment.PowerPlatformBackupEnvironment@2
  displayName: 'Power Platform Backup Environment '
  inputs:
    PowerPlatformEnvironment: 'My service connection'
    BackupLabel: 'Full backup - $(Build.BuildNumber)'
```

#### Parameters (Backup-env)

| Parameters   | Description   |
|--------------|---------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint that you want to back up the environment (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint that you want to back up the environment (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `BackupLabel`<br/>Backup label | (Required) The label to be assigned to the backup. |

### Power Platform Copy Environment

Copies an environment to a target environment. Two types of copies are available: full and minimal. A *Full* copy includes both data and solution metadata (customizations), whereas a *minimal* copy only includes solution
metadata and not the actual data.

#### YAML snippet (Copy-env)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.copy-environment.PowerPlatformCopyEnvironment@2
  displayName: 'Power Platform Copy Environment '
  inputs:
    PowerPlatformEnvironment: 'My service connection'
    TargetEnvironmentUrl: 'https://contoso-test.crm.dynamics.com'
```

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.copy-environment.PowerPlatformCopyEnvironment@2
  displayName: 'Power Platform Copy Environment '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: 'Dataverse service connection '
    TargetEnvironmentUrl: 'https://contoso-test.crm.dynamics.com'
    CopyType: MinimalCopy
    OverrideFriendlyName: true
    FriendlyName: 'Contoso Test'
    SkipAuditData: true
    MaxAsyncWaitTime: 60
```

#### Parameters (Copy-env)

| Parameters     | Description     |
|----------------|-----------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint for the source environment that you want to copy from (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint for the source environment that you want to copy from (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `TargetEnvironmentUrl`<br/>Target environment URL | (Required) The URL for the target environment that you want to copy to. |
| `CopyType`<br/>Copy type | The type of copy to perform: FullCopy or MinimalCopy |
| `OverrideFriendlyName`<br/>Override friendly name | Change the target environment's friendly name to another name (true\|false). |
| `FriendlyName`<br/>Friendly name | The friendly name of the target environment. |
| `SkipAuditData`<br/>SkipAuditData | Whether to skip audit data during copy operation. (true\|false). |
| `MaxAsyncWaitTime`<br/>Maximum wait time | Maximum wait time in minutes for the asynchronous operation; default is 60 min (1 hr), same as Azure DevOps default for tasks.|

### Power Platform Restore Environment

Restores an environment to a given backup.

#### YAML snippet (Restore-env)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.restore-environment.PowerPlatformRestoreEnvironment@2
  displayName: 'Power Platform Restore Environment '
  inputs:
    PowerPlatformEnvironment: 'My service connection'
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: Build
    TargetEnvironmentUrl: 'https://contoso-test.crm.dynamics.com'
    RestoreLatestBackup: false
    RestoreTimeStamp: '12/01/2022 09:00'
    FriendlyName: 'Contoso Test'
```

#### Parameters (Restore-env)

| Parameters     | Description     |
|----------------|-----------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformEnvironment`<br/>Power Platform environment URL | The service endpoint for the source environment that you want to restore from (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint for the source environment that you want to restore from (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `RestoreLatestBackup`<br/>Latest backup to restore | Whether to restore latest backup or provide RestoreTimeStamp (true\|false). |
| `RestoreTimeStamp`<br/>DateTime of the backup | DateTime of the backup in 'mm/dd/yyyy hh:mm' format OR string 'latest'. |
| `TargetEnvironmentUrl`<br/>Target environment URL | (Required) The URL for the target environment that you want to restore. |
| `FriendlyName`<br/>Name of the restored environment | (Optional) Name of the restored environment. |
| `DisableAdminMode`<br/>Disable admin mode | Whether to disable administration mode (true\|false). |

### Export Dataverse Data

Export data from an environment with the provided schema.

#### YAML snippet (exportdata-env)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.export-data.PowerPlatformExportData@2
  displayName: 'Power Platform Export Data '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: Build
    SchemaFile: 'C:\tempschema.xml'
    DataFile: exportdata.zip
    Overwrite: true
```

#### Parameters (exportdata-env)

| Parameters   | Description   |
|--------------|---------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint for the environment that you want to export data from (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `SchemaFile`<br/>Schema XML file name | Schema XML file name. It can be created using the Configuration Migration tool. |
| `DataFile`<br/>Data file name | File name for data to export (zip file). |
| `Overwrite`<br/>Content overwrite | Power Pages website content to overwrite (true\|false). |

### Import Dataverse Data

Import data to an environment.

#### YAML snippet (importdata-env)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.import-data.PowerPlatformImportData@2
  displayName: 'Power Platform Import Data '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: Build
    DataFile: 'C:\Data\Import.zip'
```

#### Parameters (importdata-env)

| Parameters   | Description   |
|--------------|---------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint for the environment that you want to import data (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `DataFile`<br/>Data file name | File name for compressed zip) data file to import, or the folder with data-schema.xml and data.xml to be imported. |

## Power Pages management tasks

Tasks for working with a Power Pages website.

### Power Platform Download PAPortal

Download Power Pages website content from the current Dataverse environment.

#### YAML snippet (download-paportal)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.download-paportal.PowerPlatformDownloadPaportal@2
  displayName: 'Power Platform Download PAPortal '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: Build
    DownloadPath: 'C:\portals'
    WebsiteId: 'f88b70cc-580b-4f1a-87c3-41debefeb902'
    Overwrite: true
```

#### Parameters (download-paportal)

| Parameters   | Description   |
|--------------|---------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint for the environment that you want to download content from (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `WebsiteId`<br/>Portal website ID | Power Pages website ID to download. |
| `Overwrite`<br/>Content overwrite | Power Pages website content to overwrite (true\|false). |
| `ModelVersion`<br/>Site Data Model |Indicates if the site data to be uploaded will use the standard (`1`) or [enhanced data model](/power-pages/admin/enhanced-data-model) (`2`). Default value is '1'.|

### Power Platform Upload PAPortal

Upload Power Pages website content to the current Dataverse environment.

#### YAML snippet (upload-paportal)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools.upload-paportal.PowerPlatformUploadPaportal@2
  displayName: 'Power Platform Upload PAPortal '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: Build
    UploadPath: 'C:\portals\starter-portal'
```

#### Parameters (upload-paportal)

| Parameters   | Description   |
|--------------|---------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint for the environment that you want upload content to (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `UploadPath`<br/>Upload content path | Path from where the Power Pages website content will be uploaded. |
| `ModelVersion`<br/>Site Data Model |Indicates if the site data to be uploaded will use the standard (`1`) or [enhanced data model](/power-pages/admin/enhanced-data-model) (`2`). Default value is '1'.|

## Catalog for Power Platform tasks (preview)

These tasks perform actions against the catalog in Power Platform and include the following.

> [!NOTE]
> Currently, catalog tasks for Power Platform are a **preview** release.

### Install catalog item

Install a catalog item to the target environment.

| Parameters   | Description   |
|--------------|---------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint for the environment that you want upload content to (for example, `https://powerappsbuildtools.crm.dynamics.com`). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `Environment`<br/>Target environment URL | (Required) Environment url this task targets. |
| `CatalogItemId`<br/>Catalog Item ID to be installed | (Required) Catalog item to be installed on the target environment. |
| `TargetEnvironmentUrl`<br/>Target environment URL | (Required) The Url of the target environment for catalog item installation into (for example, "<https://YourOrg.crm.dynamics.com>"). |
| `PollStatus`<br/>Check poll status | (Optional) Poll to check the status of your request (true\|false). |

### Parameters (catalog-install)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools-DEV.install-catalog.PowerPlatformInstallCatalog@2
  displayName: 'Power Platform Install Catalog '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: Build
    Environment: '$(BuildTools.EnvironmentUrl)'
    CatalogItemId: '00000000-0000-0000-0000-000000000001'
    TargetEnvironmentUrl: 'https://test.crm.dynamics.com/'
    PollStatus: true
```

### Submit Catalog approval

Submit catalog approval request.

| Parameters   | Description   |
|--------------|---------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint for the environment that you want upload content to (for example, "<https://powerappsbuildtools.crm.dynamics.com>"). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `Environment`<br/>Target environment URL | (Required) Environment url this task targets. |
| `CatalogSubmissionFile`<br/>Catalog submission file | (Required) Specify the path and file name of the catalog submission file. |
| `UsePackageSolutionZipFile`<br/>File type | File type: package or solution zip file. |
| `SolutionZipFile`<br/>Solution zip file name | Specify the path and file name of the solution zip file. |
| `PollStatus`<br/>Check poll status | (Optional) Poll to check the status of your request (true\|false). |

### Parameters (catalog-submit)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools-DEV.submit-catalog.PowerPlatformSubmitCatalog@2
  displayName: 'Power Platform Submit Catalog '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: Build
    Environment: '$(BuildTools.EnvironmentUrl)'
    CatalogSubmissionFile: submission.json
    UsePackageSolutionZipFile: true
    FileType: SolutionZipFile
    SolutionZipFile: solution.zip
    PollStatus: true
```

### Catalog request status

Get the status of the catalog install/submit request.

| Parameters   | Description   |
|--------------|---------------|
| `authenticationType`<br/>Type of authentication | (Required for SPN) Specify either **PowerPlatformEnvironment** for a username/password connection or **PowerPlatformSPN** for a Service Principal/client secret connection. |
| `PowerPlatformSPN`<br/>Power Platform Service Principal | The service endpoint for the environment that you want upload content to (for example, "<https://powerappsbuildtools.crm.dynamics.com>"). Defined under **Service Connections** in **Project Settings** using the **Power Platform** connection type. |
| `Environment`<br/>Target environment URL | (Required) Environment url this task targets. |
| `TrackingId`<br/>Request tracking ID | (Required) Request tracking ID. |
| `RequestType`<br/>Request type | (Required) Reqeust type. (Values: Install \| Submit). |

### Parameters (catalog-status)

```yml
steps:
- task: microsoft-IsvExpTools.PowerPlatform-BuildTools-DEV.catalog-status.PowerPlatforCatalogStatus@2
  displayName: 'Power Platform Catalog Status '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: Build
    Environment: '$(BuildTools.EnvironmentUrl)'
    TrackingId: '00000000-0000-0000-0000-000000000002'
    RequestType: Submit
```

## Build and release pipelines

Now that we've identified what can be done using the build tools, let's see
how you might apply these tools to your build and release pipelines. A
conceptual overview is shown below. Let's view some details of the pipeline implementation using the build tool tasks in the sub-sections that follow.

To learn more about creating these pipelines and actually do hands-on pipeline
authoring using the Microsoft Power Platform Build Tools, complete the [build tools labs](https://github.com/microsoft/PowerApps-Samples/tree/master/build-tools),
which you can download from GitHub.

More information about Azure Pipelines: [Use Azure Pipelines](/azure/devops/pipelines/get-started/pipelines-get-started)

<a name="build-pipeline-export-solution-from-development"></a>

### Build pipeline: Export a solution from a development environment (DEV)

The following figure shows the build tool tasks that you might add to a pipeline that exports a solution from a development environment.

![Export a solution from a development environment (DEV).](media/export-pipeline.png "Export a solution from a development environment (DEV)")

<a name="build-pipeline-build-managed-solution"></a>

### Build pipeline: Build a managed solution

The following figure shows the build tool tasks that you might add to a pipeline that builds a managed solution.

![Build a managed solution.](media/build-pipeline.png "Build a managed solution")

<a name="release-pipeline-deploy-to-production"></a>

### Release pipeline: Deploy to a production environment (PROD)

The following figure shows the build tool tasks that you might add to a pipeline that deploys to a production environment.

![Deploy to a production environment (PROD).](media/deploy-pipeline.png "Deploy to a production environment (PROD)")

### See Also

[Microsoft Power Platform Build Tools for Azure DevOps](devops-build-tools.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
