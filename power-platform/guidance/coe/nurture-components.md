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

An essential part of establishing a CoE is nurturing your makers and an internal community. You will want to share best practices and templates and onboard new makers – the assets part of this solution can help develop a strategy for this motion.  

The Nurture Components solution contains assets relevant to everyone in the organization, admins, makers as well as end users of apps and flows.

Learn how to [set up the nurture components](setup-nurture-components.md)

Here's a breakdown of the assets that form the core components

1. **Onboard new makers, provide training and share best practices**
    1. Admin | Welcome Email (Flow)
    1. Template Catalog (Canvas App)
    1. Admin | Newsletter with Product Updates (Flow)
    1. Training in a day Management and Registration (Canvas Apps)
    1. Training in a day Feedback Reminder, Registration Confirmation and Reminder (Flow)
1. **Encourage Adoption**
    1. App Catalog (Canvas App)

## Entities

- **InADayAttendees** Represents attendees that have registered for a Training in a day course using the Training in a day registration canvas app
- **InADayEvent** Represents training events available and created through the Training in a day management canvas app

## Flows

### Admin \| Welcome Email

Sends an email to a user who created a Power App, Flow, Custom Connector or Environment. This flow gets triggered when a new record is created in the Maker table.  

You can customize the email sent out by the Flow, by default it will look like the following:

![Welcome email](media/coeoverview3.PNG)

### Admin \| Newsletter with Product Updates

Sends a weekly email with a summary of product updates, consisting of blog posts from the Power Apps / flow / Power BI Product blogs and Power Apps Community blog  

![Newsletter with Product Updates](media/coenurture1.PNG)

### Training In A Day \| Feedback Reminder

Sends an email to attendees of a training in a day event on the day and requests feedback

### Training In A Day \| Registration Confirmation

Sends an email to an attendee when they register for a training in a day event

### Training In A Day \| Reminder 3 days prior to event

Sends an email to an attendee of a training in a day event 3 days prior to the event  

![Training In A Day Reminder 3 days prior to event email](media/coenurture2.png)

## Apps

### App Catalog

A Canvas app that gives access to the entire organization to make apps more discoverable. Admins audit and validate certain apps which are graduated to the app catalog if the app is meant to be shared broadly.

When you first open the App Catalog, you will not see any apps there at first. There is a field on the Power Apps App entity called *In App Catalog*, which is a two-option set type field (aka Boolean). If the value is set to *Yes*, the app will show up in the catalog. Following the [Compliance Business Process](#powerapps-app-auditing-process) in the Admin app will allow you to publish an app to the App Catalog.

**Permission**: Once you are using this process, the App Catalog can be shared with the entire organization.

**Pre-Requisite**: This app uses CDS, a Premium license is therefore required.

![App Catalog](media/coeoverview2.png)

### Template Catalog

Canvas app that allows CoE Admins to share app and component templates as well as best practice documents with their makers.

**Permission**: Once you have content ready, the Template Catalog can be shared with the entire organization.

**Pre-Requisite**: This app is using SharePoint in the background and requires a SharePoint site to be configured. This is described under [setup nurture components](setup-nurture-components.md)).

This app cannot be tested out in the managed solution, only once you've [imported it into your extended unmanaged solution](#extending-the-toolkit).
This is due to some limitations in the environment variables and data sources in the canvas apps.

#### Power Apps setup

You need to point the app to the SharePoint Library.

Open the Template Catalog Power Apps and edit the SharePoint connection to point to your new Document library.

1. Browse to your extended solution
1. Select Template Catalog and hit Edit
1. **File \> Save As** to create your own copy so that updates to the toolkit do not erase your changes
1. Give it a name that will allow you to recognize this as your own copy
1. Hit the back arrow to return to the edit canvas
1. Select **data** on the left and remove the reference to the SharePoint Doc Lib shown<Br> ![Template Catalog Setup SharePoint connection](media/coetemplate1.png)

1. In the search bar under Data sources, type SharePoint, and select the SharePoint data source shown, then **Add a connection** <br>![Template Catalog Setup SharePoint connection](media/coetemplate2.png)

1. Choose to connect directly, enter the URL of the library and choose connect

1. Select the AppTemplates library and connect

1. In the Tree View on the left, select **Screen1** and then **HomeScreen** to repopulate the gallery <br>![Template Catalog Setup](media/coetemplate3.png)

1. If you see any additional errors, its likey due to naming convention issues. If you see something like this, for example, fix up the name and you will be complete.<br> ![Template Catalog Fix Connections](media/coetemplate4.png)

Your template catalog is now ready
![Template Catalog](media/coetemplate5.png)

#### Controls Provided

We have shipped with 3 components included. Here is
description of them. The demo app included in the Template Catalog list shows all three in action.

All three components provide a Style Property which allows you to set default look and feel for people that use the components, otherwise they default to the app theme.

![Style Property of Templates](media/coetemplate6.png)

*Dual Range Slider*: This control let's user get two values from an input range. The values can then be used to filter galleries, or define limits, within their
applications

![Dual Range Slider](media/coetemplate7a.jpg)

*Calendar Control*: Similar to the Dual Range Slider, this control let's user get a date, or a date range. The date(s) can then be used to filter galleries,
or define limits, within their applications

![Calendar Control](media/coetemplate7c.png)

*Header with Navigation Control:* This control allows users to have their header and navigation pre-built for them, and not have to re-do. It helps you to streamline the look and feel across your organization.

The user must specify in the *MenuList* property, the Screen Names for
navigation

```csharp
Table(
    {TextShown: "Home Screen", Screen: App.ActiveScreen},
    {TextShown: "Search", Screen: App.ActiveScreen},
    {TextShown: "Contact", Screen: App.ActiveScreen})
```

![Header with Navigation Control](media/coetemplate7b.png)

#### Training In A Day – Management

If you are planning to run internal App / Flow / Custom in a day event, this
canvas app will enable you to create and manage events

**Permission**: Share with CoE Admins or the owners of your internal training
events.

**Pre-Requisite**: This app uses CDS, a Premium license is therefore required.

![Training in a day management app ](media/coetraining2.png)

#### Training In A Day – Registration

If you are planning to run internal App / Flow / Custom in a day event, this canvas app will enable your end users to register for upcoming events

**Permission**: Once you are running internal training events, share with everyone in the organization.

**Pre-Requisite**: This app uses CDS, a Premium license is therefore required.

![Training in a da registration app](media/coetraining1.png)
