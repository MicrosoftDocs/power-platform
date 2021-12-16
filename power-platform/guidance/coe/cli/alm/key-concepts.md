---
title: "CoE ALM Accelerator for Power Platform key concepts"
description: "Key concepts related to ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
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


# CoE ALM Accelerator for Power Platform key concepts

As you deploy and use the ALM CLI, it's important to understand the following key concepts that the CLI is automating.

## Azure Active Directory

### Azure Active Directory application

The CoE CLI application can create an Azure Active Directory application that automates the following key steps:

1. User is authenticated via Azure CLI.
   - [Azure Login](/cli/azure/reference-index?#az_login)

1. Create an Azure Active Directory application using Azure CLI.
   - [Create AD Application](/cli/azure/ad/app?#az_ad_app_create)
   - [Create Service Principal](/cli/azure/ad/sp?#az_ad_sp_create)

1. Grant Tenant Consent for applications using Azure CLI.
   - [Permissions Admin Consent](/cli/azure/ad/app/permission?#az_ad_app_permission_admin_consent)

1. Azure Application granted rights via [manifest configuration file](https://github.com/microsoft/coe-starter-kit/blob/main/coe-cli/config/manifest.json) to call:
   - Azure DevOps
   - Dataverse
   - PowerApps Checker Module - [Read More](/powershell/powerapps/get-started-powerapps-checker)

1. Client secrets will be created for Azure DevOps Service connections.

   - Client secrets should have an established key rotation process to generate new keys for connections.

   - After new keys are generated, old keys should be removed.

### Azure Active Directory group

The CoE CLI application can create an Azure Active Directory group that is used for Azure DevOps and Power Platform authentication and role-based access security.

1. Group Created via Azure CLI.
   - [Create Group](/cli/azure/ad/group?#az_ad_group_create)

## Azure DevOps

### Install automation

The CoE CLI application assumes that an Azure DevOps organization and project have already been created.

The install performs the following key steps:

1. Install Azure DevOps Extensions defined in [AzureDevOpsExtensionsDetails.json](https://github.com/microsoft/coe-starter-kit/blob/main/coe-cli/config/AzureDevOpsExtensionsDetails.json).

   a. New extensions can be added from [https://marketplace.visualstudio.com/item](https://marketplace.visualstudio.com/item). Visit each extension and add the publisher and the **itemName** from the query string in the browser.

1. Clone Azure Templates [https://github.com/microsoft/coe-alm-accelerator-templates.git](https://github.com/microsoft/coe-alm-accelerator-templates.git) into an Azure DevOps git repository named **pipelines** by default.

1. Create Azure DevOps build pipelines.
  
   - [export-solution-to-git.yml](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/export-solution-to-git.yml) - Export a solution from a Dataverse environment and commit it to a git branch.

   - [import-unmanaged-to-dev-environment.yml](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/import-unmanaged-to-dev-environment.yml) - Import solution into Dataverse environment.

   - [delete-unmanaged-solution-and-components.yml](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/delete-unmanaged-solution-and-components.yml) - Delete or "clean up" an unmanaged solution from a Dataverse environment.

1. Set up Azure Active Group access the Azure DevOps project.

1. Create Variable Groups for shared variables used by build pipelines.

   - [Read More](/azure/devops/pipelines/library/variable-groups)

1. Create Service connections to Power Platform Environments using the Azure Active Directory Service Principal.

   - NOTE: Each service connection will receive a separate Azure Active Directory secret.

   - [Read More - Service Connections](/azure/devops/pipelines/library/service-endpoints)

### Branch automation

The [coe alm branch](./maker-setup.md#maker-create-solution) command performs the following steps.

1. Create a new branch to store the Solution.

1. Create build pipelines for the Solution Branch (Validation, Test, Production).

1. Create [Branch Policies](/azure/devops/repos/git/branch-policies-overview) to ensure validation build completes successfully for pull requests.

### Other concepts

In addition to install automation the following concepts are also assumed for Makers.

1. A git [branching strategy](./branching-and-merging.md)

   - The alm commands assume a branch per solution.

   - Changes merged back into main branch can be promoted to production environment.

1. Manage Pull Requests to merge changes into Solution Branches using [Pull Request](/azure/devops/repos/git/pull-requests).

## Power Platform

### Automation

The CoE CLI provides the following key steps:

1. Import Managed solution into environment to allow Makers to Manage git import, create branches, pull requests and updates to test and production.

1. Fix Custom Connectors used to connect to Azure DevOps.

1. Connect Flow to Dataverse.

1. Add the user to the Azure Active Directory Service Principal to the Power Platform environments.

1. Share the Canvas application with the Maker Azure Active Directory Group.

### Environments

The CoE CLI commands currently assume the following environments have been created [https://aka.ms/ppac](https://aka.ms/ppac) as a Global administrator or Environment Administrator with the following configuration:

1. Dataverse is enabled.

1. Azure Active Directory Service principal has be ganged Administration role rights.

### Assumed environments

The ALM Accelerator for Power Platform assumes the following environments have been created and configured:

1. Maker Environment - An environment that the ALM Accelerator for Power Platform will be installed to. It also requires the following components:

   - Created "Microsoft Dataverse (legacy)" connection - [Read More](./before-you-start.md#maker-environment-dataverse-connection).

1. Validation - Environment used to validate deployment before a change is merged into feature branch.

1. Test - Environment used to validate changes before merging into Production.

1. Production Environments - Environment used to deploy production ready application.

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
