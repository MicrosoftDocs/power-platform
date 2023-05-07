---
title: "Automatic cleanup of inactive environments"
description: "Learn about the automatic process to identify and disable environments with an inactive subscription, and the actions you can take to prevent deletion."
author: matapg007
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/06/2023
ms.subservice: admin
ms.author: matgupta 
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Automatic environment cleanup

Operational processes for datacenters periodically identify environments for tenants that do not have an active subscription. The automatic environment cleanup process starts after all commerce-based licenses acquired for a tenant reach a deprovisioned state. Environments within such a tenant are marked for deactivation and eventual deletion. You can renew or purchase a subscription for the tenant to return environments to **active** status.

> [!TIP]
> If you get notifications about exceeding your entitled storage capacity, see [Changes for exceeding storage capacity entitlements](capacity-storage.md#changes-for-exceeding-storage-capacity-entitlements) for actions you can take. 
> 
> For information on automatic cleanup of Microsoft Dataverse for Teams environments, see [Automatic deletion of inactive Microsoft Dataverse for Teams environments](inactive-teams-environment.md).

To see the status of your environments:

1. Sign in as an admin to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Environments**.
3. Look for environments with **Inactive** status.

> [!div class="mx-imgBorder"] 
> ![Inactive environment.](media/inactive-environment.png "Inactive environment")

## Types of environments affected
Only production and sandbox environments are affected by the automatic cleanup.

## Admin notification

Here's what you can expect to receive if you, as an admin or someone in your organization, has created an environment that is marked for cleanup. 

- 14 days prior to disabling the environment, an email is sent to all admins in your organization.
- 7 days prior to disabling the environment, an email is sent to all admins in your organization.
- 1 day prior to disabling the environment, an email is sent to all admins in your organization.
- If no action is taken, the environment will be deleted 10 days after the final email.

## Actions you can take to prevent environment disabling and deletion

Anytime prior to the environment deletion you can purchase licenses. Be sure to purchase enough licenses and/or capacity to cover all the production environments in your tenant. See [Licensing overview for Microsoft Power Platform](pricing-billing-skus.md).
Within 24 hours after the licenses and capacity are applied to your tenant, the environment is automatically enabled. If your environment has already been deleted, it is possible to recover it within a limited window of time. See [Recover environment](recover-environment.md).

> [!IMPORTANT] 
> Please allow ample time to take appropriate action. Your organization may have a central admin and purchasing group and might be purchasing through Microsoft partners. Please plan accordingly. 

## Environment cleanup based on inactivity
Power Platform provides a cleanup mechanism that automatically removes environments from your tenant that are left inactive. An environment will first be disabled after 90 days of inactivity. If no action is taken by administrators and the environment is left disabled for 30 days, it will then be deleted. Administrators have 7 days to recover deleted environments. This cleanup process is automatic.

> [!IMPORTANT]
> This feature can't be turned off. Admin, however, can review the last activity date for developer environments in Power Platform admin center.

### Types of environments affected
Developer and [Dataverse for Teams environments](inactive-teams-environment.md) are affected by the inactvity-based cleanup.

### Timeline for inactive environments

The following table describes the schedule of notifications and action taken for environments that are considered inactive.

| State of environment | Power Platform action |
| --- | --- |
| 83 days after no [user activity](#definition-of-user-activity) | Send a warning that the environment will be disabled. Display the number of days until disablement in the **Environment state** on the **Environments** list page and the **Environment** page. |
| 87 days after no user activity | Send a second warning that the environment will be disabled. |
| 90 days after no user activity | Disable the environment. Send a notice that the environment has been disabled. Update the disabled environment state on the **Environments** list page and the **Environment** page. |
| 23 days after environment disabled | Send first warning that the environment will be deleted. Show days until deletion in the **Environment state** field on the **Environments** list page and the **Environment** page. |
| 27 days after environment disabled | Send second warning that the environment will be deleted. |
| 30 days after environment disabled | Delete the environment. Send a notice that the environment has been deleted. |

### Notification recipients

The following users will receive email notifications on the schedule described in the timeline:

- The environment's administrators
- The user who created the environment 

Additionally, users and makers are notified on the **Environments** list page and **Environment** page when the environment is disabled.

### Definition of user activity

Power Platform calculates a single measure of inactivity for each environment. The measure accounts for all activity by users, makers, and admins across Power Apps, Power Automate, Power Virtual Agents, and Dataverse.

Most create, read, update, and delete operations on the environment&mdash;and its resources that a user, maker, or admin initiates&mdash;are considered activity. Most read operations like visits to the home page, solution explorer, Power Apps or Power Automate designer are not considered as activity.

Here are some examples of the types of activities that are included in the measure:

- **User activity**: Launch an app, execute a flow (whether automatic or not), chat with a Power Virtual Agents bot
- **Maker activity**: Create, update, or delete an app, flow (desktop and cloud flows), Power Virtual Agents bot, custom connector
- **Admin activity**: Environment operations such as copy, delete, back up, recover, and reset  

Activity includes automated behaviors such as scheduled flow runs. For example, if there's no user, maker, or admin activity in an environment, but it contains a cloud flow that runs daily, then the environment is considered active.

## Trigger activity, re-enable, and recover environment

By default, administrators have 30 days to re-enable an environment. If the environment remains disabled for 30 days, it's automatically deleted. Administrators have seven days to recover a deleted environment. See [Recover a deleted environment](#recover-a-deleted-environment).

### Trigger activity for an inactive environment 

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

For more information, see [recover environment](recover-environment.md).

### See also
[Backup and restore environments](backup-restore-environments.md) <br />
[Licensing overview for Microsoft Power Platform](pricing-billing-skus.md)<br />
[Automatic deletion of inactive Microsoft Dataverse for Teams environments](inactive-teams-environment.md) <br />
[Microsoft Power Apps and Power Automate Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
