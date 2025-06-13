---
title: Automatic deletion of inactive Dataverse for Teams environments
description: Admins can configure an automatic cleanup process that removes inactive Dataverse for Teams environments from their tenants.
author: matapg007
contributors:
  - yingchin
  - sericks
ms.component: pa-admin
ms.topic: concept-article
ms.date: 06/13/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: matgupta 
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---

# Automatic deletion of inactive Dataverse for Teams environments

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Power Platform provides a cleanup mechanism that automatically removes [Microsoft Dataverse for Teams environments](about-teams-environment.md) from your tenant that are left inactive. An environment is first disabled after 90 days of inactivity. And then, deleted if administrators don't take any action and the environment is left disabled for 30 days. Administrators have seven days to recover deleted environments.

> [!NOTE]
> To understand automatic deletion of Power Platform environments that aren't Dataverse for Teams environments, go to [Automatic deletion of inactive Power Platform environments](automatic-environment-cleanup.md).

A disabled or deleted environment doesn't affect any other Microsoft Teams assets (Teams, channels, SharePoint sites, Teams-connected sites, and so on) and applies only to Dataverse integrations. This cleanup process is automatic. If you no longer need an inactive Dataverse for Teams environment, you don't need to do anything.

Disabling a Dataverse for Teams environment prevents any meaningful use of the environment and its resources. Apps can't be launched, flows are suspended, chatbots can't be interacted with, and so on.

## Definition of user activity

Power Platform calculates a single measure of inactivity for each Dataverse for Teams environment. The measure accounts for all activity by users, makers, and admins across Power Apps, Power Automate, Microsoft Copilot Studio, and Dataverse.

User activities include most create, read, update, and delete operations on environment resources. Most read operations like visits to the home page, solution explorer, and Power Apps or Power Automate designer aren't considered activities.

Here are some examples of the types of activities that are included in the measure:

- **User activity**: Launch an app, execute a flow (whether automatic or not), chat with a Microsoft Copilot Studio bot.

- **Maker activity**: Create, update, or delete an app, flow (desktop and cloud flows), Microsoft Copilot Studio bot, custom connector.

- **Admin activity**: Environment operations such as copy, delete, back up, recover, reset.

Activity includes automated behaviors such as scheduled flow runs. For example, if there's no user, maker, or admin activity in an environment, but it contains a cloud flow that runs daily, then the environment is considered active.

## Notification recipients

The following users receive email notifications on the schedule described in the timeline:

- System administrators of the environment.

    A Dataverse for Teams environment is paired with a team in Microsoft Teams. The owners of the team are automatically granted the System Administrator role for the environment. They receive email notifications and can [trigger activity, re-enable, and recover the environment](#trigger-activity-re-enable-and-recover-a-dataverse-for-teams-environment) in the Power Platform admin center. Team members and guests don't receive the email notifications.

- The creator of the environment.
- If environment administrators are no longer part of the tenant, then the tenant administrators are notified.

Additionally, users and makers aren't notified on the Environment's list page and Environment page when the Dataverse for Teams environment is disabled.

## Timeline for inactive Dataverse for Teams environments

The following table describes the schedule of notifications and actions for Dataverse for Teams environments that are considered inactive.

| State of Dataverse for Teams | Power Platform action |
| --- | --- |
| 83 days after no [user activity](#definition-of-user-activity) | Send a warning that the environment will be disabled. Update the environment state on the Environments list page and the Environment page. |
| 87 days after no user activity | Send a warning that the environment will be disabled. Update the inactive environment state on the Environments list pages and the Environment page. |
| 90 days after no user activity | Disable the environment. Send a notice that the environment has been disabled. Update the disabled environment state on the Environments list page and the Environment page. |
| 113 days after no user activity | Send a warning that the environment will be deleted. Update the disabled environment state on the Environments list page and the Environment page. |
| 117 days after no user activity | Send a warning that the environment will be deleted. Update the disabled environment state on the Environments list page and the Environment page. |
| 120 days after no user activity | Delete the environment. Send a notice that the environment has been deleted. |

**Environment state on the Environments list page in Power Platform admin center**
:::image type="content" source="media/inactive-teams-environment/inactive-environment-state.png" alt-text="Screenshot of the Environments list page in Power Platform admin center, with the environment state column highlighted.":::

**Inactive environment alert on the Environment page in Power Platform admin center**
:::image type="content" source="media/inactive-teams-environment/inactive-environment-state-box.png" alt-text="Screenshot of the inactive environment alert on the Environment page, with the Trigger environment activity checkbox highlighted.":::

> [!NOTE]
> The **Environment inactive** warning tile only displays if the Dataverse for Teams environment is <= 7 days until disablement.
>
> The **Environment disabled** tile displays anytime a Dataverse for Teams environment is disabled due to inactivity.

## Trigger activity, re-enable, and recover a Dataverse for Teams environment

By default, administrators have 30 days to re-enable an environment. An environment disabled for 30 days is automatically deleted. Administrators have seven days to recover a deleted environment. See [Recover a deleted Dataverse for Teams environment](#recover-a-deleted-dataverse-for-teams-environment).

## Trigger activity for an inactive Dataverse for Teams environment

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** list page, choose an inactive environment.
1. On the **Environment** page, in the **Environment inactive** pane, select **Trigger environment activity**.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** list page, choose an inactive environment.
1. On the **Environment** page, in the **Environment inactive** pane, select **Trigger environment activity**.

---

## Re-enable a disabled Dataverse for Teams environment

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** list page, choose a disabled environment.
1. In the **Details** pane, select **Edit**.
1. In the **Edit details** pane, under **Administration mode**, toggle the setting to **Enabled**.
1. Select **Save** to apply the changes.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** list page, choose a disabled environment.
1. In the **Details** pane, select **Edit**.
1. In the **Edit details** pane, under **Administration mode**, toggle the setting to **Enabled**.
1. Select **Save** to apply the changes.

---

## Recover a deleted Dataverse for Teams environment

#### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** list page,  select **Recover deleted environments** in the command bar.
1. On the **Deleted** page, select the environment you want to recover.
1. Select **Continue** to confirm the recovery.
1. Select **Ok** to proceed with the recovery.

#### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** list page,  select **Recover deleted environments** in the command bar.
1. On the **Deleted** page, select the environment you want to recover.
1. Select **Continue** to confirm the recovery.
1. Select **Ok** to proceed with the recovery.

---

For more information about recovering environments, see [recover environment](recover-environment.md).

### See also

[Microsoft Dataverse for Teams environments](about-teams-environment.md)<br />
[Recover environment](recover-environment.md)  <br />
[Automatic environment cleanup](automatic-environment-cleanup.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
