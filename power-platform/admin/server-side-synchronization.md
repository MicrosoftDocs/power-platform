---
title: "Server-side synchronization  | MicrosoftDocs"
description: Server-side synchronization
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/09/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Server-side synchronization

<a name="BKMK_serversidesync"></a> 

Server-side synchronization is the preferred option for organizations with users who run customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), in a web browser or on a mobile device, such as a tablet or smartphone. Server-side synchronization provides direct apps-to-email server synchronization. When you use [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)], this includes bi-directional synchronization of email, contacts, tasks, and appointments. The data synchronized for each user can be controlled by using synchronization filters that are available from the **Synchronization** tab in the user options dialog.  
  
 If you use a POP3 email server, the data that is synchronized includes email only.  
  
 Using server-side synchronization makes messaging data available to a web browser, tablet, or smartphone that is running customer engagement apps.  
  
 For more information about server-side synchronization, see [Server-side synchronization of email, appointments, contacts, and tasks](../admin/set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md).  
  
 ![Server-side synchronization](../admin/media/server-side-sync-diagram.png "Server-side synchronization")  
  
> [!NOTE]
>  A user can only map to a single [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] or POP3 mailbox. Similarly, an [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] or POP3 mailbox can only be mapped to a single user. When customer engagement apps detect that an [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] or POP3 mailbox has already been mapped to a user, a dialog box is displayed to present a choice to the user whether to map the user to the [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] mailbox. When the user selects yes, it breaks the previous user to [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] mailbox mapping and subsequently the synchronization that would occur between the user and the [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] mailbox.  
  
## Server-side synchronization frequency 
 When synchronization by using server-side synchronization occurs, the process is dynamic and unique for each user’s mailbox. The synchronization algorithm ensures that mailboxes are synced according to dynamic parameters such as the number of email messages and the activity within the mailbox. Normally, email synchronization occurs every 5 minutes. When a mailbox has many email messages, the interval can be reduced dynamically to 2 minutes. If the mailbox is less active, the interval can be increased up to 12 minutes. Generally speaking, you can assume that a mailbox will be synced at least once every 12 minutes. Note that you can’t manually synchronize records through server-side synchronization and when you track email (**Track** button), this occurs immediately.  
  
## Features available with server-side synchronization 
 Some features offered by server-side synchronization include the following:  
  
- **Sent Items folder**: If your server version is 9.1.0000.16819 or greater, email messages sent from Dynamics 365 apps using a server-side synchronization enabled Exchange mailbox will be visible in the **Sent Items** folder in the Exchange sender mailbox. To determine your version, sign in and in the upper-right corner of the screen, select the **Settings** button (![User profile Settings button](media/user-profile-settings-button.png)) > **About**.  

- **Email folder tracking**: You can simply drag email to a folder to track it. Folder tracking works on any mobile device that supports [!INCLUDE[pn_Microsoft_Exchange](../includes/pn-microsoft-exchange.md)], which means you can track email from just about any device.  
  
- **Doesn’t require Outlook**: You don’t have to have the [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] add-in open to synchronize records. You can still use [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] to track records manually even if you do the synchronization through server-side sync. This also helps to boost the performance of the Outlook add-in.  
  
- **Support for [!INCLUDE[pn_crm_app_for_outlook_short](../includes/pn-crm-app-for-outlook-short.md)]**: You can track incoming email with the new [!INCLUDE[pn_crm_app_for_outlook_short](../includes/pn-crm-app-for-outlook-short.md)]. [!INCLUDE[pn_crm_app_for_outlook_short](../includes/pn-crm-app-for-outlook-short.md)] works with [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] on the web. So all you need is a browser to track incoming email.  
  
## Features available with server-side synchronization in both customer engagement apps and Customer Engagement (on-premises)
 Some features offered by server-side synchronization include the following:  
  
- **Efficient resource utilization.** Server-side synchronization provides integrated mailbox management. You can disable inactive mailboxes that have permanent errors. It prevents resource hogging by applying an upper limit on the allocated capacity and time-out requests.  
  
- **Connection throttling.** Server-side synchronization provides a way to control the number of parallel connections opened against an email server to prevent overloading the mail server.  
  
- **Data migration.** Server-side synchronization supports migrating configuration data from Email Router to server-side synchronization by using the migration wizard. 
  
- **Service isolation.** Server-side synchronization has separate queue-management and configuration settings for asynchronous operations, outgoing activities, and mailboxes. It is based off asynchronous service architecture and may share the same process. In all cases, it manages server resources while maintaining isolation with the asynchronous service.  
  
- **Error reporting for users and administrators.** Server-side synchronization supports logging and reporting of errors specific to an email or one or more mailboxes. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Error Logging for Server-Side Synchronization](../admin/error-logging-server-side-synchronization.md).  
  
> [!NOTE]
> In customer engagement apps, you can synchronize emails using [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] or server-side synchronization. If server-side synchronization is selected, the synchronization does not require running [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)]. You will, however, still need [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] to promote an item from [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)].  
  
### See also  
 [Set up server-side synchronization of email, appointments, contacts, and tasks](../admin/set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md)   
 [Synchronizing data with Outlook or Exchange FAQ](frequently-asked-questions-synchronizing-records-dynamics-365-and-outlook.md)
