---
title: View tenant-wide agent inventory
description: Learn how to get visibility into all Copilot Studio agents created across your tenant.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 06/11/2025
ms.custom: NewPPAC
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# View tenant-wide agent inventory

The Power Platform admin center now offers an enhanced, agent inventory experience, providing IT administrators with comprehensive visibility into all Copilot Studio agents created across their tenant. With this new agent inventory page, administrators can effortlessly discover, search, filter, and sort the entire inventory of agents by owner, creation date, region, and other key attributes—streamlining common administrative tasks.
This inventory capability enables administrators to:

- **Accelerate support**: Quickly locate agents referenced in support tickets to improve response times.
- **Prevent orphaned agents**: Identify agents owned by departing users to proactively transfer ownership and maintain continuity.
- **Enforce compliance standards**: Easily detect agents created in non-approved regions, ensuring adherence to organizational compliance policies.

## Prerequisites 
You must [turn on tenant-level analytics](tenant-level-analytics.md) to access the inventory.

## Known limitations
- **Limited scope**: This experience supports only agents built directly in Copilot Studio. Agents that are created in Copilot Studio agent builder, in the Microsoft 365 Copilot app, aren't supported in this release.
- **Data refresh frequency**: Inventory data updates once every 24 hours. Newly created agents might take up to 24 hours to appear, and deleted agents might remain visible for up to 48 hours after removal.
- **Item display limit**: The inventory page displays a maximum of 500 agents at one time. If more than 500 agents match your search or filter criteria, only the first 500 are displayed. Use additional filters to narrow down your results. The primary search box, above the table, only searches across those 500 agents.



