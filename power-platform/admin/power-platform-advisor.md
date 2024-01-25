---
title: Use Power Platform Advisor (preview)
description: Learn about how to use Power Platform Advisor to optimize your tenant.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/08/2023
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
search.audienceType:
  - admin

---

# Use Power Platform Advisor (preview)

[This article is prerelease documentation and is subject to change.]

Power Platform Advisor is your guide to personalized recommendations to optimize your Power Platform tenant. It analyzes all Managed Environments and the apps in these environments within your Power Platform tenant, and offers solutions to enhance security, reliability, and overall health. 

Currently, Power Platform Advisor is available for all tenant-level admin users. These include users with the Power Platform admin role, Dynamics 365 admin role, or a Global admin role within the Power Platform tenant. 

With Power Platform Advisor, administrators can: 

- Get proactive, best practice recommendations. 
- Improve the overall health of your Power Platform tenant. 
- Take inline actions or automate actions using cloud flows. 

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - Power Platform Advisor currently scans only the Managed Environments in the tenant for recommendations. Scanning is done once a week.
> - To submit feedback and suggestions, use [this form](https://aka.ms/padvisorfeedback).

## Turn on Power Platform Advisor
Power Platform Advisor is turned on by default for all [Managed Environments](managed-environment-overview.md), however, recommendations are only available after you turn on [tenant-level analytics](tenant-level-analytics.md).

## Key capabilities

### Recommendations
Power Platform tenant admins can view the top recommendations on the **Advisor (Preview)** card. If the Power Platform admin center home page isn't customized, this card is automatically pinned on the home page. Your tenant is scanned for recommendations weekly. 

:::image type="content" source="media/advisor-card.svg" alt-text="Advisor card on the home page.":::

If the home page is customized or you don't see the **Advisor (Preview)** card or you removed the card from the home page, you can select **+ Add cards** to add the card to the homepage. 

The **Advisor (Preview)** card shows the top four recommendations. You can select **View details** for any of the recommendations to view the details for that recommendation. You can select the **View recommendations** button to view all the recommendations in the **Advisor (Preview)** page.
 
Power Platform Advisor can also be accessed using the **Advisor (Preview)** option in the navigation panel of the Power Platform admin center. This option takes you to the **Advisor (Preview)** page, where you can view all the recommendations.

:::image type="content" source="media/advisor-page.svg" alt-text="Advisor (Preview) page":::
 
Admins can select a recommendation from the **Advisor (Preview)** page to view the associated details for that recommendation in the recommendation panel. In this panel, admins can learn more about the recommendation, its impact, and associated resources and details.
 
### Inline actions
For each recommendation, Power Platform Advisor presents one or more relevant actions that can be taken from the recommendation panel. Depending on the recommendation, an admin can take relevant action for a specific resource or take bulk action by selecting up to 10 resources from the recommendation panel and taking an action. For certain recommendations that require action by a nonadmin user, detailed instructions are displayed. To learn more, see [Categories of recommendations](#categories-of-recommendations).

### Automated actions
Power Platform Advisor supports automated actions made through [Power Platform for Admin V2](/connectors/powerplatformadminv2/) connector. This is a useful way to build a process for remediations. For example, instead of deleting an unused app, an admin can first send an email or message to the owner of the app informing them about an impending action. If they don't receive any correspondence from the owner, the app can then be deleted.

While building cloud flows using the connector, you can get Power Platform Advisor recommendations and actions using the following actions:

-   **Get Recommendations**: This returns all the valid recommendations in your tenant.
-   **Get Recommendation Resources**: This returns all the resources for a specific recommendation.
-   **Execute Recommendation Action**: This executes a specific action for a specific resource listed in a recommendation.

### Share recommendations

All recommendations in Power Platform Advisor can be shared in Microsoft Teams with other users for team collaboration.

:::image type="content" source="media/share-in-teams.png" alt-text="Share in Teams option.":::

An admin can share the entire recommendation or share specific rows within the recommendation to another user by entering their name in the **Share to** textbox in the sharing panel. Shared recommendations or details are sent to the user as an adaptive card in a personal Teams chat.

:::image type="content" source="media/share-to.png" alt-text="Enter a name in the Share to textbox.":::

When an entire recommendation or multiple rows within the recommendation is shared, the sharing card provides a link to that recommendation for the admin.

When a specific app or resource is shared, the sharing card provides a link to the recommendation and a link to that app in the maker portal.

### Advisor summary card in Microsoft Teams

Once a week, Power Platform Advisor sends a summary card in Microsoft Teams highlighting the top two recommendations the admin should focus on for that week. This helps admins invest their time on the most important recommendations.

To get the summary card, admins should install the **Power Apps** app in Microsoft Teams.

Once installed, admin can view the summary cards in their Teams chats.

## Categories of recommendations

During the public preview, the recommendations focus on security and operational efficiency. You can view these recommendations by category and learn about actions to resolve issues or seize opportunities.

### Apps without valid owners

This type of recommendation lists apps in all the Managed Environments within your Power Platform tenant that don't have a valid owner. Currently this list contains apps that have been active in the last 90 days.

It's important that resources have valid owners to make necessary changes or to support users when an issue arises. If an app doesn't have a valid owner, it may pose business continuity risk.
 
#### Supported actions

- **Assign to new owner:** To assign an app to a new owner, select the app from the list of apps, and then select **Assign to new owner**. Enter the new owner's name in the text box below the app list and select **Assign**.

    Once assigned, you see a success message in the panel and the **Action State** column for that row displays **Completed**. You can't retake actions for completed rows.

    Note the following points:

    - New owner information isn't updated in the list.

    - The app continues to be shown in the list until the next planned scan.

    - Assigning a new owner for the app doesn't automatically provide necessary permissions to the environment or the underlying data sources used in the app. Admins should separately provision the user with necessary permissions to this user.

- **Promote co-owner to owner:** If there are multiple co-owners for an app, admins can use this action to promote one of the co-owners to an owner. To do so, select an app and select **Promote co-owner to owner**.

    If you select multiple apps, Power Platform Advisor displays any shared co-owners for the selected apps. Selecting **Assign app** makes the selected co-owner the new owner for all the selected apps.

### Apps that haven't been used in last 60 days
This recommendation lists apps in all Managed Environments within your Power Platform tenant that haven't been used in the last 60 days. It's important that unused and unnecessary resources be removed periodically, to reduce the risk of exposure of your resources and to maintain proper hygiene of the tenant.

#### Supported actions  
- **Quarantine:** To quarantine unused apps, select one or more apps from the list and select **Quarantine**. Once you confirm the quarantine operation, the selected apps are quarantined. After apps have been quarantined, you can make them active again using the [Set-AppAsUnquarantined PowerShell command](../guidance/adoption/manage-default-environment.md#quarantine-apps).

- **Delete:** To delete unwanted apps, select one or more apps from the list and select **Delete**. After you confirm the delete operation, the selected apps are deleted.

### Apps that are shared with everyone

This type of recommendation lists apps in all Managed Environments within your Power Platform tenant that are actively used and are shared with **Everyone**. **Everyone** includes any guest users in your Microsoft Entra tenant.

It's important that only those apps that are required for the entire organization are shared with **Everyone**. Oversharing apps beyond the intended users poses a significant security risk as it increases the risk exposure of your assets and could lead to potential misuse. It's important to periodically review the apps that are overshared and adjust the sharing permissions.

### Apps that aren't part of a solution

This type of recommendation lists apps in all Managed Environments within your Power Platform tenant that are actively used, but not part of a solution. An app that's not part of a solution means that the app was developed in the same environment in which it's being used.

It's important that apps follow application lifecycle management (ALM) best practices. Not following a proper ALM process could result in a single change breaking the app for several users without an easy way to recover. The new pipelines feature makes it simple for citizen developers, without prior ALM experience, to safely deploy their apps and dependent assets to a production environment.
