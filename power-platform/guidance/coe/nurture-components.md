---
title: "Nurture Components | MicrosoftDocs"
description: 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/18/2020
ms.author: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Use nurture components

An essential part of establishing a Center of Excellence (CoE) is nurturing your makers and an internal community. You'll want to share best practices and templates, and onboard new makers. The assets in this solution can help you develop a strategy for this motion.  

The CoE Nurture Components solution contains assets relevant to everyone in the organization: admins and makers, in addition to users of apps and flows. More information: [Set up nurture components](setup-nurture-components.md)

Here's a breakdown of the assets that form the Nurture Components solution:

-  Onboard new makers, provide training, and share best practices
    - [Admin | Welcome Email (flow)](#flows)
    - [Template Catalog (canvas app)](#apps)
    - [Admin | Newsletter with Product Updates (flow)](#flows)
    - [Training in a day Management and Registration (canvas apps)](#apps)
    - [Training in a day Feedback Reminder, Registration Confirmation and Reminder (flow)](#flows)
-  Encourage adoption
    - [App Catalog (canvas app)](#apps)

## Entities

### InADayAttendees

Represents attendees that have registered for a Training in a Day course using the Training in a Day registration canvas app.

### InADayEvent

Represents available training events created through the Training in a Day management canvas app.

## Flows

### Admin \| Welcome Email

Sends an email to a user who created an app, flow, custom connector, or environment. This flow gets triggered when a new record is created in the Maker table.  

You can customize the email sent out by the flow. By default, it will look like the following:

![Welcome email](media/coe5.PNG "Welcome email")

### Admin \| Newsletter with Product Updates

Sends a weekly email with a summary of product updates, consisting of blog posts from the Power Apps/Power Automate/Power BI product blogs and the Power Apps Community blog.

![Newsletter with product updates](media/coe64.PNG "Newsletter with product updates")

### Training In A Day \| Feedback Reminder

Sends an email to attendees of a training event on the day and requests feedback

### Training In A Day \| Registration Confirmation

Sends an email to an attendee when they register for a training in a day event

### Training In A Day \| Reminder 3 days prior to event

Sends a reminder email to an attendee of a training in a day event three days before the event.

:::row:::
   :::column span="":::
      ![Training In A Day Reminder Confirmation](media/coe66.png)
   :::column-end:::
   :::column span="":::
      ![Training In A Day Feedback Request](media/coe65.png)
   :::column-end:::
:::row-end:::

## Apps

### App Catalog

A canvas app that gives visibility to certain apps to the organization. Admins can choose which apps to highlight in the App Catalog if the app meets admin requirements and is meant to be shared broadly.

When you first open the App Catalog, you won't see any apps there at first. There is a field on the Power Apps App entity called *In App Catalog*, which is a two-option set type field (Boolean). If the value is set to **Yes**, the app will show up in the catalog. Following the [compliance business process](example-processes.md) in the Admin app<!--SELF: Correct name? --> will allow you to publish an app to the App Catalog.

**Permission**: As soon as you're using this process, you can share the App Catalog with the entire organization.

**Prerequisite**: This app uses Common Data Service; a Premium license is therefore required for every app user.

![App Catalog](media/coe67.png "App Catalog")

### Template Catalog

Canvas app that allows CoE admins to share app and component templates, in addition to best practice documents, with their makers.

**Permission**: After you've made the content ready, the Template Catalog can be shared with the entire organization.

**Prerequisite**: This app uses SharePoint in the background and requires a SharePoint site to be configured. This is described under [Set up nurture components](setup-nurture-components.md).

This app can't be tested out in the managed solution; it can only be tested and used after you've [imported it into your extended unmanaged solution](modify-components.md). This is due to some limitations in the environment variables and data sources in the canvas apps.

More information: [Extend, customize and modify components](modify-components.md)

#### Training in a Day – Management

If you're planning to run an internal Training in a Day event (such as App in a Day), you can use this canvas app to create and manage it.

**Permission**: Share with CoE admins or the owners of your internal training events.

**Prerequisite**: This app uses Common Data Service; a Premium license is therefore required for the admins who are using it.

![Training in a Day management app](media/coe69.png "Training in a Day management app")

#### Training In A Day – Registration

If you're planning to run a Training in a Day event, use this canvas app to enable your users to register for upcoming events.

**Permission**: As soon as you're running internal training events, share with everyone in the organization.

**Prerequisite**: This app uses Common Data Service; a Premium license is therefore required for everyone in your org.

![Training in a Day registration app](media/coe70.png "Training in a Day registration app")
