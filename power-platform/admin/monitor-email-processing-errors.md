---
title: "Monitor email processing errors  | MicrosoftDocs"
description: Monitor email processing errors
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/30/2017
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Monitor email processing errors

[!INCLUDE [cc-settings-moving](../includes/cc-settings-moving.md)] 

[!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps generate alerts if errors occur while email is being processed. An error can be classified based on the nature of the error and on whether the error is for an email, a mailbox, or an email server profile.  

 The following table lists the distinction between permanent and transient errors.  

|Permanent Errors|Transient Errors|  
|----------------------|----------------------|  
|These are of permanent nature and can occur when the transient errors aren’t fixed after a few attempts.|These are of temporary nature and may get fixed automatically after a few attempts.|  
|When these errors occur, email processing for the affected mailboxes is stopped. These require a corrective action by the mailbox owner or a Dynamics 365 for Customer Engagement administrator.|These errors don’t necessarily require a corrective action by a Dynamics 365 apps user, but we recommend that you look at these.|  
|The administrators and users are alerted on their alert walls to take action and start email processing.|The administrators and users are notified on the alerts wall about these errors but no action is required for these errors.|  

 The following table will help you distinguish between email-level, mailbox-level, and email server profile-level errors and whether a corrective action is needed.  

|Email-level errors|Mailbox-level errors|Email server profile-level errors|  
|-------------------------|---------------------------|----------------------------------------|  
|These are errors specific to an email message.|These are error specific to a mailbox.|These errors may occur for one or more mailboxes.|  
|These don’t have impact on the processing of other email.|The owner of the mailbox is notified on the alerts wall and the owner is required to take a corrective action.|The owner of the associated email server profile is notified on the alerts wall and the owner is required to take a corrective action.|  
|The alerts for these are displayed in the alerts section of the email form.|The alert is also displayed in the respective mailbox form.|The owners of the mailbox that are affected are also notified on the alerts wall but no action is required by them.|  

## View alerts  
 The alerts are shown on the Alerts wall or the Alerts section in the mailbox or email server profile records. The following table shows how to view the alerts and the actions you can take on these alerts.  


|                       To                        |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         Do this                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|-------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                 View all alerts                 | [!INCLUDE[proc_sales_alerts](../includes/proc-sales-alerts.md)]<br /><br /> -   To delete all alerts at once, click or tap the Delete all alerts icon on the alerts wall.<br />-   To view just errors, warnings, or information, click or tap **Errors**, **Warnings**, or **Information** respectively.<br /><br /> If you are also synchronizing appointments, contacts, and tasks through server-side synchronization, you’ll see alerts for the following:<br /><br /> -   When one or more duplicate records are found in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps when saving a record from [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] to [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps.<br />-   When a scheduling conflict is found when saving an appointment from [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] to [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps because a mailbox is unavailable at the time.<br />-   When previously linked items are found for a specific mailbox.<br /><br /> You’ll be prompted to take actions on the errors about the appointment, contacts, and tasks synchronization. |
|         View alerts specific to mailbox         |                                                                                                                                                                                                                                                                                                                                                                                                                                                                              1. [!INCLUDE[proc_settings_email_config](../includes/proc-settings-email-config.md)]<br />2.  Click **Mailboxes**.<br />3.  Open a mailbox record, and on the left navigation bar, under **Common**, click or tap **Alerts**.                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| View alerts specific to an email server profile |                                                                                                                                                                                                                                                                                                                                                                                                                                                                 1. [!INCLUDE[proc_settings_email_config](../includes/proc-settings-email-config.md)]<br />2.  Click **Email Server Profiles**.<br />3.  Open an email server profile record, and on the left navigation bar, under **Common**, click or tap **Alerts**.                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

> [!NOTE]
>  If you don’t wish to get alerts, you can disable them from the [System Settings dialog box – Email tab](/dynamics365/customer-engagement/admin/system-settings-dialog-box-email-tab.md) by clearing the check boxes for alerts.  

### See also  
