---
title: "Analyze topic performance in Microsoft Teams"
description: "See how topics are performing, and determine what you can do to improve customer satisfaction in the Power Virtual Agents app in Microsoft Teams."
keywords: "PVA"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.cusom: analysis, ceX, teams
ms.collection: virtual-agent
---

# Analyze topic usage in Power Virtual Agents in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../analytics-topic-details.md)
> - [Power Virtual Agents app in Microsoft Teams](analytics-topic-details-teams.md)




The topic details page provides a view into the performance of individual topics and how they can be improved.



You can display the topic details page by selecting the **Detail** link in one of the following charts on the [Summary](analytics-summary-teams.md) and [Customer Satisfaction](analytics-CSAT-teams.md) pages:


* [Escalation rate drivers (Summary page)](analytics-summary-teams.md#escalation-rate-drivers-chart)
* [Abandon rate drivers (Summary page)](analytics-summary-teams.md#abandon-rate-drivers-chart)
* [Resolution rate drivers (Summary page)](analytics-summary-teams.md#resolution-rate-drivers-chart)
* [Customer satisfaction drivers (Customer Satisfaction page)](analytics-CSAT-teams.md#customer-satisfaction-drivers-chart)

![Topic details link](media/topic-details-link-teams.png)

>[!IMPORTANT]
>You need a license for [Dynamics 365 Customer Service Insights](/dynamics365/ai/customer-service-insights/licensing-case-capacity) to access the topic details charts.


The topic details page can also be displayed by opening an individual topic from the Topics page and selecting **Analytics** at the top of the page.

![From the Topic details page, select the Analytics tab](media/analytics-topics-details-teams.png)

You can also hover over each topic in the Topics page and select the **Go to analytics** icon. 

![Hovering shows the Go to analytics icon](media/analytics-topics-teams.png)

The topic details page includes a variety of charts with graphical views of a topic's key performance indicators. For information about each chart, see:

* [Topic Summary charts](#topic-summary-charts)
* [Impact Summary charts](#impact-summary-charts)
* [Topic Volume by Day chart](#topic-volume-by-day-chart)

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations-teams.md)]


## Topic summary charts

The Topic summary charts summarize the topic's performance indicators for the specified time period and the percent change over the period.

Description | Details
----------- | -------
Total sessions | The total number of sessions within the specified time period.
Average CSAT | The average CSAT survey score for the specified time period.
Resolution rate | The percentage of engaged sessions that are resolved. A resolved session is an engaged session in which the user receives an end-of-session survey and either does not respond or responds *Yes*.
Escalation rate | The percentage of engaged sessions that are escalated. An escalated session is an engaged session that is escalated to a human agent.
Abandon rate | The percentage of engaged sessions that are abandoned. An abandoned session is an engaged session that is neither resolved nor escalated after one hour from the beginning of the session.

A blue up-and-down indicator below the value indicates the percent change in a positive direction. A red indicator indicates the percent change in a negative direction.

## Impact summary charts

The Impact summary charts summarize the impact of the topic on key performance indicators for the specified time period.

Description | Details
----------- | -------
CSAT impact | The topic's customer satisfaction impact score. The customer satisfaction impact score is the overall average CSAT survey score including the topic minus the overall average CSAT survey score excluding the topic.
Resolution rate impact | The topic's resolution-rate impact score. The resolution-rate impact score is the overall resolution rate including the topic minus the resolution rate excluding the topic.
Escalation rate impact | The topic's escalation-rate impact score. The escalation-rate impact score is the overall escalation rate including the topic minus the escalation rate excluding the topic.
Abandon rate impact | The topic's abandon-rate impact score. The abandon-rate impact score is the overall abandon rate including the topic minus the abandon rate excluding the topic.

## Topic Volume by Day chart

The Topic volume by day chart provides a graphical view of the number of sessions for the topic over the specified time period.
