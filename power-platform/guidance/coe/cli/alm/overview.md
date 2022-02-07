---
title: "CoE CLI ALM Accelerator for Power Platform"
description: "Overview of the Center of Excellence (CoE) Command Line Interface (CLI) Application Lifecycle Management (ALM) Accelerator commands"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 11/30/2021
ms.service: power-platform
ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# CoE CLI ALM Accelerator for Power Platform

The CLI ALM Accelerator for Power Platform allows you to manage common application lifecycle management (ALM) tasks to install, set up, and administer the ALM Accelerator for Power Platform.

- [Quick start](#quick-start) - Guides you through the process of a [demo tenant install](./scenarios/tenant-deployments.md#demonstration-deployment).
- [Understand the concepts](#understand-the-concepts) - Covers scenarios, personas, key concepts, and the install process using the CoE CLI.

## Prerequisites

In order to set up the ALM Accelerator for Power Platform, you'll need to first [install the CoE CLI](../install.md).

## Quick start

For an administrator, the quick start guide should take about 30 minutes. By the guide's end you will have configured Azure Active Directory, Azure DevOps, and the Power Platform environments.

1. Validate organization [maturity model](./maturity/overview.md#quick-start) for ALM.

1. Create your [Power Platform environments](./before-you-start.md#power-platform) and [Azure DevOps](./before-you-start.md#azure-devops) organization and Azure DevOps project.

1. Create an install configuration. Review the [install help](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) for install parameters.

   ```bash
   coe alm generate install -o quickstart.json
   ```

   This command generates a json configuration file similar to the following. You could replace **contoso** with your tenant name.

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

1. Install the ALM Accelerator using the generated configuration file.

   ```bash
   coe alm install -f quickstart.json
   ```

   More information: [CoE ALM install](https://aka.ms/coe-cli/help/alm/install)

   Deploying to your enterprise? For more information, go to [Enterprise deployment](./scenarios/tenant-deployments.md#enterprise-deployment).

   If you're prompted to create an HTTP with Azure Active Directory (AD) connection, enter 'https://graph.microsoft.com' for both the **Base Resource URL** and **Azure AD Resource URI**.

1. [Update permissions for the project build service](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#update-permissions-for-the-project-build-service) to enable build pipelines to interact with Git Repositories.

1. When your makers create [development environments](./development-environments.md), run CoE ALM maker add to add the makers to Azure DevOps and share the ALM Accelerator canvas app.

   ```bash
   coe alm maker add 
      -o https://dev.azure.com/contoso 
      -p alm-sandbox 
      -e https://contoso-userdev.crm.dynamics.com 
      -a ALMAcceleratorServicePrincipal 
      -g ALMAcceleratorForMakers -u user@contoso.com
   ```

   More information: [CoE ALM maker add](https://aka.ms/coe-cli/help/alm/maker/add)

   You can also generate a user configuration file. Using this approach will allow you to explore each parameter and review the settings before adding the maker.

   ```bash
   coe alm generate maker add -o user.config
   coe alm maker add -f user.config
   ```

   More information: [CoE ALM generate maker add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/generate/maker/add.md)

## Understand the concepts

Not sure what ALM is and how it can help? The [User Guide](/power-platform/guidance/coe/almacceleratorpowerplatform-components) provides further context and examples of usage.

### Getting started

- [Scenarios](./scenarios/overview.md) - Discusses different install scenarios for ALM from demo installs to enterprise deployments.
- [Personas](./personas.md) - Understand the key personas and how they map to ALM CLI commands and the wider ALM process.
- [Key Concepts](./key-concepts.md) - Understand the key concepts for the components that are being automated under the hood by the CLI commands.
- [Branching and merging](./branching-and-merging.md) - Provides examples of branching and merging approach using ALM.

### Sample install

The following recording shows a sample generating an install configuration file and installing ALM using the configuration file using a [demo deployment](./scenarios/tenant-deployments.md#demonstration-deployment).

![Example](./install.svg)

### Install overview

1. Review the [Before you start](./before-you-start.md) to ensure you have the required Power Platform environments and Azure DevOps organizations created.

1. As an administrator, complete the [Admin install](./admin-install.md).

1. Have makers create [development environments](./development-environments.md).

1. Use [Maker set up](./maker-setup.md) to create and set up environment and solution branches in the Azure DevOps repository.

>[!Note]
>If this is your first build pipeline, you'll need to set pipeline variables for your environment. At a minimum, you'll need to set **ServiceConnection** variable to your environment you have set up for validation, test, and production.

### Read more

- [ALM Accelerator for Power Platform](/power-platform/guidance/coe/almacceleratorpowerplatform-components) - An overview of the ALM Accelerator.
- [Deployment experience and profile set up](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-deployment-profiles) - Configuring user settings and deployment profiles.
- [User permissions set up](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-users) - Configuring Microsoft Dataverse users to access the ALM Accelerator for Power Platform.
- Manual set up - Understand the key steps that the CLI is automating.
  - [Foundational set up](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#foundational-setup) - Foundational set up for manual steps automated by the CLI install command.
  - [Development project set up](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#development-project-setup) - Documents the manual steps that are automated by the CLI install command.
  - [Solution set up](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#solution-setup) - Documents the manual steps to set up Azure DevOps that are performed by the CLI install command.
  - [Importing solution](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#importing-the-solution-and-configuring-the-app) - Documents the manual steps to import the managed solution that are performed by the CLI install command.
- [Deployment configuration settings](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-deployment-config) - Configuring solution assets for the deployment. For example, connection references, environment variables, and sharing.
- [Pipeline sync set up](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-pipeline-sync) - Creating a pipeline to sync the latest YAML from the CoE Starter Kit GitHub repo.

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
