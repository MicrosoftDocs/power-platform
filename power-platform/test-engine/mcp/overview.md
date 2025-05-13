---
title: "Test Engine Model Context Protocol Overview"
description: "Describes the Model Context Protocol server integration"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Test Engine Model Context Protocol

The Model Context Protocol (MCP) is a feature of the Test Engine that enables integration with external tools, such as GitHub Copilot, to help generating and validating test cases.

The Test Engine MCP Server makes use of stdio transport to communicate with the MCP Client.

## Available Commands

The Test Engine MCP Server contains the following commands.

| Command| Parameters | Description |
|---|---|---|
| `GetPlans`| None|Obtain the list of available Plan Designer plans in the configured environment |
| `GetPlanDetails`| `planId`: string<br/>`workspace`:string | Queries the details for the Plan Designer and scans the workspace for recommendations to generate tests for |
| `GetScanTypes`| None| Obtain a list of available scan types configured for your MCP Server |
| `Scan`| `workspacePath`: string<br/>`scans`: string[]<br/>`powerFx`: string | Scan workspace for recommendations and apply optional post scan Power Fx steps 
| `ValidatePowerFx`| `powerFx`: string | Validates that the provided Power Fx is valid for use in Test Engine|

### Get Plan Designer Plans

1. Use the [Plan Designer](/power-apps/maker/plan-designer/plan-designer) to generate and save a plan that you want to build tests for
1. Ensure that the Power Platform that contains the plan solution is integrated with [Dataverse Git](../../alm/git-integration/connecting-to-git.md)
1. Clone the Git Repository to your machine
1. Open the cloned Git repository in Visual Studio Code
1. In the GitHub Copilot, make use [Agent mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) to interact with the MCP Server actions
1. Interact with the agent using the available commands. For example:

   | Scenario | Example Prompt |
   |----------|----------------|
   | List available plans |Show me available plans.|
   | Get details of a specific plan | Get me details on the "Contoso Plan" plan.|
   | Generate tests | Generate tests for my Dataverse entities.|
