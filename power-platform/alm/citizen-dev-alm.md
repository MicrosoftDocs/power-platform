---
title: "Citizen development ALM with Microsoft Power Platform | Microsoft Docs"
description: "Learn how to implement ALM for citizen development with Microsoft Power Platform"
keywords: 
author: shmcarth
ms.author: shmcarth
manager: kvivek
ms.custom: ""
ms.date: 05/05/2020
ms.reviewer: "matp"
ms.service: powerapps
ms.topic: "article"
search.audienceType: 
  - maker
search.app: 
  - PowerApps
  - D365CE
---
# Scenario 1: Citizen development
This scenario aims at the legacy canvas app makers and flow makers in Power Apps and Power Automate, respectively, who work in a Microsoft Dataverse environment *without* a Dataverse database.

You currently build canvas apps and flows that are *not* part of a solution, and
share your apps and flows by specifying each user by name or specifying a
security group in Azure Active Directory who can access your app or flow.

The end goal is to move your legacy canvas app and flows to a managed application lifecycle management (ALM) model by creating apps and flows in a Dataverse solution.

> [!NOTE]
> You can use the default Dataverse environment as a playground to get acquainted with the app-building experience. However, if you'll be shipping shared components (such as entities and AI models) along with your apps and flows as part of a solution, we recommend you move to a model where you have multiple environments, each dedicated for the development, testing, and release of your apps. For more information about environments, see [Types of environments used in ALM](basics-alm.md#types-of-environments-used-in-alm).

For legacy canvas app and flow makers to participate and move to a healthy ALM model, you must do the following:

1.  Work with your IT admin/organization to discuss your business processes and
    environment strategy, such as the number of environments, access
    permissions, groups, and security. More information: [ALM environment strategy](environment-strategy-alm.md)

2.  Understand the concept of solutions in Dataverse as a mechanism to transport and share components with others. You can export a solution from one environment to another to easily and securely share your apps and flows.
More information: [Solution concepts](solution-concepts-alm.md)

3.  Follow the steps in [Scenario 0: ALM for a new project](new-project-alm.md) to move to a healthy ALM.

### See also
[Scenario 2: Moving from a single production environment](move-from-single-env-alm.md)
