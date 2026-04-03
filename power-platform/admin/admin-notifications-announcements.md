---
title: Overview of admin notifications and announcements (preview)
description: Learn about the Power Platform admin center's notifications and announcements. (preview)
ms.component: pa-admin
ms.topic: overview
ms.date: 04/01/2026
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

To see the **Notifications** icon (🔔) and the **Announcements** icon (📣) in the Power Platform admin center toolbar during preview, you must be assigned one of the following Microsoft Entra ID admin roles:

- Power Platform Administrator
- Dynamics 365 Administrator
- Global Administrator

Both notifications and announcements provide role-based, severity-prioritized communications to Power Platform, Dynamics 365, and Global administrators.

## Notifications

Notifications are tenant-specific alerts that require administrative awareness or action. These notifications are operational, compliance-driven, or capacity-related and  help you respond quickly to issues affecting your Power Platform environments.

As an admin, you can view different types of notifications in the **Notifications** pane. This table shows some examples of notifications you might see:

| Category                 | Examples                               |
|--------------------------|----------------------------------------|
| **Licensing & Capacity** | License shortfall alerts             |
| **Dataverse Storage**    | Storage nearing limits, overage, etc. |


You can view notifications by severity:

- **Info**: Informational notices, optional recommendations, non-urgent updates.
- **Warning**: Potential problems, approaching thresholds, recommended actions.
- **Critical**: Urgent problems, service disruptions, immediate action required.

### View notifications

To open and view the **Notifications** pane:

1.  Open the **Power Platform admin center** and select the **bell icon (🔔)** in the upper-right corner of the toolbar to open the **Notifications** pane. The pane shows:

    - New notifications with *unread indicators*.
    - Notification titles and summaries.
    - Severity badges such as *Info*, *Warning*, or *Critical*.
    - Timestamps (when the notification was created).
1.  Select a notification to:

    - View the full message.
    - Go to the relevant admin center page (for example, Capacity, Licensing, or Environments) by using the hyperlinks.
    - Mark as *read* or dismiss.

### Manage notifications

To manage notifications, use the following options:

- **Mark as read**: Select *a notification* to automatically **mark it as read**. *Read* notifications stay in your history but lose the unread indicator.
- **Dismiss**: Select the **Dismiss** button to remove a notification from your notifications list. 

### Work with toast notifications

When you receive a new notification, a **toast notification** appears briefly in the upper-right corner of the admin center. Toast notifications:

- Appear automatically on *page refresh* or *sign in*.
- Alert you to a new notification.
- Auto-dismiss after about 60 seconds.

Select a **toast notification** to open the full notification.

## Announcements

Announcements are product-wide updates, feature announcements, and informational communications that aren't tenant-specific. Announcement messages are informational, promotional, or educational and typically don't require immediate action.

As an admin, you can view different types of announcements on the **Announcements** pane. This table shows some examples of announcements you might see:

| Category | Examples |
|----|----|
| **Feature Rollouts** | General Availability (GA) notices, public preview announcements, new capabilities |
| **Product Updates** | Power Platform admin center interface changes, new pages, redesigned experiences |
| **Events & Webinars** | Microsoft Ignite, Build, community calls, admin office hours |

### View announcements

To open and view the **Announcements** pane:

1.  Open the **Power Platform admin center** and select the **megaphone icon (📣)** in the upper-right corner of the toolbar to open the **Announcements** pane. The pane shows:

    - Announcement title
    - Brief summary
    - Publication date
1.  Select an announcement to view the full message and any related links, such as Microsoft Learn documentation or blog posts.

## Relationship to other notification systems

Power Platform admin center notifications complement other Microsoft 365 notification systems and Power Platform monitoring tools to provide a comprehensive view of tenant health and activity.

### Microsoft 365 Message center

*Microsoft 365 Message center* is the authoritative source for planned changes, deprecations, and major service updates across Microsoft 365, including Power Platform. While Message center content isn't directly embedded in Power Platform admin center today, admin center notifications complement Message Center by surfacing **tenant-specific alerts** that aren't appropriate for broadcast communications.

**When to use each**:

- Go to **Microsoft 365 Message center** in the Microsoft 365 admin center for planned changes, feature roll outs, breaking changes, or deprecations. In the Microsoft 365 admin center, select **Health** > **Message center**.
- Go to **Notifications** in the Power Platform admin center for tenant-specific issues, capacity alerts, compliance violations, or operational failures. In the Power Platform admin center, select the **Notifications** icon (🔔).

## Frequently asked questions

### Can I customize which notifications I receive?

Not at launch. In the initial release (April 2026 public preview), all admin-role users receive the same set of notifications based on their tenant activity. Future updates might include notification preferences and suppression controls.

### Do notifications replace email notifications?

No. Power Platform admin center notifications and announcements *complement* existing email notifications. For redundancy, critical alerts might be delivered through both in-product notifications and email.

### What happens to dismissed notifications?

In preview, dismissed notifications are removed from your notifications and announcements and are permanently deleted.

### Can I receive notifications in Microsoft Teams?

Not yet. Microsoft Teams notification delivery is currently not in scope.

### What if I don't see the notification or announcement icons?

Make sure you're signed in by using a user account that has one of the following roles:

- Power Platform Administrator
- Dynamics 365 Administrator
- Global Administrator

### How long do notifications and announcements stay visible?

Notifications and announcements stay visible until one of the following conditions is met:

- They reach their **expiry date** (set by the notification publisher).
- The admin **dismisses** them manually.

Expired or dismissed notifications and announcements move to the notification history.
