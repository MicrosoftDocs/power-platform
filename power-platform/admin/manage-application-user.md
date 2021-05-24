---
title: "Manage application user from the Power Platform admin center  | MicrosoftDocs"
description: How to manage application users from the Power Platform admin center  
author: paulliew
ms.author: paulliew
ms.reviewer: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/25/2021
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Manage application user from the Power Platform admin center

We are in the process of moving application user management from the legacy web client as documented in [Enable or disable application users](create-users-assign-online-security-roles.md#enable-or-disable-user-accounts). Follow these steps to manage application users from the Power Platform admin center.

## View application users in an environment 

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com) as an admin. 

2. Select **Environments**, and then select an environment from the list.

3. Select **Open environment**.

4. Select **Users + permissions**, and then select **Users**.

On the **Application Users** page you can view and manage application users.  

:::image type="content" source="media/manage-application-user.png" alt-text="Manage application users":::

The Custom app type is a partner application in Microsoft Azure Active Directory.

## Create a partner application user 

You can create an unlicensed application user in your environment. This application user will be given access to your environment's data on behalf of the end user who is using your application.  

In an environment, only one application user for each Azure AD registered application is supported.   

1. Sign in to the [Power Platform Admin center](https://admin.powerplatform.microsoft.com) as an admin. 

2. Select **Environments**, and then select an environment from the list.

3. Select **Open environment**.

4. Select **Users + permissions**, and then select **Users**.

5. Select **+ New app user** to open the **Create a new app user** page.

   :::image type="content" source="media/create-new-app-user.png" alt-text="Create a new application user":::

6. Select **+ add an app** to choose a registered Azure AD application that was created for the selected user, then select **Add**. 

   :::image type="content" source="media/add-app-from-azure-ad.png" alt-text="Add an application from Azure AD":::

7. The selected Azure AD app is displayed under **App**. You can select (![Edit](media/edit-button.png)) to choose another Azure AD application. Under **Business Unit** select a business unit from the dropdown.  

   :::image type="content" source="media/create-new-app-user-business-unit.png" alt-text="Select a business unit":::

8. After choosing a business unit, you can select (![Edit](media/edit-button.png)) for **Security roles** to choose security roles for the chosen business unit to add to the new application user. After adding security roles, select **Save**.

   :::image type="content" source="media/create-new-app-user-security-roles.png" alt-text="Add security roles to the new application user":::

9. For the final step, select **Create** to create the new application user.










8. 










