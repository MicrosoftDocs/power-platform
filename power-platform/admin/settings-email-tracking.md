---
title: "Manage email tracking settings | MicrosoftDocs"
description: View and manage email tracking settings for Common Data Service for Apps.
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
robots: noindex,nofollow
---
# Manage email tracking settings
[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use Email settings to adjust how Dynamics 365 (online) features appear and function.

These settings can be found in the Business Application Platform Admin center by going to **Environments** > [select an environment] > **Settings** > **Email settings**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the business closures.

**Check your security role**

- Follow the steps in [View your user profile](https://docs.microsoft.com/dynamics365/customer-engagement/basics/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

|Settings|Description|  
|--------------|-----------------|  
|**Tracking email conversations**| |
|Use correlation to track email conversations|Select this check box if you want to link email activities with other related records using the information in the email headers. This method uses email properties for correlation and is more accurate than smart matching, but less accurate than folder-level tracking or tracking tokens. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Email message filtering and correlation](https://docs.microsoft.com/dynamics365/customer-engagement/admin/email-message-filtering-correlation) **Note:**  Email correlation using email headers works best when email is processed using server-side synchronization. If you’re using the Email Router to process email, you can use tracking tokens or smart matching to correlate email activities with related records.|
|Use tracking tokens|Select this check box to use tracking tokens and to configure how [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)] displays them in the Subject line of the email messages.<br /><br /> Tracking tokens provide 100% tracking accuracy. If you don’t want to see tokens in Subject lines, however, consider folder-level tracking, which also provides 100% tracking accuracy.<br /><br /> You can configure prefixes and other sections of tracking tokens. Long prefixes or too many prefix changes may cause lost data in history, however. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Email message filtering and correlation](https://docs.microsoft.com/dynamics365/customer-engagement/admin/email-message-filtering-correlation)|  
|**Tracking token preview**| Content coming.|
|Prefix| Default: CRM. Content coming.|
|Deployment base tracking number| Default: 0. Content coming.|
|Number of digits for user numbers|Default: 3. Content coming.|
|Number of digits for incremental message counter|Default: 3. Content coming.|
|Use smart matching|Default: Off. Content coming.|
|**Folder-level tracking**||  
|Use folder-level tracking for Exchange folders (server-side synchronization must be enabled)|Users can set up [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] tracking folders, and then move messages to those folders to track them automatically on virtually any device. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Track Outlook email by moving it to a tracked Exchange folder](https://docs.microsoft.com/dynamics365/customer-engagement/admin/track-outlook-email-by-moving-it-tracked-exchange-folder)<br /><br /> Folder-level tracking provides 100% tracking accuracy. To use folder-level tracking:<br /><br /> -   You must select this check box.<br />-   Your organization must synchronize email through server-side synchronization. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Set up server-side synchronization](https://docs.microsoft.com/dynamics365/customer-engagement/admin/set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks)|  
|**Tracking items**| |
|Use Outlook categories to track Outlook items|Default: Not selected. Off. Content coming.|
|Allow auto-tracking from sent items|Default: Not selected. Off. Content coming.|
|**Tracking between Dynamics 365 users**| |
|Track emails sent between Dynamics 365 users as two activities|Default: Off. Select this option to create two email activities between [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)] users, one for the sender and one for the recipient.| 
