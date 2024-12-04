---
title: Onboarding Buddy template for Power Platform
description: Learn how to automate your new employee onboarding program with the Onboarding Buddy template for Microsoft Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 02/21/2024
ms.custom:
  - bap-template
  - ai-gen-docs-bap
  - ai-gen-desc
  - ai-seo-date:12/04/2023
ms.service: power-platform
ms.subservice: solution-templates
---

# Onboarding Buddy template for Power Platform

The Onboarding Buddy template makes it easy to set up and automate mentoring experiences for new and transfer employees.

Established employees sign up to be a Buddy and are paired with onboarding employees to help them acclimate to your organization and ramp up successfully in their new roles. [Learn more about enterprise templates for Power Platform](../../overview.md).

:::image type="content" source="media/overview/ob-three-welcome.png" alt-text="Renderings of three Onboarding Buddy app screens." lightbox="media/overview/ob-three-welcome.png":::

The Onboarding Buddy app offers the following capabilities:

- Employees can register as Buddies.
- Managers can find and match Buddies to new hires and transfers&mdash;the Onboarders.
- Program administrators can set up automated emails to guide the onboarding experience.
- Program administrators can manage the length of the program and when to send the introductory and wrap-up emails.

As a program administrator, you determine the Buddy-Onboarder match and the content and timing of automated emails to help your Onboarders and Buddies complete onboarding activities. As shown in the following illustration, for instance, you might set a "start nudge" email to be sent seven days after the introductory email is sent to the Buddy and Onboarder, and a "wrap-up nudge" email to be sent seven days before onboarding is scheduled to end.

:::image type="content" source="media/overview/ob-configure-match-and-emails.png" alt-text="Graphic illustrating a timeline of Buddy-Onboarder matching and email timing.":::

The Onboarding Buddy template is available in [Microsoft AppSource](<https://aka.ms/AccessOnboardingBuddyTemplate>). The template package consists of two solutions:

- **Employee Experience Base** contains common foundational components that all human resource (HR) solutions use. For now, only components that are needed for localization capabilities are included. Common strings can be localized once in the base solution and shared so that all dependent solutions get the benefit.
- **Onboarding Buddy** contains all the components that are needed to create an Onboarding Buddy program in your organization.

## Employee Experience base solution components

The **Employee Experience Base** solution contains components that manage app language preferences.

- **Employee Experience Localization Admin** is the model-driven app that allows admins to view and edit localized string values.
- **Employee Experience Localization** is the table that stores the string replacements for every localized version of the app.
- Two security roles:
  - **Employee Experience Localization Reader** provides *read* access to the table.
  - **Employee Experience Localizer** provides *create*, *read*, *update*, and *delete* access to the table.
- **ISO Employee Experience Language Code** is the *one choice* that stores the abbreviations for the available language codes.

## Onboarding Buddy solution components

The **Onboarding Buddy** solution contains components that manage the user experience.

- **Onboarding Buddy** is the canvas app that allows employees to register as Buddies and managers to match them with Onboarders.
- **Onboarding Buddy Admin** is the model-driven app that allows Power Platform and program administrators to set up and manage the program and view the status of all Onboarders and Buddies. With the required security role, administrators can also localize strings in the app.
- Three tables:
  - **Buddy List** stores information about and the status of Buddies.
  - **Onboarders** stores information about and the status of new and transfer employees.
  - **Configuration** stores program settings.
- Two security roles:
  - **Onboarding Buddy - administrator**
  - **Onboarding Buddy - user**
- Four Power Automate flows:
  - **Buddy Onboarder Emails** manages state transitions and sends the appropriate emails. Edit this flow to customize your email content.
  - **New Onboarders Sync** grabs new employee records in the last week and creates a record in the Onboarders table if it doesn't exist already.
  - **Set Default fields in Onboarding table** uses information in the `Configuration` table to set the value of fields related to the length of the onboarding program and when emails should be sent when an Onboarder is matched to a Buddy.
  - **Update Onboarders on update of Configuration record** updates the program-driven columns in the `Onboarders` table based on updates to the `Configuration` table.
- Four connection references:
  - **Onboarding Buddy app - [Dataverse](/connectors/commondataserviceforapps/)**
  - **Onboarding Buddy app - [Office 365 Outlook](/connectors/office365/)**
  - **Onboarding Buddy app - [Office 365 Users](/connectors/office365users/)**
  - **Onboarding Buddy app - [Office 365 Groups](/connectors/office365groups/)**

## Next step

[Install and set up the Onboarding Buddy template](install-and-set-up.md).
