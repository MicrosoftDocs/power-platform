---
title: Select the incoming email processing start date
description: Provides tips for selecting the incoming email processing start date.
author: rahulmital
ms.component: pa-admin
ms.topic: overview
ms.date: 06/07/2024
ms.subservice: admin
ms.author: rahulmital 
search.audienceType: 
  - admin
---
# Select the incoming email processing start date

When you Test and Enable a mailbox that is configured for Incoming Email processing from the mailbox form, you will be prompted to select a start date to process email from:

![Select the incoming email processing start date](media/process-email-from.png)

The selected date and time will set the ProcessEmailReceivedAfter column on the mailbox. This column will determine the starting position for synchronizing emails which were received after the supplied date within the remote mailbox once the Test and Enable process completes.

> [!TIP]
> 
> -	This functionality is available on the Test and Enable dialog when launched directly from the mailbox form. It is not available when the dialog is launched from the Mailbox grid.
> -	The date and time provided must be greater than the Process Email From date on the mailbox’s associated Email Server Profile.
> -	Server-side synchronization will evaluate all emails for synchronization within your root Inbox folder which were received after the date specified. This means that emails that were previously synchronized and then deleted will be re-evaluated for synchronization. This will also apply to the Sent Items folder if [AutoTrackSentFolderItems](/power-platform/admin/track-sent-folder-items) is enabled. For [Folder-Based Tracking](/power-platform/admin/configure-outlook-exchange-folder-level-tracking) folders, emails that have been modified after the specified date will be synchronized.

**Important Bubble**

Setting a past date may create a large backlog of emails to process which may delay the synchronization of recent emails. The processing time of emails can also be impacted by the number of synchronous customizations that are executed during the email creation process in Dataverse. You can read more about server-side synchronization frequency [here](/power-platform/admin/server-side-synchronization#server-side-synchronization-frequency).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
