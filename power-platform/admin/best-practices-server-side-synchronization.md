---
title: "Best practices for server-side synchronization  | MicrosoftDocs"
description: Consider the best practices outlined in this topic when you plan and deploy server-side synchronization.
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/28/2021
author: revachauhan
ms.subservice: admin
ms.author: rechauha
ms.reviewer: mkaur
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Best practices for server-side synchronization 
<!--note from editor: As I noted (and still regret!), I was wrong to say the title and H1 have to be different, but the description does need to be a complete sentence and ideally will contain a "call to action."-->
Consider the best practices outlined in this topic when you plan and deploy server-side synchronization.

>[!NOTE]
>To make the settings described in the following sections, go to  **Settings** > **Email Configuration** > **Email Server Profiles**.
<!--note from editor: Suggested. Every time I ran across this step in the rest of the article, I looked for what was different. I think it's less confusing to just say it once.-->
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
|Use Impersonation|Yes<br>Note that setting Use Impersonation to No (delegation) isn't supported for syncing appointments, contacts, and tasks.<!--note from editor: Edit okay? I don't understand why this was at the end of this section. Actually I'm not sure why it's being mentioned at all - will the reader understand its significance?-->|  
|Use same settings for Outgoing|Yes|  
|**Advanced Settings**| |  
| Process Emails from | Specify the date and time from which you want the new email server profile to process emails.|  

<!--note from editor: I moved this up to the table.
Delegation (Use Impersonation = No) is not supported for syncing Appointments, Contacts, and Tasks.
-->
  
<a name="BKMK_EachUser"></a>   
## If you want to use individual credentials to process emails with Outlook or Exchange

An alternative to using a single account to process emails is using individual accounts. This method requires more maintenance effort, but avoids focusing security<!--note from editor: Suggested.--> on a single account. If you want each user account to synchronize with [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] or [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] and you're not using the [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] email server profile, make the following settings in the email server profile.  
  
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
<!--note from editor: I added this heading because it looks like the following notes apply to more than just the BKMK_EachUser section. I'm not sure this is the best name, though.-->

- Using individual credentials to process emails will accumulate against the number of *MaximumConcurrentConnections*. This method is generally recommended for a small number of mailboxes. 
- Using individual credentials or one set of credentials is subject to password expiration policies. Passwords need to be updated on the mailbox or email server profile when a password is changed.
- The **Process Emails from** date on the email server profile applies to all mailboxes associated with that profile. If you need to set a different **Process Emails from** date on a subset of mailboxes, we recommend that you use a separate email server profile or set the **Process Email Received After** column on the mailbox to the date you want. 
  
### See also

[Server-side synchronization](../admin/server-side-synchronization.md)  
[Troubleshooting server-side synchronization](../admin/troubleshooting-monitoring-server-side-synchronization.md)   


[!INCLUDE[footer-include](../includes/footer-banner.md)]
