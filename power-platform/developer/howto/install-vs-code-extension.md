---
title: Install the Power Platform Tools Visual Studio Code extension
description: Instructions to install, update, and uninstall the Power Platform Tools Visual Studio Code extension.
ms.author: marcsc
author: devkeydet
ms.reviewer: jdaly
ms.date: 02/14/2024
ms.subservice: developer
ms.topic: how-to
search.audienceType: 
  - developer
contributors:
- JimDaly
ms.custom: bap-template
---
# Install the Power Platform Tools Visual Studio Code extension

**Applies to:** :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: Windows :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: Linux   :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: macOS 

The Visual Studio Code extension is the recommended way to install Power Platform CLI. This extension upgrades automatically when new versions are released. You also have the options to install a previous version or side-load the extension.

## Prerequisites

[Download and install Visual Studio Code](https://code.visualstudio.com/download).

## Install

You can install the Microsoft Power Platform CLI using the Visual Studio Code extension from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/vscode) or from Visual Studio Extensions.

### Install from the Visual Studio Marketplace

1. Go to [Power Platform Tools](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode)
1. Select **Install**.
1. Select **Continue** if the **Visual Studio Code is required to install this extension** dialog appears
1. Select **Open** if the **This site is trying to open Visual Studio Code dialog** appears
1. In Visual Studio Code, select **Install**

### Install from Visual Studio Code extensions

1. In Visual Studio Code, select the **Extensions** icon in the navigation bar.
1. Search for 'power platform tools'
1. Select the **Install** button in the search results.

### Install a previous version

If there's an issue with the current version, you can revert to an earlier version.

1. In Visual Studio Code, select **Extensions**
1. Search for 'power platform tools'
1. In the main window, select the drop-down arrow on the **Uninstall** button
1. Select **Install Another version...**
   
   :::image type="content" source="media/install-another-version.png" alt-text="Option to install another version":::
   
1. Select the previous version you want to install
1. After the installation is completed, select **Reload Required**

When you select this option, the extension gives you the option to **Update** and ignores automatic updates. To resume automatic updates:

1. While viewing the Power Platform Tools extension in Visual Studio Code, select the drop-down arrow on the **Update** button.
1. Clear the **Ignore Updates** check box
1. Close and reopen Visual Studio Code to trigger the update.

### Side-load install

In some organizations, downloading or initiating an install over the web is prohibited. Most cases, the organization downloads the installation media and stores it in a secure location and verify that it's working according to their standards, before it's distributed within the organization. Use the following instructions to support this type of installation.

1. Go to [Power Platform Tools in the Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode)
1. On the right side, in the **Resources** group select the **Download Extension** link.

   This downloads a file named `microsoft-IsvExpTools.powerplatform-vscode-x.x.xx.vsix` where `x.x.xx` is the current version.

1. In Visual Studio Code select **Extensions** 
1. Select the ellipsis on the **Extensions** side bar, and then select **Install from VSIX...**

   :::image type="content" source="media/install-from-vsix.png" alt-text="Select Install from VSIX":::

1. Select the downloaded file.
1. When installation is complete, you'll see a notification saying **Completed installing Power Platform Tools extension from VSIX**.

## Update

There's usually no need to update. The extension updates automatically as new versions are released.
When you open Visual Studio Code, you'll see a notification like this:

:::image type="content" source="media/pac-cli-updated.png" alt-text="Power Platform CLI update notification in Visual Studio code":::

If you choose to [install a previous version](#install-a-previous-version), you'll need to re-enable automatic updates.

## Uninstall

1. In Visual Studio Code, select **Extensions**
1. Search for 'power platform tools'.
1. In the main window, select **Uninstall**.

## Enable PAC CLI in Command Prompt (CMD) and PowerShell terminals for Windows

By default, the Visual Studio Code extension only enables commands using the Visual Studio Code PowerShell terminal.

To enable using PAC CLI in Command Prompt (CMD) and PowerShell terminals for Windows, you can do any of the following:

- [Install Power Platform CLI with .NET Tool](install-cli-net-tool.md)
- [Install Power Platform CLI using Windows MSI](install-cli-msi.md)
- Add the PAC CLI executable to the Windows environment PATH.

## Authentication profile management

When you install the Visual Studio Code extension, you can view and manage authentication profiles.

<!-- TODO: Details & Screenshots -->


### See also

[What is Microsoft Power Platform CLI?](../cli/introduction.md)   
[Install Power Platform CLI with .NET Tool](install-cli-net-tool.md)   
[Install Power Platform Tools for Windows](install-cli-msi.md)   