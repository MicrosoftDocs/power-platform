---
title: Metrics and recommendations for Power Automate
description: Learn more about the metrics and recommendations for Power Automate.
ms.subservice: admin
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/07/2025
ms.custom: NewPPAC
author: alaug
ms.author: alaug
ms.reviewer: sericks
search.audienceType: 
  - admin
contributors:
  - arjunmayur
  - trdehove
---

# Metrics and recommendations for Power Automate

Power Automate operational health metrics and recommendations are available in the new Power Platform admin center.

## View Power Automate metrics and recommendations

 1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
 1. In the navigation pane, select **Monitor**.
 1. In the **Monitor** pane, under **Products**, select **Power Automate**.

    The **Power Automate** page displays the metrics and recommendations.

## Power Automate metrics and recommendations

### Metric definitions

| Type | Metric | Definition | Support |
|---|---|---|---|
| Flows| Success rate| A percentage that describes how often flows are able to run successfully. | Generally available |
| Flows| Run count| Count of flow runs. | Generally available |
| Flows| Duration| Average (in seconds) total execution time of flow run. | Generally available |
| Desktop flows| Time in queue| The minimum time (in seconds) that the slowest 10% of desktop flows have to wait before a machine is assigned to run them. | Generally available |
| Work queues| Queued | Daily aggregation of every instance an item enters the **Queued** state, regardless of whether the same item transitions multiple times. | Public preview|
| Work queues| Processed | Daily aggregation of every instance an item enters the **Processed** state, regardless of whether the same item transitions multiple times. | Public preview|
| Work queues| Service Level Agreement (SLA) violation | Daily aggregation of every instance that an item expired because their SLA was breached. | Public preview|
| Work queues| SLA at risk |Daily aggregation of occurrences where items are identified as having their SLA at risk, according to the defined SLA strategy.| Public preview|
| Work queues| Business exceptions | Daily aggregation of every instance an item enters the **Business exception** state, regardless of whether the same item transitions multiple times. | Public preview|
| Work queues| IT exceptions | Daily aggregation of every instance an item enters the **IT exception** state, regardless of whether the same item transitions multiple times. | Public preview|
| Work queues| Generic exceptions | Daily aggregation of every instance an item enters the **Generic exception** state, regardless of whether the same item transitions multiple times | Public preview|

### Metric and recommendation pairings

| Metric | Secondary metric | Title of recommendation | Description of recommendation|
|---|---|---|---|
| Success rate | Not applicable  |There are one or more runs that need your attention. | Review the list of runs and open flows or run details to troubleshoot.| 
| Time in queue| Not applicable | Investigate and adjust the machine capacity and prioritization. | Your current machine capacity is preventing your desktop flows from running efficiently. Investigate and adjust the machine capacity and prioritization.  |


