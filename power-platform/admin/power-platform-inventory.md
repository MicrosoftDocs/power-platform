---
title: Power Platform inventory
description: Learn how to get a comprehensive, unified view of all agents, apps, and flows across your organization in Power Platform.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
ms.date: 03/11/2026
ms.topic: concept-article
contributors:
    - Grayson-Bishop

---

# Power Platform inventory

Power Platform inventory gives tenant administrators a unified view of all agents, apps, and flows built on Power Platform across their organization. Administrators can discover, search, filter, and sort these resources to streamline common administrative tasks.

By using Power Platform inventory, you can easily complete the following tasks:

- **Spot your champions**: Quickly identify who's creating the most resources so you can recognize, nurture, and empower your top innovators.

- **Enforce compliance standards**: Effortlessly detect resources created in nonapproved regions to maintain adherence to organizational policies.

- **Focus your governance**: Rank environments by resource count to focus security, governance, and compliance efforts where they matter most.

- **Prevent orphaned agents**: Proactively find resources owned by departing users to allow seamless ownership transfers and ensure business continuity.

- **Accelerate support**: Instantly pinpoint that _needle in a haystack_ resource referenced in a support ticket to dramatically improve response times.

## Supported resource types

The Power Platform inventory includes:

- **Agents:** All agents created in Copilot Studio, and all agents created in Microsoft 365 Copilot Agent Builder.

- **Apps:** All apps created in Power Apps (canvas, model-driven, code, and vibe) and in Microsoft 365 Copilot's App Builder agent.

- **Flows:** All agent flows created in Copilot Studio, all cloud flows created in Power Automate, and all workflows created in Microsoft 365 Copilot's Workflows agent.

- **Environments:** All environments in your tenant.

- **Environment groups:** All environment groups in your tenant.

## Key features

- **Unified inventory**: Centralized view of all resources.

- **Fast updates**: Created, updated, or deleted resources appear within 15 minutes.

- **Flexible filtering and sorting**: Filter and sort resources by any attribute, including environment groups.

- **Inventory count**: Instantly see the total number of items matching your criteria.

- **Customizable columns**: Tailor your view by selecting which columns to display.

- **Resource details**: Access detailed information for each resource.

- **Download**: Export your inventory to Excel for further analysis.

## Access requirements

To view the Power Platform inventory, you must hold one of the following tenant-wide administrative roles: [Power Platform administrator](use-service-admin-role-manage-tenant.md#power-platform-administrator) or [Dynamics 365 administrator](use-service-admin-role-manage-tenant.md#dynamics-365-administrator). If you don't have one of these roles, you can't access the inventory.

## Where to access Power Platform inventory

You can access Power Platform inventory through multiple interfaces and APIs. By using these options, you can integrate inventory data into your workflows and tools of choice. The following sections list the primary ways to access inventory data.

### The Power Platform admin center user interface

- **Manage > Inventory**: The main inventory page provides a unified view of all resources across your tenant.

- **Manage > Copilot Studio:** Agents (Copilot Studio + Microsoft 365 Copilot Agent Builder), agent flows, and workflows.

- **Manage > Power Apps > App Inventory tab**: Canvas, model-driven, code, vibe, and App Builder apps.

- **Manage > Power Automate > Flow Inventory tab**: Cloud flows.

For programmatic access options, see [Programmatic access](#programmatic-access) later in this article.

## Apply filters and sorts

Power Platform inventory lets you filter and sort across all resource data, using any column or attribute. You can combine multiple filters to zero in on exactly the resources you need, whether you're tracking down a specific app or analyzing trends across environments. As you refine your criteria, you always see the total count of matching resources displayed directly above the resource table on the top-left, making it easy to gauge the size of your filtered dataset.

For example, you can combine multiple filters to narrow down your results. Each filter you add is cumulative:

1. **Environment type**: Select the **Environment type** column and select **Default**. You see all resources in the default environment.

1. **Owner**: Select the **Owner** column and type the name of the person. You see all resources owned by this person in the default environment.

1. **Creation date**: Select the **Created on** column and apply the date filters from January 2025 to today's date. You see all resources owned by this person, in the default environment, that they created in the year 2025.

To clear all filters and sorts, select any column and choose **Clear all filters**.

## Display more columns

The inventory table provides the option to display more columns to help you better manage all your resources. To customize displayed columns, complete the following steps.

1. Select the **Add or remove columns** icon next to the **Search** box.

1. Select or clear columns you want to display or hide.

## Search the inventory

Quickly search for keywords across all entries currently loaded in the inventory table. Use the **Search** box to help you find specific resources fast.

> [!NOTE]
> The search only applies to resources visible in the user interface (up to 1,000 at a time). If your inventory exceeds this limit, apply filters to narrow down the results and bring the resources you need into view.

## View resource details

- Select a resource, and then select the **Details** option in the command bar.

- Select the resource's display name to be redirected to its details page in the Copilot Studio, Power Apps, or Power Automate portal.

    > [!NOTE]
    > You need sufficient permission to access the resource details page. Without permission, you see a **This link is broken** error.

- Select the environment name to view the environment details.

## How Power Platform inventory relates to other Microsoft admin surfaces

Microsoft offers multiple admin surfaces that display agents, and you might notice that the agent counts differ across them. Each surface serves a different audience, shows different types of agents, and answers a different question. Understanding these differences helps you interpret the agent counts you see across your organization.

### Power Platform inventory vs. Microsoft 365 admin center

The [Microsoft 365 admin center](/microsoft-365/admin/manage/manage-copilot-agents-integrated-apps) shows agents that are **available to users in your tenant**. This view includes Microsoft first-party agents, third-party ISV agents, and org-created agents that you publish or share. Org-created agents in the Microsoft 365 admin center come from many authoring surfaces, including Teams Store Platform, Agent Toolkit, Foundry, Fabric, SharePoint, and more. It functions as a catalog of everything accessible to your employees.

Power Platform inventory, by contrast, shows only agents that were **built on Power Platform**. This includes both published and draft agents created in Copilot Studio or Microsoft 365 Copilot Agent Builder. It does not include first-party Microsoft agents, ISV agents, or agents created on other Microsoft surfaces.

As a result, the agent counts between the two surfaces differ. The Microsoft 365 admin center includes agents your organization didn't build. Power Platform inventory might include agents that don't appear in the Microsoft 365 admin center if those agents are in draft form and not yet published.

### Summary of differences

| | Power Platform inventory | Microsoft 365 admin center |
|---|---|---|
| **Designed for** | IT admins (Power Platform) | IT admins (Microsoft 365) |
| **Shows** | Agents built on Power Platform | All agents available in your tenant (including agents from Teams Store Platform, Agent Toolkit, Foundry, Fabric, SharePoint, Groups, and more) |
| **Includes drafts** | Yes | Published and shared only |
| **Includes 1st-party / ISV** | No | Yes |
| **Scoped to** | Environments (rolled up to tenant) | Tenant |

> [!TIP]
> If you're asked to report on your organization's agent count, clarify what type of count is needed: **total available agents** (Microsoft 365 admin center) or **org-created agents on Power Platform** (Power Platform inventory). Each number is correct within its own context.

## Known limitations

- **Classic chatbots:** The new inventory page doesn't include classic chatbots. However, you can still find them by selecting **Manage** > **Copilot Studio** > **Classic chatbots**.

- **Environment name**: You need to use the full environment name when filtering by environment. Partial matches or substrings don't work.

- **Multi-factor authentication (MFA) requirements for Azure Resource Manager**: Power Platform inventory needs access to Azure Resource Manager to get resource information. If your organization requires MFA through conditional access policies for Azure Resource Manager, inventory might not load. To fix this problem, work with your Entra ID administrator to include the Power Platform admin center application (client ID: `00b46ad5-e4ae-43ac-a878-281fc03d0839`) and the **Microsoft Azure Management** resource in your MFA conditional access policy.

- **_Modified on_ and _Last modified by_ columns**: These columns don't work for agents and show the **–** (dash) character.

- **_Owner_ column**: This column for cloud flows and agent flows currently shows the user who created the flow. It doesn't update when the owner changes.

- **Un-published model-driven apps:** Only published, model-driven apps are captured.
  
- **Model-driven apps in the default environment:** The default environment comes with three preinstalled model-driven apps: Power Platform Environment Settings, Power Pages Management, and Solution Health Hub. These apps don't appear in the inventory initially unless you edit and republish them.

- **Sovereign cloud**: [Power Platform inventory](power-platform-inventory.md) isn't currently available in the US Government Community Cloud (GCC, GCC-High, and DoD), 21Vianet (China), or Air Gapped environments.

## Programmatic access

You can access Power Platform inventory data programmatically. This capability supports advanced scenarios such as automation, reporting, and integration with external tools.

### Power Platform for Admins V2 connector

You can query Power Platform inventory data directly from Power Automate by using the [Power Platform for Admins V2 connector](/connectors/powerplatformadminv2/). Use the [Query Power Platform resources](/connectors/powerplatformadminv2/#query-power-platform-resources) action to run queries against your inventory and add the results to your automation workflows.

### Power Platform API

If you're new to the Power Platform API, see [Getting Started with Power Platform API](powerplatform-api-getting-started.md) for setup instructions and authentication details. After you set up the API, see the [Inventory API documentation](inventory-api.md) to learn how to query your inventory data.

### Azure Resource Graph

You can programmatically query your Power Platform inventory by using Azure Resource Graph (ARG). You can access ARG queries through several Azure interfaces. For step-by-step instructions, see the following Azure Resource Graph quickstart guides:

- [Run Resource Graph query using Azure portal](/azure/governance/resource-graph/first-query-portal)

- [Run Resource Graph query using Azure CLI](/azure/governance/resource-graph/first-query-azurecli)

- [Run Resource Graph query using Azure PowerShell](/azure/governance/resource-graph/first-query-powershell)

- [Run Azure Resource Graph query using REST API](/azure/governance/resource-graph/first-query-rest-api?tabs=powershell)

### Sample queries

The following are example queries you can use with any of the Azure Resource Graph interfaces. All queries use the **PowerPlatformResources** table, which contains your organization's inventory data.

#### Query 1: Total count of all resources

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

The inventory schema evolves over time as new data fields are added. Use this query to see all available fields for a specific resource type. This query is the recommended way to stay up to date with available data.

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

To discover fields for other resource types, replace the `type` filter value. For example:

| Resource type | Type filter value |
|---------------|-------------------|
| Copilot Studio agents | `microsoft.copilotstudio/agents` |
| Power Apps canvas apps | `microsoft.powerapps/canvasapps` |
| Power Automate cloud flows | `microsoft.powerautomate/cloudflows` |

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
> You can find the agent's ID in the Copilot Studio URL when viewing the agent, or in the **Name** column of the inventory table.

#### Query 8: Items created in the past 24 hours

```Kusto
PowerPlatformResources
| extend properties = parse_json(properties)
| extend createdAt = todatetime(properties.createdAt)
| where createdAt >= ago(24h)
```
