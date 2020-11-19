---
title: "Manage email settings  | MicrosoftDocs"
description: View and manage email settings for Microsoft Dataverse.
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/02/2020
ms.author: jimholtz 
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Manage email settings

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

Use Email settings to adjust how model-driven apps in Dynamics 365, such as Dynamics 365 Sales and Customer Service, features appear and function.

These settings can be found in the Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Email** > **Email settings**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the business closures.

**Check your security role**

- Follow the steps in [View your user profile](https://docs.microsoft.com/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

> [!div class="mx-tableFixed"]
> |Settings|Description|  
> |--------------|-----------------|  
> |**Security and permissions**| Select these check boxes if you want to allow email processing only for users and queues whose email addresses have been approved by the system administrator.|
> |Process emails only for approved users|Default: On. |
> |Process emails only for approved queues|Default: On. |
> |Sync information rights management-enabled emails to the server|Default: Not selected. Off. Select **On** to sync emails that have information rights property.|
> |Allow to delete appointments if system auto detects changes that will result in change in ownership|Default: Not selected. Off.| 
> |**Notifications**||
> |When these occur, send details to the mailbox's notifications area||
> |Errors|Default: Enabled.|
> |Warnings|Default: Enabled. Select **Warning** if you’re troubleshooting or testing or want to get more detailed messages on the alert wall.|
> |Information|Default: Enabled. |
> |Notify mailbox owner|Default: Off. By default, the system administrator is notified of any error that occurs for an email server profile. Select **On** if you also want to notify the mailbox owner.|  
> |**Attachments**| |
> |Maximum file size for attachments|Default: 5 MB (5120 KB). Maximum file size (in Kilobytes). Increase or decrease the maximum file size for attached files. The maximum size is 128 MB (131,072 KB).|
> |**Synchronization methods**|For any mailbox that is automatically created in [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)] when a user or queue is created, the default email settings as defined in this section will be applied.|  
> |The selected settings will be applied to mailboxes of all newly created users and queues | |
> |Server profile|For server-side synchronization, select the email server profile that you want to use. The email server profile holds the configuration data that enables [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)] to connect to [!INCLUDE[pn_Microsoft_Exchange](../includes/pn-microsoft-exchange.md)]. If you’re connecting model-driven apps in Dynamics 365 with [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)], the email server profile is automatically created for you.|  
> |Incoming email|Select whether you want to use [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)], the Email Router, server-side synchronization, or a forward mailbox for processing incoming email. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create forward mailboxes or edit mailboxes](create-forward-mailboxes-edit-mailboxes.md)|  
> |Outgoing email|Select whether you want to use [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)], the Email Router, or server-side synchronization for processing outgoing email.|  
> |Appointments, contacts, and tasks|Select whether you want to use [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] or server-side synchronization to synchronize appointments, contacts, and tasks between [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] and [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)]. **Note:**  You can’t synchronize appointments, contacts, and tasks if you’re synchronizing with a [!INCLUDE[pn_POP3_short](../includes/pn-pop3-short.md)] email server.|  
> |**Email form options**||  
> |Use secure frames to restrict email message content|Default: Off. If this is set to **On**, you may see the following error message when you’re reading email: “This content cannot be displayed in a frame”. Although this can make sending sensitive content in email less secure, changing the setting to **Off** typically eliminates this error.|  
> |People can send emails with unresolved recipients|Default: Off. Set this to **On** if you want to send email messages that have unresolved recipients.|  
> |If there are multiple possible recipient matches in the to, CC, or BCC fields, set them as unresolved|Default: Off. Use this setting to choose which record an email address resolves to when there are multiple possible matches in **to**, **cc**, or **bcc** fields of an email. When you select **On**, if the **to**, **cc**, or **bcc** fields of an email have an email address that can be resolved to multiple contacts (or other records), the email address will be resolved in the unresolved mode instead of resolving to all possible records. Unresolved email addresses can then be resolved individually as you encounter them.|  
> |When someone manually resolves an unresolved email address, apply it to all similar unresolved addresses|When set to **Yes**, the same email address is applied to all similar unresolved email addresses when resolved in one email activity.  When set to **Off**, the email address is applied only to the specific email activity and does not resolve similar addresses present in other email activities. The default value is **On**. <br /><br />This setting is configurable when **Set To, cc, bcc, fields as unresolved values is multiple matches are found in Incoming Emails** is set to **On**.|
> | **Additional app-specific settings**   |   |
> | Enhanced email for Timeline  | The enhanced email experience allows users to compose an email without leaving the record they're working on. This setting is available with environments that have customer engagement apps in Dynamics 365, such as Dynamics 365 Sales or Dynamics 365 Customer Service.   |

  
### See also  
 [Track Outlook email by moving it to a tracked Exchange folder](track-outlook-email-by-moving-it-tracked-exchange-folder.md)   
 [Frequently asked questions about synchronizing records between model-driven apps in Dynamics 365 and Outlook](frequently-asked-questions-synchronizing-records-dynamics-365-and-outlook.md)   
 [Set up email through server-side synchronization](set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md)   
