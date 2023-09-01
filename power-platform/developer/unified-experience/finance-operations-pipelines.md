---
title: "Continuous integration and deployment (preview)"
description: Learn how to set up continuous integration and deployment using Azure Pipelines.
author: pvillads
ms.date: 08/31/2023
ms.topic: how-to
ms.reviewer: pehecke
ms.author: pvillads
ms.subservice: developer
---

# Continuous integration and deployment (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This article explains how to implement continuous integration and deployment (CI/CD) of Power Platform unified developer experience assets using Azure Pipelines. Spcifically, how to

- Get the latest Dynamics 365 Finance and Operations (link?) and [Power Platform Build Tools](../..//alm/devops-build-tools.md#get-microsoft-power-platform-build-tools).
- Create a build pipeline to generate a package in Power Platform unified package format
- Upload your solution and relevant artifacts using NuGet packages for the unified environment
- Link the generated package to your release pipeline for deployment.

## Install or update the latest build tools

1. Locate and install the “Dynamics 365 Finance and Operations Tools” shared extension under **Organization Settings -> Extensions**.
QUESTION: Where will I find this menu? Power Platform admin center?

1. Add a **Create Deployable Package** task in your build pipeline, and ensure it contains task version 1. Ensure Add Licenses to Deployable Package has task version 1. If you have tasks with same name, then select "View Yaml" for the task to ensure it’s a preview task.
1.  Locate and install the “Power Platform Build Tools” extension from **Organization Settings -> Extensions -> Browse Marketplace**.
1. Download the X++ NuGet packages with the required version and add them to your artifact feed. For details on this step refer to [Build automation that uses Microsoft-hosted agents and Azure Pipelines - Finance & Operations](https://learn.microsoft.com/dynamics365/fin-ops-core/dev-itpro/dev-tools/hosted-build-automation).

## Create a pipeline to generate a Power Platform unified format package

The process for building your solution remains same, and can be based on preexisting build pipelines.

:::image type="content" source="../media/unified-experience/pipelines-build-solution.png" alt-text="Image of Build a Solution in Azure DevOps.":::

1. To generate a Power Platform unified package, add your version 1 task to **Create Deployable Package**. Check the box for **Create Power Platform Unified Package**. Add the Platform and Application version used to build the solution, and provide the path for the deployable package location.
Optionally, you can choose to generate a separate Lifecycle Services format package.

:::image type="content" source="../media/unified-experience/pipelines-create-deployable-package.png" alt-text="Image of Create Deployable Package in Azure DevOps.":::

2. If licensing is required, select the **Add Licenses to Deployable Packages** for your version 1 task and choose Power Platform Unified Package from the drop down menu. Provide the **Model Name** to include a license. Add a task for each model that the license is needed. Modify the path to the deployable package created in previous step.

:::image type="content" source="../media/unified-experience/pipelines-add-licenses.png" alt-text="Image of Add Licenses to Deployable Package in Azure DevOps.":::

1.  Once the pipeline is built, locate the published artifacts located under **Related** in the Summary tab.
THIS IS RELATED TO THE NEXT STEP - I DON'T SEE WHERE BASED ON THE IMAGES?

:::image type="content" source="../media/unified-experience/pipelines-locate-artifacts.png" alt-text="Image of Build a Solution in Azure DevOps.":::

## Link to your deploy pipeline

1. Create a release pipeline, choosing the build pipeline from the preceding section.

:::image type="content" source="../media/unified-experience/pipelines-create-release-pipeline.png" alt-text="Image of a release pipeline.":::

2. Add the following tasks to stage 2 as shown in the following image.
    1. Power Platform Tool Installer
    1. Power Platform WhoAmI
    1. Power Platform Deploy Package

:::image type="content" source="../media/unified-experience/pipelines-who-am-i.png" alt-text="Image of WhoAmI task settings.":::

For the WhoAmI task, add a generic service connection for your environment. You can get the connection details from the Org Details.
QUESTION: Do users know how to get to this locatin/Org Details?

1. To deploy the task, provide the path of the generated package from the build pipeline.

:::image type="content" source="../media/unified-experience/pipelines-deploy-packages.png" alt-text="Image of Power Platform Deploy Package task settings.":::

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]