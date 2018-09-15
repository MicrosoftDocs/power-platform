---
title: "Manage privacy and security settings | MicrosoftDocs"
description: View and manage privacy and security settings for Common Data Service for Apps.
ms.custom: ""
ms.date: 08/10/2018
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

Use these settings to adjust Dynamics 365 (online) privacy and security.

These settings can be found in the Power platform Admin center by going to **Environments** > [select an environment] > **Settings** > **Privacy + Security**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the business closures.

**Check your security role**

- Follow the steps in [View your user profile](https://docs.microsoft.com/dynamics365/customer-engagement/basics/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

## Settings

|Settings|Description|  
|--------------|-----------------|  
|**Privacy preference**|More information: [Set privacy preferences for an organization](https://docs.microsoft.com/dynamics365/customer-engagement/admin/set-privacy-preferences-organization)|  
|Show privacy statement link for this organization|Default: Off. Select to display the privacy statement link.|  
|Privacy statement URL|Provide users with a link to your organization's privacy statement. If you show the link, it will be added to the **Settings** menu.| 
|**Default action to take when an error occurs**| |
|Ask the user for permission to send an error report to Microsoft|Default: Not selected.  Content coming.|  
|Automatically send an error report to Microsoft without asking me for permission|Default: Not selected.  Content coming.|  
|Never send an error report to Microsoft|Default: Not selected. Content coming.|  
|**Blocked attachments**| |
|Set blocked file extensions for attachments (semicolon separated)|Prevent upload or download of certain attachment types that are considered dangerous. Separate file extensions with a semicolon.|
|**Session expiration**|More information: [Security enhancements: User session and access management](https://docs.microsoft.com/dynamics365/customer-engagement/admin/user-session-management)|  
|Set custom session timeout|Default: Off. Select **On** to specify values different from default values.|
|Enter maximum session length|Default: 1440. After the time you set is reached, users must re-authenticate to Dynamics 365 (online).|  
|How long before the session expires do you want to show a timeout warning?|Default: 20. After the time you set is reached, users receive an expiration warning.|  
|**Inactivity timeout**|More information: [Inactivity timeout](https://docs.microsoft.com/dynamics365/customer-engagement/admin/user-session-management#inactivity-timeout) |  
|Set inactivity timeout|Default: Off. Enable to automatically sign out a user. |  


