---
title: Synchronization logic for appointments, contacts, and tasks
description: Learn how appointments, contacts, and tasks are synchronized between Dynamics 365 and Outlook.
author: mduelae
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/18/2022
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

This article explores how appointments, contacts, and tasks are synced between Dynamics 365 and Exchange. [Email is synchronized separately](./integrate-synchronize-your-email-system.md).

Appointments, contacts, and tasks sync both ways by default between Dynamics 365 and Exchange. [Server-side synchronization](./server-side-synchronization.md), also known as Exchange synchronization, is the preferred method. Syncing happens differently, depending on the item being synced and the sync direction.

## Sync configuration requirements

Before appointments, contacts, and tasks can be synced, the corresponding mailbox record in Dynamics 365 must meet the following requirements. Note that queue mailboxes don't support appointment, contact, or task sync.

- The user's email address is approved.
- The mailbox is tested and enabled.
- Appointments, contacts, and tasks are set to use server-side synchronization.
    :::image type="content" source="./media/sync-logic-email-settings.png" alt-text="A screenshot of the Power Platform admin center Email settings page.":::

For more information, see [Connect to Exchange Online](./connect-exchange-online.md) and [Server-side synchronization](./server-side-synchronization.md).

Synchronization filters determine the records that sync between Dynamics 365 and Exchange using server-side synchronization. For more information, see [Choose the records to synchronize between customer engagement apps and Exchange](choose-records-synchronize-dynamics-365-outlook-exchange.md).

### Sync from Dynamics 365 to Exchange

After an item is synced with Exchange, a link is established. Sync is always bidirectional. Any change on one side will be reflected on the other.

### Sync from Exchange to Dynamics 365

Appointments, contacts, and tasks sync from Exchange to Dynamics 365 only when the following requirements are met:

- The item was created in the Dynamics 365 for Outlook app.
- The item is tracked to Dynamics 365 in Dynamics 365 for Outlook.
- The [**Tracked to Dynamics 365** category](./use-outlook-category-track-appointments-emails.md) is applied in Outlook or another email client, not Dynamics 365 for Outlook.

> [!NOTE]
> Server-side sync syncs appointments with the **Tracked to Dynamics 365** category if the appointment is in the main Calendar folder or its subfolders. Items in other calendar folders aren't synced.

  :::image type="content" source="./media/synced-items.png" alt-text="A screenshot of a mailbox in Outlook, showing appointments that can be synced from the main Calendar folder.":::

When these requirements are met, server-side sync creates the item in Dynamics 365 and establishes a link. Sync is always bidirectional. Any change on one side will be reflected on the other.

For more information, see:

- [Link and track an email or appointment to a specific row in your app](/dynamics365/outlook-app/user/track-message-or-appointment)
- [Track an email or appointment without linking it to a specific row](/dynamics365/outlook-app/user/track-without-set-regarding)
- [Use Outlook category to track appointments and emails](./use-outlook-category-track-appointments-emails.md)

## Syncing appointments

How appointments sync between Dynamics 365 and Exchange depends on the sync direction and the appointment's properties.

### Appointment organizer

The appointment organizer is a key field for appointment synchronization. It drives different synchronization behaviors. When you create appointments using customizations, make sure that the organizer is specified correctly. The organizer field isn't exposed on the appointment form by default. You can add it to forms, views, or advanced find queries, as needed, to confirm the value is present and correct.

### Syncing appointments from Dynamics 365 to Exchange

- **Mapping:** Appointments in Dynamics 365 sync to Exchange as meetings.

- **Appointment status:** If the appointment status in Dynamics 365 is **Completed**, **Canceled**, or **Free**, the appointment status syncs to Exchange as **Free**.

- **Reminder:** No reminder is set if the appointment is more than seven days in the past or the appointment status is **Free**.

- **Invitations:** No invitation is sent if:

  - The appointment is in the past.
  - No attendees are invited.
  - The user syncing the appointment isn't the organizer.
  - None of the following properties changed: Subject, Body, Location, IsAllDayEvent, ScheduledStart, ScheduledEnd, RequiredAttendees, OptionalAttendees, Organizer, AppointmentStatus, PriorityCode, RecurrencePattern.

#### Syncing canceled and deleted appointments from Dynamics 365 to Exchange

Exchange sends an appointment cancellation to attendees when the appointment is deleted in the organizer's mailbox.

If the appointment is deleted in Dynamics 365, no cancellation is sent if:

- The appointment is in the past.
- The user syncing the appointment isn't the appointment organizer.
- The appointment doesn't have attendees.

By default, appointments that are canceled in Dynamics 365 don't sync to Exchange as **Canceled**. To change this behavior, turn on *SSSPropagateAppointmentCancellationsToExchange* in [OrgDbOrgSettings](./orgdborgsettings.md). When this setting is enabled, canceling an appointment in Dynamics 365 cancels the meeting in Exchange, which sends the cancellation to attendees.

When an appointment is deleted in Dynamics 365 and synced with Exchange, the appointment is deleted in Exchange only if all the following conditions are met:

- The appointment is linked.
- The syncing user is the appointment organizer.
- The appointment is in the future.
- The appointment hasn't been [logically deleted](#ignore-logically-deleted-items-during-sync).

If all these conditions aren't met, the appointment still exists in Exchange, but it's unlinked.

When tracking a recurring meeting, Dynamics 365 doesn't send new invitations to attendees if:

- All occurrences of the series still exist in Outlook and Exchange.
- No attendees have been added or deleted.

If the organizer has deleted past instances of the series, then Dynamics 365 sees them as missing from Exchange. It recreates them and sends attendees a new invitation.

### Syncing appointments from Exchange to Dynamics 365

- **Mapping:** Meetings in Exchange sync to Dynamics 365 as appointments. Recurring meetings sync to Dynamics 365 as a recurring appointment primary and its instances. If individual instances of a recurring meeting are modified in Exchange, they sync to Dynamics 365 as exception appointment records.

- **Appointment status and Free/Busy state:** If the appointment state in Exchange is **Free**, the appointment state syncs to Dynamics 365 as **Free**. If the state is **Completed** or **Canceled** in Dynamics 365, the appointment status in Dynamics 365 is set to **Completed**. If the state is **Open** in Dynamics 365, the appointment status is set to **Free**. Working elsewhere, Free/Busy status syncs to Dynamics 365 as state **Open** and status **Free**.

- **Appointment booking and conflict management:** When an appointment is tracked to Dynamics 365, server-side sync uses the booking API to make sure that attendees are available at the specified time. For example, if the organizer's calendar in Dynamics 365 has another appointment at the same time, the booking fails, and the appointment isn't synced. The user can [address the scheduling conflict](https://go.microsoft.com/fwlink/?linkid=2187456), select to ignore it, and let the appointment sync anyway. Booking from Dynamics 365 in Outlook automatically suppresses the scheduling conflict. For more information, see [A scheduling conflict was found when saving appointment [appointment subject] from Exchange to Microsoft Dynamics 365](/dynamics-365/sales/scheduling-conflict-saving-appointment.md).

#### Syncing canceled and deleted appointments from Exchange to Dynamics 365

When a tracked appointment or an exception appointment is deleted in Exchange, the appointment isn't deleted in Dynamics 365 during sync if:

- The state is **Completed** or **Canceled**.
- The appointment is in the past.
- The user syncing the appointment isn't the appointment organizer.

(An exception appointment is a specific instance of a recurring appointment that's been individually modified.)

## Syncing service appointments

- **Mapping:** Service appointments in Dynamics 365 sync to Exchange as meetings.

- **Invitations and cancellations:** Invitations and cancellations are never sent for service appointments.

- **Copies:** During sync, users get their own copy of the service appointment in their mailboxes. There's no central organizer for service appointments.

## Syncing contacts

- **Mapping:** Contacts in Dynamics 365 sync to Exchange as contacts.

- **Address synchronization:** See [Address synchronization for contacts](/dynamics365/outlook-addin/admin-guide/configure-synchronization-appointments-contacts-tasks#address-synchronization-for-contacts).

- **Deleted contacts:** Contacts that are deleted in Dynamics 365 are deleted in Exchange only if the syncing user isn't the owner of the original contact.

## Syncing tasks

How tasks sync between Dynamics 365 and Exchange depends on the sync direction and the task's properties.

### Syncing tasks from Dynamics 365 to Exchange

- **Mapping:** Faxes, letters, phone calls, and tasks in Dynamics 365 sync to Exchange as tasks.

- **Reminder:** If the task due date is more than a day ago and the task state in Dynamics 365 is **Open** or **Scheduled**, a reminder is set during sync.

- **Due date:** The task scheduled end date in Dynamics 365 syncs to Exchange as the task due date.

- **Task status:** When percentage complete isn't specified:

  - an **Open** task syncs to Exchange as **Not started**.
  - a **Completed** or **Canceled** task syncs to Exchange as **Completed**.

- **Complete date:** The task actual end date syncs to Exchange as the task complete date.

- **Deleted tasks:** Tasks that are deleted in Dynamics 365 are deleted in Exchange only if their status in Exchange isn't **Completed**.

- **Task auto-completion:** Tasks that are marked as **Complete** in Dynamics 365 have a value in the **actualEnd** field. If a task's **actualEnd** field is populated and the date is in the past, the task syncs to Exchange as **Completed** automatically. If you use customizations to reactivate a task, be sure to clear the **actualEnd** date to avoid server-side sync auto-completing it.

### Syncing tasks from Exchange to Dynamics 365

- **Mapping:** Tasks in Exchange sync to Dynamics 365 as tasks.

- **Task status:** Tasks that haven't been started in Exchange sync to Dynamics 365 as **Not Started**.

- **Task actual start:** When a task that's created in Exchange syncs to Dynamics 365, its **actualStart** field is set to the current timestamp.

- **Deleted tasks:** Faxes, letters, phone calls, and tasks that are deleted in Exchange are deleted in Dynamics 365.


## Advanced synchronization settings

### Ignore logically deleted items during sync

When any item doesn't match the [sync filters](./choose-records-synchronize-dynamics-365-outlook-exchange.md) anymore, it's usually for one of two reasons:

- Its record no longer exists in Dynamics 365 because it was physically deleted.
- Its record still exists in Dynamics 365, but it can no longer be accessed. Either the user who's associated to the mailbox lost access to the item, or the item's properties changed and it no longer matches the sync filters. This condition is referred to as logical deletion.

By default, server-side sync sends a delete operation to Exchange in both cases. To change this behavior and ignore logical deletes, turn on *DistinctPhysicalAndLogicalDeletesForExchangeSync* in [OrgDbOrgSettings](OrgDbOrgSettings.md).

For more information on sync filters, see:

- [Choose the records to synchronize between customer engagement apps and Exchange](choose-records-synchronize-dynamics-365-outlook-exchange.md)
- [Set up default sync filters for multiple users for appointments, contacts, or tasks](configure-default-sync-filters.md)

### Allow copied items

When any linked item is copied in Exchange, server-side sync ignores the copy action by default. This behavior avoids creating duplicate information in Dynamics 365. To change this behavior and bring in duplicate items from Exchange, turn off *IgnoreCopiedItemsInSSSForMailbox* in [OrgDbOrgSettings](OrgDbOrgSettings.md) setting.

### Syncing appointment attachments, contact addresses, and tasks in Outlook

The following sections apply to sync that's done through Dynamics 365 for Outlook or server-side synchronization. For more information, see [Integrate your email system](/integrate-synchronize-your-email-system.md).

:::image type="content" source="./media/crm-itpro-systemsynctab.png" alt-text="A screenshot of the System Settings Synchronization tab in Dynamics 365 for Outlook.":::

#### Syncing appointment attachments

Users can attach documents, pictures, recordings, and other files to appointments that they create in Dynamics 365 or in the Dynamics 365 for Outlook app. By default, attachments aren't included when appointments are synced. To include them:
  
1. In Dynamics 365 for Outlook, go to **Settings** > **Administration** > **System Settings**.
1. On the **Synchronization** tab, select **Synchronize appointment attachments with Outlook or Exchange**.
  
##### Considerations when syncing attachments

- If you turn off attachment synchronization, attachments don't appear in appointments in Dynamics 365. They still appear in appointments in Dynamics 365 for Outlook.
- Attachments in recurring appointments or in service appointments can't be synced.
- Attachments can increase sync times. You may want to use attachments sparingly if you're using a low-bandwidth network.  

#### Syncing contact addresses  
  
On the **Synchronization** tab in Dynamics 365 for Outlook, select one of the following options to choose how contact addresses are synced:

- **Synchronize mailing address only in Outlook contact:** One mailing address is synced between Dynamics 365 and Outlook. This is sufficient for most organizations and is the default.

- **Synchronize all three addresses (Business, Home, Other) in Outlook contact:** All three Outlook mailing addresses (Business, Home, and Other) are synced between Dynamics 365 and Outlook.

>[!WARNING]
>If you have existing data, changing the setting to sync all three addresses can cause data loss. Attributes of existing tracked contacts are remapped when this setting is enabled. We recommend that you test this option before deployment to understand how the remapping affects your environment and your data. In most cases, you should have the full data on one side (normally Dynamics 365) and sync to the other side (normally Outlook or Exchange).  
>
>For more information, see [Which fields can be synchronized between Dynamics 365 apps and Outlook?](/dynamics365/outlook-addin/admin-guide/which-fields-synchronized.md)
  
#### Syncing tasks that are assigned in Outlook
  
By default, tasks that are created in Dynamics 365 for Outlook don't sync with Dynamics 365. To sync them, on the **Synchronization** tab in Dynamics 365 for Outlook, select **Synchronize tasks that are assigned in Outlook**.

##### Considerations when syncing tasks

- Recurring tasks can't be synced.
- The person assigning the task and the person the task is assigned to must be in the same organization.
- Tasks can't be synced to multiple email addresses.

### See also

- [Server-side synchronization](./server-side-synchronization.md)
- [Connect to Exchange Online](./connect-exchange-online.md)
- [Choose the records to synchronize between customer engagement apps and Exchange](choose-records-synchronize-dynamics-365-outlook-exchange.md)
- [Link and track an email or appointment to a specific row in your app](/dynamics365/outlook-app/user/track-message-or-appointment)
- [Track an email or appointment without linking it to a specific row](/dynamics365/outlook-app/user/track-without-set-regarding)
- [Use Outlook category to track appointments and emails](./use-outlook-category-track-appointments-emails.md)
- [OrgDbOrgSettings](./OrgDbOrgSettings.md)
- [A scheduling conflict was found when saving appointment [appointment subject] from Exchange to Microsoft Dynamics 365](/dynamics-365/sales/scheduling-conflict-saving-appointment.md)
- [Address synchronization for contacts](/dynamics365/outlook-addin/admin-guide/configure-synchronization-appointments-contacts-tasks#address-synchronization-for-contacts)
- [Integrate your email system](/integrate-synchronize-your-email-system.md)
- [Which fields can be synchronized between Dynamics 365 apps and Outlook?](/dynamics365/outlook-addin/admin-guide/which-fields-synchronized.md)
