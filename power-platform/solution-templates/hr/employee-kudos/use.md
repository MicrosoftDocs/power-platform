---
title: Use the Employee Kudos app (preview)
description: Get started using the Employee Kudos app.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: get-started
ms.date: 05/30/2023
ms.custom: bap-template
---

# Get started using the Employee Kudos app

[This article is prerelease documentation and is subject to change.]

Follow the steps to create custom Kudos _Types_, opt-out users, and localize the application strings.

## Create custom Kudos types

To add Kudos _Types_ or _Badges_, follow these steps:

1. Start the _Kudos Administration app_ and click on **Badges** under _Administration_.
:::image type="content" source="media/use/Badges1.png" alt-text="Manage run-only permissions":::
1. Click on **+ New** on the top toolbar and fill out the _Name_, _SubTitle_, and _Sort Order_ for the new Badge.
1. Click **Save**. Once you do that, you can now associate an image with the badge. Kudos is a visual experience, so it is important to assign an image to each badge.
1. Repeat the process until you have all the types of Kudos that you want to be available in the experience.

## Opt-out users

If a user does not wish to be a part of the program, they can be added to the opt-out list. To add a user to the opt-out list, follow these steps:

1. Start the _Kudos Administration_ app.
1. Click on **Opt-out Users** under _Administration_.
:::image type="content" source="media/use/OptOut1.png" alt-text="Click on Opt-out Users":::
1. Click **+ New** on the top toolbar and fill out the form. Next, click **Save**.
1. The user will no longer be eligible to receive Kudos in the app and a background flow will delete all previous Kudos the user received.

## Localize application strings

All of the strings in the Kudos app can be localized to support the diverse set of languages that may be spoken in your company. The app contains default strings for all text, but checks to see if there is a localized version in the _Employee Experience Localization_ table that comes as part of the Employee Experience base solution that gets installed with the Kudos Solution when installed from AppSource.

The [_Kudos Localization Data Import_](http://aka/ms/KudosLocalization) instructions will guide you through importing all of the English localization strings into the _Employee Experience Localization_ table. You will also get a full list of English values which you can then use as a reference to do your localization into other languages.

To grant users the ability to localize app strings, you must assign the _Employee Experience Localizer_ security role to them. Once assigned, a user can open the _Employee Experience Localization Admin App_ and follow these steps:

1. Click **+ New**.
:::image type="content" source="media/use/Localize1.png" alt-text="Grant users ability to localize app strings.":::
1. Fill out the form.
    - _English Value_ is the text in the app that you want to replace.
    - _Language_ is the language you want to provide a localized value for.
    - _Localized Value_ is the translated text.
    - _String Type_ is the type of string you're replacing. This is an optional field for now.
1. Click **Save**.
