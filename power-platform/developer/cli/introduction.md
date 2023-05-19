---
title: Microsoft Power Platform CLI | Microsoft Docs
description: "Install Microsoft Power Platform CLI to create, debug, and deploy code components by using Power Apps component framework."
keywords: Microsoft Power Platform CLI, code components, component framework, CLI
ms.author: snizar
author: snizar007
ms.reviewer: jdaly
ms.date: 05/16/2023
ms.topic: overview
---
# What is Microsoft Power Platform CLI?

Microsoft Power Platform CLI is a simple, one-stop developer CLI that empowers developers and ISVs to perform various operations in Microsoft Power Platform related to environment lifecycle, authentication, and work with Microsoft Dataverse environments, solution packages, portals, code components, and more.

Microsoft Power Platform CLI is available for use in the GCC and GCC High (US Sovereign cloud) regions. See the [`--cloud`](reference/auth.md#--cloud--ci) parameter for the [pac auth create](reference/auth.md#pac-auth-create) command to find out about supported US Sovereign cloud environments.

## Install Microsoft Power Platform CLI

You can install Microsoft Power Platform CLI using either or both of the following:

|Installation Method |Description|
|---------|---------|
|[Install using Power Platform Tools for Visual Studio Code](#install-using-power-platform-tools-for-visual-studio-code)|Enables use of commands within a PowerShell terminal within Visual Studio Code on Windows 10, Windows 11, Linux, and MacOS.|
|[Install Power Platform CLI for Windows](#install-power-platform-cli-for-windows)|Enables use of commands using PowerShell for Windows 10 and Windows 11. <br /> Certain commands, such as [pac data](reference/data.md), are only available using Power Platform CLI for Windows|

## Install using Power Platform Tools for Visual Studio Code

Follow these steps to install Microsoft Power Platform CLI using Visual Studio Code.

1. Open [Visual Studio Code](https://code.visualstudio.com/).
1. Select the **Extensions** icon from the **Activity** panel. In the search bar, enter **Power Platform Tools**.
1. Select **Install**. Once the installation is finished, restart Visual Studio Code to see the extension within the **Terminal** window.

   :::image type="content" source="media/power-platform-vs-code-extension-install.png" alt-text="VS Code extension install":::

   > [!NOTE]
   > Power Platform Tools for Visual Studio Code updates automatically.

1. Optionally, you can initiate the install into Visual Studio Code directly from [Marketplace]( https://aka.ms/ppcvscode) and it will launch Visual Studio Code and commence the extension installation.

   :::image type="content" source="media/marketplace-install.png" alt-text="Launch install from Marketplace":::

You can also do a side-load install into Visual Studio Code by downloading the extension from the [Marketplace](https://aka.ms/ppcvscode).

### Side-load install of Power Platform Tools for Visual Studio Code

In some organizations, downloading or initiating an install over the web is prohibited. Most cases, the organization download the installation media and stores it in a secure location and verify that it is working according to their standards, before it is distributed within the organization. Use the following instructions to support this type of installation.

1. Go to the [Marketplace](https://aka.ms/ppcvscode) and instead of pressing the **Install** button, click the **Download Extension** link under **Resources**.

   :::image type="content" source="media/side-load-install-1.png" alt-text="Download the extension":::

   This is will download a file with a .vsix extension on to your workstation.

   :::image type="content" source="media/side-load-install-2.png" alt-text="Downloaded extension":::

1. Launch Visual Studio Code and select the **Extensions** icon, select the ellipsis on the **Extensions** side bar, and then select **Install from VSIX**.

   :::image type="content" source="media/side-load-install-3.png" alt-text="Install from VSIX":::

### Successful installation

Once the installation is successful, you will need to restart Visual Studio Code, upon which you will see the following notification.

:::image type="content" source="media/installation-success-1.png" alt-text="Install notification":::

On the **Activity** bar. you'll notice the icon for the Power Platform Tools.

:::image type="content" source="media/installation-success-3.png" alt-text="icon":::

The final check would be to launch the terminal window and type `pac`.

:::image type="content" source="media/installation-success-2.png" alt-text="PAC CLI in the terminal window":::

### Uninstall Power Platform Tools for Visual Studio Code

To uninstall Power Platform Tools for Visual Studio Code, follow the same steps as installing the extension, except this time select the **Uninstall** button.

## Install Power Platform CLI for Windows

To install Power Platform CLI for Windows, you can either install via DotNet tool or .msi.

* To install via [DotNet tool](https://learn.microsoft.com/en-us/dotnet/core/tools/global-tools), you must have [.NET](https://dotnet.microsoft.com/en-us/download) installed (.NET 6.0 recommended). Install Power Platform CLI by using this command:
```dotnetcli
dotnet tool install --global Microsoft.PowerApps.CLI.Tool
```
* To install via .msi download and run the .msi file found here: [Microsoft Power Platform CLI](https://aka.ms/PowerAppsCLI) and choose the **Install** option.

### Update Power Platform CLI for Windows

To take advantage of all the latest capabilities, update Microsoft Power Platform CLI tooling to the latest version by using this command:

```dotnetcli
pac install latest
```

> [!NOTE]
> `pac install latest` command is not applicable for Power Platform Tools for Visual Studio Code. It will look for updates and update automatically each time you open Visual Studio Code.

### Uninstall Power Platform CLI for Windows

To uninstall Power Platform CLI for Windows, download and run the .msi from [Microsoft Power Platform CLI](https://aka.ms/PowerAppsCLI) and choose the **Remove** option.

## Install Power Platform CLI for Linux/macOS

To install Power Platform CLI for Linux/macOS using [DotNet tool](https://learn.microsoft.com/en-us/dotnet/core/tools/global-tools), you must have [.NET](https://dotnet.microsoft.com/en-us/download) installed (.NET 6.0 recommended). Install Power Platform CLI by using this command:
```dotnetcli
dotnet tool install --global Microsoft.PowerApps.CLI.Tool
```

The default location for a tool's binaries depends on the operating system:

| OS          | Path                          |
|-------------|-------------------------------|
| Linux/macOS | `$HOME/.dotnet/tools`         |
| Windows     | `%USERPROFILE%\.dotnet\tools` |

This location is added to the user's path when the SDK is first run. So global tools can be invoked from any directory without specifying the tool location.

Tool access is user-specific, not machine global. A global tool is only available to the user that installed the tool.


## Common commands

This table lists some of the common commands used in the PAC CLI.

|Command|Description|
|-------|-----------|
|[pac admin](reference/admin.md)|Commands for environment lifecycle features.|
|[pac auth](reference/auth.md)|Commands to [connect to your environment](/power-apps/developer/component-framework/import-custom-controls#connecting-to-your-environment).|
|[pac application](reference/application.md)| Commands to install AppSource applications that are pre-requisites for the solution work in the target environment (Preview). |
|[pac canvas](reference/canvas.md)|Commands for working with canvas app source files (Preview).|
|[pac org](reference/org.md)|Commands for working with Dataverse environments.|
|[pac package](reference/package.md)|Commands for working with [solution packages](../../alm/package-deployer-tool.md).|
|[pac paportal](reference/paportal.md)|Commands for working with [Portals support for Microsoft Power Platform CLI](/power-apps/maker/portals/power-apps-cli).|
|[pac pcf](reference/pcf.md)|Commands for working with [Power Apps component framework](/power-apps/developer/component-framework/overview).|
|[pac plugin](reference/plugin.md)|Command to create a [plug-in](/power-apps/developer/data-platform/plug-ins) project.|
|[pac solution](reference/solution.md)|Commands for working with [Dataverse solution projects](/power-apps/maker/data-platform/solutions-overview).|
|[pac telemetry](reference/telemetry.md)|Manages the telemetry settings.|

> [!TIP]
> For the complete list of supported commands, see [Microsoft Power Platform CLI Command Groups](reference/index.md) or  run the `pac` command or `pac` \<subcommand> - for example: `pac solution`.

### See also

[Microsoft Power Platform CLI Command Groups](reference/index.md)<br />
[Power Apps component framework](/power-apps/developer/component-framework/overview)<br />

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
