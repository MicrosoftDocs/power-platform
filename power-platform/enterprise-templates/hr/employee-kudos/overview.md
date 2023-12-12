---
title: Employee Kudos template for Power Platform
description:  Empower your employees celebrate coworkers for their contributions. Learn about the Employee Kudos template for Microsoft Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 10/26/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---
# Employee Kudos template for Power Platform

Employees can recognize others for attributes or actions they are grateful for by sending Kudos to their teammates—offering peer-to-peer recognition.

:::image type="content" source="media/overview/kudos-screens-small.png" alt-text="Screenshots of Employee Kudos." lightbox="media/overview/kudos-screens-large.png":::

The Kudos template is available in [Microsoft AppSource](<https://aka.ms/AccessEmployeeKudosTemplate>). The template package consists of two solutions:

- **Employee Experience Base** contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
- **Kudos** contains all the components needed to enable the Kudos experience within a company.

## Employee Experience base solution components

- **One model-driven app**: **Employee Experience Localization Admin** is the app allows you to see and edit localized string values as an admin.
- **One table**: **Employee Experience Localization** records the app string replacements for every localized version of the app.
- **Two security roles**:
  - **Employee Experience Localization Reader** provides *read* access to the table.
  - **Employee Experience Localizer** provides *create*, *read*, *update*, and *delete* access to the table.
- **One Choice**: **ISO Employee Experience Language Code** stores the abbreviation for available language codes.

## Kudos solution components

- **One canvas app**: **Employee Kudos** is the app where the users can:

  - send Kudos
  - review their sent and received Kudos.
- **One model-driven app**: **Kudos Administration** is the app where an admin can:

  - see all Kudos
  - create or edit badges
  - add or remove users from the *Opt Out User list*.
- **Three tables**:
  - **Kudos** stores the Kudos given.
  - **Badges** defines the Kudos types that are available in the experience.
  - **Opt-out User** records users who have opted out of the program.
- **Three security roles**:
  - **Kudos - program admin**
  - **Kudos - manager**
  - **Kudos - employee**
- **Four Power Automate flows**:
  - **Kudo app** shares Kudos with sender or assigns to a recipient.
  - **Kudos** deactivates received Kudos when an employee leaves the company.
  - **Kudos** deletes Kudos when a user opts out.
  - **Kudos app** sends notification email.
- **Three connection references**:
  - **Kudos - [Dataverse](/connectors/commondataserviceforapps/)** - Connection reference to Dataverse
  - **Kudos - [Office 365 Outlook](/connectors/office365/)** - Connection reference to Outlook
  - **Kudos - [Office 365 Users](/connectors/office365users/)** - Connection reference to Office 365

## Next steps

[Install and set up the Employee Kudos template](install-and-set-up.md)

## See also

[Manage the Employee Kudos app](manage.md)
