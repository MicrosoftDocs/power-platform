---
title: Get started managing the Onboarding Buddy program
description: Learn how to manage the Onboarding Buddy program by manually adding a new employee, updating the configurations, and localizing strings to support more languages.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.date: 04/26/2024
ms.custom: 
  - bap-template
  - ai-gen-docs-bap
  - ai-gen-desc
  - ai-seo-date: 12/05/2023
ms.service: power-platform
ms.subservice: solution-templates
---

# Get started managing the Onboarding Buddy program

As a program administrator, you can use the Onboarding Buddy Admin app to manage your organization's Onboarding Buddy program. You can:

- Manually add a new employee
- Update configurations
- Localize the strings to support more languages

## Manually add an Onboarder

1. In the Onboarding Buddy Admin app, in the left side panel, select **Onboarders**.

1. Select **New**.

1. Fill out the form.

1. Select **Save & Close**.

## Change the program configuration

1. In the Onboarding Buddy Admin app, in the left side panel, select **Configurations**.

1. Select the record. (There should only ever be one.)

1. Select **Edit**.

:::image type="content" source="media/manage/ob-manage-configure.png" alt-text="Screenshot of the Onboarding Buddy Admin app, with Configurations and Edit buttons highlighted.":::

1. Change what you need to, and then select **Save & Close**.

## Support more languages

You can localize the text strings in the Onboarding Buddy app to support employees who speak languages other than English. The app checks for a localized version in the Employee Experience Localization table that's installed with the Onboarding Buddy solution.

1. Ask a Power Platform admin to assign the **Employee Experience Localizer** security role to you.

1. Open the Employee Experience Admin app.

1. In the left side panel, select **Employee Experience Localizations**.

1. Select **New**.

1. Fill out the form:

    - **English Value** is the text in English.
    - **Language** is the language you're translating into.
    - **Localized Value** is the translated text.
    - **String Type** is an optional value that can help you sort and manage localized strings later.
1. Select **Save & Close**.

### See also

[Install and set up the Onboarding Buddy template](install-and-set-up.md)

[Get started using the Onboarding Buddy app](use.md)
