---
ROBOTS: NOINDEX,NOFOLLOW
title: Summarize bot analytics, performance, and usage
description: The Summary analytics page shows you at a glance what bots and topics need improving.
keywords: "PVA"
ms.date: 06/01/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: analysis, ceX
ms.collection: virtual-agent
---

# Summarize your bot's performance and usage

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

The Summary page gives you a broad overview of your bot's performance. It uses AI to show you which topics are having the greatest impact on [escalation rate](#escalation-rate-drivers), [abandon rate](#abandon-rate-drivers), and [resolution rate](#resolution-rate-drivers), among other key performance indicators.

:::image type="content" source="media/analytics-summary/overview-analytics.png" alt-text="Screenshot that shows the Analytics > Summary page.":::

The Summary page includes the following charts:

- [Summary charts](#summary-charts)
- [Engagement over time](#engagement-over-time)
- [Session outcomes over time](#session-outcomes-over-time)
- [Resolution rate drivers](#resolution-rate-drivers)
- [Escalation rate drivers](#escalation-rate-drivers)
- [Abandon rate drivers](#abandon-rate-drivers)

The engagement rate drivers, abandon rate drivers, and resolution rate drivers charts use natural language understanding to group issues as topics. These charts show you the topics that are having the most impact on the performance of your bot.

By default, the page displays key performance indicators for the last seven days. To change the time period shown, select a period start date and (optionally) period end date in the calendar controls.

## Summary charts

:::image type="content" source="media/analytics-summary/summary-charts.png" alt-text="Screenshot of the summary charts, including total sessions, engagement rate, resolution rate, escalation rate, abandon rate, and CSAT.":::

The summary charts summarize the key performance indicators and the percent change for the specified period.

| Description | Details |
| --- | --- |
| Total sessions | The total number of bot sessions. |
| Engagement rate | The percentage of total sessions that are engaged. An engaged session is one in which a user-created topic (as opposed to a system topic) is triggered, or the session ends in escalation. Engaged sessions can have one of three outcomes: resolved, escalated, or abandoned. |
| Resolution rate | The percentage of engaged sessions that are resolved. A resolved session is an engaged session in which the user receives an end-of-conversation survey that asks the question "Did that answer your question?" and the user either doesn't respond or responds "Yes." |
| Escalation rate | The percentage of engaged sessions that are escalated. An escalated session is an engaged session that's escalated to a human agent. |
| Abandon rate | The percentage of engaged sessions that are abandoned. An abandoned session is an engaged session that's not resolved or escalated after one hour from the beginning of the session. |
| CSAT | The graphical view of the average of customer satisfaction (CSAT) scores for sessions in which customers respond to an end-of-session request to take the survey. |

A blue up-and-down indicator next to the value indicates the percent change in a positive direction. A red indicator indicates the percent change in a negative direction.

## Engagement over time

The engagement over time chart provides a graphical view of the number of engaged and unengaged sessions over time. An engaged session is a session in which a user-created topic is triggered or the session ends in escalation.

| Description | Details |
| --- | --- |
| Engaged | The daily number of engaged sessions. |
| Unengaged | The daily number of unengaged sessions. |

## Session outcomes over time

The session outcomes over time chart provides a graphical view of the daily resolution rate, escalation rate, and abandon rate over the specified time period.

| Description | Details |
| --- | --- |
| Resolved | The daily rate of resolved sessions. A resolved session is an engaged session in which the user receives an end-of-conversation survey that asks the question "Did that answer your question?" and the user either doesn't respond or responds "Yes." |
| Escalated | The daily rate of escalated sessions. An escalated session is an engaged session that's escalated to a human agent. |
| Abandoned | The daily rate of abandoned sessions. An abandoned session is an engaged session that's not resolved or escalated after one hour from the beginning of the session. |

## Resolution rate drivers

The resolution rate drivers chart displays topics in order of their impact on the resolution rate over the specified time period.

| Description | Details |
| --- | --- |
| Topic | A Power Virtual Agents topic. |
| Rate | The percentage of engaged sessions for the topic that are resolved. A resolved session is an engaged session in which a customer receives an end-of-conversation survey and either doesn't respond to the survey or responds "Yes." |
| Impact | The topic's resolution rate impact score. The resolution rate impact score is the overall resolution rate including the topic minus the overall resolution rate excluding the topic. |

The chart displays the impact as a red or blue bar. A red bar indicates the topic's resolution time is greater than the average, with a negative impact on overall resolution rate. A blue bar indicates the resolution time is shorter, with a positive impact on overall resolution rate.

Improving the resolution rate for the top resolution-rate topics in red has the greatest impact on improving the overall resolution rate.

To get additional information about each topic, select the **Detail** link. [Get more information about the topic details page](analytics-topic-details.md).

## Escalation rate drivers

The escalation rate drivers chart displays topics in order of their impact on the escalation rate over the specified time period.

| Description | Details |
| --- | --- |
| Topic | A Power Virtual Agents topic. |
| Rate | The percentage of engaged sessions for the topic that are escalated. An escalated session is an engaged session that's escalated to a human agent. |
| Impact | The topic's escalation rate impact score. The escalation rate impact score is the overall escalation rate including the topic minus the overall escalation rate excluding the topic. |

The chart displays the impact as a red or blue bar. A red bar indicates the topic's escalation rate is greater than the average, with a negative impact on overall escalation rate. A blue bar indicates the escalation rate is smaller, with a positive impact on overall escalation rate.

Lowering the escalation rate for the topics in red has the greatest impact on improving the overall escalation rate.

To get additional information about each topic, select the **Detail** link. [Get more information about the topic details page](analytics-topic-details.md).

## Abandon rate drivers

The abandon rate drivers chart displays topics in order of their impact on the abandon rate over the specified time period.

| Description | Details |
| --- | --- |
| Topic | A Power Virtual Agents topic. |
| Rate | The percentage of engaged sessions for the topic that are abandoned. An abandoned session is an engaged session that's not resolved or escalated after one hour from the beginning of the interaction. |
| Impact | The topic's abandon rate impact score. The abandon rate impact score is the overall abandon rate including the topic minus the overall abandon rate excluding the topic. |

The chart displays the impact as a red or blue bar. A red bar indicates the topic's abandon rate is greater than the average, with a negative impact on overall abandon rate. A blue bar indicates the abandon rate is smaller, with a positive impact on overall abandon rate.

Improving the abandon rate for the top abandon-rate topics in red has the greatest impact on improving the overall abandon rate.

To get additional information about each topic, select the **Detail** link. [Get more information about the topic details page](analytics-topic-details.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
