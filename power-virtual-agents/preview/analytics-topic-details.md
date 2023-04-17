---
title: Analyze your bot's topic performance (preview)
description: See how your bot topics are performing and determine what improvements will increase customer satisfaction in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 01/23/2023
ms.topic: overview
author: iaanw
ms.author: iawilt
ms.reviewer: mboninco
ms.custom: analysis, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Analyze your bot's topic performance (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

The topic analytics pane provides a view into the performance of an individual topic and how it can be improved.

To display the topic analytics pane, select the **Detail** link for the topic in one of the following charts on the [Summary](analytics-summary.md) or [Customer Satisfaction](analytics-CSAT.md) tab:

- [Escalation rate drivers (Summary page)](analytics-summary.md#escalation-rate-drivers)
- [Abandon rate drivers (Summary page)](analytics-summary.md#abandon-rate-drivers)
- [Resolution rate drivers (Summary page)](analytics-summary.md#resolution-rate-drivers)
- [Customer satisfaction drivers (Customer Satisfaction page)](analytics-CSAT.md#customer-satisfaction-drivers)

Alternatively, open an individual topic from the [Topics page](authoring-create-edit-topics.md) and select **Analytics** at the top of the page.

  :::image type="content" source="media/analytics-topic-details/canvas-button.png" alt-text="Screenshot of a topic page, with the Analytics tab highlighted.":::

The following charts provide graphical views of the topic's key performance indicators:

- [Topic summary charts](#topic-summary-charts)
- [Impact summary charts](#impact-summary-charts)
- [Topic volume by date chart](#topic-volume-by-date-chart)

## Topic summary charts

The Topic summary charts summarize the topic's performance indicators for the specified time period and the percent change over the period.

| Description     | Details                                                                              |
|-----------------|--------------------------------------------------------------------------------------|
| Total sessions  | The total number of sessions within the specified time period.                       |
| Average CSAT    | The average customer satisfaction (CSAT) survey score for the specified time period. |
| Resolution rate | The percentage of engaged sessions that are resolved.                                |
| Escalation rate | The percentage of engaged sessions that are escalated.                               |
| Abandon rate    | The percentage of engaged sessions that are abandoned.                               |

## Impact summary charts

The Impact summary charts summarize the impact of the topic on key performance indicators for the specified time period.

| Description | Details |
|---|---|
| CSAT impact | The topic's customer satisfaction impact score. The customer satisfaction impact score is the overall average CSAT survey score including the topic minus the overall average CSAT survey score excluding the topic. |
| Resolution rate impact | The topic's resolution-rate impact score. The resolution-rate impact score is the overall resolution rate including the topic minus the resolution rate excluding the topic. |
| Escalation rate impact | The topic's escalation-rate impact score. The escalation-rate impact score is the overall escalation rate including the topic minus the escalation rate excluding the topic. |
| Abandon rate impact | The topic's abandon-rate impact score. The abandon-rate impact score is the overall abandon rate including the topic minus the abandon rate excluding the topic. |

## Topic volume by date chart

The topic volume by date chart provides a graphical view of the number of sessions for the topic over the specified time period.

[!INCLUDE[footer-include](includes/footer-banner.md)]
