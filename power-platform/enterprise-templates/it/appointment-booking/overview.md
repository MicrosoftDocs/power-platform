---
title: Appointment Booking template for Power Platform
description: The Appointment Booking template for Microsoft Power Platform enables you to set up an app that organizes the appointment booking process for your organization.
author: tverhasselt
ms.author: thoverh
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 11/29/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Appointment Booking template for Power Platform

The Appointment Booking template helps your organization set up, manage, and automate appointment bookings. One group of people such as students, employees, or club members can easily and clearly book appointments with people such as professors, and organization leaders, or scheduled sessions.

:::image type="content" source="media/overview/ab-canvas-model.png" alt-text="Screenshot of the Appointment Booking canvas app's Appointment Slot's screen and a screenshot of the model-driven app with the Microsoft Copilot panel open.":::

The Appointment Booking app allows:

- Meeting Providers to create appointment availability
- Requestors to book the availabilities
- Automated email notifications to keep everyone in sync

The Appointment Booking template is available in [Microsoft AppSource](<https://aka.ms/AccessAppointmentBookingTemplate>). The package consists of two solutions:

- **IT Base** contains components that enable localization capabilities. By sharing the components across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.

- **Appointment Booking** contains all the components to enable users to manage appointment slots and bookings.

## IT Base solution components

The *IT Base* solution contains various components that allow an admin to set up and manage the language preferences.

- **One model-driven app**: **IT Template Administration** lets an admin create, view, and edit localized string values

- **Two tables**

  - **IT Localization** records the app string replacements for every localized version of the app
  - **IT Error** records all errors from app and flows
- **One choice**: **ISO Language Code** stores the abbreviation for available language codes

## Appointment Booking solution components

- **One canvas app**: **Appointment Booking app** is where users manage appointment slots and bookings

- **One model-driven app**: **Appointment Booking Administrator** is where an admin can manage all data

- **Seven tables**:

  - **Appointment Booking**
  - **Appointment Slot**
  - **Location**
  - **Appointment Type**
  - **Appointment Room Number**
  - **User**  

- **Two security roles**:
  - **Appointment Booking - Administrator** provides access to model-driven app and canvas app
  - **Appointment Booking - User** provides access to canvas app
  - **IT Base - User** provides access to the IT Base model-driven app

- **Two choices**:
  - **Appointment Location** stores the available meeting modes (for example, *In Person*, *Online*, *Phone*)
  - **Attendance** stores the available status for appointments (for example, *Attended*, *No Show*, *Cancelled*)

- **Ten Power Automate flows**:

  - **Add New Contact** adds new record in Contact table if Requestor isn't added yet
  - **Appointment Booking Email Notification** sends email notifications to both the Requestor and Meeting Provider when an appointment is created
  - **Contact Outlook Invites** creates meeting invites for both Requestor and Meeting Provider when an appointment is booked
  - **Rescheduled Outlook Invite** reschedules the meeting invites in Outlook and sends email notifications to both the Requestor and Meeting Provider
  - **Cancelled Outlook Invites** cancels the meeting invites in Outlook and sends email notifications to the Requestor and Meeting Provider
  - **Delete Event child flow** connects to Cancelled Outlook Invites
  - **Email Reminder** scheduled flow that runs once a day
  - **Contact Changed Email Notification** sends notifications whenever the Meeting Provider changes.
  - **Update Initial Contact child flow** connects to Contact Changed Email Notification
  - **Get Time Zone child flow** connects to these flows:
    - Appointment Booking Email Notification
    - Cancelled Outlook Invites
    - Contact Changed Email Notification
    - Contact Outlook Invites
    - Email Reminder
    - Rescheduled Outlook Invite

- **Three connection references**:

  - **Appointment Booking – [Dataverse](/connectors/commondataserviceforapps/)** - Connection reference to Microsoft Dataverse
  - **Appointment Booking – [Office 365 Outlook](/connectors/office365/)** - Connection reference to Microsoft Office 365 Outlook
  - **Appointment Booking – [Teams](/connectors/teams/)** - Connection reference to Microsoft Teams

## Next steps

[Install and set up the Appointment Booking template](install-and-set-up.md)
