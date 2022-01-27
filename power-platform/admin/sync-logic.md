---
title: Synchronization logic for appointments, contacts, and tasks | Microsoft Docs
description: Synchronization logic for appointments, contacts, and tasks.
author: mduelae
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/26/2021
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

This topic covers how synchronization work with appointments, contacts, and tasks. Appointment, task, and contact sync bilaterally using server-side synchronization.

Each table has specific behaviors during synchronizationnc which is covered in this topic. The sync behavior also depends on the sync direction, from Dynamics 365 to Microsoft Exchange or from Exchange to Dynamics 365.

## Sync eligibility

### Item synchronization eligibility

Not all appointments, tasks, or contacts created or updated in Dynamics 365 with Exchange will automatically be synced to Exchange with Dynamics 365.

Specific conditions need to be met or actions need to be taken for this to happen.

### Sync configuration eligibility

In order to synchronize appointments, contacts, or tasks with an Exchange mailbox, the corresponding mailbox record in Dynamics 365 needs meet the following conditions:

- A user mailbox that is approved. Note, queue mailboxes do not support appointment contact task sync.

- Enabled for appointment, contacts, and tasks sync.

![Mailbox page screenshot](media/image1.png)

- the mailbox is successfully tested and enabled.

### Sync eligibility from Dynamics 365 to Exchange

Synchronization filters determine which rows will be synchronized from customer engagement apps to Exchange (using server-side synchronization).

Only the rows which match the criteria specified in the sync filters will be eligible for processing with server-side sync. For more information see, [Choose the records to synchronize between customer engagement apps and Exchange]<choose-records-synchronize-dynamics-365-outlook-exchange.md>

Once an item is synced to Exchange, the link between the two items is established and bidirectional sync will always be performed. Changes on any of the two systems will be propagated.

### Sync eligibility from Exchange to Dynamics

Even when your mailbox is configured for server-side sync, creating an appointment, contact, or task on Exchange using Outlook on the Web or Outlook, won't cause the item to be synced to Dynamics 365 automatically unless:

-   The item has been created using App for Outlook

-   The item is tracked to Dynamics 365 using App for Outlook

-   The **Tracked to Dynamics 365** category has been applied from Outlook on the Web, Outlook desktop, or email clients

If any of these actions have been performed, the item will be selected by server-side sync for processing and server-side sync will attempt to create the item in Dynamics and establish the link.

Once the link is established, bidirectional sync will be performed from now on. Changes on any of the two systems will be propagated.

For more information about Outlook tracking and category tracking, see:

- [Link and track an email or appointment to a specific row in your app]</dynamics365/outlook-app/user/track-message-or-appointment>

- [Track an email or appointment without linking it to a specific row]</dynamics365/outlook-app/user/track-without-set-regarding>

- [Use Outlook category to track appointments and emails]<use-outlook-category-track-appointments-emails.md>

## Appointment - sync from Dynamics 365 to Exchange

Synchronization for an appointment from Dynamics 365 to Exchanges works as follows:

- Mapping: Appointment records in Dynamics 365 will be synchronized to Exchange as meetings.

- Appointment status and reminder: When the appointment status in Dynamics 365 is **Completed**, **Canceled**, or **Free** the appointment will be synced to Exchange as **Free** and no reminder set. When creating an appointment, if the appointment is more than 7 days in the past the reminder won't be set.

- Appointment invitations: When the appointment is created in Dynamics 365 and synced to Exchange, invitations won't be sent when the **scheduledStart** is in the past or no attendees are present.

When the appointment is updated in Dynamics 365 and synced to Exchange, invitations won't be sent when the **scheduledStart** is in the past or the user syncing the appointment is not the appointment organizer, the appointment doesn't have attendees, or none of the sensitive properties\* have changed.

\**Sensitive properties are those properties for which Exchange will trigger an invite as they are relevant for all the parties involved in the meeting: Subject, Body, Location, IsAllDayEvent, ScheduledStart, ScheduledEnd, RequiredAttendees, OptionalAttendees, Organizer, AppointmentStatus, PriorityCode, RecurrencePattern.*


### Appointment deletion and cancellations

An appointment cancellation will be sent to the parties by Exchange only when the appointment gets physically deleted in the organizer's mailbox.

When an appointment is deleted in Dynamics 365, cancellations won't be sent when the scheduled start is in the past or if the user syncing the appointment is not the appointment organizer, or if the appointment doesn't have attendees. By default appointments that are cancelled in Dynamics 365 won't propagate to Exchange as cancellation. This behavior can be changed with the *SSSPropagateAppointmentCancellationsToExchange* [orgsDbOrgSetting](https://docs.microsoft.com/en-us/power-platform/admin/orgdborgsettings). When this is enabled, cancelling an appointment in Dynamics 365 will cancel the meeting on Exchange which will send appointment cancellation to the attendees.

When a appointment is deleted in Dynamics and synced to Exchange the appointment will be deleted on Exchange only if all these conditions are met:

- The appointment is linked, the syncing user is the appointment organizer.
- The appointment is in the future.
- the appointment hasn't been logically deleted (see advanced topics).

If these conditions are not met, the appointment will still exist on Exchange, but it will appear unlinked.

When tracking a recurring meeting, Dynamics 365 will not send new invites to the attendees if all occurrences of that series still exist in Outlook and Exchange and no attendees have been added or deleted. If the organizer has deleted historical instances of the series, when it is tracked to Dynamics 365, it will see those as missing from Exchange and will recreate those instances. In that scenario, attendees would get a new invitation.

### Appointment organizer

Appointment organizer is a key field when it comes to appointment synchronization as it drives different synchronization behaviors. When creating appointments using customizations, please ensure the appointment organizer is correctly populated. The organizer field is not exposed on the appointment form by default but can be added to forms, views, or advanced find queries as needed to confirm the value is populated as expected.

### Sync from Exchange to Dynamics 365

- Mapping: Meetings in Exchange will be synchronized to Dynamics 365 as Appointments
- Appointment FreeBusy information: When an appointment FreeBusy information is set to Free on Exchange and this is synced to Dynamics 365, if the appointment is in Completed or Cancelled state on Dynamics 365, the status code will be set to Completed. When the state is Open in Dynamics 365 the status will be changed to Free**. Working elsewhere** reeBusy status will sync to Dynamics 365 as state Open and status Free.
- Appointment booking and conflict management: When an appointment is tracked to Dynamics 365, Server Side Synchronization will still leverage booking API to ensure the parties are available at the specified time. (e.g. if another appointment is already in the organizer's calendar in Dynamics 365 at the same time, the booking won't succeed) When the appointment booking doesn't succeed the appointment won't be synced, however the user can [address the scheduling conflict](https://support.microsoft.com/en-us/topic/a-scheduling-conflict-was-found-when-saving-appointment-appointment-subject-from-exchange-to-microsoft-dynamics-365-because-user-is-unavailable-at-this-time-fc18bc49-f77a-1ca3-c3c8-3b85d2776525) in their mailbox alert wall, select to ignore the specific conflict and let the appointment sync. Booking from Dynamics 365 mail app will automatically suppress the scheduling conflict. For more information, see [A scheduling conflict was found when saving appointment [appointment subject] from Exchange to Microsoft Dynamics 365](/dynamics-365/sales/scheduling-conflict-saving-appointment.md)
- Appointment deletion: When deleting a tracked appointment in Exchange, during sync the appointment deletion won't propagate to Dynamics 365 if the state is completed or cancelled, or if **scheduledStart** is in the past, or if the syncing user is not the appointment organizer. This applies to **exceptionAppointments** as well. An exception appointment represents an specific instance within a recurring appointment series which has been individually modified.

When deleting a recurring appointment in Exchange, during sync, the deletion won't propagate to Dynamics 365 if the state is **Completed** or **Cancelled**, or if the syncing user is not the appointment organizer.

## Service appointments - sync from Dynamics 365 to Exchange

-   Mapping: Service appointment records in Dynamics 365 will be synchronized to Exchange as Meetings

-   Invites and cancellations: Invites and cancellations are never sent for service appointments

-   Copies: When sync happens, each user gets their own copy of **serviceAppointment** in their mailboxes. There is no central organizer for service appointments in this case.

## Contacts - Sync from Dynamics 365 to Exchange

-   Mapping: Contact records in Dynamics 365 will be synchronized to Exchange as Contacts

<!-- -->

-   Address synchronization: For more information, see <https://docs.microsoft.com/dynamics365/outlook-addin/admin-guide/configure-synchronization-appointments-contacts-tasks#address-synchronization-for-contacts>

-   Contact deletion: The contact will only be deleted on Exchange if the syncing user is not the original contact record owner.

## Tasks - Sync from Dynamics 365 to Exchange

-   Mapping: Faxes, letters, phone calls and tasks records in Dynamics 365 will be synchronized to Exchange as Tasks

<!-- -->

-   Reminder: If the task **dueDate** is greater than a day ago and the task stateCode in Dynamics 365 is Open or Scheduled, the reminder will be set during sync.

-   Due date: The task **scheduledEnd** on Dynamics will be synced as task due date on Exchange.

-   Task status: When **percentcomplete** is not specified, a task in open status will be synced as not started and a task in Completed or Canceled state will sync as completed on Exchange.

-   Complete date: **actualEnd** will be synced as task complete date on Exchange

-   Task deletion: Task delete in Dynamics will be propagated to Exchange only for tasks which are not in the Completed status on Exchange.

-   Task autocompletion: When a task is completed in Dynamics the **actualEnd** field will be populated. If this task is syncing to Exchange using server-side synchronization, if the **actualEnd** field is populated and it is in the past, the task will be automatically completed. When using customizations to reactivate a task the **actualEnd** date should also be cleared to avoid autocompletion when server-side Sync is syncing this task.

### Sync from Exchange to Dynamics 365

-   Mapping: Tasks in Exchange will be synchronized to Dynamics 365 as tasks.

<!-- -->

-   Task status: When a task not started in Exchange gets synced to Dynamics 365 the task will be synced as **Not Started**.

-   Task actual start: When a task create is synced to Dynamics 365, the **actualStart** will be set to current timestamp.

-   Task deletion: Task deletion on Exchange will also delete the task in Dynamics 365. This applies to all tables which synchronize as task to Exchange task tables such as fax, letter, phone call, or task.

## Advanced appointment, contact, and task synchronization topics

### Distinct physical and logical deletion

When an item doesn't match the [sync filters](https://docs.microsoft.com/power-platform/admin/choose-records-synchronize-dynamics-365-outlook-exchange) anymore, server-side sync will propagate a delete operation to Microsoft Exchange. This applies to all tables.

There are two scenarios which can cause an item to not match the sync filters anymore:

-   Physical delete: The row doesn't exist in Dynamics 365 anymore.

-   Logical delete: Access to the row has been lost (the row still exists in Dynamics 365 but the user associated to the mailbox lost access to it or the row is not matching sync filters anymore.

By default, both these scenarios will propagate a delete operation to Microsoft Exchange.

To change this behavior and ignore logical deletes, turn on [orgdborgsetting](https://github.com/MicrosoftDocs/power-platform/blob/main/power-platform/admin/OrgDbOrgSettings.md) *DistinctPhysicalAndLogicalDeletesForExchangeSyn*c.

For more information on sync filter, see:

-   <https://docs.microsoft.com/power-platform/admin/choose-records-synchronize-dynamics-365-outlook-exchange>

-   <https://docs.microsoft.com/power-platform/admin/configure-default-sync-filters>

## Ignore copied items

When a linked item is copied on Exchange side, server-side sync by default will ignore the copy action to avoid bringing duplicate information to Dynamics 365. This applies to all tables.

If customer wants to bring the duplicate to Dynamics 365 please disable [orgdborgsetting](https://github.com/MicrosoftDocs/power-platform/blob/main/power-platform/admin/OrgDbOrgSettings.md) *IgnoreCopiedItemsInSSSForMailbox*. This setting is**On** by default.

For mor information, see [OrgDbOrgSettings documentation](https://github.com/MicrosoftDocs/power-platform/blob/main/power-platform/admin/OrgDbOrgSettings.md).

## Enable appointment attachment synchronization with Outlook or Exchange

## Address Synchronization for contacts

## Enable synchronization for tasks that are assigned in Outlook


