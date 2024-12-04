---
title: Install Power Platform CLI with .NET Tool
description: Instructions to install, update, and uninstall Power Platform CLI with .NET Tool
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
# Install Power Platform CLI with .NET Tool

**Applies to:** :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: Windows :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: Linux   :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: macOS

You can install, update, and uninstall the Power Platform CLI using [.NET tool commands](/dotnet/core/tools/global-tools).

> [!NOTE]
> An internet connection is required for install and update. Power Platform CLI with .NET Tool is installed and updated from this NuGet package: [Microsoft.PowerApps.CLI.Tool](https://www.nuget.org/packages/Microsoft.PowerApps.CLI.tool)



## Prerequisites

You must have .NET installed. (.NET 6.0 is recommended.)

# [Windows](#tab/windows)

[Install .NET on Windows](/dotnet/core/install/windows)

# [Linux](#tab/linux)

[Install .NET on Linux](/dotnet/core/install/linux)

# [macOS](#tab/macos)

[Install .NET on macOS](/dotnet/core/install/macos)

---

## Install

Install Power Platform CLI by using the [dotnet tool install](/dotnet/core/tools/dotnet-tool-install) command:

```dotnetcli
dotnet tool install --global Microsoft.PowerApps.CLI.Tool
```

## Update

Update Power Platform CLI by using the [dotnet tool update](/dotnet/core/tools/dotnet-tool-update) command:

```dotnetcli
dotnet tool update --global Microsoft.PowerApps.CLI.Tool
```
> [!NOTE]
> All updates for Power Platform CLI require internet connection to access the latest Nuget package: [Microsoft.PowerApps.CLI](https://www.nuget.org/packages/Microsoft.PowerApps.CLI)
>
> 

## Uninstall

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

This location is added to the user's path when the SDK is first run. So global tools can be invoked from any directory without specifying the tool location.

Tool access is user-specific, not machine global. A global tool is only available to the user that installed the tool.


### See also

[What is Microsoft Power Platform CLI?](../cli/introduction.md)   
[Install the Power Platform Tools Visual Studio Code extension](install-vs-code-extension.md)   
[Install Power Platform Tools for Windows](install-cli-msi.md)   
[How to manage .NET tools](/dotnet/core/tools/global-tools)
