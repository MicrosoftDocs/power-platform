---
title: "Install and configure development tools (preview)"
description: Set up required finance and operations app development tools on your local computer.
author: pvillads
ms.date: 11/08/2023
ms.topic: how-to
ms.reviewer: pehecke
ms.author: pathaku
ms.subservice: developer
---

# Install and configure development tools (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

This article describes how to install and configure required Visual Studio finance and operations tools into your local development environment. The instructions in each section should be followed in the order presented in this article.

> [!IMPORTANT]
> As a prerequisite, you need access to a [provisioned developer-focused sandbox environment](../../admin/unified-experience/tutorial-deploy-new-environment-with-ERP-template.md).
>
> The user account you'll be using for development in the sandbox environment must be assigned the System Administrator role.
> 
> The development machine running Microsoft Windows must have Visual Studio 2019 installed with at least the .NET desktop development workload and the Modeling SDK. This SDK can be selected under individual components in the Visual Studio installer. Refer to [required Visual Studio components](/dynamics365/fin-ops-core/dev-itpro/dev-tools/developer-tools-vs2017#required-visual-studio-components). The development machine also must have Microsoft SQL Server or SQL Server Express LocalDB installed.

## Install the Power Platform extension for Visual Studio

Follow the instructions in this article to install the marketplace extension: [What is Power Platform Tools for Visual Studio](../devtools-vs.md). You don't need to install the plug-in profiler as directed in that article.

### Connect to your online environment

After you have installed the Power Platform Tools extension for Visual Studio, follow these instructions to connect Visual Studio to your unified developer-focused environment.

1. Launch Visual Studio if not already running.
1. In the **Tools** menu, select **Connect to Dataverse** or **Download FinOps assets**. The former only downloads assets if not already downloaded once while the latter will download even if you had downloaded earlier.
1. Select the desired options in the dialog and select **Login**.  
    Choose not to use the signed-in user if you need to use another account with a Visual Studio license. Enter the credentials as necessary to match your development user account.
1. When presented with a dialog to select a solution, select an available solution and then choose **Done**.
1. You will be presented with a list of Dataverse organizations (databases deployed). Find the sandbox environment created for online development and connect to it.
    > [!NOTE]
    > If you have only one online development environment, the organization list dialog may not be shown as you would automatically connect to the environment.
    > :::image type="content" source="../media/unified-experience/UnoVSConnect.png" alt-text="Menu for connecting to unified environment from Visual Studio.":::
    > :::image type="content" source="../media/unified-experience/UnoLogin.png" alt-text="Login dialog when connecting to unified environment from Visual Studio.":::

## Download and install the finance and operations extension and metadata

After installing the Power Platform Tools extension and connecting to the online Dataverse sandbox environment, you'll be presented with a dialog to download the finance and operations Visual Studio extension and metadata.

:::image type="content" source="../media/devexp-fno-download.png" alt-text="Extension and metadata download dialog.":::

> [!IMPORTANT]
> You can configure settings using the Visual Studio setting **Tools** > **Options** > **Power Platform Tools**.
>
> Consider the option **Do not display Power Platform Explorer...** to speed up connecting to your environment and **Download logs...** to get logs for deployment and DBSync operations.
>
> :::image type="content" source="../media/unified-experience/D365FinOpsToolsOptions.png" alt-text="Tools options":::
>
> You need at least 12 GB of free space on the local system drive to download the extension and metadata.

Choose **OK** in the dialog to start the download. Visual studio notifies you once the download is completed. Visual Studio may not be responsive while downloading the assets, so please be patient.

### Extract system metadata

Downloaded assets can be found in the following location:  
`C:\Users\<User>\AppData\Local\Microsoft\Dynamics365\<ApplicationVersion>`

Three files are downloaded and described below.

:::image type="content" source="../media/unified-experience/D365FinOpsAsetsDownloaded.png" alt-text="download asset files":::

- Finance and operations extension is downloaded as Microsoft.Dynamics.Framework.Tools.Installer.vsix
- System metadata is downloaded as PackagesLocalDirectory.zip.
- Backup of the cross reference database as DYNAMICSXREFDB.bak

Unblock any of the three files that needs unblocking.

:::image type="content" source="../media/unified-experience/D365FinOpsAsetsUnblock.png" alt-text="Unblock downloaded asset files":::

Unpack the PackagesLocalDirectory.zip file as PackagesLocalDirectory. We recommend using the [7zip](https://www.7-zip.org/download.html) utility to speed up extraction.

### Install the finance and operations extension

Using Windows File Explorer, from the folder specified below, open the Microsoft.Dynamics.Framework.Tools.Installer.vsix file to install the extension.
`C:\Users\<User>\AppData\Local\Microsoft\Dynamics365\<ApplicationVersion>`

### Configure the finance and operations extension

To configure the extension, follow these instructions.

1. Start Visual Studio, and then select **Continue without code** from the dialog.
2. Navigate to **Extensions** > **Dynamics 365** > **Configure Metadata** for the first time.  
    If you do not see the **Configure Metadata** option, open **Extensions** > **Dynamics 365** > **Infolog** and retry.
   :::image type="content" source="../media/unified-experience/D365FinOpsConfigureMetadataMenu.png" alt-text="Configure Metadata menu":::

3. On the configuration form, select **New** and then create a new configuration. Refer to the field descriptions provided in the table that follows this procedure.
 :::image type="content" source="../media/unified-experience/D365FinOpsConfigureMetadata.png" alt-text="Configure Metadata dialog":::
4. Select **Save**.

| Form field | Description |
|---|---|
|Name| Name of the configuration you're creating now.|
|Description| Description of the configuration you're creating now.|
|Cross reference database server| Set to "(localdb)\\." if you're using LocalDB, or "localhost" if you're using Microsoft SQL Server.|
|Cross reference database name| The name for the cross reference database. The Visual Studio extension creates one if it doesn't exist.|
|Application version to restore cross reference database from| Please select this. It is populated from the assets downloaded when you connected to the unified developer environment.|
|Folder for your own custom metadata| Folder where your own code is (or will be).|
|Folders for reference metadata| Should contain at least the path where you have the extracted the PackagesLocalDirectory folder mentioned in [Extract system metadata](#extract-system-metadata).|

If after filling in all the fields the **Save** button is still grayed out, you'll see error messages with a red border in tooltips on the offending fields.

:::image type="content" source="../media/unified-experience/D365FinOpsConfigureMetadataValidation.png" alt-text="Configure Metadata Validation":::

Ensure that you entered the correct value(s) for fields with errors. For example, use "(localdb)\\." if you're using LocalDB. 
Also, if you're using LocalDB, you may need to first configure and test it. Consider issuing the following command from a Command prompt: `sqllocaldb create MSSQLLocalDB -s`.

More information: [SQL Server Express LocalDB](/sql/database-engine/configure-windows/sql-server-express-localdb).

> [!NOTE]
> If the cross reference database does not already exist, the tool will restore the database from the backup downloaded to C:\Users\\`<User>`\AppData\Local\Microsoft\Dynamics365\\`<ApplicationVersion>`. You'll see notifications in the Visual Studio **Output** pane. If you need to restore it again by yourself you can do so. For instructions to do a restore refer to [Restore to SQL Server](/sql/samples/adventureworks-install-configure?tabs=ssms#restore-to-sql-server).

After the configuration is saved, you may get a prompt for elevation as administrator to register the protocol handler and to extract compiler files. Go ahead and accept these prompts.

Once the configuration completes, navigate to **View** > **Application Explorer** . You should see the **Application Explorer** window open. You may have to restart Visual Studio first.

:::image type="content" source="../media/unified-experience/D365FinOpsApplicationExplorer.png" alt-text="Application Explorer":::

You can create several configurations, but must select one to be current. The chosen configuration takes effect on new instances of Visual Studio.

## Summary

Congratulations! You’re now ready to build, deploy, debug, and test your X++ modules working with the Power Platform online development environment. Explore the possibilities with the power of finance and operations integrated with Power Platform.

## Next steps

Start writing code, deploy, and debug.

> [!div class="nextstepaction"]
> [Write, deploy, and debug X++ code](finance-operations-debug.md)

### See also

[Unified developer experience for finance and operations apps (preview)](finance-operations-dev-overview.md)

[!INCLUDE [footer-banner](../../includes/footer-banner.md)]
