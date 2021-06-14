---
title: "Create queue items from synchronized email messages | MicrosoftDocs"
description: Provides detailed information about the security model and concepts in Microsoft Dataverse.
ms.date: 02/03/2021
ms.service: power-platform
ms.topic: "article"
author: mduelae
ms.author: mkaur
ms.custom: "admin-security"
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Create queue items from synchronized email messages

There are several OrgDbOrgSetting options available to control how queue items are automatically created for synchronized email. If you are unfamiliar with OrgDbOrgSettings, see the [KB article](https://support.microsoft.com/topic/orgdborgsettings-tool-for-microsoft-dynamics-crm-20a10f46-2a24-a156-7144-365d49b842ba). Note that the following settings are applied to the entire organization.

- **CreateQueueItemForSynchronizingMailbox**
  - When enabled, the system will add the currently synchronizing queue mailbox to the list of queues for which to create a queue item. Consider enabling this option if queue mailboxes potentially receive or process email in which they are not in the recipient list, such as through distribution list memberships or as BCC recipients.  The default value is false.
- **CreateQueueItemsForAcceptingQueueRecipients**
  - When enabled, the system will create a queue item for each resolved queue recipient during incoming email processing. If **AutoRouteToOwnerQueue** is enabled for the email table, the system additionally creates a queue item in the email owner’s default queue.  The default value is true.
- **SSSCreateAdditionalQueueItemsForAlreadyTrackedEmail**
  - When enabled, server-side synchronization will create a queue item for the synchronizing queue if an email has already been created by server-side synchronization and the queue item does not exist in the synchronizing queue. The default value is false.

These settings can be mixed and matched to achieve the desired flexibility in how queue items should be automatically created by the system. For example, the system can create multiple queue items for each queue recipient on an as-needed basis using the following settings combination and flow described below:

- Set **CreateQueueItemForSynchronizingMailbox** to true.
- Set **CreateQueueItemsForAcceptingQueueRecipients** to false.
- Set **SSSCreateAdditionalQueueItemsForAlreadyTrackedEmail** to true.

1. A single email is sent from a customer to multiple queue mailboxes that are monitored by server-side synchronization.
2. An automatic rule moves the email out of the inbox folder in each queue. Therefore, these emails are not initially visible to server-side synchronization and are not processed.
3. On one of the queues, the email is moved to the inbox folder to be picked up for server-side synchronization processing. Because **CreateQueueItemForSynchronizingMailbox** is enabled and **CreateQueueItemsForAcceptingQueueRecipients** is disabled, the system only creates a queue item for the queue that processed the email.
4. Another queue mailbox opts into the queue item creation process by moving the email to the inbox. Because **SSSCreateAdditionalQueueItemsForAlreadyTrackedEmail** is true, server-side synchronization discovers the moved email but recognizes that it has already been promoted. As a result, the system will create the additional queue item for the current synchronizing queue mailbox and associate it with the existing email that was synchronized by the first queue mailbox in step 3.  Note: this action does not call the **DeliverIncoming SDK Message for Email** and instead uses the **Create SDK Message for QueueItem**.
5. Step 4 can repeat as needed as more queues ‘opt-in’ to the queue item creation process by moving the email to the inbox folder for processing.


[!INCLUDE[footer-include](../includes/footer-banner.md)]