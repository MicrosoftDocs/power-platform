---
title: "Set up ALM Accelerator for Power Platform using CoE CLI"
description: "Steps to do administrator install of the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
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

# Set up ALM Accelerator for Power Platform using CoE CLI

As a first step you'll need to complete the initial steps of an ALM deployment as an Administrator. The commands below allow you to quickly automate the install. When you completed these steps, you can add Advanced Makers and setup connections to their Power Platform development environments.

## Overview

The following roles are involved with Power Platform

1. Administrator

- Azure Active Directory - Permissions to Create Azure Active Directory Application with [Admin Level Consent](/azure/active-directory/manage-apps/grant-admin-consent)
)
- Power Platform - Environment Administrator to Create Validation, Test and Production environments
- Azure DevOps - Organization and Project Administrator

1. Maker

- Power Platform - Create Development environment
- Azure DevOps - Azure DevOps project user, create solution branch

It is assumed that this installation will be run by a single user that has the following rights:

1. Power Platform Global Administrator

1. DevOps Administrator rights

1. Azure Active directory Administrator rights.

## Before You Start

Complete [Before You Start](./before-you-start.md) to ensure that:

A. Power Platform Environments have been created

B. The Azure DevOps Organization and Azure DevOps Project have been created

C. CoE CLI installed

## Initial Install

1. Create install configuration file and review the generated JSON file and confirm the settings before you start the install process

```bash
coe alm generate install -o test.json
```

More information on the [coe alm generate install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/generate/install.md) command

Which will generate a file similar to

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
    "validation": "https://sample-validation.crm.dyamics.com",
    "test": "https://sample-test.crm.dyamics.com",
    "prod": "https://sample-prod.crm.dyamics.com",
    "createSecret": "true",
    "region": [
      "NAM"
    ]
  },
  "importMethod": "api",
  "endpoint": "prod"
}
```

1. Review the JSON and install using the following command

```bash
coe alm install -f test.json
```

More information on the [coe alm install](https://github.com/microsoft/coe-starter-kit/tree/main/coe-cli/docs/help/alm/install.md) command

1. [Update permissions for the project build service](/power-platform/guidance/coe/setup-almacceleratorpowerplatform#update-permissions-for-the-project-build-service) to enable build pipelines to interact with Git Repositories

## Read Next

- Complete the [Install Overview](./overview.md#install-overview)

[!INCLUDE[footer-include](../../../../includes/footer-banner.md)]
