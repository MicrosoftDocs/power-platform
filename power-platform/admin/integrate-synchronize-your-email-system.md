---
title: "Integrate (synchronize) your email system  | MicrosoftDocs"
description: Integrate (synchronize) your email system
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/08/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Integrate (synchronize) your email system

One of the main reasons people use customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), is to store all customer communications in one place, so anyone with the appropriate permissions can see all relevant customer records. For example, view all email associated with a particular contact, account, opportunity, or case.  
  
 To store email and other messaging records, you need to synchronize your email system with customer engagement apps. You can do this with server-side synchronization. 
   
  
> [!IMPORTANT]
> - In previous versions of Dynamics CRM, you could also use the Email Router to synchronize records. The Email Router has been deprecated as of the Dynamics 365 (online), version 9.0. We strongly recommend that you migrate all email routing functionality to use  server-side synchronization. 
> - Internet Message Access Protocol (IMAP) email servers are not currently supported by server-side synchronization or the Email Router.
> - Effective March 2020, the legacy Dynamics 365 for Outlook (also referred to as Outlook COM add-in) is deprecated. Customers must transition to the modern [Dynamics 365 App for Outlook](https://docs.microsoft.com/dynamics365/outlook-app/overview) before October 1, 2020. Microsoft will continue to provide support, security and other critical updates to the Outlook COM Add-in until October 1, 2020.
> 
> For further information and steps to make a smooth transition, download [Dynamics 365 for Outlook (COM add-in) Playbook](https://aka.ms/OutlookCOMPlaybook).
  
<a name="ServerSideSync"></a>  
 
## Using server-side synchronization  

 Server-side synchronization has these benefits:  
  
- **Enables [!INCLUDE[pn_ms_dyn_crm_app_for_outlook](../includes/pn-ms-dyn-crm-app-for-outlook.md)]**. With [!INCLUDE[pn_crm_app_for_outlook_short](../includes/pn-crm-app-for-outlook-short.md)], customer engagement apps information appears next to a user's [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] email messages or appointments. They can view information about contacts and leads stored in customer engagement apps and add contacts directly from an email message. They can also link email, appointment, and contact records to new or existing records, such as opportunity, account, or case records. [!INCLUDE[pn_crm_app_for_outlook_short](../includes/pn-crm-app-for-outlook-short.md)] is very simple to deploy and it works with [!INCLUDE[pn-outlook-short](../includes/pn-outlook-short.md)] on the web (included in [!INCLUDE[pn_MS_Office_365](../includes/pn-ms-office-365.md)])  the [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] desktop client, and [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] mobile. [Learn more about Dynamics 365 App for Outlook](https://docs.microsoft.com/dynamics365/outlook-app/overview).  
  
- **Enables [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] folder tracking**. With folder tracking, users can simply drag email to an [!INCLUDE[pn_Exchange](../includes/pn-exchange.md)] folder to track it automatically in customer engagement apps. Folder tracking works on any mobile device that supports [!INCLUDE[pn_Microsoft_Exchange](../includes/pn-microsoft-exchange.md)], which means users can track email from just about any device. [Learn more about folder tracking](track-outlook-email-by-moving-it-tracked-exchange-folder.md).  
  
- **Automatic synchronization**. When you synchronize records with server-side synchronization, the synchronization happens automatically at the server level.  
  
- **Enables multiple scenarios, including hybrid scenarios**. You can use server-side synchronization to connect:  
  
  - Customer engagement apps to [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)]  
  
  - Customer engagement apps to [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)] (on-premises)  
  
- **Synchronize appointments, contacts, and tasks**. In addition to email, you can synchronize [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] appointments, contacts, and tasks.  
  
- **Synchronize with [!INCLUDE[pn_POP3_short](../includes/pn-pop3-short.md)] email servers**. You can use server-side synchronization to synchronize customer engagement apps with Gmail, [!INCLUDE[pn_outlook_com](../includes/pn-outlook-com.md)], Yahoo, and other [!INCLUDE[pn_POP3_short](../includes/pn-pop3-short.md)] email servers. Note, however, that you can't synchronize appointments, contacts, and tasks with [!INCLUDE[pn_POP3_short](../includes/pn-pop3-short.md)] email servers.  
  
- **Integrated mailbox management and resource utilization**. You can use the server-side synchronization performance dashboard to quickly monitor mailbox performance across the organization. You can also troubleshoot errors through error logging and reporting.  
  
[!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Integrate your email system using server-side synchronization](../admin/set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md)  
  
> [!NOTE]
> If you use server-side sync, you won't be able to view S/MIME encrypted messages. Encrypting emails with S/MIME requires an application to use an S/MIME control which server-side sync does not support. For more information on S/MIME encryption, see [Encrypt messages by using S/MIME in Outlook Web App](https://support.office.com/article/Encrypt-messages-by-using-S-MIME-in-Outlook-Web-App-2E57E4BD-4CC2-4531-9A39-426E7C873E26). 
  
 
### See also  
 [Microsoft Dynamics CRM: How it works documentation ](https://www.microsoft.com/download/details.aspx?id=48718) 
 [Integrate your email system using server-side synchronization](../admin/set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md)   
 [Troubleshooting and monitoring server-side synchronization issues](../admin/troubleshooting-monitoring-server-side-synchronization.md)   
 [Deploy Dynamics 365 App for Outlook](https://docs.microsoft.com/dynamics365/outlook-app/deploy-dynamics-365-app-for-outlook)   

 
 
 
 
