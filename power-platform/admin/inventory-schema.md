---
title: Power Platform inventory schema reference
description: Learn about the resource types and fields available in Power Platform inventory, including shared properties, environment fields, and resource-type-specific fields.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.date: 03/27/2026
ms.topic: concept-article
---

# Power Platform inventory schema reference

Power Platform inventory exposes resource data through the PowerPlatformResources table in [Azure Resource Graph](/azure/governance/resource-graph/overview). This article describes the resource types and fields available in that table so you can build targeted queries and understand the data model behind the [Power Platform inventory](power-platform-inventory.md) experience.

For information about querying the table programmatically, see [Power Platform inventory API](inventory-api.md). For the full REST API reference, see the [Power Platform REST API documentation](/rest/api/power-platform/).

## Resource types

Every record in the PowerPlatformResources table has a **type** field that identifies the resource type. The following table lists all supported types.

| Display name | `type` value |
|---|---|
| Canvas apps | `microsoft.powerapps/canvasapps` |
| Model-driven apps | `microsoft.powerapps/modeldrivenapps` |
| Code apps | `microsoft.powerapps/codeapps` |
| Cloud flows | `microsoft.powerautomate/cloudflows` |
| Agent flows | `microsoft.powerautomate/agentflows` |
| Copilot Studio agents | `microsoft.copilotstudio/agents` |
| Environments | `microsoft.powerplatform/environments` |
| Environment groups | `microsoft.powerplatform/environmentgroups` |

## Shared resource fields

The following fields are available on all resource types in the PowerPlatformResources table.

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

## Canvas apps

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the app was last modified. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.lastModifiedBy` | string | The object ID of the user who last modified the app. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.isQuarantined` | boolean | Whether the app is quarantined. | `false` | Generally available |

> [!NOTE]
> The `properties.isQuarantined` field is available through the API but isn't yet shown in the Power Platform admin center inventory experience.

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

> [!NOTE]
> The `properties.isQuarantined` field is available through the API but isn't yet shown in the Power Platform admin center inventory experience.

## Code apps

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the app was last modified. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.lastModifiedBy` | string | The object ID of the user who last modified the app. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.isQuarantined` | boolean | Whether the app is quarantined. | `false` | Generally available |
| `properties.subType` | string | The subtype of the code app: `byocApp`, `vibeApp`, or `appBuilderApp`. | `byocApp` | Generally available |

> [!NOTE]
> The subtype values correspond to [code apps](/power-apps/developer/code-apps/overview), [vibe apps](/power-apps/vibe/overview), and [app builder apps](https://www.microsoft.com/power-platform/topics/app-builder), respectively.

> [!NOTE]
> The `properties.isQuarantined` field is available through the API but isn't yet shown in the Power Platform admin center inventory experience.

## Cloud flows

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the flow was last modified. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.lastModifiedBy` | string | The object ID of the user who last modified the flow. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.workflowEntityId` | string | The Dataverse workflow entity ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |

## Agent flows

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastModifiedAt` | datetime | The date and time the flow was last modified. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.lastModifiedBy` | string | The object ID of the user who last modified the flow. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.workflowEntityId` | string | The Dataverse workflow entity ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |

## Copilot Studio agents

Copilot Studio agents have a rich set of properties beyond the shared fields. These are organized into the following categories.

### Core properties

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.ownerId` | string | The object ID of the resource owner. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.environmentId` | string | The identifier of the environment that contains the resource. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available |
| `properties.lastPublishedAt` | datetime | The date and time the agent was last published. Empty if the agent is still in draft. | `2026-01-15T10:30:00Z` | Generally available |
| `properties.createdIn` | string | The authoring tool where the agent was created: `Copilot Studio` or `Microsoft 365 Copilot Agent Builder`. | `Copilot Studio` | Generally available |
| `properties.schemaName` | string | The Dataverse schema name. Available for Copilot Studio agents and declarative agents only. | `cr5e3_agentName` | Generally available |
| `properties.isQuarantined` | boolean | Whether the agent is quarantined. | `false` | Preview |
| `properties.quarantinedAt` | datetime | The date and time the agent was last quarantined. | `2026-02-01T08:00:00Z` | Preview |
| `properties.isManaged` | boolean | Whether the agent is part of a managed solution. | `false` | Preview |

### Identity properties

| API field path | Data type | Description | Example | Status | Available for |
|---|---|---|---|---|---|
| `properties.botId` | string | The CDS bot ID in the environment. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available | All |
| `properties.entraAppId` | string | The Entra App Registration ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available | Copilot Studio agents, Declarative agents |
| `properties.entraAgentId` | string | The Entra Agent Identity ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available | Copilot Studio agents, Declarative agents |
| `properties.entraAgentBlueprintId` | string | The Entra Agent Blueprint ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available | Copilot Studio agents, Declarative agents |

> [!NOTE]
> The `entraAppId` field is a legacy identifier. Newer agents use `entraAgentId` and `entraAgentBlueprintId` instead. None of these identity properties apply to Copilot Studio Lite agents.

### Configuration properties

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.orchestration` | string | The orchestration mode of the agent: `Classic` or `Generative`. | `Generative` | Preview |
| `properties.model` | string | The AI model used by the agent. | `gpt-4o` | Preview |
| `properties.authentication` | string | The authentication mode configured for the agent (see [Authentication modes](#authentication-modes)). | `Microsoft Entra` | Preview |
| `properties.channels` | array | The channels the agent is published to (see [Supported channels](#supported-channels)). | `["Teams","SharePoint"]` | Preview |

#### Authentication modes

The following values are possible for the `properties.authentication` field.

| Value | Description |
|---|---|
| `None` | No authentication required. |
| `Microsoft Entra` | Authentication via Microsoft Entra ID. |
| `Generic OAuth 2.0` | Authentication via a generic OAuth 2.0 provider. |

#### Supported channels

The following values can appear in the `properties.channels` array.

| Channel |
|---|
| Teams |
| Microsoft 365 Copilot |
| SharePoint |
| Direct Line |
| Dynamics 365 |
| Facebook |
| WhatsApp |

## Environments

For more information about environments, see [Environments overview](environments-overview.md).

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.environmentType` | string | The type of environment: Production, Default, Sandbox, Trial, Developer, or Dataverse for Teams. | `Production` | Generally available |
| `properties.isManaged` | boolean | Whether the environment is a [Managed Environment](managed-environment-overview.md). | `true` | Generally available |
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
- [Environments overview](environments-overview.md)
- [Environment groups](environment-groups.md)
- [Azure Resource Graph overview](/azure/governance/resource-graph/overview)
- [Kusto Query Language (KQL) overview](/azure/data-explorer/kusto/query/)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
