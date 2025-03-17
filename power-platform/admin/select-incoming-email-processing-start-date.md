---
title: Select the start date for processing incoming email
description: Provides tips for selecting the incoming email processing start date.
author: rahulmital
ms.component: pa-admin
ms.topic: overview
ms.date: 06/07/2024
ms.subservice: admin
ms.author: rahulmital 
ms.reviewer: sericks
search.audienceType: 
  - admin
---
# Select the start date for processing incoming email

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

When you test and enable a mailbox that is configured for processing incoming email from the mailbox form, you're prompted to select a start date to process email from.

:::image type="content" source="media/start-date-incoming-email.png" alt-text="Set the start date for processing incoming email.":::

## ProcessEmailReceivedAfter column
The selected date and time set the **ProcessEmailReceivedAfter** column on the mailbox. This column determines the starting position for synchronizing emails that were received after the supplied date within the remote mailbox once the test and enable process completes.

> [!TIP]
> -	This functionality is available on the **Test and Enable** window when launched directly from the **Mailbox** form. It's not available when the window is launched from the **Mailbox** grid.
> -	The date and time provided must be greater than the **Process Email From** date on the mailbox’s associated Email Server Profile.
> -	Server-side synchronization evaluates all emails for synchronization within your root Inbox folder that were received after the date specified. This means that emails that were previously synchronized and then deleted are re-evaluated for synchronization. This also applies to the Sent Items folder if [AutoTrackSentFolderItems](/power-platform/admin/track-sent-folder-items) is activated. For [Folder-Based Tracking](/power-platform/admin/configure-outlook-exchange-folder-level-tracking) folders, emails that have been modified after the specified date are synchronized.

## Implications of using past dates
Setting a past date may create a large backlog of emails to process, which may delay the synchronization of recent emails. The processing time of emails can also be impacted by the number of synchronous customizations that are executed during the email creation process in Dataverse. Learn more: [Server-side synchronization frequency](server-side-synchronization.md#server-side-synchronization-frequency).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
