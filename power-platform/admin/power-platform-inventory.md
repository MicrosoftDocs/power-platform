---
title: Power Platform inventory (preview)
description: Learn how to get a comprehensive, unified view of all agents and apps across your organization in Power Platform.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.date: 11/14/2025
ms.topic: concept-article
---

# Power Platform inventory (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

The Power Platform admin center now offers tenant administrators a comprehensive, unified view of all key resources&mdash;agents, apps, and flows&mdash;across their organization with Power Platform inventory. With this centralized inventory, administrators can effortlessly discover, search, filter, and sort by owner, creation date, region, and other key attributes, streamlining common administrative tasks.

Power Platform inventory allows you to easily complete the following tasks:

- **Spot your champions**: Quickly identify who's creating the most resources so you can recognize, nurture, and empower your top innovators.

- **Enforce compliance standards**: Effortlessly detect resources created in nonapproved regions to maintain adherence to organizational policies.

- **Focus your governance**: Rank environments by resource count to focus security, governance, and compliance efforts where they matter most.

- **Prevent orphaned agents**: Proactively find resources owned by departing users to allow seamless ownership transfers and ensure business continuity.

- **Accelerate support**: Instantly pinpoint that _needle in a haystack_ resource referenced in a support ticket to dramatically improve response times.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Supported resource types

The Power Platform inventory includes:

- **Agents:** All agents created in Copilot Studio.

- **Apps:** All apps created in Power Apps (canvas apps, model-driven apps, and code apps) and in Microsoft 365 Copilot's App Builder agent.
  
- **Flows:** All Power Automate cloud flows, Copilot Studio agent flows, and Microsoft 365 Copilot workflows agents.

## Key features

- **Unified inventory**: Centralized view of all resources.

- **Fast updates**: Created, updated, or deleted resources appear within 15 minutes.

- **Flexible filtering and sorting**: Filter and sort resources by any attribute.

- **Inventory count**: Instantly see the total number of items matching your criteria.

- **Customizable columns**: Tailor your view by selecting which columns to display.

- **Resource details**: Access detailed information for each resource.

- **Download**: Export your inventory to Excel for further analysis.

## Where to access Power Platform inventory

Power Platform inventory is available through multiple interfaces and APIs, allowing you to integrate inventory data into your workflows and tools of choice. The following sections list the primary ways to access inventory data.

### The Power Platform admin center user interface

- **Manage > Inventory**: The main inventory page provides a unified view of all resources across your tenant.

- **Manage > Copilot Studio**: This page offers a focused view of agents, agent flows, and workflows agents.
- (Microsoft 365 Copilot).

- **Manage > Power Apps > Inventory tab**: This tab offers a focused view of your apps, including those made in Power Apps (canvas apps, model-driven apps, and code apps) and in Microsoft 365 Copilot's App Builder agent.
  
- **Manage > Power Automate > Inventory tab**: This page offers a focused view of your Power Automate cloud flows.

### Programmatic and advanced access

Power Platform inventory data is also available programmatically, supporting advanced scenarios such as automation, reporting, and integration with external tools.

- **Power Platform API**

- **Azure Resource Graph:** Query inventory data using Kusto Query Language (KQL).

  - Azure portal (Resource Graph Explorer)

  - Azure CLI

  - Azure PowerShell

  - REST APIs

More details on programmatic access and sample queries are provided in this article.

## Apply filters and sorts

Power Platform inventory lets you filter and sort across all resource data, using any column or attribute. You can combine multiple filters to zero in on exactly the resources you need, whether you're tracking down a specific app or analyzing trends across environments. As you refine your criteria, the total count of matching resources is always displayed directly above the resource table on the top-left, making it easy to gauge the size of your filtered dataset.

For example, you can filter by:

- **Environment type**: Select the **Environment type** column and select **Default**. You see all resources in the default environment.

- **Owner**: Select the **Owner** column and type the name of the person. You see all resources owned by this person in the default environment.

- **Creation date**: Select the **Created on** column and apply the date filters from January 2025 to today's date. You see all resources owned by this person, in the default environment, that they created in the year 2025.

To clear all filters and sorts, select any column and choose **Clear all filters**.

## Displaying more columns

The inventory table provides the option to display more columns to help you better manage all your items. To customize displayed columns, complete the following steps.

1. Select the **Add or remove columns** icon next to the **Search** box.

1. Select or clear columns you wish to display or hide.

## Search the inventory

Quickly search for keywords across all entries currently loaded in the inventory table. The **Search** box is designed to help you find specific resources fast, but keep in mind that it only searches the items visible in the UI (up to 1,000 at a time). If your inventory exceeds this limit, apply more filters to narrow down the results and bring the resources you need into view.

## View resource or environment details

- Select a resource, then select the **Details** option in the command bar.

- Or select the resource's display name to be redirected to its details page in the Copilot Studio, Power Apps, or Power Automate portal. **Note**: You need sufficient permission to access the resource details page. Without permission, you'll only see a **This link is broken** error.

- Select the environment name to view the environment details.

## Known limitations

- **Classic chatbots:** Classic chatbots aren't included in the new inventory page, but can still be found by selecting **Manage > Copilot Studio > Classic chatbots**.

- **Environment name**: Filtering by environment requires the full environment name. Partial matches or substrings aren't supported.

- **_Modified on_ and _Last modified by_ columns**: These columns are currently nonfunctional for agents and must be populated with the **–** (dash) character.

- **Un-published model-driven apps:** Only published, model-driven apps are captured.
  
- **Model-driven apps in the default environment:** The default environment comes with three preinstalled model-driven apps: Power Platform Environment Settings, Power Pages Management, and Solution Health Hub. These don't appear in the inventory initially unless they're edited and republished.

- The **Owner** column for cloud flows, agent flows, and workflows agents(Microsoft 365 Copilot) is currently populated with the user that created the flow, and isn't yet updated when the owner changes.

- **Desktop flows** from Power Automate aren't yet included in the inventory.

- More resources with names ending in "azshadow" may temporarily be shown when querying Azure Resource Graph directly. These resources can safely be ignored, and are planned to be automatically removed by the end of November 2025.

## Accessing Power Platform inventory data via Power Platform API

If you're new to the Power Platform API, review [Getting Started with Power Platform API](/power-platform/admin/powerplatform-api-getting-started) guide for setup instructions and authentication details. Once you're set up, refer to the Inventory API documentation to learn how to query your inventory data.

## Accessing Power Platform inventory data through Azure

You can programmatically query your Power Platform inventory using Azure Resource Graph (ARG). ARG queries can be accessed through several Azure interfaces. For step-by-step instructions, refer to the official Azure Resource Graph quickstart guides for each method:

- [Run Resource Graph query using Azure portal](/azure/governance/resource-graph/first-query-portal)

- [Run Resource Graph query using Azure CLI](/azure/governance/resource-graph/first-query-azurecli)

- [Run Resource Graph query using Azure PowerShell](/azure/governance/resource-graph/first-query-powershell)

- [Run Azure Resource Graph query using REST API](/azure/governance/resource-graph/first-query-rest-api?tabs=powershell)

## Sample queries

The following are example queries you can use with any of these interfaces.

### Query 1: Total count of _all_ resources

```Kusto
PowerPlatformResources

| count
```

### Query 2: Total counts by resource type

```Kusto
PowerPlatformResources

| summarize count() by type

| order by count\_ desc
```

### Query 3: Counts by environment (inventory distribution across environments)

```Kusto
PowerPlatformResources

| extend pros = parse_json(properties)

| extend environmentId = tostring(pros.environmentId)

| summarize count() by environmentId

| order by count\_ desc
```

### Query 4: Counts by region (inventory distribution across regions)

```Kusto
PowerPlatformResources

| summarize count() by location

| order by count\_ desc
```

### Query 5: Top owners by item count

```Kusto
PowerPlatformResources

| extend pros = parse_json(properties)

| extend ownerId= tostring(pros.ownerId)

| summarize count() by ownerId

| order by count\_ desc
```

### Query 6: Finding a single agent in the tenant

```Kusto
PowerPlatformResources

| where type == "microsoft.copilotstudio/agents"

| where name == "0f9b5e26-a682-f011-b4cc-6045bd0390df"
```

### Query 7: Items created in the past 24 hours

```Kusto
PowerPlatformResources

| extend pros = parse_json(properties)

| extend createdAt= todatetime(pros.createdAt)

| where createdAt \>= ago(24h)
```
