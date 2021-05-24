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

2. Select **Open environment**.

3. Select **Users + permissions**, and then select **Users**.

On the **Application Users** page you can view and manage application users.  

image

The Custom app type is a partner application in Microsoft Azure Active Directory.

## Create third party application user 

To create an unlicensed "application user" in your environment, follow these steps. This application user will be given access to your environment's data on behalf of the end user who is using your application.  

 

In an environment, only one application user for each Azure AD registered application is supported   