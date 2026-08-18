---
title: Security enhancements for user sessions and access management
description: Learn how to set options that govern user sessions and access management
ms.component: pa-admin
ms.topic: concept-article
ms.date: 08/04/2026
author: alaug 
ms.subservice: admin
ms.custom: 
  - NewPPAC
  - admin-security
ms.author: alaug
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
---

# Security enhancements for user sessions and access management

Use security enhancements to protect customer engagement apps, such as Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation. This article covers how you can manage user sessions and access to ensure secure and controlled user interactions.

## User session timeout management

By default, your Microsoft Entra session policy governs user sessions instead of a fixed 24-hour limit. Users stay signed in to the customer engagement apps and other Microsoft apps opened in the same browser session without having to re-enter their credentials every 24 hours.

This policy doesn't extend an individual session beyond 24 hours. If you set a custom session timeout for an environment, the session length you configure applies - between a minimum of 60 minutes and a maximum of 1,440 minutes (24 hours) - and it overrides the default Microsoft Entra behavior.

### Default Microsoft Entra session policy

By default, the customer engagement apps use the Microsoft Entra [session policy](/azure/active-directory/develop/active-directory-configurable-token-lifetimes) to manage the user session timeout. Customer engagement apps use the Microsoft Entra ID Token with a Policy Check Interval (PCI) claims. Every hour a new Microsoft Entra ID Token is fetched silently in the background and the Microsoft Entra instant policy is enforced (by Microsoft Entra ID). For example, when an administrator disables or deletes a user account, blocks the user from signing in, and an administrator or user revokes the refresh token, the system enforces the Microsoft Entra session policy. 

This Microsoft Entra ID token refresh cycle continues in the background based on the Microsoft Entra token lifetime policy configurations. Users continue to access the customer engagement apps and Microsoft Dataverse data without the need to reauthenticate until the Microsoft Entra token lifetime policy expires. 

> [!NOTE]
> - The default Microsoft Entra refresh token expiration is 90 days. You can configure this token lifetime property. For detailed information, see [Configurable token lifetimes in Microsoft Entra ID](/azure/active-directory/develop/active-directory-configurable-token-lifetimes#configurable-token-lifetime-properties).
> - The following scenarios bypass the Microsoft Entra session policy and revert the maximum user session duration back to 24 hours:
>   - In a browser session, you go to the **Power Platform admin center** and open an environment by manually keying in the environment URL (either on the same browser tab or a new browser tab).<br/> 
>     **To work around** the policy bypass and maximum 24 hour user session, open the environment from the Power Platform admin center **environments** tab by selecting the **Open** link.
>   - In the same browser session, you open a version 9.1.0.3647 or higher environment and then open a version earlier 9.1.0.3647. <br/>
>     **To work around** the policy bypass and user duration change, open the second environment in a separate browser session.
>
> To determine your version, sign in to customer engagement apps, and in the upper-right side of the screen, select the **Settings** button > **About**. 

### Microsoft Entra outage resilience 

If intermittent Microsoft Entra outages occur, authenticated users can still access customer engagement apps and Dataverse data if their PCI claims remain valid or they opt into **Stay signed in** during authentication. 

### Session timeout for individual environments
 
For environments that require different session timeout values, you can set the session timeout and inactivity timeout in the System Settings. These settings override the default Microsoft Entra session policy. When these settings expire, users are directed to Microsoft Entra ID reauthentication.   

To enforce users to reauthenticate after a predetermined period of time, admins can set a session timeout for their individual environments. Users can only remain signed in the application during the session. The application signs out the user when the session expires. Users need to sign in with their credentials to return to customer engagement apps.

> [!NOTE]
> The following apps don't enforce user session timeout:
> 1. [!INCLUDE [pn-oc-online-short](../includes/pn-oc-online-short.md)]
> 2. [!INCLUDE [pn-dyn-365-phones](../includes/pn-dyn-365-phones.md)] and [!INCLUDE [pn-dyn-365-tablets](../includes/pn-dyn-365-tablets.md)]
> 3. [!INCLUDE [pn-unified-service-desk](../includes/pn-unified-service-desk.md)] client using [WPF](/dotnet/framework/wpf/) browser (Internet Explorer is supported)
> 4. Live Assist (Chat)
> 5. Power Apps canvas apps 

To configure session timeout for an individual environment, follow these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**. 
1. Expand **Product**, and then select **Privacy + Security**.
1. Turn on the **Session Expiration** setting.
1. Enter values in the following fields:
    - **Enter maximum session length**
    - **How long before the session expires do you want to show timeout warning?**

    These settings apply to all users.
1. Select **Save**.

> [!NOTE]
> **Session timeout** is a server-side feature that enforces the lifetime of all sessions. When you turn on **Session Expiration**, you configure two values:
> - **Session length** — how long users can stay signed in before the session ends and they need to sign in again. Minimum: 60 minutes. Maximum: 1,440 minutes (24 hours).
> - **Timeout warning** — how long before the session end time that users receive a warning, so they have time to save their work before signing in again. Minimum: 20 minutes. It must be a value shorter than the session length.
> 
> These settings apply to all users and take effect the next time a user signs in.

> [!NOTE]
> The warning is based on the time remaining in the session, not on when the user opens the app. If a user opens or returns to the app when less time remains than the warning value, the warning appears right away. Choose a warning value that gives users enough time to save their work before the session ends: when a session expires, users must sign in again and a new session starts, so any unsaved work can be lost. Saving work and signing in again when the warning appears—rather than waiting for the session to expire—helps avoid this.

## Inactivity timeout management

By default, customer engagement apps don't enforce an inactivity session timeout. A user can stay signed in to the application until the session timeout expires. You can change this behavior.

To enforce automatic sign-out after a predetermined period of inactivity, you, as an administrator, can set an inactivity timeout period for each of your environments. The application signs out the user when the inactivity session expires.

To enforce the inactivity session timeout for web resources, web resources need to include the `ClientGlobalContext.js.aspx` file in their solution.

The Dynamics 365 portal has its own settings to manage its session timeout and inactivity session timeout that are independent of these system settings.

> [!NOTE]
> The following apps don't enforce inactivity session timeout:
> - [!INCLUDE [pn-oc-online-short](../includes/pn-oc-online-short.md)]
> - [!INCLUDE [pn-dyn-365-phones](../includes/pn-dyn-365-phones.md)] and [!INCLUDE [pn-dyn-365-tablets](../includes/pn-dyn-365-tablets.md)]
> - [!INCLUDE [pn-unified-service-desk](../includes/pn-unified-service-desk.md)] client using [WPF](/dotnet/framework/wpf/) browser (Internet Explorer is supported)
> - Live Assist (Chat)
> - Power Apps canvas apps 

To configure the inactivity timeout for an individual environment, follow these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**. 
1. Expand **Product**, and then select **Privacy + Security**.
1. Turn on the **Inactivity timeout** setting.
1. Enter values in the following fields:
    - **Duration of inactivity before timeout**
    - **How long before the session expires do you want to show an inactivity warning?**
    These settings apply to all users.
1. Select **Save**.

> [!NOTE]
>  **Inactivity timeout** is a client feature where the client decides to sign out based on inactivity. The default values are:
> - Minimum duration of inactivity: 5 minutes
> - Maximum duration of inactivity: less than maximum session length or 1,440 minutes
>   
> The updated settings take effect the next time the user signs in to the application. 

## Access management

Customer engagement apps use Microsoft Entra ID as the identity provider. To secure the user's access to customer engagement apps, implement the following measures:

- Require users to reauthenticate by signing in with their credentials after they sign out within the application. 
- Prevent users from sharing credentials to access customer engagement apps by validating the user access token to ensure that the identity provider grants access to the same user who is accessing the apps.
