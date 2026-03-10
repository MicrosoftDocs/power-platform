---
title: Licensing
description: Learn about licensing Managed Environments.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 03/10/2025
author: mihaelablendea
ms.author: mihaelab
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
ms.contributors:
- mihaelab
contributors:
- sandhangitms
- akadrno
- Funken1766
- mihaelablendea
- mikferland-msft
- sericks007
- Greggbarker-MS
---

# Licensing

Managed Environments are included as an entitlement in Power Apps Premium, Power Automate Premium, Microsoft Copilot Studio, Power Pages, and Dynamics 365 licenses. When you activate Managed Environments in an environment, all active users need at least one premium license per user or capacity add-ons to access respective resources. For example:

- Every user running an app in a Managed Environment must have one of the following licenses: a Power Apps Premium, a Power Automate Premium license, or a Dynamics 365 Enterprise license that gives premium Power Apps usage rights *. If you use capacity-based licenses, a Managed Environment must have Power Apps per app plans such as app passes allocated to it. Use of Power Apps capabilities included with Dynamics 365 Pro licenses must be only within the context of the licensed Dynamics 365 application.

- Every user running a Power Automate cloud flow in a Managed Environment must have one of the following licenses: a Power Apps Premium, a Power Automate Premium license, or a Dynamics 365 Enterprise license that gives premium Power Apps usage rights *. If you use capacity-based licenses, a Managed Environment must have Power Automate per flow plan such as Flow per business process allocated to it. Use of Power Automate capabilities included with Dynamics 365 Pro licenses must be only within the context of the licensed Dynamics 365 application. Power Automate cloud flows that are triggered within apps or in context of apps or chatbots are covered by the respective Power Apps or Microsoft Copilot Studio standalone licenses.

- A user running an app in a Managed Environment and running a Power Automate cloud flow in a Managed Environment doesn't need both a Power Apps Premium and a Power Automate Premium license for Managed Environments. Either a Power Apps Premium or a Power Automate Premium license satisfies the premium licensing requirement for that user.

> [!NOTE]
> Trial licenses can license users in Managed Environments, but the restrictions specific to these types of licenses still apply. For example, trial licenses can license users for 30 days.
>
> Managed Environment isn't included as an entitlement in the Developer Plan when users run their assets. For more information about Managed Environments and the Developer Plan, see [About the Power Apps Developer Plan](../developer/plan.md).

\* Dynamics 365 Enterprise licenses that give premium Power Apps and Power Automate usage rights are Dynamics 365 Sales Enterprise, Dynamics 365 Sales Premium, Dynamics 365 Customer Service Enterprise, Dynamics 365 Field Service, Dynamics 365 Finance, Dynamics 365 Supply Chain Management, Dynamics 365 Project Operations, Dynamics 365 Commerce, Dynamics 365 Human Resources, Dynamics 365 Business Central, Dynamics 365 Customer Service Premium, Dynamics 365 Finance Premium, Dynamics 365 Supply Chain Management Premium, Dynamics 365 Team Members, and Dynamics 365 Intelligent Order Management.

To see your current license usage, select **View license consumption (preview)** in the Power Platform admin center. For more information, see [View license consumption (preview)](view-license-consumption-issues.md).

> [!IMPORTANT]
> At this time, enabling [pay-as-you-go](pay-as-you-go-overview.md) for a Managed Environment isn't sufficient to meet Managed Environments licensing requirements, if:
>
> - There are users without standalone Power Apps licenses using Power Apps in that environment.
> - Users without standalone Power Automate licenses use flows in that environment, or users use flows without Power Automate per flow licenses in that environment.

## FAQ 

### What is the Managed Environments licensing compliance?

Starting June 2026, users in Power Apps who are using Managed Environments without an appropriate license will receive notifications to help ensure licensing compliance.

- **End-user notifications:** End users who use Power Apps without an appropriate license will receive an in-app notification informing them to obtain a license from their administrator to continue using the app.
- **Administrator notifications:** Administrators will see recommendations and alerts in the Power Platform admin center and Microsoft 365 Message center guiding them to review and assign licenses.

### Why are licensing compliance notifications being introduced for Managed Environments?

This is not a new licensing requirement. When you activate Managed Environments in an environment, all active users need at least one premium license per user or capacity add-ons to access respective resources. This initiative intends to help organizations achieve and maintain compliance with existing licensing terms by proactively notifying administrators as well as end users who don't have the required license. 

### When do the notifications begin?

In-app notifications for end users are scheduled to begin in June 2026. Administrators will receive advance notifications through the Microsoft 365 Message center and Power Platform admin center starting March 2026.

### Which environments are in scope?

Only environments that have been enabled as **Managed Environments** are in scope. For more information, see [Managed Environments overview](managed-environment-overview.md).

### What licenses satisfy the requirement?

Licensing requirements for Managed Environments are detailed in this content. For the complete and current list of qualifying licenses, refer to the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

### End-user experience

#### What will end users experience?

End users who open a Power App in a Managed Environment without an appropriate license will receive an in-app notification. The notification informs users that the app is in a Managed Environment and that they need to obtain an appropriate license from their administrator to continue using the app. Users can request a license directly from the notification.

#### What happens when a user requests a license?

When a user selects **Request License**, the request is submitted to the tenant administrator. Administrators can review and act on these requests in:

- **Power Platform admin center** — **Actions** > **Recommendations**
- **Microsoft 365 admin center** — **Billing** > **Licenses** > **Requests**

### Administrator experience

#### How are administrators notified?

Administrators are notified through multiple channels to help them stay ahead of licensing compliance.

Administrator notifications begin in March 2026, ahead of the June 2026 end user notifications.

- **Microsoft 365 Message center** — Message center posts provide advance notice of upcoming changes and required actions.

    After April 2026, additional notifications will be surfaced through Power Platform admin center notifications as well as recommendations.

- **Power Platform admin center recommendations** — Available through **Actions > Recommendations**, these recommendations provide details for users in Managed Environments requiring a license.

#### How can I check which users need a license?

Administrators can identify users who require a license using the Power Apps usage report in the Power Platform admin center. Complete the following steps.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. In the navigation pane, select **Licensing**.
3. In the **Licensing** pane, select **Power Apps**.
4. In the **Summary** tab, select **Download report**. The **Download license information** pane appears.
5. From the **Usage type** list, select **Active users**.
6. From the **Lookback window** list, select the desired month.
7. Select **Download report**.
8. Filter the report using the following columns:

    - **IsManagedEnvironment** = True — to isolate users in Managed Environments.
    - **SkuName** — filter for non-premium licenses (for example, “Office 365 E3 Developer” or any other non-premium user/per-app licenses) to identify users who do not have an appropriate license.

    The report includes details on the specific users, the environments they are operating in, and the applications they are using.

    In addition, more capabilities are planned to make it easier for administrators to identify these users.

#### Can administrators assign licenses proactively?

Yes. Administrators can review their Managed Environment users and assign licenses at any time. We recommend enabling the **auto-claim policy** in the Microsoft 365 admin center to benefit from automatic license assignment for active users. Ensure you have sufficient license capacity in the tenant.

### Related content

[Managed Environments overview](managed-environment-overview.md)  <br />
[Enable Managed Environments](managed-environment-enable.md)  <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Limit sharing](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md)  <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
