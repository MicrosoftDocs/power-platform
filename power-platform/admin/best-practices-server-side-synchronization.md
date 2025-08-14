---
title: Best practices for server-side synchronization
description: Consider the best practices outlined in this topic when you plan and deploy server-side synchronization.
ms.component: pa-admin
ms.topic: best-practice
ms.date: 01/14/2025
author: rahulmital
ms.subservice: admin
ms.author: rahulmital
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Best practices for server-side synchronization

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

Consider the best practices outlined in this topic when you plan and deploy server-side synchronization.

> [!NOTE]
> To make the settings described in the following sections, go to  **Settings** > **Email Configuration** > **Email Server Profiles**.

## Configure server-side synchronization for customer engagement apps and Exchange Online  

By default, the [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] email server profile is created for customer engagement apps (such as [Dynamics 365 Sales](/dynamics365/sales-professional/help-hub), [Dynamics 365 Customer Service](/dynamics365/customer-service/help-hub), [Dynamics 365 Marketing](/dynamics365/marketing/help-hub), [Dynamics 365 Field Service](/dynamics365/field-service/overview), and [Dynamics 365 Project Service Automation](/dynamics365/project-operations/psa/overview)), and should be your first choice. If you want to use your own profile, and you use customer engagement apps and [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)]&mdash;and both services are located on the same tenant&mdash;use the following settings in your email server profile.

|Settings|Recommendation|  
|--------------|--------------------|  
|Name|Enter a name for the new email server profile |  
|**Advanced Settings** ||  
|Process Emails from|Specify the date and time from which you want the new email server profile to process emails. |  

<a name="BKMK_OneAccount"></a>   
## If you want to use one set of credentials to process emails with Outlook or Exchange

Using one account to process email to all mailboxes is easier to maintain, but requires using an account that has access to all mailboxes in [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] or [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]. The account must have impersonation rights on [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]. If that single account is compromised, all mailboxes using that account will be compromised. You can configure the Exchange impersonation scope to limit which mailboxes an account can impersonate. More information: [Configure impersonation](/exchange/client-developer/exchange-web-services/how-to-configure-impersonation)

|Settings|Recommendation|  
|--------------|--------------------|  
|**Incoming Connection**||  
|Authenticate Using|Credentials Specified in Email Server Profile|  
|User Name|The username that has impersonation rights on Exchange|  
|Password|The password of the username.|  
|Use Impersonation|Yes<br>Note that setting Use Impersonation to No (delegation) isn't supported for syncing appointments, contacts, and tasks.|  
|Use same settings for Outgoing|Yes|  
|**Advanced Settings**| |  
| Process Emails from | Specify the date and time from which you want the new email server profile to process emails.|  

<a name="BKMK_EachUser"></a>   
## If you want to use individual credentials to process emails with Outlook or Exchange

An alternative to using a single account to process emails is using individual accounts. This method requires more maintenance effort, but avoids focusing security on a single account. If you want each user account to synchronize with [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] or [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] and you're not using the [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] email server profile, make the following settings in the email server profile.  
  
|Settings|Recommendation|  
|--------------|--------------------|  
|**Incoming Connection**||  
|Authenticate Using|Credentials Specified by a User or Queue|  
|Use Impersonation|No|  
|Use same settings for Outgoing|Yes|  
|**Advanced Settings**||  
|Process Emails from|Specify the date and time from which you want the new email server profile to process emails. |  

Make the following settings for each user mailbox.  
  
|Credentials|Recommended settings|  
|--------------|--------------------|  
|Allow to Use Credentials for Email Processing|Yes|  
|User Name|The username for the mailbox|  
|Password|The password for the mailbox|  

## Considerations

- Using individual credentials to process emails will accumulate against the number of *MaximumConcurrentConnections*. This method is generally recommended for a small number of mailboxes. 
- Using individual credentials or one set of credentials is subject to password expiration policies. Passwords need to be updated on the mailbox or email server profile when a password is changed.
- The **Process Emails from** date on the email server profile applies to all mailboxes associated with that profile. If you need to set a different **Process Emails from** date on a subset of mailboxes, we recommend that you use a separate email server profile or set the **Process Email Received After** column on the mailbox to the date you want. 

> [!NOTE]
> When a mailbox is synchronized for the first time, server-side synchronization will use the Process Emails From date on the email server profile to determine how far back emails should be synchronized relative to the Received On date for the emails in the Exchange mailbox. The last email processed in any synchronization cycle will be used to set the Process Emails From date on the mailbox record. Subsequent synchronization cycles will then reference the Process Emails From date on the mailbox to control how far back server side synchronization will search for emails. 
>
> There may be times when you need to set the Process Emails From date on the mailbox table to a previous date in order to reprocess emails. One such example may be to account for emails which were synchronized but then accidentally deleted from Dynamics 365. Another example is if an email wasn't within the Inbox folder when the mailbox was processed. Moving the email back into the Inbox folder after it was already processed won't result in that email being processed because the Process Emails From date on the mailbox would likely be later than the Received On date of the email. In this case, the Process Emails From attribute can be added to the Mailbox form and updated to a value to reflect the time period from which you need to reprocess emails.
>
> Note that server-side synchronization will always utilize the greater value between the Process Emails From date on the email server profile and the mailbox record.

## Manage Exchange mailbox synchronization with multiple Dataverse instances

A single Exchange mailbox (email address) can only synchronize with a single Dataverse mailbox row in a single Dataverse instance. When you Test and Enable a mailbox row in a Dataverse instance, that instance and mailbox row link to the corresponding Exchange mailbox. From that point forward, only that Dataverse instance and mailbox row can synchronize with the Exchange mailbox. If a mailbox row in any other Dataverse instance was previously configured to use the same Exchange mailbox (email address), the row automatically turns off for synchronization in that instance.

To ensure an admin doesn’t inadvertently Test and Enable a mailbox row in a nonproduction instance linked to an Exchange mailbox, set the synchronization method for nonproduction instances to None.

### Set the synchronization method to none

To set the synchronization method to none for nonproduction environments:

1. In the Power Platform admin center, select an environment.
1. Select **Settings** > **Email** > **Mailboxes**.
1. Select a mailbox record.
1. Under **Synchronization Method**, select **None** in the **Incoming Email**, **Outgoing Email**, and **Appointments, Contacts, and Tasks** lists.

### See also

[Server-side synchronization](../admin/server-side-synchronization.md)  
[Troubleshooting server-side synchronization](../admin/troubleshooting-monitoring-server-side-synchronization.md)   


[!INCLUDE[footer-include](../includes/footer-banner.md)]
