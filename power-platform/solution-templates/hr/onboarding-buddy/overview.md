---
title: Onboarding Buddy template for Power Platform
description: Learn about the Onboarding buddy template for Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 10/04/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Onboarding Buddy template for Power Platform

The Onboarding Buddy template helps your organization set up and automate a new or transfer employee's mentoring experience. Existing employees sign up to be *onboarding buddies* and are paired with with the new employees to help them onboard and ramp up successfully.

The Onboarding Buddy app allows:

- Employees to register as Buddies
- Managers to find and match buddies to new hires and transfers (onboarders)
- Configurable Power Automate emails to guide the onboarding experience
- Program administrators to manage the length of the program and when to send the introductory and wrap up emails

The Onboarding Buddy AppSource package consists of two solutions:

- **Employee Experience Base**: Contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
- **Onboarding Buddy**: Contains all the components needed to enable the implementation of an Onboarding Buddy program within an organization.

You can access the templates on AppSource at: <https://aka.ms/AccessOnboardingBuddyTemplate>

## Employee Experience base solution technical components

The *Employee Experience Base* solution contains various technical components that allow an admin to set up and manage the language preferences.

- **One model-driven app**: The *Employee Experience Localization Admin* app allows you to see and edit localized string values as an admin.
- **One table**: The *Employee Experience Localization* table records the app string replacements for every localized version of the app.
- **Two security roles**:
  - The *Employee Experience Localization Reader* provides read access to the table.
  - The *Employee Experience Localizer* provides *create*, *read*, *update*, and *delete* access to the table.
- **One Choice**: The *ISO Employee Experience Language Code* stores the abbreviation for available language codes.

## Onboarding Buddy solution primary technical components

The *Onboarding Buddy* solution is composed of two apps, three tables, two security roles, four Power Automate flows, and four connections references for an admin to configure.

- **One canvas app**: **Onboarding Buddy** - The app is designed for the employees (Buddies) and managers to use. Onboarder information is added to the app.
- **One model-driven app**: **Onboarding Buddy Admin** - The app allows Power Platform and program administrators to configure the program and view the status of all Onboarders and Buddies. In addition, with the required security role, administrators can also localize application strings.
- **Three tables**:
  - **Buddy List** - Stores information and status about Buddies.
  - **Onboarders** - Stores information and status about people onboarding to the organization.
  - **Configuration** - Stores program settings.
- **Two security roles**:
  - **Onboarding Buddy - administrator**
  - **Onboarding Buddy - user**
- **Four Power Automate flows**:
  - **Buddy Onboarder Emails** - This flow is the workhorse that manages state transitions and sends the appropriate emails. Edit this flow to customize your email content.
  - **New Onboarders Sync** - This flow grabs all the new employee records in the last week and creates a record in the Onboarders table if it doesn't exist already.
  - **Set Default fields in Onboarding table** - This flow uses the configuration information to update the fields related to the length of the buddy program and when emails should be sent when an Onboarder is matched to a Buddy.
  - **Update Onboarders on update of Configurations record** - This flow updates the program-driven columns on the Onboarders table with new values based on configuration updates.
- **Four connection references**:
  - **Onboarding Buddy app - Dataverse** - Connection reference to Dataverse
  - **Onboarding Buddy app - Office 365 Users** - Connection reference to Office 365
  - **Onboarding Buddy app - Office 365 Outlook** - Connection reference to Outlook
  - **Onboarding Buddy app - Office 365 Groups** - Connection reference to Office Groups

## Next steps

[Install and configure the Onboarding Buddy template](install-and-configure.md)

## See also

[Get started managing the Onboarding Buddy app](manage.md)
