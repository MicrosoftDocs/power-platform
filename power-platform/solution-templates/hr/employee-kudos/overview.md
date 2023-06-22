---
title: Employee Kudos solution template for Power Platform
description: Learn about the Employee Kudos solution template for Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 06/06/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Employee Kudos solution template for Power Platform

Kudos allows employees to recognize others for attributes or actions they are grateful for by sending Kudos to their teammates—offering peer-to-peer recognition.

The Kudos AppSource package consists of two solutions:

- **Employee Experience base solution** Contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.
- **Kudos solution** Contains all the components needed to enable the Kudos experience in a company.

You can access the solution templates on AppSource at: <https://aka.ms/AccessEmployeeKudosTemplate>

:::image type="content" source="media/overview/kudos-screens-small.png" alt-text="Image alt text." lightbox="media/overview/kudos-screens-large.png":::

## Employee Experience base solution technical components

- **One model-driven app**: _Employee Experience Localization Admin App_ where an admin can see and edit localized string values
- **One table**:
  - Employee Experience localization – Records the app string replacements for every language the app is localized into
- **Two Security Roles**:
  - Employee Experience Localization Reader - provides read access to the table
  - Employee Experience Localizer - provides create, read, update, and delete access to the table
- **One Choice**:
  - ISO EE Language Code – Stores the abbreviation for available language codes

## Kudos solution technical components

- **One canvas app**: _Kudos App_, where the users can send Kudos and review their sent and received Kudos.
- **One model driven app**: _Kudos Administration App_ where an admin can see all Kudos, create or edit badges, and add or remove users from the _Opt Out User list_
- **Three tables**:
  - Kudos – stores the Kudos given
  - Badges – defines the Kudos types that are available in the experience
  - Opt-out User – records users that have opted-out of the program
- **Three security roles**:
  - Kudos - program admin
  - Kudos - manager
  - Kudos - employee
- **Four Power Automate flows**:
  - Kudo app – share Kudos with sender, assign to recipient
  - Kudos – deactivate received Kudos when an employee leaves the company
  - Kudos – delete Kudos when a user opts-out
  - Kudos app – notification email
- **Three connection references**:
  - Kudos app – Dataverse: connection reference to Dataverse
  - Kudos app – Office 365: Connection reference to Office 365
  - Kudos app – Outlook: Connection reference to Outlook

## Next steps

- [Install the Employee Kudos template](install.md)

## See also

- [Get started using the Employee Kudos app](use.md)
