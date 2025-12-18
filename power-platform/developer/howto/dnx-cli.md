---
title: Run Power Platform CLI using `dnx` Command
description: Learn how to to use the Power Platform CLI with the `dnx` command
ms.author: anpetroc
author: anpetroc
ms.reviewer: jdaly
ms.date: 12/18/2025
ms.subservice: developer
ms.topic: how-to
search.audienceType: 
  - developer
contributors:
- JimDaly
ms.custom: bap-template
---
# Run Power Platform CLI using `dnx` Command

**Applies to:** :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: Windows :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: Linux   :::image type="icon" source="../../power-fx/reference/media/yes-icon.svg" border="false"::: macOS

## Prerequisites

You must have .NET 10.0 or higher installed.

# [Windows](#tab/windows)

[Install .NET on Windows](/dotnet/core/install/windows)

# [Linux](#tab/linux)

[Install .NET on Linux](/dotnet/core/install/linux)

# [macOS](#tab/macos)

[Install .NET on macOS](/dotnet/core/install/macos)

---

## Use `dnx` Command

When .NET  10 is installed, you can use the [`dotnet tool exec` or `dnx` command](/dotnet/core/tools/dotnet-tool-exec) to execute PAC CLI without installing it globally or locally. This is especially valuable for Continuous Integration and Continuous Delivery (CI/CD) or other scenarios where you may not be able to or want to install PAC CLI. This provides one-shot invocation mode for PAC CLI commands. `dnx` automatically downloads the[PAC CLI package](https://www.nuget.org/packages/Microsoft.PowerApps.CLI.Tool) from [Nuget.Org](https://www.nuget.org/) to the local NuGet cache and invokes it without modifying your system PATH or requiring permanent installation.

Use the following syntax:

```dotnetcli
dnx Microsoft.PowerApps.CLI.Tool --yes <command> [arguments]
```

For example, see a list of all Dataverse environments:

```dotnetcli
dnx Microsoft.PowerApps.CLI.Tool --yes env list
```

See full list of available commands in the [Power Platform CLI reference](../../developer/cli/reference/).

### See also

If you still need to install Power Platform CLI, see:

- [Install Power Platform CLI with .NET Tool](install-cli-net-tool.md)
- [Install the Power Platform Tools Visual Studio Code extension](install-vs-code-extension.md)
- [Install Power Platform Tools for Windows](install-cli-msi.md)
- [How to manage .NET tools](/dotnet/core/tools/global-tools)