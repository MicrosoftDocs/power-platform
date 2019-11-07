---
title: "Customer satisfaction rate page"
description: "Learn about the Power Virtual Agents Customer Satisfaction page."
ms.date: 05/29/2019
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: m-hartmann
ms.author: mhart
manager: shellyha
---

# Customer Satisfaction page

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

The Customer Satisfaction page provides a detailed view of customer satisfaction (CSAT) survey data, including the average CSAT score over time and the topics that are having the most impact on the CSAT score.

![Customer Satisfaction page](media/customer-satisfaction-dashboard.png)

The Customer Satisfaction page includes a variety of charts with graphical views of your bot's customer satisfaction indicators. For information about each chart, select the link for the chart in the following list, or scroll to find the section about the chart later in this topic:

* [Customer Satisfaction Drivers chart](#customer-satisfaction-drivers-chart)
* [Scores over Time chart](#scores-over-time-chart)
* [Average CSAT score](#average-csat-score-chart)
* [CSAT survey response rate](#csat-survey-response-rate-chart)

The Customer Satisfaction Drivers chart shows you the topics that are having the most impact on customer satisfaction.

By default, the page shows you key performance indicators for the last seven days. To change the time period to the last 30 days, select **Last 30 days** from the drop-down list at the top of the page.

## Customer Satisfaction Drivers chart

The Customer Satisfaction Drivers chart uses artificial intelligence technology to group related support cases as topics. This chart then displays topics in order of their impact on customer satisfaction over the specified time period.

Description | Details
----------- | -------
Topic | A Power Virtual Agents topic.
Engaged sessions | The number of engaged sessions for the topic within the specified time period.
Resolution rate | The percentage of engaged sessions for the topic that are resolved. A resolved session is an engaged session in which the user receives an end-of-conversation survey and either does not respond or responds *Yes*.
Abandon rate | The percentage of engaged sessions for the topic that are abandoned. An abandoned session is an engaged session that is neither resolved nor escalated after one hour from the beginning of the session.
Escalation rate | The percentage of engaged sessions for the topic that are escalated. An escalated session is an engaged session that is escalated to a human agent.
Avg CSAT | The average CSAT survey score for the topic.
Impact | The topic's customer-satisfaction impact score. The customer-satisfaction impact score is the overall average CSAT survey score including the topic minus the overall average CSAT survey score excluding the topic.

The chart displays the impact as a red or blue bar. A red bar indicates that the topic's average CSAT survey score is lower than the average CSAT survey score, resulting in a negative impact on the overall average CSAT survey score. A blue bar indicates that the average CSAT survey score is higher, resulting in a positive impact on the overall average CSAT survey score.

Improving the average CSAT survey score for the top customer-satisfaction impact topics in red has the greatest impact on improving the overall CSAT score.

To see additional information about each topic, select the **Detail** link to display the Topic details page. For more information, see [Topic details page](analytics-topic-details.md).

## Scores over Time chart

The Scores over Time chart provides a graphical view of the average CSAT score over the specified time period.

## Average CSAT Score chart

The Average CSAT Score chart provides a graphical view of the average of CSAT scores for sessions in which customers respond to an end-of-session request to take the survey. The CSAT survey asks customers to rate their experience on a scale of "terrible" to "excellent," where "terrible" is given a value of 1 and "excellent" is given a value of 5.

## CSAT Survey Response Rate chart

The Survey Response Rate chart shows the number of CSAT surveys that were presented and the percentage of surveys that were completed.
