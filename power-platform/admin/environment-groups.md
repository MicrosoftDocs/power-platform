---
title: Environment groups (preview)
description: Learn how to organize your Managed Environments into groups and govern them in bulk with rules.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/14/2024
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
---
# Environment groups

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Initial paragraph (introduction)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-note.md)]

## Use environment groups

Here's how you can route all to personal productivity toa group with sharing limit configure

## Create an environment group
[Power Platform tenant administrators](https://learn.microsoft.com/en-us/power-platform/admin/use-service-admin-role-manage-tenant) can create as many environment groups as necessary to meet their organization's needs. In this tutorial, you will create a single environment group named *Personal Productivity*.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Environment groups** in the navigation pane.
3. On the *Environment groups* page, select **New group**.
4. In the **Create group** pane that appears, you can:
  A. Enter a name for the group in the **Name** field such as "Personal Productivity".
  B. Enter a brief description of the group in the **Description** field.
  C. Select **Create**.

## Configure the rules for your environment group
After creating the environment group, you can immediately add environments or configure its rules. Currently, there are six available rules, which are the same capabilities offered when upgrading an _individual_ environment to a [Managed Environment](https://learn.microsoft.com/en-us/power-platform/admin/managed-environment-overview). In this section, you''ll begin by configuring the *sharing limits* rule. Since the environment group is intended for personal productivity, makers will be restricted from sharing their canvas apps with other users. This will help ensure that each environment in the group remains a private space for individual work.

1. In the *Personal Productivity* group, select the **Rules** tab.
2. Select the **Sharing Limits** rule to open its configuration panel.
3. Select *Exclude sharing with security group*.
4. Select *Limit total individuals who can share to*, and then enter the number 1 into the box.
5. Click **Save**.
6. Repeat these steps until all desired rules have been configured.
7. Click **Publish rules**.

> [!NOTE]
> All rules are equally applied to all environments in the group.

## Route environments to your environment group
With your environment group set up, it can now serve as the home for all new personal Developer environments that are created through environment routing. This provides the assurance that all of those new Developer environments that are created automatically are pre-configured and meet baseline requirements from the start.

1. Return to the **Environment groups** page.
2. Select the **Environment Routing** button in the command bar.
3. Under the *Environment group* section, select the group you want your new Developer environments to be located in.
4. Click **Save**.

[Screenshot of the Environment Routing panel]

> [!NOTE]
> For Developer environments in the 'Personal Productivity' group, the sharing limit cannot be changed within individual environment settings. The same applies to other rules. To make changes, adjust the rule and the change will apply to all environments in the group.

[Screenshot of the disabled ME panel]

## Add environments to your environment group
You can manually add environments to the 'Personal Productivity' group if you have existing developer environments that belong there.

1. Select the **Personal Productivity** group.
2. Click the *Add environments* button in the command bar.
3. Select the environment from the list of Managed Environments.
6. Click **Add**.

> [!NOTE]
> Only Managed Environments can be added to an environment group.
> It may take up to a minute for the environment to be added. You'll need to refresh the list manually to see it.

You can also create environments into the group in the Power Platform admin center.

1. Go to the *Environments* page.
2. Click *New* in the command bar.
3. Select the **group** you want to create the environment is.
4. Enter the other details.
7. Click **Save**.

[Screenshot of environment creation]

## Remove an environment from your environment group
You always have the option to remove an environment from a group if it now warrants unique governance or if it was simply placed there by accident.

1. Select the **Personal Productivity** group.
2. Select the environment that you wish to remove.
3. Click **Remove from group** in the command bar.

> [!NOTE]
> When you remove an environment from the group, it retains its configuration (ex. sharing of canvas apps is still limited to 1 user). However, it is now unlocked and can be managed individually. You'll notice the environment's **Edit Managed Environments** panel will be re-enabled.

## Delete an environment group
As you experiment with environment groups, you may end up with some leftover groups that you'll want to delete to avoid clutter.

1. Go to the "Environment groups" page.
2. Select the environment group that you wish to delete.
3. Click *Delete group* in the command bar.

> [!NOTE]
> To delete a group, you must first remove all of its environments and ensure that no developer environments are being routed to it. Otherwise, you'll receive a warning that prevents you from deleting the group.

[Screenshot of the warning dialog]

## Known limitations


### See also

[Managed Environments overview](managed-environment-overview.md)  <br /> 
[Usage insights](managed-environment-usage-insights.md)  <br />
[Limit sharing](managed-environment-sharing-limits.md)  <br />
[Data policies](managed-environment-data-policies.md) <br />
[Licensing](managed-environment-licensing.md)  <br />
[View license consumption (preview)](view-license-consumption-issues.md) <br />
[Tenant settings](tenant-settings.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
