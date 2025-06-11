---
title: View tenant-wide agent inventory
description: Learn how to get visibility into all Copilot Studio agents created across your tenant.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 06/11/2025
ms.custom: NewPPAC
author: mikferland-msft
ms.author: miferlan
ms.reviewer: sericks
search.audienceType: 
  - admin
---

# View tenant-wide agent inventory

The Power Platform admin center now offers an enhanced, agent inventory experience that provides IT administrators with comprehensive visibility into all Copilot Studio agents created across their tenant. With this new, agent inventory page, administrators can effortlessly discover, search, filter, and sort the entire inventory of agents by owner, creation date, region, and other key attributes, streamlining common administrative tasks.

The inventory allows administrators to:

- **Accelerate support**: Quickly locate agents referenced in support tickets to improve response times.
- **Prevent orphaned agents**: Identify agents owned by departing users to proactively transfer ownership and maintain continuity.
- **Enforce compliance standards**: Easily detect agents created in non-approved regions, ensuring adherence to organizational compliance policies.

## Prerequisites 
You must [turn on tenant-level analytics](tenant-level-analytics.md) to access the inventory.

## View your tenant inventory
To view your inventory of custom agents:

1.	Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a tenant administrator.
1.	Be sure that **New admin center** is selected in the title bar.
1.	Select **Manage** in the navigation pane.
1.	In the **Manage** pane, select **Copilot Studio**. The **Copilot Studio** page appears, listing custom agents that were created by makers within your tenant.

## Apply filters and sorts
You can filter by:

- **Environment type**: Select the **Environment type** column and select the “Default”. You see all custom agents in the default environment.
- **Owner**: Select the **Owner** column and type the name of the person who created the custom agent. You see all agents owned by this person in the default environment.
- **Creation date**: Select the **Created on** column and apply the date filters of your choice. For example, you can filter from January 2024 to today’s date. You see all agents owned by this person, in the default environment, that they created in the year 2024.
  
You can also sort by creation date. Select the **Created on** column and select **Sort descending**. You see the user's most recently created agents, in the default environment, for the year 2024.

You can apply filters and sorts on any column, offering numerous possibilities.

## Search the inventory
At any time, you can see how many agents correspond to your search, filter, and sort criteria. You might see more than 500 results if there are more than 500 agents. You can add more filters to narrow down your results, if needed.

When you narrow the list to fewer than 500 agents, you can search for keywords across all entries on the page, like the name of the agent. The search box only searches across all agents that have been displayed on the page.

## Display additional columns
The inventory page provides the option to display additional columns to help you better manage your custom agents. To customize displayed columns:
 
1.	Click the **column chooser** icon, located next to the search box at the top of the page.
1.	Select the columns you wish to display or hide.

## View agent or environment details
- Select an item, then select the **Details** option in the command bar.
- Select the agent’s display name to be redirected to its details page in the Copilot Studio portal.
    > [!Note]
    > You must have edit permissions on the selected agent to access its details page. If you do not have sufficient permissions, you will see a "This link is broken" error.
- Select the environment name to view the environment details.

## Reset all searches, filters, and sorts
To clear all filters and sorts, select any column and select **Clear all filters**.

## Known limitations
- **Limited scope**: This experience supports only agents built directly in Copilot Studio. Agents that are created in Copilot Studio agent builder, in the Microsoft 365 Copilot app, aren't supported in this release.
- **Data refresh frequency**: Inventory data updates once every 24 hours. Newly created agents might take up to 24 hours to appear, and deleted agents might remain visible for up to 48 hours after removal.
- **Item display limit**: The inventory page displays a maximum of 500 agents at one time. If more than 500 agents match your search or filter criteria, only the first 500 are displayed. Use additional filters to narrow down your results. The primary search box, at the top of the page, only searches across those 500 agents.

## Frequently asked questions

### Why am I seeing multiple agents with identical names (e.g., "Copilot in Power Apps") across different environments?
Power Apps creates a platform-owned agent named **Copilot in Power Apps** in each environment. This agent is only editable by a Power Platform admin and isn’t published to any channels by default. Although this agent can be viewed in Microsoft Copilot Studio, this agent shouldn't be edited since it is not used by model-driven apps. Learn more in [Customize Copilot chat using Copilot Studio](/power-apps/maker/model-driven-apps/customize-copilot-chat).

This is similar to other standard, pre-installed model-driven apps such as the Power Platform Environment Settings.

### Why can't I find an agent in the Maker Inventory page?
Occasionally, you might not be able to locate a specific agent in your inventory list. Use the following steps to resolve the issue.

Step 1: Clear All Filters and Sorts
You may inadvertently have filters or sorts applied that are hiding the agent.
1.	Select any column header.
2.	Click Clear all filters.
3.	Reapply appropriate filters and sorts to help locate your agent.

Step 2: Check the Inventory Refresh Date
The agent inventory refreshes once every 24 hours. Keep in mind:
•	Newly created agents may take up to 24 hours to appear.
•	Deleted agents may remain visible for up to 48 hours after deletion.

Check the inventory refresh timestamp at the top-right corner of the inventory page:
o	If your agent was created after the last refresh, please wait until the next refresh cycle completes.
o	If your agent was created before the last refresh and is still not visible, proceed to Step 3.
o	If you're uncertain of the creation time, wait for the next refresh cycle before proceeding further.

Step 3: Verify the Agent Exists in Copilot Studio Portal
Confirm the agent’s existence and your access permissions by verifying directly in the Copilot Studio portal:
1.	Navigate to the Copilot Studio portal.
2.	Select the appropriate environment where the agent should exist.
3.	Ensure you have appropriate permissions to view the agent:
o	If you see the agent in Copilot Studio, but it's still missing from the admin center inventory after the refresh cycle, please open a support ticket.
o	If you cannot see the agent in Copilot Studio (and you have verified permissions), it likely no longer exists.

Next Steps
If you have completed these troubleshooting steps and are still unable to locate your agent, please contact Microsoft Support for further assistance.











