---
title: Install Power Platform CLI using Windows MSI
description: Instructions to install, update, and uninstall the Power Platform CLI for Windows using an MSI.
ms.author: marcsc
author: devkeydet
ms.reviewer: jdaly
ms.date: 02/27/2024
ms.subservice: developer
ms.topic: how-to
search.audienceType: 
  - developer
contributors:
- JimDaly
ms.custom: bap-template
---
# Install Power Platform CLI using Windows MSI

**Applies to:** :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: Windows only

The [pac data](../cli/reference/data.md) and certain [pac package](../cli/reference/package.md) commands are only available for Windows because they currently have dependencies on .NET Framework, which isn't cross-platform compatible.

> [!NOTE]
> An internet connection is required for install and update. Power Platform CLI for Windows is installed and updated from this NuGet package: [Microsoft.PowerApps.CLI](https://www.nuget.org/packages/Microsoft.PowerApps.CLI)

## Install

1. Download the [powerapps-cli-1.0.msi](https://aka.ms/PowerAppsCLI) file.
1. Open the `powerapps-cli-1.0.msi` file and accept the terms in the License Agreement.

   :::image type="content" source="media/powerapps-cli-1.0-install.png" alt-text="Accept the terms of the license agreement and install the Power Apps CLI":::

1. Select **Install**
1. When the Power Apps CLI Setup wizard is completed, select **Finish**.


## Update

To get the latest updates for Power Platform Tools for Windows, run this command:

```powershell
pac install latest
```

## Uninstall

1. Download the [powerapps-cli-1.0.msi](https://aka.ms/PowerAppsCLI) file
1. Open the `powerapps-cli-1.0.msi` file
1. Select **Next**
1. In the **Change, repair, or remove installation** screen, select **Remove**
1. In the **Ready to remove PowerApps CLI** screen, select **Remove** to confirm
1. When the Power Apps CLI Setup wizard is completed, select **Finish**

## Manage versions

Each time you install Power Platform CLI using Windows MSI, the old installations aren't removed. You can revert back to an earlier installed version if there's an issue with a newer version.

You can type `pac use` and press <kbd>Enter</kbd> to list installed versions.
If you have multiple versions installed on your system, then you can type `pac use <CLI version number>` and press <kbd>Enter</kbd> to use a specific version.

```
C:\> pac use
  1.29.11 (In Use)
  1.30.3
  1.30.6 (Latest)
C:\> pac use 1.30.6
Now using version 1.30.6 of the Microsoft PowerApps CLI.
C:\>
C:\> pac use
  1.29.11
  1.30.3
  1.30.6 (In Use) (Latest)
C:\>
```

## Known issue with `pac power-fx repl`

When you install using the Windows MSI, the shell can stop responding when you try to use [pac power-fx repl](../cli/reference/power-fx.md#pac-power-fx-repl). To work around this issue, install and use the [Visual Studio Code extension](install-vs-code-extension.md) or [install Power Platform CLI with .NET Tool](install-cli-net-tool.md).

### See also

[What is Microsoft Power Platform CLI?](../cli/introduction.md)   
[Install the Power Platform Tools Visual Studio Code extension](install-vs-code-extension.md)   
[Install Power Platform CLI with .NET Tool](install-cli-net-tool.md)   
