---
title: View agent inventory
description: Learn how to get visibility into all Microsoft Copilot Studio agents created across your tenant.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 06/27/2025
ms.custom: NewPPAC
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# View agent inventory

The Power Platform admin center now offers an enhanced, agent inventory experience that provides IT administrators with comprehensive visibility into all Microsoft Copilot Studio agents created across their tenant. With this new agent inventory page, administrators can effortlessly discover, search, filter, and sort the entire inventory of agents by owner, creation date, region, and other key attributes, streamlining common administrative tasks.

The inventory allows administrators to:

- **Accelerate support**: Quickly locate agents referenced in support tickets to improve response times.
- **Prevent orphaned agents**: Identify agents owned by departing users to proactively transfer ownership and maintain continuity.
- **Enforce compliance standards**: Easily detect agents created in nonapproved regions, ensuring adherence to organizational compliance policies.

## Prerequisites 
You must [turn on tenant-level analytics](tenant-level-analytics.md) to access the inventory.

## View your tenant-wide, agent inventory
To view your inventory of custom agents:

1.	Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a tenant administrator.
1.	Be sure that **New admin center** is selected in the title bar.
1.	Select **Manage** in the navigation pane.
1.	In the **Manage** pane, select **Copilot Studio**. The **Copilot Studio** page appears, listing custom agents that were created by makers within your tenant.

## Apply filters and sorts
You can filter by:

- **Environment type**: Select the **Environment type** column and select the default environment. You see all custom agents in the default environment.
- **Owner**: Select the **Owner** column and type the name of the person who created the custom agent. You see all agents owned by this person in the default environment.
- **Creation date**: Select the **Created on** column and apply the date filters of your choice. For example, you can filter from January 2024 to today’s date. You see all agents owned by this person, in the default environment, that they created in the year 2024.
  
    You can also sort by creation date. Select the **Created on** column and select the **Sort descending** sort order. You see the user's most recently created agents, in the default environment, for the year 2024.

You can apply filters and sorts on any column, offering numerous possibilities.

## Search the inventory
You can search, filter, and sort the agent inventory. Keep in mind that you search across the records that have been displayed in the user interface (UI). For example, consider the following scenarios:
- If you apply a filter and get 400 records returned, the search operation searches across those 400 records.
- If you apply a filter that returns more than 500 records, you only see 500 records displayed in the UI at this time due to a [known limitation](#known-limitations). The search operation searches across just those 500 records.

You can add more filters to narrow down your results, if needed.

## Display more columns
The **Copilot Studio** page provides the option to display more columns to help you better manage your custom agents. To customize displayed columns:
 
1. Select the **column chooser** icon, located next to the search box on the right side of the page.
1. Select the columns you wish to display or hide.
1. Select **Save**. 

## View agent or environment details
To view details about an agent:
- Select an item, then select the **Details** option, under the page name.
- Select the agent’s display name to be redirected to its details page in the Copilot Studio portal.
    > [!Note]
    > You must have edit permissions on the selected agent to access its details page. If you do not have sufficient permissions, you will see a "This link is broken" error.

To view details about an environment, select the environment name to view the environment details.

## Reset all searches, filters, and sorts
To clear all filters and sorts, select any column and select **Clear all filters**.

## Known limitations
- **Limited scope**: This experience supports only agents built directly in Copilot Studio. Agents that are created in Copilot Studio agent builder, in the Microsoft 365 Copilot app, aren't supported in this release.
- **Data refresh frequency**: Inventory data updates once every 24 hours. Newly created agents might take up to 24 hours to appear, and deleted agents might remain visible for up to 48 hours after removal.
- **Item display limit**: The inventory page displays a maximum of 500 agents at one time. If more than 500 agents match your search or filter criteria, only the first 500 are displayed. Use more filters to narrow down your results. The primary search box, at the top of the page, only searches across those 500 agents.
- **Teams environments**: Custom agents that are created in Microsoft Teams environments aren't yet supported.

## Frequently asked questions

### Why am I seeing multiple agents with identical names&mdash;for example, _Copilot in Power Apps_&mdash;across different environments?
Power Apps creates a platform-owned agent named **Copilot in Power Apps** in each environment. This agent is only editable by a Power Platform admin and isn’t published to any channels by default. Although this agent can be viewed in Copilot Studio, this agent shouldn't be edited since it's not used by model-driven apps. Learn more in [Customize Copilot chat using Copilot Studio](/power-apps/maker/model-driven-apps/customize-copilot-chat).

This is similar to other standard, preinstalled, model-driven apps such as the Power Platform Environment Settings.

### Why can't I find an agent on the Copilot Studio page?
Occasionally, you might not be able to locate a specific agent in your on the **Copilot Studio** page. Use the following steps to resolve the issue.

#### Step 1: Clear all filters and sorts
You may inadvertently have filters or sorts applied that are hiding the agent.

1. Select any column header.
1. Select **Clear all filters**.
1. Reapply appropriate filters and sorts to help locate your agent.

#### Step 2: Check the refresh date
The agent inventory refreshes once every 24 hours. Keep in mind:
- Newly created agents may take up to 24 hours to appear.
- Deleted agents may remain visible for up to 48 hours after deletion.

Check the inventory refresh timestamp at the top-right corner of the page.
- If your agent was created after the last refresh, wait until the next refresh cycle completes.
- If your agent was created before the last refresh and is still not visible, proceed to [step 3](#step-3-verify-that-the-agent-exists-in-the-copilot-studio-portal).
- If you're uncertain of the creation time, wait for the next refresh cycle before proceeding.

#### Step 3: Verify that the agent exists in the Copilot Studio portal.
Confirm the agent’s existence and your access permissions by verifying directly in the Copilot Studio portal:

1. Navigate to the Copilot Studio portal.
1. Select the appropriate environment where the agent should exist.
1. Ensure you have appropriate permissions to view the agent:
    - If you see the agent in Copilot Studio, but it's still missing from the Power Platform **Copilot Studio** page after the refresh cycle, open a support ticket.
    - If you can't see the agent in Copilot Studio (and you have verified permissions), it likely no longer exists.

#### Next steps
If you have completed these troubleshooting steps and are still unable to locate your agent, contact Microsoft Support for further assistance.
