---
title: Manage Copilot Studio messages and capacity 
description: Learn how to manage Copilot Studio messages and capacity.
author: amiyapatr-zz
ms.date: 12/02/2024
ms.reviewer: sericks
ms.topic: conceptual
ms.subservice: admin
ms.author: ampatra
ms.custom: bap-template
search.audienceType: 
 - admin
---

# Manage Copilot Studio messages and capacity 

The Microsoft Copilot Studio capacity management experience in the Power Platform admin center allows administrators to manage Copilot Studio message and session capacity, while monitoring overall capacity consumption. This experience also provides an overview of the licensing models in use.

## Use the Summary tab

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Billing** > **Licenses**. The **Licenses** page is displayed.
1. Select the **Summary** tab.
2. In the **Summaries** section, select **Copilot Studio**.


# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. In the **Licensing** pane, under **Products**, select **Copilot Studio**.
1. Select the **Summary** tab.

---

The licensing summary view shows usage of both prepaid and session-based capacity units.

Purchasing a Copilot Studio license includes a specified number of billed message units pooled across the tenant, which must be assigned to an environment to allow Copilot Studio features for agents in that environment.

Capacity management features allow administrators to allocate prepurchased capacity across environments, within the tenant, based on anticipated usage of Copilot agents in each environment. The **Capacity summary** section of the page includes daily consumption data at the environment-level for up to three months, helping to determine appropriate capacity needs.

The consumption monitoring views in capacity management provide detailed, daily usage data for the current month-to-date, the last two full months, and monthly data for the past 12 months, supporting budgeting and licensing planning.

### Capacity summary

When viewing the Copilot Studio summary, the following cards are displayed in the **Capacity summary** section on the page and provide information to you.

:::image type="content" source="media/environment-tab.png" alt-text="The following cards are displayed in the **Capacity summary** section on the page and provide information to you.":::

### Pay-as-you-go messages
This card displays the count of active billing plans with the Copilot Studio meter applied, along with the month-to-date total of Copilot Studio message units billed to these plans.

### Prepaid capacity
The Prepaid capacity card shows the number of prepaid capacity units that have been purchased, assigned, and consumed. These units can be either session-based or message capacity units, with a link provided to manage each type.

#### Messages capacity tab

The following cards are displayed in the **Messages capacity** tab.

##### Capacity consumption by product
This tile presents a product-focused view of Copilot message units consumed, detailing the number of units deducted from prepaid capacity packs and/or pay-as-you-go units.
 
##### Total capacity consumption trend
Displays the daily trend of capacity consumption over the past three months.

##### Message usage by environment
Highlights the top environments based on Copilot Studio message usage.

## Use the Environments tab
The **Environments** tab  provides details on the Copilot Studio message capacity consumed per environment, including the number of messages deducted from the prepaid capacity and the units billed under pay-as-you-go plans. It also indicates the environment's status, such as whether it's within capacity or in overage, if capacity is allocated, and if pay-as-you-go is used.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Billing** > **Licenses**. The **Licenses** page is displayed.
1. Select the **Environments** tab.
1. Select the **Select environment** button.
1. The **Select an environment** pane is displayed.
1. Select the environment you want to use and select the **Select** button.
1. In the **Summaries** section, select **Copilot Studio**.


# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. In the **Licensing** pane, under **Products**, select **Copilot Studio**.
1. Select the **Environments** tab.
1. Select the **Select environment** button.
1. The **Select an environment** pane is displayed.
1. Select the environment you want to use and select the **Select** button.

---
 
View the Copilot Studio capacity consumed within that environment. The following cards are displayed on the **Messages capacity** tab.

### Capacity consumption by product
This tile provides a product-focused summary of Copilot message units consumed, showing the number of units deducted from prepaid capacity packs and/or pay-as-you-go units.

### Message consumption details
The grid displays a list of Copilot agents consuming capacity, including the associated product, feature name, and the count of billed versus nonbillable messages.

## Manage capacity
Capacity allocation can be managed in the Power Platform admin center. 

To allocate, complete the following steps depending on whether you're using the classic admin center or the new admin center.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Billing** > **Licenses**. The **Licenses** page is displayed.
1. Select the **Summary** tab.
1. In the **Summaries** section, select **Copilot Studio**.
1. Do one of the following:

   - Select **Manage Capacity** from the **Prepaid capacity** card

   -or-

   - Under the **Copilot Studio** heading, select **Manage messages** or **Manage sessions**.
   


# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. On the navigation pane, select **Licensing**.
1. In the **Licensing** pane, under **Products**, select **Copilot Studio**.
1. Select the **Summary** tab.
1. Do one of the following:

   - Select **Manage Capacity** from the **Prepaid capacity** card

   -or-

   - Under the **Copilot Studio** heading, select **Manage messages** or **Manage sessions**.

---

In the allocation panel, select an environment and specify the number of messages to allocate in the **Messages** textbox.

### Overage management
When consumption exceeds the preallocated capacity, you can choose to draw capacity from the available capacity in the tenant or opt to bill overages to a linked pay-as-you-go plan.

:::image type="content" source="media/overage-management.png" alt-text="Select how you want to manage when capacity reaches zero in this environment.":::

## Frequently asked questions

### What is a message?

A message represents a single interaction between a user and a Copilot agent, counted as one unit of consumption. Each message is defined as a request sent to Copilot that prompts a response or action.

### Why should I use a pay-as-you-go plan?
Pay-as-you-go plans provide these benefits:

- **Flexibility**: Since your usage may fluctuate, pay-as-you-go plans allow for scalability and flexibility. You pay for only what you use.
- **Business continuity**: Given that Copilot Studio is the way to pay for the use of agents that are critical to business continuity, the pay-as-you-go model overcomes any concern associated with reaching the limits of purchased message quantities.
- **Availability**: Your users can benefit from the agents you build, without requiring separate licenses.
- **Cost savings**: Reduce the hassle of prepaid capacity inventory management. No more unused capacity expiring at the end-of-the-month.
- **No commitment**: Get started with pay-as-you-go right away without locking into any long-term commitments and without any upfront costs.

### If I have used the Pay-as-you-go plan, can I grant my users access to Copilot Studio
Yes, you can manage access to Copilot Studio. In the Power Platform admin center, navigate to **Settings** and update the **Copilot Author** setting. There, you can assign a security group, and only members of that group have access to Copilot Studio.
