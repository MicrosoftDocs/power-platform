---
title: Install Power Platform Tools for Windows
description: Instructions to install, update, and uninstall the Power Platform Tools for Windows
author: snizar007
ms.author: snizar
ms.reviewer: jdaly
ms.date: 12/05/2023
ms.subservice: developer
ms.topic: how-to
search.audienceType: 
  - developer
contributors:
- JimDaly
ms.custom: bap-template
---
# Install Power Platform Tools for Windows

**Applies to:** :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: Windows only

The [pac data](reference/data.md) and certain [pac package](reference/package.md) commands are only available for Windows because they currently have dependencies on .NET Framework, which isn't cross-platform compatible.

Power Platform Tools for Windows is installed from this NuGet package: [Microsoft.PowerApps.CLI](https://www.nuget.org/packages/Microsoft.PowerApps.CLI)

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