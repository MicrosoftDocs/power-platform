---
title: Manage Copilot Studio credits and capacity 
description: Learn how to manage Copilot Studio credits and capacity.
author: amiyapatr-zz
ms.date: 08/29/2025
ms.reviewer: sericks
ms.topic: how-to
ms.subservice: admin
ms.author: ampatra
ms.custom: bap-template, NewPPAC
search.audienceType: 
 - admin
---

# Manage Copilot Studio credits and capacity 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The Microsoft Copilot Studio capacity management experience in the Power Platform admin center allows administrators to manage Copilot Studio credit capacity, while monitoring overall capacity consumption. This experience provides an overview of the licensing models in use. This experience allows administrators to efficiently manage their available session capacity.

## View summary information

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. In the **Licensing** pane, under **Products**, select **Copilot Studio**.
1. Select the **Summary** tab.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Billing** > **Licenses**. The **Licenses** page is displayed.
1. Select the **Summary** tab.
2. In the **Summaries** section, select **Copilot Studio**.

---

The licensing summary view shows usage of both prepaid and session-based capacity units.

Purchasing a Copilot Studio license includes a specified number of billed Copilot credits pooled across the tenant, which must be assigned to an environment to allow Copilot Studio features for agents in that environment.

Capacity management features allow administrators to allocate prepurchased capacity across environments, within the tenant, based on anticipated usage of Copilot agents in each environment. The **Capacity summary** section of the page includes daily consumption data at the environment level for up to three months, helping to determine appropriate capacity needs.

The consumption monitoring views in capacity management provide detailed, daily usage data for the current month-to-date, the last two full months, and monthly data for the past 12 months, supporting budgeting and licensing planning.

### Capacity summary

When viewing the Copilot Studio summary, the following cards are displayed in the **Capacity summary** section on the page and provide information to you.

:::image type="content" source="media/environment-tab.png" alt-text="The following cards are displayed in the **Capacity summary** section on the page.":::

#### Pay-as-you-go credits
This card displays the count of active billing plans with the Copilot Studio meter applied, along with the month-to-date total of Copilot Studio credit  billed to these plans. A billing plan in the Power Platform admin center is a configuration that allows administrators to group one or more environments, allowing them to track and bill Copilot Studio credit capacity usage directly to an Azure subscription on a pay-as-you-go basis.

#### Prepaid capacity
The Prepaid capacity card shows the number of prepaid capacity units that have been purchased, assigned, and consumed. These units can be either session-based or Copilot credit capacity units, with a link provided to manage each type.

### Copilot credits capacity tab

The following cards are displayed in the **Copilot credit capacity** tab:

- **Capacity consumption by product**: This tile presents a product-focused view of Copilot Studio credit units consumed, detailing the number of units deducted from prepaid capacity packs and/or pay-as-you-go units.

  If Copilot Studio credits are consumed for Microsoft 365 Copilot Chat, the number of units consumed can be found under the Microsoft 365 Copilot Chat product.
 
- **Total capacity consumption trend**: Displays the daily trend of capacity consumption over the past three months.

- **Copilot credit usage by environment**: Highlights the top environments based on Copilot Studio credit usage.

## View credit capacity consumed per environment
The **Environments** tab provides details on the Copilot Studio credit capacity consumed per environment, including the number of Copilot credits deducted from the prepaid capacity and the units billed under pay-as-you-go plans. It also indicates the environment's status, such as whether it's within capacity or in overage, if capacity is allocated, and if pay-as-you-go is used.

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. In the **Licensing** pane, under **Products**, select **Copilot Studio**.
1. Select the **Environments** tab.
1. Select the **Select environment** button.
1. The **Select an environment** pane is displayed.
1. Select the environment you want to use and select the **Select** button.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Billing** > **Licenses**. The **Licenses** page is displayed.
1. Select the **Environments** tab.
1. Select the **Select environment** button.
1. The **Select an environment** pane is displayed.
1. Select the environment you want to use and select the **Select** button.
1. In the **Summaries** section, select **Copilot Studio**.

---

To view Copilot Studio capacity consumed for Microsoft 365 Copilot Chat, select the **Microsoft 365 Copilot Chat** environment on the environment selection page. 
 
View the Copilot Studio capacity consumed within that environment. The following cards are displayed on the **Copilot credits capacity** tab:

- **Capacity consumption by product**: This tile provides a product-focused summary of Copilot credits consumed, showing the number of units deducted from prepaid capacity packs and/or pay-as-you-go units.

- **Copilot credit consumption details**: The grid displays a list of Copilot agents consuming capacity, including the associated product, feature name, and the count of billed versus nonbillable credits.

## Manage capacity
Capacity allocation can be managed in the Power Platform admin center. 

To allocate, complete the following steps depending on whether you're using the new admin center or the classic admin center .

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. In the **Licensing** pane, under **Products**, select **Copilot Studio**.
1. Select the **Summary** tab.
1. Do one of the following:

   - Select **Manage Capacity** from the **Prepaid capacity** card.

   -or-

   - Under the **Copilot Studio** heading, select **Manage Copilot credits** or **Manage sessions**.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Billing** > **Licenses**. The **Licenses** page is displayed.
1. Select the **Summary** tab.
1. In the **Summaries** section, select **Copilot Studio**.
1. Do one of the following:

   - Select **Manage Capacity** from the **Prepaid capacity** card.

   -or-

   - Under the **Copilot Studio** heading, select **Manage Copilot credits** or **Manage sessions**.
   

---

In the allocation panel, select an environment and specify the number of Copilot credits to allocate in the **Copilot credits** textbox.

### Overage management
When consumption exceeds the preallocated capacity, you can choose to draw capacity from the available capacity in the tenant or opt to bill overages to a linked pay-as-you-go plan.

:::image type="content" source="media/overage-management.png" alt-text="Select how you want to manage when capacity reaches zero in this environment.":::

### Manage monthly consumption limits for Copilot Studio agents (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

Admins can define monthly consumption limits for each Copilot Studio agent, regardless of whether the environment uses pre-paid capacity or pay-as-you-go billing.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. In the **Licensing** pane, under **Products**, select **Copilot Studio**.
1. On the **Summary** tab, select **Manage Agents**. The **Agents** page is displayed where you can:
   
   - Serach for a specific agent.
   - View all Copilot Studio agents across the tenant that have incured billing charges.
   - See configured message limits, if any.
   - See month-to-date billed credits.
   - Turn an agent off.
   - View  the environment each agent belongs to.
   - Monitor agent status, such as **Nearing limit**, **Over limit**, or **Within limit**. 

   You can set a monthly limit for any agent directly from this page. For example, if an agent is consuming more credits than expected, you can define a limit to control usage:
   - **Prepaid environments**: The agent must stay within the allocated pool.
   - **Pay-as-you go environments**: You can set any limit, and usage is billed accordingly.

   Once limits are in place, you can configure two, key guardrails:
   - **Notifications**: Admins, both at the environment and tenant level, receive alerts when an agent’s usage approaches the defined limit.
   - **Hard stop**: The agent is automatically turned off once it hits the defined limit.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]
   
## Frequently asked questions

### What is a Copilot credit?

A Copilot credit represents a single interaction between a user and a Copilot agent, counted as one unit of consumption. Each credit is defined as a request sent to Copilot that prompts a response or action.

### Why should I use a pay-as-you-go plan?
Pay-as-you-go plans provide these benefits:

- **Flexibility**: Since your usage may fluctuate, pay-as-you-go plans allow for scalability and flexibility. You pay for only what you use.
- **Business continuity**: Given that Copilot Studio is the way to pay for the use of agents that are critical to business continuity, the pay-as-you-go model overcomes any concern associated with reaching the limits of purchased Copilot credits.
- **Availability**: Your users can benefit from the agents you build, without requiring separate licenses.
- **Cost savings**: Reduce the hassle of prepaid capacity inventory management. No more unused capacity expiring at the end of the month.
- **No commitment**: Get started with pay-as-you-go right away without locking into any long-term commitments and without any upfront costs.

### If I have used the pay-as-you-go plan, can I grant my users access to Copilot Studio?
Yes, you can manage access to Copilot Studio. In the Power Platform admin center, navigate to **Settings** and update the **Copilot Author** setting. There, you can assign a security group, and only members of that group have access to Copilot Studio.

