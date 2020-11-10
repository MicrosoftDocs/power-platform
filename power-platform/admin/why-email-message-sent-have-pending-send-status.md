---
title: "Why does the email message I sent have a Pending Send status? | MicrosoftDocs"
description: Why does the email message I sent have a Pending Send status? 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/11/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Why does the email message I sent have a "Pending Send" status?

[!INCLUDE [cc-data-platform-banner](../includes/cc-data-platform-banner.md)]

If you create an email message in customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), and click the **Send** button, the message will not be sent unless email integration has been correctly configured and enabled for sending email from customer engagement apps.  If the status of the email appears as "Pending Send" and is not sent, contact your administrator. [!INCLUDE[proc_more_information](../includes/proc-more-information.md)] [Find your administrator or support person](https://docs.microsoft.com/powerapps/user/find-admin)  
  
 If you are the administrator, verify that the user who sent the email is enabled for sending email. To do this:  
  
1. In the Power Platform admin center, select an environment. 

2. Select **Settings** > **Email** > **Mailboxes**.  
  
3. Change the view to **Active Mailboxes.**  
  
4. Select the mailbox record for the user who sent the email, and then click the **Edit** button.  
  
5. Verify the user is correctly configured and enabled for sending email:  
  
   - If the user's mailbox record is configured to use server-side synchronization for outgoing email, verify the user's email address is approved and is also tested and enabled.  For more information about configuring server-side synchronization, see [set up server-side synchronization of email, appointments, contacts, and tasks](../admin/set-up-server-side-synchronization-of-email-appointments-contacts-and-tasks.md).  
  
### See also  
 [Integrate your email system](../admin/integrate-synchronize-your-email-system.md)
