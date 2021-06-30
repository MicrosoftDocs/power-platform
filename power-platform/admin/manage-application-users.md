---
title: "Manage application users in the Power Platform admin center  | MicrosoftDocs"
description: How to manage application users from the Power Platform admin center  
author: paulliew
ms.author: paulliew
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/01/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Manage application users in the Power Platform admin center

We're in the process of moving application user management from the legacy web client, as documented in [Enable or disable application users](create-users-assign-online-security-roles.md#enable-or-disable-user-accounts). Follow these steps to manage application users in the Power Platform admin center.

> [!NOTE]
> At present, deleting an application user isn't supported.

## View application users in an environment 

On the **Application users** page, you can view and manage application users. The **Custom** app type is your local app registration, as created in Azure Active Directory (Azure AD).

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a System Administrator. 

2. Select **Environments**, and then select an environment from the list.

3. Select **Settings**.

4. Select **Users + permissions**, and then select **Application users**.

:::image type="content" source="media/manage-application-user.png" alt-text="Manage application users":::

## Create an application user 

You can create an unlicensed application user in your environment. This application user will be given access to your environment's data on behalf of the user who's using your application. 

In an environment, you can only have one application user for each Azure AD&ndash;registered application.   

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a System Administrator. 

2. Select **Environments**, and then select an environment from the list.

3. Select **Settings**.

4. Select **Users + permissions**, and then select **Application users**.

5. Select **+ New app user** to open the **Create a new app user** page.

   :::image type="content" source="media/create-new-app-user.png" alt-text="Create a new application user":::

6. Select **+ add an app** to choose the registered Azure AD application that was created for the selected user, and then select **Add**. 

   :::image type="content" source="media/add-app-from-azure-ad.png" alt-text="Add an application from Azure AD":::

7. The selected Azure AD app is displayed under **App**. You can select **Edit** (![Edit](media/edit-button.png)) to choose another Azure AD application. Under **Business Unit**, select a business unit from the dropdown list.  

   :::image type="content" source="media/create-new-app-user-business-unit.png" alt-text="Select a business unit":::

8. After choosing a business unit, you can select ![Edit](media/edit-button.png) for **Security roles** to choose security roles for the chosen business unit to add to the new application user. After adding security roles, select **Save**.

   :::image type="content" source="media/create-new-app-user-security-roles.png" alt-text="Add security roles to the new application user":::

9. Select **Create**.

## View or edit the details of an application user 

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com) as a System Administrator. 

2. Select **Environments**, and then select an environment from the list.

3. Select **Settings**.

4. Select **Users + permissions**, and then select **Application users**.

5. Select an application user, and then select **Details**.

   :::image type="content" source="media/application-user-details.png" alt-text="Select application user details":::

The **Details** page shows the following properties for the application user: 

- Name 
- Azure AD application ID
- State
- Assigned security roles 
- App type 
- Business unit
- Email address 
 
The business unit, email address, and security roles can be edited.

:::image type="content" source="media/application-user-details-page.png" alt-text="The application user details page":::

## Sync the application user name with the Azure AD application name  

When an application user is first created, the username is the same as the name of the registered Azure AD application. The two names can get out of sync when the name of the Azure AD application is changed. You can sync the application user name with the Azure AD application name by selecting **Refresh** on the **Details** page. 

> [!NOTE]
> **Refresh** and the Azure AD app name are only shown when the two names are out of sync. 

:::image type="content" source="media/sync-app-user-name-azure-ad-app-name.png" alt-text="Sync the application user name with the Azure AD application name":::

## Manage roles for an application user 

In addition to using the entry point on the **Details** page<!--note from editor: To match the reference in line 102 and in most places in the repo.--> to manage roles, you can select **Edit security Roles** on the menu bar on the **Application users** page. If the application user has roles assigned already, those roles will appear as selected on the page.

You can select or deselect roles, and then select **Save**.  All selected roles will become the current assigned roles for the application user. Any unselected roles won't be assigned.

:::image type="content" source="media/application-user-edit-security-roles.png" alt-text="Editing security roles for an application user":::

## Activate or deactivate an application user 

- On the **Application user** page, do one of the following:

  - To activate an application user, select **Activate** on the menu bar, and then select **Activate** in the confirmation dialog.  

   :::image type="content" source="media/activate-application-user.png" alt-text="Activate an application user"::: 

  - To deactivate an application user, select **Deactivate** on the menu bar, and then select **Deactivate** in the confirmation dialog.  
