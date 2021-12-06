---
title: "Center of Excellence (CoE) Command Line Interface (CLI) Application Lifecycle Management (ALM) Accelerator Before you start"
description: "Key prerequisites and requirements for the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
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

# Before You Start

Before you start an install of ALM ensure that you have the following in place

## CoE Command Line

Install the CoE CLI [locally](../install.md#local-install) or via a [docker image](../install.md#docker-install)

## Power Platform

Environment | Description
----------- | -------------
Developer | Development environments that each Advanced Maker will use to create and manage source controlled solutions
ALM Environment | Environment with Dataverse enabled. Will be used to deploy managed solution.
ALM Environment - Dataverse Connection | See [Maker Environment Dataverse](#maker-environment-dataverse) below to create the Dataverse Connection
Validation | Environment used to validate builds before merging into a solution branch              |
Test | Preproduction Environment used to test solutions before moving to production          |
Production | Production Environment for managed solutions                                          |

Notes:

1. As a Microsoft Partner you can request access to demo tenants to test ALM Accelerators for Power Platform
   1) Visit [Partner Center](/partner-center/mpn-demos) for more information
   2) Go to [https://demos.microsoft.com](https://demos.microsoft.com) to request a new environment
   3) Select My Environments
   4) Select Create Tenant
   5) Select tenant location
   6) Select "Dynamics 365 Customer Engagement"

1. Sample environment from [https://admin.powerplatform.microsoft.com/environments](https://admin.powerplatform.microsoft.com/environments) for a [Demo Deployment](./scenarios/tenant-deployments.md#demonstration-deployment)

   ![Sample image Environments from Power Platform Admin Portal](../media/environments.jpg)

## Maker Environment Dataverse

In the maker environment you will need a Dataverse connection to be created by the install user.

This can be done using the following steps:

1. Go to [https://make.powerapps.com/](https://make.powerapps.com/)

2. Select your maker environment that you will deploy the ALM Accelerator for Power Platform into

3. Navigate to Data -> Connections

4. New Connection

5. Microsoft Dataverse (legacy)

6. Select Create

### Azure

Ensure the user you run with has the following permissions

Component | Description
--------- | ----------
Global Administrator or Privileged Role Administrator|Grant tenant-wide admin consent to an application [Read More](/azure/active-directory/manage-apps/grant-admin-consent)

### Azure DevOps

The following must be installed before the CoE CLI ALM install can begin

Component | Description
--------- | ----------
Organization | Review [Add Organization Users](/azure/devops/organizations/accounts/add-organization-users) to create Azure DevOps organization and add users
Project | An Azure DevOps project to integrate with. This guide uses the name **alm-sandbox** as the project name

The following will be setup or used as part of the install and follow on [coe alm branch](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/branch.md)

Component | Description
--------- | ----------
Extensions | Review the [extensions configuration](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/config/AzureDevOpsExtensionsDetails.json) that will be installed
Repository | Ensure the git repository has been initialized with an initial commit

Notes:

1. If installing using demo tenant you can request a trial Azure DevOps environment

   - [https://azure.microsoft.com/services/devops/](https://azure.microsoft.com/services/devops/)

   - Create Organization

   - Create initial project e.g. alm-sandbox

1. Review the Azure [DevOps Extensions](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/config/AzureDevOpsExtensionsDetails.json) that will be installed by the CLI application to ensure your organization gives consent for them to be installed.
   - [Power Platform Build Tools](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools)

   - [Power DevOps Tools](https://marketplace.visualstudio.com/items?itemName=WaelHamze.xrm-ci-framework-build-tasks)

   - [RegexReplace Azure Pipelines Task](https://marketplace.visualstudio.com/items?itemName=knom.regexreplace-task)
  
   - [SARIF SAST Scans Tab](https://marketplace.visualstudio.com/items?itemName=sariftools.scans)

## Read Next

Once you have verified the above

1. Determine the install [deployment scenario](./scenarios/overview.md) you are targeting

1. Complete the [Administration Install](./admin-install.md)
