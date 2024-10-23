---
title: Environment groups
description: Learn how to organize your Managed Environments into groups and govern them in bulk with rules.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/23/2024
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
contributors:
- arjunmayur
---

# Environment groups

The task of managing Power Platform on a large scale across numerous environments ranging from hundreds to tens of thousands poses a significant challenge for both startup and enterprise IT teams.

Similar to folders, _environment groups_ are designed to help administrators organize their flat list of environments into structured groups based on different criteria, such as business unit, project, and location.

Admins can apply various rules to groups to govern many environments in bulk, reducing manual effort and ensuring consistency. For example, admins might apply rules to security, licensing, compliance, or other facets. Specifically, the following rules are available within each environment group:

- [Custom agent and Microsoft 365 Copilot agents sharing rules](managed-environment-sharing-limits.md#custom-agent-and-microsoft-365-copilot-agents-sharing-rules-preview)
- [AI-generated descriptions](/power-apps/maker/canvas-apps/save-publish-app#create-an-app-description-with-copilot-preview)
- [Generative AI settings](geographical-availability-copilot.md)
- [Canvas app sharing rules](managed-environment-sharing-limits.md#canvas-app-sharing-rules)
- [Maker welcome content](welcome-content.md)
- [Solution checker enforcement](managed-environment-solution-checker.md)
- [Usage insights](managed-environment-usage-insights.md)
- [Extended backup retention](backup-restore-environments.md)

## Strategies for using environment groups

There are many ways to manage pockets of environments within your tenant using environment groups. For example, global organizations can create an environment group for all environments in each geographic region to ensure compliance with legal and regulatory requirements. You can also organize environment groups by department or other criteria.

:::image type="content" source="media/environment-groups-strategy.png" alt-text="Diagram depicting one strategy for using environment groups and aligning it to your existing organizational structure.":::

This article covers how to augment your _default environment strategy_ by combining _environment groups_ with [_default environment routing_](default-environment-routing.md). Default environment routing gives makers their own personal developer environment. This environment is a secure space to build with Microsoft Dataverse and is similar to [OneDrive](https://www.microsoft.com/microsoft-365/onedrive/online-cloud-storage) for personal productivity.

Enabling _default environment routing_ might give you more environments to manage, but automatically creating them into a single environment group ensures they're preconfigured with important baseline controls your organization requires.

## Known limitations
- When creating an environment in the Power Platform admin center, the Developer and Trial subscription-based environment types may become unavailable when first selecting the environment group and the region. This is a known issue that we plan to fix soon. In the meantime, the alternative is to create the environment via API or PowerShell.

## Create an environment group

[Power Platform tenant administrators](use-service-admin-role-manage-tenant.md) can create as many environment groups as necessary to meet their organization's needs. You can create a single environment group named **Personal Productivity**, then create new managed developer environments into the group.

1. Sign in to [Power Platform Admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Environment groups** in the navigation pane.
1. On the **Environment groups** page, select **New group**.
1. In the **Create group** pane that appears:
   1. Add a name for your group in the **Name** field such as **Personal Productivity**.
   1. Add a brief description of the group in the **Description** field.
   1. Select **Create**.

> [!NOTE]
> If you prefer to operate outside of the Power Platform admin center, the [Power Platform for Admins V2 (Preview) connector](/connectors/powerplatformadminv2/) offers an alternative solution. It allows the creation and deletion of environment groups and the ability to add or remove environments from these environment groups, facilitating opportunities for automation.

## Configure the rules for your environment group

After you create the environment group, Power Platform tenant administrators can immediately add Managed Environments or configure the group's rules.

### The sharing limits rules

You can also configure the _sharing limit_ rules for canvas apps and copilots. Since the environment group is intended for personal productivity, makers are restricted from sharing their canvas apps and copilots with other users. This helps ensure that each environment in the group remains a private space for individual work.

First, go to the **Personal Productivity** group and select the **Rules** tab.

#### For canvas apps
1. Select the **Sharing controls for canvas apps** rule to open its configuration panel.
1. Select **Exclude sharing with security group**.
1. Select **Limit total individuals who can share to** and enter the number **1** in the box.
1. Select **Save**.

#### For custom agents and Microsoft 365 Copilot agents (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

1. Select the **Sharing agents with Editor permissions** rule to open its configuration panel.
2. Ensure that **Let people grant Editor permissions when Microsoft 365 Copilot agents and custom agents are shared** is unselected.
3. Select **Save**.
4. Select the **Sharing agents with Viewer permissions** rule to open its configuration panel.
5. Select **Let people grant Viewer permissions when Microsoft 365 Copilot agents and custom agents are shared**.
6. Select **Only share with individuals (no security groups)**.
7. Select **Limit the number of viewers who can access each Microsoft 365 Copilot agent and custom agent** and enter the desired number of Viewers you would like to have on the copilot.
8. Select **Save**.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/production-ready-preview-powerplatform.md)]

Repeat these steps until all desired rules are configured and select **Publish rules**.

> [!NOTE]
> All rules are equally applied to all environments in the group.

## Route environments to your environment group

With your environment group setup, it can now serve as the home for all new personal developer environments that are created by _default environment routing_. This default ensures that all newly created developer environments are automatically preconfigured to be managed environments that meet baseline requirements from the start.

### Select an environment group

1. Return to the **Environment groups** page.
1. Select the **Environment Routing** button in the command bar.
1. Under the **Environment group** section, choose the group you want your new **Developer** environments to be created in.
1. Select **Save**.

> [!NOTE]
> For developer environments in the **Personal Productivity** group, the sharing limit can't be changed in individual environment settings. The same default restriction applies to other rules. To make changes, adjust the rule and the change applies to all environments in the group.

## Add environments to your environment group

You can manually add environments to the **Personal Productivity** group if you have existing **Developer** environments that belong there.

1. Select the **Personal Productivity** group.
1. Select the **Add environments** button in the command bar.
1. Select a single environment from the list of Managed Environments.
1. Select **Add**.

> [!NOTE]
>
> - An environment can only belong to one environment group.
> - Only Managed Environments can be created into an environment group.
> - Any environment type, for example production, developer, or sandbox, can be created into an environment group as long as they are a managed environment. 

## Manually create environments in the group

You can also manually create environments in the **Personal Productivity** group.

1. Go to the **Environments** page.
1. Select **New** in the command bar.
1. Select a **group** for your created environment.
1. Enter the other details.
1. Select **Save**.

## Remove an environment from your environment group

You can remove an environment from a group if it needs unique governance or if you created it by accident.

1. Select the **Personal Productivity** group.
2. Select the environment you wish to remove.
3. Select **Remove from group** in the command bar.

> [!NOTE]
> When you remove an environment from the group, it retains its configuration. For example, sharing canvas apps is still limited to one user. However, a removed environment is now unlocked and can be managed individually. The environment's **Edit Managed Environments** panel can be used.

## Delete an environment group

As you experiment with environment groups, you might have leftover groups that you want to delete to avoid clutter.

1. Go to the **Environment groups** page.
2. Select the environment group that you wish to delete.
3. Select **Delete group** in the command bar.

> [!IMPORTANT]
> When you delete a group, first remove all of its environments and ensure no developer environments are routed to it. If a group still has environments, you see a warning that prevents you from deleting the group.



## Related content

[Managed Environments overview](managed-environment-overview.md) <br>
[Usage insights](managed-environment-usage-insights.md) <br>
[Limit sharing](managed-environment-sharing-limits.md) <br>
[Data policies](managed-environment-data-policies.md) <br>
[Licensing](managed-environment-licensing.md) <br>
[View license consumption (preview)](view-license-consumption-issues.md) <br>
[Tenant settings](tenant-settings.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
