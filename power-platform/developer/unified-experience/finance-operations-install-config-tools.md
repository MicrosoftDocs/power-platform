---
title: "Install and configure development tools (preview)"
description: Set up required Dynamics 365 finance and operations app development tools on your local computer.
author: pvillads
ms.date: 08/23/2023
ms.topic: how-to
ms.reviewer: pehecke
ms.author: pathaku
ms.subservice: developer
---

# Install and configure development tools (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This article describes how to install and configure required Visual Studio finance and operations tools into your local development environment. The instructions in each section should be followed in the order presented in this article.

As a prerequisite, you need access to a [provisioned developer-focused sandbox environment](../../admin/unified-experience/tutorial-deploy-new-environment-with-ERP-template.md).

> [!IMPORTANT]
> The user account you'll be using for development in the sandbox environment must be assigned the System Administrator role.

## Install the Power Platform extension for Visual Studio

Follow the instructions in this article to install the marketplace extension: [What is Power Platform Tools for Visual Studio](../devtools-vs.md). You don't need to install the plug-in profiler as directed in that article.

### Connect to your online environment

After you have installed the Power Platform Tools extension for Visual Studio, follow these instructions to connect Visual Studio to your unified developer-focused environment.

1. Launch Visual Studio if not already running.
1. In the **Tools** menu, select **Connect to Dataverse**.
1. Select the desired options in the dialog and select **Login**.  
    Choose not to use the signed-in user if you need to use another account with a VS license. Enter the credentials as necessary to match your development user account.
1. When presented with a dialog to select a solution, select an available solution and then choose **Done**.
1. You are presented with a list of Dataverse organizations (databases deployed). Find the sandbox environment created for online development and connect to it.
    > [!NOTE]
    > If you have only one online development environment, the organization list dialog may not be shown as you would automatically connect to the environment.

## Download and install the finance and operations extension and metadata

After installing the Power Platform Tools extension and connecting to the online Dataverse sandbox environment, you'll be presented with a dialog to download the finance and operations Visual Studio extension and metadata.

:::image type="content" source="../media/devexp-fno-download.png" alt-text="Extension and metadata download dialog.":::

> [!IMPORTANT]
> You can configure settings using the Visual Studio setting **Tools** > **Options** > **Power Platform Tools**.
>
> Consider **Do not display Power Platform Explorer...** to speed up login to environment and **Download logs...** to get logs for deployment and DBSync operations.
> 
> :::image type="content" source="../media/unified-experience/D365FinOpsToolsOptions.png" alt-text="Tools options":::
>
> You need at least 12 GB of free space on the local system drive to download the extension and metadata.

Choose **OK** in the dialog to start the download. Visual studio notifies you once the download is completed. 


Visual Studio may not be responsive while downloading the assets.

### Extract system metadata

Downloaded assets can be found in the following location:  
`C:\Users\<User>\AppData\Local\Microsoft\Dynamics365\<ApplicationVersion>`

Three files are downloaded:

:::image type="content" source="../media/unified-experience/D365FinOpsAsetsDownloaded.png" alt-text="download asset files":::

- Finance and operations extension is downloaded as Microsoft.Dynamics.Framework.Tools.Installer.vsix
- System metadata was downloaded as PackagesLocalDirectory.zip.
- Backup of the cross reference database as DYNAMICSXREFDB.bak

Unblock any file that needs unblocking 

:::image type="content" source="../media/unified-experience/D365FinOpsAsetsUnblock.png" alt-text="Unblock downloaded asset files":::

Unpack the PackagesLocalDirectory.zip file as PackagesLocalDirectory. We recommend using the [7zip](https://www.7-zip.org/download.html) utility to speed up extraction.

### Install the finance and operations extension

Using Windows File Explorer, from the folder specified below, open the Microsoft.Dynamics.Framework.Tools.Installer.vsix file to install the extension.
`C:\Users\<User>\AppData\Local\Microsoft\Dynamics365\<ApplicationVersion>`

### Configure the finance and operations extension

To configure the extension, follow these instructions.

1. Start Visual Studio, and then select **Continue without code** from the dialog.
2. Navigate to **Extensions** > **Dynamics 365** > **Configure Metadata** for the first time.  
    If you do not see it, open **Extensions** > **Dynamics 365** > **Infolog** and retry.
   :::image type="content" source="../media/unified-experience/D365FinOpsConfigureMetadataMenu.png" alt-text="Configure Metadata menu":::

4. On the configuration form, click **New**, and then create a new configuration. See the field descriptions provided in the following table.
 :::image type="content" source="../media/unified-experience/D365FinOpsConfigureMetadata.png" alt-text="Configure Metadata dialog":::
6. Click **Save**.

| Form field | Description |
|---|---|
|Name| Name of the configuration you're creating now.|
|Description| Description of the configuration you're creating now.|
|Cross reference database server| Could be set to "(localdb)\." if you're using LocalDB, or "localhost" if you're using Microsoft SQL Server.|
|Cross reference database name| The name for the Cross reference database. The VS extension creates one if it doesn't exist.|
|Application version to restore cross reference database from| Please select this. It is populated from the assets downloaded when you connected to the unified development environment.|
|Folder for your own custom metadata| Folder where your own code is (or will be).|
|Folders for reference metadata| Should contain at least the path where you have the extracted the PackagesLocalDirectory folder mentioned in [Extract system metadata](#extract-system-metadata).|

If after filling in all the fields the **Save** button is still grayed out, you'll see error messages with a red border in tooltips on the offending fields.
:::image type="content" source="../media/unified-experience/D365FinOpsConfigureMetadataValidation.png" alt-text="Configure Metadata Validation":::

Ensure that you entered the correct value(s) for fields with errors. (for example, "(localdb)\." if you're using LocalDB). 
Also, if you're using LocalDB, you may need to first configure and test it. Consider issuing the following command from a command prompt: `sqllocaldb create MSSQLLocalDB -s`. More information: [SQL Server Express LocalDB](/sql/database-engine/configure-windows/sql-server-express-localdb).

> [!NOTE]
> If the cross reference database does not already exist, the tool will restore the database from backup downloaded to C:\Users\<User>\AppData\Local\Microsoft\Dynamics365\<ApplicationVersion>. You will see notifications in the Visual Studio Output pane. If you need to restore it again by yourself you can do so. For steps refer  https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms#restore-to-sql-server 

After configuration is saved, you may get a prompt for elevation as administrator to register the protocol handler and to extract compiler files. Go ahead and accept these prompts.

Once the configuration completes, navigate to **View** > **Application Explorer** . You should see the **Application Explorer** window open. You may have to restart Visual studio first. 

:::image type="content" source="../media/unified-experience/D365FinOpsApplicationExplorer.png" alt-text="Application Explorer":::

You can create several configurations, but must select one to be current. The chosen configuration takes effect on new instances of Visual Studio.

## Summary

Congratulations! You’re now ready to build, deploy, debug, and test your X++ modules working with the Power Platform online development environment. Explore the possibilities with the power of Dynamics 365 Finance and Operations integrated with Power Platform.

## Next steps

Start writing code, deploy, and debug.

> [!div class="nextstepaction"]
> [Write, deploy, and debug X++ code](finance-operations-debug.md)

### See also

[Unified developer experience for finance and operations apps (preview)](finance-operations-dev-overview.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
