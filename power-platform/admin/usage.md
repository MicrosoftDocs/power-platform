---
title: Discover what drives engagement in the Power Platform by using the Usage page
description: Learn about Usage in the Power Platform admin center.
author: amchern
ms.component: pa-admin
ms.topic: concept-article
ms.date: 02/10/2026
ms.subservice: admin
ms.author: amchern
ms.reviewer: sericks
search.audienceType:
  - admin
contributors:
---

# Discover what drives engagement in Power Platform by using the Usage page (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

The **Usage** page in the Power Platform admin center is a centralized location for tracking engagement and adoption across Power Apps, Power Automate, and Copilot Studio agents. It highlights high-impact resources to help organizations understand what delivers value and where to focus investments.

> [!NOTE]
> This feature is currently rolling out and might not be available in your region yet.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Prerequisites

To access the **Usage** page, you must be assigned the [Power Platform administrator role](../guidance/adoption/pp-admin.md).

## Access the Usage page

Use the following steps to view the page.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Usage**. The **Usage** page is displayed.

## Usage insights

The **Usage** page helps you identify the top resources in your organization that drive success and recognize adoption trends, such as spikes in usage for apps, flows, and agents. 

At the top of the page, a summary view shows the adoption and usage trends, including:

- **Adoption over time**: Track daily usage growth over the last 28 days.
- **Usage in the last 28 days**: View aggregated usage for the past 28 days by product:
  - **Power Apps**: Active users  
  - **Power Automate**: Flow runs  
  - **Copilot Studio**: Agent sessions  
- **High-value resources**: Identify the top three apps, flows, and agents that generate the most impact.

Below the summary view, detailed tables provide sortable views of all apps, flows, and agents that are in use in your organization. Only items that aren't deleted are included. Sort by users for apps, runs for flows, and sessions for agents to identify trends and top performers.

### Power Apps

This table shows usage by end users launching apps, such as canvas apps and model-driven apps. 

### Power Automate

This table shows usage by run volume and includes cloud flows.

### Copilot Studio

This table shows usage by sessions and includes agents built in Copilot Studio (full).

## Known issues

For Power Automate and Copilot Studio, usage data from December 25, 2025, through January 3, 2026, might be inaccurate. This issue is resolved for dates after January 3, 2026.

## Frequently asked questions (FAQs)

### Why don't agent session numbers match those numbers in the Copilot area of the Power Platform admin center?

Agent session counts use a 28-day lookback window. Differences can occur because of timing and snapshot alignment. We plan to standardize these metrics in the future.
