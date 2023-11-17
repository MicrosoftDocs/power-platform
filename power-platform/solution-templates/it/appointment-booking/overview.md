---
title: Appointment Booking template for Power Platform
description: Learn about the Appointment Booking template for Power Platform.
author: tverhasselt
ms.author: thoverh
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 11/07/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Appointment Booking template for Power Platform

The Appointment Booking template helps your organization set up, manage, and automate appointment bookings. One group of people such as students, employees, or club members can easily and clearly book appointments with people such as professors, and organization leaders, or scheduled sessions.

The Appointment Booking app allows:

- App manager to create appointment availability
- Users to book the availabilities
- Communications through email notifications sent by Microsoft Power Automate flows

The Appointment Booking AppSource template package consists of two solutions:

**IT Base**: Contains components that enable localization capabilities. By sharing the components across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.

**Appointment Booking**: Contains all the components to enable users to manage appointment slots and bookings.

You can access the template on AppSource at: <https://aka.ms/AccessAppointmentBookingTemplate>

## IT Base solution components

The *IT Base* solution contains various components that allow an admin to set up and manage the language preferences.

- **One model-driven app**: **IT Template Administration** - Lets an admin create, view, and edit localized string values

- **Two tables**

  - **IT Localization**: Records the app string replacements for every localized version of the app
  - **IT Error**: Records all errors from app and flows
- **One choice**: **ISO Language Code** - Stores the abbreviation for available language codes

## Appointment Booking solution components

- **One canvas app**: **Appointment Booking app** - Where users manage appointment slots and bookings

- **One model-driven app**: **Appointment Booking Administrator** - Where an admin can manage all data

- **Seven tables**:

  - **Appointment Booking**
  - **Appointment Slot**
  - **Location**
  - **Appointment Type**
  - **Appointment Room Number**
  - **User**  

- **Two security roles**:
  - **Appointment Booking - Administrator** - Provides access to model-driven app and canvas app
  - **Appointment Booking - User** - Provides access to canvas app

- **Two choices**:
  - **Appointment Location** - Stores the available meeting modes (for example, *In Person*, *Online*, *Phone*)
  - **Attendance** - Stores the available status for appointments (for example, *Attended*, *No Show*, *Cancelled*)

- **Ten Power Automate flows**:

  - **Add New Contact** - Adds new record in Contact table if Requestor isn't added yet
  - **Appointment Booking Email Notification** – Sends email notifications to both the Requestor and Meeting Provider when an appointment is created
  - **Contact Outlook Invites** – Creates meeting invites for both Requestor and Meeting Provider when an appointment is booked
  - **Rescheduled Outlook Invite** – Reschedules the meeting invites in Outlook and sends email notifications to both the Requestor and Meeting Provider
  - **Cancelled Outlook Invites** – Cancels the meeting invites in Outlook and sends email notifications to the Requestor and Meeting Provider
  - **Delete Event child flow** – Connects to Cancelled Outlook Invites
  - **Email Reminder** – Scheduled flow that runs once a day
  - **Contact Changed Email Notification** – Sends notifications whenever the Meeting Provider changes.
  - **Update Initial Contact child flow** - Connects to Contact Changed Email Notification
  - **Get Time Zone child flow** - Connects to these flows:
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
