---
title: Microsoft Power Platform CLI | Microsoft Docs
description: "Install Microsoft Power Platform CLI to create, debug, and deploy code components by using Power Apps component framework."
keywords: Microsoft Power Platform CLI, code components, component framework, CLI
ms.author: snizar
author: snizar007
ms.reviewer: jdaly
ms.date: 08/21/2023
ms.topic: overview
---
# What is Microsoft Power Platform CLI?

Microsoft Power Platform CLI is a simple, one-stop developer CLI that empowers developers and ISVs to perform various operations in Microsoft Power Platform related to:

- Environment lifecycle
- Authentication
- Microsoft Dataverse environments
- Solution packages
- Portals
- Code components
- and more.

## Provide feedback

Use [github.com/microsoft/powerplatform-build-tools/discussions](https://github.com/microsoft/powerplatform-build-tools/discussions) to view and submit feedback for PAC CLI.

## Install Microsoft Power Platform CLI

There are three ways to install the Power Platform CLI.

|Method|OS Support|Description|
|---------|---------|---------|
|[Install the Visual Studio Code extension](../howto/install-vs-code-extension.md)|Windows,Linux,MacOS|Install from Visual Studio Code market place or Visual Studio Code extensions|
|[Install with .NET Tool](../howto/install-cli-net-tool.md)|Windows,Linux,MacOS|Install using [.NET tool commands](/dotnet/core/tools/global-tools)|
|[Install with Windows MSI](../howto/install-cli-msi.md)|Windows only|Install this when you need to use [pac data](reference/data.md) or certain [pac package](reference/package.md) commands |

## Manage auth profiles

Most PAC CLI commands require authenticated access to resources. You will need to create and use auth portals.

### Connect to your tenant

The `pac auth create` command is what you should use to connect to your tenant. Running `pac auth create` creates an authentication profile on your machine. You can have multiple authentication profiles available. Having multiple authentication profiles is interesting when you work with multiple tenants. For instance, when your company uses multiple tenants (a production tenant and a test / QA tenant) or when you are a consultant that works for multiple customers.

The `pac auth create` command has a couple of helpful parameters. The first one is the `--environment` parameter. The `--environment` parameter enables you to automatically connect to the right environment. If you omit the `--environment` parameter, you are connected to the default environment, but with the `--environment` parameter added to it, you can connect to a different one. You can use the environment ID, url, unique name, or partial name as the value.

The second one is the `--deviceCode` parameter. In environments where you don't have the ability to use an interactive experience, adding the `--deviceCode` parameter will make sure you can still connect. In, for instance, GitHub Codespaces, the `--deviceCode` parameter automatically gets added when you run `pac auth create`.

#### Example

To connect to the `HR-Dev` environment, you can use the following example:

```powershell
pac auth create --environment "HR-Dev"
```

### Switch to another authentication profile

When you have multiple authentication profiles, you can easily switch using the `pac auth list` and `pac auth select` commands.

The `pac auth list` command can be used to list all authentication profiles on your machine. The `pac auth select` command selects a different command.

#### Example

To list all authentication profiles, use the following example:

```powershell
pac auth list
```

Running the `pac auth list` command returns all authentication profiles:

```text
TODO: add response
```

Now, select a different authentication profile by using the following example:

```powershell
pac auth select --index 2
```

<!-- 
You can install Microsoft Power Platform CLI using either or both of the following methods:

|Installation Method |Description|
|---------|---------|
|[Install using Power Platform Tools for Visual Studio Code](#install-using-power-platform-tools-for-visual-studio-code)|Enables use of commands within a PowerShell terminal within Visual Studio Code on Windows 10, Windows 11, Linux, and macOS.|
|[Install Power Platform CLI for Windows](#install-power-platform-cli-for-windows)|Enables use of commands using PowerShell for Windows 10 and Windows 11. <br /> Certain commands, such as [pac data](reference/data.md), are only available using Power Platform CLI for Windows|

## Install using Power Platform Tools for Visual Studio Code

Follow these steps to install Microsoft Power Platform CLI using Visual Studio Code.

1. Open [Visual Studio Code](https://code.visualstudio.com/).
1. Select the **Extensions** icon from the **Activity** panel. In the search bar, enter **Power Platform Tools**.
1. Select **Install**. Once the installation is finished, restart Visual Studio Code to see the extension within the **Terminal** window.

   :::image type="content" source="media/power-platform-vs-code-extension-install-v2.png" alt-text="VS Code extension install":::

   > [!NOTE]
   > Power Platform Tools for Visual Studio Code updates automatically.

1. Optionally, you can initiate the install into Visual Studio Code directly from [Marketplace]( https://aka.ms/ppcvscode) and it launches Visual Studio Code and commence the extension installation.

   :::image type="content" source="media/marketplace-install-v2.png" alt-text="Launch install from Marketplace":::

You can also do a side-load install into Visual Studio Code by downloading the extension from the [Marketplace](https://aka.ms/ppcvscode).

### Side-load install of Power Platform Tools for Visual Studio Code

In some organizations, downloading or initiating an install over the web is prohibited. Most cases, the organization downloads the installation media and stores it in a secure location and verify that it's working according to their standards, before it's distributed within the organization. Use the following instructions to support this type of installation.

1. Go to the [Marketplace](https://aka.ms/ppcvscode) and instead of pressing the **Install** button, select the **Download Extension** link under **Resources**:

   :::image type="content" source="media/side-load-install-1-v2.png" alt-text="Download the extension":::
   
   Clicking this link downloads a file with a .vsix extension on to your workstation.

   :::image type="content" source="media/side-load-install-2.png" alt-text="Downloaded extension":::

1. Launch Visual Studio Code and select the **Extensions** icon, select the ellipsis on the **Extensions** side bar, and then select **Install from VSIX**.

   :::image type="content" source="media/side-load-install-3.png" alt-text="Install from VSIX":::

### Successful installation

Once the installation is successful, you need to restart Visual Studio Code, upon which you see the following notification.

:::image type="content" source="media/installation-success-1.png" alt-text="Install notification":::

On the **Activity** bar. you notice the icon for the Power Platform Tools.

:::image type="content" source="media/installation-success-3-v2.png" alt-text="icon":::

The final check would be to launch the terminal window and type `pac`.

:::image type="content" source="media/installation-success-2-v2.png" alt-text="PAC CLI in the terminal window":::

### Uninstall Power Platform Tools for Visual Studio Code

To uninstall Power Platform Tools for Visual Studio Code, follow the same steps as installing the extension, except this time select the **Uninstall** button.

## Install Power Platform CLI for Windows

To install Power Platform CLI for Windows, you can either install via DotNet tool or .msi.

- To install via [DotNet tool](/dotnet/core/tools/global-tools), you must have [.NET](https://dotnet.microsoft.com/download) installed (.NET 6.0 recommended). Install Power Platform CLI by using this command:

   ```dotnetcli
   dotnet tool install --global Microsoft.PowerApps.CLI.Tool
   ```

- To install via .msi download and run the .msi file found here: [Microsoft Power Platform CLI](https://aka.ms/PowerAppsCLI), choose the **Install** option.

### Update Power Platform CLI for Windows/MacOS/Linux

To take advantage of all the latest capabilities, update Microsoft Power Platform CLI tooling to the latest version by using this command:

```dotnetcli
pac install latest
```

To update via [DotNet tool](/dotnet/core/tools/global-tools), you must have [.NET](https://dotnet.microsoft.com/download) installed (.NET 6.0 recommended). Update Power Platform CLI by using this command:

```dotnetcli
dotnet tool update --global Microsoft.PowerApps.CLI.Tool
```

> [!NOTE]
> `pac install latest` command is not applicable for Power Platform Tools for Visual Studio Code. It will look for updates and update automatically each time you open Visual Studio Code.

### Uninstall Power Platform CLI for Windows

To uninstall Power Platform CLI for Windows, download and run the .msi from [Microsoft Power Platform CLI](https://aka.ms/PowerAppsCLI) and choose the **Remove** option.

## Install Power Platform CLI for Linux/macOS

To install Power Platform CLI for Linux/macOS using [DotNet tool](/dotnet/core/tools/global-tools), you must have [.NET](https://dotnet.microsoft.com/download) installed (.NET 6.0 recommended). Install Power Platform CLI by using this command:
```dotnetcli
dotnet tool install --global Microsoft.PowerApps.CLI.Tool
```

The default location for a tool's binaries depends on the operating system:

| OS          | Path                          |
|-------------|-------------------------------|
| Linux/macOS | `$HOME/.dotnet/tools`         |
| Windows     | `%USERPROFILE%\.dotnet\tools` |

This location is added to the user's path when the SDK is first run. So global tools can be invoked from any directory without specifying the tool location.

Tool access is user-specific, not machine global. A global tool is only available to the user that installed the tool. -->

## US Sovereign cloud availability

Microsoft Power Platform CLI is available for use in the GCC and GCC High (US Sovereign cloud) regions. See the [`--cloud`](reference/auth.md#--cloud--ci) parameter for the [pac auth create](reference/auth.md#pac-auth-create) command to find out about supported US Sovereign cloud environments.

<!-- ## Common commands

This table lists some of the common commands used in the PAC CLI.

|Command|Description|
|-------|-----------|
|[pac admin](reference/admin.md)|Commands for environment lifecycle features.|
|[pac auth](reference/auth.md)|Commands to [connect to your environment](/power-apps/developer/component-framework/import-custom-controls#connecting-to-your-environment).|
|[pac application](reference/application.md)| Commands to install AppSource applications that are prerequisites for the solution work in the target environment (Preview). |
|[pac canvas](reference/canvas.md)|Commands for working with canvas app source files (Preview).|
|[pac org](reference/org.md)|Commands for working with Dataverse environments.|
|[pac package](reference/package.md)|Commands for working with [solution packages](../../alm/package-deployer-tool.md).|
|[pac paportal](reference/paportal.md)|Commands for working with [Portals support for Microsoft Power Platform CLI](/power-apps/maker/portals/power-apps-cli).|
|[pac pcf](reference/pcf.md)|Commands for working with [Power Apps component framework](/power-apps/developer/component-framework/overview).|
|[pac plugin](reference/plugin.md)|Command to create a [plug-in](/power-apps/developer/data-platform/plug-ins) project.|
|[pac solution](reference/solution.md)|Commands for working with [Dataverse solution projects](/power-apps/maker/data-platform/solutions-overview).|
|[pac telemetry](reference/telemetry.md)|Manages the telemetry settings.|

> [!TIP]
> For the complete list of supported commands, see [Microsoft Power Platform CLI Command Groups](reference/index.md) or  run the `pac` command or `pac` \<subcommand> - for example: `pac solution`. -->

### See also

[Microsoft Power Platform CLI Command Groups](reference/index.md)<br />
[Power Apps component framework](/power-apps/developer/component-framework/overview)<br />

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
