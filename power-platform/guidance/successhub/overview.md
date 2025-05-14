---
title: Overview of Success Hub
description: Learn how Success Hub empowers organizations to digitize efficiently with shared data, governance, and integration using Microsoft Power Platform.
#customer intent: As a business decision maker, I want to compare the Success Hub co-development model with other approaches so that I can choose the best strategy for my team.  
author: kathyos
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/14/2025
ms.subservice: guidance
ms.author: kathyos
ms.reviewer: jhaskett-msft
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/23/2025
---

# Overview of Success Hub

Traditionally, larger organizations rely on central IT teams to develop and manage business applications. As the backlog of applications grows, a central IT team can struggle to maintain the applications and analyze how they might meet the requirements of the larger organization. This situation reduces productivity across an organization, requiring subdivisions to assign their own teams to the digitizing effort.

Power Apps and Microsoft Power Platform let individuals in an organization develop apps for their team's business needs without depending on a central IT team. However, when employees develop apps independently, challenges arise with reusability—both for data and apps at the organization level—as well as with supporting and maintaining the apps. To digitize an organization, it's important to look beyond the needs of a specific team and implement a strategy for the entire organization.

At Microsoft, multiple subdivisions focus on specific products and services. One of these is the Digital Transformation Platform (DTP), which is focused on Dynamics 365 and Microsoft Power Platform. DTP includes more than 15,000 people with unique needs. The Success Hub platform enables digitization for DTP, and Microsoft Central IT plays the role of a Center of Excellence, enabling the Microsoft Power Platform governance and environment strategy for all of Microsoft.

:::image type="complex" border="false" source="media/successhub-org-chart.png" alt-text="Diagram that shows how Success Hub supports the DTP group.":::
    Org chart showing various groups reporting into the Microsoft Corporation, which is supported by Central IT.
:::image-end:::

## What is Success Hub?

Success Hub is an internal Microsoft implementation of Dynamics 365 and the Power Platform. Teams in DTP develop their apps on Success Hub, and share or reuse data from other apps and systems. Around 35 business apps on the platform have been developed by approximately 20 teams. DTP has achieved a balance between agility and governance. This shared environment enables teams to share common data sources and administrative processes, and establishes a single source of truth while giving teams the freedom to build applications to suit their unique needs. 

:::image type="content" source="media/successhub-integrations.png" alt-text="Diagram that shows various business apps integrated through Success Hub Platform data.":::

## Advantages of the Success Hub co-development model

The following table describes specific advantages of using the Success Hub model compared to development by central IT or individual employees.


|                              | **Central IT (Center of Excellence)** | **Success Hub**                                                                 | **Individual employees and teams**                                           |
|------------------------------|---------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| **App development**          | :::image type="icon" source="media/no-symbol.png"::: Disadvantage<br>*Bottlenecked on one team* | :::image type="icon" source="media/yes-checkmark.png"::: Advantage<br>*Individual employees and teams aren't bottlenecked by a single team* | :::image type="icon" source="media/yes-checkmark.png"::: Advantage<br>*Not bottlenecked by a single team* |
| **Data storage and governance** | :::image type="icon" source="media/yes-checkmark.png"::: Advantage | :::image type="icon" source="media/yes-checkmark.png"::: Advantage                               | :::image type="icon" source="media/no-symbol.png"::: Disadvantage<br>*Data in one app doesn't talk to other apps* |
| **Integration**              | :::image type="icon" source="media/yes-checkmark.png"::: Advantage | :::image type="icon" source="media/yes-checkmark.png":::  Advantage<br>*No need to duplicate efforts* | :::image type="icon" source="media/no-symbol.png"::: Disadvantage<br>*Multiple efforts to do the same thing* |
| **Compliance and security**  | :::image type="icon" source="media/yes-checkmark.png"::: Advantage | :::image type="icon" source="media/yes-checkmark.png":::  Advantage<br>*No need to duplicate efforts* | :::image type="icon" source="media/no-symbol.png"::: Disadvantage<br>*Multiple efforts to do the same thing* |
| **Support and maintenance**  | :::image type="icon" source="media/no-symbol.png"::: Disadvantage<br>*Bottlenecked on one team* | :::image type="icon" source="media/yes-checkmark.png"::: Advantage<br>*No need to duplicate efforts with individual teams* | :::image type="icon" source="media/yes-checkmark.png"::: Advantage<br>*Not bottlenecked by a single team* |


- **Shared apps and data**: Because data is stored in a single Microsoft Dataverse instance, the same data tables&mdash;for example, Account, Contact, and Product&mdash;can be widely shared across multiple apps. 
- **Integration with other data sources**: Apps do need data from other systems in Microsoft&mdash;for example, sales and support data. These integrations are already enabled in Success Hub for any app to use.
- **Governance for co-development**: The governance model allows for multiple teams to co-develop at the same time on the platform.
- **Application lifecycle management (ALM)**: ALM features (such as dev environments and deployments) are provided to help teams get started quickly.
- **Compliance and security**: Success Hub takes care of compliance, security, and privacy reviews on a regular basis.
- **Support and maintenance**: App teams can take advantage of designated support and live site reviews.

## Next step
With an understanding of Success Hub at Microsoft, learn what was involved with [digitizing the Digital Transformation Platform group](digitizing-digital-transformation-platform-group.md).
