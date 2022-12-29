---
title: Analyze your bot's topic performance (preview)
description: See how your bot topics are performing and determine what improvements will increase customer satisfaction in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 12/09/2022
ms.topic: overview
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: mboninco
ms.custom: analysis, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Analyze your bot's topic performance (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

The topic details page provides a view into the performance of individual topics and how you might improve them.

You can get to the topic details page in various ways.

- Select the **Detail** link in one of the following charts:
  - [Escalation rate drivers (Summary page)](analytics-summary.md#escalation-rate-drivers)
  - [Abandon rate drivers (Summary page)](analytics-summary.md#abandon-rate-drivers)
  - [Resolution rate drivers (Summary page)](analytics-summary.md#resolution-rate-drivers)
  - [Customer satisfaction drivers (Customer Satisfaction page)](analytics-CSAT.md#customer-satisfaction-drivers)

  :::image type="content" source="media/analytics-topic-details/topic-details-link.png" alt-text="Screenshot of an escalation rate drivers chart, with the topic details link highlighted.":::

- Open an individual topic on the [Topics page](authoring-create-edit-topics.md) and select **Analytics** at the top of the page.

  :::image type="content" source="media/analytics-topic-details/canvas-button.png" alt-text="Screenshot of a topic page, with the Analytics tab highlighted.":::

- Hover over a topic on the Topics page, select the **More actions** icon, and then select **Go to analytics**.

  :::image type="content" source="media/analytics-topic-details/topic-button.png" alt-text="Screenshot of a list of topics on the Topics page, with the More actions icon and Go to analytics item highlighted.":::

The following charts on a topic details page provide graphical views of the topic's key performance indicators:

- [Topic summary charts](#topic-summary-charts)
- [Impact summary charts](#impact-summary-charts)
- [Topic volume by date chart](#topic-volume-by-date-chart)

## Definitions

The following table defines terms that are used in the charts.

| Term | Definition |
| --- | --- |
| Engaged session | A session in which a user-created topic (as opposed to a system topic) is triggered or the session ends in escalation; engaged sessions can have one of three outcomes: resolved, escalated, or abandoned |
| Resolved session | An engaged session in which the user receives an end-of-conversation survey that asks the question "Did that answer your question?" and the user either doesn't respond or responds "Yes" |
| Escalated session | An engaged session that's escalated to a human agent |
| Abandoned session | An engaged session that's not resolved or escalated after one hour from the beginning of the session |

## Topic summary charts

The topic summary charts summarize the topic's performance indicators for the specified time period and the percent change over the period.

| Description | Details |
| --- | --- |
| Total sessions | The total number of sessions |
| Average CSAT | The average customer satisfaction (CSAT) survey score |
| Resolution rate | The percentage of engaged sessions that are resolved |
| Escalation rate | The percentage of engaged sessions that are escalated |
| Abandon rate | The percentage of engaged sessions that are abandoned |

A blue indicator below the value indicates the percent change in a positive direction. A red indicator indicates the percent change in a negative direction.

## Impact summary charts

The impact summary charts summarize the impact of the topic on key performance indicators for the specified time period.

| Description | Details |
| --- | --- |
| CSAT impact | The overall average CSAT survey score including the topic minus the overall average CSAT survey score excluding the topic |
| Resolution rate impact | The overall resolution rate including the topic minus the resolution rate excluding the topic |
| Escalation rate impact | The overall escalation rate including the topic minus the escalation rate excluding the topic |
| Abandon rate impact | The overall abandon rate including the topic minus the abandon rate excluding the topic |

## Topic volume by date chart

The topic volume by date chart provides a graphical view of the number of sessions for the topic over the specified time period.

[!INCLUDE[footer-include](includes/footer-banner.md)]
