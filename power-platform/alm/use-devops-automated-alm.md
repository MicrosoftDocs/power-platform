---
title: "Using DevOps to move from manual to automated ALM with Power Apps | Microsoft Docs"
description: "Learn how to use Power Apps DevOps to move from manual to automated ALM"
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
# Scenario 4: Using DevOps to move from manual to automated ALM

This scenario aims at a situation where you're shipping your solutions manually and don't have a source code control system in place.

For this scenario, you should:

1. Consider adopting a source code control system like [Azure DevOps](/azure/devops/?view=azure-devops). Azure DevOps provides developer services for support teams to plan work, collaborate on code development, and build and deploy applications.

2. Export a solution from your development environment containing your apps and customizations, unpack your solution, and store the components in your source control system. Use Azure Pipelines to manage your components, and then deploy them to the target environment for testing. Finally, deploy to the production environment for user consumption.

### See also

[Microsoft Power Platform Build Tools for Azure DevOps](devops-build-tools.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]