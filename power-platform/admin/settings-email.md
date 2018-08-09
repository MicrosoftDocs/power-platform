---
title: "Manage email settings | MicrosoftDocs"
description: View and manage email settings for Common Data Service for Apps.
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
---
# Manage email settings

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Use Email settings to adjust how Dynamics 365 (online) features appear and function.

These settings can be found in the Business Application Platform Admin center by going to **Environments** > [select an environment] > **Settings** > **Email settings**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the business closures.

**Check your security role**

- Follow the steps in [View your user profile](https://docs.microsoft.com/dynamics365/customer-engagement/basics/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

|Settings|Description|  
|--------------|-----------------|  
|**Security and permissions**| Select these check boxes if you want to allow email processing only for users and queues whose email addresses have been approved by the system administrator.|
|**Process emails only for approved users**|Default: On.|
|**Process emails only for approved queues**|Default: On.|
|**Allow sync to CRM emails that have information rights management (IRM) set**|Default: Not selected. Off.|
|**Allow to delete appointments if system auto detects changes that will result in change in ownership**|Default: Not selected. Off.| 
|**Notifications**||
|**Select the alerts to send to Microsoft Dynamics 365 users.**||
|**Error**|Default: Enabled.|
|**Warning**|Default: Enabled. **Tip:**  Select **Warning** if you’re troubleshooting or testing or want to get more detailed messages on the alert wall.|
|**Information**|Default: Enabled.|
|**Notify mailbox owner**|Default: Off. By default, the system administrator is notified of any error that occurs for an email server profile.<br /><br /> Select this check box if you also want to notify the mailbox owner.|  
|**Attachments**| |
|**Maximum file size (in kilobytes)**|Default: 5 MB (5120 KB). Maximum file size (in Kilobytes)|Increase or decrease the maximum file size for attached files. The maximum size is 128 MB (131,072 KB).|
|**Synchronization methods**|For any mailbox that is automatically created in [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)] when a user or queue is created, the default email settings as defined in this section will be applied.|  
|**Server Profile**|For server-side synchronization, select the email server profile that you want to use. The email server profile holds the configuration data that enables [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)] to connect to [!INCLUDE[pn_Microsoft_Exchange](../includes/pn-microsoft-exchange.md)]. If you’re connecting [!INCLUDE[pn_crm_online_shortest](../includes/pn-crm-online-shortest.md)] with [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)], the email server profile is automatically created for you.|  
|**Incoming Email**|Select whether you want to use [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)], the Email Router, server-side synchronization, or a forward mailbox for processing incoming email. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Create forward mailboxes or edit mailboxes](https://docs.microsoft.com/dynamics365/customer-engagement/admin/create-forward-mailboxes-edit-mailboxes)|  
|**Outgoing Email**|Select whether you want to use [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)], the Email Router, or server-side synchronization for processing outgoing email.|  
|**Appointments, Contacts, and Tasks**|Select whether you want to use [!INCLUDE[pn_crm_for_outlook_short](../includes/pn-crm-for-outlook-short.md)] or server-side synchronization to synchronize appointments, contacts, and tasks between [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] and [!INCLUDE[pn_crm_shortest](../includes/pn-crm-shortest.md)]. **Note:**  You can’t synchronize appointments, contacts, and tasks if you’re synchronizing with a [!INCLUDE[pn_POP3_short](../includes/pn-pop3-short.md)] email server.|  
|**Email form options**||  
|**Use secure frames to restrict email message content**|If this is set to **Yes**, you may see the following error message when you’re reading email: “This content cannot be displayed in a frame”. Although this can make sending sensitive content in email less secure, changing the setting to **No** typically eliminates this error.|  
|**Allow messages with unresolved recipients to be sent**|Set this to **Yes** if you want to send email messages that have unresolved recipients.|  
|**Set To, cc, bcc, fields as unresolved values if multiple matches are found in Incoming Emails.**|Use this setting to choose which record an email address resolves to when there are multiple possible matches in **to**, **cc**, or **bcc** fields of an email. When you select **Yes**, if the **to**, **cc**, or **bcc** fields of an email have an email address that can be resolved to multiple contacts (or other records), the email address will be resolved in the unresolved mode instead of resolving to all possible records. Unresolved email addresses can then be resolved individually as you encounter them. The default value is **No**.|  
|**Apply same email address to all unresolved matches when you manually resolve it for one.**|When set to **Yes**, the same email address is applied to all similar unresolved email addresses when resolved in one email activity.  When set to **No**, the email address is applied only to the specific email activity and does not resolve similar addresses present in other email activities. The default value is **Yes**. <br /><br />This setting appears when **Set To, cc, bcc, fields as unresolved values is multiple matches are found in Incoming Emails** is set to **Yes**.|

  
### See also  
 [Track Outlook email by moving it to a tracked Exchange folder](https://docs.microsoft.com/dynamics365/customer-engagement/admin/track-outlook-email-by-moving-it-tracked-exchange-folder)   
 [Frequently asked questions about synchronizing records between Microsoft Dynamics 365 and Outlook](https://docs.microsoft.com/dynamics365/customer-engagement/admin/frequently-asked-questions-synchronizing-records-dynamics-365-and-outlook)   
 [Set up email through server-side synchronization](set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md)   
