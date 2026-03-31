---
title: Overview of admin notifications and announcements (preview)
description: Learn about the Power Platform admin center's notifications and announcements. (preview)
ms.topic: concept-article
ms.component: pa-admin
ms.topic: overview
ms.date: 03/31/2026
author: praveenmantha
ms.subservice: admin
ms.author: pmantha
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin    
---
# Power Platform admin center notifications and announcements (preview)

[!INCLUDE [cc-preview-features-top-note](../includes/cc-preview-features-top-note.md)]

The Power Platform admin center provides unified notification and announcement experiences that keep you, as an administrator, informed about critical tenant events, operational alerts, and important product updates—all within the admin workflow.

##  Requirements

To see Power Platform admin center notifications and announcements, you need to be a user with a specific Microsoft Entra ID admin role assigned to you. These roles include:

- Power Platform Administrator
- Dynamics 365 Administrator
- Global Administrator

Both notifications and announcements provide role-based, severity-prioritized communications to Power Platform, Dynamics 365, and Global administrators. You must be assigned one of these admin roles to see the notifications icon (🔔) and the announcements icon (📣) in the admin center header during the preview.

> [!TIP]
> Notifications and announcements are preview features. To access preview features, be sure to enable preview features in the Power Platform admin center. To learn more, see [What are preview features and how do I enable them?](what-are-preview-features-how-do-i-enable-them.md).

## Notifications

 **Notifications** surface tenant-specific alerts that require administrative awareness or action. These notifications are operational, compliance-driven, or capacity-related and are designed to help admins respond quickly to issues affecting their Power Platform environments.

You can view different types of notifications in the *Notifications panel*:

| Category                 | Examples                               |
|--------------------------|----------------------------------------|
| **Licensing & Capacity** | License shortfall alerts             |
| **Dataverse Storage**    | Storage nearing limits, overage, etc. |


As an admin, you can prioritize notifications by severity:

- **Info**: Informational notices, optional recommendations, non-urgent updates.
- **Warning**: Potential problems, approaching thresholds, recommended actions.
- **Critical**: Urgent problems, service disruptions, immediate action required.

### View notifications

To open and view the **Notifications panel**:

1.  Open the **Power Platform admin center** and select the **bell icon (🔔)** in the upper-right corner of the header to open the Notifications panel. It shows:

    - New notifications with *unread indicators*.
    - Notification titles and summaries.
    - Severity badges such as *Info*, *Warning*, or *Critical*.
    - Timestamps (when the notification was created).
1.  Select a notification to:

    - View the full message.
    - Go to the relevant admin center page (for example, Capacity, Licensing, or Environments) by using the hyperlinks.
    - Mark as *read* or dismiss.

### Manage notifications

To manage notifications, you can:

- **Mark as read**: Select *a notification* to automatically **mark it as read**. *Read* notifications stay in your history but lose the unread indicator.
- **Dismiss**: Select the **Dismiss** button to remove a notification from your active list. Dismissed notifications move to your notification history and you can review them later.

### Work with toast notifications

When a new notification is created, a **toast notification** appears briefly in the top-right corner of the admin center. Toast notifications:

- Appear automatically on *page refresh* or *sign in*.
- Alert you to a new notification.
- Auto-dismiss after about 15 seconds.

Select a **toast notification** to open the full notification in the Notifications panel.

## Announcements

**Announcements** deliver product-wide updates, feature announcements, and informational communications that aren't tenant-specific but are relevant to Power Platform admins. Announcement messages are informational, promotional, or educational and typically don't require immediate action.

You can view different types of announcements in the *Announcements panel*:

| Category | Examples |
|----|----|
| **Feature Rollouts** | General Availability (GA) notices, public preview announcements, new capabilities |
| **Product Updates** | Power Platform admin center interface changes, new pages, redesigned experiences |
| **Events & Webinars** | Microsoft Ignite, Build, community calls, admin office hours |

### View announcements

To open and view the **Announcements panel**:

1.  Open the **Power Platform admin center**, select the **megaphone icon (📣)** in the upper-right corner of the header to open the Announcements panel that shows:

    - Announcement title
    - Brief summary
    - Publication date
1.  Select an announcement to view the full message and any related links, such as Microsoft Learn documentation or blog posts.

## Notification delivery channels

Power Platform admin center delivers notifications and announcements through multiple channels to ensure admins stay informed.

Within the Power Platform admin center, the primary delivery mechanism for notifications and announcements is **in-product notification and announcement centers**. Notifications appear in real-time within the admin center, so admins stay informed without leaving their workflow.

## Centralized notification service

Power Platform admin center notifications and announcements are powered by a **centralized notification service** that:

- Ingests events from Power Platform services such as Dataverse, licensing, capacity, compliance, and ALM.
- Applies expiry and de-duplication logic to prevent stale or redundant alerts.
- Enforces governance to control notification severity, frequency, and noise.

This shared service architecture ensures consistency across the Power Platform admin center, Power Apps maker portal, and other first-party surfaces.

## Relationship to other notification systems

Power Platform admin center notifications and announcements complement other Microsoft 365 notification systems and Power Platform monitoring tools to provide a comprehensive view of tenant health and activity.

### Microsoft 365 Message Center

*Message Center* is the authoritative source for planned changes, deprecations, and major service updates across Microsoft 365, including Power Platform. While Message Center content isn't directly embedded in Power Platform admin center today, admin center notifications complement Message Center by surfacing **tenant-specific alerts** that aren't appropriate for broadcast communications.

**When to use each**:

- Use **Message Center** for planned changes, feature roll outs, breaking changes, or deprecations.
- Use **Power Platform admin center Notifications** for tenant-specific issues, capacity alerts, compliance violations, or operational failures.

### Service Health

*Service Health* provides incident notifications, advisories, and post-incident reports for Power Platform services. While Service Health is accessed via the Microsoft 365 Admin Center, future Power Platform admin center updates will integrate Service Health signals more tightly into the notification experience.

### Monitor \> Alerts

In the *Monitor* section in Power Platform admin center, the *Alerts* feature enables admins to create *custom, metric-based alerts* for Microsoft Power Apps, Microsoft Power Automate, and Microsoft Copilot Studio. These rule-based alerts are separate from the centralized Notification Center but might appear as notifications in the future.

> [!NOTE]
> For more information about custom alerts, see [Set up and manage alerts for Power Platform services](https://microsoft.sharepoint.com/teams/PowerApps7/Shared%20Documents/Scale%20Group/Enterprise%20Governance/PPAC/PPAC%20Notification%20Service/monitoring/alerts.md).

## What's coming next

The Power Platform admin center notifications service is evolving toward a comprehensive **Action Center** model that releases new features to complement the existing experiences and make the notifications service a comprehensive platform.

## Frequently asked questions

### Can I customize which notifications I receive?

Not at launch. In the initial release (March 2026 public preview), all admin-role users receive the same set of notifications based on their tenant activity. Future updates might include notification preferences and suppression controls.

### Do notifications replace email notifications?

No. PPAC notifications **complement** existing email notifications. For redundancy, critical alerts might be delivered through both in-product notifications and email.

### What happens to dismissed notifications?

In preview, dismissed notifications are removed from your notifications panel and are permanently deleted. In future releases, there will be an experience to view dismissed notifications and perform filtering and search on the notifications received.

### Can I receive notifications in Microsoft Teams?

Not yet. Microsoft Teams notification delivery is currently not in scope.

### What if I don't see the notification or announcement icons?

Make sure you're signed in by using a user account that has one of the following roles:

- Power Platform Administrator
- Dynamics 365 Administrator
- Global Administrator

### How long do notifications stay in the Notification Center?

Notifications stay visible until one of the following conditions is met:

- They reach their **expiry date** (set by the notification publisher).
- The admin **dismisses** them manually.

Expired or dismissed notifications move to the notification history.
