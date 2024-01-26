---
title: Install Power Platform CLI for Windows
description: Instructions to install, update, and uninstall the Power Platform CLI for Windows
author: snizar007
ms.author: snizar
ms.reviewer: jdaly
ms.date: 01/15/2024
ms.subservice: developer
ms.topic: how-to
search.audienceType: 
  - developer
contributors:
- JimDaly
ms.custom: bap-template
---
# Install Power Platform CLI for Windows

**Applies to:** :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: Windows only

The [pac data](../cli/reference/data.md) and certain [pac package](../cli/reference/package.md) commands are only available for Windows because they currently have dependencies on .NET Framework, which isn't cross-platform compatible.

Power Platform CLI for Windows is installed and updated from this NuGet package: [Microsoft.PowerApps.CLI](https://www.nuget.org/packages/Microsoft.PowerApps.CLI)

## Install

1. Download the [powerapps-cli-1.0.msi](https://aka.ms/PowerAppsCLI) file.
1. Open the `powerapps-cli-1.0.msi` file and accept the terms in the License Agreement.

   :::image type="content" source="media/powerapps-cli-1.0-install.png" alt-text="Accept the terms of the license agreement and install the Power Apps CLI":::

1. Select **Install**
1. When the Power Apps CLI Setup wizard is completed, click **Finish**.


## Update

To get the latest updates for Power Platform Tools for Windows, run this command:

```powershell
pac install latest
```
> [!NOTE]
> All updates for Power Platform CLI require internet connection to access the latest Nuget package: [Microsoft.PowerApps.CLI](https://www.nuget.org/packages/Microsoft.PowerApps.CLI)
>
> 

## Uninstall

1. Download the [powerapps-cli-1.0.msi](https://aka.ms/PowerAppsCLI) file.
1. Open the `powerapps-cli-1.0.msi` file
1. Select **Next**
1. In the **Change, repair, or remove installation** screen, select **Remove**.
1. In the **Ready to remove PowerApps CLI** screen, select **Remove** to confirm.
1. When the Power Apps CLI Setup wizard is completed, click **Finish**.

### See also

[What is Microsoft Power Platform CLI?](../cli/introduction.md)   
[Install the Power Platform Tools Visual Studio Code extension](install-vs-code-extension.md)   
[Install Power Platform CLI with .NET Tool](install-cli-net-tool.md)   
