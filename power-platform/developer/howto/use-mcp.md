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

The Power Platform CLI (PAC CLI) features an integrated Model Context Protocol (MCP) server designed for local development and testing purposes. This server enables interaction with Power Platform through natural language, utilizing MCP-compatible tools such as [Microsoft Visual Studio](https://visualstudio.microsoft.com/), [VS Code](https://code.visualstudio.com/), Claude Code, and others.

## Invoke PAC CLI commands with natural language

It isn't necessary to memorize all the PAC CLI commands and parameters or constantly refer to the [help command](../cli/reference/help.md) when you use natural language to invoke PAC CLI commands. It is much easier to use the PAC CLI integrated MCP server invoke the commands using natural language.

Before you begin, you need to start the built-in MCP server.

## Starting the MCP Server

To start the built-in MCP server, use the [copilot mcp](../cli/reference/copilot.md#pac-copilot-mcp) cli command with the `--run` option as shown below:

```dotnetcli
pac copilot mcp --run
```

Or you can start the MCP server with .Net `dnx` command without installing PAC CLI.

```dotnetcli
dnx Microsoft.PowerApps.CLI.Tool --yes copilot mcp --run
```

[Learn more about how to use the Power Platform CLI without installing it](dnx-cli.md)


## Register the MCP Server

After the server is running, register it with your MCP-compatible tool so it can discover and communicate with PAC CLI. Registration simply points your IDE or editor to the running server; choose your tool below for guided steps, or use the manual configuration example if you prefer.


### Visual Studio

To register the MCP server with Visual Studio, follow steps outlined in the [Use MCP servers for Visual Studio](/visualstudio/ide/mcp-servers).

If you are editing `mcp.json` file manually, MCP server registration should look like this:

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

### Visual Studio Code

To register the MCP server with VS Code, follow steps outlined in the [Use MCP servers in VS Code](https://code.visualstudio.com/docs/copilot/customization/mcp-servers).

### Claude Code

To register the MCP server with Claude Code, follow steps outlined in the [Connect Claude Code to tools via MCP](https://code.claude.com/docs/en/mcp).

To register the MCP server manually you can run `claude mcp add-json` command as shown below:

```dotnetcli
claude mcp add-json pac-cli '{"type":"stdio","command":"dnx","args":["Microsoft.PowerApps.CLI.Tool","--yes","copilot","mcp","--run"]}'
```

## Interacting with the MCP Server

Once the MCP server is registered with your MCP-compatible tool, you can start interacting with it using natural language. Here are a couple of examples:

```
show me AI related tenant settings
```

```
Create MD file with table listing all Dataverse environments
```

See full list of available commands in the [Power Platform CLI reference](../../developer/cli/reference/index.md).
