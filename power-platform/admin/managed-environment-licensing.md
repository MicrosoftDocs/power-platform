---
title: Licensing
description: Learn about licensing managed environments.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/13/2026
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

Power Apps Premium, Power Automate Premium, Microsoft Copilot Studio, Copilot Studio for Microsoft 365 Copilot (only for features related to Copilot Studio), Power Pages, Dynamics 365 Premium, Enterprise, Team Members, and Dynamics 365 Customer Insights licenses include managed environments as an entitlement. Pay-as-you-go meters for Power Apps per app, Power Pages, and Copilot Studio also qualify. When you activate managed environments in an environment, all active usage requires one of these standalone licenses or pay-as-you-go meters. For example:

- Every user running an app in a managed environment must have one of the following licenses: a Power Apps Premium, a Power Automate Premium license, or a Dynamics 365 Enterprise license that gives premium Power Apps usage rights *. If you use capacity-based licenses, a managed environment must have Power Apps per app plans such as app passes allocated to it. Use of Power Apps capabilities included with Dynamics 365 Pro licenses must be only within the context of the licensed Dynamics 365 application.

- Every user running a Power Automate cloud flow in a managed environment must have one of the following licenses: a Power Apps Premium, a Power Automate Premium license, or a Dynamics 365 Enterprise license that gives premium Power Apps usage rights *. If you use capacity-based licenses, a managed environment must have Power Automate per flow plan such as Flow per business process allocated to it. Use of Power Automate capabilities included with Dynamics 365 Pro licenses must be only within the context of the licensed Dynamics 365 application. Power Automate cloud flows that are triggered within apps or in context of apps or agents are covered by the respective Power Apps or Microsoft Copilot Studio standalone licenses.

- A user running an app in a managed environment and running a Power Automate cloud flow in a managed environment doesn't need both a Power Apps Premium and a Power Automate Premium license for managed environments. Either a Power Apps Premium or a Power Automate Premium license satisfies the premium licensing requirement for that user.

> [!NOTE]
> Trial licenses can license your users in managed environments, but the restrictions specific to these types of licenses still apply. For example, trial licenses only license users for 30 days.
>
> A managed environment isn't included as an entitlement in the Developer Plan when users run their assets. For more information about managed environments and the Developer Plan, see [Power Apps Developer Plan Guide: Features and Benefits](../developer/plan.md).

\* Dynamics 365 Enterprise licenses that give premium Power Apps and Power Automate usage rights are Dynamics 365 Sales Enterprise, Dynamics 365 Sales Premium, Dynamics 365 Customer Service Enterprise, Dynamics 365 Field Service, Dynamics 365 Finance, Dynamics 365 Supply Chain Management, Dynamics 365 Project Operations, Dynamics 365 Commerce, Dynamics 365 Human Resources, Dynamics 365 Business Central, Dynamics 365 Customer Service Premium, Dynamics 365 Finance Premium, Dynamics 365 Supply Chain Management Premium, Dynamics 365 Team Members, and Dynamics 365 Intelligent Order Management.

To see your current license usage, select **View license consumption (preview)** in the Power Platform admin center. For more information, see [View license consumption (preview)](view-license-consumption-issues.md).

> [!IMPORTANT]
> The Power Apps per app pay-as-you-go meter satisfies the requirement that all active Power Apps usage in the environment requires standalone licenses or meters. However, this meter covers Power Apps usage only; any Power Automate flow usage must be covered by standalone Power Automate licenses or Power Automate per flow plans.

## FAQ 

### What is the managed environments licensing compliance?

Starting June 2026, users in Power Apps who use managed environments without an appropriate license receive notifications to help ensure licensing compliance.

- **End-user notifications:** End users who use Power Apps without an appropriate license receive an in-app notification that informs them to get a license from their administrator to continue using the app.
- **Administrator notifications:** Administrators see recommendations and alerts in the Power Platform admin center and Microsoft 365 Message center that guide them to review and assign licenses.

### Why are licensing compliance notifications being introduced for managed environments?

This requirement isn't new. When you activate managed environments in an environment, all active users need at least one premium license per user or capacity add-ons to access respective resources. This initiative helps organizations achieve and maintain compliance with existing licensing terms by proactively notifying administrators as well as end users who don't have the required license. 

### When do the notifications begin?

In-app notifications for end users are scheduled to begin in June 2026. Administrators receive advance notifications through the Microsoft 365 Message center and Power Platform admin center starting March 2026.

### Which environments are in scope?

Only environments that you enable as **managed environments** are in scope. For more information, see [managed environments overview](managed-environment-overview.md).

### What licenses satisfy the requirement?

Licensing requirements for managed environments are detailed in this content. For the complete and current list of qualifying licenses, refer to the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

### End-user experience

#### What do end users experience?

If end users open a Power App in a managed environment without an appropriate license, they see an in-app notification. The notification informs users that the app is in a managed environment and that they need to get an appropriate license from their administrator to continue using the app. Users can request a license directly from the notification.

#### What happens when a user requests a license?

When a user selects **Request License**, the request goes to the tenant administrator. Administrators can review and act on these requests in:

- **Power Platform admin center** — **Actions** > **Recommendations**
- **Microsoft 365 admin center** — **Billing** > **Licenses** > **Requests**

### Administrator experience

#### How are administrators notified?

Administrators receive notifications through multiple channels to help them stay ahead of licensing compliance.

Administrator notifications start in March 2026, ahead of the June 2026 end user notifications.

- **Microsoft 365 Message center** — Message center posts provide advance notice of upcoming changes and required actions.

    After April 2026, Power Platform admin center notifications and recommendations provide additional notifications.

- **Power Platform admin center recommendations** — Available through **Actions > Recommendations**, these recommendations provide details for users in managed environments requiring a license.

#### How can I check which users need a license?

Administrators can identify users who require a license by using the [**Users requiring licenses in managed environments**](view-license-consumption-issues.md#additional-admin-options) Power Apps licensing report in the Power Platform admin center.

> [!NOTE]
> - The report lists users who accessed at least one app in any managed environment without an appropriate license.
> - The report shows a list of unique users based on their app launch activity in the selected month. The report excludes users who didn't launch an app in the selected month.
> - If a user was assigned an appropriate license but didn't launch any app since then, they continue to show in the report until they launch an app.
> - The report includes details on the specific users, the environments they operate in, and the applications they use.

Complete the following steps to download the report:

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Licensing**.
1. In the **Licensing** pane, select **Power Apps**.
1. In the **Summary** tab, select **Download report**. The **Download license information** pane appears.
1. From the **Usage type** list, select **Users requiring licenses in Managed Environments**.
1. From the **Lookback window** list, select the desired month.
1. Select **Download report**.

#### Can administrators assign licenses proactively?

Yes. Administrators can review their managed environment users and assign licenses at any time. To benefit from automatic license assignment for active users, enable the **auto-claim policy** in the Microsoft 365 admin center. Ensure you have sufficient license capacity in the tenant.

### Related content

[Managed environments overview](managed-environment-overview.md)  <br />
[Enable managed environments](managed-environment-enable.md)  <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Limit sharing](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md)  <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
