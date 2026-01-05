---
title: "Continuous integration and deployment"
description: Learn how to set up continuous integration and deployment using Azure Pipelines.
author: pvillads
ms.date: 06/07/2024
ms.topic: how-to
ms.reviewer: pehecke
ms.author: pvillads
ms.subservice: developer
ms.custom: sfi-image-nochange
---

# Continuous integration and deployment

This article explains how to implement continuous integration and deployment (CI/CD) of Power Platform unified developer experience assets using Azure Pipelines. Specifically, how to:

- Get the latest [Dynamics 365 Finance and Operations Tools](https://marketplace.visualstudio.com/items?itemName=Dyn365FinOps.dynamics365-finops-tools) and [Power Platform Build Tools](../../alm/devops-build-tools.md#get-microsoft-power-platform-build-tools)
- Create a build pipeline to generate a package in Power Platform unified package format
- Upload your solution and relevant artifacts, and link the generated package to your deploy pipeline

## Install or update the latest build tools

1. Sign into the Power Platform admin center and select the environment you want to work in. In the **Organization Settings > Extensions** menu, locate and install the “Dynamics 365 Finance and Operations Tools” shared extension.
1. Add a **Create Deployable Package** task in your build pipeline, and ensure it contains task version 1. Ensure **Add Licenses to Deployable Package** has task version 1.
1. Locate and install the Power Platform Build Tools extension from **Organization Settings > Extensions > Browse Marketplace**.
1. Download the X++ NuGet packages with the required version and add them to your artifact feed. For details on this step refer to [Build automation that uses Microsoft-hosted agents and Azure Pipelines - Finance & Operations](/dynamics365/fin-ops-core/dev-itpro/dev-tools/hosted-build-automation).

## Create a pipeline to generate a Power Platform unified format package

The process for building your solution remains same, and can be based on preexisting build pipelines. Follow the instructions that begin below this next image.

:::image type="content" source="../media/unified-experience/pipelines-build-solution.png" alt-text="Image of Build a Solution in Azure DevOps.":::

1. To generate a Power Platform unified package, add your version 1 task to **Create Deployable Package**. Check the box for **Create Power Platform Unified Package**. Add the package platform and application versions used to build the solution, and provide the path for the deployable package location.
Optionally, you can choose to generate a separate Lifecycle Services format package.

    :::image type="content" source="../media/unified-experience/pipelines-create-deployable-package.png" alt-text="Image of Create Deployable Package in Azure DevOps.":::

1. If licensing is required, select the **Add Licenses to Deployable Packages** for your version 1 task and choose **Power Platform Unified Package** from the drop down menu. Provide the **Model Name** to include a license. Add a task for each model that the license is needed. Modify the path to the deployable package created in previous step. If the package folder created in the previous step is not provided as input to this step correctly you may see the error 'fnomoduledefinition.json file not found'.

    :::image type="content" source="../media/unified-experience/pipelines-add-licenses.png" alt-text="Image of Add Licenses to Deployable Package in Azure DevOps.":::

1. Once the pipeline is built, locate the published artifacts under **Related** in the **Summary** tab.

    :::image type="content" source="../media/unified-experience/pipelines-locate-artifacts.png" alt-text="Image of solution artifacts in Azure DevOps.":::

   > [!NOTE]
   > If you see this error:<p/>
   > 'An item with the specified name \<initial drive path>\3c5d3d3b-4428-4901-9357-4559d510e2a8\<model> already exists.' <p/>
   > please ensure that you do not have duplicate modules as only 1 version per module is accepted.

## Link to your deploy pipeline

Follow these next instructions to link to your deployment pipeline.

1. Create a release pipeline, choosing the build pipeline from the preceding section.

    :::image type="content" source="../media/unified-experience/pipelines-create-release-pipeline.png" alt-text="Image of a release pipeline.":::

1. Add the following tasks to stage 2 as shown in the following image.
    1. Power Platform Tool Installer
    1. Power Platform WhoAmI
    1. Power Platform Deploy Package

    :::image type="content" source="../media/unified-experience/pipelines-who-am-i.png" alt-text="Image of WhoAmI task settings.":::

    For the WhoAmI task, add a generic service connection for your environment. You can get the connection details from the **Your Organization > Details**.

1. To deploy the task, provide the path of the generated package from the build pipeline.

    :::image type="content" source="../media/unified-experience/pipelines-deploy-packages.png" alt-text="Image of Power Platform Deploy Package task settings.":::

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
