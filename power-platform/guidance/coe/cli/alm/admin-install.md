---
title: "Set up ALM Accelerator for Power Platform"
description: "Steps to do administrator install of the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 11/30/2021

ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# Set up ALM Accelerator for Power Platform

> [!NOTE]
> The ALM accelerator for Microsoft Power Platform is currently in public preview. While in preview we will be prioritizing feedback and bugs via GitHub [New issue](https://github.com/microsoft/coe-starter-kit/labels/alm-accelerator). If the issue is something in the platform all we can do is funnel feedback to the responsible product teams. For more information on the current preview status of the ALM Accelerator for Power Platform [follow this link](https://github.com/microsoft/coe-starter-kit/blob/main/CenterofExcellenceALMAccelerator/PREVIEW.md).

As a first step you'll need to complete the initial steps of an ALM deployment as an administrator. The commands below allow you to quickly automate the install. When you've completed these steps, you can add makers and set up connections to their Power Platform development environments.

## Overview

The following roles are involved with Power Platform.

- Administrator
  - Azure Active Directory - Permissions to create Azure Active Directory applications with [Admin Level Consent](/azure/active-directory/manage-apps/grant-admin-consent).
  - Power Platform - Environment administrator to create validation, test, and production environments.
  - Azure DevOps - Organization and project administrator.
- Maker
  - Power Platform - Create development environment.
  - Azure DevOps - Azure DevOps project user, create solution branch.

It is assumed that this installation will be run by a single user that has the following rights:

- Power Platform [administration role](/microsoft-365/admin/add-users/about-admin-roles) of Global admin or Power Platform admin.

- DevOps administrator rights.

- Azure Active Directory administrator rights.

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

If you're prompted to create an HTTP with Azure Active Directory (AD) connection, enter 'https://graph.microsoft.com' for both the **Base Resource URL** and **Azure AD Resource URI**.

1. [Update permissions for the project build service](../../setup-almacceleratorpowerplatform.md#update-permissions-for-the-project-build-service) to enable build pipelines to interact with Git repositories.

## Read next

- Complete the [Install Overview](./overview.md#install-overview).

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
