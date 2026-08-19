---
title: Manage Copilot Credits and capacity for Copilot Studio
description: Learn how to manage Copilot Credits and capacity for Copilot Studio.
author: amiyapatr-zz
ms.date: 08/14/2026
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.subservice: admin
ms.author: ampatra
ms.custom: bap-template, NewPPAC
ai-usage: ai-assisted
search.audienceType: 
 - admin
contributors:
 - radioblazer

---

# Manage Copilot Credits and capacity for Copilot Studio

> [!IMPORTANT]
> Microsoft Copilot Studio is a multi-harness platform. The Power Platform admin center (PPAC) provides a unified capacity management experience across all Copilot Studio harnesses, including Copilot Chat, Standard, and GitHub Copilot. Administrators can view capacity and consumption data at the agent and environment level in PPAC. 

The Microsoft Copilot Studio capacity management experience in the Power Platform admin center enables administrators to manage Copilot Studio credit capacity and monitor overall capacity consumption. This experience provides an overview of the licensing models in use. Administrators can efficiently manage their available session capacity.

## View summary information

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. In the **Licensing** pane, under **Products**, select **Copilot Studio**.
1. Select the **Summary** tab.

The licensing summary view shows usage of both prepaid and session-based capacity units.

When you purchase a Copilot Studio license, you get a specified number of billed Copilot Credits pooled across the tenant. You must assign these credits to an environment to enable Copilot Studio features for agents in that environment.

Capacity management features help administrators allocate prepurchased capacity across environments within the tenant, based on the anticipated usage of Copilot agents in each environment. The **Capacity summary** section of the page includes daily consumption data at the environment level for up to three months, which helps you determine appropriate capacity needs.

The consumption monitoring views in capacity management provide detailed, daily usage data for the current month-to-date, the last two full months, and monthly data for the past 12 months. This data supports budgeting and licensing planning.

### Capacity summary

When you view the Copilot Studio summary, you see the following cards in the **Capacity summary** section on the page.

#### Pay-as-you-go credits
This card displays the count of active billing plans with the Copilot Studio meter applied, along with the month-to-date total of Copilot Studio credit billed to these plans. A billing plan in the Power Platform admin center is a configuration that administrators use to group one or more environments. By using a billing plan, administrators can track and bill Copilot Studio credit capacity usage directly to an Azure subscription on a pay-as-you-go basis.

#### Prepaid capacity
The **Prepaid capacity** card shows the number of prepaid capacity units that you purchased, assigned, and consumed. These units can be either session-based or Copilot credit capacity units. The card provides a link to manage each type.

### Copilot Credits capacity tab

The **Copilot credit capacity** tab displays the following cards:

- **Capacity consumption by product**: This card shows a product-focused view of Copilot Studio credit units consumed. It details the number of units deducted from prepaid capacity packs and pay-as-you-go units.

  If users consume Copilot Studio credits for Microsoft 365 Copilot Chat, the number of units consumed appears under the Microsoft 365 Copilot Chat product.
 
- **Total capacity consumption trend**: Displays the daily trend of capacity consumption over the past three months.

- **Copilot credit usage by environment**: Highlights the top environments based on Copilot Studio credit usage.

## View credit capacity consumed per environment
The **Environments** tab provides details on the Copilot Studio credit capacity consumed per environment, including the number of Copilot Credits deducted from the prepaid capacity and the units billed under pay-as-you-go plans. It also indicates the environment's status, such as whether it's within capacity or in overage, if capacity is allocated, and if pay-as-you-go is used.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. In the **Licensing** pane, under **Products**, select **Copilot Studio**.
1. Select the **Environments** tab.
1. Select the **Select environment** button.
1. The **Select an environment** pane is displayed.
1. Select the environment you want to use and select the **Select** button.

To view Copilot Studio capacity consumed for Microsoft 365 Copilot Chat, select the **Microsoft 365 Copilot Chat** environment on the environment selection page. 
 
View the Copilot Studio capacity consumed within that environment. The following cards are displayed on the **Copilot Credits capacity** tab:

- **Capacity consumption by product**: This tile provides a product-focused summary of Copilot Credits consumed, showing the number of units deducted from prepaid capacity packs and/or pay-as-you-go units.

- **Copilot credit consumption details**: The grid displays a list of Copilot agents consuming capacity, including the associated product, feature name, and the count of billed versus nonbillable credits.

> [!TIP]
> To monitor credit consumption for agent flows, look for the **Agent flow actions** feature in the **Copilot credit consumption details** grid. When prepaid capacity is exhausted, new agent flow runs are blocked while the parent agent continues to function for non-flow interactions. Flow authors also see a design-time warning in the Copilot Studio designer. To resolve enforcement, reallocate capacity, purchase more credits, or [enable pay-as-you-go billing](#overage-management). For more information, see [Agent flow enforcement](/microsoft-copilot-studio/requirements-messages-management#agent-flow-enforcement).

## Manage capacity

Capacity allocation can be managed in the Power Platform admin center. 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. In the **Licensing** pane, under **Products**, select **Copilot Studio**.
1. Select the **Summary** tab.
1. Complete one of the following actions:

   - Select **Manage Capacity** from the **Prepaid capacity** card.

   -or-

   - Under the **Copilot Studio** heading, select **Manage Copilot Credits** or **Manage sessions**.

In the allocation panel, select an environment and specify the number of Copilot Credits to allocate in the **Copilot Credits** textbox.

### Overage management
When consumption exceeds the preallocated capacity, you can choose to draw capacity from the available capacity in the tenant or opt to bill overages to a linked pay-as-you-go plan.

:::image type="content" source="media/overage-management.png" alt-text="Select how you want to manage when capacity reaches zero in this environment.":::

### Manage monthly consumption limits for Copilot Studio agents

Admins can set monthly consumption limits for each Copilot Studio agent, regardless of whether the environment uses prepaid capacity or pay-as-you-go billing.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. In the **Licensing** pane, under **Products**, select **Copilot Studio**.
1. On the **Summary** tab, select **Manage Agents**. The **Agents** page appears where you can:
   
   - Search for a specific agent.
   - View all Copilot Studio agents across the tenant that incur billing charges.
   - See configured copilot credit limits, if any.
   - See month-to-date billed credits.
   - Turn off an agent.
   - View the environment each agent belongs to.
   - Monitor agent status, such as **Nearing limit**, **Over limit**, or **Within limit**. 

   You can set a monthly limit for any agent directly from this page. For example, if an agent consumes more credits than expected, you can define a limit to control usage:
   - **Prepaid environments**: The agent must stay within the allocated pool.
   - **Pay-as-you go environments**: You can set any limit, and usage is billed accordingly.

   After you set limits, you can configure two key guardrails:
   - **Notifications**: Admins, both at the environment and tenant level, receive alerts when an agent's usage approaches the defined limit.
   - **Hard stop**: The agent is automatically turned off once it hits the defined limit.
  
   :::image type="content" source="media/agents-capacity-limits.png" alt-text="Tenant capacity extension in admin center." lightbox="media/agents-capacity-limits.png":::
   
## Frequently asked questions

### What is a Copilot credit?

A Copilot credit represents a single interaction between a user and a Copilot agent, counted as one unit of consumption. Each credit is defined as a request sent to Copilot that prompts a response or action.

### Why should I use a pay-as-you-go plan?
Pay-as-you-go plans provide these benefits:

- **Flexibility**: Since your usage might fluctuate, pay-as-you-go plans allow for scalability and flexibility. You pay for only what you use.
- **Business continuity**: Because Copilot Studio is the way to pay for the use of agents that are critical to business continuity, the pay-as-you-go model overcomes any concern associated with reaching the limits of purchased Copilot credits.
- **Availability**: Your users can benefit from the agents you build, without requiring separate licenses.
- **Cost savings**: Reduce the hassle of prepaid capacity inventory management. No more unused capacity expires at the end of the month.
- **No commitment**: Get started with pay-as-you-go right away without locking into any long-term commitments and without any upfront costs.

### If I use the pay-as-you-go plan, can I grant my users access to Copilot Studio?
Yes, you can manage access to Copilot Studio. In the Power Platform admin center, go to **Settings** and update the **Copilot Author** setting. Assign a security group, and only members of that group have access to Copilot Studio.
