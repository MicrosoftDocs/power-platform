---
title: "Report analytics, performance, and usage in Microsoft Teams"
description: "The Summary analytics page in the Power Virtual Agents app in Microsoft Teams shows you the scope of analytics, clustered with AI technology, so you can instantly see what topics and bots need improving."
keywords: "PVA"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.cusom: analysis, ceX
ms.collection: virtual-agent
---

# Analyze bot performance and usage in Power Virtual Agents in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../analytics-summary.md)
> - [Power Virtual Agents app in Microsoft Teams](analytics-summary-teams.md)



The Summary page gives you a broad overview of how well your bot is doing with these charts:

* [Summary charts](#summary-charts)
* [Engagement over time chart](#engagement-over-time-chart)
* [Session outcomes over time chart](#session-outcomes-over-time-chart)
* [Resolution rate drivers chart](#resolution-rate-drivers-chart)
* [Escalation rate drivers chart](#escalation-rate-drivers-chart)
* [Abandon rate drivers chart](#abandon-rate-drivers-chart)

To change the time period to the last 30 days, select **Last 30 days** from the drop-down list at the top of the page.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations-teams.md)]


## Summary charts

![Summary charts](media/summary-charts-teams.png)

The Summary charts summarize the how well your bot is doing based on different measurements, described in this table:

Description | Details
----------- | -------
Total sessions | The total number of sessions within the specified time period.
Engagement rate | The percentage of total sessions that are engaged sessions. An engaged session is a session in which a user-created topic is triggered, or the session ends in escalation. Engaged sessions can have one of three outcomes—they are either resolved, escalated, or abandoned.
Resolution rate | The percentage of engaged sessions that are resolved. A resolved session is an engaged session in which the user receives an end-of-conversation survey that asks the question *"Did that answer your question?"* and the user either does not respond or responds *Yes*.
Escalation rate | The percentage of engaged sessions that are escalated. An escalated session is an engaged session that is escalated to a human agent.
Abandon rate | The percentage of engaged sessions that are abandoned. An abandoned session is an engaged session that is neither resolved nor escalated after one hour from the beginning of the session.
CSAT | The graphical view of the average of CSAT scores for sessions in which customers respond to an end-of-session request to take the survey.

A blue up-and-down indicator next to the value indicates the percent change in a positive direction. A red indicator indicates the percent change in a negative direction.

## Engagement over time chart

The Engagement over time chart shows you engaged and unengaged sessions over time. An engaged session is a session in which a user-created topic is triggered or the session ends in escalation.

Description | Details
----------- | -------
Engaged | The daily number of engaged sessions.
Unengaged | The daily number of unengaged sessions.

## Session outcomes over time chart

The Session outcomes over time chart shows you the daily resolution rate, escalation rate, and abandon rate over the specified time period.

Description | Details
----------- | -------
Resolved | The daily rate of resolved sessions. A resolved session is an engaged session in which the user receives an end-of-conversation survey that asks the question *"Did that answer your question?"* and the user either does not respond or responds *Yes*.
Escalated | The daily rate of escalated sessions. An escalated session is an engaged session that is escalated to a human agent.
Abandoned | The daily rate of abandoned sessions. An abandoned session is an engaged session that is neither resolved nor escalated after one hour from the beginning of the session.

## Resolution rate drivers chart

The Resolution rate drivers chart displays topics in order of their impact on the resolution rate over the specified time period.

Description | Details
----------- | -------
Topic | A Power Virtual Agents topic.
Rate | The percentage of engaged sessions for the topic that are resolved. A resolved session is an engaged session in which a customer receives an end-of-conversation survey and either does not respond to the survey or responds with *Yes*.
Impact | The topic's resolution rate impact score. The resolution rate impact score is the overall resolution rate including the topic minus the overall resolution rate excluding the topic.

The chart displays the impact as a red or blue bar. A red bar indicates that the topic's resolution rate is greater than the average resolution rate, resulting in a negative impact on overall resolution rate. A blue bar indicates that the resolution time is shorter, resulting in a positive impact on overall resolution rate performance.

Improving the resolution rate for the top resolution-rate topics in red has the greatest impact on improving the overall resolution rate.

To see additional information about each topic, select the **Detail** link to display the topic details page. For more information, see [Topic details page](analytics-topic-details-teams.md).

## Escalation rate drivers chart

The Escalation Rate Drivers chart displays topics in order of their impact on the escalation rate over the specified time period.

Description | Details
----------- | -------
Topic | A Power Virtual Agents topic.
Rate | The percentage of engaged sessions for the topic that are escalated. An escalated session is an engaged session that is escalated to a human agent.
Impact | The topic's escalation rate impact score. The escalation rate impact score is the overall escalation rate including the topic minus the overall escalation rate excluding the topic.

The chart displays the impact as a red or blue bar. A red bar indicates that the topic's escalation rate is greater than the average escalation rate, resulting in a negative impact on overall escalation rate. A blue bar indicates that the escalation rate is smaller, resulting in a positive impact on overall escalation rate performance.

Lowering the escalation rate for the topics in red has the greatest impact on improving the overall escalation rate.

To see additional information about each topic, select the **Detail** link to display the topic details page. For more information, see [Topic details page](analytics-topic-details-teams.md).

## Abandon rate drivers chart

The Abandon Rate Drivers chart displays topics in order of their impact on the abandon rate over the specified time period.

Description | Details
----------- | -------
Topic | A Power Virtual Agents topic.
Rate | The percentage of engaged sessions for the topic that are abandoned. An abandoned session is an engaged session that is neither resolved nor escalated after one hour from the beginning of the interaction.
Impact | The topic's abandon rate impact score. The abandon rate impact score is the overall abandon rate including the topic minus the overall abandon rate excluding the topic.

The chart displays the impact as a red or blue bar. A red bar indicates that the topic's abandon rate is greater than the average abandon rate, resulting in a negative impact on overall abandon rate. A blue bar indicates that the abandon rate is smaller, resulting in a positive impact on overall abandon rate performance.

Improving the abandon rate for the top abandon-rate topics in red has the greatest impact on improving the overall abandon rate.

To see additional information about each topic, select the **Detail** link to display the topic details page. For more information, see [Topic details page](analytics-topic-details-teams.md).


