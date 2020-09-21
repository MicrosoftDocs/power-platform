---
title: "Set up server-side synchronization of email, appointments, contacts, and tasks  | MicrosoftDocs"
description: Set up server-side synchronization of email, appointments, contacts, and tasks
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
# Set up server-side synchronization of email, appointments, contacts, and tasks

You can use [!INCLUDE[cc_server_side_synch](../includes/cc-server-side-synch.md)] to synchronize your email system with Dynamics 365 (online) apps at the server level. For example, you can synchronize customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), with [!INCLUDE[pn_Microsoft_Exchange_Online](../includes/pn-microsoft-exchange-online.md)] (hosted email server) or [!INCLUDE[pn_Exchange_Server_full](../includes/pn-exchange-server-full.md)] (on-premises). If you synchronize customer engagement apps with [!INCLUDE[pn_Exchange_Online](../includes/pn-exchange-online.md)] or [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)], in addition to [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] email, you can synchronize [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)] appointments, contacts, and tasks.  
  
 You can also use [!INCLUDE[cc_server_side_synch](../includes/cc-server-side-synch.md)] to synchronize customer engagement apps with a [!INCLUDE[pn_POP3_short](../includes/pn-pop3-short.md)] email server for web-hosted email like Gmail or [!INCLUDE[pn_outlook_com](../includes/pn-outlook-com.md)]. If you synchronize email with a [!INCLUDE[pn_POP3_short](../includes/pn-pop3-short.md)] email server, you can’t synchronize appointments, contacts, and tasks, however.  
  
> [!NOTE]
> Using encryption software (such as Vaultive) together with [!INCLUDE[cc_server_side_synch](../includes/cc-server-side-synch.md)] is not supported.  
> 
> If you use server-side sync, you won't be able to view S/MIME encrypted messages. Encrypting emails with S/MIME requires an application to use an S/MIME control which server-side sync does not support. For more information on S/MIME encryption, see [Encrypt messages by using S/MIME in Outlook Web App](https://support.office.com/article/Encrypt-messages-by-using-S-MIME-in-Outlook-Web-App-2E57E4BD-4CC2-4531-9A39-426E7C873E26). 
  
 **Synchronization scenarios**  
  
 Choose one of the following scenarios to configure [!INCLUDE[cc_server_side_synch](../includes/cc-server-side-synch.md)] for your organization:  
  
-   [Connect to Exchange Online](connect-exchange-online.md)  
  
-   [Connect to Exchange Server on-premises](connect-exchange-server-on-premises.md)  
  
-   [Connect to a POP3 or SMTP server](../admin/connect-to-pop3-or-smtp-servers.md)

### See also  
[Server-side synchronization](../admin/server-side-synchronization.md) 
[Troubleshooting server-side synchronization](../admin/troubleshooting-monitoring-server-side-synchronization.md)   
