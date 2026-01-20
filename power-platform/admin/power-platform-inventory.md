---
title: Power Platform inventory (preview)
description: Learn how to get a comprehensive, unified view of all agents, apps, and flows across your organization in Power Platform.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.date: 01/20/2026
ms.topic: concept-article

---

# Power Platform inventory (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

The Power Platform admin center now offers tenant administrators a comprehensive, unified view of all key resources&mdash;agents, apps, and flows&mdash;across their organization with Power Platform inventory. With this centralized inventory, administrators can effortlessly discover, search, filter, and sort their resources to streamline common administrative tasks.

Power Platform inventory allows you to easily complete the following tasks:

- **Spot your champions**: Quickly identify who's creating the most resources so you can recognize, nurture, and empower your top innovators.

- **Enforce compliance standards**: Effortlessly detect resources created in nonapproved regions to maintain adherence to organizational policies.

- **Focus your governance**: Rank environments by resource count to focus security, governance, and compliance efforts where they matter most.

- **Prevent orphaned agents**: Proactively find resources owned by departing users to allow seamless ownership transfers and ensure business continuity.

- **Accelerate support**: Instantly pinpoint that _needle in a haystack_ resource referenced in a support ticket to dramatically improve response times.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Supported resource types

The Power Platform inventory includes:

- **Agents:** All agents created in Copilot Studio, and all agents created in Microsoft 365 Copilot Agent Builder.

- **Apps:** All apps created in Power Apps (canvas, model-driven, code, and vibe) and in Microsoft 365 Copilot's App Builder agent.

- **Flows:** All agent flows created in Copilot Studio, all cloud flows created in Power Automate, and all workflows created in Microsoft 365 Copilot's Workflows agent.

## Key features

- **Unified inventory**: Centralized view of all resources.

- **Fast updates**: Created, updated, or deleted resources appear within 15 minutes.

- **Flexible filtering and sorting**: Filter and sort resources by any attribute.

- **Inventory count**: Instantly see the total number of items matching your criteria.

- **Customizable columns**: Tailor your view by selecting which columns to display.

- **Resource details**: Access detailed information for each resource.

- **Download**: Export your inventory to Excel for further analysis.

## Access requirements

To view the Power Platform inventory, you must hold one of the following tenant-wide administrative roles: [Power Platform administrator](/power-platform/admin/use-service-admin-role-manage-tenant#power-platform-administrator) or [Dynamics 365 administrator](/power-platform/admin/use-service-admin-role-manage-tenant#dynamics-365-administrator). If you do not have one of these roles, you can't access the inventory.

## Where to access Power Platform inventory

Power Platform inventory is available through multiple interfaces and APIs, allowing you to integrate inventory data into your workflows and tools of choice. The following sections list the primary ways to access inventory data.

### The Power Platform admin center user interface

- **Manage > Inventory**: The main inventory page provides a unified view of all resources across your tenant.

- **Manage > Copilot Studio:** Agents (Copilot Studio + Microsoft 365 Copilot Agent Builder), agent flows, and workflows

- **Manage > Power Apps > App Inventory tab**: Canvas, model-driven, code, vibe, and App Builder apps

- **Manage > Power Automate > Flow Inventory tab**: Cloud flows

For programmatic access options, see [Programmatic access](#programmatic-access) later in this article.

## Apply filters and sorts

Power Platform inventory lets you filter and sort across all resource data, using any column or attribute. You can combine multiple filters to zero in on exactly the resources you need, whether you're tracking down a specific app or analyzing trends across environments. As you refine your criteria, the total count of matching resources is always displayed directly above the resource table on the top-left, making it easy to gauge the size of your filtered dataset.

For example, you can combine multiple filters to narrow down your results. Each filter you add is cumulative:

1. **Environment type**: Select the **Environment type** column and select **Default**. You see all resources in the default environment.

2. **Owner**: Select the **Owner** column and type the name of the person. You see all resources owned by this person in the default environment.

3. **Creation date**: Select the **Created on** column and apply the date filters from January 2025 to today's date. You see all resources owned by this person, in the default environment, that they created in the year 2025.

To clear all filters and sorts, select any column and choose **Clear all filters**.

## Displaying more columns

The inventory table provides the option to display more columns to help you better manage all your resources. To customize displayed columns, complete the following steps.

1. Select the **Add or remove columns** icon next to the **Search** box.

1. Select or clear columns you wish to display or hide.

## Search the inventory

Quickly search for keywords across all entries currently loaded in the inventory table. The **Search** box is designed to help you find specific resources fast.

> [!NOTE]
> The search only applies to resources visible in the user interface (up to 1,000 at a time). If your inventory exceeds this limit, apply filters to narrow down the results and bring the resources you need into view.

## View resource details

- Select a resource, then select the **Details** option in the command bar.

- Or select the resource's display name to be redirected to its details page in the Copilot Studio, Power Apps, or Power Automate portal. **Note**: You need sufficient permission to access the resource details page. Without permission, you'll only see a **This link is broken** error.

- Select the environment name to view the environment details.

## Known limitations

- **Classic chatbots:** Classic chatbots aren't included in the new inventory page, but can still be found by selecting **Manage > Copilot Studio > Classic chatbots**.

- **Environment name**: Filtering by environment requires the full environment name. Partial matches or substrings aren't supported.

- **_Modified on_ and _Last modified by_ columns**: These columns are currently nonfunctional for agents and are populated with the **–** (dash) character.

- **_Owner_ column**: This column for cloud flows and agent flows is currently populated with the user that created the flow, and isn't yet updated when the owner changes.

- **Un-published model-driven apps:** Only published, model-driven apps are captured.
  
- **Model-driven apps in the default environment:** The default environment comes with three pre-installed model-driven apps: Power Platform Environment Settings, Power Pages Management, and Solution Health Hub. These don't appear in the inventory initially unless they are edited and re-published.

## Programmatic access

Power Platform inventory data is available programmatically, supporting advanced scenarios such as automation, reporting, and integration with external tools.

### Power Platform API

If you're new to the Power Platform API, review [Getting Started with Power Platform API](/power-platform/admin/powerplatform-api-getting-started) for setup instructions and authentication details. Once you're set up, refer to the [Inventory API documentation](/power-platform/admin/inventory-api) to learn how to query your inventory data.

### Azure Resource Graph

You can programmatically query your Power Platform inventory using Azure Resource Graph (ARG). ARG queries can be accessed through several Azure interfaces. For step-by-step instructions, refer to the official Azure Resource Graph quickstart guides for each method:

- [Run Resource Graph query using Azure portal](/azure/governance/resource-graph/first-query-portal)

- [Run Resource Graph query using Azure CLI](/azure/governance/resource-graph/first-query-azurecli)

- [Run Resource Graph query using Azure PowerShell](/azure/governance/resource-graph/first-query-powershell)

- [Run Azure Resource Graph query using REST API](/azure/governance/resource-graph/first-query-rest-api?tabs=powershell)

### Sample queries

The following are example queries you can use with any of the Azure Resource Graph interfaces. All queries use the **PowerPlatformResources** table, which contains your organization's inventory data.

#### Query 1: Total count of _all_ resources

```Kusto
PowerPlatformResources
| count
```

#### Query 2: Total counts by resource type

```Kusto
PowerPlatformResources
| summarize resourceCount = count() by type
| order by resourceCount
```

#### Query 3: Discover available fields for a resource type

The inventory schema evolves over time as new data fields are added. Use this query to see all available fields for a specific resource type. This is the recommended way to stay up to date with available data.

```Kusto
// Discover all available fields for Copilot Studio agents
PowerPlatformResources
| where type == "microsoft.copilotstudio/agents"
| take 1
// Parse the properties bag
| extend properties = parse_json(properties)
// Pack the base fields into a bag for expansion
| extend baseFields = pack("id", id, "location", location, "name", name, "tenantId", tenantId, "type", type)
| extend key = bag_keys(baseFields)
| mv-expand key to typeof(string)
| project FieldName = key, SampleValue = baseFields[key], Source = "base"
// Union with the extended properties
| union (
    PowerPlatformResources
    | where type == "microsoft.copilotstudio/agents"
    | take 1
    | extend properties = parse_json(properties)
    | extend key = bag_keys(properties)
    | mv-expand key to typeof(string)
    | project FieldName = key, SampleValue = properties[key], Source = "properties"
)
// Sort base fields first, then properties
| order by Source asc, FieldName asc
```

To discover fields for other resource types, replace the `type` filter value:

| Resource type | Type filter value |
|---------------|-------------------|
| Copilot Studio agents | `microsoft.copilotstudio/agents` |
| Power Apps | `microsoft.powerplatform/appassets` |
| Power Automate flows | `microsoft.powerplatform/flowassets` |

> [!NOTE]
> This query requires at least one resource of the specified type to exist in your tenant.

#### Query 4: Counts by environment (inventory distribution across environments)

```Kusto
PowerPlatformResources
| extend properties = parse_json(properties)
| extend environmentId = tostring(properties.environmentId)
| summarize resourceCount = count() by environmentId
| order by resourceCount desc
```

#### Query 5: Counts by region (inventory distribution across regions)

```Kusto
PowerPlatformResources
| summarize resourceCount = count() by location
| order by resourceCount desc
```

#### Query 6: Top owners by item count

```Kusto
PowerPlatformResources
| extend properties = parse_json(properties)
| extend ownerId = tostring(properties.ownerId)
| summarize resourceCount = count() by ownerId
| order by resourceCount desc
```

#### Query 7: Finding a single agent in the tenant

```Kusto
PowerPlatformResources
| where type == "microsoft.copilotstudio/agents"
| where name == "[Enter the agent's ID]"
```

> [!TIP]
> The agent's ID can be found in the Copilot Studio URL when viewing the agent, or in the **Name** column of the inventory table.

#### Query 8: Items created in the past 24 hours

```Kusto
PowerPlatformResources
| extend properties = parse_json(properties)
| extend createdAt = todatetime(properties.createdAt)
| where createdAt >= ago(24h)
```
