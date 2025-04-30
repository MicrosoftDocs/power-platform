---
title: Use Power Platform Advisor
description: Learn how to use Power Platform Advisor to optimize your tenant.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/28/2025
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
ms.contributors:
- DanaMartens
search.audienceType:
  - admin
---

# Use Power Platform Advisor

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Power Platform Advisor is your guide to personalized recommendations to optimize your Power Platform tenant. Advisor analyzes all Managed Environments and the apps in these environments within your Power Platform tenant. Advisor offers solutions to enhance security, reliability, and overall health.

With Advisor, administrators can:

- Get proactive and offer best practice recommendations.
- Improve the overall health of their Power Platform tenant.
- Take inline actions or automate actions using cloud flows.

## Access Power Platform Advisor

All tenant admins can access Advisor in the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) by selecting **Advisor** from the menu options.

Tenant admins must have at least _one_ of the following roles:

- Power Platform Administrator
- Dynamics 365 Administrator

Learn more about these roles at [Use service admin roles to manage your tenant](use-service-admin-role-manage-tenant.md).

> [!IMPORTANT]
>
> - Power Platform Advisor scans for analytics-based recommendations once a week. You can check the last scanned date within the recommendation panel.
> - If a resource is deleted outside of the Advisor, certain actions fail.
> - To submit feedback and suggestions, use the [Power Platform Advisor - Feedback](https://aka.ms/padvisorfeedback) form.

## Turn on Power Platform Advisor

Advisor is turned on by default for all [Managed Environments](managed-environment-overview.md). Recommendations are only available after you turn on [tenant-level analytics](tenant-level-analytics.md).

## Key capabilities

### Recommendations

Power Platform tenant admins can view the top recommendations on the **Advisor** card. If the Power Platform admin center home page isn't customized, this card is automatically pinned on the **Home** page. Your tenant is scanned for recommendations weekly.

- Select **View details** on any recommendation to view its details.
- Select **View recommendations** to view all recommendations on the **Advisor** page.

:::image type="content" source="media/power-platform-advisor/advisor-recommendations.png" alt-text="Screenshot of Advisor card on the home page.":::

> [!TIP]
> If the home page is customized, you don't see the **Advisor** card, or you removed the card from the home page, you can select **+ Add cards** to add the card to the **Home** page.
> :::image type="content" source="media/power-platform-advisor/add-card.png" alt-text="Screenshot that shows how to add an advisor card to your home page.":::

### Inline actions

You can take action for each recommendation in the recommendation pane. An admin can take relevant actions for a specific resource or take a bulk action by selecting up to 10 resources from the recommendation list. For certain recommendations that require action by a nonadmin user, detailed instructions are displayed. To learn more, go to [recommendations](#recommendations).

### Automated actions

Power Platform Advisor supports automated actions in the [Power Platform for Admin V2](/connectors/powerplatformadminv2/) connector, which are useful for building remediation processes. For example, instead of deleting an unused app, an admin can first send an email or message to the owner of the app. The message informs the owner about an impending action. If the admin doesn't receive a reply from the owner, the app can be deleted.

While building cloud flows using the connector, you can get Power Platform Advisor recommendations and actions:

- **Get Recommendations**: Returns all the valid recommendations in your tenant.
- **Get Recommendation Resources**: Returns all the resources for a specific recommendation.
- **Execute Recommendation Action**: Executes a specific action for a specific resource listed in a recommendation.

### Export recommendations

The recommendation data displayed in the Power Platform Advisor can be exported using the **Get Recommendation Resources** action in the [Power Platform for Admin V2](/connectors/powerplatformadminv2/) connector. You can create a cloud flow (or a scheduled cloud flow) to retrieve the resources for each recommendation and then export them to an Excel file or send them by email using Excel Online or Office 365 Outlook connectors.

### Share recommendations

All recommendations in Power Platform Advisor can be shared in Microsoft Teams with other users for team collaboration.

:::image type="content" source="media/power-platform-advisor/share-in-teams.png" alt-text="Screenshot showing the Share in Teams option to select." lightbox="media/power-platform-advisor/share-in-teams.png":::

An admin can share the entire recommendation or share specific rows within the recommendation with another user by entering their name in the **Share to** textbox located in the **Share this recommendation** pane.

When an entire recommendation or multiple rows in the recommendation are shared, the sharing card provides a link to that recommendation for the admin.

:::image type="content" source="media/power-platform-advisor/share-to.png" alt-text="Screenshot that shows where to enter a name in the Share to textbox.":::

> [!NOTE]
>
> - Shared recommendations are sent as an adaptive card in a personal Teams chat.
> - When recommendations are shared, the sharing card provides a link to that recommendation for the admin.
> - When an app or resource is shared, the sharing card provides a link to both the recommendation and the app in the maker portal.

### Advisor summary card in Microsoft Teams

Once per week, Power Platform Advisor sends a summary card in Teams highlighting the top two recommendations the admin should focus on for that week. These highlights help admins invest their time on the most important recommendations.

To get the summary card, admins should install the **Power Apps** app in Teams.

Once installed, admins can view the summary cards in their Teams chats.

## Recommendations

At this time, the recommendations focus on security and operational efficiency. You can view these recommendations by category and learn about actions to resolve issues or seize opportunities.

### Apps without valid owners

This type of recommendation lists apps in all the Managed Environments within your Power Platform tenant that don't have a valid owner. Currently, this list contains apps active in the last 90 days.

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

> [!NOTE]
>
> - Once an action is taken, it takes up to one week for the apps to be removed from the list.
> - Quarantine and Delete actions fail if the app is already deleted outside the Advisor.

### Apps shared with everyone

This recommendation lists apps in all Managed Environments within your Power Platform tenant that are actively used and shared with **Everyone** in your Microsoft Entra tenant.

> [!IMPORTANT]
>
> - Only apps required for the entire organization are shared with **Everyone**.
> - Oversharing apps can pose significant security risks by exposing assets or allowing potential misuse.
> - Periodically review overshared apps and adjust permissions.

### Apps that aren't part of a solution

This recommendation lists apps in all Managed Environments within your Power Platform tenant that are actively used, but not part of a solution. An app that's not part of a solution means the app was both developed and used in the same environment.

> [!IMPORTANT]
>
> - Apps should follow application lifecycle management (ALM) best practices. Not following proper ALM best practices could cause a single change to break the app for several users with no easy way to recover.
> - The new _pipelines_ feature helps citizen developers, without prior ALM experience, to safely deploy their apps and dependent assets to a production environment.

### Pending license requests

This recommendation lists the number of pending license requests in your tenant. Delay in license assignment can lead to loss of productivity and might result in noncompliant use of premium apps and resources.

> [!IMPORTANT]
> You must have adequate permissions on the Microsoft 365 admin center to assign licenses. If you don't have the right privileges, you may share the recommendation with someone in your organization who can assign the licenses to the requested users.

### High-value apps in default environment

This recommendation lists apps that are potentially high-value (used by over 100 users each month) and are currently hosted in the default environment. Apps that don't follow a proper application lifecycle management are prone to business continuity risks. By moving these high-value apps out of the default environment to a Managed Environment, you can also take advantage of various premium security and governance capabilities, such as [Customer Managed Keys](customer-managed-key.md) and [Solution Checker enforcement](managed-environment-solution-checker.md), to protect these apps. Alternatively, you can set the default environment as a [Managed Environment](managed-environment-overview.md) to use premium security and governance capabilities for all resources.

> [!IMPORTANT]
>
> - Apps should follow application lifecycle management (ALM) best practices. Not following proper ALM could cause a single change to break the app for several users with no easy way to recover.
> - The new _pipelines_ feature helps citizen developers, without prior ALM experience, to safely deploy their apps and dependent assets to a production environment.

### Power Pages - Review & assign capacity to avoid degraded performance

This recommendation identifies environments where capacity consumption is nearing or exceeding the assigned limits. To prevent performance degradation, review the affected environments and allocate more capacity as needed. Select an environment to [manage and adjust capacity assignments](/power-pages/admin/capacity-management) accordingly.

### Websites are expiring in the next seven days

This recommendation lists trial websites that are expiring in the next seven days. Review and [convert the websites to production](/power-pages/admin/convert-site) as needed.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

### Websites didn't receive any traffic in the last 30 days

This recommendation lists websites that received no traffic in the last 30 days. This means some websites
in your tenant had no visitors in the past month. These websites might be outdated, irrelevant, or redundant.

To review these websites, select the recommendation to see a list of the websites, their URLs, environment names, and environment types. You can also visit the Power Pages admin center to get more insights into the traffic.

1. Select **Resources** > **Power Pages sites** > **Analytics**.

If a website isn't currently needed, you can shut it down. When a website is shut down, it's unavailable to users. You can always restart the websites later if you need them.

#### Supported actions for websites without traffic in the last 30 days

##### Shut down

To shut down a site:

1. Select one or more sites from the list and select **Shut down**.
1. After you confirm the shutdown operation, the selected sites are shut down.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

### Websites don't have Content Delivery Network (CDN) enabled

This recommendation lists production websites that don't have Content Delivery Network (CDN) enabled. Review the websites and [enable Content Delivery Network](/power-pages/configure/configure-cdn) where needed.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

### Websites don't have Web Application Firewall (WAF) enabled

This recommendation lists production websites that have Web Application Firewall (WAF) disabled. Review the websites and [enable Web Application Firewall](/power-pages/security/configure-web-application-firewall) where needed.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

#### Supported actions for websites without Web Application Firewall (WAF)

##### Enable

To enable WAF:

1. Select one or more sites from the list and select **Enable WAF**.
1. Confirm the operation to enable WAF for the selected sites.

### Websites have SSL certificates that have expired or are about to expire within 90 days

This recommendation lists production websites with SSL certificates that are expired or will expire within 90 days. Review the websites and [renew the SSL certificates](/power-pages/admin/add-custom-domain) as needed.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

### Websites are still on Bootstrap version 3

This recommendation lists production websites that aren't migrated to Bootstrap version 5. Review the websites and [migrate them to Bootstrap version 5 using the Power Pages bootstrap migration tool](/power-pages/configure/migrate-bootstrap) as needed.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

### Websites are still on standard data model

This recommendation lists production websites that aren't migrated to the enhanced data model. Review the websites and [migrate them to the enhanced data model using the Power Pages site migration tool](/power-pages/admin/migrate-enhanced-data-model?branch=main&branchFallbackFrom=pr-en-us-648) where possible.

> [!NOTE]
> Once an action is taken, it takes up to one day for the sites to be removed from the list.

### Users using apps with premium connectors under extended use rights

This recommendation lists users that are actively using Power Apps applications with Microsoft 365 under extended use rights and will be restricted starting April 1, 2025. 

Learn more about [Microsoft Power Apps and Power Automate use rights for Microsoft 365 applications](/power-platform/admin/powerapps-flow-licensing-faq#what-are-microsoft-power-apps-and-power-automate-use-rights-for-microsoft-365-applications) with additional information about the April 1,2025 enforcement in the [Power Platform licensing FAQs](/power-platform/admin/powerapps-flow-licensing-faq).

> [!NOTE]
> This recommendation only checks for Power Apps premium plans and may show users from apps that use [Power Apps per app](about-powerapps-perapp.md) or [Pay-as-you-go](pay-as-you-go-overview.md) plans. Review if your apps use [per app plans](about-powerapps-perapp.md#step-3-set-up-apps-to-use-per-app-plans) or [pay-as-you-go plans](pay-as-you-go-set-up.md#set-up-pay-as-you-go-for-your-environment-from-your-apps-setting).
