---
title: Use the Action Center
description: Optimize your Power Platform tenant with action center. Get tailored recommendations, automate actions, and track improvements easily.
author: sidhartg
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/28/2025
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
ms.contributors:
  - DanaMartens
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:05/28/2025
---

# Use the action center

The action center provides personalized recommendations to optimize your Power Platform tenant. It analyzes all managed environments and the apps in these environments within your tenant. It recommends solutions to improve security, reliability, and overall health.

With the action center, administrators can:

- Provide proactive, best practice recommendations.
- Improve the overall health of their Power Platform tenant.
- Take inline actions
- Take actions automatically using cloud flows or PowerShell using the Power Platform for Admin v2 connector actions.

## View recommendations

To view recommendations in the action center:

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select **Actions**.

Contextual recommendations from the Power Platform action center are also available in:

1. Power Platform admin center  
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

Each week, the action center sends a summary card in Teams that highlights the top two recommendations for the admin to focus on. These highlights help admins invest their time on the most important recommendations.

To get the summary card, admins should install the **Power Apps** app in Teams.

Once installed, admins can view the summary cards in their Teams chats.

### Summary card: Power Platform admin center

Power Platform admins can view the top recommendations on the **Advisor** card. If the admin center home page isn't customized, this card is automatically pinned on the **Home** page. Your tenant is scanned for recommendations weekly.

- Select **View details** on any recommendation to view its details.  
- Select **View recommendations** to view all recommendations on the **Recommendations** page within the action center.

> [!TIP]  
> If the home page is customized, you don't see the **Advisor** card, or you removed the card from the home page, you can select **+ Add cards** to add the card to the **Home** page.

### Managed vs non-managed environments

The action center is part of the advanced management features in the admin center. All the recommendations, affected resource details, and actions are available for the managed environments in your tenant.

The action center shows a summary of recommendations for non-managed environments. The summary appears as a banner above the affected resources table in the recommendation panel or with a lock icon on the recommendations page. Admins can turn on managed environments from the action center to view the affected resources and act on them.

> [!NOTE]  
> When you turn on managed environments, it might take up to 72 hours for the action center to show full details of the affected resources in that environment.

### Capabilities

The action center includes these capabilities:

- **Snooze recommendations**: Pause non-security recommendations for up to two months and undo snoozing from the **Snoozed recommendations** tab, if needed sooner.

- **Dismiss recommendations**: Dismiss security recommendations that aren't applicable to your organization or the ones that were addressed in a different way. Activate dismissed security recommendations from the Dismissed recommendations tab, if they become relevant at a later date.

- **Delegate or collaborate**: Share recommendations and resources with colleagues to resolve them collaboratively.

- **Action history**: Track all actions performed using the action center or using the Admin V2 connector.

- **Trends**: View changes in affected resources over time with trend data.

## Actions

### Types of actions

The action center lets admins address recommendations through different types of actions:

- **Inline actions**: Perform actions directly from the action center interface.

- **Automated actions using Power Automate**: Use flows to automate remediation processes.

- **Automated actions using PowerShell**: Use PowerShell to automate remediation processes.

- **Redirection to other pages**: Navigate to specific sections for detailed actions.

- **Redirection to learn docs**: Access documentation with step-by-step remediation guidance.

### Inline actions

1. Go to the **Recommendations** tab in the action center.

1. Review the list of recommendations along with their severity levels.

1. Select a recommendation to view more details such as:

   1. *Why is this important*: Explains the significance of the recommendation.
   1. *What can I do*: Outlines potential actions you can take.
   1. *Instructions*: Provides step-by-step guidance for resolving the issue.
   1. *Affected Resources*: Lists all impacted resources for transparency.
   1. *Inline Actions*: Offers quick actions that can be taken directly from the panel.

### Automated actions

The action center supports automated actions in the [Power Platform for Admin V2](/connectors/powerplatformadminv2/) connector. These actions are useful for building remediation processes. For example, instead of deleting an unused app, an admin can first send an email or message to the owner of the app. The message informs the owner about an impending action. If the admin doesn't receive a reply from the owner, the app can be deleted.

While building cloud flows or PowerShell scripts using the connector, you can get action center recommendations and actions:

- **Get recommendations**: Returns all the valid recommendations in the tenant.
- **Get recommendation resources**: Returns all the resources for a specific recommendation.
- **Execute recommendation action**: Executes a specific action for a specific resource listed in a recommendation.

### Action history

Action history shows all actions you take manually from the action center page and actions you run using the automated actions in the Power Platform for Admin v2 connector. Power Platform admins can view actions taken by them or other admins (both tenant-level admins and environment/system admins), whereas environment admins can only view the history of their own actions.

### Snooze recommendations

Power Platform admins can snooze nonsecurity recommendations for up to two months to prioritize their work efficiently. To snooze a recommendation, hover over the recommendation to select the snooze action in the recommendation table and choose the snooze duration.

When you snooze a recommendation, it moves from the active recommendations tab to the snoozed recommendations tab. Admins can see who snoozed the recommendation along with the duration and date when it was snoozed. The action center stops refreshing recommendations in their snoozed state.

Snoozed recommendations can be activated again manually by selecting undo snooze from the snoozed recommendation table. They’re automatically activated after the snoozed duration elapses.

### Dismiss recommendations

Power Platform admins can dismiss security recommendations that aren't applicable for their organization. To dismiss a recommendation, hover over the recommendation to select the dismiss action in the recommendation table and choose the reason for dismissing the recommendation.

When you dismiss a recommendation, it moves from the active recommendations tab to the dismissed recommendations tab. Admins can see the person dismissing the recommendation along with the reason and date when it was dismissed. The action center stops scanning dismissed recommendations.

Dismissed recommendations can be activated again manually by selecting activate from the dismissed recommendation table. Dismissed recommendations remain in that state until they're manually activated.

### Share recommendations

All recommendations in the action center can be shared in Microsoft Teams with other users for team collaboration.

An admin can share the entire recommendation or share specific rows within the recommendation with another user by entering their name in the **Share to** textbox located in the **Share this recommendation** pane.

When an entire recommendation or multiple rows in the recommendation are shared, the sharing card provides a link to that recommendation for the admin.

> [!NOTE]  
> - Shared recommendations are sent as an adaptive card in a personal Microsoft Teams chat.  
> - When recommendations are shared, the sharing card provides a link to that recommendation for the admin.  
> - When an app or resource is shared, the sharing card provides a link to both the recommendation and the app in the maker portal.  

### Export recommendations

You can export the recommendation data displayed in the action center using the **Get Recommendation Resources** action in the [Power Platform for Admin V2](/connectors/powerplatformadminv2/) connector.

To retrieve resources for each recommendation, create a PowerShell script, a cloud flow, or a scheduled cloud flow. Export them to an Excel file or send them by email using Excel Online or Office 365 Outlook connectors.

## Recommendations

### Recommendation details panel

The recommendation details panel shows a detailed view with actionable insights. Here's a breakdown of the panel's components:

- **Title**: Provides a concise title of the recommendation.

- **Recommendation timestamp**: Shows the date the recommendation was last refreshed.

- **Why is this important**: Explains the context and specifics of the recommendation.

- **What can I do**: Explains actions to address the recommendation.

- **Call to action or details**: Shows buttons for immediate actions or more details.

- **Affected artifact details**: A table or chart listing affected recommendation artifacts such as flows, work queues, machines, etc.

### Recommendation categories

The action center organizes recommendations into the following categories. Select a category to view all the recommendations associated with that category:

- [Security](security-recommendations.md)  
- [Operational efficiency](operational-efficiency-recommendations.md)
- [Licensing and capacity](licensing-and-capacity-recommendations.md)
- [Performance](performance-recommendations.md)
