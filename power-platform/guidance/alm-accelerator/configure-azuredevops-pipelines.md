---
title: "Using and Configuring the ALM Accelerator Azure DevOps pipelines for Microsoft Power Platform | MicrosoftDocs"
description: "Customizing the ALM Accelerator for Power Platform can be achieved in several ways without affecting the upgrade path of the solution and Azure DevOps pipelines. This document describes how to customize ALM Accelerator Azure DevOps pipelines for Microsoft Power Platform."
author: mikefactorial
ms.topic: conceptual
ms.date: 04/10/2023
ms.subservice: guidance
ms.author: rusant
ms.reviewer: sericks
---

# Configuring the ALM Accelerator Azure DevOps pipelines

The ALM Accelerator pipelines are the engine of the ALM Accelerator and are used to automate the ALM process for Power Platform. The pipelines are built using Azure DevOps and are stored in a project in Azure DevOps. The ALM Accelerator solution includes a custom connector for the Azure DevOps API that can be used to invoke the pipelines via Flow or other Power Platform technologies. The key to using the pipelines independently is understanding the parameters that are passed to the various pipelines. There are four main pipelines that are used to automate the ALM process for the Power Platform:

- Import
- Export
- Delete  
- Build/Deploy

The pipelines are designed to be used used in conjunction with the ALM Accelerator canvas app. The ALM Accelerator canvas app provides a simple interface for invoking the pipelines and provides a way to configure the pipelines without having to understand the underlying parameters. The ALM Accelerator canvas app is not required to use the pipelines, but it is recommended.

## ALM Accelerator Azure DevOps pipelines

The ALM Accelerator pipelines and app have default configurations that allow you to get started quickly with ALM for Power Platform. The ALM Accelerator pipelines have been developed in a way that makes it possible for many different ALM scenarios to be covered, based on your organization's requirements. The following is a description of some common scenarios and how they can be covered through configuration of the pipelines, related deployment profiles, and steps in the ALM Accelerator app or through the pipeline directly.

### Installing the Azure DevOps pipelines in one project and source code in another project

From the ALM Accelerator app and in the **Deployment Profiles**, there's now an option to specify a pipeline project, in addition to source project. An option has also been added to the setup wizard to specify a separate pipeline project and repo. This is useful if you want to segment the storage of solutions within your organization based on users, corporate structure, or other factors. In most cases, the pipeline YAML files will be stored in the pipeline project while the export, import, and delete pipelines are created in the project where the solution is source controlled.

### Run the ALM Accelerator Azure DevOps pipelines without installing the ALM Accelerator canvas app and solution

The ALM Accelerator canvas app provides an easy button layer for running the ALM Accelerator pipelines. However, the pipelines themselves, are the engine of the ALM Accelerator and can be run independently of the app. If you want to use the pipelines independently, you can run the pipelines directly from the command line or build your own app to invoke the pipelines through the [Azure DevOps API](/rest/api/azure/devops).

Additionally, the ALM Accelerator solution includes a custom connector for the Azure DevOps API that can be used to invoke the pipelines via Flow or other Power Platform technologies. The key to using the pipelines independently is understanding the parameters that are passed to the various pipelines.

**Parameters for import-unmanaged-to-dev-environment** - The import solution pipeline is used to import an unmanaged solution from source control into a Dev environment. The parameters are as follows:

| Parameter                | Example                     | Description                                                      |
| ---------                | -------                     | -----------                                                      |
| Project                  | My Azure Devops Project     | The name of the project to import the solution into.              |
| Repo                     | My Azure Devops Repo        | The name of the repo to import the solution from.                 |
| SolutionName             | MySolutionName              | The name of the solution to import.                               |
| Email                    | me@example.com              | The email address of the user importing the solution.             |
| UserName                 | Last, First                 | The user name of the user importing the solution.                 |
| Branch                   | main                        | The branch to build the solution and import from.                 |
| ServiceConnectionName    | MyServiceConnection         | The name of the service connection to use for the import.         |
| ServiceConnectionUrl     | example.crm.dynamics.com    | The URL of the maker environment for the import.                  |
| EnvironmentName          | MyDevEnvironment            | Used to find the deployment settings in the deployment pipeline. This will be a folder name under the config directory in the solution source.  |

**Parameters for delete-unmanaged-solution-and-components** - The delete solution pipeline is used to delete an unmanaged solution and all its components from a Dev environment. The parameters are as follows:

| Parameter                | Example                     | Description                                                                      |
| ---------                | -------                     | -----------                                                                      |
| SolutionName             | MySolutionName              | The name of the solution to delete.                                               |
| ServiceConnectionName    | MyServiceConnection         | The name of the service connection to use for the solution to be deleted.         |
| ServiceConnectionUrl     | example.crm.dynamics.com    | The URL of the maker environment for the solution to be deleted.                  |

**Parameters for export-solution-to-git** - The export solution pipeline is used to export the solution to a GIT repository. The pipeline parameters are as follows:

| Parameter                | Example                     | Description                                                                      |
| ---------                | -------                     | -----------                                                                      |
| Project                  | My Azure Devops Project     | The name of the project to export the solution source code to.                                    |
| Repo                     | My Azure Devops Repo        | The name of the repo to export the solution source code to.                                       |
| SolutionName             | MySolutionName              | The name of the solution to export.                                                               |
| Email                    | me@example.com              | The email address of the user exporting the solution.                                             |
| UserName                 | Last, First                 | The user name of the user exporting the solution.                                                 |
| CommitMessage            | Fixes #1234 Bug             | A description of the changes to store on the commit in the repository.                            |
| Branch                   | main                        | Either the source branch from which to create a new branch or the existing branch to commit to.   |
| BranchToCreate           | feature-1234                | The unique name of a new branch to create based on the Branch parameter, if required.              |
| ServiceConnectionName    | MyServiceConnection         | The name of the service connection to use for the solution export.                                |
| ServiceConnectionUrl     | example.crm.dynamics.com    | The URL of the maker environment where the unmanaged solution to be exported exists.              |
| Data                     | [Deployment Settings JSON]  | A JSON string containing the deployment settings to use for the export and configuring deployment pipelines (read more [here](deployment-settings-payload.md)). |
| PortalSiteName           | MyPortalSite                | The name of the Power Pages website associated with the solution to be exported.                  |

### Customize versioning of solutions when exporting or deploying the solution using the ALM Accelerator pipelines

The ALM Accelerator pipelines allow you to customize the versioning of the solution when exporting or deploying the solution. The following is a description of the methods available that can be used to customize the versioning of the solution when exporting or deploying the solution. The default versioning method is to use the name specified in the [deployment pipeline YAML file](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/build-deploy-validation-SampleSolution.yml).

**Use Exported versioning**
There are scenarios where you may want to use the version number exported by the pipelines as the version number in all of the deployed environments. To achieve this, you can create a variable in your export pipeline or a global variable in the variable library for the ALM Accelerator with the name **UseSolutionVersionFromDataverse** and a value of **True**. This will ensure that the version number exported in your solution is preserved in downstream environments and will also be reflected in your source control when the solution source is committed.

**Use Custom versioning logic**
You can use ALM Accelerator hooks to set the version of the solution by adding your custom logic to the build-solution-pack-pre-hook.yml template to manipulate the Solution.xml directly or by using other tools like [pac solution version](/power-platform/developer/cli/reference/solution#pac-solution-version).

**Use Custom bring your own templates versioning**
The ability to bring your own templates for generating deployment pipelines provides flexibility when deployment pipelines are generated during the initial export of a solution. An example of using this technique would be to create a copy of one of the build-deploy-validation/test/prod-SampleSolution.yml and updating the build name from the default to a versioning strategy using [configure run or build numbers](/azure/devops/pipelines/process/run-number) as a reference.

```yml
build:
  - name: 1.0.$(Date:yyyyMMdd)$(Rev:.r)
    ...
```

Once you have your templates in place, you can update your Deployment Steps in your Deployment Profile to point to your newly created template by following the instructions below.

### Customize the number of deployment steps in your pipelines and the names of the target environments

Similar to the custom versioning mentioned above, the ability to bring your own templates for generating deployment pipelines provides flexibility when deployment pipelines are generated during the initial export of a solution. Bringing your own templates supports the ability to specify the project in which your templates exist, and the path to the template to use to generate the deployment pipeline(s). The setting for the project and path lives on the Deployment Profile and Deployment Steps table in the ALM Accelerator Administration app. The path to the template is relative to the root of the location of the export pipeline. For example, the path to the default validation environment deployment pipeline templates is /Pipelines/build-deploy-validation-SampleSolution.yml. If you wanted to use a template in the same project as the export pipeline, you would specify the path as /Pipelines/build-deploy-validation-MyCustomTemplate.yml. The templates contain placeholders for the following solution-specific values that are replaced when the deployment pipeline is generated.

| Placeholder                           | Description                                                                              |
| ---------                             | -----------                                                                              |
| SampleSolutionName                    | The name of the solution to deploy.                                                       |
| RepositoryContainingTheBuildTemplates | The repository containing the build templates to use for the deployment pipeline.         |
| BranchContainingTheBuildTemplates     | The branch containing the build templates to use for the deployment pipeline.             |
| alm-accelerator-variable-group        | The global variable group the build templates will use for the deployment pipeline.       |

It's recommended that you copy one of the existing build-deploy-validation/test/prod-SampleSolution.yml pipeline templates to get started with your own, custom template. Once you have your templates in place, you can update your Deployment Steps in your Deployment Profile to point to your newly, created template.

### Execute custom steps in my export/import/delete and deploy pipelines without modifying the templates provided by the ALM Accelerator Team

The ALM Accelerator for Power Platform pipeline templates has several extension points that you can use to customize the pipelines. Using these extension points, or hooks, allows you to customize the pipelines while minimizing the noise from merge conflicts in upgrade scenarios. Learn more: [ALM Accelerator hooks](setup-hook-extensions.md)

### Toggle on/off specific actions in the pipelines

There are several places in the pipelines where pipeline variables are used to dictate whether or not a task should be executed or which specific task should be executed. The following variables can be set either on an individual pipeline or through the alm-accelerator-variable-group to apply to all pipelines.

> [!NOTE]
> If you want to set these variables for specific solutions on export, you can create a specific export pipeline based on the export pipeline template using the naming convention export-solution-to-git-SolutionName. The ALM Accelerator app will use this export pipeline for your specific solution, rather than the general purpose export-solution-to-git pipeline.

| Variable                             | Default                     | Pipeline(s) | Description |
| ---------                            | -------                     | ----------- | ----------- |
| GenerateDeploymentSettings           | True                        | Export | If false, the deployment settings won't be generated and stored in source control. |
| UseDeploymentSettingsPlaceholders    | True                        | Export | If false, the deployment settings won't use placeholders and all values for the deployment settings will be saved in the deploymentSettings.json and customDeploymentSettings.json files.<br><br>**IMPORTANT**: Sensitive information may be saved in plain text in your deployment settings. Any users with access to source control will be able to read these values. Take care when settings this variable. |
| DisableFlows                         | False                       | Export | If true, all flows will be turned off in the unpacked, source code before committing. |
| UseSolutionVersionFromDataverse      | False                       | Export | If true, the version number exported in your solution will be preserved in downstream environments. The version number will also be reflected in your source control when the solution source is committed. |
| DoNotExportCurrentEnvironmentVariableValues | False                | Export | If true, the variable values for the current environment will be removed from the source code for  the unpacked solution. |
| PublishCustomizationsBeforeExport     | True                       | Export | If false, the customizations won't be published before the solution is exported. This is useful if you're working in a shared environment and only want to export the latest, published customizations. |
| CacheEnabled                          | True                       | Export / Deploy | If false, the caching of powershell modules will be disabled. This is useful if you're pipelines execute clean-up of the cache directory after execution of the pipelines. |
| ProcessCanvasApps                     | True                       | Export / Deploy | If false, the canvas apps won't be unpacked during export or packed during builds. The [canvas unpack and pack functionality is currently in preview](https://aka.ms/paccanvas). It's not recommended for use in production environments at this time. However, you won't be able to view canvas source code in source control unless you set this variable to true. |
| DisableSolutionChecker                | False                       | Deploy | By default, solution checker will run on every build that is initiated through a pull Request. You can disable solution checker from running using this variable either on an individual pipeline or for all pipelines by adding this variable to the global variable group. |

## Next steps

> [!div class="nextstepaction"]
> [Set up pipeline sync](./setup-pipeline-sync.md)
[!INCLUDE[footer-include](../../includes/footer-banner.md)]
