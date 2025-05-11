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

# Test Engine Model Context Protocol

To install the Model Context Protocol (MCP) server for Test Engine ensure that you have the prerequisites installed and then complete install steps.

## Prerequisites

>[!NOTE]
> This version of the Model Context Protocol (MCP) server for Test Engine make use of the open source version the server. Future versions of a NuGet package method won't require and .NET SDK to be installed and `git clone` operations.

To use the full features of Test Engine MCP Server, ensure the following tools are available, installed, and configured using examples when using Microsoft windows:

1. Install of .NET SDK 8.0 from [Downloads](https://dotnet.microsoft.com/download/dotnet/8.0). For example

```cmd
winget install Microsoft.DotNet.SDK.8
```

2. An install of PowerShell following the [Install Instructions](https://learn.microsoft.com/powershell/scripting/install/installing-powershell) for your operating system. For example 

```cmd
winget install --id Microsoft.PowerShell --source winget
```

3. Azure CLI: [Install](/cli/azure/install-azure-cli?view=azure-cli-latest) the Azure CLI by following the official documentation. Verify the installation with:

```PowerShell
az --version
```

4. Azure CLI Authentication: Sign-in to Azure CLI using the following command:

```PowerShell
az login --allow-no-subscriptions
```

  Verify the installation with:

```PowerShell
az account show
```

5. Visual Studio Code: Install Visual Studio Code by downloading it from [code.visualstudio.com](https://code.visualstudio.com/docs/setup/setup-overview) or using the following command:

```PowerShell
winget install -e --id Microsoft.VisualStudioCode
```

   Verify the installation with:

```PowerShell
code --version
```

6. A Git Client has been installed. For example using [GitHub Desktop](https://desktop.github.com/download/) or the [Git application](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git). For example

```pwsh
winget install --id Git.Git -e --source winget
```

7. MCP Client: A Model Context Protocol Client. This guide assumes you're using [GitHub Copilot](https://github.com/features/copilot)

8. A Power Platform solution with a created [Plan](/power-apps/maker/plan-designer/plan-designer)

9. For the solution that includes the plan you have setup [Dataverse Git integration](../../alm/git-integration/connecting-to-git.md)

#### Install Steps

To install the MCP Server for Test Engine

1. Open a PowerShell command line

```PowerShell
pwsh
```

2. Clone the GitHub repository for Power Apps Test Engine

```PowerShell
git clone https://github.com/microsoft/PowerApps-TestEngine
```

3. Change to the MCP Server sample

```PowerShell
cd PowerApps-TestEngine\sampels\mcp
```

4. Install the MCP Server

```PowerShell
.\Install.ps1
```

5. After the install. Open Visual Studio Code

6. Open User Settings and merge in the recommended JSON provided in the results of `Install.ps1`


## MCP Server Configuration

Once you have the Test Engine MCP Server [installed](./install.md) using [Visual Studio Code](https://code.visualstudio.com) and [GitHub Copilot](https://github.com/features/copilot) you can:

1. Ensure that you're authenticated to the correct tenant

```PowerShell
az account show
```

1. Sign in to Power Apps. Go to https://make.powerapps.com and sign in with your organizational account.

2. Select the Environment. In the top-right corner, choose the environment for which you want the Instance URL.

3. Open Settings. Select the gear icon (⚙️) in the top-right corner of the page.

4. Choose **Session details**. From the dropdown, select Session details.

5. Copy the Instance URL. In the dialog that appears, select Copy Details. Look for the line that starts with Instance url: — it looks something like: `https://yourenvironmentid.crm.dynamics.com/`

6. Update your `settings.json` in Visual Studio Code with the copied the **Instance URL** url

7. Restart the Test Engine MCP Server

## Upgrade

To upgrade the server, use the following commands

1. Open a PowerShell command using

```PowerShell
pwsh
```

2. Change to the location you clones the Power Apps Test Engine code

```PowerShell
cd PowerApps-TestEngine
```

3. Pull any new changes

```PowerShell
git pull
``

4. Change to the mcp sample

```PowerShell
cd samples\mcp
```

4. Run the install which stops any running sessions, uninstall the old version and install the new compiled version

```PowerShell
.\Install.ps1
```

## Uninstall

You can uninstall the MCP Server using the following commands

1. Ensure that Visual Studio Code isn't running

2. Run the following command line to uninstall the server

```PowerShell
dotnet tool uninstall testengine.server.mcp -g
```
