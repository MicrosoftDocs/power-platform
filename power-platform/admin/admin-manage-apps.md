---
title: Manage Power Apps | Microsoft Docs
description: How to manage Power Apps apps created in your organization.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/05/2021
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# Manage Power Apps
If you're an Environment Admin, Global admin, or Microsoft Power Platform admin, you can manage the apps created in your organization.

Admins can do the following from the Power Platform admin center:

- Add or change the users with whom an app is shared
- Delete apps not currently in use

## Prerequisites

- Either a Power Apps plan or Power Automate plan. Alternatively, you can sign up for a [free Power Apps trial](/powerapps/maker/signup-for-powerapps).

- Power Apps Environment Admin, Global admin, or Power Platform admin permissions. For more information, see [Environments administration in Power Apps](environments-administration.md).

## Manage Power Apps

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

2. In the navigation pane, select **Environments**, select an environment with resources, and then select the **Power Apps** resource.

   > [!div class="mx-imgBorder"] 
   > ![Select Power Apps resource](media/resources-select-power-apps.png "Select Power Apps resource")

3. Select an app to manage.

   > [!div class="mx-imgBorder"] 
   > ![Select an app](media/resources-manage-power-apps-list.png "Select an app") 

4. Select your desired action.

   > [!div class="mx-imgBorder"] 
   > ![Share or delete app](media/resources-edit-power-app.png "Share or delete app") 

## Manage who can share canvas apps

Power Apps respects the Canvas App ‘Share’ privilege in Dataverse. A user will not be able to share canvas apps in an environment if they do not have a security role with the Canvas App Share privilege set to a value other than ‘None selected’. This Dataverse Canvas App Share privilege is also respected in the default environment. [This article outlines how to edit a privileges in a security role](https://docs.microsoft.com/power-platform/admin/create-edit-security-role#edit-a-security-role).

   > [!div class="mx-imgBorder"] 
   > ![Dataverse Canvas App privileges](media/admin-manage-apps/dataverse_canvas_app_entity_share_privilege.png "Dataverse Canvas App entity privileges")

> [!NOTE]
> The ability to granularly control the Canvas App Share privilege in a security role requires Dataverse in the environment where the privilege is to be changed. Power Apps does not discretely recognize the other Dataverse Canvas app entity privileges set for the environment. 

### Surface your organization’s governance error content 
If you specify governance error message content to appear in error messages, it will be included in the error message displayed when users observe they don’t have permission to share apps in an environment. [See PowerShell governance error message content commands](https://docs.microsoft.com/power-platform/admin/powerapps-powershell#governance-error-message-content-commands).

### See also
[Power Apps admin PowerShell support](powerapps-powershell.md#power-apps-commands)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
