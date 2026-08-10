---
title: Power Platform inventory schema reference
description: Learn about the resource types and fields available in Power Platform inventory, including shared properties, environment fields, and resource-type-specific fields.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: ellenwehrle
ms.date: 08/10/2026
ms.topic: concept-article
ai-usage: ai-assisted
---

# Power Platform inventory schema reference

Power Platform inventory exposes resource data through the PowerPlatformResources table in [Azure Resource Graph](/azure/governance/resource-graph/overview). This article describes the resource types and fields available in that table so you can build targeted queries and understand the data model behind the [Power Platform inventory](power-platform-inventory.md) experience.

For information about querying the table programmatically, see [Power Platform inventory API](inventory-api.md). For the full REST API reference, see the [Power Platform REST API documentation](/rest/api/power-platform/).

## Resource types

Every record in the `PowerPlatformResources` table has a **type** field that identifies the resource type. The following table lists all supported types.

| Display name | `type` value |
|---|---|
| Canvas apps | `microsoft.powerapps/canvasapps` |
| Model-driven apps | `microsoft.powerapps/modeldrivenapps` |
| Code apps | `microsoft.powerapps/codeapps` |
| App Builder apps | `microsoft.powerapps/apps` |
| Cloud flows | `microsoft.powerautomate/cloudflows` |
| Agent flows | `microsoft.powerautomate/agentflows` |
| Workflow agent flows | `microsoft.powerautomate/m365agentflows` |
| Copilot Studio agents | `microsoft.copilotstudio/agents` |
| Connectors | `microsoft.powerplatformconnector/connectors` |
| Environments | `microsoft.powerplatform/environments` |
| Environment groups | `microsoft.powerplatform/environmentgroups` |

## Shared resource fields

All resource types in the PowerPlatformResources table include the following fields.

| User experience name | API field path | Data type | Description | Example | Status |
|---|---|---|---|---|---|
| Item name | `properties.displayName` | string | The display name of the resource. | Expense Report App | Generally available |
| Item type | `type` | string | The resource type identifier (see [Resource types](#resource-types)). | `microsoft.powerapps/canvasapps` | Generally available |
| Item ID | `name` | string | The unique identifier of the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| Location | `location` | string | The geographic region of the resource. | `unitedstates` | Generally available |
| Created on | `properties.createdAt` | datetime | The date and time the resource was created. | `2025-06-01T08:00:00Z` | Generally available |
| Created by | `properties.createdBy` | string | The object ID of the user who created the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |

> [!NOTE]
> The `tenantId` field is also available as a top-level ARM field on every resource record.

## Connector inventory (preview)

Power Platform inventory represents connectors in two related ways:

- **Connectors used by resources**: the connectors and operations that each app, flow, or agent uses, captured as the `properties.powerPlatformConnectors` array. This data also appears as a **Connectors** column across the Power Platform admin center inventory grids: the unified **Manage** > **Inventory** page and the resource-specific views under **Copilot Studio**, **Power Apps**, and **Power Automate**.
- **Connectors as a resource type**: each connector available in your tenant is also its own inventory record, under the `microsoft.powerplatformconnector/connectors` resource type. For its fields, see [Connectors as a resource type](#connectors-as-a-resource-type).

The following resource types emit connector data: canvas apps, model-driven apps, cloud flows, agent flows, workflow agent flows, and Copilot Studio agents (including Microsoft 365 Copilot Agent Builder).

For flows (cloud flows, agent flows, and workflow agent flows), the inventory additionally captures the connector and operation that initiate the flow as `properties.trigger` and `properties.triggerOperation`. These fields complement `powerPlatformConnectors`, which captures the connectors invoked during flow execution.

### Schema

| API field path | Data type | Description | Status |
|---|---|---|---|
| `properties.powerPlatformConnectors` | array | The connectors used by the resource. | Preview |
| `properties.powerPlatformConnectors[].connectorId` | string | The identifier of the connector (for example, `shared_sharepointonline`). | Preview |
| `properties.powerPlatformConnectors[].operations` | array | The operations on the connector that the resource invokes. | Preview |
| `properties.powerPlatformConnectors[].operations[].operationId` | string | The identifier of the operation (for example, `GetItems`). | Preview |

### Example

```json
{
  "type": "microsoft.powerapps/canvasapps",
  "properties": {
    "displayName": "Learning Resources App",
    "powerPlatformConnectors": [
      {
        "connectorId": "shared_sharepointonline",
        "operations": [
          { "operationId": "GetItems" },
          { "operationId": "PostItem" }
        ]
      },
      {
        "connectorId": "shared_office365users",
        "operations": [
          { "operationId": "MyProfile_V2" }
        ]
      }
    ]
  }
}
```

> [!NOTE]
> Copilot Studio agents emit additional per-operation metadata that reflects how agents use connectors as tools or knowledge sources. For details, see [Microsoft Copilot Studio Agent inventory schema](/microsoft-copilot-studio/admin-agent-inventory#connector-properties).

### Connectors as a resource type

Power Platform inventory not only captures connector usage on individual resources but also includes connectors as a resource type, `microsoft.powerplatformconnector/connectors`. Each record represents a connector available in your tenant and lists the operations it exposes, along with publisher and tier metadata.

> [!NOTE]
> Connectors are catalog entities rather than resources created in an environment, so they're an exception to the [shared resource fields](#shared-resource-fields). The **Created on**, **Created by**, and **Location** fields, and owner and environment information, don't apply to connectors. Only **Item name** (`properties.displayName`), **Item type** (`type`), and **Item ID** (`name`) apply.

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.connectorId` | string | The identifier of the connector. | `shared_sharepointonline` | Preview |
| `properties.description` | string | A description of the connector. | `SharePoint helps organizations share and collaborate with colleagues, partners, and customers.` | Preview |
| `properties.publisher` | string | The publisher of the connector. | `Microsoft` | Preview |
| `properties.tier` | string | The licensing tier of the connector, such as `Standard` or `Premium`. | `Standard` | Preview |
| `properties.releaseTag` | string | The release stage of the connector, such as `Production` or `Preview`. | `Production` | Preview |
| `properties.isDeprecated` | boolean | Whether the connector is deprecated. | `false` | Preview |
| `properties.operations` | array | The operations that the connector exposes. | See following rows. | Preview |
| `properties.operations[].operationId` | string | The identifier of the operation. | `GetItems` | Preview |
| `properties.operations[].displayName` | string | The display name of the operation. | `Get items` | Preview |
| `properties.operations[].description` | string | A description of the operation. | `Gets items from a SharePoint list.` | Preview |
| `properties.operations[].method` | string | The HTTP method of the operation. | `GET` | Preview |

### Known limitations

- **Tabular connectors don't report operations.** Connectors bound as data sources (such as SharePoint, Dataverse, SQL Server, and Excel Online) appear in `powerPlatformConnectors` but emit an empty `operations` array.
- **Built-in actions aren't captured.** Built-in actions from Power Automate, such as the HTTP built-in action, Control actions, and Data operations, aren't connectors and don't appear in `powerPlatformConnectors`. This difference often causes confusion: a flow that calls an external service through the HTTP built-in action shows no connector for that call.
- **Code apps, vibe apps, and App Builder apps aren't covered.** Only the resource types listed in this section emit connector data.
- **Model-driven apps rarely report connectors.** Model-driven apps rarely call connectors directly. Connector data only appears when a canvas page is embedded in a model-driven app, and that page's connector usage is captured on the canvas page record itself.
- **No connector display names or tier data.** This release exposes connector IDs and operation IDs only. Display names, tiers (Standard/Premium), and publisher information aren't included.

## Canvas apps

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the app was last modified. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.lastModifiedBy` | string | The object ID of the user who last modified the app. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.isQuarantined` | boolean | Whether the app is quarantined. | `false` | Generally available |
| `properties.powerPlatformConnectors` | array | The connectors and operations used by the app. See [Connector inventory (preview)](#connector-inventory-preview). | See section. | Preview |

## Model-driven apps

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the app was last modified. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.lastModifiedBy` | string | The object ID of the user who last modified the app. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.isQuarantined` | boolean | Whether the app is quarantined. | `false` | Generally available |
| `properties.appModuleId` | string | The Dataverse app module ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.logicalName` | string | The Dataverse logical name of the app. | `contoso_expensereport` | Generally available |
| `properties.powerPlatformConnectors` | array | The connectors and operations used by the app. See [Connector inventory (preview)](#connector-inventory-preview). | See section. | Preview |

> [!NOTE]
> The `properties.powerPlatformConnectors` field rarely returns data for model-driven apps, because model-driven apps don't use connectors directly. Connectors used by embedded canvas pages are captured on the canvas page record instead.

## Code apps

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the app was last modified. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.lastModifiedBy` | string | The object ID of the user who last modified the app. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.isQuarantined` | boolean | Whether the app is quarantined. | `false` | Generally available |
| `properties.subType` | string | The subtype of the code app: `byocApp` or `vibeApp`. | `byocApp` | Generally available |

> [!NOTE]
> The subtype values correspond to [code apps](/power-apps/developer/code-apps/overview) and [vibe apps](/power-apps/vibe/overview), respectively.

## App Builder apps

For more information, see [App Builder](https://www.microsoft.com/power-platform/topics/app-builder).

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the app was last modified. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.lastModifiedBy` | string | The object ID of the user who last modified the app. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.isQuarantined` | boolean | Whether the app is quarantined. | `false` | Generally available |
| `properties.subType` | string | The subtype of the app. Currently `appBuilderApp`. | `appBuilderApp` | Generally available |

## Cloud flows

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the flow was last modified. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.lastModifiedBy` | string | The object ID of the user who last modified the flow. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.workflowEntityId` | string | The Dataverse workflow entity ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.powerPlatformConnectors` | array | The connectors and operations used by the flow. See [Connector inventory (preview)](#connector-inventory-preview). | See section. | Preview |
| `properties.trigger` | string | The connector that initiates the flow. Empty when the trigger isn't connector-based (for example, recurrence or manual). | `sharepointonline` | Preview |
| `properties.triggerOperation` | string | The operation that initiates the flow. | `GetOnNewItems` | Preview |

## Agent flows

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the flow was last modified. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.lastModifiedBy` | string | The object ID of the user who last modified the flow. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.workflowEntityId` | string | The Dataverse workflow entity ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.powerPlatformConnectors` | array | The connectors and operations used by the flow. See [Connector inventory (preview)](#connector-inventory-preview). | See section. | Preview |
| `properties.trigger` | string | The connector that initiates the flow. Empty when the trigger isn't connector-based (for example, recurrence or manual). | `sharepointonline` | Preview |
| `properties.triggerOperation` | string | The operation that initiates the flow. | `GetOnNewItems` | Preview |

## Workflow agent flows

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the flow was last modified. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.lastModifiedBy` | string | The object ID of the user who last modified the flow. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.workflowEntityId` | string | The Dataverse workflow entity ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.powerPlatformConnectors` | array | The connectors and operations used by the flow. See [Connector inventory (preview)](#connector-inventory-preview). | See section. | Preview |
| `properties.trigger` | string | The connector that initiates the flow. Empty when the trigger isn't connector-based (for example, recurrence or manual). | `sharepointonline` | Preview |
| `properties.triggerOperation` | string | The operation that initiates the flow. | `GetOnNewItems` | Preview |

## Copilot Studio agents

Copilot Studio agents have a rich set of properties beyond the shared fields, including core, identity, and configuration properties. For the full schema, see [Microsoft Copilot Studio Agent inventory schema](/microsoft-copilot-studio/admin-agent-inventory).

| API field path | Data type | Description | Example |
|---|---|---|---|
| `properties.isCLIAgent` | boolean | Whether the agent was created through the GitHub Copilot harness. | `true` |

## Environments

For more information about environments, see [Environments overview](environments-overview.md).

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.environmentType` | string | The type of environment: Production, Default, Sandbox, Trial, Developer, or Dataverse for Teams. | `Production` | Generally available |
| `properties.isManaged` | boolean | Whether the environment is a [managed environment](managed-environment-overview.md). | `true` | Generally available |
| `properties.environmentGroup` | string | The name of the environment group, if assigned. | `Finance` | Generally available |
| `properties.environmentGroupId` | string | The identifier of the environment group, if assigned. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the environment was last modified. | `2026-01-15T10:30:00Z` | Generally available |

## Environment groups

For more information, see [Environment groups](environment-groups.md).

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.description` | string | The description of the environment group. | `All finance team environments` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the group was last modified. | `2026-01-15T10:30:00Z` | Generally available |

## Related content

- [Power Platform inventory](power-platform-inventory.md)
- [Power Platform inventory API](inventory-api.md)
- [Power Platform inventory sample queries](inventory-sample-queries.md)
- [Environments overview](environments-overview.md)
- [Environment groups](environment-groups.md)
- [Azure Resource Graph overview](/azure/governance/resource-graph/overview)
- [Kusto Query Language (KQL) overview](/azure/data-explorer/kusto/query/)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
