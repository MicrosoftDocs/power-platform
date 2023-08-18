---
title: "Deploy packages"
description: "Learn how to deploy packages from unified developer experience environments from Azure DevOps pipelines."
author: pvillads
ms.date: 08/01/2023
ms.topic: article
audience: Developer, IT Pro
ms.reviewer: jdaly
ms.search.region: Global
ms.author: pvillads
ms.search.validFrom: 2016-02-28
ms.dyn365.ops.version: AX 7.0.0
ms.collection: get-started
---

# Deploy packages

This article explains how to deploy packages to unified developer experience environments from Azure DevOps pipelines.

You need to complete the following steps:

1. [Get the latest shared marketplace extension](#get-the-latest-shared-marketplace-extension)
1. [Get the Power Platform Build Tools marketplace extension](#get-the-power-platform-build-tools-marketplace-extension)
1. [Upload Nuget packages to the artifact feed in the project](#upload-nuget-packages-to-the-artifact-feed-in-the-project)
1. [Upload the metadata and solution](#upload-the-metadata-and-solution)
1. [Create build pipeline](#create-build-pipeline)
1. [Link the built artifact](#link-the-built-artifact)


## Get the latest shared marketplace extension

You need to get the latest shared marketplace extension for Dynamics 365 Finance and Operations Tools.

To get the latest shared marketplace extension:

1. TODO: Describe where this starts. Is it in PPAC?
1. Locate and install **Dynamics 365 Finance and Operations Tools** shared extension under **Organization Settings** > **Extensions**. (preview version)
1. Add a **Create Deployable Package** task in your build pipeline and ensure it contains task version 1.\*. 
1. Ensure **Add Licenses to Deployable Package** has task version 1.\*.  

> [!NOTE]
> If you have tasks with same name then press **View Yaml** for the task to ensure it's a preview task.

## Get the Power Platform Build Tools marketplace extension

Locate and install the **Power Platform Build Tools** extension from **Organization Settings** > **Extensions** > **Browse Marketplace**.

## Upload Nuget packages to the artifact feed in the project

Get the relevant Nuget packages with the right version to build against for the unified developer experience environments and upload to artifact feed in the project.

Download the X++ Nuget packages with the required version and add them to your artifact feed. Reference: [Build automation that uses Microsoft-hosted agents and Azure Pipelines](../dev-tools/hosted-build-automation.md)

## Upload the metadata and solution

Upload the metadata and solution to the repository for the relevant model.

TODO: Does this need instructions? Or a link to other content?

## Create build pipeline

You need to create a build pipeline to generate the package in the Power Platform Unified package format

The process of building the solution remains same as referenced or based on preexisting build pipelines.

:::image type="content" source="media/unified-experience/deploy-packages.png" alt-text="Shows Azure DevOps Pipelines with build solution agent job selected.":::

To generate a **Power Platform Unified** package:

1. Add a version 1 task for **Create Deployable Package**.
1. Check the box for **Create Power Platform Unified Package**.
1. Add the **Platform** and **Application** version used to build the solution.
1. Provide the path for deployable package location.
1. Optionally choose to generate separate LCS format package.

   :::image type="content" source="media/unified-experience/create-deployable-package.png" alt-text="Shows Azure DevOps Pipelines with create deployable package agent job selected.":::

When licensing is required:

1. Add task version 1.\* for License addition and choose **Power Platform Unified Package** from the drop down.
1. Provide the **Model** name for which to include license.
1. Add 1 task for each model that license is needed.
1. Modify the path to the deployable package created in previous task.

   :::image type="content" source="media/unified-experience/add-licenses-to-deployable-package.png" alt-text="Shows Azure DevOps Pipelines with add licenses to deployable package agent job selected.":::

Once the pipeline is built, locate the published artifacts in the drop.

   :::image type="content" source="media/unified-experience/locate-published-artifacts.png" alt-text="Shows Azure DevOps Pipeline highlighting the Related area showing the artifacts.":::

## Link the built artifact

You need to link the built artifact to the release pipeline that points to the checked out environment for deployment.

1. Create the release pipeline and choose the build pipeline from last step as previous stage.

   :::image type="content" source="media/create-release-pipeline.png" alt-text="Shows a pipeline with the last step as the previous stage":::

1. Add the following three tasks to stage 2:

   - **Power Platform Tool Installer**
   - **Power Platform WhoAmI**
   - **Power Platform Deploy Package**

1. For the **Power Platform WhoAmI** task, add a generic service connection for your environment by getting the connection details from the Org Details. 

   :::image type="content" source="media/unified-experience/add-tasks-to-stage-2.png" alt-text="Shows adding three tasks to stage 2 with the Power Platform WhoAmI task selected.":::

1. For the **Power Platform Deploy Package** task, provide the path of the generated package from build pipeline.

   :::image type="content" source="media/unified-experience/configure-deploy-package-task.png" alt-text="Shows configuration of the Power Platform Deploy Package task":::

1. Observe changes once the deployment is complete  


[!INCLUDE [footer-banner](../../../includes/footer-banner.md)]
