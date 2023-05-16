---
title: "CoE ALM Accelerator for Power Platform before you start (Deprecated)"
description: "Key prerequisites and requirements for the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 11/30/2021

ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---

# CoE ALM Accelerator for Power Platform before you start (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Please use the [Power Platform Project Setup Wizard](/power-platform/guidance/alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

Before you start an install of ALM Accelerator, ensure that you've the following components in place.

## CoE command line

Install the CoE CLI [locally](../install.md#local-install) or via a [docker image](../install.md#docker-install).

## Power Platform

Environment | Description
----------- | -------------
Developer | Development environments that each maker will use to create and manage source-controlled solutions.
ALM environment | Environment with Microsoft Dataverse enabled. Will be used to deploy managed solution.
ALM environment - Dataverse connection | See [Maker environment Dataverse](#maker-environment-dataverse-connection) below to create the Dataverse connection.
Validation | Environment used to validate builds before merging into a solution branch.              |
Test | Pre-production environment used to test solutions before moving to production.          |
Production | Production environment for managed solutions.                                         |

Notes:

1. As a Microsoft Partner you can request access to demo tenants to test ALM Accelerators for Power Platform.
   1) Visit [Partner Center](/partner-center/mpn-demos) for more information.
   2) Go to [https://demos.microsoft.com](https://demos.microsoft.com) to request a new environment.
   3) Select **My Environments**.
   4) Select **Create Tenant**.
   5) Select tenant location.
   6) Select the **Dynamics 365 Customer Engagement** content pack.

1. Sample environment from [https://admin.powerplatform.microsoft.com/environments](https://admin.powerplatform.microsoft.com/environments) for a [Demo Deployment](./scenarios/tenant-deployments.md#demonstration-deployment).

   ![Sample image Environments from Power Platform Admin Portal](../media/environments.jpg)

## Maker environment Dataverse connection

In the maker environment, you'll need a Dataverse connection created by the install user.

To create the Dataverse connection, use the following steps:

1. Go to [https://make.powerapps.com/](https://make.powerapps.com/).

1. Select the maker environment that you'll deploy the ALM Accelerator for Power Platform into.

1. Go to to **Data** > **Connections**.

1. Select **New Connection**.

1. Select **Microsoft Dataverse (legacy)**.

1. Select Create.

### Azure

Ensure the user you run with has the following permissions.

Component | Description
--------- | ----------
Global administrator or privileged role administrator|Grant tenant-wide admin consent to an application. More information:[Grant admin consent](/azure/active-directory/manage-apps/grant-admin-consent)

### Azure DevOps

The following components must be installed before the CoE CLI ALM install can begin.

Component | Description
--------- | ----------
Organization | Review [Add organization users](/azure/devops/organizations/accounts/add-organization-users) to create Azure DevOps organization and add users.
Project | An Azure DevOps project to integrate with. This guide uses the name **alm-sandbox** as the project name.

The following is set up or used as part of the install and follow on [coe alm branch](https://aka.ms/coe-cli/help/alm/branch).

Component | Description
--------- | ----------
Extensions | Review the [extensions configuration](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/config/AzureDevOpsExtensionsDetails.json) that will be installed.
Repository | Ensure the git repository has been initialized with an initial commit.

Notes:

1. If installing using demo tenant, you can request a trial Azure DevOps environment.

   - [https://azure.microsoft.com/services/devops/](https://azure.microsoft.com/services/devops/)

   - Select **Start free**.

   - Create an initial project, for example, *alm-sandbox*.

1. Review the Azure [DevOps Extensions](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/config/AzureDevOpsExtensionsDetails.json) that will be installed by the CLI application to ensure your organization gives consent for them to be installed.
   - [Power Platform Build Tools](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools)

   - [Power DevOps Tools](https://marketplace.visualstudio.com/items?itemName=WaelHamze.xrm-ci-framework-build-tasks)

   - [RegexReplace Azure Pipelines Task](https://marketplace.visualstudio.com/items?itemName=knom.regexreplace-task)
  
   - [SARIF SAST Scans Tab](https://marketplace.visualstudio.com/items?itemName=sariftools.scans)

## Read next

Once you've verified the above:

1. Determine the install [deployment scenario](./scenarios/overview.md) you're targeting.

1. Complete the [Administration install](./admin-install.md).

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
