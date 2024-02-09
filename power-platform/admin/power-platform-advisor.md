---
title: Use Power Platform Advisor (preview)
description: Learn how to use Power Platform Advisor to optimize your tenant.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 1/29/2024
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
search.audienceType:
  - admin
---

# Use Power Platform Advisor (preview)

[This article is prerelease document and is subject to change.]

Power Platform Advisor is your guide to personalized recommendations to optimize your Power Platform tenant. Advisor analyzes all Managed Environments and the apps in these environments within your Power Platform tenant. Advisor offers solutions to enhance security, reliability, and overall health.

With Advisor, administrators can:

- Get proactive and offer best practice recommendations.
- Improve the overall health of their Power Platform tenant.
- Take inline actions or automate actions using cloud flows.

## Access Power Platform Advisor

All tenant admins can access Advisor in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) by selecting **Advisor (Preview)** in the navigation menu.

Tenant admins must have at least _one_ of the following roles:

- Power Platform admin role
- Dynamics 365 admin role
- Global admin role within the Power Platform tenant

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - Advisor currently scans only the Managed Environments in the tenant for recommendations. Scanning is done once a week.
> - To submit feedback and suggestions, use the [Power Platform Advisor - Feedback](https://aka.ms/padvisorfeedback) form.

## Turn on Power Platform Advisor

Advisor is turned on by default for all [Managed Environments](managed-environment-overview.md). Recommendations are only available after you turn on [tenant-level analytics](tenant-level-analytics.md).

## Key capabilities

### Recommendations

Power Platform tenant admins can view the top recommendations on the **Advisor (Preview)** card. If the Power Platform admin center home page isn't customized, this card is automatically pinned on the **Home** page. Your tenant is scanned for recommendations weekly.

- Select **View details** on any recommendation to view its details.
- Select **View recommendations** to view all recommendations on the **Advisor (Preview)** page.

:::image type="content" source="media/power-platform-advisor/advisor-card.svg" alt-text="Advisor card on the home page.":::

> [!TIP]
> If the home page is customized, you don't see the **Advisor (Preview)** card, or you removed the card from the home page, you can select **+ Add cards** to add the card to the **Home** page.
> :::image type="content" source="media/power-platform-advisor/add-card.png" alt-text="Screenshot that shows how to add an advisor card to your home page in Power Platform admin center.":::

### Inline actions

You can take action for each recommendation in the recommendation pane. An admin can take relevant actions for a specific resource or take a bulk action by selecting up to 10 resources from the recommendation list. For certain recommendations that require action by a nonadmin user, detailed instructions are displayed. To learn more, see [Categories of recommendations](#categories-of-recommendations).

### Automated actions

Power Platform Advisor supports automated actions in the [Power Platform for Admin V2](/connectors/powerplatformadminv2/) connector, which are useful to build a process for remediations. For example, instead of deleting an unused app, an admin can first send an email or message to the owner of the app. The message informs the owner about an impending action. If the admin doesn't receive a reply from the owner, the app can be deleted.

While building cloud flows using the connector, you can get Power Platform Advisor recommendations and actions:

- **Get Recommendations**: Returns all the valid recommendations in your tenant.
- **Get Recommendation Resources**: Returns all the resources for a specific recommendation.
- **Execute Recommendation Action**: Executes a specific action for a specific resource listed in a recommendation.

### Share recommendations

All recommendations in Power Platform Advisor can be shared in Microsoft Teams with other users for team collaboration.

:::image type="content" source="media/power-platform-advisor/share-in-teams.png" alt-text="Screenshot showing the Share in Teams option to select." lightbox="media/power-platform-advisor/share-in-teams.png":::

An admin can share the entire recommendation or share specific rows within the recommendation to another user by entering their name in the **Share to** textbox in the **Share this recommendation** pane.

When an entire recommendation or multiple rows in the recommendation is shared, the sharing card provides a link to that recommendation for the admin.

:::image type="content" source="media/power-platform-advisor/share-to.png" alt-text="Screenshot that shows where to enter a name in the Share to textbox.":::

> [!NOTE]
> - Shared recommendations are sent as an adaptive card in a personal Teams chat.
> - When recommendations are shared, the sharing card provides a link to that recommendation for the admin.
> - When an app or resource is shared, the sharing card provides a link to both the recommendation and the app in the maker portal.

### Advisor summary card in Microsoft Teams

Once per week, Power Platform Advisor sends a summary card in Teams highlighting the top two recommendations the admin should focus on for that week. These highlights help admins invest their time on the most important recommendations.

To get the summary card, admins should install the **Power Apps** app in Teams.

Once installed, admins can view the summary cards in their Teams chats.

## Categories of recommendations

During the public preview, the recommendations focus on security and operational efficiency. You can view these recommendations by category and learn about actions to resolve issues or seize opportunities.

### Apps without valid owners

This type of recommendation lists apps in all the Managed Environments within your Power Platform tenant that don't have a valid owner. Currently this list contains apps active in the last 90 days.

> [!IMPORTANT]
> Resources with valid owners can make necessary changes or support users when an issue arises. If an app doesn't have a valid owner, it might be a business continuity risk.

#### Supported actions for apps without owners

##### Assign to new owner

1. To assign an app to a new owner, select the app from the list.
1. Select **Assign to new owner**.
1. Enter the new owner's name in the text box near the app list and select **Assign**.

Once assigned, you see a success message and the **Action State** column for that row displays **Completed**. You can't retake actions for completed rows.

> [!NOTE]
>
> - New owner information isn't updated in the list.
> - The app is shown in the list until the next planned scan.
> - New owners don't automatically get permissions to the environment or data sources used in the app. Admins must manually give owners permission.

##### Promote co-owner to owner

With multiple co-owners of an app, admins can promote one of the co-owners to owner.

1. Select an app and select **Promote co-owner to owner**.

   If you select multiple apps, Power Platform Advisor displays any shared co-owners for the selected apps.

1. Select **Assign app** to promote the co-owner to owner for all selected apps.

### Unused apps in the last 60 days

This recommendation lists unused apps in all Managed Environments within your Power Platform tenant from the last 60 days.

### Apps that aren't used in last 60 days

This recommendation lists apps in all Managed Environments within your Power Platform tenant that aren't used in the last 60 days. It's important that unused and unnecessary resources be removed periodically, to reduce the risk of exposure of your resources and to maintain proper hygiene of the tenant.

> [!IMPORTANT]
> Unused or unnecessary resources should be removed periodically to:
>
> - Reduce the risk of exposing your resources.
> - Maintain proper hygiene of the tenant.

#### Supported actions for unused apps

##### Quarantine

Select one or more apps from the list and select **Quarantine**.

Once you confirm the quarantine operation, the selected apps are quarantined. After apps are quarantined, you can make them active again using the [Set-AppAsUnquarantined PowerShell command](../guidance/adoption/manage-default-environment.md#quarantine-apps).

##### Delete

Select one or more apps from the list and select **Delete**.

After you confirm the delete operation, the selected apps are deleted.

### Apps shared with everyone

This recommendation lists apps in all Managed Environments within your Power Platform tenant that are actively used and shared with **Everyone**, such as guest users in your Microsoft Entra tenant.

> [!IMPORTANT]
>
> - Only apps required for the entire organization are shared with **Everyone**.
> - Oversharing apps can pose significant security risks by exposing assets or allowing potential misuse.
> - Periodically review overshared apps and adjust permissions.

### Apps that aren't part of a solution

This recommendation lists apps in all Managed Environments within your Power Platform tenant that are actively used, but not part of a solution. An app that's not part of a solution means the app was both developed and used in the same environment.

> [!IMPORTANT]
> Apps should follow application lifecycle management (ALM) best practices. Not following proper ALM could cause a single change to break the app for several users with no easy way to recover.
>
> The new _pipelines_ feature helps citizen developers, without prior ALM experience, to safely deploy their apps and dependent assets to a production environment.
