---
title: Awards and Recognition solution template for Power Platform
description: Learn about the Awards and Recognition solution template for Power Platform.
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 08/04/2023
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Awards and Recognition solution template for Power Platform

The Awards and Recognition solution enables organizations to define nomination periods and available awards (types of recognition) in those periods that employees can nominate others for. Awards can be configured to be available to single individuals, multiple individuals, or pre-defined teams. Program administrators can then review and approve/decline nominations.

:::image type="content" source="media/overview/ar-four-screens.png" alt-text="Screenshots of Awards and Recognition." lightbox="media/overview/ar-four-screens.png":::

The Awards and Recognition AppSource package consists of two solutions:

- **Employee Experience Base**: Contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.

- **Awards and Recognition**: Contains all the components needed to enable the Awards & Recognition experience in your organization.

You can access the Awards and Recognition solution template on [AppSource](https://aka.ms/AccessAwardsAndRecognitionTemplate).

## Employee Experience base solution

The *Employee Experience Base* solution contains various technical components that allow an admin to set up and manage the language preferences.

- **One model-driven app**: The *Employee Experience Localization Admin* app allows you to see and edit localized string values as an admin.
- **One table**: The *Employee Experience Localization* table records the app string replacements for every localized version of the app.
- **Two security roles**:

  - The *Employee Experience Localization Reader* provides read access to the table.
  - The *Employee Experience Localizer* provides *create*, *read*, *update*, and *delete* access to the table.
- **One Choice**: The *ISO Employee Experience Language Code* stores the abbreviation for available language codes.

## Awards and Recognition solution

The *Awards and Recognition* solution is composed of two apps, eight tables, two security roles, that contain various technical components that enable an admin to configure the

- **One canvas app**: The *Awards and Recognition* app is designed for the users. It's where you nominate others for awards, view their past nominations, and see awards they have received.
- **One model-driven app**: The *Awards and Recognition Administration* app is designed for the admins. It's where you can configure nomination periods, available awards and related assessment questions, define teams that can be nominated, and approve and deny nominations.

- **Eight tables**:

  - **Award** - Defines awards users can be nominated for.
  - **Award Assessment Rating** - Specifies questions or values upon which nominated users should be assessed for a given award.
  - **Group** - Defines teams that are available for team-based nominations.
  - **Group Member** - Specifies the members of each defined team.
  - **Nomination** - Contains all user nominations.
  - **Nominated User** -  Specifies all the users in a given nomination (for example, all the team members if a team is nominated).
  - **Nomination Period** - Defined periods of time where nominations can be made for a set of awards. There is a many-to-many relationship with the Award table to allow program administrators to specify which awards are available for each nomination period.
  - **Nomination Rating** - The provided ratings against any assessment questions for the award.

- **Two security roles**:

  - **Awards and Recognition - Program Admin** – This role that should be granted to anyone that needs to configure nomination periods, awards, and groups as well as anyone who will be involved with setting the final state of nominations.
  - **Awards and Recognition – User** – This role should be granted to ALL users of the application, generally everyone in an organization in which the awards program is being rolled out to.

- **One Power Automate flow**:

  - **Awards and Recognition – Recognition gets deactivated** – Sets the *reviewed by* and *reviewed on* fields once a nomination has been set to a final state.

## Next steps

[Install the Awards and Recognition template](install.md)
