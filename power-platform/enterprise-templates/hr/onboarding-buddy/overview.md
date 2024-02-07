---
title: Onboarding Buddy template for Power Platform
description: The Onboarding Buddy template for Microsoft Power Platform enables you to quickly set up an app that allows you to match new employees to Buddies who help with the onboarding process.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 11/22/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Onboarding Buddy template for Power Platform

The Onboarding Buddy template helps your organization set up and automate support for new and transfer employee mentoring experiences.

An existing employee signs up to be a *Buddy* and is paired with with a new or transfer employee, the *Onboarder*, to help them acclimate and ramp up successfully within your organization.

:::image type="content" source="media/overview/ob-three-welcome.png" alt-text="Displays three Onboarding Buddy Power Apps mobile screens." lightbox="media/overview/ob-three-welcome.png":::

The Onboarding Buddy app allows:

- Employees to register as Buddies
- Managers to find and match buddies to new hires and transfers—the Onboarders
- Configurable emails to guide the onboarding experience
- Program administrators to manage the length of the program and when to send the introductory and wrap up emails

As a program administrator, you can configure both the match and email timing. You can also customize the email content to help your Onboarders and Buddies accomplish the onboarding activities.
:::image type="content" source="media/overview/ob-configure-match-and-emails.png" alt-text="Displays a visual of how match and email timing can be configured as well as customizing the email content .":::
The Onboarding Buddy template is available in [Microsoft AppSource](<https://aka.ms/AccessOnboardingBuddyTemplate>). The template package consists of two solutions:

- **Employee Experience Base** contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
- **Onboarding Buddy** contains all the components needed to enable the implementation of an Onboarding Buddy program within an organization.

## Employee Experience base solution components

The *Employee Experience Base* solution contains various components that allow an admin to set up and manage the language preferences.

- **One model-driven app**: **Employee Experience Localization Admin** allows you to see and edit localized string values as an admin.
- **One table**: **Employee Experience Localization** records the app string replacements for every localized version of the app.
- **Two security roles**:
  - **Employee Experience Localization Reader** provides read access to the table.
  - **Employee Experience Localizer** provides *create*, *read*, *update*, and *delete* access to the table.
- **One Choice**: **ISO Employee Experience Language Code** - Stores the abbreviation for available language codes.

## Onboarding Buddy solution components

The *Onboarding Buddy* solution is composed of two apps, three tables, two security roles, four Power Automate flows, and four connections references for an admin to configure.

- **One canvas app**: **Onboarding Buddy** is the app designed for the employees (Buddies) and managers to use. Onboarder information is added to the app for matching.
- **One model-driven app**: **Onboarding Buddy Admin** is the app that allows Power Platform and program administrators to configure the program, manage, and view the status of all Onboarders and Buddies. In addition, with the required security role, administrators can also localize application strings.
- **Three tables**:
  - **Buddy List** stores information and status about Buddies.
  - **Onboarders** stores information and status about people onboarding to the organization.
  - **Configuration** stores program settings.
- **Two security roles**:
  - **Onboarding Buddy - administrator**
  - **Onboarding Buddy - user**
- **Four Power Automate flows**:
  - **Buddy Onboarder Emails** manages state transitions and sends the appropriate emails. Edit this flow to customize your email content.
  - **New Onboarders Sync** grabs all the new employee records in the last week and creates a record in the Onboarders table if it doesn't exist already.
  - **Set Default fields in Onboarding table** uses the configuration information to update the fields related to the length of the buddy program and when emails should be sent when an Onboarder is matched to a Buddy.
  - **Update Onboarders on update of Configurations record** updates the program-driven columns on the Onboarders table with new values based on configuration updates.
- **Four connection references**:
  - **Onboarding Buddy app - [Dataverse](/connectors/commondataserviceforapps/)** - Connection reference to Microsoft Dataverse
  - **Onboarding Buddy app - [Office 365 Outlook](/connectors/office365/)** - Connection reference to Microsoft Office 365 Outlook
  - **Onboarding Buddy app - [Office 365 Users](/connectors/office365users/)** - Connection reference to Microsoft Office 365 Users
  - **Onboarding Buddy app - [Office 365 Groups](/connectors/office365groups/)** - Connection reference to Microsoft Office 365 Groups

## Next steps

[Install and set up the Onboarding Buddy template](install-and-set-up.md)
