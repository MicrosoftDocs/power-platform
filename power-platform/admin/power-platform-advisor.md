---
title: Use Power Platform Advisor
description: Learn how to use Power Platform Advisor to optimize your tenant.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/02/2025
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

Power Platform Advisor provides personalized recommendations to optimize your Power Platform tenant. Advisor analyzes all managed environments and the apps in these environments within your Power Platform tenant. Advisor recommends solutions to improve security, reliability, and overall health.

With Advisor, administrators can:

- Provide proactive, best practice recommendations.
- Improve the overall health of their Power Platform tenant.
- Take inline actions or automate actions using cloud.

> [!NOTE]  
> You can find Advisor recommendations on the Advisor page in the Power Platform admin center. If you turn on the new Power Platform admin center experience, you find Advisor recommendations in the Action center.

In addition to the Advisor page and in the Action center, contextual recommendations from Power Platform Advisor are currently available in:

1. Power Platform Admin Center  
    1. Action center  
    1. Security page  
    1. Copilot page  
    1. Monitor page  

1. Power Apps maker portal  
    1. Monitor page  
    1. Deployment page  

1. Power Automate maker portal  
    1. Automation Center page  

### Summary card: Microsoft Teams

Each week, Power Platform Advisor sends a summary card in Teams highlighting the top two recommendations for the admin to focus on. These highlights help admins invest their time on the most important recommendations.

To get the summary card, admins should install the **Power Apps** app in Teams.

Once installed, admins can view the summary cards in their Teams chats.

### Summary card: Power Platform Admin Center

Power Platform tenant admins can view the top recommendations on the **Advisor** card. If the Power Platform admin center home page isn't customized, this card is automatically pinned on the **Home** page. Your tenant is scanned for recommendations weekly.

- Select **View details** on any recommendation to view its details.  
- Select **View recommendations** to view all recommendations on the **Advisor** page.

> [!TIP]  
> If the home page is customized, you don't see the **Advisor** card, or you removed the card from the home page, you can select **+ Add cards** to add the card to the **Home** page. 

### Managed vs. Non-Managed Environments

Power Platform Advisor is part of the advanced management features in the admin center. All the recommendations, affected resource details, and actions are available for the managed environments in your tenant.

Power Platform Advisor shows a summary of recommendations for non-managed environments. These appear as a banner above the affected resources table in the recommendation panel or with a lock icon on the recommendations page. Admins can turn on managed environments from Advisor to view the affected resources and act on them.

> [!NOTE]  
> When you turn on managed environments, it might take up to 72 hours for Advisor to show full details of the affected resources in that environment. 

### Capabilities

Power Platform Advisor includes these capabilities:

- **Snooze Recommendations**: Pause recommendations for up to two months and undo snoozing if needed sooner.

- **Delegate or Collaborate**: Share recommendations and resources with colleagues to resolve them collaboratively.

- **Action History**: Track all actions performed via Advisor or using the Admin V2 connector.

- **Trends**: View changes in affected resources over time using trend data.

## Actions

### Types of Actions

Power Platform Advisor lets administrators address recommendations through different action types:

- **Inline actions**: Perform actions directly from the Advisor interface.

- **Automated actions using Power Automate**: Use flows to automate remediation processes.

- **Redirection to other pages**: Navigate to specific sections for detailed actions.

- **Redirection to learn docs**: Access documentation with step-by-step remediation guidance.

### Inline Actions

1. Go to the "Recommendations" tab in Power Platform Advisor.

2. Review the list of recommendations along with their severity levels.

3. Select a recommendation to view more details such as:

   1. *Why is this important*: Explains the significance of the recommendation.
   2. *What can I do*: Outlines potential actions you can take.
   3. *Instructions*: Provides step-by-step guidance for resolving the issue.
   4. *Affected Resources*: Lists all impacted resources for transparency.
   5. *Inline Actions*: Offers quick actions that can be taken directly from the panel.

### Automated actions

Power Platform Advisor supports automated actions in the [Power Platform for Admin V2](/connectors/powerplatformadminv2/) connector, which are useful for building remediation processes. For example, instead of deleting an unused app, an admin can first send an email or message to the owner of the app. The message informs the owner about an impending action. If the admin doesn't receive a reply from the owner, the app can be deleted.

While building cloud flows using the connector, you can get Power Platform Advisor recommendations and actions:

- **Get Recommendations**: Returns all the valid recommendations in the tenant.
- **Get Recommendation Resources**: Returns all the resources for a specific recommendation.
- **Execute Recommendation Action**: Executes a specific action for a specific resource listed in a recommendation.

### Action history

Action history provides a consolidated view of all the actions taken manually from the advisor page and using the automated actions in the Power Platform for Admin v2 connector. Power Platform admins can view actions taken by them or other admins (both tenant-level admins and environment/system admins), whereas environment admins can only view the history of their own actions.

### Snooze recommendations

Power Platform admins can snooze non-security recommendations for up to two months to prioritize their work more efficiently. To snooze a recommendation, hover on the recommendation to select the snooze action in the recommendation table and choose the snooze duration.

When a recommendation is snoozed, it's removed from the active recommendations tab and is moved to the snoozed recommendations tab. Admins can see the person snoozing the recommendation along with the duration and date when it was snoozed. Advisor stops refreshing recommendations in their snoozed state.

Snoozed recommendations can be activated again manually by selecting undo snooze from the snoozed recommendation table. They’re automatically activated after the snoozed duration elapses. 

### Share recommendations

All recommendations in Power Platform Advisor can be shared in Microsoft Teams with other users for team collaboration.

An admin can share the entire recommendation or share specific rows within the recommendation with another user by entering their name in the **Share to** textbox located in the **Share this recommendation** pane.

When an entire recommendation or multiple rows in the recommendation are shared, the sharing card provides a link to that recommendation for the admin.

> [!NOTE]  
> - Shared recommendations are sent as an adaptive card in a personal Microsoft Teams chat.  
> - When recommendations are shared, the sharing card provides a link to that recommendation for the admin.  
> - When an app or resource is shared, the sharing card provides a link to both the recommendation and the app in the maker portal.  

### Export recommendations

You can export the recommendation data displayed in Power Platform Advisor using the **Get Recommendation Resources** action in the [Power Platform for Admin V2](/connectors/powerplatformadminv2/) connector.

To retrieve resources for each recommendation, create a cloud flow or scheduled cloud flow. Export them to an Excel file or send them by email using Excel Online or Office 365 Outlook connectors.

## Recommendations

### Recommendation details panel - TBD

The recommendation details panel shows a detailed view with inline actionable insights. Here’s a detailed breakdown of the panel's components:

- **Title**: Provides a concise title of the recommendation.

- **Severity**: This value shows how often the recommendation data refreshes.

- **Recommendation timestamp**: Shows the date when the recommendation was last refreshed.

- **Why is this important**: Explains the context and specifics of the recommendation.

- **What can I do**: Explains actions to address the recommendation.

- **Call to action or details**: Shows buttons for immediate actions or more details.

- **Affected artifact details**: A table or chart listing affected recommendation artifacts such as flows, work queues, machines, etc.

### Recommendation Categories

Power Platform Advisor organizes recommendations into these categories:

- Security  
- Operational Efficiency  
- Licensing & Capacity  
- Performance  

The following tables provide a list of all recommendations by category:

### Security recommendations

| Severity | Recommendation                                                                 | Resource Type | Refresh Frequency | Managed Environments | Surface | Users |
|----------|---------------------------------------------------------------------------------|---------------|-------------------|-----------------------|---------|-------|
| High     | Secure agents by setting up data loss prevention policies for Copilot Studio items | Tenant Setting | Real time         | No                    |         |       |
| High     | Assign valid owners to apps to mitigate business continuity risks              | App           | Weekly            | Yes                   |         |       |
| High     | Enable Web Application Firewall (WAF) to protect websites                      | Site          | Daily             | Yes                   |         |       |
| High     | Enhance your websiteʼs security by renewing its SSL certificate                | Site          | Daily             | Yes                   |         |       |
| High     | Secure high-value applications that are shared with ‘Everyone’, including guest users | App           | Weekly            | Yes                   |         |       |

### Licensing and capacity recommendations

| Severity | Recommendation                                           | Resource Type | Refresh Frequency | Managed Environments |       |       |
|----------|-----------------------------------------------------------|---------------|-------------------|-----------------------|-------|-------|
| High     | Review Power Apps license recommendations                 | License       | Weekly            | Yes                   |       |       |
| High     | Assign licenses to pending Power Apps license requests    | License       | Weekly            | Yes                   |       |       |
| Medium   | Optimize Dataverse storage for email attachments          | Capacity      | Weekly            | Yes                   |       |       |
| Medium   | Optimize Dataverse storage for workflows and async plugins| Capacity      | Weekly            | Yes                   |       |       |
| Medium   | Optimize Dataverse storage for Smart Matching             | Capacity      | Weekly            | Yes                   |       |       |
| Medium   | Optimize Dataverse storage for plugin logging             | Capacity      | Weekly            | Yes                   |       |       |
| Medium   | Optimize Dataverse storage for table stale mailbox subscriptions | Capacity | Weekly | Yes | | |
| Medium   | Optimize Dataverse storage for server-side sync logs      | Capacity      | Weekly            | Yes                   |       |       |

### Operational efficiency recommendations

| Severity | Recommendation                                                                 | Resource Type | Refresh Frequency | Managed Environments |       |       |
|----------|---------------------------------------------------------------------------------|---------------|-------------------|-----------------------|-------|-------|
| High     | Protect high-value apps with premium security and governance policies          | App           | Weekly            | No                    |       |       |
| High     | Review and convert expiring trial websites to production                       | Site          | Daily             | Yes                   |       |       |
| High     | Review and shut down websites without any traffic                              | Site          | Daily             | Yes                   |       |       |
| High     | Turn on tenant-wide analytics for better experience across the managed platform | Tenant Setting | Real time         | No                    |       |       |
| High     | Follow Application Lifecycle Management (ALM) best practices for high value apps | App           | Weekly            | Yes                   |       |       |
| Medium   | Maintain tenant hygiene by cleaning up quarantined apps                        | App           | Weekly            | Yes                   |       |       |
| Medium   | Maintain tenant hygiene by cleaning up unused apps                             | App           | Weekly            | Yes                   |       |       |

### Performance recommendations

| Severity | Recommendation                                                   | Resource Type | Refresh Frequency | Managed Environments |       |       |
|----------|-------------------------------------------------------------------|---------------|-------------------|-----------------------|-------|-------|
| High     | Improve performance of websites by migrating them to Bootstrap version 5 | Site          | Daily             | Yes                   |       |       |
| High     | Review and move websites from standard data model to enhanced data model | Site          | Daily             | Yes                   |       |       |
| High     | Enable Content Delivery Network (CDN) to improve website performance | Site          | Daily             | Yes                   |       |       |

### Recommendations Automation Center

All automation center recommendations are for managed environments only.

| Type    | Recommendation                          | Resource Type | Refresh Frequency | Category       |       |       |
|---------|------------------------------------------|---------------|-------------------|----------------|-------|-------|
| Error   | Work queue SLA violation                | Desktop flows | Hourly            | Orchestration  |       |       |
| Warning | Work queue SLA at risk                  | DF            | Hourly            | Orchestration  |       |       |
| Error   | Power Automate Process capacity overage | DF            | Real time         | Licensing      |       |       |
