---
title: Summarize bot analytics, performance, and usage (preview)
description: The Summary analytics page shows you at a glance what bots and topics need to be improved in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 01/23/2023
ms.topic: overview
author: iaanw
ms.author: iawilt
ms.custom: analysis, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Summarize your bot's performance and usage (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

The **Summary** tab on the **Analytics** page gives you a broad overview of your bot's performance. It uses artificial intelligence (AI) technology to show you which topics are having the greatest impact on escalation rate, abandon rate, and resolution rate.

:::image type="content" source="media/analytics-summary/overview-analytics.png" alt-text="Screenshot of the Power Virtual Agents Analytics Summary page.":::

> [!TIP]
> By default, the page shows you key performance indicators for the last seven days. To change the time period, use the date controls at the top of the page.

_Analytics sessions_ track user engagement with your bot and try to capture how well your bot handles user tasks. A single conversation can contain one or more analytics sessions. Each session is associated with a specific topic. The last non-system topic triggered&mdash;or the first system topic triggered, if no non-system topics were triggered&mdash;is associated with the analytic session.

The summary charts measure how well your bot is doing and help you find the topics with the most impact on your bot's performance. A session will time out after 30&nbsp;minutes of inactivity.

- A session starts when a user interacts with your bot or the bot sends a proactive message to the user. The session begins in an _unengaged_ state.
- A session becomes _engaged_ when a non-system topic is triggered or the session is escalated. Once it's engaged, it remains engaged. An engaged session will have one of the following outcomes: _resolved_, _escalated_, or _abandoned_.
- A session ends and is considered _escalated_ when the **Escalate** topic is triggered or a **Transfer to agent** node is run. (The current analytics session ends, whether the conversation transfers to a live agent or not.)
- A session ends and is considered _resolved_ when either:
  - The **Confirmed Success** topic is triggered.
  - The **End of Conversation** topic is triggered and the user confirms that the interaction was a success or lets the session time out.
- A session ends and is considered _abandoned_ when an engaged session times out and it didn't reach a resolved or escalated state.

The summary tab includes various charts with graphical views of your bot's key performance indicators. The remainder of this article describes each chart in more detail.

To get additional information about each topic, select the **Detail** link in a chart. [Get more information about the topic details page](analytics-topic-details.md).

## Summary charts

:::image type="content" source="media/analytics-summary/summary-charts.png" alt-text="Screenshot of the summary charts, including total sessions, engagement rate, resolution rate, escalation rate, abandon rate, and CSAT.":::

The summary charts summarize your bot's key performance indicators and the percent change for the specified period.

| Description | Details |
| --- | --- |
| Total sessions | The total number of bot sessions |
| Engagement rate | The percentage of total sessions that are engaged |
| Resolution rate | The percentage of engaged sessions that are resolved |
| Escalation rate | The percentage of engaged sessions that are escalated |
| Abandon rate | The percentage of engaged sessions that are abandoned |
| CSAT | The graphical view of the average of customer satisfaction (CSAT) scores for sessions in which customers respond to an end-of-session request to take the survey |

## Engagement over time

The Engagement over time chart provides a graphical view of the number of engaged and unengaged sessions over time.

| Description | Details |
| --- | --- |
| Engaged | The daily number of engaged sessions |
| Unengaged | The daily number of unengaged sessions |

## Session outcomes over time

The Session outcomes over time chart provides a graphical view of the daily resolution rate, escalation rate, and abandon rate over the specified time period.

| Description | Details |
| --- | --- |
| Resolved | The daily rate of resolved sessions |
| Escalated | The daily rate of escalated sessions |
| Abandoned | The daily rate of abandoned sessions |

## Resolution rate drivers

The **Resolution rate drivers** chart displays topics in order of their impact on the resolution rate over the specified time period.

| Description | Details |
|-------------|---|
| Topic       | A Power Virtual Agents topic. |
| Rate        | The percentage of engaged sessions for the topic that were resolved. |
| Impact      | The topic's resolution rate impact score. The resolution rate impact score is the overall resolution rate including the topic minus the overall resolution rate excluding the topic. |

The chart displays the impact as a percentage. Topics with a positive impact percentage are topics with a higher than average resolution rate&mdash;they increased the overall resolution rate of your bot.

Increase the resolution rate of topics with high negative impact percentages to more quickly improve the overall resolution rate for your bot.

## Escalation rate drivers

The **Escalation rate drivers** chart displays topics in order of their impact on the escalation rate over the specified time period.

| Description | Details |
|-------------|---|
| Topic       | A Power Virtual Agents topic. |
| Rate        | The percentage of engaged sessions for the topic that were escalated. |
| Impact      | The topic's escalation rate impact score. The escalation rate impact score is the overall escalation rate including the topic minus the overall escalation rate excluding the topic. |

The chart displays the impact as a percentage. Topics with a positive impact percentage are topics with a greater than average escalation rate&mdash;they increased the overall escalation rate of your bot.

Lower the escalation rate of topics with high impact percentages to more quickly decrease the escalation rate for your bot.

## Abandon rate drivers

The **Abandon rate drivers** chart displays topics in order of their impact on the abandon rate over the specified time period.

| Description | Details |
|-------------|---|
| Topic       | A Power Virtual Agents topic. |
| Rate        | The percentage of engaged sessions for the topic that were abandoned. |
| Impact      | The topic's abandon rate impact score. The abandon rate impact score is the overall abandon rate including the topic minus the overall abandon rate excluding the topic. |

The chart displays the impact as a percentage. Topics with a positive impact percentage are topics with a greater than average abandon rate&mdash;they increased the overall abandon rate of your bot.

Lower the abandon rate of topics with high impact percentages to more quickly decrease the abandon rate for your bot.

[!INCLUDE[footer-include](includes/footer-banner.md)]
