---
title: "Defulat OrgDBOrgSettings  | MicrosoftDocs"
description: This topic covers the default options available in OrgDBOrgSettings.
author: mduelae
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/13/2021
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
# D365 Org DB Settings 

This topic covers the default value of OrgDBOrgSettings. For information on how to edit these settings, see [Environment database settings](environment-database-settings.md).

| Name | Default value | Description |
|-------------------------|-------------------------|-------------------------|
| AutoCreateContactOnPromote | true | Disables the automatic creation of contacts or leads for unresolved senders on promote of email for all the users in the organization. |
| SSSUpdatePastMeetingsInNonDraftMode | false | Allows updates for past meetings in Dynamics to propagate to Exchange when critical properties have changed (start, end, subject, body, attendees, location). <br>**Note**: Enabling this setting may lead to meeting requests being sent out for past meetings. |
| DoNotIgnoreInternalEmailToQueues | true | If "Track emails sent between CRM users as two activities" is disabled in the system settings, this setting allows emails sent from a user to a queue to be synchronized into Dynamics if the queue's incoming email delivery settings would otherwise accept the email. |
| CreateQueueItemForSynchronizingMailbox | false | Allows queue items to be created for a synchronizing mailbox when the recipient is not present in the To: or Cc: fields. <br> For more information: [Create queue items from synchronized email messages](create-queue-items-from-synchronized-email-messages.md) |
| UsePlainTextForEmailTemplateBody | false | Changes the Email Template to use plain text where otherwise text with the following symbols would not appear: &lt;text&gt;. |
| EmailTemplateRetrieveFallbackContact | false | When referencing a contact on a lead or opportunity in an email template, use fallback logic to pick up a fallback contact (primarycontactid/parentcontactId) in case the referenced contact is empty. |
| ResolveForInactiveEntities | false | When enabled, email addresses for inactive entities are ignored for email address resolution. <br> **Note**: This setting does not apply to disabled system users which are always excluded. |
| AllowSaveAsDraftAppointment | false | Setting value to true will provide the capability to create appointments in Dynamics 365 as "draft" without synchronizing with Exchange. Appointment form will have a "Save as Draft" command and a "Send" command, so that you can save, add details and update an appointment activity without synchronizing to Exchange. Default value is set to false to preserve existing behavior. |
| AutoTrackSentFolderItems | false | When enabled, Server Side Sync will auto track emails from the Sent Items folder using the user or queue's incoming email filtering method. Default value is set to False to preserve the existing behavior. |
| RestrictIRMEmailItems | false | When enabled, Server Side Sync will not synchronize any emails that are restricted by IRM. Default value is set to False to preserve the existing behavior. |
| DoNotAutoTrackEmail | true | When enabled, allows the "No Email Messages" option to appear in the user or queue incoming email filtering method options. |
| TrackCategorizedItems | true | Allows users to manually track items using Categories. Linked items will also appear with the category applied as a visual indicator of the item's track status.</br> **Note**: Disabling this feature will remove the category from Outlook and related functionality. |
| IgnoreConversationIndexAndInReplyToForCorrelation | false | Ignore Email ConversationIndex and InReplyTo fields when performing email correlation. |
| UseXAnchorMailboxInExchangeRequestHeader | true | Allows Server Side Sync to specify the XAnchorMailbox Header when connecting to Exchange. Disabling this setting is not recommended. |
| MaximumSubjectLengthOnMailServer | 255 | Defines the maximum length when generating and appending a tracking token to the subject of an email. If the length of the tracking token is less than this value, the subject will be truncated if the concatenated value (subject + tracking token) should exceed the limit. However, if the tracking token exceeds this value by itself, then the system will truncate the subject to fit within the specified value and drop the tracking token. |
| UseFilteringMethodOfSyncingMailboxOnlyForCorrelation | false | When disabled, the filtering method of all Dynamics recipients are evaluated to determine if any user or queue accepts an email when performing correlation during automatic incoming email processing. When enabled, the system will only consider the incoming email filtering method of the user or queue that is currently processing the email. In this case, the incoming email filtering method of other Dynamics recipients are ignored. |
| SSSPropagateAppointmentCancellationsToExchange | false | When enabled, canceled appointments in Dynamics will propagate to the Exchange organizer's mailbox as a delete. This will result in a cancellation message if the appointment has attendees and is scheduled in the future. |
| TrackAppointmentsFromNonOrganizer | true | When enabled, allows non-organizer recipients to track Appointments into Dynamics from Exchange. |
| IgnoreInternalEmailDetectionEnhancement | true | If "Track emails sent between CRM users as two activities" is disabled in the system settings, enabling this enhancement will allow emails sent from Dynamics users to be considered for correlation if the same email with the opposite direction code (sent/received) does not exist in Dynamics. Disabling this enhancement will fall back to legacy behavior where the email may be rejected based on the DoNotIgnoreInternalEmailToQueues setting. |
| IgnoreCopiedItemsInSSSForMailbox | true | When enabled, Server Side Synchronization will not synchronize copied, linked items from Exchange as inserts into Dynamics. |
| EnableSssItemLevelMonitoring | true | When enabled, allows the Server-Side Synchronization Failures dashboard to be visible for users and administrators. [Click here](https://support.microsoft.com/en-us/topic/troubleshoot-item-level-server-side-synchronization-issues-with-dynamics-365-15f7508e-61f5-6969-3cdd-dc4145783d69) for more information on how to use the dashboard to troubleshoot synchronization failures. <br> **Note**: Use the ExchangeSyncIdMappingPersistenceTimeInDays setting to control how long the data for failed emails is retained. |
| ExchangeSyncIdMappingPersistenceTimeInDays | 3 | The number of days for which the ExchangeSyncIdMappings are to be persisted for failed emails. It is not recommended to increase this value higher than 7 days as this can result in a large number of records being stored in the database. <br> **Note** This setting is used in relation to the EnableSssItemLevelMonitoring setting. |
| DistinctPhysicalAndLogicalDeletesForExchangeSync | false | When enabled, Server Side Sync will distinguish between physical and logical deletes when processing sync record deletions from Dynamics to Exchange. If a record is determined to be logically deleted, the item will be unlinked in Exchange where it may otherwise be deleted. When the setting is disabled, both logical and physical deletes will be propagated to Exchange according to their default sync behavior which may include deletion.</br>Physical Delete: A physical delete occurs when the record is physically deleted from Dynamics.</br>Logical Delete: A logical delete occurs when a user loses access to the record or the record is no longer being retrieved by the user's synchronization filter. |
| UseCrmOrganizerForEmptyExchangeOrganizer | false | When enabled, if the Exchange appointment organizer is not associated with an email address, this setting will allow Server Side Sync to use the existing Dynamics organizer information to populate the organizer field when processing updates from Exchange to Dynamics. |
| CreateQueueItemsForAcceptingQueueRecipients | true | When enabled, the system will create a queue item for each resolved queue recipient during incoming email processing. If AutoRouteToOwnerQueue is enabled for the email table, the system additionally creates a queue item in the email owner's default queue. The default value is true. |
| SSSCreateAdditionalQueueItemsForAlreadyTrackedEmail | false | When enabled, server-side synchronization will create a queue item for the synchronizing queue if an email has already been created by server-side synchronization and the queue item does not exist in the synchronizing queue. The default value is false. |
| SSSSaveOutgoingEmailToExchangeSentFolder | true | When enabled, emails sent from Dynamics will be saved to the sent items folder in Exchange for the sending mailbox. |

