---
title: "Default OrgDBOrgSettings server-side sync  | MicrosoftDocs"
description: This topic covers the default options available in OrgDBOrgSettings related to server-side sync.
author: mduelae
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/12/2021
ms.subservice: admin
ms.author: mkaur
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---

# OrgDBSettings for server-side sync

This topic covers the default values of OrgDBOrgSettings that are specific to server-side sync. For information about how to edit these settings, go to [Environment database settings](environment-database-settings.md).

| Name | Default value | Description |
|-------------------------|-------------------------|-------------------------|
| AutoCreateContactOnPromote | true | Disables the ability to automatically create a contact or lead row for unresolved senders on promote of email for all the users in the organization. <br> This option can also be disabled from the personal options setting for each user. More information: [Set personal options](/powerapps/user/set-personal-options#email-tab-options) |
| SSSUpdatePastMeetingsInNonDraftMode | false | Allows updates for past meetings in Dynamics 365 to be propagated to Exchange when properties such as start, end, subject, body, attendees, or location are changed. <br>**Note**: If this setting is enabled, Exchange might send out meeting requests for past meetings. |
| DoNotIgnoreInternalEmailToQueues | true | If **Track emails sent between Dynamics 365 users as two activities** is disabled in [system settings](settings-email-tracking.md), this setting allows emails sent from a user to a queue to be synchronized to Dynamics 365 if the queue's incoming email delivery settings would otherwise accept the email. |
| CreateQueueItemForSynchronizingMailbox | false | Allows queue items to be created for a synchronized mailbox when there's no recipient in the **To:** or **Cc:** field. <br> More information: [Create queue items from synchronized email messages](create-queue-items-from-synchronized-email-messages.md) |
| UsePlainTextForEmailTemplateBody | false | Changes the email template to use plain text where otherwise text with the following symbols wouldn't appear: &lt;text&gt;. |
| EmailTemplateRetrieveFallbackContact | false | When referencing a contact on a lead or opportunity in an email template, use fallback logic to pick up a fallback contact such as primarycontactid or parentcontactId when the referenced contact is empty. |
| ResolveForInactiveEntities | false | When enabled, email addresses for inactive tables are ignored for email address resolution. <br> **Note**: This setting doesn't apply to system users whose accounts have been disabled, who are always excluded. |
| AllowSaveAsDraftAppointment | false | Setting this value to true provides the capability to create appointments in Dynamics 365 as **draft** without synchronizing with Exchange. The appointment form will have a **Save as Draft** command and a **Send** command, so that you can save, add details, and update an appointment activity without synchronizing to Exchange. The default value is set to false to preserve existing behavior. |
| AutoTrackSentFolderItems | false | When enabled, server-side sync will automatically track emails from the sent items folder by using the user or queue's incoming email filtering method. The default value is set to false to preserve existing behavior. |
| RestrictIRMEmailItems | false | When enabled, server-side sync won't synchronize any emails that are marked as restricted permission in Outlook by using Information Rights Management (IRM). The default value is set to false to preserve existing behavior. |
| DoNotAutoTrackEmail | true | When enabled, allows the **No Email Messages** option to appear in the user's or queue's incoming email filtering method options. |
| TrackCategorizedItems | true | Allows users to manually track items by using categories. Linked items will also appear with the category applied as a visual indicator of the item's track status.</br> **Note**: Disabling this feature will remove the category from Outlook and related functionality. |
| IgnoreConversationIndexAndInReplyToForCorrelation | false | Ignore Email ConversationIndex and InReplyTo fields when performing email correlation. |
| UseXAnchorMailboxInExchangeRequestHeader | true | Allows server-side sync to specify the XAnchorMailbox Header when connecting to Exchange. We recommend that you not disable this setting. |
| MaximumSubjectLengthOnMailServer | 255 | Defines the maximum length when you generate and append a tracking token to the subject of an email. If the length of the tracking token is less than this value, the subject will be truncated if the concatenated value (subject + tracking token) exceeds the maximum limit. However, if the tracking token exceeds this value by itself, the system will truncate the subject to fit within the specified value and won't include the tracking token. |
| UseFilteringMethodOfSyncingMailboxOnlyForCorrelation | false | When disabled, the filtering method of all Dynamics 365 recipients is evaluated to determine whether any user or queue accepts an email when performing correlation during automatic incoming email processing. When enabled, the system will only consider the incoming email filtering method of the user or queue who is currently processing the email. In this case, the incoming email filtering method of other Dynamics 365 recipients is ignored. |
| SSSPropagateAppointmentCancellationsToExchange | false | When enabled, canceled appointments in Dynamics 365 will propagate to the Exchange organizer's mailbox as a delete. This will result in a cancellation message if the appointment has attendees and is scheduled in the future. |
| TrackAppointmentsFromNonOrganizer | true | When enabled, allows non-organizer recipients to track appointments into Dynamics 365 from Exchange. |
| IgnoreInternalEmailDetectionEnhancement | true | If **Track emails sent between Dynamics 365 users as two activities** is disabled in [system settings](settings-email-tracking.md), enabling this option allows emails sent from Dynamics 365 users to be considered for correlation if the same email with the opposite direction code (sent/received) doesn't exist in Dynamics 365. Disabling this enhancement will fall back to legacy behavior where the email may be rejected based on the DoNotIgnoreInternalEmailToQueues setting. |
| IgnoreCopiedItemsInSSSForMailbox | true | When enabled, server-side sync won't synchronize copied, linked items from Exchange as inserts into Dynamics 365. |
| EnableSssItemLevelMonitoring | true | When enabled, allows the server-side sync failures dashboard to be visible for users and administrators. <br> For more information about how to use the dashboard to troubleshoot synchronization failures, go to [Troubleshoot item level Server-Side Synchronization issues with Dynamics 365](https://support.microsoft.com/topic/troubleshoot-item-level-server-side-synchronization-issues-with-dynamics-365-15f7508e-61f5-6969-3cdd-dc4145783d69). <br> **Note**: Use the ExchangeSyncIdMappingPersistenceTimeInDays setting to control how long the data for failed emails is retained. |
| ExchangeSyncIdMappingPersistenceTimeInDays | 3 | The number of days for which the ExchangeSyncIdMappings are to be persisted for failed emails. We recommend that the value not exceed 7 days, because this can result in a large number of rows being stored in the database. <br> **Note** This setting is used in relation to the EnableSssItemLevelMonitoring setting. |
| DistinctPhysicalAndLogicalDeletesForExchangeSync | false | When enabled, server-side sync will distinguish between physical and logical deletes when processing sync row deletions from Dynamics 365 to Exchange. If a row is determined to be logically deleted, the item will be unlinked in Exchange where it might otherwise be deleted. When the setting is disabled, both logical and physical deletes are propagated to Exchange according to the default sync behavior, which can include deletion. </br> *Physical delete* is when the row is physically deleted from Dynamics 365. </br> *Logical delete* is when a user loses access to the row or the row is no longer being retrieved by the user's synchronization filter. |
| UseCrmOrganizerForEmptyExchangeOrganizer | false | When enabled, if the Exchange appointment organizer isn't associated with an email address, this setting will allow server-side sync to use the existing Dynamics 365 organizer information to populate the organizer field when processing updates from Exchange to Dynamics 365. |
| CreateQueueItemsForAcceptingQueueRecipients | true | When enabled, the system will create a queue item for each resolved queue recipient during incoming email processing. If AutoRouteToOwnerQueue is enabled for the email table, the system additionally creates a queue item in the email owner's default queue. The default value is true. |
| SSSCreateAdditionalQueueItemsForAlreadyTrackedEmail | false | When enabled, server-side synchronization will create a queue item for the synchronizing queue if an email has already been created by server-side synchronization and the queue item doesn't exist in the synchronizing queue. The default value is false. |
| SSSSaveOutgoingEmailToExchangeSentFolder | true | When enabled, emails sent from Dynamics 365 will be saved to the sent items folder in Exchange for the mailbox they're sent from. |

