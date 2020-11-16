---
title: "Nurture components | MicrosoftDocs"
description: "The CoE nurture components solution contains assets to share best practices and templates, and onboard new makers"
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Use nurture components

An essential part of establishing a Center of Excellence (CoE) is nurturing your makers and an internal community. You'll want to share best practices and templates, and onboard new makers. The assets in this solution can help you develop a strategy for this motion.  

## Demo: Nurture components

Watch how to use the nurture components solution.

> [!VIDEO https://www.youtube.com/embed/StqxBgbt_ZM]

The CoE nurture components solution contains assets relevant to everyone in the organization: admins, makers, in addition to users of apps and flows. More information: [Set up nurture components](setup-nurture-components.md)

Here's a breakdown of the assets that form the nurture components solution:

- Onboard new makers, provide training, and share best practices
  - [Admin | Welcome Email (flow)](#flows)
  - [Template Catalog (canvas app)](#apps)
  - [Admin | Newsletter with Product Updates (flow)](#flows)
  - [Training in a Day Management and Registration (canvas apps)](#apps)
  - [Training in a Day Feedback Reminder, Registration Confirmation and Reminder (flow)](#flows)
- Encourage adoption
  - [App Catalog (canvas app)](#apps)

## Tables

### InADayAttendees

Represents attendees that have registered for a Training in a Day course by using the Training in a Day Registration canvas app. The following information is available for each attendee:

- Attendee email
- Name
- Registered event

### InADayEvent

Represents available training events created through the Training in a Day Management canvas app. The following information is available for each event:

- Name
- Description
- Start time
- End time
- Max attendees
- Location

## Flows

### Admin \| Welcome Email

Sends an email to a user who created an app, flow, custom connector, or environment. This flow gets triggered when a new record is created in the maker table.  

You can customize the email sent out by the flow. By default, it will look like the following image.

![The Welcome email introduces a new maker to learning resources available.](media/coe5.PNG "The Welcome email introduces a new maker to learning resources available.")

### Admin \| Newsletter with Product Updates

Sends a weekly email with a summary of product updates, consisting of posts from the product blogs for Power Apps, Power Automate, and Power BI, and the Power Apps Community blog.

![Newsletter with product updates](media/coe64.PNG "Newsletter with product updates")

### Training in a Day \| Feedback Reminder

Sends an email to attendees of a training event on the day, and requests feedback.

### Training in a Day \| Registration Confirmation

Sends an email to an attendee when they register for a Training in a Day event.

### Training in a Day \| Reminder 3 days prior to event

Sends a reminder email to an attendee of a Training in a Day event three days before the event.

:::row:::
   :::column span="":::
      ![Training in a Day reminder](media/coe66.png "Training in a Day reminder")
   :::column-end:::
   :::column span="":::
      ![Training in a Day feedback request](media/coe65.png "Training in a Day feedback request")
   :::column-end:::
:::row-end:::

## Apps

### App Catalog

A canvas app that helps give visibility to certain apps in the organization. Admins can choose which apps to highlight in the app catalog if the app meets admin requirements and is meant to be shared broadly.

When you first open the app catalog, you won't see any apps there. There's a field on the Power Apps App table called **In App Catalog**, which is a two-option set type field (Boolean). If the value is set to **Yes**, the app will show up in the catalog. To publish an app to the app catalog, follow the [app auditing process](example-processes.md) in the Power Platform Admin View app.

**Permission**: As soon as you're using this process, you can share the app catalog with the entire organization.

**Prerequisite**: This app uses Microsoft Dataverse; a Premium license is therefore required for every app user.

![App Catalog](media/coe67.png "App Catalog")

### Template Catalog

A canvas app that CoE admins can use to share app and component templates, in addition to best practice documents, with their makers.

**Permission**: After you've made the content ready, the template catalog can be shared with the entire organization.

**Prerequisite**: This app uses SharePoint in the background and requires a SharePoint site to be configured. This is described in [Set up nurture components](setup-nurture-components.md).

> [!NOTE]
> This app can't be used in the managed solution; it can only be tested and used after you've [imported it into your extended unmanaged solution](modify-components.md). This is due to some limitations in the environment variables and data sources in the canvas apps. For more information, go to [Set up the Template Catalog and upload components](modify-components.md#set-up-the-template-catalog-and-upload-components).

#### Training in a Day – Management

If you're planning to run an internal Training in a Day event (such as App in a Day), you can use this canvas app to create and manage it.

**Permission**: Share with CoE admins or the owners of your internal training events.

**Prerequisite**: This app uses Dataverse; a Premium license is therefore required for the admins who are using it.

![Training in a Day Management app](media/coe69.png "Training in a Day Management app")

#### Training in a Day – Registration

If you're planning to run a Training in a Day event, use this canvas app to enable your users to register for upcoming events.

**Permission**: As soon as you're running internal training events, share with everyone in the organization.

**Prerequisite**: This app uses Dataverse; a Premium license is therefore required for everyone in your org.

![Training in a Day Registration app](media/coe70.png "Training in a Day Registration app")
