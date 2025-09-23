---
title: "CoE ALM Accelerator for Power Platform before you start (Deprecated)"
description: "Discover essential prerequisites and requirements before installing the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)."
author: Grant-Archibald-MS
ms.author: grarchib
ms.date: 09/26/2024
ms.update-cycle: 3650-days
ms.subservice: guidance-toolkit
ms.topic: concept-article
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom:
  - ""
  - sfi-ga-nochange
---

# CoE ALM Accelerator for Power Platform before you start (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

Before you start an install of ALM Accelerator, ensure that you have the following components in place.

## CoE command line

Install the CoE CLI [locally](../install.md#local-install) or via a [docker image](../install.md#docker-install).

## Power Platform environment prerequisites

Environment | Description
----------- | -------------
Developer | Development environments that each maker uses to create and manage source-controlled solutions.
ALM environment | Environment with Microsoft Dataverse enabled. This environment will be used to deploy a managed solution.
Validation | Environment used to validate builds before merging into a solution branch.              |
Test | Pre-production environment used to test solutions before moving to production.          |
Production | Production environment for managed solutions.                                         |

### Azure

Ensure the user you run with has the following permissions.

Component | Description
--------- | ----------
Privileged role administrator|Grant tenant-wide admin consent to an application. More information:[Grant admin consent](/azure/active-directory/manage-apps/grant-admin-consent)

### Azure DevOps

The following components must be installed before the CoE CLI ALM install can begin.

Component | Description
--------- | ----------
Organization | Review [Add organization users](/azure/devops/organizations/accounts/add-organization-users) to create Azure DevOps organization and add users.
Project | An Azure DevOps project to integrate with. This guide uses the name **alm-sandbox** as the project name.

The following components are set up or used as part of the install and follow the [CoE ALM branch](https://aka.ms/coe-cli/help/alm/branch).

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

After you've verified the configuration:

1. Determine the install [deployment scenario](./scenarios/overview.md) you're targeting.

1. Complete the [Administration install](./admin-install.md).

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
