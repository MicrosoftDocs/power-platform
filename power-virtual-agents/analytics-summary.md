---
title: "Report analytics, performance, and usage (contains video)"
description: "The Summary analytics page shows you the scope of analytics, clustered with AI technology, so you can instantly see what topics and bots need improving."
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: analysis, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Analyze bot performance and usage in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

The **Summary** tab on the **Analytics** page gives you a broad overview of your bot's performance. It uses artificial intelligence (AI) technology to show you which topics are having the greatest impact on escalation rate, abandon rate, and resolution rate.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mQpm]
>

:::image type="content" source="media/analytics-summary/overview-analytics.png" alt-text="The Analytics summary page.":::

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

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).

## Summary charts

:::image type="content" source="media/analytics-summary/summary-charts.png" alt-text="Summary charts." border="false":::

The summary charts summarize the key performance indicators for the specified time period and the percent change over the period.

| Description | Details |
|---|---|
| Total sessions | The total number of sessions within the specified time period. |
| Engagement rate | The percentage of total sessions that became engaged. |
| Resolution rate | The percentage of engaged sessions that were resolved. |
| Escalation rate | The percentage of engaged sessions that were escalated. |
| Abandon rate | The percentage of engaged sessions that were abandoned. |
| CSAT | The graphical view of the average of customer satisfaction (CSAT) scores for sessions in which customers respond to an end-of-session request to take the survey. |

## Engagement over time chart

The **Engagement over time** chart provides a graphical view of the number of engaged and unengaged sessions over time.

| Description | Details                                 |
| ----------- | --------------------------------------- |
| Engaged     | The daily number of engaged sessions.   |
| Unengaged   | The daily number of unengaged sessions. |

## Session outcomes over time chart

The **Session outcomes over time** chart provides a graphical view of the daily resolution rate, escalation rate, and abandon rate over the specified time period.

| Description | Details                               |
| ----------- | ------------------------------------- |
| Resolved    | The daily rate of resolved sessions.  |
| Escalated   | The daily rate of escalated sessions. |
| Abandoned   | The daily rate of abandoned sessions. |

## Resolution rate drivers chart

The **Resolution rate drivers** chart displays topics in order of their impact on the resolution rate over the specified time period.

| Description | Details |
|-------------|---|
| Topic       | A Microsoft Copilot Studio topic. |
| Rate        | The percentage of engaged sessions for the topic that were resolved. |
| Impact      | The topic's resolution rate impact score. The resolution rate impact score is the overall resolution rate including the topic minus the overall resolution rate excluding the topic. |

The chart displays the impact as a percentage. Topics with a positive impact percentage are topics with a higher than average resolution rate&mdash;they increased the overall resolution rate of your bot.

Increase the resolution rate of topics with high negative impact percentages to more quickly improve the overall resolution rate for your bot.

To see additional information about each topic, select the **Detail** link to display the topic details page. For more information, see [Topic details page](analytics-topic-details.md).

## Escalation rate drivers chart

The **Escalation rate drivers** chart displays topics in order of their impact on the escalation rate over the specified time period.

| Description | Details |
|-------------|---|
| Topic       | A Microsoft Copilot Studio topic. |
| Rate        | The percentage of engaged sessions for the topic that were escalated. |
| Impact      | The topic's escalation rate impact score. The escalation rate impact score is the overall escalation rate including the topic minus the overall escalation rate excluding the topic. |

The chart displays the impact as a percentage. Topics with a positive impact percentage are topics with a greater than average escalation rate&mdash;they increased the overall escalation rate of your bot.

Lower the escalation rate of topics with high impact percentages to more quickly decrease the escalation rate for your bot.

To see additional information about each topic, select the **Detail** link to display the topic details page. For more information, see [Topic details page](analytics-topic-details.md).

## Abandon rate drivers chart

The **Abandon rate drivers** chart displays topics in order of their impact on the abandon rate over the specified time period.

| Description | Details |
|-------------|---|
| Topic       | A Microsoft Copilot Studio topic. |
| Rate        | The percentage of engaged sessions for the topic that were abandoned. |
| Impact      | The topic's abandon rate impact score. The abandon rate impact score is the overall abandon rate including the topic minus the overall abandon rate excluding the topic. |

The chart displays the impact as a percentage. Topics with a positive impact percentage are topics with a greater than average abandon rate&mdash;they increased the overall abandon rate of your bot.

Lower the abandon rate of topics with high impact percentages to more quickly decrease the abandon rate for your bot.

To see additional information about each topic, select the **Detail** link to display the topic details page. For more information, see [Topic details page](analytics-topic-details.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
