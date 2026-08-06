---
title: Power Platform inventory
description: Learn how to get a comprehensive, unified view of all agents, apps, and flows across your organization in Power Platform.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: ellenwehrle
ms.date: 08/06/2026
ms.topic: concept-article
contributors:
    - Grayson-Bishop
ai-usage: ai-assisted
---

# Power Platform inventory

Power Platform inventory gives tenant administrators a unified view of all agents, apps, and flows built on Power Platform across their organization. Administrators can discover, search, filter, and sort these resources to streamline common administrative tasks.

By using Power Platform inventory, you can easily complete the following tasks:

- **Map connector usage (preview)**: Find which apps, flows, and agents use a given connector or operation. Use this information to scope DLP, audit Premium connector adoption, and plan ahead of deprecations, security issues, or licensing changes.

- **Spot your champions**: Quickly identify who's creating the most resources so you can recognize, nurture, and empower your top innovators.

- **Enforce compliance standards**: Effortlessly detect resources created in nonapproved regions to maintain adherence to organizational policies.

- **Focus your governance**: Rank environments by resource count to focus security, governance, and compliance efforts where they matter most.

- **Prevent orphaned agents**: Proactively find resources owned by departing users to allow seamless ownership transfers and ensure business continuity.

- **Accelerate support**: Instantly pinpoint that _needle in a haystack_ resource referenced in a support ticket to dramatically improve response times.

## Supported resource types

The Power Platform inventory includes the following resource types:

- **Agents**: All agents created in Copilot Studio, and all agents created in Microsoft 365 Copilot Agent Builder.

- **Apps**: All apps created in Power Apps (canvas, model-driven, code, and vibe) and in Microsoft 365 Copilot's App Builder agent.

- **Flows**: All agent flows created in Copilot Studio, all cloud flows created in Power Automate, and all workflows created in Microsoft 365 Copilot's Workflows agent.

- **Connectors (preview)**: All connectors available in your tenant, including the operations each connector exposes and its publisher and tier.

- **Environments**: All environments in your tenant.

- **Environment groups**: All environment groups in your tenant.

## Key features

The Power Platform inventory includes the following key features:

- **Unified inventory**: Centralized view of all resources.

- **Fast updates**: Created, updated, or deleted resources appear within 15 minutes.

- **Flexible filtering and sorting**: Filter and sort resources by any attribute.

- **Inventory count**: Instantly see the total number of items matching your criteria.

- **Customizable columns**: Tailor your view by selecting which columns to display.

- **Download**: Export your entire inventory to a CSV file for further analysis.

- **Connector visibility (preview)**: See which connectors and operations each resource uses, directly in the inventory grid.

## Access requirements

To view the Power Platform inventory, you must hold one of the supported Microsoft Entra roles. What you can see in the Power Platform admin center depends on your role: most roles have full visibility into all resources, while the AI roles are scoped to AI-related resources only.

| Role | What they can see |
|---|---|
| Global administrator | All inventory resources |
| Power Platform administrator | All inventory resources |
| Dynamics 365 administrator | All inventory resources |
| Global reader | All inventory resources |
| AI administrator | Agents, agentic apps, agent flows, environments, and environment groups only |
| AI reader | Agents, agentic apps, agent flows, environments, and environment groups only |

The AI administrator and AI reader roles are scoped to AI-related resources only. They can see:

- **Agents** from Microsoft 365 Copilot and Copilot Studio
- **Agentic apps**, including vibe apps, code apps, and App Builder apps
- **Agent flows** from Copilot Studio and workflow agent flows from Microsoft 365 Copilot
- **Environments** and **environment groups**

Canvas apps, model-driven apps, and cloud flows are out of scope for the AI administrator and AI reader roles.

> [!NOTE]
> These roles are Microsoft Entra roles, which are different from [built-in Power Platform roles](security/role-based-access-control.md#built-in-power-platform-roles). The built-in Power Platform roles for role-based access control (RBAC) aren't supported for Power Platform inventory access.

## Where to access Power Platform inventory

You can access Power Platform inventory through multiple interfaces and APIs. By using these options, you can integrate inventory data into your workflows and tools of choice. The following sections list the primary ways to access inventory data.

### The Power Platform admin center user interface

- **Manage** > **Inventory**: The main inventory page provides a unified view of all resources across your tenant.

- **Manage** > **Copilot Studio:** Agents (Copilot Studio + Microsoft 365 Copilot Agent Builder), agent flows, and workflows.

- **Manage** > **Power Apps** > **App Inventory tab**: Canvas, model-driven, code, vibe, and App Builder apps.

- **Manage** > **Power Automate** > **Flow Inventory tab**: Cloud flows.

### Programmatic access

You can access Power Platform inventory data programmatically, which supports advanced scenarios such as automation, reporting, and integration with external tools. For a complete list of resource types and their fields, see [Power Platform inventory schema reference](inventory-schema.md).

#### Power Platform for Admins V2 connector

You can query Power Platform inventory data directly from Power Automate by using the [Power Platform for Admins V2 connector](/connectors/powerplatformadminv2/). Use the [Query Power Platform resources](/connectors/powerplatformadminv2/#query-power-platform-resources) action to run queries against your inventory and add the results to your automation workflows.

#### Power Platform API

If you're new to the Power Platform API, see [Getting Started with Power Platform API](powerplatform-api-getting-started.md) for setup instructions and authentication details. After you set up the API, see the [Inventory API documentation](inventory-api.md) to learn how to query your inventory data.

#### Azure Resource Graph

You can programmatically query your Power Platform inventory by using Azure Resource Graph (ARG). For ready-to-run KQL queries that count resources, discover fields, look up specific resources, and analyze connector usage, see [Power Platform inventory sample queries](inventory-sample-queries.md).

## Filter, sort, and search

Power Platform inventory provides several ways to find exactly the resources you need. Filter and sort by any attribute or use the search box as a more freeform way to find what you're looking for.

### Filter and sort

Power Platform inventory lets you filter and sort across all resource data, using any column or attribute. You can combine multiple filters to zero in on exactly the resources you need, whether you're tracking down a specific app or analyzing trends across environments. As you refine your criteria, you always see the total count of matching resources displayed directly above the resource table on the top-left, making it easy to gauge the size of your filtered dataset.

For example, you can combine multiple filters to narrow down your results. Each filter you add is cumulative:

1. **Environment type**: Select the **Environment type** column and select **Default**. You see all resources in the default environment.

1. **Owner**: Select the **Owner** column and type the name of the person. You see all resources owned by this person in the default environment.

1. **Creation date**: Select the **Created on** column and apply the date filters from January 2025 to today's date. You see all resources owned by this person, in the default environment, that they created in the year 2025.

To clear all filters and sorts, select any column and choose **Clear all filters**.

### Search the inventory

Use the **Search** box as a freeform way to find what you need. Enter any text, and inventory returns every matching resource, whether that's a single resource or many. Search runs across your entire inventory, not only the resources currently loaded in the grid, so it returns every match even when your inventory is larger than the number of rows displayed at a time.

## Display more columns

The inventory table provides the option to display more columns to help you better manage all your resources. To customize displayed columns, complete the following steps.

1. Select the **Add or remove columns** icon next to the **Search** box.

1. Select or clear columns you want to display or hide.

## View resource details

You can open a resource's details panel in two ways:

- Select a resource, and then select **Details** in the command bar.
- Select the resource's name. Resource names are always hyperlinked and open the details panel.

The details panel includes three tabs: **Overview**, **Connectors**, and **Usage**.

To view environment details, select the environment name.

## Take action on resources

Beyond viewing inventory data, you can act on individual resources directly from the inventory experience.

- **Delete a resource**: Select a resource, and then select **Delete** in the command bar. The resource is removed from the inventory.

- **Block a published agent or canvas app**: Select a published agent or canvas app, and then select **Block** in the command bar. Blocking is reversible. You can unblock the resource at any time to restore access.

> [!NOTE]
> Blocking prevents the resource from being used while you investigate or remediate a security or compliance issue. For a blocked agent, makers can still see and test it in Copilot Studio, but it can't be used in any other channel. Blocking applies only to **published** agents and canvas apps. You can block and unblock resources from the main **Inventory** page, or from **Manage** > **Copilot Studio** (agents) or **Manage** > **Power Apps** (canvas apps). For more information, see [Quarantine agents](/microsoft-copilot-studio/admin-api-quarantine).

## Export your inventory

You can export your inventory data for reporting, analysis, or integration with other tools.

- **Download to CSV**: Select **Download** in the command bar to export your inventory to a CSV file. The export includes your entire inventory, not just the resources currently loaded in the grid.

- **Query programmatically**: Retrieve the same inventory data through the Power Platform APIs and connectors. For more information, see [Programmatic access](#programmatic-access).

## Connector inventory (preview)

Power Platform inventory captures the connectors and connector operations used by each resource. In the Power Platform admin center, this data appears as a **Connectors** column across the inventory grids: the unified **Manage > Inventory** page as well as the resource-specific views under **Copilot Studio**, **Power Apps**, and **Power Automate**. You can query the same data through the [Power Platform for Admins V2 connector](/connectors/powerplatformadminv2/), the [Power Platform inventory API](inventory-api.md), and [Azure Resource Graph](/azure/governance/resource-graph/overview).

Connector inventory makes common admin workflows query-driven: identifying every resource affected by a deprecated connector, tracking Premium connector adoption for license decisions, scoping DLP policies to actual usage patterns, and reviewing a resource's full connector footprint during troubleshooting.

**Supported resource types**: canvas apps, model-driven apps, cloud flows, agent flows, workflow agent flows, and Copilot Studio agents (including Microsoft 365 Copilot Agent Builder).

For flows, the inventory additionally captures the trigger connector and trigger operation that initiate the flow.

For the data shape and known limitations, see [Connector inventory (preview)](inventory-schema.md#connector-inventory-preview) in the schema reference.

## Known limitations

### Agents

- **Classic chatbots:** The new inventory page doesn't include classic chatbots. However, you can still find them by selecting **Manage** > **Copilot Studio** > **Classic chatbots**.

- **_Modified on_ and _Last modified by_ columns**: These columns don't work for agents and show the **–** (dash) character.

### Model-driven apps

- **_Owner_ column**: Model-driven apps don't have an owner. Dataverse has no concept of ownership for model-driven apps; access is governed exclusively by licensing and environment-level permissions. As a result, the **Owner** column doesn't apply to model-driven apps.

- **Un-published apps**: Only published, model-driven apps are captured.

- **Preinstalled apps in the default environment**: The default environment comes with three preinstalled model-driven apps: Power Platform Environment Settings, Power Pages Management, and Solution Health Hub. These apps don't appear in the inventory initially unless you edit and republish them.

### Flows

- **_Owner_ column**: For cloud flows and agent flows, this column currently shows the user who created the flow. It doesn't update when the owner changes.

- **Workflow agent flows have no environment information**: Starting April 2026, workflows created by Microsoft 365 Copilot's Workflows agent are stored in a single, hidden Power Platform environment that's automatically provisioned and managed by the platform (one per tenant). Because this environment isn't visible in the Power Platform admin center environment list or any Maker portal, these workflow agent flows appear in inventory without environment information. For details, see [Microsoft 365 Copilot workflows environment for Workflows agents](/microsoft-365/copilot/workflows-environment-workflows-agents#environment-provisioning).

### Filtering and access

- **Environment name**: You need to use the full environment name when filtering by environment. Partial matches or substrings don't work.

- **Multi-factor authentication (MFA) requirements for Azure Resource Manager**: Power Platform inventory needs access to Azure Resource Manager to get resource information. If your organization requires MFA through conditional access policies for Azure Resource Manager, inventory might not load. To fix this problem, work with your Entra ID administrator to include the Power Platform admin center application (client ID: `00b46ad5-e4ae-43ac-a878-281fc03d0839`) and the **Microsoft Azure Management** resource in your MFA conditional access policy.

- **Sovereign cloud**: [Power Platform inventory](power-platform-inventory.md) isn't currently available in the US Government Community Cloud (GCC, GCC-High, and DoD), 21Vianet (China), or Air Gapped environments.
