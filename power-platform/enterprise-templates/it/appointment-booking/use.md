---
title: Use the Appointment Booking template for Power Platform
description: Learn how you can use the Appointment Booking app for Microsoft Power Platform to streamline and automate managing your appointments.
author: microsoft-george
ms.author: georgenewton
contributors:
  - tverhasselt
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 11/15/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started using the Appointment Booking template for Power Platform

There are two kinds of users who interact with the Appointment Booking app in some way:

- **Meeting Provider**. As a Meeting Provider, you use the app to set up your appointment slots and manage your own appointment slots and related bookings. Delegates can also be set up for Meeting Providers to oversee the appointment booking process for them
- **Requestor**. As a Requestor, you use the app to book and manage appointments with Meeting Providers
- **Admin or Manager**. As an admin or manager, you use the Appointment Booking app to manage appointment slots on behalf of other users and all bookings

## Set up and manage appointment slots

As a Meeting Provider, you can set your availability for bookings and manage your appointments.  

To create appointment slots, follow these steps:

1. Go to the Appointment Booking app and select **Schedule appointment slots**.
1. On the Appointment Slot screen, select a *date* on the calendar.
    :::image type="content" source="media/use/ab-use-createslots.png" alt-text="Screenshot of setting up appointment appointment slots in the Appointment Booking app.":::
1. On the right side of the screen choose a time slot you want to make available to Requestors, Select **Add**.
1. On the Add Appointment Slot screen, make selections from dropdowns for:

    - Appointment Type
    - Meeting Via
1. Select **Submit****.

> [!NOTE]
> If you select **In Person** from the *Meeting Via* dropdown, you also need to specify values for Location (building) and Room Number fields.

To remove appointment slots, follow these steps:

1. Go to the Appointment Booking app and select **Schedule appointment slots**.
1. On the Appointment Slot screen, select a *date* in the calendar.
1. On the right side of the screen, Select **Remove**.

## Book and manage appointments

As a Requestor, you can book and manage your appointments. To book an appointment, take these steps:

1. Go to the Appointment Booking app and select **Book new appointment**.
1. On the New Booking screen, specify values for the following:

    - Requestor
    - Appointment Type
    - Meeting Provider (Optional)
    - Meeting Via (Optional)

1. Select **Show Appointment** to display all available appointment slots based on what you selected in the previous step.
1. Select **Select** for the date and time you want to book.
1. View the details of the appointment on the Booking screen.
1. (Optional) You can also Add text in the Comments field.
1. Select **Submit**.

Booking an appointment with a Meeting Provider triggers flows that initiate a series of actions:

- **Appointment Booking Email Notification** – An email notification is automatically sent to both the Requestor and Meeting Provider
- **Contact Outlook Invites** - Outlook meeting invites are automatically created for both the Requestor and Meeting Provider
- **Add new contact** - A new Requestor record is created in the Contact table if one does not already exist.

As a  Requestor or Meeting Provider, you can cancel an appointment booking. To cancel an appointment, take these steps:

1. Go to the Appointment Booking app and select **Manage existing bookings**.
1. On the Manage Booking screen, specify the Requestor.
:::image type="content" source="media/use/ab-use-pickreq.png" alt-text="Screenshot of selecting requestor name on the Manage Booking page in the Appointment Booking app.":::
1. Select **Show booked appointments**.
1. Choose the appointment booking you want to cancel and select **Manage Appointment**.
1. On the Appointment Details screen, select **Cancel Appointment**.
:::image type="content" source="media/use/ab-use-apptdetails.png" alt-text="Screenshot of the Appointment Details screen in the Appointment Booking app.":::
1. On the Confirmation screen there is an option to enter a reason for the cancellation. Select **Yes, Cancel** to confirm the cancellation. This triggers the *Cancelled Outlook Invites flow* that cancels the Outlook meeting invites and sends email notifications to both the Requestor and Meeting Provider.
1. On the Success screen, select **Return Home**.

To reschedule an existing appointment booking, take these steps:

1. Go to the Appointment Booking app and select **Manage existing bookings**.
1. Select the *Requestor* from the dropdown on the Manage Booking screen.
1. Select **Show booked appointments**.
1. Choose the appointment booking you want to reschedule and select **Manage Appointment**.
1. On the Confirmation screen there is an option to enter a reason for the cancellation. Select **Yes, Reschedule** to confirm the cancellation.
1. On the New Booking screen, choose the new appointment slot and select **Select**.
1. On the Booking screen, you can view the appointment details and add any additional comments in the *Comments* field.
1. Select **Submit**. This triggers the *Rescheduled Outlook Invite flow* that reschedules the Outlook meeting invites and send email notifications to both the Requestor and Meeting Provider.
1. On the Success screen, select **Return Home**.
