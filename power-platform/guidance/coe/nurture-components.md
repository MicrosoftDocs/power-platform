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

## Flows

### Admin \| Welcome Email

Sends an email to a user who created a Power App, Flow, Custom Connector or
Environment. This Flow gets triggered when a new record is created in the Maker
table.  

![A screenshot of a cell phone Description automatically generated](media/b66ff59bc53e68e401f82dbd02d28ade.png)

### Admin \| Newsletter with Product Updates

Sends a weekly email with a summary of product updates, consisting of blog posts
from the Power Apps / flow / Power BI Product blogs and Power Apps Community
blog  

![A screenshot of a social media post Description automatically generated](media/64829e9ce21de5f1bd6324988bf3dbea.png)

### Training In A Day \| Feedback Reminder

Sends an email to attendees of a training in a day event on the day and requests
feedback

### Training In A Day \| Registration Confirmation

Sends an email to an attendee when they register for a training in a day event

### Training In A Day \| Reminder 3 days prior to event

Sends an email to an attendee of a training in a day event 3 days prior to the
event  

![A screenshot of a social media post Description automatically generated](media/7708aba740273931322165fddcee7e93.png)

## Apps

### App Catalog

A Canvas app that gives access to the entire organization to make apps more
discoverable. Admins audit and validate certain apps which are graduated to the
app catalog if the app is meant to be shared broadly.

When you first open the App Catalog, you will not see any apps there at first.
There is a field on the Power Apps App entity called "In App Catalog", which is
a two-option set type field (aka Boolean). If the value is set to "Yes", the app
will show up in the catalog. Following the [Compliance Business
Process](#powerapps-app-auditing-process) in the Admin app will allow you to
publish an app to the App Catalog.

**Permission**: Once you are using this process, the App Catalog can be shared
with the entire organization.

**Pre-Requisite**: This app uses CDS, a Premium license is therefore required.

![](media/1a472aaca1bdfdbeded243e34ad31ce2.png)

### Template Catalog

Canvas app that allows CoE Admins to share app and component templates as well
as best practice documents with their makers.

**Permission**: Once you have content ready, the Template Catalog can be shared
with the entire organization.

**Pre-Requisite**: This app is using SharePoint in the background and requires a
SharePoint site to be configured. This is described in the [CoE Starter Kit
Setup
Instructions](https://github.com/microsoft/powerapps-tools/raw/master/Administration/CoEStarterKit/CoE%20Starter%20Kit%20-%20Setup%20Instructions.docx)**.**

This app cannot be tested out in the managed solution, only once you've
[imported it into your extended unmanaged solution](#extending-the-toolkit).
This is due to some limitations in the environment variables and data sources in
the canvas apps.

#### Power Apps setup

You need to point the app to the SharePoint Library.

Open the Template Catalog Power Apps and edit the SharePoint connection to point
to your new Document library.

1. Browse to your extended solution

1. Select Template Catalog and hit Edit

1. File \> Save As to create your own copy so that updates to the toolkit do not erase your changes

1. Give it a name that will allow you to recognize this as your own copy

1. Hit the back arrow to return to the edit canvas

1. Select data on the left and remove the reference to the SharePoint Doc Lib
    shown ![](media/017b4dfb1b1b9e650c9910211c30f994.png)

1. In the search bar under Data sources, type SharePoint, and select the SharePoint data source shown, then Add a connection ![](media/9aa86e422442157b74f3e8f74537babc.png)

1. Choose to connect directly, enter the URL of the library and choose connect

1. Select the AppTemplates library and connect

1. In the Tree View on the left, select Screen1 and then HomeScreen to repopulate the gallery ![](media/e8d02e8109a9a4129b761dbcfa947ecd.png)

1. If you see any additional errors, its likey due to naming convention issues. If you see something like this, for example, fix up the name and you will be complete. ![](media/4e57685496217873022846563cb852e3.png)

![](media/839411804a357b932f82e0b92f8d4620.png)

#### Controls Provided

We have shipped with 3 components included. Here is
description of them. The demo app included in the Template Catalog list shows
all three in action.

All three components provide a Style Property which looks something like this,
and allows you to set default look and feel for people that use the components,
otherwise they default to the app theme.

![](media/146586e1a0b86fb76a8e51e236e1d98d.png)

*Dual Range Slider*: This control let's user get two values from an input range.
The values can then be used to filter galleries, or define limits, within their
applications

![](media/7ad7c8730cc2af375dc4af539fe84d0f.jpg)

*Calendar Control*: Similar to the Dual Range Slider, this control let's user
get a date, or a date range. The date(s) can then be used to filter galleries,
or define limits, within their applications

![](media/0c1f9b6459eff893660d147e8764667f.png)

*Header with Navigation Control:* This control allows users to have their header
and navigation pre-built for them, and not have to re-do. It helps you to
streamline the look and feel across your organization.

The user must specify in the "MenuList" property, the Screen Names for
navigation

```csharp
Table(
    {TextShown: "Home Screen", Screen: App.ActiveScreen},
    {TextShown: "Search", Screen: App.ActiveScreen},
    {TextShown: "Contact", Screen: App.ActiveScreen})
```

![](media/969723675dfeb8ade9dfa5cc3b911323.png)

#### Training In A Day – Management

If you are planning to run internal App / Flow / Custom in a day event, this
canvas app will enable you to create and manage events

**Permission**: Share with CoE Admins or the owners of your internal training
events.

**Pre-Requisite**: This app uses CDS, a Premium license is therefore required.

![](media/7f43b36df4b468b5c97cbde8f91ab0f9.png)

#### Training In A Day – Registration

If you are planning to run internal App / Flow / Custom in a day event, this
canvas app will enable your end users to register for upcoming events

**Permission**: Once you are running internal training events, share with
everyone in the organization.

**Pre-Requisite**: This app uses CDS, a Premium license is therefore required.

![](media/49ac992f9e41f5506c10a7ee07dbead3.png)

## Model-Driven App

### Power Platform Admin View

A model driven app that provides an interface used to navigate the items in the
CDS custom entities. It provides access to views and forms for the custom
entities in the solution.

![](media/54247715b05dea002d68ac56cbd7ffae.png)
