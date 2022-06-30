---
ROBOTS: NOINDEX,NOFOLLOW
title: Analyze bot customer satisfaction metrics
description: Use AI-driven analytics to understand how well customers are interacting with your bot and identify areas for improvement.
keywords: "PVA"
ms.date: 06/01/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: mboninco
ms.custom: analysis, ceX
ms.collection: virtual-agent
---

# Analyze your bot's customer satisfaction metrics

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

The Customer Satisfaction page provides a detailed view of customer satisfaction (CSAT) survey data. The information includes the average CSAT score over time and the topics that are having the most impact on the CSAT score.

The Customer Satisfaction page includes the following charts:

- [Customer satisfaction drivers](#customer-satisfaction-drivers)
- [Scores over time](#scores-over-time)
- [Average CSAT score](#average-csat-score)
- [CSAT survey response rate](#csat-survey-response-rate)

The customer satisfaction drivers chart shows you the topics that are having the most impact on customer satisfaction.

By default, the page shows you key performance indicators for the last seven days. To change the time period shown, select a period start date and (optionally) period end date in the calendar controls.

## Customer satisfaction drivers

The customer satisfaction drivers chart uses AI to group related support cases as topics. The chart displays the topics in order of their impact on customer satisfaction over the specified time period.

| Description | Details |
| --- | --- |
| Topic | A Power Virtual Agents topic. |
| Engaged sessions | The number of engaged sessions for the topic. |
| Resolution rate | The percentage of engaged sessions for the topic that are resolved. A resolved session is an engaged session in which the user receives an end-of-conversation survey and either doesn't respond or responds "Yes." |
| Abandon rate | The percentage of engaged sessions for the topic that are abandoned. An abandoned session is an engaged session that's not resolved or escalated after one hour from the beginning of the session. |
| Escalation rate | The percentage of engaged sessions for the topic that are escalated. An escalated session is an engaged session that's escalated to a human agent. |
| Avg CSAT | The average CSAT survey score for the topic. |
| Impact | The topic's customer satisfaction impact score. The customer satisfaction impact score is the overall average CSAT survey score including the topic minus the overall average CSAT survey score excluding the topic. |

The chart displays the impact as a red or blue bar. A red bar indicates the topic's average CSAT survey score is lower than the average, with a negative impact on the overall average CSAT survey score. A blue bar indicates the average CSAT survey score is higher, with a positive impact on the overall average CSAT survey score.

Improving the average CSAT survey score for the top customer satisfaction impact topics in red has the greatest impact on improving the overall CSAT survey score.

To get additional information about each topic, select the **Detail** link. [Get more information about the topic details page](analytics-topic-details.md).

## Scores over time

The CSAT scores over time chart provides a graphical view of the average CSAT score over the specified time period.

## Average CSAT score

The average CSAT score chart provides a graphical view of the average of CSAT scores for sessions in which customers respond to an end-of-session request to take the survey. The CSAT survey asks customers to rate their experience on a scale of "terrible" to "excellent," where "terrible" equals 1 and "excellent" equals 5.

## CSAT survey response rate

The CSAT survey response rate chart shows the number of CSAT surveys that were presented and the percentage of surveys that were completed.

[!INCLUDE[footer-include](includes/footer-banner.md)]
