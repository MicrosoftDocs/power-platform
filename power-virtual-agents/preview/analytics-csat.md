---
title: Analyze your bot's customer satisfaction metrics (preview)
description: Use AI-driven analytics to understand how well customers are interacting with your bot and identify areas for improvement in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 12/09/2022
ms.topic: how-to
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: mboninco
ms.custom: analysis, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Analyze your bot's customer satisfaction metrics (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

The Customer Satisfaction report provides a detailed view of customer satisfaction (CSAT) survey data. The information includes your bot's average CSAT score over time and the topics that are having the most effect on the CSAT score.

The Customer Satisfaction page includes the following charts:

- [Customer satisfaction drivers](#customer-satisfaction-drivers)
- [Scores over time](#scores-over-time)
- [Average CSAT score](#average-csat-score)
- [CSAT survey response rate](#csat-survey-response-rate)

By default, the page shows key performance indicators for the last seven days. To change the time period shown, select a period start date and (optionally) a period end date in the calendar controls.

## Customer satisfaction drivers

The Customer satisfaction drivers chart uses AI to group related support cases as topics. It shows the topics that are having the most effect on customer satisfaction, in order of their effect over the specified time period.

| Description | Details |
| --- | --- |
| Topic | A Power Virtual Agents topic |
| Engaged sessions | The number of sessions that involved the topic |
| Resolution rate | The percentage of engaged sessions in which the user received an end-of-conversation survey and either didn't respond or responded "Yes" to resolve the session |
| Abandon rate | The percentage of engaged sessions that weren't either resolved or escalated after one hour from the beginning of the session |
| Escalation rate | The percentage of engaged sessions that were escalated to a human agent |
| Avg CSAT | The average CSAT survey score for the topic |
| Impact | The topic's customer satisfaction impact score, which is the overall average CSAT survey score including the topic minus the overall average CSAT survey score excluding the topic |

The chart displays the impact as a red or blue bar. A red bar indicates the topic's average CSAT survey score is lower than the average, with a negative effect on the overall average CSAT survey score. A blue bar indicates the average CSAT survey score is higher, with a positive effect on the overall average CSAT survey score.

Improving the average CSAT survey score for the highest-impact topics in red has the greatest effect on improving the overall CSAT survey score.

[To get more information about each topic](analytics-topic-details.md), select the **Detail** link.

## Scores over time

The CSAT scores over time chart provides a graphical view of your bot's average CSAT score over the specified time period.

## Average CSAT score

The Average CSAT score chart provides a graphical view of the average of CSAT scores for sessions in which customers respond to an end-of-session request to take the survey. The CSAT survey asks customers to rate their experience on a scale of "terrible" to "excellent," where "terrible" equals 1 and "excellent" equals 5.

## CSAT survey response rate

The CSAT survey response rate chart shows the number of CSAT surveys that were presented and the percentage of surveys that were completed.

[!INCLUDE[footer-include](includes/footer-banner.md)]
