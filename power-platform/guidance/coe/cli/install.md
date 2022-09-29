---
title: "Center of Excellence (CoE) Command Line Interface (CLI) installation"
description: "Install instructions for the Center of Excellence Command-Line interface"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 11/30/2021

ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---


# Center of Excellence (CoE) Command Line Interface (CLI) installation

To install the CoE CLI:

1. Download the [CoE Starter Kit compressed file](https://aka.ms/CoEStarterKitCurrentMonthRelease).
1. Extract the zip file after downloading.
1. Open unzipped folder and open the **coe-cli** folder

   ```bash
   cd coe-cli
   ```

Next, select either [local install](#local-install) or [Docker install](#docker-install).

## Local install

### Prerequisites

To run the CoE CLI application, you'll need to install the components below.
> [!NOTE]
> The CoE CLI has been tested with Azure CLI version up to 2.38.0

1. An installation of Node 16+.

   a. [https://nodejs.org/en/download/](https://nodejs.org/en/download/)

1. Azure CLI (version 2.37.0+) is required for user authentication and Azure Active Directory integration.

   a. [Install Azure CLI](/cli/azure/install-azure-cli)

1. PowerShell Core (version 7.2+)

   a. [/powershell/scripting/install/installing-powershell](/powershell/scripting/install/installing-powershell)

1. Git CLI (version 2.37.2+)

   a. [https://git-scm.com/downloads](https://git-scm.com/downloads)

### Non Administrator Install

If you do not have administration rights you can use the [Non Administration Install](./non-administrator-local-install.md)

### Checking prerequisites

To check that the prerequisites have been installed correctly and the correct versions are installed, use the following commands at the command prompt.

1. Verify the node version.

   ```bash
   node --version
   ```

1. Verify the Azure CLI version.

   ```bash
   az --version
   ```

### Install

1. Install application dependencies.

   ```bash
   npm install
   ```

1. Build the application.

   ```bash
   npm run build
   ```

1. Link to the CoE CLI application.

   ```bash
   npm link
   ```

#### Notes

- On Windows, you may need to add `%APPDATA%\npm` to your PATH environment variable to access the coe command.

- Install Azure CLI. Follow the install instructions for your operating system at [Install Azure CLI](/cli/azure/install-azure-cli).

## Docker install

One method of installation is via Docker.

### Docker prerequisites

To run the CoE CLI application, you'll need the following software.

- A local install of [Docker](https://docs.docker.com/get-docker/). The install can be either Community Edition or Enterprise Edition. If you're installing onto a desktop environment, you'll normally pick a Community Edition deployment.

### Docker install steps

> [!NOTE]
> On some operating systems, you may need to use `sudo` before each of the Docker commands.

1. Build docker image.

   ```bash
   cd coe-cli
   docker build -t coe-cli . 
   ```

1. Using the docker image.

   ```bash
   docker run -it --rm coe-cli
   ```

This command will start a new interactive console (`-it`) and remove the Docker container (`--rm`) when the console session exits. Using `--rm` ensures that any cached credentials are removed when you exit.

## Next steps

Install [ALM Accelerator](./alm/overview.md)

[!INCLUDE[footer-include](../../../includes/footer-banner.md)]
