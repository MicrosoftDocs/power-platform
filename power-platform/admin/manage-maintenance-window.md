---
title: Manage your maintenance window
description: Learn how to manage when you'll receive service updates.
author: sericks007
ms.author: sericks
ms.reviewer: sericks
ms.component: pa-admin
ms.topic: how-to
ms.date: 11/24/2025
search.audienceType: 
  - admin
---
# Manage your maintenance window

Microsoft regularly performs updates and maintenance on customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) to ensure security, performance, and availability, and to provide new features and functionality. This update process delivers security and minor service improvements on a weekly basis. Each update rolls out region by region according to a safe deployment schedule, arranged in [Stations](/dynamics365/released-versions/dynamics-365ce). For information about your default maintenance window for environments, see [Policies and Communications for service incidents](policies-communications.md).

> [!NOTE]
>
> - You can only manage your maintenance window for production environments.
> - Maintenance can be conducted any day, so the maintenance window is a time within the day when these updates could be delivered.
> - Only database and application updates are delivered in this maintenance window. Platform updates continue to execute based on [region-specific times](policies-communications.md#maintenance-timeline).
> - It might take up to 48 hours for the maintenance window settings to take effect.
> - There's no downtime or performance degradation during the maintenance window.

To view or update the maintenance window for a specific environment based on your business preferences, follow these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. Select a production environment.
1. Select **Settings** > **Updates** > **Maintenance window settings**.
1. On the **Maintenance window settings** page, choose the hours to receive updates from Microsoft.

   :::image type="content" source="media/maintenance-window.png" alt-text="Select a time for the maintenance window":::
1.. Select **Save**. It might take up to 48 hours for the maintenance window settings to take effect.

## See also

[Policies and Communications for Power Platform and Dynamics 365 Services](policies-communications.md) <br />
[Manage email notifications to admins](manage-email-notifications.md)
