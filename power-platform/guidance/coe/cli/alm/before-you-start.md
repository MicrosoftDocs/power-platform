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
> The CoE CLI is deprecated and will be removed in a future release. Please use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

Before you start an install of ALM Accelerator, ensure that you have the following components in place.

## CoE command line

Install the CoE CLI [locally](../install.md#local-install) or via a [docker image](../install.md#docker-install).

## Power Platform

Environment | Description
----------- | -------------
Developer | Development environments that each maker uses to create and manage source-controlled solutions.
ALM environment | Environment with Microsoft Dataverse enabled. This environment will be used to deploy managed solution.
ALM environment - Dataverse connection | Learn more: [Create the Dataverse connection](#maker-environment-dataverse-connection).
Validation | Environment used to validate builds before merging into a solution branch.              |
Test | Pre-production environment used to test solutions before moving to production.          |
Production | Production environment for managed solutions.                                         |

Notes:

1. As a Microsoft Partner you can request access to demo tenants to test ALM Accelerators for Power Platform.
   1. Visit [Partner Center](/partner-center/mpn-demos) for more information.
   1. Go to [https://demos.microsoft.com](https://demos.microsoft.com) to request a new environment.
   1. Select **My Environments**.
   1. Select **Create Tenant**.
   1. Select tenant location.
   1. Select the **Dynamics 365 Customer Engagement** content pack.

1. Sample environment from [https://admin.powerplatform.microsoft.com/environments](https://admin.powerplatform.microsoft.com/environments) for a [Demo Deployment](./scenarios/tenant-deployments.md#demonstration-deployment).

   ![Sample image Environments from Power Platform Admin Portal](../media/environments.jpg)

## Maker environment Dataverse connection

In the maker environment, you need a Dataverse connection created by the install user.

To create the Dataverse connection, use the following steps:

1. Go to [https://make.powerapps.com/](https://make.powerapps.com/).

1. Select the maker environment that you deploy the ALM Accelerator for Power Platform into.

1. Go to **Data** > **Connections**.

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

The following components are set up or used as part of the install and follow on [coe alm branch](https://aka.ms/coe-cli/help/alm/branch).

Component | Description
--------- | ----------
Extensions | Review the [extensions configuration](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/config/AzureDevOpsExtensionsDetails.json) that is installed.
Repository | Ensure the git repository has been initialized with an initial commit.

Notes:

1. If installing using demo tenant, you can request a trial Azure DevOps environment.

   - [https://azure.microsoft.com/services/devops/](https://azure.microsoft.com/services/devops/)

   - Select **Start free**.

   - Create an initial project, for example, *alm-sandbox*.

1. Review the Azure [DevOps Extensions](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/config/AzureDevOpsExtensionsDetails.json) that the CLI application installs to ensure your organization gives consent for them to be installed.
   - [Power Platform Build Tools](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools)

   - [Power DevOps Tools](https://marketplace.visualstudio.com/items?itemName=WaelHamze.xrm-ci-framework-build-tasks)

   - [RegexReplace Azure Pipelines Task](https://marketplace.visualstudio.com/items?itemName=knom.regexreplace-task)
  
   - [SARIF SAST Scans Tab](https://marketplace.visualstudio.com/items?itemName=sariftools.scans)

## Read next

Once you've verified the configuration:

1. Determine the install [deployment scenario](./scenarios/overview.md) you're targeting.

1. Complete the [Administration install](./admin-install.md).

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
