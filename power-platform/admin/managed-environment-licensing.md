---
title: Licensing requirements for managed environments
description: Determine which licenses cover managed environments and prepare users for licensing enforcement.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 08/31/2026
author: mihaelablendea
ms.author: mihaelab
ms.reviewer: ellenwehrle
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
- Greggbarker-MS
---

# Licensing requirements for managed environments

Managed environments are included as an entitlement in the following licenses: Power Apps Premium, Power Automate Premium, Microsoft Copilot Studio, Copilot Studio for Microsoft 365 Copilot (only for features related to Copilot Studio), Power Pages, Dynamics 365 Premium, Enterprise, Team Members, and Dynamics 365 Customer Insights. Pay-as-you-go meters for Power Apps per app, Power Pages, and Copilot Studio also qualify. When you activate managed environments in an environment, all active usage requires one of these standalone licenses or pay-as-you-go meters. For example:

- Every user running an app in a managed environment must have one of the following licenses: a Power Apps Premium, a Power Automate Premium license, or a Dynamics 365 Enterprise license that gives premium Power Apps usage rights *. If you use capacity-based licenses, a managed environment must have Power Apps per app plans such as app passes allocated to it. Use of Power Apps capabilities included with Dynamics 365 Pro licenses must be only within the context of the licensed Dynamics 365 application.

- Every user running a Power Automate cloud flow in a managed environment must have one of the following licenses: a Power Apps Premium, a Power Automate Premium license, or a Dynamics 365 Enterprise license that gives premium Power Apps usage rights\*. If you use capacity-based licenses, a managed environment must have Power Automate per flow plan such as *Flow per business process* allocated to it. Use of Power Automate capabilities included with Dynamics 365 Pro licenses must be only within the context of the licensed Dynamics 365 application. Power Automate cloud flows that are triggered within apps or in context of apps or agents are covered by the respective Power Apps or Microsoft Copilot Studio standalone licenses.

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

### What is managed environments licensing compliance?

Managed environments licensing compliance is an initiative that helps organizations achieve and maintain compliance with existing licensing terms. The initiative proactively notifies administrators and end users who don't have the required license to operate in managed environments. This initiative happens in two stages:

- **Notifications:** In-application notifications started in June 2026 for end users who use Power Apps without an appropriate license. The notifications inform them to get a license from their administrator to continue using the app. For more information about the notification stages, see [end-user experience](#end-user-experience). Administrators see recommendations and alerts in the Power Platform admin center and Microsoft 365 Message center that guide them to review and assign licenses. For more information see [administrator experience](#administrator-experience).
- **License required to open an app:** Starting February 2027, users who don't have an appropriate license are blocked from opening apps in the managed environment after receiving the final notification stage. The app shows the standard *You need a Power Apps license to use this app* message. For more information about the message and options, see [Power Apps licensing FAQ](/power-apps/user/request-license#request-a-license).

### Why are licensing compliance notifications being introduced for managed environments?

This requirement isn't new. When you activate managed environments in an environment, all active users need at least one premium license per user or capacity add-ons to access respective resources. This initiative helps organizations achieve and maintain compliance with existing licensing terms by proactively notifying administrators as well as end users who don't have the required license. 

The courtesy notification period gives your organization time to review usage and assign licenses before February 2027 so you can ensure your users have the appropriate licenses to open apps in managed environments.

### When do the notifications begin?

In-application notifications for end users began in June 2026 and will continue. Administrative notifications began in March 2026 through the Microsoft 365 Message center and Power Platform admin center. Both in-application and administrative notifications continue after February 2027, when users who don't have an appropriate license can no longer open the app.

### What changes in February 2027?

Starting February 2027, an appropriate license is strictly required for a user to open an app in a managed environment. If an appropriate license isn't assigned to the user, the app doesn't open and shows the standard *You need a Power Apps license to use this app* message.

> [!IMPORTANT]
> Review the license assignment for your managed environment users before February 2027 so that your users don't lose access to their apps.

### Which environments are in scope?

Only environments that you enable as **managed environments** are in scope. For more information, see <a>managed environments overview</a>.

### Which users are in scope?

Every user who runs an app in a managed environment is in scope, including users who run standard apps. The requirement applies to active usage in the environment rather than to the type of app.

### What licenses satisfy the requirement?

This article details the [licensing requirements for managed environments](#licensing-requirements-for-managed-environments). For the complete and current list of qualifying licenses, refer to the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).

### End-user experience

#### What do end users experience?

If end users open an app in a managed environment without an appropriate license, they see an in-app notification. The notification informs users that the app is in a managed environment and that they need to get an appropriate license from their administrator to continue using the app. Users can request a license directly from the notification.

**Notification message and states:**

1. **Informational**: "This app requires a valid Power Apps license. Request a license from your admin." 
:::image type="content" source="media/managed-environment-licensing/informational-license-message.png" alt-text="Shows informational notification message."::: 
If the user doesn't get an appropriate license, the notification promotes to next state after 7 days.

1. **Warning**: "This app requires a valid Power Apps license. Request a license from your admin." 
:::image type="content" source="media/managed-environment-licensing/warning-license-message.png" alt-text="Shows warning notification message."::: 
If the user doesn't get an appropriate license, the notification promotes to next state after 7 days.

1. **Error**: "Action required: This app requires a valid Power Apps license. Request a license from your admin for continued access."
:::image type="content" source="media/managed-environment-licensing/error-license-message.png" alt-text="Shows error notification message.":::

#### What happens if a user doesn't get an appropriate license?

Starting February 2027, if an end user tries to open an app in a managed environment without an appropriate license, the app doesn't open for them. Apps aren't removed from the environment, and access resumes after an appropriate license is detected.
 
#### What happens when a user requests a license?

When a user selects **Request License**, the request goes to the tenant administrator. Administrators can review and act on these requests in:

- **Power Platform admin center** — **Actions** > **Recommendations**
- **Microsoft 365 admin center** — **Billing** > **Licenses** > **Requests**

### Administrator experience

#### How are administrators notified?

Administrators receive notifications through multiple channels to help them stay ahead of licensing compliance.

Administrator notifications began in March 2026, ahead of the June 2026 end user notifications, and continue ahead of the February 2027 change.

- **Microsoft 365 Message center** — Message center posts provide advance notice of upcoming changes and required actions.
- 
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

Reviewing your users and assigning licenses ahead of February 2027 is the most reliable way to keep your users from losing access to their apps.

### Related content

[Managed environments overview](managed-environment-overview.md)  <br />
[Enable managed environments](managed-environment-enable.md)  <br />
[Usage insights](managed-environment-usage-insights.md)  <br />
[Limit sharing](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md)  <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md)
