---
title: "Report analytics, performance, and usage (contains video)"
description: "The Summary analytics page shows you the scope of analytics, clustered with AI technology, so you can instantly see what topics and bots need improving."
keywords: "PVA"
ms.date: 12/13/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: analysis, ceX
ms.collection: virtual-agent
---

# Analyze bot performance and usage in Power Virtual Agents

[!INCLUDE[public preview disclaimer](includes/public-preview-disclaimer-prod.md)]

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](analytics-summary.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/analytics-summary-teams.md)

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mQpm]
>

The **Summary** tab on the **Analytics** page gives you a broad overview of your bot's performance. It uses artificial intelligence (AI) technology to show you which topics are having the greatest impact on escalation rate, abandon rate, and resolution rate.

:::image type="content" source="media/analytics-summary/overview-analytics.png" alt-text="The Analytics summary page.":::

> [!TIP]
> By default, the page shows you key performance indicators for the last seven days. To change the time period, use the date controls at the top of the page.

Each task a user asks of your bot defines an _analytics session_. These charts measure how well your bot is doing and help you find the topics with the most impact on your bot's performance.

- A session starts when a user interacts with your bot or the bot sends a proactive message to the user. The session begins in an _unengaged_ state.
- A session becomes _engaged_ when a non-system topic is triggered or the session is escalated. Once it's engaged, it stays engaged.
- A session is considered _escalated_ when the **Escalate** topic is triggered or a **Transfer to agent** node is run.
- A session is considered _resolved_ when the user receives an end-of-conversation survey that asks the question _"Did that answer your question?"_ and the user either does not respond or responds _Yes_.
- If the user begins a new task after the session is resolved or escalated, the session remains engaged, but its state changes, based on how the conversation goes.
- A session ends after the conversation is idle with no input from the user for 30&nbsp;minutes.
- A session is considered _abandoned_ when the session ends and it is not in a resolved or escalated state.

<!-- Take 2:

An _analytics session_ attempts to measure a task the user asks of your bot. These charts measure how well your bot is doing and help you find the topics with the most impact on your bot's performance.

- A session starts when a user interacts with your bot or the bot sends a proactive message to the user.
- Sessions can be be engaged or unengaged and completed or uncompleted:
  - A session begins as unengaged and uncompleted.
  - A session becomes engaged when a non-system topic is triggered or the session is escalated.
  - A session becomes completed when:
    - 
- An 

-->
<!-- Clarifications on the above from Mike:

The first line is close but not quite correct, but I'm not sure how to phrase it in one sentence.

    Each **completed** task a user asks of your bot defines an _analytics session_,
    All **uncompleted** tasks a user asks of your bot that are not followed by a competed task defines an _analytics session_
    Where completed is where the users query is answered/Resolved or has been escalated to someone who may be able to help.

A session is considered resolved when the user receives an end-of-conversation survey that asks the question "Did that answer your question?" and the user either does not respond or responds Yes.

    The above is based on the default content, but the customer may change the logic. the survey question is not always asked.
    A session is considered resolved when either of the following two conditions are met:

    - The confirmed success topic is triggered. This usually occurs when the user responds Yes to the question "Did that answer your question?"
    - The user receives the question "Did that answer your question?" from the end of conversation topic and does not respond.

If the user begins a new task after the session is resolved or escalated, the session remains engaged, but its state changes, based on how the conversation goes.

    The new session begins unengaged after the engaged session is completed.
    It's when the session continues after becoming engaged, but is not completed that it stays engaged.
-->

The summary tab includes a variety of charts with graphical views of your bot's key performance indicators. The remainder of this article describes each chart in more detail.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Summary charts

:::image type="content" source="media/analytics-summary/summary-charts.png" alt-text="Summary charts." border="false":::

The summary charts summarize the key performance indicators for the specified time period and the percent change over the period.

| Description | Details |
|---|---|
| Total sessions | The total number of sessions within the specified time period. |
| Engagement rate | The percentage of total sessions that became engaged. |
| Resolution rate | The percentage of engaged sessions that are resolved. |
| Escalation rate | The percentage of engaged sessions that are escalated. An escalated session is an engaged session that is escalated to a human agent. |
| Abandon rate | The percentage of engaged sessions that are abandoned. An abandoned session is an engaged session that is neither resolved nor escalated after one hour from the beginning of the session. |
| CSAT | The graphical view of the average of customer satisfaction (CSAT) scores for sessions in which customers respond to an end-of-session request to take the survey. |

A blue up-and-down indicator next to the value indicates the percent change in a positive direction. A red indicator indicates the percent change in a negative direction.

## Engagement over time chart

The **Engagement over time** chart provides a graphical view of the number of engaged and unengaged sessions over time. An engaged session is a session in which a user-created topic is triggered or the session ends in escalation.

| Description | Details                                 |
| ----------- | --------------------------------------- |
| Engaged     | The daily number of engaged sessions.   |
| Unengaged   | The daily number of unengaged sessions. |

## Session outcomes over time chart

The **Session outcomes over time** chart provides a graphical view of the daily resolution rate, escalation rate, and abandon rate over the specified time period.

| Description | Details                                                                                                                                                                                                                                                  |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Resolved    | The daily rate of resolved sessions. A resolved session is an engaged session in which the user receives an end-of-conversation survey that asks the question _"Did that answer your question?"_ and the user either does not respond or responds _Yes_. |
| Escalated   | The daily rate of escalated sessions. An escalated session is an engaged session that is escalated to a human agent.                                                                                                                                     |
| Abandoned   | The daily rate of abandoned sessions. An abandoned session is an engaged session that is neither resolved nor escalated after one hour from the beginning of the session.                                                                                |

## Resolution rate drivers chart

The **Resolution rate drivers** chart displays topics in order of their impact on the resolution rate over the specified time period.

| Description | Details                                                                                                                                                                                                                                   |
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Topic       | A Power Virtual Agents topic.                                                                                                                                                                                                             |
| Rate        | The percentage of engaged sessions for the topic that are resolved. A resolved session is an engaged session in which a customer receives an end-of-conversation survey and either does not respond to the survey or responds with _Yes_. |
| Impact      | The topic's resolution rate impact score. The resolution rate impact score is the overall resolution rate including the topic minus the overall resolution rate excluding the topic.                                                      |

The chart displays the impact as a red or blue bar. A red bar indicates that the topic's resolution rate is greater than the average resolution rate, resulting in a negative impact on overall resolution rate. A blue bar indicates that the resolution time is shorter, resulting in a positive impact on overall resolution rate performance.

Improving the resolution rate for the top resolution-rate topics in red has the greatest impact on improving the overall resolution rate.

To see additional information about each topic, select the **Detail** link to display the topic details page. For more information, see [Topic details page](analytics-topic-details.md).

## Escalation rate drivers chart

The **Escalation rate drivers** chart displays topics in order of their impact on the escalation rate over the specified time period.

| Description | Details                                                                                                                                                                              |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Topic       | A Power Virtual Agents topic.                                                                                                                                                        |
| Rate        | The percentage of engaged sessions for the topic that are escalated. An escalated session is an engaged session that is escalated to a human agent.                                  |
| Impact      | The topic's escalation rate impact score. The escalation rate impact score is the overall escalation rate including the topic minus the overall escalation rate excluding the topic. |

The chart displays the impact as a red or blue bar. A red bar indicates that the topic's escalation rate is greater than the average escalation rate, resulting in a negative impact on overall escalation rate. A blue bar indicates that the escalation rate is smaller, resulting in a positive impact on overall escalation rate performance.

Lowering the escalation rate for the topics in red has the greatest impact on improving the overall escalation rate.

To see additional information about each topic, select the **Detail** link to display the topic details page. For more information, see [Topic details page](analytics-topic-details.md).

## Abandon rate drivers chart

The **Abandon rate drivers** chart displays topics in order of their impact on the abandon rate over the specified time period.

| Description | Details                                                                                                                                                                                                      |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Topic       | A Power Virtual Agents topic.                                                                                                                                                                                |
| Rate        | The percentage of engaged sessions for the topic that are abandoned. An abandoned session is an engaged session that is neither resolved nor escalated after one hour from the beginning of the interaction. |
| Impact      | The topic's abandon rate impact score. The abandon rate impact score is the overall abandon rate including the topic minus the overall abandon rate excluding the topic.                                     |

The chart displays the impact as a red or blue bar. A red bar indicates that the topic's abandon rate is greater than the average abandon rate, resulting in a negative impact on overall abandon rate. A blue bar indicates that the abandon rate is smaller, resulting in a positive impact on overall abandon rate performance.

Improving the abandon rate for the top abandon-rate topics in red has the greatest impact on improving the overall abandon rate.

To see additional information about each topic, select the **Detail** link to display the topic details page. For more information, see [Topic details page](analytics-topic-details.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
