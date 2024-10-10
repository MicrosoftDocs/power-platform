---
title: Get started managing the Meeting Room Services program
description: Learn how to manage resources in the Meeting Room Services Admin model-driven app for Microsoft Power Platform.
author: ananthar-msft
ms.author: ananthar
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 10/10/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
#customer intent: As a meeting room services program manager, I want to learn how to administrate the Meeting Room Services program so that I can effectively manage resources for meeting rooms.
---

# Get started managing the Meeting Room Services program

Follow the steps below to create custom Services, Subservices, Survey Topics, and localize the application strings.

## Prerequisites

Ensure that the admin who installed and set up the template designated you as a *co-owner**, selected an appropriate role that allows you to manage the program, and shared two apps with you:

- Meeting Room Services app
- Meeting Room Services Administrative model-driven app

## Create custom services

In the Meeting Room Services Administrator model-driven app, set up the custom choices in the Services table so they show up in the *Request Service* screen in the Meeting Room Services app. Take these steps:

1. Start the *Meeting Room Services Administrator* app and select **Services**.
1. Select **+ New** on the toolbar and fill out the Service Name, Minimum Room Size, Service Description, and Owner for the new service.
1. Select **Save**.
1. Repeat the process until you have all the services that you want to be available in the experience.

> [!NOTE]
>
> For the *Owner field*, you can also specify a team of owners. Go to [Microsoft Dataverse teams management](/power-platform/admin/manage-teams) for more details on managing teams in your organization.

## Create custom subservices

In the Meeting Room Services Administrator model-driven app, set up the custom choices in the Subservices table so they show up in the *Request Service* screen in the Meeting Room Services app. Take these steps:

1. Start the *Meeting Room Services Administrator** app and select **Subservices**.
1. Select **+ New** on the toolbar and fill out the Subservice Name, Service Id, and Subservice Description for the new subservice.
1. Select **Save**.
1. Repeat the process until you have all the subservices that you want to be available in the experience.

## Create custom survey topics

In the Meeting Room Services Administrator model-driven app, set up the custom choices in the Survey Topics table so they show up in the *Give feedback* screen in the Meeting Room Services app. Take these steps:

1. Start the *Meeting Room Services Administrator* app and select **Survey Topics**.
1. Select **+New** on the toolbar and fill out App Setting Name, Application Administrator Email, Upcoming Meeting Displayed, Canvas Weblink, Model Driven Weblink, and Reported Issues Support Team.
1. Select **Save**.

## Localize application strings

The Meeting Room Services app supports multiple languages to support the diverse set of languages spoken at your company. It comes with default strings for all text, but it can also display text in other languages if available. This is managed through the Employee Experience Base Localization table, part of the Employee Experience Base solution. Both the Employee Experience Base and the Meeting Room Services solutions are bundled together and can be accessed via AppSource.

Take these steps to localize the strings to support more languages:

1. Start the *Meeting Room Services Administrator* app and select **Localizations**.
1. Select **+New** on the toolbar and complete the fields:
    1. **English Value** - the value in the app that you replace.
    1. **Language** - the language you're translating into.
    1. **Localized Value** - the translated string you set up.
    1. **String Type** - the filter you can apply. This field is optional.
    1. Select **Save & Close**.

## View error logs

You can view errors in the Meeting Room Services Administrator model-driven app.

1. Go to the *Meeting Room Services Admin* model-driven app.
1. Select **Errors**.
1. Select an item in the *Name* column to the error details.

### Related resources

[Get started using the Meeting Room Services app](use.md)
