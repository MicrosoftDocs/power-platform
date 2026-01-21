---
title: Power Platform inventory API (preview)
description: Learn how to get a comprehensive, unified view of all agents and apps across your organization in Power Platform with the inventory API.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.date: 01/20/2026
ms.topic: concept-article
---

# Power Platform inventory API (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

The inventory API allows you to execute structured queries against Azure Resource Graph using a POST request with a query specification in the request body. The API translates your query specification into [Kusto Query Language (KQL)](/azure/data-explorer/kusto/query/) for execution against Azure Resource Graph. The inventory API for [Resources](/rest/api/power-platform/resourcequery/resources) is part of the [Power Platform API reference documentation](/rest/api/power-platform/).

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## API endpoint

```json

POST {PowerPlatformAPI url}/resourcequery/resources/query?api-version=2024-10-01
```

### Request body

The request body must contain a query specification with the following structure:

## Query request structure

```json
{
  "TableName": "string",
  "Clauses": [
    {
      "$type": "clause_type",
      // clause-specific properties
    }
  ],
  "Options": {
    "Top": 100,
    "Skip": 0,
    "SkipToken": "string"
  }
}
```

### Properties

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| `TableName` | string | Yes | The target table/resource type to query (i.e., "PowerPlatformResources") |
| `Clauses` | array | Yes | Array of query clauses that define the operations to perform |
| `Options` | object | No | Azure Resource Graph query options for pagination and result control |

### Query options

The `Options` object supports Azure Resource Graph query parameters for pagination and result control. See [`ResourceQueryRequestOptions` documentation](/dotnet/api/azure.resourcemanager.resourcegraph.models.resourcequeryrequestoptions) to learn more.

## Supported query clauses

The API supports the clause types highlighted in this section through polymorphic JSON serialization. Each clause type corresponds to KQL operators as documented in the [KQL reference](/azure/data-explorer/kusto/query/):

### 1. Where clause

Filters data based on field conditions. Translates to the KQL [`where` operator](/azure/data-explorer/kusto/query/whereoperator).

```json
{
  "$type": "where",
  "FieldName": "string",
  "Operator": "string",
  "Values": ["string1", "string2"]
}
```

**Supported operators:**
The API supports all standard KQL comparison and string operators. For a complete list of available operators, see the [KQL string operators](/azure/data-explorer/kusto/query/datatypes-string-operators) and [numerical operators](/azure/data-explorer/kusto/query/numoperators) documentation.

**Example:**

```json
{
  "$type": "where",
  "FieldName": "type",
  "Operator": "in~",
  "Values": ["'microsoft.powerapps/canvasapps'", "'microsoft.copilotstudio/agents'"]
}
```

*Translates to KQL:* `| where type in~ ('microsoft.powerapps/canvasapps', 'microsoft.copilotstudio/agents')`

### 2. Project clause

Selects specific fields from the results. Translates to the KQL [`project` operator](/azure/data-explorer/kusto/query/projectoperator).

```json
{
  "$type": "project",
  "FieldList": ["field1", "field2", "field3"]
}
```

**Example:**

```json
{
  "$type": "project",
  "FieldList": [
    "name", 
    "properties.displayName", 
    "environmentId = tostring(properties.environmentId)",
    "createdDate = properties.createdAt"
  ]
}
```

*Translates to KQL:* `| project name, properties.displayName, environmentId = tostring(properties.environmentId), createdDate = properties.createdAt`

### 3. Take clause

Limits the number of results returned. Translates to the KQL [`take` operator](/azure/data-explorer/kusto/query/takeoperator).

```json
{
  "$type": "take",
  "TakeCount": 50
}
```

*Translates to KQL:* `| take 50`

### 4. Order by clause

Sorts results by specified fields. Translates to the KQL [`sort` operator](/kusto/query/sort-operator?view=azure-data-explorer&preserve-view=true).

```json

{
  "$type": "orderby",
  "FieldNamesAscDesc": {
    "field1": "asc",
    "field2": "desc"
  }
}
```

**Example:**

```json
{
  "$type": "orderby",
  "FieldNamesAscDesc": {
    "tostring(properties.createdAt)": "desc",
    "properties.displayName": "asc"
  }
}
```

*Translates to KQL:* `| sort by tostring(properties.createdAt) desc, properties.displayName asc`

### 5. Distinct clause

Returns unique values for specified fields. Translates to the KQL [`distinct` operator](/azure/data-explorer/kusto/query/distinctoperator).

```json

{
  "$type": "distinct",
  "FieldList": ["field1", "field2"]
}
```

*Translates to KQL:* `| distinct field1, field2`

### 6. Count clause

Returns the count of matching records. Translates to the KQL [`count` operator](/azure/data-explorer/kusto/query/countoperator).

```json
{
  "$type": "count"
}
```

*Translates to KQL:* `| count`

### 7. Summarize clause

Aggregates data using count or argmax operations. Translates to the KQL [`summarize` operator](/azure/data-explorer/kusto/query/summarizeoperator).

```json
{
  "$type": "summarize",
  "SummarizeClauseExpression": {
    "OperatorName": "count|argmax",
    "OperatorFieldName": "string",
    "FieldList": ["field1", "field2"]
  }
}
```

**Supported operators:**

- `count` → [`count()`](/azure/data-explorer/kusto/query/count-aggfunction) - Count records grouped by specified fields.
- `argmax` → [`arg_max()`](/azure/data-explorer/kusto/query/arg-max-aggfunction) - Get records with maximum value in the specified field.

**Count example:**

```json
{
  "$type": "summarize",
  "SummarizeClauseExpression": {
    "OperatorName": "count",
    "OperatorFieldName": "resourceCount",
    "FieldList": ["resourceGroup", "type"]
  }
}
```

*Translates to KQL:* `| summarize resourceCount = count() by resourceGroup, type`

**ArgMax example:**

```json
{
  "$type": "summarize",
  "SummarizeClauseExpression": {
    "OperatorName": "argmax",
    "OperatorFieldName": "createdTime",
    "FieldList": ["resourceGroup"]
  }
}
```

*Translates to KQL:* `| summarize arg_max(createdTime, *) by resourceGroup`

### 8. Extend clause

Adds computed columns to the results. Translates to the KQL [`extend` operator](/azure/data-explorer/kusto/query/extendoperator).

```json
{
  "$type": "extend",
  "FieldName": "newFieldName",
  "Expression": "KQL_EXPRESSION"
}
```

**Example:**

```json
{
  "$type": "extend",
  "FieldName": "environmentId",
  "Expression": "tostring(properties.environmentId)"
}
```

*Translates to KQL:* `| extend environmentId = tostring(properties.environmentId)`https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/scalarfunctions) for available functions.

### 9. Join clause

Joins with another table/subquery. Translates to the KQL [`join` operator](/azure/data-explorer/kusto/query/joinoperator).

```json

{
  "$type": "join",
  "RightTable": {
    "TableName": "string",
    "Clauses": []
  },
  "JoinKind": "string",
    "LeftColumnName": "string",
  "RightColumnName": "string"
}
```

**Supported join kinds:**
The API supports all KQL join kinds. For a complete list of available join types and their behavior, see the [KQL join operator documentation](/azure/data-explorer/kusto/query/joinoperator).

**Example (joining Power Platform resources with environment information):**

```json
{
  "$type": "join",
  "JoinKind": "leftouter",
  "RightTable": {
    "TableName": "PowerPlatformResources",
    "Clauses": [
      {
        "$type": "where",
        "FieldName": "type",
        "Operator": "==",
        "Values": ["'microsoft.powerplatform/environments'"]
      },
      {
        "$type": "project",
        "FieldList": [
          "environmentId = name",
          "environmentName = properties.displayName",
          "environmentRegion = location",
          "environmentType = properties.environmentType",
          "isManagedEnvironment = properties.isManaged"
        ]
      }
    ]
  },
  "LeftColumnName": "environmentId",
  "RightColumnName": "environmentId"
}
```

*Translates to KQL:* `| join kind=leftouter (PowerPlatformResources | where type == 'microsoft.powerplatform/environments' | project environmentId = name, environmentName = properties.displayName, environmentRegion = location, environmentType = properties.environmentType, isManagedEnvironment = properties.isManaged) on $left.environmentId == $right.environmentId`

## Complete query examples

### Example 1: Basic Power Platform resource query (PPAC default pattern)

Get all Power Platform resources with environment information—this is the default query used by Power Platform Admin Center.

```json
{
  "Options": {
    "Top": 1000,
    "Skip": 0,
    "SkipToken": ""
  },
  "TableName": "PowerPlatformResources",
  "Clauses": [
    {
      "$type": "extend",
      "FieldName": "joinKey",
      "Expression": "tolower(tostring(properties.environmentId))"
    },
    {
      "$type": "join",
      "JoinKind": "leftouter",
      "RightTable": {
        "TableName": "PowerPlatformResources",
        "Clauses": [
          {
            "$type": "where",
            "FieldName": "type",
            "Operator": "==",
            "Values": ["'microsoft.powerplatform/environments'"]
          },
            {
            "$type": "project",
            "FieldList": [
              "joinKey = tolower(name)",
              "environmentName = properties.displayName",
              "environmentRegion = location",
              "environmentType = properties.environmentType",
              "isManagedEnvironment = properties.isManaged"
            ]
          }
        ]
      },
      "LeftColumnName": "joinKey",
      "RightColumnName": "joinKey"
    },
    {
      "$type": "where",
      "FieldName": "type",
      "Operator": "in~",
      "Values": [
        "'microsoft.powerapps/canvasapps'",
        "'microsoft.powerapps/modeldrivenapps'",
        "'microsoft.powerautomate/cloudflows'",
        "'microsoft.copilotstudio/agents'",
        "'microsoft.powerautomate/agentflows'",
        "'microsoft.powerapps/codeapps'"
      ]
    },
    {
      "$type": "orderby",
      "FieldNamesAscDesc": {
        "tostring(properties.createdAt)": "desc"
      }
    }
  ]
}
```

*Equivalent KQL:*

```kql
PowerPlatformResources
| extend joinKey = tolower(tostring(properties.environmentId))
| join kind=leftouter (
    PowerPlatformResources
    | where type == 'microsoft.powerplatform/environments'
    | project joinKey = tolower(name), environmentName = properties.displayName, environmentRegion = location, environmentType = properties.environmentType, isManagedEnvironment = properties.isManaged
  ) on $left.joinKey == $right.joinKey
| where type in~ ('microsoft.powerapps/canvasapps', 'microsoft.powerapps/modeldrivenapps', 'microsoft.powerautomate/cloudflows', 'microsoft.copilotstudio/agents', 'microsoft.powerautomate/agentflows', 'microsoft.powerapps/codeapps')
| order by tostring(properties.createdAt) desc
```

### Example 2: Count Power Platform resources by type and location

```json
{
  "TableName": "PowerPlatformResources",
  "Clauses": [
    {
      "$type": "summarize",
      "SummarizeClauseExpression": {
        "OperatorName": "count",
        "OperatorFieldName": "resourceCount",
        "FieldList": ["type", "location"]
      }
    },
    {
      "$type": "orderby",
      "FieldNamesAscDesc": {
        "resourceCount": "desc"
      }
    }
  ]
}
```
*Equivalent KQL:*

```kql
PowerPlatformResources
| summarize resourceCount = count() by type, location
| sort by resourceCount desc
```

### Example 3: Simple canvas apps query

Get canvas apps with basic filtering and projection:

```json
{
  "TableName": "PowerPlatformResources",
  "Clauses": [
    {
      "$type": "where",
      "FieldName": "type",
      "Operator": "==",
      "Values": ["'microsoft.powerapps/canvasapps'"]
    },
    {
      "$type": "project",
      "FieldList": [
        "name",
        "location",
        "properties.displayName",
        "properties.createdAt",
        "properties.environmentId"
      ]
    },
    {
      "$type": "take",
      "TakeCount": 100
    }
  ]
}
```

*Equivalent KQL:*

```kql
PowerPlatformResources
| where type == 'microsoft.powerapps/canvasapps'
| project name, location, properties.displayName, properties.createdAt, properties.environmentId
| take 100
```

### Example 4: Filter resources by environment and date range

```json
{
  "TableName": "PowerPlatformResources",
  "Clauses": [
    {
      "$type": "where",
      "FieldName": "type",
      "Operator": "==",
      "Values": ["'microsoft.powerapps/canvasapps'"]
    },
    {
      "$type": "where",
      "FieldName": "properties.environmentId",
      "Operator": "==",
      "Values": ["your-environment-id"]
    },
    {
      "$type": "extend",
      "FieldName": "createdDate",
      "Expression": "todatetime(properties.createdAt)"
    },
    {
      "$type": "where",
      "FieldName": "createdDate",
      "Operator": ">=",
      "Values": ["datetime(2024-01-01)"]
    },
    {
      "$type": "project",
      "FieldList": [
        "name",
        "properties.displayName",
        "properties.createdAt",
        "properties.createdBy",
        "properties.ownerId"
      ]
    },
    {
      "$type": "orderby",
      "FieldNamesAscDesc": {
        "createdDate": "desc"
      }
    }
  ]
}
```

*Translates to KQL:*

```kql
PowerPlatformResources
| where type == 'microsoft.powerapps/canvasapps'
| where properties.environmentId == "your-environment-id"
| extend createdDate = todatetime(properties.createdAt)
| where createdDate >= datetime(2024-01-01)
| project name, properties.displayName, properties.createdAt, properties.createdBy, properties.ownerId
| sort by createdDate desc
```

## Response format

The API returns a [`ResourceQueryResult`](/dotnet/api/azure.resourcemanager.resourcegraph.models.resourcequeryresult) object from the Azure Resource Graph SDK. This object contains the query results and metadata about the query execution.

**Response structure:**

```json
{
  "totalRecords": 1250,
  "count": 50,
  "resultTruncated": 1,
  "skipToken": "string_for_next_page",
  "data": [
    // Array of result objects based on your query
  ]
}
```
