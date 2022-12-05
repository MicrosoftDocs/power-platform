---
title: Licensing
description: Learn about licensing Managed Environments.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/02/2022
author: mikferland-msft 
ms.author: miferlan
ms.reviewer: jimholtz
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Licensing

Managed Environments is included as an entitlement in standalone Power Apps, Power Automate, Power Virtual Agents, Power Pages, and Dynamics 365 licenses that give premium usage rights. When Managed Environments is activated in an environment, every app, Power Automate flow, Power Virtual Agents bot, and Power Pages website in that environment requires standalone licenses for accessing respective resources. For example: 

- Every user running an app in a managed environment must have a Power Apps per user or per app license or a Dynamics 365 license that give premium Power Apps usage rights. 
- Every user running a Power Automate flow in a managed environment must have a standalone Power Automate per user license, or the flow must have a Power Automate per flow license or a Dynamics 365 license with premium Power Automate usage rights. 

To see your current license usage, select **View license consumption (preview)** in the Power Platform admin center. More information: [View license consumption (preview)](view-license-consumption-issues.md)

> [!IMPORTANT]
> Enabling [pay-as-you-go](pay-as-you-go-overview.md) for a managed environment will not be sufficient to meet Managed Environments licensing requirements, if:
> - There are users without standalone Power Apps licenses using Power Apps in that environment.
> - There are users without standalone Power Automate licenses using flows in that environment, or users using flows without Power Automate per flow licenses in that environment, or users using flows without Power Automate per flow licenses in that environment.




### See also
[Managed Environments overview](managed-environment-overview.md)  <br />
[Enable Managed Environments](managed-environment-enable.md)  <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Limit sharing](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md)  <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md) 
