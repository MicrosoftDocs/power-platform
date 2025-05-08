---
title: "CoE ALM Accelerator for Power Platform key concepts (Deprecated)"
description: "Key concepts related to ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.custom: ""
ms.date: 09/26/2024

ms.topic: concept-article
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# CoE ALM Accelerator for Power Platform key concepts (Deprecated)

As you deploy and use the ALM CLI, it's important to understand the following key concepts that the CLI is automating.

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

## Microsoft Entra ID

### Microsoft Entra application

The CoE CLI application can create a Microsoft Entra application that automates the following key steps:

1. User is authenticated via Azure CLI.
   - [Azure Login](/cli/azure/reference-index?#az_login)

1. Create a Microsoft Entra application using Azure CLI.
   - [Create AD Application](/cli/azure/ad/app?#az_ad_app_create)
   - [Create Service Principal](/cli/azure/ad/sp?#az_ad_sp_create)

1. Grant tenant consent for applications using Azure CLI.
   - [Permissions Admin Consent](/cli/azure/ad/app/permission?#az_ad_app_permission_admin_consent)

1. Azure Application granted rights via [manifest configuration file](https://github.com/microsoft/coe-starter-kit/blob/main/coe-cli/config/manifest.json) to call:
   - Azure DevOps
   - Microsoft Dataverse
   - Power Apps checker module - More information: [Get started using the Power Apps checker module](/powershell/powerapps/get-started-powerapps-checker)

1. Client secrets will be created for Azure DevOps service connections.

   - Client secrets should have an established key rotation process to generate new keys for connections.

   - After new keys are generated, old keys should be removed.

### Microsoft Entra group

The CoE CLI application can create a Microsoft Entra group that is used for Azure DevOps and Power Platform authentication and role-based access security.

- Group created via Azure CLI.
- [Create Group](/cli/azure/ad/group?#az_ad_group_create)

## Azure DevOps

### Install automation

The CoE CLI application assumes that an Azure DevOps organization and project have already been created.

The install performs the following key steps:

1. Install Azure DevOps extensions defined in [AzureDevOpsExtensionsDetails.json](https://github.com/microsoft/coe-starter-kit/blob/main/coe-cli/config/AzureDevOpsExtensionsDetails.json).

   - New extensions can be added from [https://marketplace.visualstudio.com/item](https://marketplace.visualstudio.com/item). Visit each extension and add the publisher and the **itemName** from the query string in the browser.

1. Clone Azure templates [https://github.com/microsoft/coe-alm-accelerator-templates.git](https://github.com/microsoft/coe-alm-accelerator-templates.git) into an Azure DevOps Git repository named **pipelines** by default.

1. Create Azure DevOps build pipelines.
  
   1. [Export-solution-to-git.yml](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/export-solution-to-git.yml) - Export a solution from a Dataverse environment and commit it to a Git branch.

   1. [Import-unmanaged-to-dev-environment.yml](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/import-unmanaged-to-dev-environment.yml) - Import solution into Dataverse environment.

   1. [Delete-unmanaged-solution-and-components.yml](https://github.com/microsoft/coe-alm-accelerator-templates/blob/main/Pipelines/delete-unmanaged-solution-and-components.yml) - Delete or "clean up" an unmanaged solution from a Dataverse environment.

1. Set up Azure Active Group access to the Azure DevOps project.

1. Create variable groups for shared variables used by build pipelines.

   - More information: [Variable groups](/azure/devops/pipelines/library/variable-groups)

1. Create service connections to Power Platform environments using the Microsoft Entra service principal.

   > [!NOTE]
   > Each service connection will receive a separate Microsoft Entra secret.

   More information: [Service connections](/azure/devops/pipelines/library/service-endpoints)

### Branch automation

The [CoE ALM branch](./maker-setup.md#maker-create-solution) command performs the following steps:

1. Create a new branch to store the solution.

1. Create build pipelines for the solution branch (validation, test, production).

1. Create [Branch Policies](/azure/devops/repos/git/branch-policies-overview) to ensure validation build completes successfully for pull requests.

### Other concepts

In addition to install automation the following concepts are also assumed for makers.

1. A Git [branching strategy](./branching-and-merging.md)

   - The ALM commands assume a branch per solution.

   - Changes merged back into main branch can be promoted to production environment.

1. Manage pull requests to merge changes into solution branches using a [pull request](/azure/devops/repos/git/pull-requests).

## Power Platform

### Automation

The CoE CLI provides the following key steps:

1. Imports a managed solution into the environment to allow makers to manage Git import, create branches, pull requests, and updates to test and production.

1. Fix custom connectors used to connect to Azure DevOps.

1. Connect a flow to Dataverse.

1. Add the user to the Microsoft Entra service principal to the Power Platform environments.

1. Share the canvas application with the maker Microsoft Entra group.

### Environments

The CoE CLI commands assume the following environments have been created [https://aka.ms/ppac](https://aka.ms/ppac) as a privelged identity managed (PIM) administrator or environment administrator with the following configuration:

- Dataverse is enabled.

- Microsoft Entra service principal is granted administration role rights.

### Assumed environments

The ALM Accelerator for Power Platform assumes the following environments have been created and configured:

1. Maker environment - An environment that the ALM Accelerator for Power Platform will be installed to. It also requires the following component:

   - "Microsoft Dataverse (legacy)" connection - More information: [Before you start](before-you-start.md).

1. Validation - Environment used to validate the deployment before a change is merged into the feature branch.

1. Test - Environment used to validate changes before merging into production.

1. Production environments - Environment used to deploy the production ready application.

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
