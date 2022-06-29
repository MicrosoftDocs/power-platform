---
title: "Automatic deletion of inactive Microsoft Dataverse for Teams environments (preview)  | MicrosoftDocs"
description: This article covers the automatic deletion of inactive Dataverse for Teams environments.
author: matapg007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/28/2022
ms.subservice: admin
ms.author: matgupta 
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Automatic deletion of inactive Microsoft Dataverse for Teams environments (preview) 

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Introducing a cleanup mechanism that will automatically rid your tenant of [Microsoft Dataverse for Teams environments](about-teams-environment.md) that are inactive. Dataverse for Teams environments that are considered inactive will first be disabled for 30 days, and then be subsequently deleted if no further action is taken by the administrators. This entire process is automatic (no intervention is needed).

Administrators can configure how long a Dataverse for Teams environment can be inactive before it gets automatically disabled and deleted in the new “Environment policies” page of the Power Platform admin center. The permissible range of values are: 15 days, 30 days, 45 days, 60 days, and 90 days of inactivity.
**[Jim note: does the "Environment polices" page exist?]**

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

## Timeline for inactive Dataverse for Teams environments

The following table describes the schedule for notifications and actions for Dataverse for Teams environments considered inactive.

|State of Dataverse for Teams  |Power Platform action  |
|---------|---------|
|83 days after no [user activity](#definition-of-user-activity).     | Warning of disablement email notification sent. The environment state updated on the Environments list page<sup>1</sup> and the Environment page <sup>2</sup>.       |
|87 days after no user activity.    |  Warning of disablement email notification sent. Warning of disablement email notification sent. The inactive environment state updated on the Environments list page<sup>1</sup> and the Environment page <sup>2</sup>.      |
|90 days after no user activity.      | Environment disabled. Disabled email notification sent. Warning of disablement email notification sent. The disabled environment state updated on the Environments list page<sup>1</sup> and the Environment page <sup>3</sup>.      |
|113 days after no user activity.     | Warning of deletion email notification sent. Warning of disablement email notification sent. The disabled environment state updated on the Environments list page<sup>1</sup> and the Environment page <sup>3</sup>.         |
|117 days after no user activity.     | Warning of deletion email notification sent. Warning of disablement email notification sent. The disabled environment state updated on the Environments list page<sup>1</sup> and the Environment page <sup>3</sup>.        |
|120 days after no user activity.     | Environment deleted. Deletion email notification sent.           |

<sup>1</sup> **Environment state on the Environments list page**
:::image type="content" source="media/inactive-environment-state.png" alt-text="Inactive environment state":::

<sup>2</sup>**Inactive environment alert on the Environment page**
:::image type="content" source="media/inactive-environment-state-box.png" alt-text="Inactive environment state box":::

To reactivate the Dataverse for Teams environment, select **Trigger environment activity**.

<sup>3</sup>**Disabled environment alert on the Environment page**
:::image type="content" source="media/disabled-environment-state-box.png" alt-text="Disabled environment state box":::

Disablement prevents any meaningful use of the Dataverse for Teams environment and its resources: apps can't be launched, Flows are suspended, chatbots can't be interacted with, etc. Administrators will have 30 days to re-enable the environment in the Power Platform admin center before it's deleted.

If the Teams environment remains in the disabled state for 30 days, it will be automatically deleted.  Deleted environments can be recovered up to 7 days after deletion. See [Recover environment](recover-environment.md).

To re-enable the Dataverse for Teams environment, select **Re-enable environment**.

### Notification recipients
The following users will receive email notifications described above.

- System administrators of the environment. A Dataverse for Teams environment is paired with a team in Microsoft Teams. The owners of that team are automatically granted the System Administrator role. They'll receive the email notifications and can revert the process at any time in the Power Platform admin center.
- Dataverse for Teams user who created the environment.
- Additionally, when the Dataverse for Teams environment is disabled, users and makers are notified on the Environments list and Environment pages.

> [!NOTE]
> The members of the team in Microsoft Teams won't receive the email notifications.

### Definition of user activity

A single measure of inactivity is computed for each Dataverse for Teams environment. That measure accounts for all activity by users, makers, and admins across Power Apps, Power Automate, Power Virtual Agents, and Dataverse. Most create, read, update, and delete (CRUD) operations on the environment and its resources that are initiated by a user, a maker, or an admin are considered as activity. Most read operations aren't accounted for. Below are some examples of user activity.

**User activity**
- Launch an app, execute a flow (whether automatic or not), chat with a Power Virtual Agents bot, etc.

**Maker activity**
- Create, read, update, or delete an app, flow (desktop and cloud flows), Power Virtual Agents bot, custom connector, etc.

**Admin activity**
- Environment operations such as copy, delete, back up, recover, reset, etc.  

> [!NOTE]
> Activity does include automated behaviors such as scheduled flow runs. For example, if there is no explicit user, maker, or admin activity within a Dataverse for Teams environment, but it contains a cloud flow which is executed daily, the Dataverse for Teams environment will be considered as active.

### Example cases

- When turning on the deletion mechanism. Suppose a Dataverse for Teams environment that has been inactive for 90 days. When we turn on the cleanup mechanism, that environment will immediately be flagged and will be scheduled for disabling in 7 days.
- When reducing the maximum inactivity period. Suppose a Dataverse for Teams environment that has been inactive for 60 days. If the maximum inactivity period is set to 30 days, that environment will immediately be flagged and will be scheduled for disabling in 7 days.
- When extending the maximum inactivity period. Suppose a Dataverse for Teams environment that has been inactive for 58 days and the maximum inactivity period is set to 60 days. If the maximum inactivity period is extended to 90 days, that environment is no longer scheduled for disabling.
- When user activity is detected. Suppose a Dataverse for Teams environment that has been inactive for 88 days. If a single user interacts with a Power App in the Teams channel, that is considered as activity and will reset the environment’s inactivity counter to 0 days. As a result, the email notifications are voided and the status messages in the Power Platform admin center are removed.

### See also
[Microsoft Dataverse for Teams environments](about-teams-environment.md) <br />
[Recover environment](recover-environment.md)



[!INCLUDE[footer-include](../includes/footer-banner.md)]