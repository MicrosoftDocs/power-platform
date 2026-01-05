---
title: "Execute unit tests in Azure Pipelines"
description: Learn how to set up a unit test for execution using Azure Pipelines.
author: pvillads
ms.date: 06/07/2024
ms.topic: how-to
ms.reviewer: pehecke
ms.author: pvillads
ms.subservice: developer
ms.custom: sfi-image-nochange
---

# Execute unit tests in Azure Pipelines

An Azure Pipeline build task is available that lets users execute unit tests on connected cloud runtime environments using a continuous integration/continuous delivery (CI/CD) pipeline. The "Execute Unit Tests in Unified Environment" task is included in the [Dynamics 365 Finance and Operations Tools](https://marketplace.visualstudio.com/items?itemName=Dyn365FinOps.dynamics365-finops-tools) extension.

More information: [Continuous integration and deployment](finance-operations-pipelines.md), [Build automation that uses Microsoft-hosted agents and Azure Pipelines](/dynamics365/fin-ops-core/dev-itpro/dev-tools/hosted-build-automation)

## Prerequisites

To be successful in using this unit test capability, you must have:

- Working knowledge of building and deploying X++ code using Azure Pipelines. For more information, see the linked articles provided in the [See also](#see-also) section.
- Understanding of X++ unit test execution and general development.
- Availability of this unit test execution capability in your organization.

## Add a unit test task to a pipeline

Adding the ability to execute unit tests requires a build pipeline that can build and deploy a solution to the unified developer experience environment. The tests are obtained from the test models included in the repository, based on the assembly output of the Build Solution pipeline task. The same tests must be pre-deployed on the unified developer experience environment for the test execution to be possible. This deployment can be accomplished in the same run of the pipeline or separately.

The deployment task is only required if there are any changes of the test cases that aren't deployed on the environment. However, the build task is necessary to identify which tests must be run.
This unit test task must be included after the optional build and deploy tasks.

In this next figure, the "Execute Unit Tests in Unified Environment" task is included in en example build pipeline.

:::image type="content" source="..\media\unified-experience\devexp-unitTest-pipeline.png" alt-text="Build and deploy pipeline containing a unit test task.":::

The output logs of the task contains information of each test executed and its output. The task fails if any of the tests that are run fail.

### Creating the unit test task

> [!IMPORTANT]
>
> - A new version (1.*) of the task has been released. See [Update: Version 1](#update-version-1) for more information.

In this next image is an example unit test being defined. A description of each form field follows.

:::image type="content" source="..\media\unified-experience\devexp-unitTest-task.png" alt-text="Unit test task form with example data.":::

| Form field | Description |
|--|--|
| Display name | The name of the test execution task. |
| Service connection | Service connection to the unified developer experience environment on which the deployment has been made. |
| Package Platform Version<p/>Package Application Version | Versions of the deployed package and connected environment. |
| Platform Package Path | The location of the Microsoft.Dynamics.AX.Platform.DevALM.BuildXpp NuGet package installed on the agent. |
| X++ Tools Path | The location of the Microsoft.Dynamics.AX.Platform.CompilerPackage NuGet package installed on the agent. |
| Location of the X++ modules to test | The storage location where the build task produced the assemblies of the models included. This value is often set to $(Build.BinariesDirectory). |
| Search patterns for the X++ modules to test | Include the pattern for the modules that the tests must be run for. Provide a name matching pattern for X++ package (module) names inside the path that is specified in the location of the X++ modules to test option. You can also specify a list of names instead of search patterns, or exclusion filters. More information: [File matching patterns reference](/azure/devops/pipelines/tasks/file-matching-patterns). |

### Update: Version 1

A new version (1.*) of the **Execute Unit Tests in Unified Environments** task is available. This version replaces the **Service Connection** authentication field. Now you can use multiple authentication mechanisms, like username/password and appId/client Secret to execute the test requests.  

You can use the existing **Power Platform Set Connection Variables** task to generate the connection string in the same pipeline before using the unit test execution task. [Learn more about the details for this task](../../alm/devops-build-tool-tasks.md#power-platform-set-connection-variables) and [about connection types](../../alm/devops-build-tools.md#connection-to-environments).  You can retrieve the connection string and use it in subsequent tasks by creating a reference name in the **Output Variables** section for classic pipelines.

The following image shows how to use the task to generate an output variable named `op` that is referenced in the subsequent unit test execution task:

:::image type="content" source="..\media\unified-experience\pp-set-conn-var.png" alt-text="Power Platform Set Connection Variables task.":::

You can also use this in a YAML pipeline:

Sample **Power Platform Set Connection Variables** task – Use either of the connection types and replace the URL and the service connection name, as shown in [Power Platform Set Connection Variables](../../alm/devops-build-tool-tasks.md#power-platform-set-connection-variables). Use the `name` field to specify the output variable.

```yml
task: microsoft-IsvExpTools.PowerPlatform-BuildTools.set-connection-variables.PowerPlatformSetConnectionVariables@2
  displayName: 'Power Platform Set Connection Variables '
  inputs:
    authenticationType: PowerPlatformSPN
    PowerPlatformSPN: <Service Connection>
    Environment: '<Power platform environment URL>'
  name: 'op'  
```

The following screenshot shows the same reference name used in a unit test task:

:::image type="content" source="..\media\unified-experience\devexp-unitTest-task-1.png" alt-text="Version 1 of Unit test task.":::

### Known Issues
The Execute Unit Tests in Unified Environment task is stuck/times out after message: “Starting submit of test request:”

Solution: This could occur if the **Connection string** provided by the user is of type **Username/Password and has MFA enabled**. Only **Service Principal/Client Secret authentication or Username/Password without MFA authentication** are supported.



### See also

[Unit testing](finance-operations-testing.md)  
[Continuous integration and deployment](finance-operations-pipelines.md)  
[Build automation that uses Microsoft-hosted agents and Azure Pipelines](/dynamics365/fin-ops-core/dev-itpro/dev-tools/hosted-build-automation)  
[Unit Test Framework](/dynamicsax-2012/developer/unit-test-framework)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
