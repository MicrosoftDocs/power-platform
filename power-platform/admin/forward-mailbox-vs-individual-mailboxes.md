---
title: "Forward mailbox vs. individual mailboxes   | MicrosoftDocs"
description: Forward mailbox vs. individual mailboxes 
author: jimholtz
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/29/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Forward mailbox vs. individual mailboxes 

Although individual mailboxes are recommended on new setup, you can still use a forward mailbox to poll one or more mailboxes for incoming email messages, and then determine what actions customer engagement apps (Dynamics 365 Sales, Dynamics 365 Customer Service, Dynamics 365 Field Service, Dynamics 365 Marketing, and Dynamics 365 Project Service Automation), will take based on the email message, such as create or update records in the system. You can configure server-side synchronization or the Email Router to monitor either of the following:  
  
- A mailbox for each user or queue (recommended).
- A forward mailbox. This is a single, central mailbox.
  
## Important considerations

Forward mailbox functionality in Server-Side Synchronization was initially made available in previous versions of Dynamics 365 to ease customer migration from the E-mail Router to Server-Side Synchronization if the pre-existing environment was previously setup to use forward mailbox functionality.

However, using forward mailboxes as a long term solution is no longer recommended due to the following reasons:

-	**Performance**: Forward Mailboxes are designed to process all e-mails for multiple mailboxes in your organization. When Server Side Sync processes a forward mailbox, all of the received emails that have arrived in the forward mailbox since the last synchronization cycle are processed by a single backend server node. As a result, each synchronization cycle may take longer to complete, which can delay the rate at which emails are delivered into the system. 
When using individual mailboxes, each mailbox is evenly distributed across multiple backend servers and threads, which achieves much higher scalability and ensures that each mailbox can be processed in a more timely fashion.

-	**Throttling limits**: Email service throttling limits, such as those imposed by Exchange or POP services, are more likely to be hit. Throttling limits are defined at the mailbox level. Since a forward mailbox handles email for multiple mailboxes, this requires a higher load of traffic on the email service to synchronize emails from all forwarding parties, which may subject the forward mailbox to throttling.
When using individual mailboxes, throttling limits are much less likely to be encountered as throttling limits are enforced on a per mailbox basis. 

-	**Fault tolerance**: Since forward mailboxes were designed to synchronize emails for multiple users or queues, this can potentially introduce a single point of failure should the mailbox experience connectivity or runtime errors. As a result, these errors may potentially block or significantly delay incoming email message synchronization for multiple users or queues. Business critical support queues or other high priority Dynamics 365 mailboxes should not be configured for Forward Mailbox for this reason.
When using individual mailboxes, each mailbox is processed independently. As a result, any connectivity or runtime errors will only affect the specific mailbox. 

For the above reasons, forward mailboxes are supported, but not recommended, and should be avoided for new setup. Customers that have an existing Forward Mailbox configuration are encouraged to migrate to individual mailboxes to have the best and most reliable email synchronization experience.

> [!IMPORTANT]
> - To use a forward mailbox with a deployment that interfaces with a POP3-compliant email system, the email system must be able to forward email messages as attachments.  
> - For POP3 e-mail servers and Exchange Online, you cannot use the Rule Deployment Wizard. Instead, you must create the rules manually.  
  
 You can configure users and queues in different ways within the same deployment. For example, you may want to configure some user or queue mailboxes to be monitored directly on one email server, and configure others to use a forward mailbox on a different email server.  
  
## Monitor a forward mailbox  
 When you use forward mailbox monitoring, incoming email messages are processed by [!INCLUDE[pn_Exchange_Server_full](../includes/pn-exchange-server-full.md)] or the [!INCLUDE[pn_POP3_short](../includes/pn-pop3-short.md)] server and customer engagement apps in the following sequence:  
  
1. An email message is received by a user or queue mailbox, on either the [!INCLUDE[pn_Exchange_Server_short](../includes/pn-exchange-server-short.md)] or the [!INCLUDE[pn_POP3_short](../includes/pn-pop3-short.md)] server.  
  
2. A rule in the user's mailbox sends a copy of the message, as an attachment, to the forward mailbox.  
  
3. Customer engagement apps (by using server-side synchronization or Email Router) retrieve the message from the forward mailbox and creates the appropriate records.  
  
### See also  
