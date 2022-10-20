---
title: "Using and Configuring the ALM accelerator pipelines for Microsoft Power Platform | MicrosoftDocs"
description: "Customizing the ALM Accelerator for Power Platform can be achieved in several ways without affecting the upgrade path of the solution and pipelines. This document describes how to customize Accelerator pipelines for Microsoft Power Platform."
author: mikefactorial
manager: devkeydet

ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/14/2021
ms.subservice: guidance
ms.author: rusant
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---

# ALM accelerator for Microsoft Power Platform pipelines (preview)

> [!NOTE]
> The ALM accelerator for Microsoft Power Platform is currently in public preview. Go to [our GitHub repo](https://github.com/microsoft/coe-starter-kit/CenterofExcellenceALMAccelerator/PREVIEW.md) to see the items to be completed prior to general availability.

The application lifecycle management (ALM) accelerator components enable makers to apply source-control strategies with Azure DevOps, and use automated builds and deployment of solutions to their environments without the need for manual intervention by the maker, administrator, developer, or tester. In addition, the ALM accelerator helps makers work without intimate knowledge of downstream technologies and switch quickly from developing solutions to source-controlling the solution and, ultimately, pushing their apps to other environments with as few interruptions to their work as possible.

The ALM accelerator doesn't have a dependency on other components of the CoE Starter Kit. It can be used independently.

## ALM Accelerator for Power Platform Pipelines

While the ALM Accelerator pipelines and app have default configurations that allow you to get started quickly with ALM for the Power Platform. The ALM Accelerator Pipelines have been developed in a way that makes it possible for many different ALM scenarios to be covered based on your organizations’ requirements. The following is a description of some common scenarios and how they can be covered through configuration of the pipelines and the related deployment profiles and steps in the ALM Accelerator App or via the pipeline directly.

### Installing the pipelines in one project and source code in another project

From the ALM Accelerator App and in the Deployment Profiles there's now an option to specify a pipeline project in addition to source project. An option has also been added to the coe-cli to specify a separate pipeline project and repo. This is useful if you want to segment the storage of solutions within your organization based on users, corporate structure, or other factors. The pipelines will be stored in the pipeline project along with the export, import and delete pipelines themselves, while the solution source code will be stored in the source project along with the deployment pipelines.

### Run the ALM Accelerator pipelines without installing the ALM Accelerator Canvas App and solution

The ALM Accelerator Canvas App provides an easy button layer for running the ALM Accelerator pipelines. However, the Pipelines themselves, are the engine of the ALM Accelerator and can be run independent of the App. If you want to use the pipelines independently, you can run the pipelines directly from the command line or build your own app to invoke the pipelines via the [Azure DevOps API](/rest/api/azure/devops). Additionally, the ALM Accelerator solution includes a custom connector for the Azure DevOps API that can be used to invoke the pipelines via Flow or other Power Platform technologies. The key to using the pipelines independently is understanding the parameters that are passed to the various pipelines.

**Parameters for import-unmanaged-to-dev-environment** - The import solution pipeline is used to import an unmanaged solution from source control into a Dev environment. The parameters are as follows:

| Parameter                | Example                     | Description                                                      |
| ---------                | -------                     | -----------                                                      |
| Project                  | My Azure Devops Project     | The name of the project to import the solution into              |
| Repo                     | My Azure Devops Repo        | The name of the repo to import the solution from                 |
| SolutionName             | MySolutionName              | The name of the solution to import                               |
| Email                    | me@example.com              | The email address of the user importing the solution             |
| UserName                 | Last, First                 | The user name of the user importing the solution                 |
| Branch                   | main                        | The branch to build the solution and import from                 |
| ServiceConnectionName    | MyServiceConnection         | The name of the service connection to use for the import         |
| ServiceConnectionUrl     | example.crm.dynamics.com    | The url of the maker environment for the import                  |
| EnvironmentName          | MyDevEnvironment            | Used to find the deployment settings in the deployment pipeline. This will be a folder name under the config directory in the solution source  |

**Parameters for delete-unmanaged-solution-and-components** - The delete solution pipeline is used to delete an unmanaged solution and all its components from a Dev environment. The parameters are as follows:

| Parameter                | Example                     | Description                                                                      |
| ---------                | -------                     | -----------                                                                      |
| SolutionName             | MySolutionName              | The name of the solution to delete                                               |
| ServiceConnectionName    | MyServiceConnection         | The name of the service connection to use for the solution to be deleted         |
| ServiceConnectionUrl     | example.crm.dynamics.com    | The url of the maker environment for the solution to be deleted                  |

**Parameters for export-solution-to-git** - The export solution pipeline is used to export the solution to a git repository. The pipeline parameters are as follows:

| Parameter                | Example                     | Description                                                                      |
| ---------                | -------                     | -----------                                                                      |
| Project                  | My Azure Devops Project     | The name of the project to export the solution source code to                                    |
| Repo                     | My Azure Devops Repo        | The name of the repo to export the solution source code to                                       |
| SolutionName             | MySolutionName              | The name of the solution to export                                                               |
| Email                    | me@example.com              | The email address of the user exporting the solution                                             |
| UserName                 | Last, First                 | The user name of the user exporting the solution                                                 |
| CommitMessage            | Fixes #1234 Bug             | A description of the changes to store on the commit in the repository                            |
| Branch                   | main                        | Either the source branch from which to create a new branch or the existing branch to commit to   |
| BranchToCreate           | feature-1234                | The unique name of a new branch to create based on the Branch parameter if required              |
| ServiceConnectionName    | MyServiceConnection         | The name of the service connection to use for the solution export                                |
| ServiceConnectionUrl     | example.crm.dynamics.com    | The url of the maker environment where the unmanaged solution to be exported exists              |
| Data                     | [Deployment Settings JSON]  | A JSON string containing the deployment settings to use for the export and configuring deployment pipelines (read more [here](almaccelerator-deployment-settings.md)) |
| PortalSiteName           | MyPortalSite                | The name of the Power Pages website associated with the solution to be exported                  |

### Customize versioning of solutions when exporting / deploying the solution using the ALM Accelerator pipelines

The ALM Accelerator pipelines allow you to customize the versioning of the solution when exporting / deploying the solution. The following is a description of the methods available that can be used to customize the versioning of the solution when exporting / deploying the solution. The default versioning method is to use the name specified in the [deployment pipeline YAML file](https://github.com/microsoft/coe-alm-accelerator-templates/blob/f783a0e967233cd690b5428e1864e957ddff7860/Pipelines/build-deploy-validation-SampleSolution.yml#L20)

**Use Exported versioning**
There are scenarios where you may want to use the version number exported by the pipelines as the version number in all of the deployed environments. To achieve this you can create a variable in your export pipeline or a global variable in the variable library for the ALM Accelerator with the name UseSolutionVersionFromDataverse and a value of true. This will ensure that the version number exported in your solution is preserved in downstream environments and will also be reflected in your source control when the solution source is committed.

**Use Custom versioning logic**
You can use ALM Accelerator hooks to set the version of the solution by adding your custom logic to the build-solution-pack-pre-hook.yml template to manipulate the Solution.xml directly or by using other tools like [pac solution version](/power-platform/developer/cli/reference/solution#pac-solution-version)

**Use Custom bring your own templates versioning**
The ability to bring your own templates for generating deployment pipelines provides flexibility when deployment pipelines are generated during the initial export of a solution. An example of using this technique would be to create a copy of one of the build-deploy-validation/test/prod-SampleSolution.yml and updating the build name from the default

```yml
build:
  - name: 1.0.$(Date:yyyyMMdd)$(Rev:.r)
    ...
```

to a versioning strategy using [configure run or build numbers](/azure/devops/pipelines/process/run-number) as a reference. Once you have your template(s) in place, you can update your Deployment Steps in your Deployment Profile to point to your newly created template by following the instructions below.

### Customize the number of deployment steps in your pipelines and the names of the target environments

Similar to custom versioning above, the ability to bring your own templates for generating deployment pipelines provides flexibility when deployment pipelines are generated during the initial export of a solution. Bring your own templates supports the ability to specify the project in which your templates exist and the path to the template to use to generate the deployment pipeline(s). The setting for the project and path lives on the Deployment Profile and Deployment Steps table in the ALM Accelerator Administration app. The path to the template is relative to the root of the location of the export pipeline. For example, the path to the default validation environment deployment pipeline templates is /Pipelines/build-deploy-validation-SampleSolution.yml. If you wanted to use a template in the same project as the export pipeline, you would specify the path as /Pipelines/build-deploy-validation-MyCustomTemplate.yml. The templates contain placeholders for the following solution specific values that are replaced when the deployment pipeline is generated:

| Placeholder                           | Description                                                                      |
| ---------                             | -----------                                                                      |
| SampleSolutionName                    | The name of the solution to deploy                                               |
| RepositoryContainingTheBuildTemplates | The repository containing the build templates to use for the deployment pipeline |
| BranchContainingTheBuildTemplates     | The branch containing the build templates to use for the deployment pipeline     |

It's recommended that you copy one of the existing build-deploy-validation/test/prod-SampleSolution.yml pipeline templates to get started with your own custom template. Once you have your template(s) in place, you can update your Deployment Steps in your Deployment Profile to point to your newly created template.

### Execute custom steps in my export / import / delete and deploy pipelines without modifying the templates provided by the ALM Accelerator Team

The ALM Accelerator for Power Platform pipeline templates has several extension points that you can use to customize the pipelines. Using these extension points, or hooks, allow you to customize the pipelines while minimizing the noise from merge conflicts in upgrade scenarios. Learn more: [ALM Accelerator hooks](/power-platform/guidance/coe/setup-almacceleratorforpowerplatform-hook-extensions)

### Toggle on/off specific actions in the pipelines

There are several places in the pipelines where pipeline variables are used to dictate whether or not a task should be executed or which specific task should be executed. The following are a list of variables that can be set either on an individual pipeline or via the alm-accelerator-variable-group to apply to all pipelines. NOTE: That if you want to set these variables for specific solutions on export you can create a specific export pipeline based on the export pipeline template using the naming convention export-solution-to-git-SolutionName. The ALM Accelerator app will use this export pipeline for your specific solution rather than the general purpose export-solution-to-git pipeline.

| Variable                             | Default                     | Description                                                                      |
| ---------                            | -------                     | -----------                                                                      |
| GenerateDeploymentSettings           | true                        | If false then the deployment settings won't be generated and stored in source control. |
| UseDeploymentSettingsPlaceholders    | true                        | If false then the deployment settings won't use placeholders and all values for the deployment settings will be saved in the deploymentSettings.json and customDeploymentSettings.json. IMPORTANT: Sensitive information may be saved in plain text in your deployment settings and any users with access to source control will be able to read these values. Take care when settings this variable. |
| DisableFlows                         | false                       | If true then all flows will be turned off in the unpacked solution source code before committing. |
| UseSolutionVersionFromDataverse      | false                       | If true then the version number exported in your solution will be preserved in downstream environments and will also be reflected in your source control when the solution source is committed. |
| DoNotExportCurrentEnvironmentVariableValues | false                     | If true then the current environment variable values be removed from the unpacked solution source code. |
| PublishCustomizationsBeforeExport | true                     | If false then the customizations won't be published before the solution is exported. This is useful if you're working in a shared environment and only want to export the latest published customizations. |
