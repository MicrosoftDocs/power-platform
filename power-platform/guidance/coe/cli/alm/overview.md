---
title: "CoE CLI ALM accelerator for Microsoft Power Platform"
description: "Overview of the Center of Excellence (CoE) command-line interface (CLI) ALM accelerator commands"
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

# CoE CLI ALM accelerator for Microsoft Power Platform

You can use the CLI application lifecycle management (ALM) accelerator for Microsoft Power Platform to manage common ALM tasks to install, set up, and administer the ALM accelerator for Microsoft Power Platform. This article contains:

- [Quick start](#quick-start) guides you through the process of a [demo tenant installation](./scenarios/tenant-deployments.md#demonstration-deployment).
- [Understand the concepts](#understand-the-concepts) covers scenarios, personas, key concepts, and the installation process of using the Center of Excellence (CoE) CLI.

## Prerequisites

To set up the ALM accelerator for Microsoft Power Platform, you'll need to first [install the CoE CLI](../install.md).

## Quick start

For an administrator, the quick start guide should take about 30 minutes. By the guide's end, you will have configured Azure Active Directory (Azure AD), Azure DevOps, and the Microsoft Power Platform environments.

1. Validate the organization's [maturity model](./maturity/overview.md#quick-start) for ALM.

1. Create your [Microsoft Power Platform environments](./before-you-start.md#power-platform), [Azure DevOps](./before-you-start.md#azure-devops) organization, and Azure DevOps project.

1. Create an installation configuration. Review the [installation help](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) for installation parameters.

   ```bash
   coe alm generate install -o quickstart.json
   ```

   This command generates a JSON configuration file similar to the following. Replace **contoso** with your tenant name.<!--note from editor: Edit okay? It seems like this would be necessary, not just a good idea.If you don't like it, it should be "you can" because style guide says "Don't substitute could for can unless you're referring to the past."-->

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
   "endpoint": "prod"
   }
   ```

   More information: [CoE ALM generate install](https://aka.ms/coe-cli/help/alm/generate/install) command

1. Install the ALM accelerator by using the generated configuration file.

   ```bash
   coe alm install -f quickstart.json
   ```

   More information: [CoE ALM install](https://aka.ms/coe-cli/help/alm/install)

   Deploying to your enterprise? For more information, go to [Enterprise deployment](./scenarios/tenant-deployments.md#enterprise-deployment).

   If you're prompted to create an HTTP with Azure Active Directory (AD) connection, enter **https&semi;\/\/graph&period;microsoft&period;com** for both the **Base Resource URL** and **Azure AD Resource URI**.

1. [Update permissions for the project build service](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#update-permissions-for-the-project-build-service) to enable build pipelines to interact with Git repositories.

1. When your makers create [development environments](./development-environments.md), run `CoE ALM maker add` to add the makers to Azure DevOps and share the ALM Accelerator for Power Platform canvas app.

   ```bash
   coe alm maker add 
      -o https://dev.azure.com/contoso 
      -p alm-sandbox 
      -e https://contoso-userdev.crm.dynamics.com 
      -a ALMAcceleratorServicePrincipal 
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

Not sure what ALM is and how it can help? [Use the ALM accelerator for Microsoft Power Platform](/power-platform/guidance/coe/almacceleratorpowerplatform-components) provides further context and examples of usage.

### Getting started

- [Scenarios](./scenarios/overview.md) discusses different installation scenarios for ALM, from demo installations to enterprise deployments.
- [Personas](./personas.md) describes key personas and how they map to ALM CLI commands and the wider ALM process.
- [Key concepts](./key-concepts.md) describes the key concepts for the components that are being automated "under the hood" by the CLI commands.
- [Branching and merging](./branching-and-merging.md) provides examples of the branching and merging approach of using ALM.

### Sample installation

The following recording shows a sample generating an installation configuration file and installing ALM by using the configuration file in a [demo deployment](./scenarios/tenant-deployments.md#demonstration-deployment).<!--note from editor: This alt text isn't adequate for readers with low vision. How can this image be described so those readers can understand what's going on here? If this is sample code that's available somewhere, maybe the alt text could point to that location. When I follow the "demo deployment" link, I don't see this script anywhere, but perhaps it's available elsewhere?-->

![Example](./install.svg)

### Installation overview<a name="install-overview"></a>

1. Review [Before you start](./before-you-start.md) to ensure that you've created the required Microsoft Power Platform environments and Azure DevOps organizations.

1. As an administrator, complete the [admin installation](./admin-install.md).

1. Have makers create [development environments](./development-environments.md).

1. Use [maker setup](./maker-setup.md) to create and set up environment and solution branches in the Azure DevOps repository.

>[!Note]
>If this is your first build pipeline, you'll need to set pipeline variables for your environment. At a minimum, you'll need to set the **ServiceConnection** variable to the environment you've set up for validation, test, and production.

### Read more

- [Use the ALM Accelerator for Power Platform app](/power-platform/guidance/coe/almacceleratorpowerplatform-components): An overview of the ALM accelerator
- [Configuring deployment user settings and profiles](/power-platform/guidance/coe/setup-almacceleratorpowerplatform-deployment-profiles): The deployment experience and profile setup
- [Configuring user permissions](/power-platform/guidance/coe/setup-almacceleratorpowerplatform-users): Configuring Microsoft Dataverse users to access the ALM Accelerator for Power Platform app
- Manual setup—understand the key steps that the CLI is automating:
  - [Foundational setup](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#foundational-setup): The foundational steps automated by the CLI install command.
  - [Development project setup](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#development-project-setup): The manual steps that are automated by the CLI install command
  - [Solution setup](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#solution-setup): The manual steps to set up Azure DevOps that are performed by the CLI install command
  - [Importing the solution](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#importing-the-solution-and-configuring-the-app): The manual steps to import the managed solution that are performed by the CLI install command
- [Configuration and data deployment in pipelines](/power-platform/guidance/coe/setup-almacceleratorpowerplatform-deployment-config): Configuring solution assets for the deployment, for example connection references, environment variables, and sharing
- [Configuring pipeline sync](/power-platform/guidance/coe/setup-almacceleratorpowerplatform-pipeline-sync): Creating a pipeline to sync the latest YAML from the CoE Starter Kit GitHub repo

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
