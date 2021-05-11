---
title: "Set up server-side synchronization of email, appointments, contacts, and tasks  | MicrosoftDocs"
description: Set up server-side synchronization of email, appointments, contacts, and tasks
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/10/2020
author: revachauhan
ms.author: rechauha
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Set up server-side synchronization of email, appointments, contacts, and tasks

You can use server-side synchronization to synchronize your email system with Microsoft Dataverse apps at the server level. Dataverse apps could be first-party apps, like Dynamics 365 (online) apps or custom apps. For example, you can synchronize Dataverse model-driven apps or customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), with Microsoft Exchange Online (hosted email server) or Microsoft Exchange Server (on-premises). If you synchronize with Exchange Online or Exchange Server, in addition to Outlook email, you can synchronize Outlook appointments, contacts, and tasks.
  
You can also use server-side synchronization to synchronize Dataverse apps with a POP3 email server for web-hosted email like Gmail or Outlook.com. If you synchronize email with a POP3 email server, you can’t synchronize appointments, contacts, and tasks, however.
  
> [!NOTE]
> Using encryption software (such as Vaultive) together with server-side synchronization is not supported.
> 
> If you use server-side sync, you won't be able to view S/MIME encrypted messages. Encrypting emails with S/MIME requires an application to use an S/MIME control which server-side sync does not support. For more information on S/MIME encryption, see [Encrypt messages by using S/MIME in Outlook Web App](https://support.office.com/article/Encrypt-messages-by-using-S-MIME-in-Outlook-Web-App-2E57E4BD-4CC2-4531-9A39-426E7C873E26). 
  
 **Synchronization scenarios**  
  
Choose one of the following scenarios to configure server-side synchronization for your organization:
  
- [Connect to Exchange Online](connect-exchange-online.md)  
  
- [Connect to Exchange Server on-premises](connect-exchange-server-on-premises.md)  
  
- [Connect to a POP3 or SMTP server](../admin/connect-to-pop3-or-smtp-servers.md)

### See also  
[Server-side synchronization](../admin/server-side-synchronization.md) 
[Troubleshooting server-side synchronization](../admin/troubleshooting-monitoring-server-side-synchronization.md)   


[!INCLUDE[footer-include](../includes/footer-banner.md)]
