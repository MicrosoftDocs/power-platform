---
title: "Set up ALM Accelerator for Power Platform (Deprecated)"
description: "Learn how to perform an administrator install of the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)."
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
ms.date: 09/26/2024
ms.update-cycle: 3650-days
ms.subservice: guidance-toolkit
ms.topic: install-set-up-deploy
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# Set up ALM Accelerator for Power Platform (Deprecated)

> [!NOTE]
> The CoE CLI is deprecated and will be removed in a future release. Use the [Power Platform Project Setup Wizard](../../../alm-accelerator/setup-admin-tasks.md) to set up and manage your ALM Accelerator for Power Platform projects.

As a first step you'll need to complete the initial steps of an ALM deployment as an administrator. The commands below allow you to quickly automate the install. When you've completed these steps, you can add makers and set up connections to their Power Platform development environments.

## Overview

The following roles are involved with Power Platform.

- Administrator
  - Microsoft Entra ID - Permissions to create Microsoft Entra applications with [Admin Level Consent](/azure/active-directory/manage-apps/grant-admin-consent).
  - Power Platform - Environment administrator to create validation, test, and production environments.
  - Azure DevOps - Organization and project administrator.
- Maker
  - Power Platform - Create development environment.
  - Azure DevOps - Azure DevOps project user, create solution branch.

It is assumed that this installation will be run by a single user that has the following rights:

- Power Platform [administration role](/microsoft-365/admin/add-users/about-admin-roles)

- DevOps administrator rights

- Microsoft Entra administrator rights

## Before you start

Complete [Before You Start](./before-you-start.md) to ensure that:

- Power Platform environments have been created.

- The Azure DevOps organization and Azure DevOps project have been created.

- The latest version of the CoE CLI is installed.

## Initial install

1. Create install configuration file and review the generated JSON file and confirm the settings before you start the install process.

   ```bash
   coe alm generate install -o quickstart.json
   ```

   This command generates a file similar to the one below.

   ```json
   {
   "log": [
      "info"
   ],
   "components": [
      "all"
   ],
   "aad": "ALMAcceleratorServicePrincipal",
   "group": "ALMAcceleratorForAdvancedMakers",
   "devOpsOrganization": "https://dev.azure.com/dev1234",
   "project": "alm-sandbox",
   "repository": "pipelines",
   "settings": {
      "installEnvironments": [
         "validation",
         "test",
         "prod"
      ],
      "validation": "https://sample-validation.crm.dynamics.com",
      "test": "https://sample-test.crm.dynamics.com",
      "prod": "https://sample-prod.crm.dynamics.com",
      "createSecret": "true",
      "region": [
         "NAM"
      ]
   },
   "importMethod": "api",
   "endpoint": "prod"
   }
   ```

More information: [COE ALM generate install](https://aka.ms/coe-cli/help/alm/install)

1. Review the JSON and install using the following command.

   ```bash
   coe alm install -f quickstart.json
   ```

More information: [CoE ALM generate install](https://aka.ms/coe-cli/help/alm/install)

If you're prompted to create an HTTP with Microsoft Entra ID connection, enter 'https://graph.microsoft.com' for both the **Base Resource URL** and **Azure AD Resource URI**.

1. [Update permissions for the project build service](../../setup-almacceleratorpowerplatform.md#update-permissions-for-the-project-build-service) to enable build pipelines to interact with Git repositories.

## Read next

- Complete the [Install Overview](./overview.md#install-overview).

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
