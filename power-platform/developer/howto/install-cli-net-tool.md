---
title: Install Power Platform CLI with .NET Tool
description: Install Power Platform CLI with .NET Tool on Windows, Linux, or macOS. Follow these steps to install, update, or uninstall the CLI.
ms.author: laswenka
author: laneswenka
ms.reviewer: jdaly
ms.date: 08/04/2026
ms.subservice: developer
ms.topic: how-to
search.audienceType: 
  - developer
contributors:
- JimDaly
ms.custom: bap-template
---
# Install Power Platform CLI with .NET tool

**Applies to:** :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" alt-text="Screenshot of a checkmark indicating operating system support."::: Windows :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" alt-text="Screenshot of a checkmark indicating operating system support."::: Linux   :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" alt-text="Screenshot of a checkmark indicating operating system support."::: macOS

Learn how to install, update, and uninstall Power Platform CLI by using [.NET tool commands](/dotnet/core/tools/global-tools). This user-specific global installation lets you invoke the CLI from any directory.

> [!NOTE]
> You need an internet connection to install and update. The Power Platform CLI with .NET Tool installs and updates from this NuGet package: [Microsoft.PowerApps.CLI.Tool](https://www.nuget.org/packages/Microsoft.PowerApps.CLI.tool)



## Prerequisites

You must have .NET installed. (.NET 10.0 is recommended.)

# [Windows](#tab/windows)

[Install .NET on Windows](/dotnet/core/install/windows)

# [Linux](#tab/linux)

[Install .NET on Linux](/dotnet/core/install/linux)

# [macOS](#tab/macos)

[Install .NET on macOS](/dotnet/core/install/macos)

---

## Install Power Platform CLI

Install Power Platform CLI by using the [dotnet tool install](/dotnet/core/tools/dotnet-tool-install) command:

```dotnetcli
dotnet tool install --global Microsoft.PowerApps.CLI.Tool
```

## Update Power Platform CLI

Update Power Platform CLI by using the [dotnet tool update](/dotnet/core/tools/dotnet-tool-update) command:

```dotnetcli
dotnet tool update --global Microsoft.PowerApps.CLI.Tool
```
> [!NOTE]
> All updates for Power Platform CLI require an internet connection to access the latest NuGet package: [Microsoft.PowerApps.CLI](https://www.nuget.org/packages/Microsoft.PowerApps.CLI)
>
> 

## Uninstall Power Platform CLI

Uninstall Power Platform CLI by using the [dotnet tool uninstall](/dotnet/core/tools/dotnet-tool-uninstall) command:

```dotnetcli
dotnet tool uninstall --global Microsoft.PowerApps.CLI.Tool
```

## File locations

The default location for a tool's executable file depends on the operating system:

| OS          | Path                          |
|-------------|-------------------------------|
| Linux/macOS | `$HOME/.dotnet/tools`         |
| Windows     | `%USERPROFILE%\.dotnet\tools` |

When you first run the SDK, it adds this location to your path. So you can invoke global tools from any directory without specifying the tool location.

Tool access is user-specific, not machine global. A global tool is only available to the user that installed the tool.


### See also

[What is Microsoft Power Platform CLI?](../cli/introduction.md)   
[Install the Power Platform Tools Visual Studio Code extension](install-vs-code-extension.md)   
[Install Power Platform Tools for Windows](install-cli-msi.md)   
[How to manage .NET tools](/dotnet/core/tools/global-tools)
