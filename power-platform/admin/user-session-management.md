---
title: "Security enhancements: User session and access management"
description: "Security enhancements: User session and access management"
ms.component: pa-admin
ms.topic: concept-article
ms.date: 06/19/2025
author: alaug 
ms.subservice: admin
ms.custom: 
  - NewPPAC
  - admin-security
ms.author: alaug
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Security enhancements: User session and access management 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

You can use security enhancements to protect the customer engagement apps, such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation. 

## User session timeout management

The 24-hour maximum user session timeout is removed. As a result, users are no longer required to sign in with their credentials every 24 hours to continue using the customer engagement apps and other Microsoft service apps, such as Outlook, within the same browser session. 

### Honor Microsoft Entra session policy 
By default, the customer engagement apps use the Microsoft Entra [session policy](/azure/active-directory/develop/active-directory-configurable-token-lifetimes) to manage the user session timeout. Customer engagement apps use the Microsoft Entra ID Token with a Policy Check Interval (PCI) claims. Every hour a new Microsoft Entra ID Token is fetched silently in the background and the Microsoft Entra instant policy is enforced (by Microsoft Entra ID). For example, when an administrator disables or deletes a user account, blocks the user from signing in, and an administrator or user revokes the refresh token, the system enforces the Microsoft Entra session policy. 

This Microsoft Entra ID token refresh cycle continues in the background based on the Microsoft Entra token lifetime policy configurations. Users continue to access the customer engagement apps/Microsoft Dataverse data without the needs to reauthenticate until the Microsoft Entra token lifetime policy expires. 

> [!NOTE]
> - The default Microsoft Entra refresh token expiration is 90 days. This token lifetime properties can be configured. For detailed information, see [Configurable token lifetimes in Microsoft Entra ID](/azure/active-directory/develop/active-directory-configurable-token-lifetimes#configurable-token-lifetime-properties).
> - The Microsoft Entra session policy is bypassed and the maximum user session duration is reverted back to 24 hours in the following scenarios:
>   - In a browser session, you went to the **Power Platform admin center** and opened an environment by manually keying in the environment URL (either on the same browser tab or a new browser tab).<br/> 
>     **To workaround** the policy bypass and maximum 24 hour user session, open the environment from the Power Platform admin center **environments** tab by selecting the **Open** link.
>   - In the same browser session, open a version 9.1.0.3647 or higher environment and then open a version earlier 9.1.0.3647. <br/>
>     **To workaround** the policy bypass and user duration change, open the second environment in a separate browser session.
>
> To determine your version, sign in to customer engagement apps, and in the upper-right side of the screen, select the **Settings** button (![User profile Settings button.](media/user-profile-settings-button.png)) > **About**. 


### Resilience to Microsoft Entra outages 
If intermittent Microsoft Entra outages occur, authenticated users can still access customer engagement apps and Dataverse data if their PCI claims remain valid or they opt into 'Stay signed in' during authentication. 

### Set Custom Session timeout for individual environment 
For environments that require different session timeout values, administrators can continue to set the session timeout and/or inactivity timeout in the System Settings. These settings override the default Microsoft Entra session policy and users are directed to Microsoft Entra ID reauthentication when these settings expired.   

### To change this behavior

- To enforce users to reauthenticate after a predetermined period of time, admins can set a session timeout for their individual environments. Users can only remain signed in the application during session. The application signs out the user when the session expires. Users need to sign in with their credentials to return to customer engagement apps.

> [!NOTE]
> User session timeout isn't enforced in the following apps:
> 1. [!INCLUDE [pn-oc-online-short](../includes/pn-oc-online-short.md)]
> 2. [!INCLUDE [pn-dyn-365-phones](../includes/pn-dyn-365-phones.md)] and [!INCLUDE [pn-dyn-365-tablets](../includes/pn-dyn-365-tablets.md)]
> 3. [!INCLUDE [pn-unified-service-desk](../includes/pn-unified-service-desk.md)] client using [WPF](/dotnet/framework/wpf/) browser (Internet Explorer is supported)
> 4. Live Assist (Chat)
> 5. Power Apps canvas apps 

## Configure session timeout 

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**. 
1. Expand **Product**, then select **Privacy + Security**.
1. Turn on the **Session Expiration** setting.
1. Enter values in the following fields:
    - **Enter maximum session length**
    - **How long before the session expires do you want to show  timeout warning?**

These settings apply to all users.
   
#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Product**, then select **Privacy + Security**.
1. Turn on the **Session Expiration** setting.
1. Enter values in the following fields:
    - **Enter maximum session length**
    - **How long before the session expires do you want to show  timeout warning?**

These settings apply to all users.

---

> [!NOTE]
> **Session timeout** is a server side feature where life time of all sessions is enforced.
> Default values are:
> - Maximum Session Length: 1,440 minutes
> - Minimum Session Length: 60 minutes
> - How long before session expires before showing timeout warning: 20 minutes

> - The updated settings will be effective the next time the user signs in to the application.

## Inactivity timeout
By default, customer engagement apps don't enforce an inactivity session timeout. A user can remain logged in the application until the session timeout expires. You can change this behavior.

- To enforce users to automatically be signed out after a predetermined period of inactivity, admins can set an inactivity timeout period for each of their environments. The application signs out the user when the inactivity session expires.

> [!NOTE]
> Inactivity session timeout isn't enforced in the following apps:
> 1. [!INCLUDE [pn-oc-online-short](../includes/pn-oc-online-short.md)]
> 2. [!INCLUDE [pn-dyn-365-phones](../includes/pn-dyn-365-phones.md)] and [!INCLUDE [pn-dyn-365-tablets](../includes/pn-dyn-365-tablets.md)]
> 3. [!INCLUDE [pn-unified-service-desk](../includes/pn-unified-service-desk.md)] client using [WPF](/dotnet/framework/wpf/) browser (Internet Explorer is supported)
> 4. Live Assist (Chat)
> 5. Power Apps canvas apps 

To enforce the inactivity session timeout for Web Resources, Web Resources need to include the ClientGlobalContext.js.aspx file in their solution.

The Dynamics 365 portal has its own settings to manage its session timeout and inactivity session timeout independent of these system settings.

## Configure inactivity timeout

#### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**. 
1. Expand **Product**, then select **Privacy + Security**.
1. Turn on the toggle for **Inactivity timeout** and set inactivity timeout values. These settings apply to all users.
   
#### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Product**, then select **Privacy + Security**.
1. Turn on the toggle for **Inactivity timeout** and set inactivity timeout values. These settings apply to all users.
---

> [!NOTE]
>  **Inactivity timeout** is a client side feature where client is making decision to primitively sign out based on the inactivity.
> Default values are:
> - Minimum Duration of Inactivity: 5 minutes
> - Maximum Duration of Inactivity: less than Maximum Session length or 1,440 minutes

> - The updated settings will be effective the next time the user signs in to the application. 

## Access management

Customer engagement apps use Microsoft Entra ID as the identity provider. To secure the user's access to customer engagement apps, the following measures were implemented:

- To enforce users to reauthenticate, users are required to sign in with their credentials after they signed out within the application. 
- To prevent users from sharing credentials to access customer engagement apps, the system validates the user access token to ensure that the identity provider granted access to the same user who is accessing the apps.



[!INCLUDE[footer-include](../includes/footer-banner.md)]
