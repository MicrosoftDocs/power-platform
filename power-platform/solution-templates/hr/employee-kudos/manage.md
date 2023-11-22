---
title: Manage the Employee Kudos app
description: Get started managing the Employee Kudos app. Learn how to create custom Kudos types, opt out users, update the language settings.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: get-started
ms.date: 06/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
--- 

# Get started managing the Employee Kudos app

Follow the steps to create custom Kudos *types*, opt out users, and localize the application strings.

## Create custom Kudos types

To add Kudos *types* or *badges*, follow these steps:

1. Start the *Kudos Administration app* and select **Badges** under **Administration**.

   :::image type="content" source="media/use/Badges1.png" alt-text="Screenshot showing selection of Badges.":::

1. Select **+ New** on the top toolbar and fill out the *Name*, *SubTitle*, and *Sort Order* for the new badge.
1. Select **Save**. Once done, you can associate an image with the badge. Kudos is a visual experience, so it's important to assign an image to each badge.
1. Repeat the process until you have all the types of Kudos that you want to be available in the experience.

## Opt out users

If a user doesn't want to be part of the program, you can add them to the opt-out list. To add a user to the opt-out list, follow these steps:

1. Start the *Kudos Administration* app.
1. Select **Opt-out Users** under **Administration**.

   :::image type="content" source="media/use/OptOut1.png" alt-text="Screenshot showing selection of Opt-out Users.":::

1. Select **+ New** on the top toolbar and fill out the form.
1. Select **Save**.

The user is no longer eligible to receive Kudos in the app and a background flow deletes all previous Kudos the user received.

## Localize application strings

All of the strings in the Kudos app can be localized to support the diverse set of languages that may be spoken in your company. The app contains default strings for all text, but checks to see if there's a localized version in the *Employee Experience Localization* table. The table is included in the Employee Experience base solution that gets installed alongside the Kudos solution. The Employee Experience base solution and the Kudos solution are accessed together from AppSource.

The [*Kudos Localization Data Import*](https://aka.ms/KudosLocalization) instructions guide you through importing all of the English localization strings into the *Employee Experience Localization* table. You'll also get a full list of English values that you can then use as a reference to do your localization into other languages.

To grant users the ability to localize app strings, you must assign the *Employee Experience Localizer* security role to them. Once assigned, a user can open the *Employee Experience Localization Admin App* and follow these steps:

1. Select **+ New**.

   :::image type="content" source="media/use/Localize1.png" alt-text="Grant users ability to localize app strings.":::

1. Fill out the form.
    - *English Value* is the text in the app that you want to replace.
    - *Language* is the language you want to provide a localized value for.
    - *Localized Value* is the translated text.
    - *String Type* is the type of string you're replacing. This field is optional.
1. Select **Save**.
