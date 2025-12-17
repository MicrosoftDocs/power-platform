---
title: Licensing
description: Learn about licensing Managed Environments.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 01/06/2025
author: mihaelablendea
ms.author: mihaelab
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
ms.contributors:
- mihaelab
contributors:
- akadrno
- Funken1766
- mihaelablendea
- mikferland-msft
- sericks007
---

# Licensing

Managed Environments are included as an entitlement in Power Apps Premium, Power Automate Premium, Microsoft Copilot Studio, Power Pages, and Dynamics 365 licenses. When you activate Managed Environments in an environment, all active users need at least one premium license per user or capacity add-ons to access respective resources. For example:

- Every user running an app in a Managed Environment must have one of the following licenses: a Power Apps Premium, a Power Automate Premium license, or a Dynamics 365 Enterprise license that gives premium Power Apps usage rights *. If you use capacity-based licenses, a Managed Environment must have Power Apps per app plans such as app passes allocated to it. Use of Power Apps capabilities included with Dynamics 365 Pro licenses must be only within the context of the licensed Dynamics 365 application.

- Every user running a Power Automate cloud flow in a Managed Environment must have one of the following licenses: a Power Apps Premium, a Power Automate Premium license, or a Dynamics 365 Enterprise license that gives premium Power Apps usage rights *. If you use capacity-based licenses, a Managed Environment must have Power Automate per flow plan such as Flow per business process allocated to it. Use of Power Automate capabilities included with Dynamics 365 Pro licenses must be only within the context of the licensed Dynamics 365 application. Power Automate cloud flows that are triggered within apps or in context of apps or chatbots are covered by the respective Power Apps or Microsoft Copilot Studio standalone licenses.

- A user running an app in a Managed Environment and running a Power Automate cloud flow in a Managed Environment doesn't need both a Power Apps Premium and a Power Automate Premium license for Managed Environments. Either a Power Apps Premium or a Power Automate Premium license satisfies the premium licensing requirement for that user.

\* Dynamics 365 Enterprise licenses that give premium Power Apps and Power Automate usage rights are Dynamics 365 Sales Enterprise, Dynamics 365 Sales Premium, Dynamics 365 Customer Service Enterprise, Dynamics 365 Field Service, Dynamics 365 Finance, Dynamics 365 Supply Chain Management, Dynamics 365 Project Operations, Dynamics 365 Commerce, Dynamics 365 Human Resources, Dynamics 365 Business Central, Dynamics 365 Customer Service Premium, Dynamics 365 Finance Premium, Dynamics 365 Supply Chain Management Premium, Dynamics 365 Team Members, and Dynamics 365 Intelligent Order Management.

To see your current license usage, select **View license consumption (preview)** in the Power Platform admin center. For more information, see [View license consumption (preview)](view-license-consumption-issues.md).

> [!IMPORTANT]
> At this time, enabling [pay-as-you-go](pay-as-you-go-overview.md) for a Managed Environment isn't sufficient to meet Managed Environments licensing requirements, if:
>
> - There are users without standalone Power Apps licenses using Power Apps in that environment.
> - Users without standalone Power Automate licenses use flows in that environment, or users use flows without Power Automate per flow licenses in that environment.

> [!NOTE]
> Trial licenses can license users in Managed Environments, but the restrictions specific to these types of licenses still apply. For example, trial licenses can license users for 30 days.
>
> Managed Environment isn't included as an entitlement in the Developer Plan when users run their assets. For more information about Managed Environments and the Developer Plan, see [About the Power Apps Developer Plan](../developer/plan.md).

### Related content

[Managed Environments overview](managed-environment-overview.md)  <br />
[Enable Managed Environments](managed-environment-enable.md)  <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Limit sharing](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md)  <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
