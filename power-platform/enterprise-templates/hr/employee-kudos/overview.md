---
title: Employee Kudos template for Power Platform
description:  Empower your employees celebrate coworkers for their contributions. Learn about the Employee Kudos template for Microsoft Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 04/05/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---
# Employee Kudos template for Power Platform

The Employee Kudos template makes it easy to set up and facilitate a peer-to-peer recognition program within your organization. The Kudos canvas app allows employees to recognize coworkers for attributes or actions they are grateful for by sending Kudos to them.

:::image type="content" source="media/overview/kudos-screens-small.png" alt-text="Screenshots of Employee Kudos." lightbox="media/overview/kudos-screens-large.png":::

The Kudos template is available in [Microsoft AppSource](<https://aka.ms/AccessEmployeeKudosTemplate>). The template package consists of two solutions:

- **Employee Experience Base** contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
- **Kudos** contains all the components needed to enable the Kudos experience within a company.

## Employee Experience base solution components

- **Employee Experience Localization Admin** (model-driven app) allows admins to view and edit localized string values.
- **Employee Experience Localization** (table) stores the string replacements for every localized version of the app.
- Two security roles:
  - **Employee Experience Localization Reader** provides *read* access to the table.
  - **Employee Experience Localizer** provides *create*, *read*, *update*, and *delete* access to the table.
- **ISO Employee Experience Language Code** (choice) stores the abbreviations that identify available language codes.

## Kudos solution components

The Employee Kudos solution contains components that manage the user experience.

- Two apps:
  - **Employee Kudos** (canvas app) allows employees to send, receive, and review Kudos.
  - **Kudos Administration** (model-driven app) allows admins to view all Kudos, create and edit badges, and add or remove users from the *Opt Out User* list.
- Three tables:
  - **Kudos** stores the Kudos given.
  - **Badges** defines the Kudos types that are available in the experience.
  - **Opt-out User** records users who have opted out of the program.
- Three security roles:
  - **Kudos - program admin**
  - **Kudos - manager**
  - **Kudos - employee**
- Four Power Automate flows:
  - **Kudo app** shares Kudos with sender or assigns to a recipient.
  - **Kudos** deactivates received Kudos when an employee leaves the company.
  - **Kudos** deletes Kudos when a user opts out.
  - **Kudos app** sends notification email.
- Three connection references:
  - **Kudos - [Dataverse](/connectors/commondataserviceforapps/)** - Connection reference to Dataverse
  - **Kudos - [Office 365 Outlook](/connectors/office365/)** - Connection reference to Outlook
  - **Kudos - [Office 365 Users](/connectors/office365users/)** - Connection reference to Office 365

### Next step

[Install and set up the Employee Kudos template](install-and-set-up.md)

### See also

[Manage the Employee Kudos app](manage.md)
