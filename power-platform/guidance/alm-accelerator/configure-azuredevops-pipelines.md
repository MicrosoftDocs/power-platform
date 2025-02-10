---
title: Configure ALM Accelerator pipelines
description: Learn how to customize Azure Pipelines in ALM Accelerator for Power Platform.
ms.topic: how-to
ms.date: 09/05/2023
ms.subservice: guidance-toolkit
author: mikefactorial
ms.author: rusant
ms.reviewer: sericks
ms.custom: bap-template
contributors:
- RajeevPentyala
  
---

# Configure ALM Accelerator pipelines

Pipelines are the engines of the ALM Accelerator. They automate the ALM process for Power Platform. They're built using Azure Pipelines, a service of Azure DevOps, and stored in an Azure DevOps project.

Four main pipelines are used to automate the ALM process:

- Import
- Export
- Delete  
- Build/Deploy

The pipelines are designed for use with the ALM Accelerator canvas app. You don't need to use the app, but we recommend it. The app provides a simple interface for invoking the pipelines and a way to configure them without having to understand the [underlying parameters](#pipeline-parameters).

## Common ALM Accelerator pipeline scenarios

The ALM Accelerator pipelines and app have default configurations that allow you to get started quickly with ALM for Power Platform. The pipelines can cover many different ALM scenarios to meet your organization's requirements. The following sections describe some common scenarios and how they can be covered through pipeline configuration, deployment profiles, and steps in the ALM Accelerator app or through the pipeline directly.

### Install the pipelines in one project and the source code in another project

In the ALM Accelerator app and in deployment profiles, you can specify a pipeline project and a source project. An option in the setup wizard allows you to specify a separate pipeline project and repo. These options are useful if you want to segment the storage of solutions based on users, corporate structure, or other factors. In most cases, the pipeline YAML files are stored in the pipeline project and the export, import, and delete pipelines are created in the project where the solution is source-controlled.

### Run the pipelines without the ALM Accelerator

The ALM Accelerator canvas app provides an easy button layer for running the pipelines. However, you don't need the app to run them. If you want to use the pipelines independent of the app, run them directly from the command line. You can also build your own app. Use a custom connector for the [Azure DevOps API](/rest/api/azure/devops), included in the ALM Accelerator solution, to invoke the pipelines using Power Automate or other Power Platform technologies.

 In either case, if you want to use the pipelines independently, the key is to understand the parameters that are passed to them.

#### Pipeline parameters

**Parameters for import-unmanaged-to-dev-environment:** Use the import solution pipeline to import an unmanaged solution from source control into a development environment.

The following table describes the import pipeline's parameters.

| Parameter | Example | Description |
| --------- | ------- | ----------- |
| Project | My Azure DevOps Project | The name of the project to import the solution into |
| Repo | My Azure DevOps Repo | The name of the repo to import the solution from |
| SolutionName | MySolutionName | The name of the solution to import |
| Email | me@example.com | The email address of the user importing the solution |
| UserName | Last, First | The user name of the user importing the solution |
| Branch | main | The branch to build the solution and import from |
| ServiceConnectionName | MyServiceConnection | The name of the service connection to use for the import |
| ServiceConnectionUrl | example.crm.dynamics.com | The URL of the maker environment for the import |
| EnvironmentName | MyDevEnvironment | Used to find the deployment settings in the deployment pipeline; returns a folder name under the config directory in the solution source |

**Parameters for delete-unmanaged-solution-and-components:** Use the delete solution pipeline to delete an unmanaged solution and all its components from a development environment.

The following table describes the delete pipeline's parameters.

| Parameter | Example | Description |
| --------- | ------- | ----------- |
| SolutionName | MySolutionName | The name of the solution to delete |
| ServiceConnectionName | MyServiceConnection | The name of the service connection to use for the solution to be deleted |
| ServiceConnectionUrl | example.crm.dynamics.com | The URL of the maker environment for the solution to be deleted |

**Parameters for export-solution-to-git:** Use the export solution pipeline to export the solution to a Git repository.

The following table describes the export pipeline's parameters.

| Parameter | Example | Description |
| --------- | ------- | ----------- |
| Project | My Azure DevOps Project | The name of the project to export the solution source code to |
| Repo | My Azure DevOps Repo | The name of the repo to export the solution source code to |
| SolutionName | MySolutionName | The name of the solution to export |
| Email | me@example.com | The email address of the user exporting the solution |
| UserName | Last, First | The user name of the user exporting the solution |
| CommitMessage | Fixes #1234 Bug | A description of the changes to store on the commit in the repository |
| Branch | main | Either the source branch to create a branch from or the existing branch to commit to |
| BranchToCreate | feature-1234 | The unique name of a new branch to create based on the `Branch` parameter, if necessary |
| ServiceConnectionName | MyServiceConnection | The name of the service connection to use for the solution export |
| ServiceConnectionUrl | example.crm.dynamics.com | The URL of the maker environment where the unmanaged solution to be exported exists |
| Data | [Deployment Settings JSON] | A JSON string containing the [deployment settings](deployment-settings-payload.md) to use for the export and configuring deployment pipelines |
| PortalSiteName | MyPortalSite | The name of the Power Pages website associated with the solution to be exported |

### Customize versioning of solutions when you use the ALM Accelerator pipelines to export or deploy them

By default, exported and deployed solutions are versioned using the name specified in the [deployment pipeline YAML file](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-validation-SampleSolution.yml). However, the ALM Accelerator pipelines allow you to customize the versioning of a solution when you export or deploy it. The following sections describe the methods you can use.

#### Exported versioning

Use the version number exported by the pipelines as the version number in all deployed environments. Create a variable named **UseSolutionVersionFromDataverse** in your export pipeline or a global variable in the variable library for the ALM Accelerator. Give it a value of **True**. The variable ensures that the version number exported in your solution is preserved in downstream environments and is reflected in your source control when the solution source is committed.

#### Custom versioning logic

Use ALM Accelerator hooks to set the version of the solution. Add your custom logic to the `build-solution-pack-pre-hook.yml` template to manipulate the `Solution.xml` directly or by using other tools like [**pac solution version**](/power-platform/developer/cli/reference/solution#pac-solution-version).

#### Custom bring-your-own-templates versioning

The ability to bring your own templates for generating deployment pipelines provides flexibility for versioning during the initial export of a solution. As an example, create a copy of a `build-deploy-validation/test/prod-SampleSolution.yml` and change the build name from the default to a versioning strategy based on [configure run or build numbers](/azure/devops/pipelines/process/run-number):

```yml
build:
  - name: 1.0.$(Date:yyyyMMdd)$(Rev:.r)
    ...
```

After you have your templates in place, [update the deployment steps](#customize-the-number-of-deployment-steps-in-your-pipelines-and-the-names-of-the-target-environments) in your deployment profile to point to them.

### Customize the number of deployment steps in your pipelines and the names of the target environments

Similar to [custom versioning with templates](#custom-bring-your-own-templates-versioning), the ability to bring your own templates for generating deployment pipelines provides more flexibility during the initial export of a solution. Specify the project in which your templates exist and the path to the template to use to generate the deployment pipeline. The settings for the project and path are in the deployment profile and the Deployment Steps table in the ALM Accelerator administration app.

The path to the template is relative to the root of the location of the export pipeline. For example, the path to the default validation environment deployment pipeline templates is `/Pipelines/build-deploy-validation-SampleSolution.yml`. To use a template in the same project as the export pipeline, specify the path as `/Pipelines/build-deploy-validation-MyCustomTemplate.yml`.

The following table describes placeholders in the templates for solution-specific values that are replaced when the deployment pipeline is generated.

| Placeholder | Description |
| --------- | ----------- |
| SampleSolutionName | The name of the solution to deploy |
| RepositoryContainingTheBuildTemplates | The repository containing the build templates to use for the deployment pipeline |
| BranchContainingTheBuildTemplates | The branch containing the build templates to use for the deployment pipeline |
| alm-accelerator-variable-group | The global variable group the build templates use for the deployment pipeline |

We recommend you copy a `build-deploy-validation/test/prod-SampleSolution.yml` pipeline template to get started with your own custom template.

### Execute custom steps in your pipelines without modifying the default templates

The ALM Accelerator pipeline templates have several extension points, or hooks, that you can use to customize the pipelines while minimizing the noise from merge conflicts in upgrade scenarios. [Learn more about ALM Accelerator hooks](setup-hook-extensions.md).

### Turn on or off specific actions in the pipelines

The pipelines use variables to determine whether or not a task should execute or which task of several possibilities should execute. The following table describes the variables you can set for an individual pipeline or, through the alm-accelerator-variable-group, all pipelines.

> [!NOTE]
> To set these variables for specific solutions on export, create a specific export pipeline based on the export pipeline template. Name it `export-solution-to-git-{SolutionName}`. The ALM Accelerator app uses this export pipeline for the solution rather than the general-purpose export-solution-to-git pipeline.

| Variable | Default | Pipeline(s) | Description |
| --------- | ------- | ---------- | ----------- |
| GenerateDeploymentSettings | True | Export | If false, the deployment settings aren't generated and stored in source control. |
| UseDeploymentSettingsPlaceholders | True | Export | If false, the deployment settings don't use placeholders, and all values for the deployment settings are saved in the `deploymentSettings.json` and `customDeploymentSettings.json` files.<br/>**IMPORTANT**: Sensitive information may be saved in plain text in your deployment settings. Any users with access to source control can read these values. Take care if you set a value for this variable. |
| DisableFlows | False | Export | If true, all flows are turned off in the unpacked source code before committing. |
| UseSolutionVersionFromDataverse | False | Export | If true, the version number exported in your solution is preserved in downstream environments. The version number is reflected in your source control when the solution source is committed. |
| DoNotExportCurrentEnvironmentVariableValues | False | Export | If true, the variable values for the current environment are removed from the source code for the unpacked solution. |
| PublishCustomizationsBeforeExport | True | Export | If false, the customizations aren't published before the solution is exported. This option is useful if you're working in a shared environment and only want to export the latest published customizations. |
| CacheEnabled | True | Export/Deploy | If false, the caching of PowerShell modules is disabled. This option is useful if your pipelines execute clean-up of the cache directory after the pipelines execute. |
| ProcessCanvasApps | True | Export/Deploy | If false, the canvas apps aren't unpacked during export or packed during builds.<br/>**NOTE**: The [canvas unpack and pack functionality is currently in preview](https://aka.ms/paccanvas). It's not recommended for use in production environments at this time. However, you can't view canvas source code in source control unless you set this variable to True. |
| DisableSolutionChecker | False | Deploy | If true, solution checker doesn't run on every build that's initiated through a pull request. |
| SkipSolutionImport | False | Deploy | If true, the solution import step is skipped during deployment. However, other activities such as flow activations and sharing are still be performed. |

## Next steps

> [!div class="nextstepaction"]
> [Set up pipeline sync](./setup-pipeline-sync.md)

[!INCLUDE [footer-include](../../includes/footer-banner.md)]
