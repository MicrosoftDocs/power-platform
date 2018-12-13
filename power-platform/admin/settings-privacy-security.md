---
title: "Manage privacy and security settings | MicrosoftDocs"
description: View and manage privacy and security settings for Common Data Service for Apps.
ms.custom: ""
ms.date: 11/15/2018
ms.reviewer: ""
ms.service: "crm-online"
ms.suite: ""
ms.tgt_pltfrm: ""
ms.topic: "get-started-article"
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
caps.latest.revision: 31
author: "jimholtz"
ms.author: "jimholtz"
manager: "kvivek"
search.audienceType: 
  - admin
search.app: 
  - Powerplatform
---
# Manage privacy and security settings

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use these settings to adjust Dynamics 365 for Customer Engagement apps privacy and security.

These settings can be found in the Power platform Admin center by going to **Environments** > [select an environment] > **Settings** > **Privacy + Security**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the business closures.

**Check your security role**

- Follow the steps in [View your user profile](https://docs.microsoft.com/dynamics365/customer-engagement/basics/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

## Settings

|Settings|Description|  
|--------------|-----------------|  
|**Privacy preference**|More information: [Set error reporting preferences for the organization](#set-error-reporting-preferences-for-the-organization)|  
|Show privacy statement link for this organization|Default: Off. Select to display the privacy statement link.|  
|Privacy statement URL|Provide users with a link to your organization's privacy statement. If you show the link, it will be added to the **Settings** menu.| 
|**Default action to take when an error occurs**|More information: [Replace the privacy statement for the organization](#replace-the-privacy-statement-for-the-organization) |
|Ask the user for permission to send an error report to Microsoft|Default: Not selected. |  
|Automatically send an error report to Microsoft without asking me for permission|Default: Not selected.  |  
|Never send an error report to Microsoft|Default: Not selected. |  
|**Blocked attachments**| |
|Set blocked file extensions for attachments (semicolon separated)|Prevent upload or download of certain attachment types that are considered dangerous. Separate file extensions with a semicolon.|
|**Session expiration**|More information: [Security enhancements: User session and access management](https://docs.microsoft.com/dynamics365/customer-engagement/admin/user-session-management)|  
|Set custom session timeout|Default: Off. Select **On** to specify values different from default values.|
|Enter maximum session length|Default: 1440. After the time you set is reached, users must re-authenticate to Customer Engagement apps.|  
|How long before the session expires do you want to show a timeout warning?|Default: 20. After the time you set is reached, users receive an expiration warning.|  
|**Inactivity timeout**|More information: [Inactivity timeout](https://docs.microsoft.com/dynamics365/customer-engagement/admin/user-session-management#inactivity-timeout) |  
|Set inactivity timeout|Default: Off. Enable to automatically sign out a user. |  

## Replace the privacy statement for the organization  
 By default, the [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] privacy statement is always shown to users with an administrator role only, and not to other (business) users. As an administrator, you can add a link to specify your organization's privacy statement, which is then shown to other users in your organization.  
  
1. Go to **Environments** > [select an environment] > **Settings** > **Privacy + Security**
  
2. Under **Privacy Preferences**, turn on **Show privacy statement link for this organization**.
  
3. In the **Privacy statement URL** box, type the link of the webpage you want to show.  
  
   > [!div class="mx-imgBorder"] 
   > ![Replace privacy statement for the organization](media/privacy-preference-statement75.png "Replace privacy statement for the organization")
  
4. Select **Save**.  
  
> [!NOTE]
>  Any user with the System Administrator security role will always see the [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] privacy statement and not the organization’s privacy statement.


## Set error reporting preferences for the organization 
 When errors occur in the product, data about the problem is sent to [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)]. This data – an error report - allows Customer Engagement apps to track and address errors relating to [!INCLUDE[pn_microsoftcrm](../includes/pn-microsoftcrm.md)]. You can help [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] improve products and services when you allow the system to send these error reports.  
  
 By default, individual users in Customer Engagement apps have a measure of control over whether to send error reports to [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)]. But you, as an administrator, can override their preferences and set up the error reporting preferences for the entire organization.  
  
1. Go to **Environments** > [select an environment] > **Settings** > **Privacy + Security**
  
2. Under **Privacy Preferences**, **Default action to take when an error occurs**, select an action to take. 
  
   > [!div class="mx-imgBorder"] 
   > ![Select error notification preferences for users](media/privacy-preference-error-notifications75.png "Select error notification preferences for users")
 
3. Select **Save**. 

When you use this setting, you can control error reporting for the entire organization by:  
  
-   Not allowing users to make changes in how error reporting occurs.  
  
-   Changing the default behavior for how error reporting happens.  
  