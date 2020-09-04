---
title: "Best practices for server-side synchronization  | MicrosoftDocs"
description: Best practices for server-side synchronization
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/04/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Best practices for server-side synchronization 

<!-- legacy procedure -->

Consider the following when planning and deploying server-side synchronization.  
  
## Best practices for configuring server-side synchronization  
  
<a name="BKMK_CRMEXOnline"></a>   

### If you use customer engagement apps and Exchange Online  
 By default, the [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] email server profile is created for customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), and should be your first choice. If you want to use your own profile, you use customer engagement apps, and [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)], and both services are on the same tenant, use the following settings in your email server profile (**Settings** > **Email Configuration** > **Email Server Profiles**).  
  
|Settings|Recommendation|  
|--------------|--------------------|  
|Auto Discover Server Location|Yes|  
|**Incoming Connection**||  
|Authenticate Using|Server to Server Authentication|  
|Use Impersonation|No|  
|Use same settings for Outgoing|Yes|  
  
<a name="BKMK_OneAccount"></a>   
### If you want to use one set of credentials to process emails with Outlook or Exchange  
 Using one account to process email to all mailboxes is easier to maintain but requires using an account that has access to all mailboxes in [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] or [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]. The account must have impersonation rights on [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]. If that single account is compromised, all mailboxes using that account are compromised. Use the following settings in your email server profile (**Settings** > **Email Configuration** > **Email Server Profiles** to use a single account for email processing.  
  
|Settings|Recommendation|  
|--------------|--------------------|  
|**Incoming Connection**||  
|Authenticate Using|Credentials Specified in Email Server Profile|  
|User Name|The administrator's user name|  
|Password|The administrator's password|  
|Use Impersonation|Yes|  
|Use same settings for Outgoing|Yes|  
  
 Delegation (Use Impersonation = No) is not supported for syncing Appointments, Contacts, and Tasks.  
  
<a name="BKMK_EachUser"></a>   
### If you want to use individual credentials to process emails with Outlook or Exchange  
 An alternative to a single account to process emails is using individual accounts. This method requires more maintenance effort but does not focus security on a single account. If you want each user account to synchronize with [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] or [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] and you're not using the [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] email server profile, use the following settings (**Settings** > **Email Configuration** > **Email Server Profiles**).  
  
|Settings|Recommendation|  
|--------------|--------------------|  
|**Incoming Connection**||  
|Authenticate Using|Credentials Specified by a User or Queue|  
|Use Impersonation|No|  
|Use same settings for Outgoing|Yes|  
  
 Set the following in each user mailbox.  
  
|Settings|Recommendation|  
|--------------|--------------------|  
|**Credentials**||  
|Allow to Use Credentials for Email Processing|Yes|  
|User Name|The user name for the mailbox|  
|Password|The password for the mailbox|  
  
### See also  
[Server-side synchronization](../admin/server-side-synchronization.md) 
[Troubleshooting server-side synchronization](../admin/troubleshooting-monitoring-server-side-synchronization.md)   
