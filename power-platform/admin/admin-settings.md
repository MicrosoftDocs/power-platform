---
title: Manage Microsoft Dataverse settings 
description: View and manage Microsoft Dataverse settings.
author: sericks007
contributor: yingchin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/16/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: sericks
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---
# Manage Microsoft Dataverse settings

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You can view and manage the settings for your environments by signing in to the Microsoft [Power Platform admin center](https://admin.powerplatform.microsoft.com).

#### [New admin center](#tab/new)
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**. 

#### [Classic admin center](#tab/classic)
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, choose an environment.
1. In the command bar, select **Settings**.  
---

Ensure you have the **System Administrator** security role or equivalent permissions to review and update the settings. To check your security role, refer to [View your user profile](/powerapps/user/view-your-user-profile). If you don’t have the necessary permissions, contact your system administrator.

## Environment settings are moving

Organization-wide admin settings are moving from the web client to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) , [Power Platform Environment Settings App](environment-settings-app.md), apps with Unified Interface, or Power Apps. 

Meanwhile, you can continue managing settings in customer engagement apps—such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation—as usual.

Use the links on this page to manage organization-wide settings. App-specific settings remain in customer engagement apps and accessed through the app settings.

## New location for admin settings

### Security settings

These security settings are managed in the Power Platform admin center.

- [Dataverse teams management](manage-teams.md)
- [Assign security roles to users in an environment that has a Dataverse database](database-security-configure.md#assign-security-roles-to-users-in-an-environment-that-has-a-dataverse-database)
- [Manage application users](manage-application-users.md)
- [Create users](create-users.md)
- [Field-level security to control access](field-level-security.md)
- [Manage business units](create-edit-business-units.md)
- [Hierarchy security to control access](hierarchy-security.md)

### Settings in Power Platform Environment Settings app

Organization-wide settings can be managed via the [Power Platform Environment Settings app](environment-settings-app.md) and launched directly from the **Apps list** within the organization's environment.

Alternatively, if the **Power Platform Admin Center (PPAC)** feature setting **Environment settings behavior | Advanced Settings redirection** toggle is **On**, apps using the [Unified Interface](about-unified-interface.md) can access the settings by clicking **Settings** in the top command bar and selecting **Advanced settings**. This opens the **Power Platform Environment Settings app** in a new browser tab.

## Settings in Unified Interface apps
- If the PPAC feature setting **Environment settings behavior | Advanced Settings redirection** toggle is **On**, click **Settings** in the top command bar, then select **Advanced settings**. This opens the **Power Platform Environment Settings app** in a new browser tab.
- If the PPAC feature setting **Environment settings behavior | Advanced Settings redirection** toggle is **Off**, click **Settings** in the top command bar, then select **Advanced settings**. This opens the **legacy settings** in a new browser tab.

## Settings in legacy web client apps

To open settings for legacy web client apps, click the arrow next to the app name in the top command bar. Then, from the drop-down menu, select **Settings**. 

### See also
[Get started with Customer Service admin center](/dynamics365/customer-service/cs-admin-center)



[!INCLUDE[footer-include](../includes/footer-banner.md)]
