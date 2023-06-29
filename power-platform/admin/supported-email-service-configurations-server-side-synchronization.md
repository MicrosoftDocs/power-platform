---
title: "Email service configurations supported by server-side synchronization"
description: "Learn about the email service configurations supported by server-side synchronization when using customer engagement apps and Microsoft Power Platform."
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/23/2022
author: gattimassimo 
ms.subservice: admin
ms.author: magatti
ms.reviewer: jimholtz
search.audienceType: 
  - admin
---
# Supported email service configurations for server-side synchronization

Depending on your customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), installation, you may be deciding whether to use server-side synchronization or the Email Router/[!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] synchronization. This following table lists what is supported by server-side synchronization for each type of installation. Later in this topic, you can read about the scenarios that aren't supported by server-side synchronization.  
  
> [!IMPORTANT]
> - The information here includes the POP3/SMTP and IMAP/SMTP systems supported by [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)]. Although other POP3/SMTP and IMAP/SMTP systems might work with Customer Engagement (on-premises), those systems were not tested by [!INCLUDE[cc_Microsoft](../includes/cc-microsoft.md)] and are not supported.  
> - [!INCLUDE[pn-outlook-short](../includes/pn-outlook-short.md)] on the web is not supported in a hybrid deployment: Customer Engagement (on-premises) with [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)].  
> - You can create two different email server profiles: one for online mailboxes, and another for on-premises mailboxes. Associate the mailboxes with the correct email server profile.  
> - Manual tracking in [!INCLUDE[proc_crm_for_outlook](../includes/proc-crm-for-outlook.md)] is not supported when a user's mailbox is configured to use server-side synchronization with the POP/SMTP protocol.  
> - For [!INCLUDE[pn_crm_8_1_0_online](../includes/pn-crm-8-1-0-online.md)] and [!INCLUDE[pn_crm_8_2_0_online](../includes/pn-crm-8-2-0-online.md)], we support [service encryption](/microsoft-365/compliance/encryption) in [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)] with server-side sync.  
  

| Customer engagement apps deployment |  Email system  | Email synchronization | Appointments, contacts, and tasks synchronization |  Protocol  
|---------|------|----------|-----------|------------|  
| Customer engagement apps   |- [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)]<br />- [!INCLUDE[pn_Exchange_Server_2013_short](../includes/pn-exchange-server-2013-short.md)] SP1<br />- Exchange Server 2016<br />-Exchange Server 2019|  Yes |  Yes  | [!INCLUDE[pn_Exchange_Web_Services](../includes/pn-exchange-web-services.md)] | 
| Customer engagement apps |  - Gmail<br />- Yahoo! Mail | Yes  |  No  |         POP3/SMTP <br />IMAP/SMTP | 
  
## Using Exchange Online with customer engagement apps 
 If your company is using [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)] with customer engagement apps, note the following:  
  
 Customer engagement apps support server-side synchronization with [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)] in the same tenant in [!INCLUDE[pn_Office_365](../includes/pn-office-365.md)] with Server to Server Authentication. Other authentication methods or settings are not recommended or supported, including:  
  
- Using credentials specified by a user or queue  
- Using credentials specified in an email server profile  
- Using Impersonation  
- Setting Auto Discover Server Location to No  
- Using an email server profile other than Exchange Online  

## Connecting customer engagement apps with Exchange Online in a different tenant (limited support)

Customers can connect to a Microsoft Exchange online deployment hosted in a different tenant. For more information, see [Exchange Online cross-tenant authentication](connect-exchange-online-server-profile-oauth.md).

> [!NOTE]
> The following limitations apply to connecting cross-tenant:
> - Dynamics 365 App for Outlook is currently not supported.
> - Approval of Dynamics 365 mailbox records must be performed by a Global tenant admin or an Exchange admin of the primary tenant. 

## Unsupported email service configurations  
 Server-side synchronization doesn't support the following scenarios:  
  
- Packet inspection, transformation and manipulation of network traffic sent to Exchange from Dynamics 365
- Network traffic interception not based on source IP address or server name (interception based on contents of a packet is not supported)
- Mix of [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]/SMTP and POP3/[!INCLUDE[pn_Exchange](../includes/pn-exchange.md)]  
- Exchange Online profile mailbox with Exchange on-premises user. Use the Exchange Server (Hybrid) profile, associate the mailbox to it, then test and enable
- Exchange Online profile mailbox with an Exchange mailbox that points to an external email server. Use the POP3/SMTP Server profile, associate the mailbox to it, then test and enable.
- Creation of mass email marketing campaigns
- Extensibility scenarios like extending EWS/POP3/SMTP protocols and creating custom email providers  
- [!INCLUDE[pn_ms_Exchange_Server_2010_short](../includes/pn-ms-exchange-server-2010-short.md)] SP3
- [!INCLUDE[pn_ms_Exchange_Server_2003_short](../includes/pn-ms-exchange-server-2003-short.md)] and [!INCLUDE[pn_ms_Exchange_Server_2007_short](../includes/pn-ms-exchange-server-2007-short.md)]  
- Server-side synchronization in customer engagement apps requires a [!INCLUDE[pn_POP3_short](../includes/pn-pop3-short.md)]/SMTP email server that is also FIPS 140-2 compliant. Some email servers are not FIPS 140-2 compliant, such as MSN, Outlook.com, or Windows Live Mail
- Multi-factor authentication isn't supported for customer engagement apps to Exchange Server (on-premises), and Customer Engagement (on-premises) to Exchange Online
 
  
> [!NOTE]
> We recommend that you don't use a mixed configuration of [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] synchronization and server-side synchronization for appointments, contacts, and tasks in the same organization, because it may result in updated data not synchronizing to all attendees.  
  
### See also  
 [Server-side synchronization](server-side-synchronization.md)   
 [Set up server-side synchronization of email, appointments, contacts, and tasks](set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
