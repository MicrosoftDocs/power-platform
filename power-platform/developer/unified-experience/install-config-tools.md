---
title: "Install and configure development tools (preview)"
description: Set up required Dynamics 365 finance and operations app development tools on your local computer.
author: pvillads
ms.date: 08/23/2023
ms.topic: article
ms.reviewer: pehecke
ms.author: pathaku
---

# Install and configure development tools (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This article describes how to install and configure required Visual Studio and finance and operations tools into your local development environment. The instructions in each section should be following in the order presented in this article.

As a prerequisite, you will need access to a [provisioned developer-focused sandbox environment](../../admin/unified-experience/tutorial-deploy-new-environment-with-ERP-template.md). 

> [!IMPORTANT]
> The user account you will be using for development in the sandbox environment must be assigned either the System Administrator or System Customizer role.

## Install the Power Platform extension for Visual Studio

Follow the instructions in this article to install the marketplace extension: [What is Power Platform Tools for Visual Studio](../devtools-vs.md). You do not need to install the plug-in profiler as directed in that article.

### Connect to to your online environment

After you have installed the Power Platform Tools extension for Visual Studio, follow these instructions to connect Visual Studio with a solution in your online Dataverse developer-focused environment.

1. Launch Visual Studio if not already running.
1. In the **Tools** menu, select **Connect to Dataverse**.
1. Select the desired options in the dialog and select **Login**.
    Choose not to use the signed in user (in case you need to use another account with a VS license) and type in the credentials as necessary to match your development user account.
1. When presented with a dialog to select a solution, select an available solution and then choose **Done**.
1. You will be presented with a list of Dataverse organizations (databases deployed). Find the sandbox environment created for online development and connect to it.
    > [!NOTE]
    > If you have only one online development environment, the organization list dialog may not be shown as you would automatically connect to the environment.

## Download and install the finance and operations extension and metadata

After installing the Power Platform Tools extension and connecting to the online Dataverse sandbox environment, you will be presented with a dialog to download the finance and operations Visual Studio extension and metadata.

:::image type="content" source="../media/devexp-fno-download.png" alt-text="Extension and metadata download dialog.":::

> [!IMPORTANT]
> The dialog to download the finance and operations extension is only displayed when you have connected to a properly configured online developer-focused sandbox environment.
>
> You need at least 5 GB of free space on the local system drive to download the extension and metadata.

CHoose **OK** in the dialog to start the download. Visual studio will notify you once the download is completed. Visual Studio may not be responsive while downloading the assets.

### Extract system metadata

### Install the finance and operations extension

### Configure the finance and operations extension

## Summary

If you have followed the above procedures correctly, you should see the **F&O Explorer** window open in Visual Studio.

<!--Add image-->

### See also

[Unified developer experience overview (preview)](overview.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]