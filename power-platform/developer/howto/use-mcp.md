---
title: Use Power Platform CLI with built-in MCP server
description: Learn how to use the Power Platform CLI with the built-in MCP server for local development and testing.
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

# Use Power Platform CLI with built-in MCP server

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

## Use built-in MCP server

The Power Platform CLI features an integrated Model Context Protocol (MCP) server designed for local development and testing purposes. This server enables interaction with Power Platform through natural language, utilizing MCP-compatible tools such as [Microsoft Visual Studio](https://visualstudio.microsoft.com/), [VS Code](https://code.visualstudio.com/), Claude Code, and others.

## Why would you use the Power Platform CLI built-in MCP server?

The Power Platform CLI has many commands available to work with the Power Platform. But, working with these commands can be a bit of a hassle. You need to remember the commands and the parameters or you need to run the help command a lot.

The Power Platform CLI integrated MCP server helps with making it easier. You can now use the MCP server to talk to the commands in natural language. This way you don't have to learn all the commands and the parameters.

Before we go into a couple of examples, let's first show you how to add the Power Platform CLI MCP server.

## Starting the MCP Server

To start the built-in MCP server, use the [copilot mcp](../cli/reference/copilot.md#pac-copilot-mcp) cli command with the `--run` option as shown below:

```dotnetcli
pac copilot mcp --run
```

Starting the MCP server with .Net `dnx` command:

```dotnetcli
dnx Microsoft.PowerApps.CLI.Tool --yes copilot mcp --run
```

## Registering the MCP Server with Visual Studio

To register the MCP server with Visual Studio, follow steps outlined in the [Use MCP servers for Visual Studio](/visualstudio/ide/mcp-servers?view=visualstudio).

If you are editing mcp.json file manually, MCP server registration should look like this:

```json
{
  "servers": {
    "pac-mcp": {
      "type": "stdio",
      "command": "dnx",
      "args": ["Microsoft.PowerApps.CLI.Tool", "--yes", "copilot", "mcp", "--run"]
    },
  }
}
```

## Registering the MCP Server with VS Code

To register the MCP server with VSCode, follow steps outlined in the [Use MCP servers in VS Code](https://code.visualstudio.com/docs/copilot/customization/mcp-servers).

## Registering the MCP Server with Claude Code

To register the MCP server with Claude Code, follow steps outlined in the [Connect Claude Code to tools via MCP](https://code.claude.com/docs/en/mcp).

To register the MCP server manually you can run `claude mcp add-json` command as shown below:

```dotnetcli
claude mcp add-json pac-cli '{"type":"stdio","command":"dnx","args":["Microsoft.PowerApps.CLI.Tool","--yes","copilot","mcp","--run"]}'
```

## Interacting with the MCP Server

Once the MCP server is registered with your MCP-compatible tool, you can start interacting with it using natural language. Here are a couple of examples:

```plaintext
show me AI related tenant settings
```

```plaintext
Create MD file with table listing all Dataverse environments
```

See full list of available commands in the [Power Platform CLI reference](../../developer/cli/reference/index.md).
