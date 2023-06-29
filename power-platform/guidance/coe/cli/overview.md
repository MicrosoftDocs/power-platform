---
title: Center of Excellence (CoE) command line interface (CLI) overview (Deprecated)
description: This article provides an overview of the Center of Excellence Command-Line interface and how it automates the setup and administrator of common tasks.
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 05/23/2023

ms.topic: "article"
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Center of Excellence (CoE) command line interface (CLI) overview (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

The Center of Excellence (CoE) command line interface provides automation for common tasks of the CoE starter toolkit. It's been designed to provide a set of commands that meet the needs of different [personas](./alm/personas.md) across the organization.

It can be used to automate the process of installing CoE CLI components covering Azure, Azure DevOps, and Power Platform.

## Unified administration

![CLI Unified Process](./media/cli-unified-process.png)

The CoE CLI provides a set of commands that can be used to automate the end-to-end deployment for CoE solutions.

Comparing and contrasting the CoE CLI to other CLI or APIs:

1. The CoE CLI aims to automate the end-to-end deployment of components across the Microsoft cloud.

1. The [Azure CLI](/cli/azure/) is aimed at automating Azure resources, and via extensions, Azure DevOps. The CoE CLI uses the Azure CLI for authentication and managing Azure related resources.

1. The [Power Platform CLI](/powerapps/developer/data-platform/powerapps-cli) is a simple, one-stop developer CLI that empowers developers and independent software vendors (ISVs) to perform various operations in Microsoft Power Platform related to environment lifecycle features, and to authenticate and work with Microsoft Dataverse environments, solution packages, portals, and code components. As new features are added to the cross platform Power Platform CLI, the CoE CLI will use the Power Platform CLI features.

1. The [Azure DevOps services REST API](/rest/api/azure/devops/) provides a REST based set of commands to interact with Azure DevOps. The CoE CLI makes use of these APIs to build aggregate commands.

## What next

As you consider an enterprise deployment the following sections outline the key concepts, you will need to understand:

1. [Install CoE CLI](./install.md) - How to install the CoE CLI using local host computer or via a Docker container.

1. [Set up ALM Accelerator for Power Platform (AA4PP) components](./alm/overview.md) - Use CLI commands to set up and configure an environment for ALM Accelerator to enable them to achieve more within your organization.

## Getting started

Once the CoE CLI has been [installed](./install.md), you can use `-h` argument to see help options.

   ```bash
   coe -h
   ```

Authentication for tasks is managed using the Azure CLI. Using standard Azure CLI commands you can log in, log out, and select accounts. For example:

   ```bash
   az login
   coe alm install -c aad
   az logout
   ```

## Getting help

You can get short descriptions of any command by adding `--help` to the command line. To get more detailed help, you can use the help command. For example, to get help on the ALM Accelerator for Power Platform use the following command.

   ```bash
   coe help alm install
   ```

Read more in the [help](https://aka.ms/coe-cli/help/overview) articles for detailed descriptions for each command.

## Learn more

- [CoE CLI upgrade](./upgrade.md) - How to upgrade to a new version of the CoE CLI install.

## How does it work

Interested in learning how the CoE CLI works or want to extend the functionality? The [CLI development overview](./cli-development/overview.md) provides the best place to start.

[!INCLUDE[footer-include](../../../includes/footer-banner.md)]
