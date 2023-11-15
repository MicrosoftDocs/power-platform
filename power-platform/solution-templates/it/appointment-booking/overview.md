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

**IT Base**: Contains components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.

**Appointment Booking**: Contains all the components to enable users to manage appointment slots and bookings.

You can access the template on AppSource at: <https://aka.ms/AccessAppointmentBookingTemplate>

## IT Base solution components

The *IT Base* solution contains various components that allow an admin to set up and manage the language preferences.

- **One model-driven app**: **IT Template Administration** - Lets an admin create, view, and edit localized string values

- **Two tables**

  - **IT Localization**: Records the app string replacements for every language into which the app is localized
  - **IT Error**: Records all errors from app and flows
- **One choice**: **ISO Language Code** - Stores the abbreviation for available language codes

## Appointment Booking solution components

- **One canvas app**: **Appointment Booking app** - Where users manage appointment slots and bookings

- **One model-driven app**: **Appointment Booking Administrator** - Where an admin can manage all data

[Screenshot] - AB-ModelDrivenApp

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

  - **Add New Contact** - Adds new record in Contact table if Requestor is not yet added
  - **Appointment Booking Email Notification** – Sends email notifications when an appointment booking has been created
  - **Contact Outlook Invites** – Creates meeting invites in Outlook when an appointment booking has been created
  - **Rescheduled Outlook Invite** – Reschedules the appointment
  - **Cancelled Outlook Invites** – Cancels the meeting invites in Outlook and sends email notifications to the Requestor and Meeting Provider
  - **Delete Event** – Child flow that's connected to Cancelled Outlook Invites
  - **Email Reminder** – Scheduled flow that runs once a day
  - **Contact Changed Email Notification** – Sends notifications when Meeting Provider has been changed.
  - **Update Initial Contact** - Child flow that's connected to Contact Changed Email Notification
  - **Get Time Zone** - Child flow that's connected to:
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
