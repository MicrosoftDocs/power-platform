---
title: Use Power Platform CLI with built-in MCP server
description: Learn how to use the Power Platform CLI with the built-in MCP server for local development and testing.
ms.author: anpetroc
author: anpetroc
ms.reviewer: jdaly
ms.date: 10/26/2026
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

The Power Platform CLI (PAC CLI) features an integrated Model Context Protocol (MCP) server designed for local development and testing purposes. This server lets you interact with Power Platform in natural language by using MCP-compatible tools like [Microsoft Visual Studio](https://visualstudio.microsoft.com/), [VS Code](https://code.visualstudio.com/), and Claude Code.

## Invoke PAC CLI commands with natural language

You don't need to memorize all the PAC CLI commands and parameters or constantly refer to the [help command](../cli/reference/help.md) when you use natural language to invoke PAC CLI commands. It's easier to use the PAC CLI integrated MCP server to invoke the commands by using natural language.

Before you begin, you need to start the built-in MCP server.

## Start the MCP Server

To start the built-in MCP server, use the [copilot mcp](../cli/reference/copilot.md#pac-copilot-mcp) CLI command with the `--run` option:

```dotnetcli
pac copilot mcp --run
```

Or you can start the MCP server by using the .NET `dnx` command without installing PAC CLI.

```dotnetcli
dnx Microsoft.PowerApps.CLI.Tool --yes copilot mcp --run
```

[Learn more about how to use the Power Platform CLI without installing it](dnx-cli.md).


## Register the MCP Server

After the server is running, register it with your MCP-compatible tool so it can discover and communicate with PAC CLI. Registration points your IDE or editor to the running server. Choose your tool in the following sections for guided steps, or use the manual configuration example.


### Visual Studio

To register the MCP server with Visual Studio, follow the steps outlined in the [Use MCP servers for Visual Studio](/visualstudio/ide/mcp-servers).

If you edit the `mcp.json` file manually, MCP server registration should look like this:

```json
{
  "servers": {
    "pac-mcp": {
      "type": "stdio",
      "command": "dnx",
      "args": ["Microsoft.PowerApps.CLI.Tool", "--yes", "copilot", "mcp", "--run"]
    }
  }
}
```

### Visual Studio Code

To register the MCP server with VS Code, follow the steps in [Use MCP servers in VS Code](https://code.visualstudio.com/docs/copilot/customization/mcp-servers).

### Claude Code

To register the MCP server with Claude Code, follow the steps in [Connect Claude Code to tools via MCP](https://code.claude.com/docs/en/mcp).

To register the MCP server manually, run the `claude mcp add-json` command:

```dotnetcli
claude mcp add-json pac-cli '{"type":"stdio","command":"dnx","args":["Microsoft.PowerApps.CLI.Tool","--yes","copilot","mcp","--run"]}'
```

## Interact with the MCP Server

After you register the MCP server with your MCP-compatible tool, you can start interacting with it using natural language. Here are a couple of examples:

```
show me AI related tenant settings
```

```
Create MD file with table listing all Dataverse environments
```

See the full list of available commands in the [Power Platform CLI reference](../../developer/cli/reference/index.md).
