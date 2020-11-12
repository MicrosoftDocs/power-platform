---
title: "Manage email tracking settings  | MicrosoftDocs"
description: View and manage email tracking settings for Microsoft Dataverse.
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/31/2020
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Manage email tracking settings

Use Email settings to adjust how model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, features appear and function.

These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Email** > **Email Tracking**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the business closures.

**Check your security role**

- Follow the steps in [View your user profile](https://docs.microsoft.com/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

> [!div class="mx-tableFixed"]
> |Settings|Description|  
> |--------------|-----------------|  
> |**Tracking email conversations**| |
> |Use correlation|Default: On. Select this check box if you want to link email activities with other related records using the information in the email headers. This method uses email properties for correlation and is more accurate than smart matching, but less accurate than folder-level tracking or tracking tokens. More information: [Email message filtering and correlation](email-message-filtering-correlation.md) **Note:**  Email correlation using email headers works best when email is processed using server-side synchronization. If you’re using the Email Router to process email, you can use tracking tokens or smart matching to correlate email activities with related records.|
> |Use tracking tokens|Default: On. Select this check box to use tracking tokens and to configure how [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)] displays them in the Subject line of the email messages.<br /><br /> Tracking tokens provide 100% tracking accuracy. If you don’t want to see tokens in Subject lines, however, consider folder-level tracking, which also provides 100% tracking accuracy.<br /><br /> You can configure prefixes and other sections of tracking tokens. Long prefixes or too many prefix changes may cause lost data in history, however. More information: [Email message filtering and correlation](email-message-filtering-correlation.md)|  
> |**Tracking token preview**| More information: [Use Email message filtering and correlation to specify which emails are tracked](email-message-filtering-correlation.md)|
> |Prefix| Default: CRM. |
> |Base tracking number| Default: 0. |
> |Number of digits for personal numbers|Default: 3. |
> |Number of digits for email activity counter|Default: 3. |
> |Use smart matching|Default: Off. Select **On** to use smart matching to correlate email based on the similarity between email messages. Smart matching isn’t as accurate as tracking tokens or folder-level tracking. More information: [Email message filtering and correlation](email-message-filtering-correlation.md)|
> |**Folder-level tracking**||  
> |Use folder-level tracking for Exchange folders (server-side synchronization must be enabled)|Default: On. Users can set up [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] tracking folders, and then move messages to those folders to track them automatically on virtually any device. More information: [Track Outlook email by moving it to a tracked Exchange folder](track-outlook-email-by-moving-it-tracked-exchange-folder.md)<br /><br /> Folder-level tracking provides 100% tracking accuracy. To use folder-level tracking:<br /><br /> -   Select **On**.<br />-   Your organization must synchronize email through server-side synchronization. More information: [Set up server-side synchronization](set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md)|  
> |**Tracking items**| |
> |People can use categories to track emails and appointments|Default: Off. Content coming.|
> |Allow auto-tracking on outgoing email|Default: Off. Content coming.|
> |**Tracking between people**| |
> |Track emails sent between Dynamics 365 users as two activities|Default: On. Select this option to create two email activities between [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)] users, one for the sender and one for the recipient.| 
