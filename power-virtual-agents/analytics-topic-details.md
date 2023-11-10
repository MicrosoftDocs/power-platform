---
title: "Analyze topic performance"
description: "See how topics are performing, and determine what you can do to improve customer satisfaction."
keywords: "PVA"
ms.date: 

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: mboninco
ms.custom: analysis, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Analyze topic usage in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

The topic analytics pane provides a view into the performance of an individual topic and how it can be improved.

To display the topic analytics pane, select the **Detail** link for the topic in one of the following charts on the [Summary](analytics-summary.md) or [Customer Satisfaction](analytics-CSAT.md) tab:

- [Escalation rate drivers (Summary tab)](analytics-summary.md#escalation-rate-drivers-chart)
- [Abandon rate drivers (Summary tab)](analytics-summary.md#abandon-rate-drivers-chart)
- [Resolution rate drivers (Summary tab)](analytics-summary.md#resolution-rate-drivers-chart)
- [Customer satisfaction drivers (Customer Satisfaction tab)](analytics-CSAT.md)

> [!IMPORTANT]
> For Microsoft Teams, you need a license for [Dynamics 365 Customer Service Insights](/dynamics365/ai/customer-service-insights/licensing-case-capacity) to access the topic details charts.

Alternatively, open an individual topic from the [Topics page](authoring-create-edit-topics.md) and select **Analytics** at the top of the page.

:::image type="content" source="media/analytics-topic-details/canvas-button.png" alt-text="From the Topic details page, select the Analytics tab.":::

The topic details page includes a variety of charts with graphical views of a topic's key performance indicators. For information about each chart, see:

- [Topic summary charts](#topic-summary-charts)
- [Impact summary charts](#impact-summary-charts)
- [Topic Volume by Day chart](#topic-volume-by-day-chart)

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

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

## Topic Volume by Day chart

The Topic volume by day chart provides a graphical view of the number of sessions for the topic over the specified time period.

[!INCLUDE[footer-include](includes/footer-banner.md)]
