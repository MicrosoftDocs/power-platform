---
title: "Move from a single environment for development and production"
description: "Support healthy ALM by moving from a single environment to separate environments for development, testing, and production."
keywords: 
author: Mattp123
ms.author: matp
manager: kvivek
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: ""
ms.service: power-platform
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---
# Scenario 2: Moving from a single production environment 
This scenario aims at users or organizations that have a single Common Data
Service environment with a database that they use to create, test, and deploy
their apps. Having a single environment poses challenges in terms of change
management and control.

To move to healthy application lifecycle management (ALM), you must:

1.  Separate your development and production environments, at a minimum. The ideal solution is to have three environments, one each for development, testing, and production/deployment. More information: [ALM environment strategy](environment-strategy-alm.md)

2.  Use solutions to ship changes across environments: More information: [Use a solution to customize](use-solutions-for-your-customizations.md)

3.  Automate the application lifecycle process using DevOps. More information: [Microsoft Power Platform Build Tools for Azure DevOps](devops-build-tools.md) 

### See also
[Scenario 3: Moving from unmanaged to managed solutions in your organization](move-from-unmanaged-managed-alm.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
