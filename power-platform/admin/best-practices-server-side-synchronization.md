---
title: "Best practices for server-side synchronization  | MicrosoftDocs"
description: Best practices for server-side synchronization
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

Consider the best practices outlined in this topic, when plan and deploy server-side synchronization.  
 
## Configure server-side synchronization for customer engagement apps and Exchange Online  

 By default, the [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] email server profile is created for customer engagement apps (such as [Dynamics 365 Sales](/dynamics365/sales-professional/help-hub), [Dynamics 365 Customer Service](/dynamics365/customer-service/help-hub), [Dynamics 365 Marketing](/dynamics365/marketing/help-hub), [Dynamics 365 Field Service](/dynamics365/field-service/overview), and [Dynamics 365 Project Service Automation](/dynamics365/project-operations/psa/overview)), and should be your first choice. If you want to use your own profile, you use customer engagement apps, and [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)], and both services are on the same tenant, use the following settings in your email server profile (**Settings** > **Email Configuration** > **Email Server Profiles**).  
  
|Settings|Recommendation|  
|--------------|--------------------|  
|Name|Provide name for new Email server profile |  
|**Advanced Settings** ||  
|Process Emails from|Specify date and time you want new Email Server profile to process emails from. |  
 
  
<a name="BKMK_OneAccount"></a>   
## If you want to use one set of credentials to process emails with Outlook or Exchange  
 Using one account to process email to all mailboxes is easier to maintain but requires using an account that has access to all mailboxes in [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] or [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]. The account must have impersonation rights on [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]. If that single account is compromised, all mailboxes using that account are compromised. Exchange impersonation scope can be configured to limit which mailboxes an account can impersonate. For more information, see [Configure impersonation](/exchange/client-developer/exchange-web-services/how-to-configure-impersonation).
 
 Use the following settings in your email server profile (**Settings** > **Email Configuration** > **Email Server Profiles**) to use a single account for email processing.  
  
|Settings|Recommendation|  
|--------------|--------------------|  
|**Incoming Connection**||  
|Authenticate Using|Credentials Specified in Email Server Profile.|  
|User Name|The user name that has impersonation rights on Exchange.|  
|Password|The password of the user name above.|  
|Use Impersonation|Yes|  
|Use same settings for Outgoing|Yes|  
|**Advanced Settings**||  
| Process Emails from | Specify date and time you want new Email Server profile to process emails from.|  

Delegation (Use Impersonation = No) is not supported for syncing Appointments, Contacts, and Tasks.  
  
<a name="BKMK_EachUser"></a>   
## If you want to use individual credentials to process emails with Outlook or Exchange  
 An alternative to a single account to process emails is using individual accounts. This method requires more maintenance effort but does not focus security on a single account. If you want each user account to synchronize with [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] or [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] and you're not using the [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] email server profile, use the following settings (**Settings** > **Email Configuration** > **Email Server Profiles**).  
  
|Settings|Recommendation|  
|--------------|--------------------|  
|**Incoming Connection**||  
|Authenticate Using|Credentials Specified by a User or Queue|  
|Use Impersonation|No|  
|Use same settings for Outgoing|Yes|  
|**Advanced Settings**||  
|Process Emails from|Specify date and time you want new Email Server profile to process emails from. |  

 Set the following in each user mailbox.  
  
|Settings|Recommendation|  
|--------------|--------------------|  
|**Credentials**||  
|Allow to Use Credentials for Email Processing|Yes|  
|User Name|The user name for the mailbox|  
|Password|The password for the mailbox|  

> ![NOTE]
> - Using individual credentials to process emails will accumulate against the number of *MaximumConcurrentConnections*. This method is generally recommended for situations there is a small number of mailboxes. 
> - Using individual credentials or one set of credentials is subject to password expiration policies. Passwords need to be updated on mailbox or email server profile when a password is changed.
> - The **process email from date** on the email server profile applies to all mailboxes associated with the email server profile. If there’s a need for a different **process email from date** on a subset of mailboxes, it's recommendated to use a separate email server profile or set the **Process Email Received After** column on mailbox to a desired date. 
  
### See also  
[Server-side synchronization](../admin/server-side-synchronization.md) 
[Troubleshooting server-side synchronization](../admin/troubleshooting-monitoring-server-side-synchronization.md)   


[!INCLUDE[footer-include](../includes/footer-banner.md)]
