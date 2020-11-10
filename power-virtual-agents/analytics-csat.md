---
title: "Review customer satisfaction for your chatbots"
description: "Use AI-driven analytics to understand how well customers are interacting with your bot, and to identify areas for improvement."
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

# Analyze customer satisfaction for Power Virtual Agents bots

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](analytics-csat.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/analytics-csat-teams.md)


[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]


The Customer Satisfaction page provides a detailed view of customer satisfaction (CSAT) survey data, including the average CSAT score over time and the topics that are having the most impact on the CSAT score.



The Customer Satisfaction page includes a variety of charts with graphical views of your bot's customer satisfaction indicators. For information about each chart, select the link for the chart in the following list, or scroll to find the section about the chart later in this topic:

- [Customer satisfaction drivers chart](#customer-satisfaction-drivers-chart)
- [Scores over time chart](#scores-over-time-chart)
- [Average CSAT score](#average-csat-score-chart)
- [CSAT survey response rate](#csat-survey-response-rate-chart)

The Customer satisfaction drivers chart shows you the topics that are having the most impact on customer satisfaction.

By default, the page shows you key performance indicators for the last seven days. To change the time period to the last 30 days, select **Last 30 days** from the drop-down list at the top of the page.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]


## Customer satisfaction drivers chart

The Customer satisfaction drivers chart uses AI to group related support cases as topics. This chart then displays topics in order of their impact on customer satisfaction over the specified time period.

Description | Details
----------- | -------
Topic | A Power Virtual Agents topic.
Engaged sessions | The number of engaged sessions for the topic within the specified time period.
Resolution rate | The percentage of engaged sessions for the topic that are resolved. A resolved session is an engaged session in which the user receives an end-of-conversation survey and either does not respond or responds **Yes**.
Abandon rate | The percentage of engaged sessions for the topic that are abandoned. An abandoned session is an engaged session that is neither resolved nor escalated after one hour from the beginning of the session.
Escalation rate | The percentage of engaged sessions for the topic that are escalated. An escalated session is an engaged session that is escalated to a human agent.
Avg CSAT | The average CSAT survey score for the topic.
Impact | The topic's customer-satisfaction impact score. The customer-satisfaction impact score is the overall average CSAT survey score including the topic minus the overall average CSAT survey score excluding the topic.

The chart displays the impact as a red or blue bar. A red bar indicates that the topic's average CSAT survey score is lower than the average CSAT survey score, resulting in a negative impact on the overall average CSAT survey score. A blue bar indicates that the average CSAT survey score is higher, resulting in a positive impact on the overall average CSAT survey score.

Improving the average CSAT survey score for the top customer-satisfaction impact topics in red has the greatest impact on improving the overall CSAT score.

To see additional information about each topic, select the **Detail** link to display the Topic details page. For more information, see the [Topic details page](analytics-topic-details.md).

## Scores over time chart

The CSAT scores over Time chart provides a graphical view of the average CSAT score over the specified time period.



## Average CSAT score chart

The Average CSAT score chart provides a graphical view of the average of CSAT scores for sessions in which customers respond to an end-of-session request to take the survey. The CSAT survey asks customers to rate their experience on a scale of "terrible" to "excellent," where "terrible" is given a value of 1 and "excellent" is given a value of 5.


## CSAT survey response rate chart

The CSAT survey response rate chart shows the number of CSAT surveys that were presented and the percentage of surveys that were completed.
