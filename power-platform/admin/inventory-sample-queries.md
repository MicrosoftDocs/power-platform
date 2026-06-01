---
title: Power Platform inventory sample queries
description: Sample Kusto Query Language (KQL) queries you can run against Power Platform inventory data in Azure Resource Graph, including queries for resource counts, field discovery, resource lookups, and connector usage.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.date: 05/28/2026
ms.topic: concept-article
---

# Power Platform inventory sample queries

The following sample queries run against the **PowerPlatformResources** table in [Azure Resource Graph](/azure/governance/resource-graph/overview). They cover resource counting and distribution, field discovery, resource lookups, and connector usage analysis. For an overview of Power Platform inventory, see [Power Platform inventory](power-platform-inventory.md). For the schema and field reference, see [Power Platform inventory schema reference](inventory-schema.md).

## How to run these queries

You can run any of these queries from the Azure Resource Graph interfaces. For step-by-step instructions, see the following quickstart guides:

- [Run Resource Graph query using Azure portal](/azure/governance/resource-graph/first-query-portal)
- [Run Resource Graph query using Azure CLI](/azure/governance/resource-graph/first-query-azurecli)
- [Run Resource Graph query using Azure PowerShell](/azure/governance/resource-graph/first-query-powershell)
- [Run Azure Resource Graph query using REST API](/azure/governance/resource-graph/first-query-rest-api?tabs=powershell)

## Counts and distribution

### Total count of all resources

```Kusto
PowerPlatformResources
| count
```

### Total counts by resource type

```Kusto
PowerPlatformResources
| summarize resourceCount = count() by type
| order by resourceCount
```

### Counts by environment

```Kusto
PowerPlatformResources
| extend properties = parse_json(properties)
| extend environmentId = tostring(properties.environmentId)
| summarize resourceCount = count() by environmentId
| order by resourceCount desc
```

### Counts by region

```Kusto
PowerPlatformResources
| summarize resourceCount = count() by location
| order by resourceCount desc
```

### Top owners by item count

```Kusto
PowerPlatformResources
| extend properties = parse_json(properties)
| extend ownerId = tostring(properties.ownerId)
| summarize resourceCount = count() by ownerId
| order by resourceCount desc
```

## Resource lookups

### Find a single agent in the tenant

```Kusto
PowerPlatformResources
| where type == "microsoft.copilotstudio/agents"
| where name == "[Enter the agent's ID]"
```

> [!TIP]
> You can find the agent's ID in the Copilot Studio URL when viewing the agent, or in the **Name** column of the inventory table.

### Items created in the past 24 hours

```Kusto
PowerPlatformResources
| extend properties = parse_json(properties)
| extend createdAt = todatetime(properties.createdAt)
| where createdAt >= ago(24h)
```

## Connector queries (preview)

The following queries analyze connector usage across the resource types covered by [Connector inventory (preview)](inventory-schema.md#connector-inventory-preview). Each query operates on the `properties.powerPlatformConnectors` array emitted by canvas apps, model-driven apps, cloud flows, agent flows, workflow agent flows, and Copilot Studio agents.

### Top connectors used across Power Platform resources

Lists the connectors used by the most distinct resources. Useful for understanding which connectors dominate adoption across the tenant.

```Kusto
PowerPlatformResources
| where type in (
    "microsoft.powerapps/canvasapps",
    "microsoft.powerapps/modeldrivenapps",
    "microsoft.powerautomate/cloudflows",
    "microsoft.powerautomate/agentflows",
    "microsoft.powerautomate/m365agentflows",
    "microsoft.copilotstudio/agents")
| extend properties = parse_json(properties)
| mv-expand connector = properties.powerPlatformConnectors
| extend connectorId = tostring(connector.connectorId)
| where isnotempty(connectorId)
| summarize ResourceCount = dcount(name) by connectorId
| order by ResourceCount desc
| take 10
```

### Distribution of connector count per resource

Shows how many resources use 0, 1, 2, or more connectors. Useful for spotting complexity outliers.

```Kusto
PowerPlatformResources
| where type in (
    "microsoft.powerapps/canvasapps",
    "microsoft.powerapps/modeldrivenapps",
    "microsoft.powerautomate/cloudflows",
    "microsoft.powerautomate/agentflows",
    "microsoft.powerautomate/m365agentflows",
    "microsoft.copilotstudio/agents")
| extend properties = parse_json(properties)
| extend connectorCount = array_length(properties.powerPlatformConnectors)
| summarize ResourceCount = count() by toint(connectorCount)
| order by connectorCount asc
```

### Find all resources that use a specific connector

Replace `shared_sharepointonline` with the connector you want to search for. This query is useful for impact analysis when a connector has a known issue, is being deprecated, or requires new licensing.

```Kusto
PowerPlatformResources
| where type in (
    "microsoft.powerapps/canvasapps",
    "microsoft.powerapps/modeldrivenapps",
    "microsoft.powerautomate/cloudflows",
    "microsoft.powerautomate/agentflows",
    "microsoft.powerautomate/m365agentflows",
    "microsoft.copilotstudio/agents")
| extend properties = parse_json(properties)
| mv-expand connector = properties.powerPlatformConnectors
| where tostring(connector.connectorId) == "shared_sharepointonline"
| project resourceName = tostring(properties.displayName),
          resourceId = name,
          resourceType = type,
          environmentId = tostring(properties.environmentId),
          operationsUsed = connector.operations
```

### Connector usage by environment

Lists every connector used in every environment, with the count of distinct resources that use it. This list is useful for understanding adoption patterns and informing DLP policy decisions.

```Kusto
PowerPlatformResources
| where type in (
    "microsoft.powerapps/canvasapps",
    "microsoft.powerapps/modeldrivenapps",
    "microsoft.powerautomate/cloudflows",
    "microsoft.powerautomate/agentflows",
    "microsoft.powerautomate/m365agentflows",
    "microsoft.copilotstudio/agents")
| extend properties = parse_json(properties)
| mv-expand connector = properties.powerPlatformConnectors
| extend connectorId = tostring(connector.connectorId)
| where isnotempty(connectorId)
| extend environmentId = tostring(properties.environmentId)
| summarize ResourceCount = dcount(name) by environmentId, connectorId
| order by environmentId asc, ResourceCount desc
```

## Related content

- [Power Platform inventory](power-platform-inventory.md)
- [Power Platform inventory schema reference](inventory-schema.md)
- [Power Platform inventory API](inventory-api.md)
- [Azure Resource Graph overview](/azure/governance/resource-graph/overview)
- [Kusto Query Language (KQL) overview](/azure/data-explorer/kusto/query/)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
