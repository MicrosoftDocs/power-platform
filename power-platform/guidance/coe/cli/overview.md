---
title: Center of Excellence (CoE) command line interface (CLI) overview (Deprecated)
description: Learn how to automate setup and administration tasks for the CoE Starter Kit using command-line tools.
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 08/20/2025
ms.subservice: guidance-toolkit
ms.topic: overview
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
---

# Center of Excellence (CoE) command line interface (CLI) overview (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

The Center of Excellence (CoE) command line interface automates common tasks for the CoE Starter Kit. It provides a set of commands that meet the needs of various [personas](./alm/personas.md) across the organization.

Use it to automate the process of installing CoE CLI components covering Azure, Azure DevOps, and Power Platform.

:::image type="content" source="./media/cli-unified-process.png" alt-text="CLI Unified Process diagram showing Azure, Azure DevOps, and Power Platform CLI components.":::

The CoE CLI provides a set of commands that you can use to automate the end-to-end deployment for CoE solutions.

Compare the CoE CLI to other CLI tools or APIs:

1. The CoE CLI aims to automate the end-to-end deployment of components across the Microsoft cloud.

1. The [Azure CLI](/cli/azure/) aims at automating Azure resources, and via extension, Azure DevOps. The CoE CLI uses the Azure CLI for authentication and for managing Azure related resources.

1. The [Power Platform CLI](/powerapps/developer/data-platform/powerapps-cli) is a simple, one-stop developer CLI that empowers developers and independent software vendors (ISVs) to perform various operations in Microsoft Power Platform related to environment lifecycle features, and to authenticate and work with Dataverse environments, solution packages, portals, and code components. As new features are added to the cross-platform Power Platform CLI, the CoE CLI will use the Power Platform CLI features.

1. The [Azure DevOps services REST API](/rest/api/azure/devops/) provides a REST-based set of commands to interact with Azure DevOps. The CoE CLI uses these APIs to build aggregate commands.

## Get started

After you [install the CoE CLI](./install.md), use the `-h` argument to see help options.

   ```bash
   coe -h
   ```

Authentication for tasks is managed through the Azure CLI. With standard Azure CLI commands, you can sign in, sign out, and select accounts. For example:

   ```bash
   az login
   coe alm install -c aad
   az logout
   ```

## Get help

You can get short descriptions of any command by adding `--help` to the command line. To get more detailed help, use the `help` command. 

For example, to get help on the ALM Accelerator for Power Platform, use the following command:

   ```bash
   coe help alm install
   ```

Get detailed descriptions of each command in the [help](https://aka.ms/coe-cli/help/overview) articles.

## Related information

- [CoE CLI ALM accelerator for Power Platform](./alm/overview.md)
- [Upgrade the CoE CLI](./upgrade.md) 
- [CoE CLI development](./cli-development/overview.md)

[!INCLUDE[footer-include](../../../includes/footer-banner.md)]
