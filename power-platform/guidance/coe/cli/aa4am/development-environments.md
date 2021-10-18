---
title: "Center of Excellence (CoE) Command Line Interface (CLI) ALM Accelerator Developer environments"
description: "Summary of how to add a maker development environments to the ALM Accelerator using the Center of Excellence (CoE) Command Line Interface (CLI)"
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

# Development Environments

Each advanced maker will need a development environment created. Advanced makers can use a community environment to work in. Community environments can be accessed from the sign-up page https://web.powerapps.com/community/signup

## Admin Maker Setup

As Azure DevOps Administrator you will need to register each advanced maker environment. The following command will add the required service connection to the development environment and setup security for the user

```bash
coe aa4am maker add \
  -o https://dev.azure.com/dev12345 \
  -p alm-sandbox \
  -e https://org12345-dev.crm.dynamics.com \
  -u username@contoso.com
```

More information on the [coe aa4am maker add](../help/aa4am/maker/add.md) command

## Read Next

- Complete the [Install Overview](./overview.md#install-overview)
