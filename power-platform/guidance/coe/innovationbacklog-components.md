---
title: "Innovation Backlog components | MicrosoftDocs"
description: "The Innovation Backlog solution contains assets log ideas and perform business value assessments."
author: manuelap-msft
manager: devkeydet
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/10/2020
ms.author: mapichle
ms.reviewer: jimholtz
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Use Innovation Backlog components

Blurb

More information: [Set up Innovation Backlog components](#setup-innovationbacklog.md)

Here's a breakdown of the assets that form the nurture components solution:

## Security roles

- **Innovation Backlog Maker** Gives a user access to read and create records in the Innovation Backlog tables. When you share the Innovation Backlog app with your team, make sure to assign them the Innovation Backlog Maker security role.

## Tables

Ideas and information about ideas, such as pain points, personas, measures and tools used, are stored in the following Dataverse tables:

- Innovation Backlog Idea
- Backlog Idea Vote
- Backlog Item Complexity
- Backlog Item Documentset
- Backlog Item MeasureSet
- Backlog Item PainPointSet
- Backlog Item PersonaSet
- Backlog Item Solution
- Backlog Item Testimonial
- Backlog Item Toolset
- Backlog Item Workflow
- Innovation Backlog Pain Points
- Innovation Backlog Pain Points Measures
- Innovation Backlog Tool
- Innovation Backlog Workitem

View an entity relationship diagram of the tables used for the Innovation Backlog:

![Innovation Backlog entity relationship diagram](media/ib-27.png "Innovation Backlog entity relationship diagram")

## Flows

### Add Pain Point

This instant cloud flow runs once during setup to add some default values into the pain points table. Pain points are selected when a new idea is added to the Innovation Backlog.

### Update Software Tools

This instant flow runs once during setup to add some default values in the software tools table. Software tools are selected when a new idea is added to the Innovation Backlog.

## Apps

### Innovation Backlog Admin

A canvas app that the Innovation Backlog admin uses to update icons for non-software tools and delete obsolete or old ideas from the Innovation Backlog.

**Permission**: Share this app with the Innovation Backlog admini - this can be your CoE or Power Platform adoption lead.

**Prerequisite**: This app uses Microsoft Dataverse; a Premium license is therefore required for every app user.

![Innovation Backlog Admin app](media/ib-11.png "Innovation Backlog Admin app")

### Innovation Backlog

A canvas app that is used to share and vote on ideas, describe pain points and apps that need building, and measure ROI.

**Permission**: The Innovation Backlog can be shared with the entire organization.

**Prerequisite**: This app uses Microsoft Dataverse; a Premium license is therefore required for every app user.

![Innovation Backlog app](media/ib-12.png "Innovation Backlog app")

Learn more about how to [use the Innovation Backlog](#use-innovation-backlog.md).
