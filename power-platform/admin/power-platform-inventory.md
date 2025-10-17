---
title: Power Platform inventory (preview)
description: Learn how to get a comprehensive, unified view of all key resources—agents and apps—across your organization in Power Platform.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.date: 10/17/2025
ms.topic: concept-article
---

# Power Platform Inventory (preview)

## Introduction

The Power Platform admin center now offers tenant administrators with a comprehensive, unified view of all key resources—agents and apps—across their organization. With this centralized inventory, administrators can effortlessly discover, search, filter, and sort their entire inventory by owner, creation date, region, and other key attributes, streamlining common administrative tasks.

Some practical scenarios enabled by Power Platform Inventory include:

- **Spot your champions**: Quickly identify who's creating the most agents and apps, so you can recognize, nurture, and empower your top innovators.

- **Enforce compliance standards**: Effortlessly detect resources created in nonapproved regions, helping you maintain adherence to organizational policies.

- **Focus your governance**: Rank environments by resource count to concentrate your security, governance, and compliance efforts where they matter most.

- **Prevent orphaned agents**: Proactively find resources owned by departing users, enabling seamless ownership transfers and ensuring business continuity.

- **Accelerate support**: Instantly pinpoint that "needle in a haystack" agent referenced in a support ticket, dramatically improving response times.

## Supported resource types

Currently, Power Platform inventory includes:

- **Agents:** All agents created in Copilot Studio.

- **Apps:** All apps created in Power Apps, including canvas apps, model-driven apps, and code apps.

Other resource types such as flows will soon be added in future updates.

## Key features

- **Unified inventory**: Centralized view of all agents and apps.

- **Fast updates**: Created, updated, or deleted resources appear within 15 minutes.

- **Flexible filtering and sorting**: Filter and sort resources by any attribute.

- **Inventory count**: Instantly see the total number of items matching your criteria.

- **Customizable columns**: Tailor your view by selecting which columns to display.

- **Resource details**: Access detailed information for each app or agent.

- **Download**: Export your inventory to Excel for further analysis.

## Where to access Power Platform Inventory

Power Platform Inventory is available through multiple interfaces and APIs, enabling you to integrate inventory data into your workflows and tools of choice. Below are the primary ways to access inventory data:

### In the Power Platform Admin Center (UI)

1.  **Manage \> Inventory**: The main inventory page provides a unified view of all supported resources—agents and apps—across your tenant.

1.  **Manage \> Power Apps \> Inventory tab**: This tab offers a focused view of your apps inventory, including canvas apps, model-driven apps, and code apps.

1.  **Manage \> Copilot Studio:** This page offers a focused view of your agents created in Copilot Studio.

### Programmatic and advanced access

Power Platform Inventory data is also available programmatically, supporting advanced scenarios such as automation, reporting, and integration with external tools:

- **Power Platform API**

- **Azure Resource Graph:** Query inventory data using Kusto Query Language (KQL).

  - Azure Portal (Resource Graph Explorer)

  - Azure CLI

  - Azure PowerShell

  - REST APIs

More details on programmatic access and sample queries are provided below.

## Apply filters and sorts

Power Platform Inventory lets you filter and sort across all resource data, using any column or attribute. You can combine multiple filters to zero in on exactly the resources you need, whether you're tracking down a specific app or analyzing trends across environments. As you refine your criteria, the total count of matching resources is always displayed right above the resource table on the top left, making it easy to gauge the size of your filtered dataset.

For example, you can filter by:

- **Environment Type**: Select the **Environment Type** column and select **Default**. You see all agents and apps in the default environment.

- **Owner**: Select the **Owner** column and type the name of the person. You see all agents and apps owned by this person in the default environment.

- **Creation date**: Select the **Created on** column and apply the date filters from January 2025 to today's date. You see all agents and apps owned by this person, in the default environment, that they created in the year 2025.

To clear all filters and sorts, select any column and choose **Clear all filters**.

## Displaying additional columns

 The inventory table provides the option to display additional columns to help you better manage all your items. To customize displayed columns:

1.  Click the **column chooser** icon located next to the search box at the top of the table.

1.  Select or deselect columns you wish to display or hide.

## Search the inventory

You can quickly search for keywords across all entries currently loaded in the inventory table. The search box is designed to help you find specific resources fast, but keep in mind that it only searches the items visible in the UI (up to 1,000 at a time). If your inventory exceeds this limit, simply apply additional filters to narrow down the results and bring the resources you need into view.

## View agent, app, or environment details

- Select a resource, then select the **Details** option in the command bar.

- Or select the resource's display name to be redirected to its details page in the Copilot Studio portal or Power Apps portal. Warning: You must have sufficient permission on the selected resource to access its details page. If you do not have sufficient permission, you will see a "This link is broken" error.

- Select the environment name to view the environment details.

## Known limitations

1.  **Classic chatbots:** Classic chatbots are not included in the new Inventory page but can still be found in **Manage \> Copilot Studio \> Classic chatbots tab**.

1.  **"Modified on" and "Last modified by" columns**: These columns are currently non-functional for agents and will always have be populated with the – character.

1.  **Model-driven apps:** Only published model-driven apps are captured.

## Accessing Power Platform inventory data via Power Platform API

If you're new to the Power Platform API, start by reviewing the official [Getting Started with Power Platform API](/power-platform/admin/powerplatform-api-getting-started) guide for setup instructions and authentication details. Once you're set up, refer to the Inventory API documentation to learn how to query your inventory data.

## Accessing Power Platform inventory data via Azure

You can programmatically query your Power Platform inventory using Azure Resource Graph (ARG). ARG queries can be run through several Azure interfaces. For step-by-step instructions, refer to the official Azure Resource Graph quickstart guides for each method:

- [Run Resource Graph query using Azure portal](/azure/governance/resource-graph/first-query-portal)

- [Run Resource Graph query using Azure CLI](/azure/governance/resource-graph/first-query-azurecli)

- [Run Resource Graph query using Azure PowerShell](/azure/governance/resource-graph/first-query-powershell)

- [Run Azure Resource Graph query using REST API](/azure/governance/resource-graph/first-query-rest-api?tabs=powershell)

## Sample aueries

Below are example queries you can use with any of these interfaces:

### Query 1 — Total count of *all* resources

PowerPlatformResources

\| count

### Query 2 — Total counts by resource type

PowerPlatformResources

\| summarize count() by type

\| order by count\_ desc

### Query 3 — Counts by environment (inventory distribution across envs)

PowerPlatformResources

\| extend pros = parse_json(properties)

\| extend environmentId = tostring(pros.environmentId)

\| summarize count() by environmentId

\| order by count\_ desc

### Query 4 — Counts by region (inventory distribution across regions)

PowerPlatformResources

\| summarize count() by location

\| order by count\_ desc

### Query 5 — Top owners by item count

PowerPlatformResources

\| extend pros = parse_json(properties)

\| extend ownerId= tostring(pros.ownerId)

\| summarize count() by ownerId

\| order by count\_ desc

### Query 6 — Finding a single agent in the tenant

PowerPlatformResources

\| where type == "microsoft.copilotstudio/agents"

\| where name == "0f9b5e26-a682-f011-b4cc-6045bd0390df"

### Query 7 — Items created in the past 24 hours

PowerPlatformResources

\| extend pros = parse_json(properties)

\| extend createdAt= todatetime(pros.createdAt)

\| where createdAt \>= ago(24h)
