---
title: "Data export migration: Power Platform inventory API field mapping"
description: Power Platform inventory API migration guide for data export users. Compare app, flow, connector, and environment fields, and plan your switch with confidence.
ms.date: 10/23/2026
ms.topic: how-to
author: souravmukherjeedotnet
ms.author: somukhe
ms.reviewer: ellenwehrle
ai-usage: ai-assisted
---

# Compare data export inventory to the Power Platform inventory API

The Power Platform inventory API provides current inventory data through the `PowerPlatformResources` table in Azure Resource Graph. The API includes core resource, ownership, environment, and connector information, but its schema differs from the data export inventory schema.

This article describes:

- Inventory data available through the Power Platform inventory API.
- Data export inventory properties that aren't available.
- Properties that have partial or different coverage.

For information about querying inventory, see [Power Platform inventory API](./inventory-api.md). For the complete API schema, see [Power Platform inventory schema reference](./inventory-schema.md).

> [!NOTE]
> Microsoft is retiring the preview version of data export. Inventory data exports stop after December 1, 2026. Usage and environment data exports continue through existing and new configurations and data you already exported remains in your data lake. Expect another notification from Microsoft when inventory data exports stop.
>
> To prepare, use the [Power Platform inventory API](inventory-api.md) to export inventory data programmatically. Before you migrate, review the [field mappings and known gaps](inventory-data-availability-differences.md). Some data export inventory fields aren't available through the API or have different coverage.
>
> The Power Platform inventory API doesn't automatically export data to customer-owned storage. To create a recurring export, use an Azure service, such as [Azure Functions](/azure/azure-functions/functions-overview), [Azure Logic Apps](/azure/logic-apps/logic-apps-overview), or [Azure Automation](/azure/automation/overview), to query the Power Platform inventory API on a schedule and write the results to [Azure Blob Storage](/azure/storage/blobs/storage-blobs-introduction), [Azure Data Lake Storage](/azure/storage/blobs/data-lake-storage-introduction), or another supported destination.

## Supported resource types

The Power Platform inventory API includes the following resource types:

| Resource | Power Platform inventory API type |
| --- | --- |
| Canvas apps | `microsoft.powerapps/canvasapps` |
| Model-driven apps | `microsoft.powerapps/modeldrivenapps` |
| Code apps | `microsoft.powerapps/codeapps` |
| Managed and App Builder apps | `microsoft.powerapps/apps` |
| Cloud flows | `microsoft.powerautomate/cloudflows` |
| Agent flows | `microsoft.powerautomate/agentflows` |
| Workflow agent flows | `microsoft.powerautomate/m365agentflows` |
| Copilot Studio agents | `microsoft.copilotstudio/agents` |
| Connectors | `microsoft.powerplatformconnector/connectors` |
| Environments | `microsoft.powerplatform/environments` |
| Environment groups | `microsoft.powerplatform/environmentgroups` |

## Available inventory data

The following sections describe the available fields by resource type and data category.

- [Shared resource information](#shared-resource-information)
- [App information](#app-information)
- [Flow information](#flow-information)
- [Connector usage](#connector-usage)
- [Connector catalog information](#connector-catalog-information)
- [Environment information](#environment-information)

### Shared resource information

The following fields are available for supported resource types. Connectors are catalog entities and support only the shared fields identified in the [inventory schema reference](./inventory-schema.md).

| Data category | Available information | Power Platform inventory API field |
| --- | --- | --- |
| Resource ID | Unique inventory resource identifier | `name` |
| Resource name | Resource display name | `properties.displayName` |
| Resource type | Standardized Power Platform resource type | `type` |
| Tenant | Tenant identifier | `tenantId` |
| Location | Geographic location of the resource | `location` |
| Creation date | Date and time when the resource was created | `properties.createdAt` |
| Created by | Object ID of the user who created the resource | `properties.createdBy` |

### App information

The following information is available for supported app types.

| Data category | Available information | Power Platform inventory API field |
| --- | --- | --- |
| Owner | Object ID of the app owner | `properties.ownerId` |
| Environment | Identifier of the environment containing the app | `properties.environmentId` |
| Last modification | Date and time when the app was last modified | `properties.lastModifiedAt` |
| Last modified by | Object ID of the user who last modified the app | `properties.lastModifiedBy` |
| Quarantine state | Whether the app is quarantined | `properties.isQuarantined` |
| Model-driven app ID | Dataverse app-module identifier | `properties.appModuleId` |
| Model-driven app logical name | Dataverse logical name | `properties.logicalName` |
| Code-app subtype | `byocApp` or `vibeApp` | `properties.subType` |
| Managed app subtype | `microsoftApp` | `properties.subType` |
| App Builder subtype | `appBuilderApp` | `properties.subType` |

### Flow information

The following information is available for cloud flows, agent flows, and workflow agent flows.

| Data category | Available information | Power Platform inventory API field |
| --- | --- | --- |
| Owner | Object ID of the flow owner | `properties.ownerId` |
| Environment | Identifier of the environment containing the flow | `properties.environmentId` |
| Last modification | Date and time when the flow was last modified | `properties.lastModifiedAt` |
| Last modified by | Object ID of the user who last modified the flow | `properties.lastModifiedBy` |
| Workflow entity | Dataverse workflow entity identifier | `properties.workflowEntityId` |
| Trigger connector | Connector that initiates the flow | `properties.trigger` |
| Trigger operation | Connector operation that initiates the flow | `properties.triggerOperation` |

The trigger fields are empty when a flow uses a trigger that isn't connector-based, such as a recurrence or manual trigger.

### Connector usage

Connector usage is available for supported apps, flows, and agents.

| Data category | Available information | Power Platform inventory API field |
| --- | --- | --- |
| Connectors used | Identifiers of connectors used by the resource | `properties.powerPlatformConnectors[].connectorId` |
| Operations used | Identifiers of operations invoked on a connector | `properties.powerPlatformConnectors[].operations[].operationId` |
| Flow trigger | Connector that initiates a supported flow | `properties.trigger` |
| Flow trigger operation | Connector operation that initiates a supported flow | `properties.triggerOperation` |

Connector and operation usage fields are currently in preview.

### Connector catalog information

You can also find connectors as individual inventory resources.

| Data category | Available information | Power Platform inventory API field |
| --- | --- | --- |
| Connector ID | Connector identifier | `properties.connectorId` |
| Description | Connector description | `properties.description` |
| Publisher | Connector publisher | `properties.publisher` |
| Tier | Standard or Premium classification | `properties.tier` |
| Release stage | Release designation, such as Production or Preview | `properties.releaseTag` |
| Deprecation state | Whether the connector is deprecated | `properties.isDeprecated` |
| Operations | Operations exposed by the connector | `properties.operations` |
| Operation ID | Unique operation identifier | `properties.operations[].operationId` |
| Operation name | Operation display name | `properties.operations[].displayName` |
| Operation description | Description of the operation | `properties.operations[].description` |
| HTTP method | HTTP method used by the operation | `properties.operations[].method` |

### Environment information

You can find the following information on environment inventory records.

| Data category | Available information | Power Platform inventory API field |
| --- | --- | --- |
| Environment ID | Unique environment identifier | `name` |
| Environment name | Environment display name | `properties.displayName` |
| Location | Geographic location of the environment | `location` |
| Environment type | Production, Default, Sandbox, Trial, Developer, or Dataverse for Teams | `properties.environmentType` |
| Managed status | Whether the environment is a managed environment | `properties.isManaged` |
| Environment group | Name of the assigned environment group | `properties.environmentGroup` |
| Environment group ID | Identifier of the assigned environment group | `properties.environmentGroupId` |
| Last modification | Date and time when the environment was last modified | `properties.lastModifiedAt` |

## Data not available

The following data export inventory properties don't have direct equivalents in the published Power Platform inventory API schema.

| Data category | Data export inventory information not available in the Power Platform inventory API |
| --- | --- |
| App description | Description of a canvas or model-driven app |
| Application links | App URI, document URI, icon URI, and SharePoint form URL |
| Sharing | Number of users and groups with whom an app is shared |
| Deletion state | Explicit deleted-resource indicator |
| Enablement history | Date when an app was last enabled and the principal who enabled it |
| Solution and ALM information | Solution association and ALM mode |
| DLP evaluation | Evaluation status, evaluation date, violation message, and violations by policy |
| App configuration | Settings, creation type, client device type, embedding host, custom extensions, and performance-optimization setting |
| App presentation | Background image, background color, hero-app designation, featured-app designation, and app-plan classification |
| Consent and licensing | Bypass-consent setting and app-pass eligibility |
| Document version | Document version associated with the app |
| On-premises gateway usage | Explicit indicator that an app uses an on-premises data gateway |
| Dataverse table usage | Explicit indicator that an app uses Dataverse tables |
| PCF external-service usage | Explicit indicator that a Power Apps component framework control uses an external service |

> [!IMPORTANT]
> `properties.isQuarantined` indicates whether an app is quarantined. It isn't an equivalent of the data export deletion indicator.

## Data available with different coverage

Some Power Platform inventory API fields provide related information but aren't direct equivalents of the data export properties.

| Data category | Data export inventory | Power Platform inventory API coverage |
| --- | --- | --- |
| Resource type | Separate `type` and `subType` values | A standardized resource identifier in `type`. Some resource types also provide `properties.subType` |
| Status and lifecycle | Resource status and lifecycle state | Quarantine state is available for supported app types, but it doesn't represent all status or lifecycle values |
| Owner | Owner value and owner object ID | `properties.ownerId` provides an object ID when available. An owner display name isn't included |
| Custom API usage | Explicit custom API indicator | Connector identifiers are available for supported resources, but an equivalent custom API indicator isn't available |
| Premium connector usage | Explicit premium API indicator | Connector tier is available on connector inventory records, but an equivalent resource-level indicator isn't available |
| Workflow actions | Workflow actions and connector-related indicators | Structured connector and operation identifiers are available for supported resource types |
| Environment information | Environment identifier on the resource and separate environment export data | The resource includes `properties.environmentId`. Environment details are available through environment inventory records |

## Identifier mapping

Resource identifiers aren't represented identically in data export and the Power Platform inventory API.

### Model-driven apps

Use the following mapping for model-driven apps:

| Data export inventory field | Power Platform inventory API field |
| --- | --- |
| `environmentId` | `properties.environmentId` |
| `resourceId` | `properties.appModuleId` |
| `name` | `properties.displayName` |
| `type` and `subType` | `type` |

The Power Platform inventory API top-level `name` field is the unique inventory resource identifier. It isn't equivalent to the data export `resourceId` for model-driven apps.

To correlate a model-driven app between the two schemas, use both `properties.environmentId` and `properties.appModuleId`.

## Connector inventory limitations

Connector inventory has the following documented limitations:

- Tabular connectors can appear with an empty operations array.
- Built-in Power Automate actions, including HTTP, Control, and Data operations, aren't represented as connectors.
- Code apps, vibe apps, managed apps, and App Builder apps don't emit connector-usage data.
- Model-driven apps rarely report connectors directly.
- Connector usage by an embedded canvas page is associated with the canvas page record instead of the containing model-driven app.
- Per-resource connector data includes connector and operation identifiers but doesn't include connector display names, publisher information, or tier.
- Connector display names, publisher information, and tier are available on connector inventory records.
- Connector presence doesn't indicate whether an on-premises gateway is used.

## Related content

- [Power Platform inventory API](./inventory-api.md).
- [Power Platform inventory schema reference](./inventory-schema.md).
- [Power Platform inventory](./power-platform-inventory.md).
