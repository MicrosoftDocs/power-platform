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

The Awards and Recognition template makes it easy to set up and facilitate an employee awards program. It's designed to streamline the process of nominating and recognizing coworkers for their contributions and achievements.

Employees use a canvas app or a Microsoft custom copilot deployed in Teams to nominate coworkers and teams and to track their own recognitions.

Program admins manage the awards program in the admin model-driven app. They have the ability to define nomination periods and the available awards (types of recognition) in those periods. Awards can be configured to be available to single individuals, multiple individuals, or predefined teams. At the close of a nomination period, a program admin can review all the nominations and approve or decline them.

:::image type="content" source="media/overview/ar-four-screens.png" alt-text="Screenshots of Awards and Recognition app pages." lightbox="media/overview/ar-four-screens.png":::

:::image type="content" source="media/overview/a-r-copilot-ex.png" alt-text="Awards and Recognition app's  create a nomination copilot experience.":::

:::image type="content" source="media/overview/a-r-copilot-ex1.png" alt-text="Awards and Recognition app's customize option working with copilot.":::

Both Power App and Microsoft Copilot Awards and Recognition template versions are available in [Microsoft AppSource](<https://aka.ms/AccessAwardsAndRecognitionTemplate>) and can be installed independent of each other by selecting either:

- Awards and Recognition App
- Awards and Recognition Copilot

Each install package contains the Awards and Recognition Base solution. You can choose to download one or both packages. If you choose to download both packages, you'll have three solutions.

- **Awards and Recognition Base** contains the common foundational components needed to enable the Awards and Recognition experience in your organization, such as data tables and an admin interface. 

- **Awards and Recognition App** contains the Power App canvas app interface.
- **Awards and Recognition Copilot** contains the custom copilot interface.

## Awards and Recognition Base solution components

The *Awards and Recognition Base* solution contains the foundational components needed to run an Awards and Recognition program.

- One model-driven app: **Awards and Recognition Administration** is where an admin can:

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

- One Power Automate flow: **Awards and Recognition - Recognition gets deactivated** sets the *reviewed by* and *reviewed on* fields once a nomination has been set to a final state.
- One connection reference: **Awards and Recognition - Dataverse** sets the Dataverse connection.

## Awards and Recognition App solution components

The *Awards and Recognition App* solution enables Awards and Recognition program participants to interact within a Power Apps canvas app.

One canvas app: **Awards and Recognition App** is where users nominate others for awards, view their past nominations, and see awards they've received.

## Awards and Recognition Copilot solution components

The *Awards and Recognition Copilot* solution enables Awards and Recognition program participants to interact with a copilot chatbot.

- One copilot: **Awards and Recognition Copilot** is where users:

  - Create an Award nomination for a single user, list of users, or a team.
  - View recognitions that they've submitted and received.
  - View help topics with definitions for the program.

- Three Power Automate flows:

  - **Awards & Recognition – Get Next Rating** helps the user create ratings for the selected award category one-by-one.
  - **Awards & Recognition – Handle User Selection** keeps track of user selections as they create an award nomination in the copilot.
  - **Awards & Recognition – Submit to Dataverse** submits the award nomination to be saved within Dataverse.

- One connection reference: **Awards and Recognition - Dataverse** sets the Dataverse connection.
- One AI prompt: **Award Writer** uses the AI's general knowledge to generate an award message in addition to a prompt describing how to use that information and form it into an award use case.
  
### Next step

[Install and set up the Awards and Recognition template](install-and-set-up.md)
