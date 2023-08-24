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

Downloaded assets can be found in the following location:  
`C:\Users\<User>\AppData\Local\Microsoft\Dynamics365\<ApplicationVersion>`

Two files were downloaded:

- Finance and operations extension is downloaded as Microsoft.Dynamics.Framework.Tools.Installer.vsix
- System metadata was downloaded as PackagesLocalDirectory.zip.

Unpack the PackagesLocalDirectory.zip file as PackagesLocalDirectory.

### Install the finance and operations extension

Using Windows File Explorer, from the folder shown below open the Microsoft.Dynamics.Framework.Tools.Installer.vsix file to install the extension.

`C:\Users\<User>\AppData\Local\Microsoft\Dynamics365\<ApplicationVersion>`

### Configure the finance and operations extension

To configure the extension, follow these instructions.

1. Start Visual Studio, and then select **Continue without code** from the dialog.
1. Navigate to **Extensions** > **Dynamics 365** > **Configure runtime** > **Configure runtime** for the first time.  
    After the initial configuration, go to **Extensions** > **Dynamics 365** > **Application Explorer** > **Configure Metadata** for further changes.
1. On the configuration form, select **New**, and then create a new configuration.
    1. **Folder for your metadata** is the folder where your own code is (or will be)
    1. **Configuration file location** is a folder (and file name) that will store the configuration you are creating now. It can be anywhere on your drive.
    1. **Cross reference database server** should be "(localdb)\." if you are using LocalDB, or "localhost" if you are using Microsoft SQL Server.
    1. **Reference metadata folder** should contain at least the path where you have the extracted the PackagesLocalDirectory folder mentioned in [Extract system metadata](#extract-system-metadata).
    1. Choose **Save**.

:::image type="content" source="../media/devexp-config.png" alt-text="Manage local configurations":::

If after filling in all the fields the **Save** button is still grayed out, you will see error messages with a red border in tooltips on the offending fields.
Ensure that you entered the correct string value (e.g., "(localdb)\." if you are using LocalDB). Also, if you are using LocalDB, you may need to issue the following command from a Command prompt: `sqllocaldb create MSSQLLocalDB -s`.

You will also get a prompt for elevation as administrator to register the protocol handler and to extract compiler files. Go ahead and accept these prompts.

Once the configuration completes, navigate to **Extensions** > **Dynamics 365** > **Application Explorer** > **Open**. You should see the **Application Explorer** window open.

You can create several configurations, but you must select one to be the current one. The chosen configuration will take effect on new instances of Visual Studio.

## Summary

Congratulations! You’re now ready to build, deploy, debug, and test your X++ modules working with the Power Platform online development environment. Explore the possibilities with the power of Dynamics 365 Finance and Operations integrated with Power Platform.

## Next steps

Start writing code, deploy, and debug.

> [!div class="nextstepaction"]
> [Write, deploy, and debug X++ code](debug.md)

### See also

[Unified developer experience overview (preview)](overview.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]