---
title: "Center of Excellence (CoE) Command Line Interface (CLI) ALM Accelerator Administrator Install"
description: "Steps to do administrator install of the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
keywords: 
author: Grant-Archibald-MS
ms.author: grarchib
manager: pladhani
ms.custom: ""
ms.date: 10/20/2021
ms.service: power-platform
ms.topic: "article"
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - PowerApps
  - Powerplatform
---

# Administrator Install

As a first step you will need to complete the initial steps of an AA4AM deployment as Administrator. The commands below allow you to quickly automate the install. When you completed these steps, you can add Advanced Makers and setup connections to their Power Platform development environments.

![ALM Accelerator for Advanced Makers Install Overview](../media/aa4am-install-overview.png)

It is assumed that the Administrator Install will be run by a single user that has the following rights:

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
coe aa4am generate install -o test.json
```

More information on the [coe aa4am generate install](../help/aa4am/generate/install.md) command

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
coe aa4am install -f test.json
```

More information on the [coe aa4am install](../help/aa4am/install.md) command

1. [Update permissions for the project build service](https://github.com/microsoft/coe-starter-kit/blob/main/ALMAcceleratorForAdvancedMakers/SETUPGUIDE.md#update-permissions-for-the-project-build-service) to enable build pipelines to interact with Git Repositories

## Read Next

- Complete the [Install Overview](./overview.md#install-overview)
