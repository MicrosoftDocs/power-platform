---
ROBOTS: NOINDEX,NOFOLLOW
title: Analyze topic performance
description: See how your bot topics are performing and determine what you can do to improve customer satisfaction.
keywords: "PVA"
ms.date: 06/02/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: mboninco
ms.custom: analysis, ceX
ms.collection: virtual-agent
---

# Analyze your bot's topic performance

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

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

## Topic summary charts

The topic summary charts summarize the topic's performance indicators for the specified time period and the percent change over the period.

| Description | Details |
| --- | --- |
| Total sessions | The total number of sessions. |
| Average CSAT | The average customer satisfaction (CSAT) survey score. |
| Resolution rate | The percentage of engaged sessions that are resolved. A resolved session is an engaged session in which the user receives an end-of-session survey and either doesn't respond or responds "Yes." |
| Escalation rate | The percentage of engaged sessions that are escalated. An escalated session is an engaged session that's escalated to a human agent. |
| Abandon rate | The percentage of engaged sessions that are abandoned. An abandoned session is an engaged session that's not resolved or escalated after one hour from the beginning of the session. |

A blue indicator below the value indicates the percent change in a positive direction. A red indicator indicates the percent change in a negative direction.

## Impact summary charts

The impact summary charts summarize the impact of the topic on key performance indicators for the specified time period.

| Description | Details |
| --- | --- |
| CSAT impact | The topic's customer satisfaction impact score. The customer satisfaction impact score is the overall average CSAT survey score including the topic minus the overall average CSAT survey score excluding the topic. |
| Resolution rate impact | The topic's resolution rate impact score. The resolution rate impact score is the overall resolution rate including the topic minus the resolution rate excluding the topic. |
| Escalation rate impact | The topic's escalation rate impact score. The escalation rate impact score is the overall escalation rate including the topic minus the escalation rate excluding the topic. |
| Abandon rate impact | The topic's abandon rate impact score. The abandon rate impact score is the overall abandon rate including the topic minus the abandon rate excluding the topic. |

## Topic volume by date chart

The topic volume by date chart provides a graphical view of the number of sessions for the topic over the specified time period.

[!INCLUDE[footer-include](includes/footer-banner.md)]
