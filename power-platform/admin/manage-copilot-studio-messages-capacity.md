---
title: Manage Copilot Studio messages and capacity 
description: Learn how to manage Copilot Studio messages and capacity.
author: amiyapatr-zz
ms.date: 11/22/2024
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

Capacity management features allow administrators to allocate pre-purchased capacity across environments, within the tenant, based on anticipated usage of Copilot agents in each environment. The capacity management panel includes daily consumption data at the environment-level for up to three months, helping to determine appropriate capacity needs.

The consumption monitoring views in capacity management provide detailed, daily usage data for the current month-to-date, the last two full months, and monthly data for the past 12 months, supporting budgeting and licensing planning.

The licensing summary view shows usage of both pre-paid and session-based capacity units.

Purchasing a Copilot Studio license includes a specified number of billed message units pooled across the tenant, which must be assigned to an environment to allow Copilot Studio features for agents in that environment.

## Pay-as-you-go messages card
This card displays the count of active billing plans with the Copilot Studio meter applied, along with the month-to-date total of Copilot Studio message units billed to these plans.

## Pre-paid capacity card
The Pre-paid capacity card shows the number of pre-paid capacity units that have been purchased, assigned, and consumed. These units can be either session-based or message capacity units, with a link provided to manage each type.
 
## Capacity consumption by product
This tile presents a product-focused view of Copilot message units consumed, detailing the number of units deducted from pre-paid capacity packs and/or pay-as-you-go units.
 
## Total capacity consumption trend
Displays the daily trend of capacity consumption over the past three months.

## Message usage by environment
Highlights the top environments based on Copilot Studio message usage.

# Environment usage page
This page provides details on the Copilot Studio message capacity consumed per environment, including the number of messages deducted from the pre-paid capacity and the units billed under pay-as-you-go plans. It also indicates the environment's status, such as whether it's within capacity or in overage, if capacity is allocated, and if pay-as-you-go is used.

## Environment page
You can choose a specific environment to view the Copilot Studio capacity consumed within that environment.

## Capacity consumption by product
This tile provides a product-focused summary of Copilot message units consumed, showing the number of units deducted from pre-paid capacity packs and/or pay-as-you-go units.

## Message consumption by resource:
The grid displays a list of Copilot agents consuming capacity, including the associated product, feature name, and the count of billed versus non-billable messages.

## Managing capacity:
Capacity allocation can be managed in the Power Platform admin center. To allocate, go to **Billing > Licenses > Copilot Studio** and either select **Manage Capacity** from the **Pre-paid capacity** card or use **Manage Messages** or **Sessions** from the top navigation bar. In the allocation panel, select an environment and specify the number of messages to allocate in the **Messages** textbox.

## Overage management:
When consumption exceeds the pre-allocated capacity, you can choose to draw capacity from the available capacity in the tenant or opt to bill overages to a linked pay-as-you-go plan.

## Frequently asked questions

### What is a Message?

A message represents a single interaction between a user and a Copilot agent, counted as one unit of consumption. Each message is defined as a request sent to Copilot that prompts a response or action.

### Why should I use a pay-as-you-go plan?
Pay-as-you-go plans provide these benefits:

- **Flexibility**: Since your usage may fluctuate, pay-as-you-go plans allow for scalability and flexibility. You pay for only what you use.
- **Business continuity**: Given that Copilot Studio is the way to pay for the use of agents that are critical to business continuity, the pay-as-you-go model overcomes any concern associated with reaching the limits of purchased message quantities.
- **Availability**: Your users can benefit from the agents you build, without requiring separate licenses.
- **Cost savings**: Reduce the hassle of pre-paid capacity inventory management. No more unused capacity expiring at the end-of-the-month.
- **No commitment**: Get started with pay-as-you-go right away without locking into any long-term commitments and without any upfront costs.

