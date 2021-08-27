---
title: "Manage your maintenance window  | MicrosoftDocs"
description: How to manage when you'll receive service updates.
author: jimholtz
ms.author: jimholtz
ms.reviewer: samathur
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/27/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Manage your maintenance window 

Microsoft regularly performs updates and maintenance on customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation) to ensure security, performance, availability, and to provide new features and functionality. This update process delivers security and minor service improvements on a weekly basis, with each update rolling out region-by-region according to a safe deployment schedule, arranged in [Stations](/dynamics365/released-versions/dynamics-365ce). For information about your default maintenance window for Dynamics 365 environments, see [Policies and Communications for service incidents](policies-communications.md).

> [!NOTE]
> - Managing your maintenance window is only available for production environments. 
> - Maintenance can be conducted any day so the maintenance window is a time within the day when these updates could be delivered. 
> - Only database and application updates will be delivered in this maintenance window. Platform updates will continue to execute based on [region-specific times](policies-communications.md#maintenance-timeline). 
> - There is no down time or performance degradation during the maintenance window. 

To view or update the Maintenance Window for a specific environment based on your business preferences, follow these steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. Select **Environments**, and then select a production environment from the list.

3. Select **Settings** > **Updates** > **Maintenance window settings**.

4. On the **Maintenance window settings** page, choose the hours to receive updates from Microsoft.

   :::image type="content" source="media/maintenance-window.png" alt-text="Select a time for the maintenance window":::

5. Select **Save**.

### See also
[Policies and Communications for Power Platform and Dynamics 365 Services](policies-communications.md) <br />
[Manage email notifications to admins](manage-email-notifications.md)
