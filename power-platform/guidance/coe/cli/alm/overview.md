---
title: "CoE CLI ALM accelerator for Microsoft Power Platform (Deprecated)"
description: "Overview of the Center of Excellence (CoE) command-line interface (CLI) ALM accelerator commands"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 05/23/2023
ms.topic: overview
ms.subservice: guidance-toolkit
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# CoE CLI ALM accelerator for Microsoft Power Platform (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

You can use the CLI application lifecycle management (ALM) accelerator for Microsoft Power Platform to manage common ALM tasks to install, set up, and administer the ALM accelerator for Microsoft Power Platform. This article contains:

- [Quick start](#quick-start) guides you through the process of a [demo tenant installation](./scenarios/tenant-deployments.md#demonstration-deployment).
- [Understand the concepts](#understand-the-concepts) covers scenarios, personas, key concepts, and the installation process of using the Center of Excellence (CoE) CLI.

## Prerequisites

To set up the ALM accelerator for Microsoft Power Platform, you'll need to first [install the CoE CLI](../install.md).

## Quick start

For an administrator, the quick start guide should take about 30 minutes. By the guide's end, you will have configured Microsoft Entra ID, Azure DevOps, and the Microsoft Power Platform environments.

1. Validate the organization's [maturity model](./maturity/overview.md#quick-start) for ALM.

1. Create your [Microsoft Power Platform environments](before-you-start.md#power-platform-environment-prerequisites), [Azure DevOps](before-you-start.md#azure-devops) organization, and Azure DevOps project.

1. Create an installation configuration. Review the [installation help](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) for installation parameters.

   ```bash
   coe alm generate install -o quickstart.json
   ```

   This command generates a JSON configuration file similar to the following. Replace **contoso** with your tenant name.

   ```json
   {
   "log": [
      "info"
   ],
   "components": [
      "all"
   ],
   "aad": "ALMAcceleratorServicePrincipal",
   "group": "ALMAcceleratorForMakers",
   "devOpsOrganization": "https://dev.azure.com/contoso",
   "project": "alm-sandbox",
   "repository": "alm-sandbox",
   "pipelineRepository": "coe-alm-accelerator-templates",
   "environments": "https://contoso-prod.crm.dynamics.com/",
   "settings": {
      "installEnvironments": [
         "validation",
         "test",
         "prod"
      ],
      "validation": "https://contoso-validation.crm.dynamics.com/",
      "test": "https://contoso-test.crm.dynamics.com/",
      "prod": "https://contoso-prod.crm.dynamics.com/",
      "createSecret": "true",
      "region": [
         "NAM"
      ]
   },
   "importMethod": "api",
   "endpoint": "prod",
   "$schema": "./alm.schema.json
   }
   ```

   More information: [CoE ALM generate install](https://aka.ms/coe-cli/help/alm/generate/install) command

1. Install the ALM accelerator by using the generated configuration file.

   ```bash
   coe alm install -f quickstart.json
   ```

   More information: [CoE ALM install](https://aka.ms/coe-cli/help/alm/install)

   Deploying to your enterprise? For more information, go to [Enterprise deployment](./scenarios/tenant-deployments.md#enterprise-deployment).

   If you're prompted to create an HTTP with Microsoft Entra ID connection, enter **https&colon;\/\/graph&period;microsoft&period;com** for both the **Base Resource URL** and **Microsoft Entra Resource URI**.

1. [Update permissions for the project build service](../../setup-almacceleratorpowerplatform.md#update-permissions-for-the-project-build-service) to enable build pipelines to interact with Git repositories.

1. [Update pipeline permissions to resources](../../setup-almacceleratorpowerplatform.md#setting-resource-access-permissions-for-pipelines) to allow access to required resources.

1. When your makers create [development environments](./development-environments.md), run `CoE ALM maker add` to add the makers to Azure DevOps and share the ALM Accelerator for Power Platform canvas app.

   ```bash
   coe alm maker add 
      -o https://dev.azure.com/contoso 
      -p alm-sandbox 
      -e https://contoso-userdev.crm.dynamics.com 
      -aad ALMAcceleratorServicePrincipal 
      -g ALMAcceleratorForMakers -u user@contoso.com
   ```

   More information: [CoE ALM maker add](https://aka.ms/coe-cli/help/alm/maker/add)

   You can also generate a user configuration file. Using this approach, you can explore each parameter and review the settings before adding the maker.

   ```bash
   coe alm generate maker add -o user.config
   coe alm maker add -f user.config
   ```

   More information: [CoE ALM generate maker add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/generate/maker/add.md)

## Understand the concepts

Not sure what ALM is and how it can help? [Use the ALM accelerator for Microsoft Power Platform](../../almacceleratorpowerplatform-components.md) provides further context and examples of usage.

### Getting started

- [Scenarios](./scenarios/overview.md) discusses different installation scenarios for ALM, from demo installations to enterprise deployments.
- [Personas](./personas.md) describes key personas and how they map to ALM CLI commands and the wider ALM process.
- [Key concepts](./key-concepts.md) describes the key concepts for the components that are being automated "under the hood" by the CLI commands.
- [Branching and merging](./branching-and-merging.md) provides examples of the branching and merging approach of using ALM.

### Sample installation

The following recording shows a sample generating an installation configuration file and installing ALM by using the configuration file in a [demo deployment](./scenarios/tenant-deployments.md#demonstration-deployment).

![Example](./install.svg)

### Installation overview<a name="install-overview"></a>

1. Review [Before you start](./before-you-start.md) to ensure that you've created the required Microsoft Power Platform environments and Azure DevOps organizations.

1. As an administrator, complete the [admin installation](./admin-install.md).

1. Have makers create [development environments](./development-environments.md).

1. Use [maker setup](./maker-setup.md) to create and set up environment and solution branches in the Azure DevOps repository.

>[!NOTE]
>If this is your first build pipeline, you'll need to set pipeline variables for your environment. At a minimum, you'll need to set the **ServiceConnection** variable to the environment you've set up for validation, test, and production.

### Read more

- [Use the ALM Accelerator for Power Platform app](../../almacceleratorpowerplatform-components.md): An overview of the ALM accelerator
- [Configuring deployment user settings and profiles](../../setup-almacceleratorpowerplatform-deployment-profiles.md): The deployment experience and profile setup
- [Configuring user permissions](../../setup-almacceleratorpowerplatform-users.md): Configuring Microsoft Dataverse users to access the ALM Accelerator for Power Platform app
- Manual setup—understand the key steps that the CLI is automating:
  - [Foundational setup](../../setup-almacceleratorpowerplatform.md#foundational-setup): The foundational steps automated by the CLI install command.
  - [Development project setup](../../setup-almacceleratorpowerplatform.md#development-project-setup): The manual steps that are automated by the CLI install command
  - [Solution setup](../../setup-almacceleratorpowerplatform.md#solution-setup): The manual steps to set up Azure DevOps that are performed by the CLI install command
  - [Importing the solution](../../setup-almacceleratorpowerplatform.md#importing-the-solution-and-configuring-the-app): The manual steps to import the managed solution that are performed by the CLI install command
- [Configuration and data deployment in pipelines](../../setup-almacceleratorpowerplatform-deployment-config.md): Configuring solution assets for the deployment, for example connection references, environment variables, and sharing
- [Configuring pipeline sync](../../setup-almacceleratorpowerplatform-pipeline-sync.md): Creating a pipeline to sync the latest YAML from the CoE Starter Kit GitHub repo

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
