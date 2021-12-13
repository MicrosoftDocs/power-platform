---
title: "Center of Excellence (CoE) Command Line Interface (CLI) Application Lifecycle Management (ALM) Accelerator"
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

# ALM Accelerator for Power Platform

The cli alm command allows you to manage common Application Lifecycle Management (ALM) tasks to install, setup, and administration of Power Platform Solutions.

- [Quick Start](#quick-start) - Guides you through the process of a [demo tenant install](./scenarios/tenant-deployments.md#demonstration-deployment)
- [Understand the Concepts](#understand-the-concepts) - Covers Scenarios, Personas, and Key Concepts and the install process using the CoE CLI

## Quick Start

For an Administrator, the quick start guide should take around 30 minutes and by the end have configured Azure Active Directory, Azure DevOps, and the Power Platform environments.

1. Validate organization [maturity model](./maturity/overview.md#quick-start) for ALM

1. Create your [Power Platform Environments](./before-you-start.md#power-platform) and [Azure DevOps](./before-you-start.md#azure-devops) Organization and Azure DevOps project.

1. Create an install configuration. Review the [install help](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) for install parameters

```bash
coe alm generate install -o quickstart.json
```

   This command will generate a json configuration file similar to the following. You could replace **contoso** with your tenant name

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

   More information on the [coe alm generate install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/generate/install.md) command

1. Install the ALM Accelerator using the generated configuration file

```bash
coe alm install -f quickstart.json
```

   More information on the [coe alm install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) command

   Deploying to your enterprise? For more information, see [Enterprise Deployment](./scenarios/tenant-deployments.md#enterprise-deployment).

1. [Update permissions for the project build service](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#update-permissions-for-the-project-build-service) to enable build pipelines to interact with Git Repositories

1. Have  Makers create [development environments](./development-environments.md) then Add Makers to Azure DevOps and share the Canvas Application

```bash
coe alm maker add \
   -o https://dev.azure.com/contoso \
   -p alm-sandbox \
   -e https://contoso-userdev.crm.dynamics.com \
   -a ALMAcceleratorServicePrincipal \
   -g ALMAcceleratorForMakers -u user@contoso.com
```

   More information on the [coe alm maker add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/maker/add.md) command

   You can also generate a user configuration file. Using this approach will allow you to explore each parameter and review the settings before adding the maker.

```bash
coe alm generate maker add -o user.config
coe alm maker add \
   -f user.config
```

   More information on the [coe alm generate maker add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/generate/maker/add.md) command

## Understand the Concepts

Not sure what ALM is and how it can help? The [User Guide](/power-platform/guidance/coe/almacceleratorpowerplatform-components) provides further context and examples of usage.

### Getting Started

- [Scenarios](./scenarios/overview.md) - Discusses different install scenarios for ALM from Demo Installs to Enterprise Deployments
- [Personas](./personas.md) - Understand the key personas and how they map to ALM CLI commands and the wider ALM process
- [Key Concepts](./key-concepts.md) - Understand the key concepts for the components that are being automated under the hood by the CLI commands
- [Branching and Merging](./branching-and-merging.md) - Provides examples of branching and merging approach using ALM

### Overview

### Sample Install

The following recording shows a sample generating an install configuration file and installing ALM using the configuration file using a [Demo Deployment](./scenarios/tenant-deployments.md#demonstration-deployment).

![Example](./install.svg)

### Install Overview

1. Review the [Before You Start](./before-you-start.md) to ensure you have the required Power Platform environments and Azure DevOps organizations created

2. As an administrator completes the [Admin Install](./admin-install.md)

3. Have Makers create [Development Environments](./development-environments.md)

4. Use [Maker Setup](./maker-setup.md) to create and set up environment and solution branches in the Azure DevOps repository.

>[!Note]
>If this is your first build pipeline, you'll need to set Pipeline Variables for your environment. At a minimum, you'll need to set **ServiceConnection** variable to your environment you have setup for validation, test, and production.

### Read Next

- [ALM Accelerator for Power Platform](/power-platform/guidance/coe/almacceleratorpowerplatform-components) - An overview of the ALM Accelerator.
- [Deployment Profile Setup](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-deployment-profiles) - Configuring User Settings and Deployment Profiles.
- Manual Setup - Understand the key steps that the CLI is automating.
  - [Foundational Setup](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#foundational-setup) - Foundational Setup for Manual steps automated by the CLI install command.
  - [Development Project Setup](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#development-project-setup) - Documents the Manual steps that are automated by the CLI install command.
  - [Solution Setup](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#solution-setup) - Documents the manual steps to set up Azure DevOps that are performed by the CLI install command.
  - [Importing Solution](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#importing-the-solution-and-configuring-the-app) - Documents the manual steps to import the managed solution that are performed by the CLI install command.
- [Deployment Configuration Settings](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-deployment-config) - Configuring solution assets for the deployment (for example, Connection References, Envionment Variables and Sharing).
- [Pipeline Sync Setup](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-pipeline-sync) - Creating a pipeline to sync the latest YAML from the CoE Starter Kit GitHub repo.
- [Sample Solution Setup](/power-platform/power-platform/guidance/coe/setup-almacceleratorpowerplatform-sample-solution) - Getting started with a Sample Solution using the ALM Accelerator for Power Platform.

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
