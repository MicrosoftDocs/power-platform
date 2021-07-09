---
title: Manage Power Apps | Microsoft Docs
description: How to manage Power Apps apps created in your organization.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/23/2021
ms.subservice: admin
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

Power Apps respects the Canvas App ‘Share’ privilege in Dataverse. A user will not be able to share canvas apps in an environment if they do not have a security role with the Canvas App Share privilege set to a value other than ‘None selected’. This Dataverse Canvas App Share privilege is also respected in the default environment. This article outlines how to edit a privileges in a security role: [Edit a security role](create-edit-security-role.md#edit-a-security-role).

   > [!div class="mx-imgBorder"] 
   > ![Dataverse Canvas App privileges](media/admin-manage-apps/dataverse_canvas_app_entity_share_privilege.png "Dataverse Canvas App entity privileges")

> [!NOTE]
> The ability to granularly control the Canvas App Share privilege in a security role requires Dataverse in the environment where the privilege is to be changed. Power Apps does not discretely recognize the other Dataverse Canvas app entity privileges set for the environment. 

### Surface your organization’s governance error content 
If you specify governance error message content to appear in error messages, it will be included in the error message displayed when users observe they don’t have permission to share apps in an environment. See: [PowerShell governance error message content commands](powerapps-powershell.md#governance-error-message-content-commands).

## Distinguish Microsoft SharePoint custom form makers from general Environment makers

In addition to the ability to save SharePoint custom form resources to a non-default environment, it is also possible to limit maker privileges to only be able to create and edit SharePoint custom forms in a non-default environment. Outside of the default environment, an admin can un-assign the Environment Maker security role from users and assign the SharePoint custom form maker security role. 

> [!NOTE]
> The ability to distinguish SharePoint custom form makers from general Environment Makers requires Dataverse in the environment where the privilege is to be changed.
>
> A user with only the SharePoint custom form maker role in an environment will not see the environment in the environment list in https://make.powerapps.com or https://flow.microsoft.com.
### Steps
1.	Have an admin, [designate an environment for SharePoint custom forms](https://docs.microsoft.com/power-platform/admin/powerapps-powershell#designate-sharepoint-custom-form-environment) that is different from default environment.

2.	Have an admin, install the [SharePoint custom form maker solution from AppSource](https://appsource.microsoft.com/product/dynamics-365/mscrm.sharepointcustomformmaker) to your environment designated for SharePoint custom forms.

3.	In Power Platform admin center, select the environment you designated for SharePoint custom forms in step one and assign the “SharePoint custom form maker” security role to users expected to create SharePoint custom forms. See [Assign security roles to users in an environment that has a Dataverse database](https://docs.microsoft.com/power-platform/admin/database-security#assign-security-roles-to-users-in-an-environment-that-has-a-dataverse-database).

#### Frequently asked questions

##### Can I edit privileges in the SharePoint custom form maker security role? 

No, the SharePoint custom form maker security role is added to an environment by importing a non-customizable solution. Note, SharePoint custom form creation requires a user to have permissions in SharePoint and Power Platform. The platform verifies a user has write permissions for the targeted SharePoint list and the user has permission in Power Platform to create or update the SharePoint custom form. For a SharePoint custom form maker to satisfy the Power Platform check, the user must have the SharePoint custom form security role or the Environment Maker security role.

##### Will a user with only the SharePoint custom form maker role see an environment in make.powerapps.com environment picker? 

No, a Maker that doesn’t have a security role called out in the [Choose environments documentation](https://docs.microsoft.com/powerapps/maker/canvas-apps/intro-maker-portal#choose-an-environment) will not see a the environment in the environment picker in https://make.powerapps.com. A user with the SharePoint custom form maker role may attempt to navigate to the environment by manipulating the URI. If the user attempts to create a standalone app they’ll observe a permission error. 

   > [!div class="mx-imgBorder"] 
   > ![Power Apps missing permission dialog](media/admin-manage-apps/power_apps_missing_permission_to_create.png "Power Apps missing permission dialog")

### See also
[Power Apps admin PowerShell support](powerapps-powershell.md#power-apps-commands)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
