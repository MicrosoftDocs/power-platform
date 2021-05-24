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

5. Select **+ New app user**.

   :::image type="content" source="media/create-new-app-user.png" alt-text="Create a new application user":::

6. To select a registered Azure AD application which the application user is created for, on the panel, select + Add an app to open the panel which displays all the registered applications under your tenant in AAD and then select the application you want and select Add.  





