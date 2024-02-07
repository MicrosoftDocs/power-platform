---
title: Manage the Onboarding Buddy app
description: Program admins manage the Onboarding Buddy app. Learn how to add new employees, update the configurations, and support more languages in the Onboarding Buddy Admin app.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 09/29/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started managing the Onboarding Buddy app

As an Onboarding Buddy program administrator, you can manage the Onboarding Buddy program. In the Onboarding Buddy Admin app, you are able to:

- Manually add a new employee
- Update the configuration
- Localize the strings to support more languages

## Manually add an Onboarder

Take these steps in the Onboarding Buddy Admin app to manually add a new employee to the program:

1. Select **Onboarders** on the left-side menu.
:::image type="content" source="media/manage/ob-manage-onboarders.png" alt-text="Power Apps screenshot of adding new employees.":::
1. Select **+New** from the top menu.
1. Fill out the form details.
:::image type="content" source="media/manage/ob-manage-onboarder-details.png" alt-text="Power Apps screenshot of the details screen.":::
1. Select **Save & Close**.

## Update the configuration

Take these steps in the Onboarding Buddy Admin app to update the configuration:

1. Select **Configurations** on the left-side menu.
1. Select the existing record (there should only be a single record in this table).
1. Select **Edit**.
:::image type="content" source="media/manage/ob-manage-configure.png" alt-text="Power Apps screenshot of updating configurations.":::
1. *Edit* and select **Save & Close**.
:::image type="content" source="media/manage/ob-manage-new-config.png" alt-text="Power Apps screenshot of editing the configuration.":::

## Support more languages

You can localize all the strings in the Onboarding Buddy app to support the diverse set of languages that may be spoken at your organization. The app contains default strings for all text, but checks to see if there's a localized version in the *Employee Experience Localization* table that's installed alongside the Onboarding Buddy solution. The Employee Experience base solution and the Onboarding Buddy solution are accessed together from AppSource.

To localize app strings, users must have the **Employee Experience Localizer** security role assigned to them by a Power Platform admin. Once assigned, a user can take these steps:

1. Go to the *Employee Experience Admin app*.
1. Select **Employee Experience Localizations** on the left-side menu.
1. Select **+New**.
1. Fill out the form.
    1. **English Value**. The value in the app that you replace.
    1. **Language**  The language you're translating into.
    1. **Localized Value**. The translated string you set up.
    1. **String Type**. The filter you can apply. It's optional but can help you sort and manage localized strings at a later date.
1. Select **Save & Close**.

## See also

- [Install and set up the Onboarding Buddy template](install-and-set-up.md)
- [Get started using the Onboarding Buddy app](use.md)
