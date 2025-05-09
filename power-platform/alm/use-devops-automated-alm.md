---
title: "Using DevOps to move from manual to automated ALM with Power Platform"
description: "Learn how to use Power Apps DevOps to move from manual to automated ALM in Power Platform"
keywords: 
author: Mattp123
ms.subservice: alm
ms.author: matp
ms.custom: ""
ms.date: 02/06/2025
ms.reviewer: ""
ms.topic: how-to
search.audienceType: 
  - maker
---
# Scenario 4: Using DevOps to move from manual to automated ALM

This scenario aims at a situation where you're shipping your solutions manually and don't have a source code control system in place.

For this scenario, you should:

1. Consider adopting a source code control system like [Azure DevOps](/azure/devops/?view=azure-devops&preserve-view=true). Azure DevOps provides developer services for support teams to plan work, collaborate on code development, and build and deploy applications.

2. Export a solution from your development environment containing your apps and customizations, unpack your solution, and store the components in your source control system. Use Azure Pipelines to manage your components, and then deploy them to the target environment for testing. Finally, deploy to the production environment for user consumption.

## See also

[Microsoft Power Platform Build Tools for Azure DevOps](devops-build-tools.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
