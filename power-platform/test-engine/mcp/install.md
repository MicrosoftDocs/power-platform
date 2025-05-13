---
title: "Test Engine Model Context Protocol Install"
description: "Describes the install and configuration process for Test Engine Model Context Protocol server Setup"
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/09/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Test Engine Model Context Protocol Install

To install the Model Context Protocol (MCP) server for Test Engine, ensure that you have the prerequisites installed and then complete install steps.

## Prerequisites

>[!NOTE]
> This version of the Model Context Protocol (MCP) server for Test Engine makes use of the open source version the server. Future versions of a NuGet package method won't require and .NET SDK to be installed and `git clone` operations.

To use the full features of Test Engine MCP Server, ensure the following tools are available, installed, and configured using examples when using Microsoft windows:

1. A Power Platform solution with a created [Plan](/power-apps/maker/plan-designer/plan-designer)
1. For the solution that includes the plan you have setup [Dataverse Git integration](../../alm/git-integration/connecting-to-git.md)
1. Install of .NET SDK 8.0 from [Downloads](https://dotnet.microsoft.com/download/dotnet/8.0). For example

   ```cmd
   winget install Microsoft.DotNet.SDK.8
   ```

1. An install of PowerShell following the [Install Instructions](/powershell/scripting/install/installing-powershell) for your operating system. For example 

   ```cmd
   winget install --id Microsoft.PowerShell --source winget
   ```

1. Azure CLI: [Install](/cli/azure/install-azure-cli) the Azure CLI by following the official documentation. Verify the installation with:

   ```powershell
   az --version
   ```

1. Azure CLI Authentication: Sign-in to Azure CLI using the following command:

   ```powershell
   az login --allow-no-subscriptions
   ```

   Verify the installation with:

   ```powershell
   az account show
   ```

1. Visual Studio Code: Install Visual Studio Code by downloading it from [code.visualstudio.com](https://code.visualstudio.com/docs/setup/setup-overview) or using the following command:

   ```powershell
   winget install -e --id Microsoft.VisualStudioCode
   ```

      Verify the installation with:

   ```powershell
   code --version
   ```

1. A Git Client has been installed. For example using [GitHub Desktop](https://desktop.github.com/download/) or the [Git application](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git). For example

   ```powershell
   winget install --id Git.Git -e --source winget
   ```

1. MCP Client: A Model Context Protocol Client. This guide assumes you're using [GitHub Copilot](https://github.com/features/copilot)


## Install Steps

To install the MCP Server for Test Engine

1. Open a PowerShell command line

   ```cmd
   pwsh
   ```

1. Clone the GitHub repository for Power Apps Test Engine

   ```powershell
   git clone https://github.com/microsoft/PowerApps-TestEngine
   ```

1. Change to the MCP Server sample

   ```powershell
   cd PowerApps-TestEngine\sampels\mcp
   ```

1. Install the MCP Server

   ```powershell
   .\Install.ps1
   ```

1. After the install. Open Visual Studio Code
1. Open User Settings and merge in the recommended JSON provided in the results of `Install.ps1`
<!-- What 'User Settings'? -->

## MCP Server Configuration

Once you have the Test Engine MCP Server [installed](./install.md) using [Visual Studio Code](https://code.visualstudio.com) and [GitHub Copilot](https://github.com/features/copilot) you can:

1. Ensure that you're authenticated to the correct tenant

   ```powershell
   az account show
   ```

1. Sign in to Power Apps. Go to https://make.powerapps.com and sign in with your organizational account.
1. Select the Environment. In the top-right corner, choose the environment for which you want the Instance URL.
1. Open **Settings**. Select the gear icon (⚙️) in the top-right corner of the page.
1. Choose **Session details**. From the dropdown, select **Session detail**s.
1. Copy the **Instance URL**. In the dialog that appears, select **Copy Details**. Look for the line that starts with Instance url: — it looks something like: `https://yourenvironmentid.crm.dynamics.com/`
1. Update your `settings.json` in Visual Studio Code with the copied the **Instance URL** url
1. Restart the Test Engine MCP Server 
<!-- How to restart? -->

## Upgrade

<!-- Why do I want to upgrade?
When do I know an new upgrade is available? -->

To upgrade the server, use the following commands

1. Open a PowerShell command using

   ```powershell
   pwsh
   ```

1. Change to the location you clones the Power Apps Test Engine code

   ```powershell
   cd PowerApps-TestEngine
   ```

1. Pull any new changes

   ```powershell
   git pull
   ```

1. Change to the mcp sample

   ```powershell
   cd samples\mcp
   ```

1. Run the install which stops any running sessions, uninstall the old version and install the new compiled version

   ```powershell
   .\Install.ps1
   ```

## Uninstall

You can uninstall the MCP Server using the following commands

1. Ensure that Visual Studio Code isn't running
1. Run the following command line to uninstall the server

   ```powershell
   dotnet tool uninstall testengine.server.mcp -g
   ```
