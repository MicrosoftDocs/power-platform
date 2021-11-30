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

The cli alm command allows you to manage common Application Lifecycle Management (ALM) tasks to install, setup and administration of Power Platform Solutions.

- [Quick Start](#quick-start) - Guides you through the process of a [demo tenant install](./scenarios/tenant-deployments.md#demonstration-deployment)
- [Understand the Concepts](#understand-the-concepts) - Covers Scenarios, Personas and Key Concepts and the install process using the CoE CLI

## Quick Start

For an Administrator the quick start guide should take around 30 minutes and by the end have configured Azure Active Directory, Azure DevOps and the Power Platform environments.

1. Validate organization [maturity model](./maturity/overview.md#quick-start) for ALM

1. Create your [Power Platform Environments](./before-you-start.md#power-platform) and [Azure DevOps](./before-you-start.md#azure-devops) Organization and Azure DevOps project.

1. Create an install configuration. Review the [install help](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) for install parameters

```bash
coe alm generate install -o quickstart.json
```

   More information on the [coe alm generate install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/generate/install.md) command

1. Install the ALM Accelerator using the generated configuration file

```bash
coe alm install -f quickstart.json
```

   More information on the [coe alm install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) command

   Deploying to your enterprise? Refer to [Enterprise Deployment](./scenarios/tenant-deployments.md#enterprise-deployment) for further information.

1. [Update permissions for the project build service](https://github.com/microsoft/coe-starter-kit/blob/main/ALMAcceleratorForAdvancedMakers/SETUPGUIDE.md#update-permissions-for-the-project-build-service) to enable build pipelines to interact with Git Repositories

1. Have  Makers create [development environments](./development-environments.md) then Add Makers to Azure DevOps and share the Canvas Application

```bash
coe alm maker add \
   -o https://dev.azure.com/contoso \
   -p alm-sandbox \
   -e https://contoso-userdev.crm.dynamics.com \
   -a alm-ado-service-principal \
   -g alm-makers -u user@contoso.com
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

Not sure what AA4AM is and how it can help? The main GitHub project [README](https://github.com/microsoft/coe-starter-kit/blob/main/ALMAcceleratorForAdvancedMakers/README.md) provides further context and examples of usage.

### Getting Started

- [Scenarios](./scenarios/overview.md) - Discusses different install scenarios for AA4AM from Demo Installs to Enterprise Deployments
- [Personas](./personas.md) - Understand the key personas and how they map to AA4AM CLI commands and the wider AA4AM process
- [Key Concepts](./key-concepts.md) - Understand the key concepts for the components that are being automated under the hood by the CLI commands
- [Branching and Merging](./branching-and-merging.md) - Provides examples of branching and merging approach using AA4AM

### Overview

The diagram below provides an overview of the key components required and permissions required.

![ALM Accelerator for Power Platform Overview](../media/alm-overview.jpg)

### Sample Install

The following recording shows a sample generating an install configuration file and installing AA4AM using the configuration file using a [Demo Deployment](./scenarios/tenant-deployments.md#demonstration-deployment).

![Example](./install.svg)

### Install Overview

1. Review the [Before You Start](./before-you-start.md) to ensure you have the required Power Platform environments and Azure DevOps organizations created

2. As an administrator completes the [Admin Install](./admin-install.md)

3. Have Makers create [Development Environments](./development-environments.md)

4. Use [Maker Setup](./maker-setup.md) to create and setup environment and solution branches in the Azure DevOps repository.

Notes:

1. If this is your first build pipeline you will need to set Pipeline Variables for your environment. At a minimum, you will need to set **ServiceConnection** variable to your environment you have setup for validation, test and production.

### Read Next

- [ALM Accelerator for Power Platform](https://github.com/microsoft/coe-starter-kit/tree/main/ALMAcceleratorForAdvancedMakers) - Overview for AA4AM
- Manual Setup - Understand the key steps that the CLI is automating
  - [Foundational Setup](https://github.com/microsoft/coe-starter-kit/blob/main/ALMAcceleratorForAdvancedMakers/SETUPGUIDE.md#foundational-setup) - Foundational Setup for Manual steps automated by the CLI install command
  - [Development Project Setup](https://github.com/microsoft/coe-starter-kit/blob/main/ALMAcceleratorForAdvancedMakers/SETUPGUIDE.md#development-project-setup) - Documents the Manual steps that are automated by the CLI install command
  - [Solution Setup](https://github.com/microsoft/coe-starter-kit/blob/main/ALMAcceleratorForAdvancedMakers/SETUPGUIDE.md#solution-setup) - Documents the manual steps to setup Azure DevOps that are performed by the CLI install command
  - [Importing Solution](https://github.com/microsoft/coe-starter-kit/blob/main/ALMAcceleratorForAdvancedMakers/SETUPGUIDE.md#importing-the-solution-and-configuring-the-app) - Documents the manual steps to import the managed solution that are performed by the CLI install command
