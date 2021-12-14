---
title: "Center of Excellence (CoE) Command Line Interface (CLI) Application Lifecycle Management (ALM) Accelerator maker setup"
description: "Summary of how to add a maker to the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
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

# Maker Setup

The first step is to ensure that the maker and an environment to build and manage solutions. Normally each maker has a unique [development environment](./development-environments.md) created. Having successfully gained access to a development environment the commands below allow either a Power Platform administrator or a Maker to perform the following tasks:

1. [Set up Service Principal](#setup-service-principal) - Provide access to the Service Principal used by the Azure DevOps Pipeline

1. [Maker Create Solution](#maker-create-solution) - Create a solution branch in the Azure DevOps repository.

## Set up Service Principal

The ALM Accelerator for Power Platform uses the created Azure Active Directory Service Principal to connect to environments and import and export the solutions. The user add command enables the ALM Accelerator to access each environment. The user add command adds the service principal as a user and assigned the System Administrator role to an environment.

1. Log out of any existing sessions if not the maker or a Power Platform tenant Administrator

```bash
az logout

```

1. Add the Service Principal to the environment

```bash
coe alm user add -e https://contoso-dev-user1.crm.dynamics.com
```

More information on the [coe alm user add](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/user/add.md) command

## Maker Create Solution

Power Platform solutions managed by the ALM Accelerator require a branch to be created in an Azure DevOps Repository. This branch called a "solution branch" allows the maker to build and test changes. Once changes have been verified, they can then be merged back into the main branch to deploy to production. The branch command creates a solution branch in Azure DevOps and configures the required Azure Pipelines for the created branch.

1. Switch to Developer Environment

1. Create new solution, for example,  NewSolution1

1. Add items to the solution. For example

   a. Select Solution

   b. Add Canvas Application

   c. Add Button

   d. Save Application and Close

1. Create Solution branch using the following CLI command

```bash
coe alm branch \
  -o https://dev.azure.com/dev12345 \
  -p alm-sandbox \
  -d MySolution1

```

More information on the [coe alm branch](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/branch.md) command

NOTES:

1. **-o** is the name of your DevOps Organization

1. **-p** is the name of the Azure DevOps Project

1. **-d** is the name of the solution branch to create

1. If the repository you want to create a branch for is empty, you'll need to commit an initial commit before a branch can be created.

1. Open ALM Accelerator for Advanced Maker Application

1. Select Push change to Git

   a. Create New Branch, for example,  MySolution1-WIP

   b. An existing solution Branch, for example MySolution1

   c. Add a comment, for example "Initial version"

1. Select Latest Push Status

   a. Permit permissions for pipeline to run (Variable Group, Service Connection, Pipeline)

## Post Setup Checks

After setting up an advanced maker, you may need to verify the following setup is correctly configured:

1. If this branch is the first branch you've created, you'll need to check variables applied for the created pipeline

1. The first time that each pipeline is run from the administration application you'll need to open the pipeline in Azure DevOps and approve the resources used by the pipeline.

1. Select the blue icon for the Azure DevOps Build in the application

   ![Latest Push Status](../media/latest-push-status.jpg)

1. Check if there's a message similar to the screenshot below that requires approval of the pipeline to run

   ![Azure DevOps Permissions](../media/devops-pipeline-permissions.jpg)

1. If necessary, select "View" and permit the build pipeline to access the required resources (Variable group. Repository and Service Connection)

   ![Azure DevOps Permit](../media/devops-pipeline-permit.jpg)

NOTES:

1. If you're using a free Azure Subscription, you may receive error "No hosted parallelism has been purchased or granted.". To resolve this issue visit [https://aka.ms/azpipelines-parallelism-request](https://aka.ms/azpipelines-parallelism-request) to request Azure Pipeline build compute

### Read Next

- Complete the [Install Overview](./overview.md#install-overview)

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
