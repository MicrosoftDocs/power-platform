---
title: Automatic deletion of Power Platform environments
description: Learn about the automatic processes that identify and disable Power Platform environments and how you can prevent them from being deleted.
ms.component: pa-admin
ms.topic: how-to
ms.date: 03/24/2025
ms.subservice: admin
author: matapg007
ms.author: matgupta 
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.custom: bap-template
---

# Automatic deletion of Power Platform environments

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Automated processes periodically identify, disable, and eventually delete inactive Power Platform environments to optimize storage capacity. An environment may be deleted because it's in a tenant with an expired subscription or because it's not being used. In either case, there are actions you can take to prevent the environment from being deleted.

## View the status of your environments

1. Sign in as an admin to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Environments**.
3. Look for environments with an **Inactive** status.

    :::image type="content" source="media/inactive-environment.png" alt-text="Screenshot of a list of environments in the Power Platform admin center, with an inactive environment highlighted.":::

## Environments in a tenant with an expired subscription

If the subscription for a tenant has expired or been deprovisioned, all the environments in the tenant are marked for deactivation and eventual deletion. When an environment is marked for cleanup, the system sends an email notification to all admins in your organization 14 days, 7 days, and 1 day before the environment is disabled. If no action is taken, the environment is deleted 10 days after the final email is sent.

> [!TIP]
> If you get notifications about exceeding your entitled storage capacity, see [Changes for exceeding storage capacity entitlements](capacity-storage.md#changes-for-exceeding-storage-capacity-entitlements) for actions you can take.

Only production and sandbox environments are affected by the subscription-based automatic cleanup. [Learn about automatic deletion of inactive Microsoft Dataverse for Teams environments](inactive-teams-environment.md).

### Actions you can take if your subscription has expired

[Renew or purchase licenses](pricing-billing-skus.md) before the environments are deleted. Be sure to purchase enough licenses and capacity to cover all the production environments in your tenant. The environments are automatically re-enabled within 24 hours.

If an environment has already been deleted, you have a limited window of time to [recover it](recover-environment.md).

> [!IMPORTANT]
> Allow ample time to renew or purchase licenses before your environments are deleted. Your organization may have a central admin and purchasing group and might be purchasing through Microsoft partners. Plan accordingly.

## Inactivity-based cleanup

A cleanup mechanism in Power Platform automatically removes environments that aren't being used. Only default, developer, and [Dataverse for Teams environments](inactive-teams-environment.md) are affected by the activity-based automatic cleanup.

## Default environment 
Power Platform is implementing a cleanup process for default environments that meet the following criteria. After 90 days of inactivity, two warning notifications are sent to environment administrators, if no action is taken, the environment is deleted. You have seven days to recover deleted environments.

- Environments with [premium licenses](pricing-billing-skus.md) aren't included in the cleanup.
- Environments with Microsoft 365 agents or planner activity aren't included in the cleanup.
- Environments with flows aren't cleaned up until they have a year of inactivity, to allow for annual and seasonal activity.
- Admins receive two warning notifications before the default environment is deleted due to inactivity.
- Any activity within 30 days of the notification resets the inactivity period.
- Inactive environments are deleted after 30 days of inactivity notification. 

During the deletion process, a new replacement default environment is created without Dataverse, with an option to add Dataverse later, and the previous default environment is deleted. After an environment is deleted, it can be recovered within the next seven days. However, the environment type is changed to **production** type upon restoration, as we can't overwrite the new default environment.

> [!IMPORTANT]
> You can't turn off this cleanup mechanism. However, you can review the last activity date for environments in the Power Platform admin center. 

## Developer environment
 Power Platform is implementing a cleanup process for developer environments that meet the following criteria. After 30 days of inactivity, an environment is turned off. After 30 days, if no action is taken, the environment that was turned off is deleted. You have seven days to recover deleted environments.

- Admins receive two warning notifications before the environment is deleted due to inactivity.
- Any activity within 15 days of the notification resets the inactivity period.
- Inactive environments are deleted after 15 days of inactivity notification.
  
### Timeline for unused environments

The environment's administrators and the user who created the environment are notified by email according to the schedule described in the following table.

| State of environment | Power Platform action |
| --- | --- |
| 23 days with no [user activity](#definition-of-user-activity) | Send a warning that the environment will be disabled and display a countdown in the **Environment state** on the **Environments** list page and the **Environment** page. |
| 27 days with no user activity | Send a second warning that the environment will be disabled. |
| 30 days with no user activity | Disable the environment, send a notice that the environment has been disabled, and update the **Environment state** on the **Environments** list page and the **Environment** page. |
| 7 days after the environment is disabled | Send a warning that the environment will be deleted and display a countdown in the **Environment state** on the **Environments** list page and the **Environment** page. |
| 11 days after the environment is disabled | Send a second warning that the environment will be deleted. |
| 15 days after the environment is disabled | Delete the environment, and send a notice that the environment has been deleted. |

A notification appears on the **Environments** list page and **Environment** page when an environment is disabled.

### Definition of user activity

Power Platform calculates a single measure of inactivity for each environment. The measure accounts for all activity by users, makers, and admins across Power Apps, Power Automate, Microsoft Copilot Studio, and Dataverse.

Most create, read, update, and delete operations on the environment&mdash;and its resources that a user, maker, or admin initiates&mdash;are considered activity. Most read operations like visits to the home page, solution explorer, and Power Apps or Power Automate designer aren't considered activity.

Here are some examples of the types of activities that are included in the measure:

- **User activity**: Launch an app, execute a flow (whether automatic or not), chat with a Microsoft Copilot Studio bot
- **Maker activity**: Create, update, or delete an app, flow (both desktop and cloud flows), Microsoft Copilot Studio bot, or custom connector
- **Admin activity**: Environment operations such as copy, delete, recover, and reset  

Activity includes automations such as scheduled flow runs. For example, if there's no user, maker, or admin activity in an environment, but it contains a cloud flow that runs daily, then the environment is considered active.

## Trigger activity, re-enable, and recover an environment

By default, administrators have 15 days to re-enable an environment. If the environment remains off for 15 days, it's automatically deleted. Administrators have seven days to [recover a deleted environment](#recover-a-deleted-environment).

### Trigger activity in an inactive environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Environments**, and then select the inactive environment.
3. On the **Environment** page, select **Trigger environment activity**.

### Re-enable a disabled environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Environments**, and then select the disabled Dataverse for Teams environment.
3. On the **Environment** page, select **Re-enable environment**.

### Recover a deleted environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. Select **Environments**, and then select **Recover deleted environments**.
3. Select an environment to recover, and then select **Recover**.

[Learn more about recovering an environment](recover-environment.md).

> [!NOTE]
> Recovering a Teams environment that was deleted due to inactivity requires a tenant-level administrative role.

### See also

[Back up and restore environments](backup-restore-environments.md)  
[Automatic deletion of inactive Microsoft Dataverse for Teams environments](inactive-teams-environment.md)  
[Licensing overview for Microsoft Power Platform](pricing-billing-skus.md)  
[Microsoft Power Apps and Power Automate licensing guide](https://go.microsoft.com/fwlink/?linkid=2085130)

[!INCLUDE [footer-include](../includes/footer-banner.md)]
