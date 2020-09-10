---
title: "Set incoming and outgoing email synchronization | MicrosoftDocs"
description: Set incoming and outgoing email synchronization
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
# Set incoming and outgoing email synchronization 

You have several options for synchronizing email messages with customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation). Use the following information to deploy the best option for your company.  
  
## Set the synchronization method  
 You can set the default synchronization method applied to all newly created user mailboxes:  
  
1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Email settings**.  
  
You can set the synchronization method for individual mailboxes:  

1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Mailboxes**, and then select a mailbox.
  
For information on picking a synchronization method, see [Integrate your email system](../admin/integrate-synchronize-your-email-system.md).  
  
## Incoming email messaging options  
 The available incoming email configurations that you can use when a user or a queue receives email messages are as follows:  
  
- **None**. Use this option for users or queues that do not use customer engagement apps to track received email messages.  
  
- **Dynamics 365 for Outlook**. This option is available for users and requires that [!INCLUDE[pn_MS_Outlook_Full](../includes/pn-ms-outlook-full.md)] be installed on the user's computer. This option does not require the Email Router component and is not available for queues.  
  
- **Server-Side Synchronization or Email Router**. When you select this option, the server-side synchronization or Email Router will process email messages directly from the user's or queue's inbox, without using a forward or a sink mailbox. Although this option does not require a sink mailbox, it does make troubleshooting server-side synchronization or Email Router issues more complex for larger user bases (10 or more users) because each incoming email message is processed by the server-side synchronization or Email Router in every user's mailbox instead of in a single dedicated mailbox.  
  
- **Forward Mailbox**. To use this option, you must install the Email Router. This option requires a *sink* mailbox, which is a dedicated mailbox that collects email messages transferred from each user's mailbox by a server-side rule. Although this option does not require users to run [!INCLUDE[pn_Outlook_short](../includes/pn-outlook-short.md)], it does require that the rule be deployed for each user. You use the Rule Deployment Wizard to deploy rules to each user mailbox.  
  
## Outgoing email messaging options  
 The available outgoing email configurations that you can use when users or queues send email messages are as follows:  
  
- **None**. Use this option for users or queues that do not use customer engagement apps to send email messages.  
  
- **Dynamics 365 for Outlook**. This option is available for users and requires that [!INCLUDE[pn_MS_Outlook_Full](../includes/pn-ms-outlook-full.md)] be installed on the user's computer. This option does not require the Email Router component and is not available for queues.  
  
- **Server-Side Synchronization or Email Router**. This option delivers email messages by using the server-side synchronization or Email Router component. The email system must be [!INCLUDE[pn_SMTP](../includes/pn-smtp.md)]-compliant. The server-side synchronization or Email Router can be installed on the [!INCLUDE[pn_SMTP](../includes/pn-smtp.md)] server or on a different computer that has a connection to the [!INCLUDE[pn_SMTP](../includes/pn-smtp.md)] server.  
  
### See also  
 [Forward mailbox vs. individual mailboxes](../admin/forward-mailbox-vs-individual-mailboxes.md)
