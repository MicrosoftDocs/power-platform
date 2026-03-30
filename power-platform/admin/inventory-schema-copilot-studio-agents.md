---
title: Copilot Studio agents inventory schema
description: Learn about the fields available for Copilot Studio agents in Power Platform inventory, including core, identity, and configuration properties.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.date: 03/30/2026
ms.topic: concept-article
---

# Copilot Studio agents inventory schema

This article describes the fields specific to Copilot Studio agents (`microsoft.copilotstudio/agents`) in the Power Platform inventory. For shared fields available on all resource types, see [Power Platform inventory schema reference](inventory-schema.md). For an overview of the inventory feature, see [Power Platform inventory](power-platform-inventory.md).

## Core properties

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

## Identity properties

| API field path | Data type | Description | Example | Status | Available for |
|---|---|---|---|---|---|
| `properties.botId` | string | The CDS bot ID in the environment. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available | Copilot Studio agents, Microsoft 365 Copilot Agent Builder agents |
| `properties.entraAppId` | string | The Entra App Registration ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available | Copilot Studio agents |
| `properties.entraAgentId` | string | The Entra Agent Identity ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available | Copilot Studio agents |
| `properties.entraAgentBlueprintId` | string | The Entra Agent Blueprint ID. | `aaaa0000-bb11-2222-33cc-444444dddddd` | Generally available | Copilot Studio agents |

> [!NOTE]
> The `entraAppId` field is a legacy identifier. Newer agents use `entraAgentId` and `entraAgentBlueprintId` instead. None of these identity properties apply to Copilot Studio Lite agents.

## Configuration properties

| API field path | Data type | Description | Example | Status |
|---|---|---|---|---|
| `properties.orchestration` | string | The orchestration mode of the agent (see [Orchestration modes](#orchestration-modes)). | `Generative` | Preview |
| `properties.model` | string | The AI model used by the agent. | `gpt-4o` | Preview |
| `properties.authentication` | string | The authentication mode configured for the agent (see [Authentication modes](#authentication-modes)). | `Microsoft Entra` | Preview |
| `properties.channels` | array | The channels the agent is published to (see [Supported channels](#supported-channels)). | `["Teams","SharePoint"]` | Preview |

### Orchestration modes

The following values are possible for the `properties.orchestration` field.

| Value | Description |
|---|---|
| `Classic` | The agent uses classic topic-based orchestration with authored dialog trees. |
| `Generative` | The agent uses generative orchestration, where an AI model dynamically selects topics and actions. |

### Authentication modes

The following values are possible for the `properties.authentication` field.

| Value | Description |
|---|---|
| `None` | No authentication required. |
| `Microsoft Entra` | Authentication via Microsoft Entra ID. |
| `Generic OAuth 2.0` | Authentication via a generic OAuth 2.0 provider. |

### Supported channels

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

## Known limitations

- **V1 agents aren't tracked.** Agents created with the original Power Virtual Agents V1 runtime aren't included in the inventory. Only V2 (Copilot Studio) agents are tracked.
- **Identity properties may not be available for all agents.** The `entraAgentId` and `entraAgentBlueprintId` fields are populated only for agents that have been provisioned with the newer Entra agent identity model. Older agents may only have `entraAppId`, and Copilot Studio Lite agents don't have any of these identity properties.

## Related content

- [Power Platform inventory schema reference](inventory-schema.md)
- [Power Platform inventory](power-platform-inventory.md)
- [Power Platform inventory API](inventory-api.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
