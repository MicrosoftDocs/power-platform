---
title: "Execute unit tests in Azure Pipelines (Preview) "
description: Learn how to set up a unit test for execution using Azure Pipelines.
author: pvillads
ms.date: 03/06/2024
ms.topic: how-to
ms.reviewer: pehecke
ms.author: pvillads
ms.subservice: developer
---

# Execute unit tests in Azure Pipelines (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

An Azure Pipeline build task is available that lets users execute unit tests on connected cloud runtime environments using a continuous integration/continuous delivery (CI/CD) pipeline. The “Execute Unit Tests in Unified Environment” task is included in the [Dynamics 365 Finance and Operations Tools](https://marketplace.visualstudio.com/items?itemName=Dyn365FinOps.dynamics365-finops-tools) extension.

More information: [Continuous integration and deployment (preview)](finance-operations-pipelines.md), [Build automation that uses Microsoft-hosted agents and Azure Pipelines](/dynamics365/fin-ops-core/dev-itpro/dev-tools/hosted-build-automation)

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.

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

In this next image is an example unit test being defined. A description of each form field follows.

:::image type="content" source="..\media\unified-experience\devexp-unitTest-task.png" alt-text="Unit test task form with example data.":::

:::row:::
   :::column span="1":::
      **Display name**
   :::column-end:::
   :::column span="2":::
      The name of the test execution task.
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="1":::
      **Service connection**
   :::column-end:::
   :::column span="2":::
      Service connection to the unified developer experience environment on which the deployment has been made.
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="1":::
      **Package Platform Version<br/>Package Application Version**
   :::column-end:::
   :::column span="2":::
      Versions of the deployed package and connected environment.
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="1":::
      **Platform Package Path**
   :::column-end:::
   :::column span="2":::
      The location of the Microsoft.Dynamics.AX.Platform.DevALM.BuildXpp NuGet package installed on the agent.
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="1":::
      **X++ Tools Path**
   :::column-end:::
   :::column span="2":::
      The location of the Microsoft.Dynamics.AX.Platform.CompilerPackage NuGet package installed on the agent.
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="1":::
      **Location of the X++ modules to test**
   :::column-end:::
   :::column span="2":::
      The storage location where the build task produced the assemblies of the models included. This value is often set to $(Build.BinariesDirectory).
   :::column-end:::
:::row-end:::
:::row:::
   :::column span="1":::
      **Search patterns for the X++ modules to test**
   :::column-end:::
   :::column span="2":::
      Include the pattern for the modules that the tests must be run for. Provide a name matching pattern for X++ package (module) names inside the path that is specified in the location of the X++ modules to test option. You can also specify a list of names instead of search patterns, or exclusion filters. More information: [File matching patterns reference](/azure/devops/pipelines/tasks/file-matching-patterns).
   :::column-end:::
:::row-end:::

### See also

[Unit testing (preview)](finance-operations-testing.md)  
[Continuous integration and deployment (preview)](finance-operations-pipelines.md)  
[Build automation that uses Microsoft-hosted agents and Azure Pipelines](/dynamics365/fin-ops-core/dev-itpro/dev-tools/hosted-build-automation)  
[Unit Test Framework](/dynamicsax-2012/developer/unit-test-framework)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
