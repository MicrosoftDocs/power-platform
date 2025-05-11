---
title: "Test Engine Model Context Protocol"
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

The Test Engine MCP Server contains the following commands

| Command           | Parameters | Description |
|--------------------|------------|-------------|
| GetPlans           | None       |Obtain the list of available Plan Designer plans in the configured environment |
| GetPlanDetails     | planId: string, workspace:string | Queries the details for the Plan Designer and scans the workspace for recommendations to generate tests for |
| ValidatePowerFx    | powerFx: string | Validates that the provided Power Fx is valid for use in Test Engine

### Get Plan Designer Plans

1. Use the [Plan Designer](/power-apps/maker/plan-designer/plan-designer) to generate and save a plan that you want to build tests for

2. Ensure that the Power Platform that contains the plan solution is integrated with [Dataverse Git](../../alm/git-integration/connecting-to-git)

3. Clone the Git Repository to your machine

4. Open the cloned Git repository in Visual Studio Code

5. In the GitHub Copilot, make use [Agent mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) to interact with the MCP Server actions

6. Interact with the agent using the available commands. For example:

| Scenario | Example Prompt |
|----------|----------------|
| List available plans |Show me available plans.
| Get details of a specific plan | Get me details on the "Contoso Plan" plan.
| Generate tests | Generate tests for my Dataverse entities.
