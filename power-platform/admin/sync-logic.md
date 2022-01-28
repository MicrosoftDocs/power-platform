---
title: Synchronization logic for appointments, contacts, and tasks | Microsoft Docs
description: Synchronization logic for appointments, contacts, and tasks.
author: mduelae
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/28/2021
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

# Synchronization logic for appointments, contacts, and tasks 

This topic covers how synchronization works with appointments, contacts, and tasks. 

Appointment, task, and contact sync bilaterally using server-side synchronization. Each table has specific behaviors during synchronization. The sync behavior also depends on the sync direction, which can be from Dynamics 365 to Microsoft Exchange or from Exchange to Dynamics 365.

## Sync configuration requirments

Not all appointments, tasks, or contacts created or updated in Dynamics 365 with Exchange is going to automatically sync with Exchange and Dynamics 365. Specific conditions need to be met for synchronization to take place. The corresponding mailbox record in Dynamics 365 need to meet these requirements:

- The user mailbox that is approved. Note, queue mailboxes do not support appointment, contact, or task sync.

- Enabled for appointment, contacts, and tasks sync.

   > [!div class="mx-imgBorder"]
   > ![Mailbox page screenshot](media/image1.png)

- The mailbox is successfully tested and enabled.

### Sync requirments from Dynamics 365 to Exchange

Synchronization filters determine which rows will be synchronized from customer engagement apps to Exchange using server-side synchronization.

Only the rows that match the criteria specified in the sync filters are eligible for processing with server-side sync. For more information see, [Choose the records to synchronize between customer engagement apps and Exchange](choose-records-synchronize-dynamics-365-outlook-exchange.md).

Once an item is synced with Exchange, the link between the two items is established. With sync take place, it's always synced bidirectionally. Changes on any of the two systems will be propagated.

### Sync requirments from Exchange to Dynamics 365


If a mailbox is on Exchange using Outlook on the Web or Outlook on the desktopis and configured with server-side sync items such as appointment, contact, or task items won't sync to Dynamics 365 automatically. For sync to take place, these requirement need to be met:

- The item has been created using App for Outlook.

- The item is tracked to Dynamics 365 using App for Outlook.

- The **Tracked to Dynamics 365** category has been applied from Outlook on the Web, Outlook desktop, or your email client.

When these requirments are met, the item is selected by server-side sync for processing and server-side sync will attempt to create the item in Dynamics and then establish a link. Once a link is established, a bidirectional sync is always performed. Changes on any of the two systems will be propagated.

For more information about Outlook tracking and category tracking, see:

- [Link and track an email or appointment to a specific row in your app](/dynamics365/outlook-app/user/track-message-or-appointment)

- [Track an email or appointment without linking it to a specific row](/dynamics365/outlook-app/user/track-without-set-regarding)

- [Use Outlook category to track appointments and emails](use-outlook-category-track-appointments-emails.md)

## Appointment - sync from Dynamics 365 to Exchange

Synchronization for an appointment from Dynamics 365 to Exchanges works as follows:

- Mapping: Appointment rows in Dynamics 365 are synchronized to Exchange as meetings.

- Appointment status and reminder: When the appointment status in Dynamics 365 is **Completed**, **Canceled**, or **Free** the appointment is synced to Exchange as **Free** and no reminder set. When creating an appointment, if the appointment is more than 7 days in the past the reminder won't be set.

- Appointment invitations: When the appointment is created in Dynamics 365 and synced with Exchange, invitations won't be sent if the **scheduledStart** is in the past or there's no attendees.

When the appointment is updated in Dynamics 365 and synced with Exchange, invitations won't be sent when the **scheduledStart** is in the past or the user syncing the appointment is not the appointment organizer, the appointment doesn't have attendees, or none of the sensitive properties\* have changed.

\**Sensitive properties are those properties which Exchange will trigger an invite as they are relevant for all the parties involved in the meeting: Subject, Body, Location, IsAllDayEvent, ScheduledStart, ScheduledEnd, RequiredAttendees, OptionalAttendees, Organizer, AppointmentStatus, PriorityCode, RecurrencePattern.*


### Cancelled and deleted appointments 

An appointment cancellation is sent to the attendees by Exchange only when the appointment gets physically deleted in the organizer's mailbox. If the appointment is deleted only in Dynamics 365, then a cancellation isn't sent in the following scenarios:

 - When the scheduled start is in the past.
 - The user syncing the appointment is not the appointment organizer.
 - The appointment doesn't have attendees. 

By default, appointments that are cancelled in Dynamics 365 won't propagate to Exchange as cancellation. This behavior can be changed with the *SSSPropagateAppointmentCancellationsToExchange* [orgsDbOrgSetting](orgdborgsettings.md). When this is enabled, cancelling an appointment in Dynamics 365 will cancel the meeting on Exchange which will send appointment cancellation to the attendees.

When a appointment is deleted in Dynamics and synced with Exchange the appointment is deleted on Exchange only if all these conditions are met:

- The appointment is linked, the syncing user is the appointment organizer.
- The appointment is in the future.
- the appointment hasn't been logically deleted (see advanced topics).

If these conditions are not met, the appointment will still exist on Exchange, but it will appear unlinked.

When tracking a recurring meeting, Dynamics 365 will not send new invites to the attendees, if all occurrences of that series still exist in Outlook and Exchange and no attendees have been added or deleted. If the organizer has deleted historical instances of the series, when it is tracked to Dynamics 365, it will see those as missing from Exchange and will recreate those instances. In that scenario, attendees would get a new invitation.

### Appointment organizer

Appointment organizer is a key field for appointment synchronization and it drives different synchronization behaviors. When creating appointments using customizations, make sure that the appointment organizer is correctly populated. The organizer field is not exposed on the appointment form by default but can be added to forms, views, or advanced find queries as needed to confirm the value is populated as expected.

### Sync from Exchange to Dynamics 365

- Mapping: Meetings in Exchange will be synchronized to Dynamics 365 as Appointments.
- Appointment Free/Busy information: When an appointment Free/Busy information is set to Free on Exchange and this is synced to Dynamics 365. If the appointment is in Completed or Cancelled state on Dynamics 365, the status will be set to Completed. When the state is Open in Dynamics 365 the status will be changed to Free. Working elsewhere Free/Busy status will sync to Dynamics 365 as state Open and status Free.
- Appointment booking and conflict management: When an appointment is tracked to Dynamics 365, server-side sync will still leverage booking API to ensure the parties are available at the specified time. Such as if another appointment is already in the organizer's calendar in Dynamics 365 at the same time, the booking won't succeed. When the appointment booking doesn't succeed the appointment won't be synced, however the user can [address the scheduling conflict](https://support.microsoft.com/topic/a-scheduling-conflict-was-found-when-saving-appointment-appointment-subject-from-exchange-to-microsoft-dynamics-365-because-user-is-unavailable-at-this-time-fc18bc49-f77a-1ca3-c3c8-3b85d2776525) in their mailbox alert wall, select to ignore the specific conflict and let the appointment sync. Booking from Dynamics 365 mail app will automatically suppress the scheduling conflict. For more information, see [A scheduling conflict was found when saving appointment [appointment subject] from Exchange to Microsoft Dynamics 365](/dynamics-365/sales/scheduling-conflict-saving-appointment.md)
- Appointment deletion: When deleting a tracked appointment in Exchange, during sync the appointment deletion won't propagate to Dynamics 365 if the state is Completed or Cancelled, or if **scheduledStart** time is in the past, or if the syncing user is not the appointment organizer. This applies to **exceptionAppointments** as well. An exception appointment represents an specific instance within a recurring appointment series which has been individually modified.

When deleting a recurring appointment in Exchange, during sync, the deletion won't propagate to Dynamics 365 if the state is **Completed** or **Cancelled**, or if the syncing user is not the appointment organizer.

## Service appointments - sync from Dynamics 365 to Exchange

- Mapping: Service appointment records in Dynamics 365 will be synchronized to Exchange as Meetings.

- Invites and cancellations: Invites and cancellations are never sent for service appointments.

- Copies: When sync happens, each user gets their own copy of **serviceAppointment** in their mailboxes. There is no central organizer for service appointments in this case.

## Contacts - Sync from Dynamics 365 to Exchange

- Mapping: Contact records in Dynamics 365 will be synchronized to Exchange as Contacts.

- Address synchronization: For more information, see [Address synchronization for Contacts](/dynamics365/outlook-addin/admin-guide/configure-synchronization-appointments-contacts-tasks#address-synchronization-for-contacts).

-   Contact deletion: The contact will only be deleted on Exchange if the syncing user is not the original contact record owner.

## Tasks - Sync from Dynamics 365 to Exchange

- Mapping: Faxes, letters, phone calls and tasks records in Dynamics 365 will be synchronized to Exchange as Tasks.

- Reminder: If the task **dueDate** is greater than a day ago and the task stateCode in Dynamics 365 is Open or Scheduled, the reminder will be set during sync.

- Due date: The task **scheduledEnd** on Dynamics will be synced as task due date on Exchange.

- Task status: When **percentcomplete** is not specified, a task in open status will be synced as not started and a task in Completed or Canceled state will sync as completed on Exchange.

- Complete date: **actualEnd** will be synced as task complete date on Exchange

- Task deletion: Task delete in Dynamics will be propagated to Exchange only for tasks which are not in the Completed status on Exchange.

- Task autocompletion: When a task is completed in Dynamics the **actualEnd** field will be populated. If this task is syncing to Exchange using server-side synchronization, if the **actualEnd** field is populated and it is in the past, the task will be automatically completed. When using customizations to reactivate a task the **actualEnd** date should also be cleared to avoid autocompletion when server-side Sync is syncing this task.

### Sync from Exchange to Dynamics 365

- Mapping: Tasks in Exchange will be synchronized to Dynamics 365 as tasks.

- Task status: When a task not started in Exchange gets synced to Dynamics 365 the task will be synced as **Not Started**.

- Task actual start: When a task create is synced to Dynamics 365, the **actualStart** will be set to current timestamp.

- Task deletion: Task deletion on Exchange will also delete the task in Dynamics 365. This applies to all tables which synchronize as task to Exchange task tables such as fax, letter, phone call, or task.


## Distinct physical and logical deletion

When an item doesn't match the [sync filters](choose-records-synchronize-dynamics-365-outlook-exchange.md) anymore, server-side sync will propagate a delete operation to Microsoft Exchange. This applies to all tables.

There are two scenarios where an item doesn't meet sync filters:

- Physical delete: The row doesn't exist in Dynamics 365 anymore.

- Logical delete: Access to the row has been lost (the row still exists in Dynamics 365 but the user associated to the mailbox lost access to it or the row is not matching sync filters anymore.

By default, both these scenarios will propagate a delete operation to Microsoft Exchange.

To change this behavior and ignore logical deletes, turn on [orgdborgsetting](OrgDbOrgSettings.md) *DistinctPhysicalAndLogicalDeletesForExchangeSync*.

For more information on sync filters, see:

- [Choose the records to synchronize between customer engagement apps and Exchange](choose-records-synchronize-dynamics-365-outlook-exchange.md)

- [Set up default sync filters for multiple users for appointments, contacts, or tasks](configure-default-sync-filters.md)

## Ignore copied items

When a linked item is copied on the Exchange side, by default server-side sync will ignore the copy action to avoid duplicate information in Dynamics 365. This applies to all tables.

If you want bring in duplicate items in Dynamics 365, then you need to disable [orgdborgsetting](OrgDbOrgSettings.md) *IgnoreCopiedItemsInSSSForMailbox*. This setting is **On** by default. For mor information, see [OrgDbOrgSettings documentation](OrgDbOrgSettings.md).


## Enable appointment attachment synchronization with Outlook or Exchange

This section applies to message synchronization done through Microsoft Dynamics 365 for Outlook or server-side synchronization. More information: [Integrate your email system](/integrate-synchronize-your-email-system.md) 
  
Users can attach documents, pictures, recordings, etc. to the appointments they create in the Dynamics 365 apps or Dynamics 365 App for Outlook. By default, appointment attachment synchronization is disabled. Follow these step to enable it:
  
1. Go to **Settings** > **Administration**.
  
2. Choose **System Settings**, then choose **Synchronization**.  
  
3. Choose **Synchronize appointment attachments with Outlook or Exchange**  
  
   **Considerations**.  
  
   - When you disable attachment synchronization, the attachments will not appear in appointments in Dynamics 365 apps but will remain in Dynamics 365 for Outlook appointments.  
   - Recurring appointment attachment synchronization is not supported. When users synchronize recurring appointments with attachments, the attachments do not sync.  
  
   - Attachments could affect sync times so you may want to use attachments sparingly if your using to a low bandwidth network.  
  
   - Service activity attachment synchronization is not supported.  

## Address synchronization for Contacts  
  
This section applies to message synchronization done through Dynamics 365 for Outlook or server-side synchronization. More information: [Integrate your email system](integrate-synchronize-your-email-system.md)

 Admins have two options they can specify for how contact synchronization occurs.

 **Synchronize mailing address only in Outlook contact**
By default, just one Outlook mailing address field is synchronized between Customer Engagement and Outlook. This is sufficient for most organizations.

 **Synchronize all three addresses (Business, Home, Other) in Outlook contact**

Choose this option to synchronize all three Outlook mailing address fields (Business, Home, and Other fields) between Customer Engagement and Outlook.

> [!WARNING]
>  Enabling this option can cause data loss if you have existing data. This is due to the remapping of the attributes for existing tracked contacts. We recommend you test this option prior to deployment to understand how the re-mapping affects your environment and your data. In most cases, you should have the full data in one side (normally in Customer Engagement) and have them sync to the other side (normally Outlook or Exchange).  
> 
>  More information: [Which fields can be synchronized between Dynamics 365 apps and Outlook?](/dynamics365/outlook-addin/admin-guide/which-fields-synchronized.md)
  
## Enable synchronization for tasks that are assigned in Outlook  
  
This section applies to message synchronization done through Dynamics 365 for Outlook only. More information: [Integrate your email system](integrate-synchronize-your-email-system.md)

By default, task synchronization is disabled. User created tasks in Dynamics 365 for Outlook are not synchronized with the Customer Engagement web application. To enable:

1.  Go to **Settings** > **Administration**.

2. Choose **System Settings**, then choose **Synchronization**.

3. Choose **Synchronize tasks that are assigned in Outlook**

   **Considerations**.

   - Recurring task synchronization is not supported. When users synchronize recurring tasks, the tasks do not synch.

   - The person assigning the task and the person the task is assigned to must be in the same organization.

   - Tasks cannot be synchronized to multiple email addresses.


