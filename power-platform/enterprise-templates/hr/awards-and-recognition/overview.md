---
title: Awards and Recognition template for Power Platform
description: The Awards and Recognition template for Microsoft Power Platform enables organizations to facilitate an engaging and efficient awards system to acknowledge the outstanding efforts of employees .
author: tshanep
ms.author: shanep
ms.reviewer: ellenwehrle
ms.topic: overview
ms.date: 04/15/2024
ms.custom: bap-template
ms.service: power-platform
ms.subservice: solution-templates
---

# Awards and Recognition template for Power Platform

The Awards and Recognition template makes it easy to set up and facilitate an employee awards program.

Employees use a canvas app to nominate coworkers and teams and to track their own recognitions.

Program admins manage the awards program in the admin model-driven app. They have the ability to define nomination periods and the available awards (types of recognition) in those periods. Awards can be configured to be available to single individuals, multiple individuals, or predefined teams. At the close of a nomination period, a program admin can review all the nominations and approve or decline them.

:::image type="content" source="media/overview/ar-four-screens.png" alt-text="Screenshots of Awards and Recognition." lightbox="media/overview/ar-four-screens.png":::

The Awards and Recognition template is available in [Microsoft AppSource](<https://aka.ms/AccessAwardsAndRecognitionTemplate>). The template package consists of two solutions:

- **Employee Experience Base** contains common foundational components that all human resource (HR) solutions use. For now, this is limited to components that enable localization capabilities. By sharing this across solutions, common strings can be localized once in the base solution and all dependent solutions get the benefit.

- **Awards and Recognition** contains all the components necessary to enable the Awards & Recognition experience in your organization.

## Employee Experience base solution components

The *Employee Experience Base* solution contains various components that allow an admin to set up and manage the language preferences.

- **Employee Experience Localization Admin** is the model-driven app that allows you to see and edit localized string values as an admin.
- **Employee Experience Localization** is the table that records the app string replacements for every localized version of the app.
- **ISO Employee Experience Language Code** is the *one choice* that stores the abbreviation for available language codes.
- Two security roles:
  - **Employee Experience Localization Reader** provides *read* access to the table.
  - **Employee Experience Localizer** provides *create*, *read*, *update*, and *delete* access to the table.

## Awards and Recognition solution components

The *Awards and Recognition* solution contains various components that an admin can configure. It is composed of two apps, eight tables, and two security roles.

- Two apps:
  - **Awards and Recognition** is the canvas app for the users. It's where you nominate others for awards, view their past nominations, and see awards they have received.
  - **Awards and Recognition Administration** is the model-driven app for the admins. It's where you, as an admin, can:

  - Configure nomination periods.
  - Configure available awards and related assessment questions.
  - Configure teams that can be nominated.
  - Approve and deny nominations.

- Eight tables:

  - **Award** defines awards users can be nominated for.
  - **Award Assessment Rating** specifies questions or values upon which nominated users should be assessed for a given award.
  - **Group** defines teams that are available for team-based nominations.
  - **Group Member** specifies the members of each defined team.
  - **Nomination** contains all user nominations.
  - **Nominated User** specifies all the users in a given nomination (for example, all the team members if a team is nominated).
  - **Nomination Period** defines periods of time where nominations can be made for a set of awards. There is a many-to-many relationship with the Award table to allow program admins to specify which awards are available for each nomination period.
  - **Nomination Rating** is the rating provided against any assessment questions for the award.

- Two security roles:

  - **Awards and Recognition - Program Admin** is a role that is granted to anyone who needs to configure nomination periods, awards, and group—as well as anyone who will be involved with setting the final state of nominations.
  - **Awards and Recognition - User** is a role that is granted to ALL users of the application. Generally, everyone in an organization in which the awards program is being rolled out to.

- **Awards and Recognition - Recognition gets deactivated** is the Power Automate flow that sets the *reviewed by* and *reviewed on* fields once a nomination has been set to a final state.

### Next step

[Install and set up the Awards and Recognition template](install-and-set-up.md)
