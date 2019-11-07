---
title: "TITLE"
description: "DESCRIPTION"
keywords: "KEYWORDS"
ms.date: 09/04/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "VA"
ms.collection: virtualagent
---


# Create topics from Customer Service Insights

## Introduction to Dynamics 365 Customer Service Insights

Dynamics 365 Customer Service Insights (https://csi.ai.dynamics.com) gives you actionable insights into critical performance metrics, operational data, and emerging trends from your customer service system. Built-in dashboards, interactive charts, and visual filters provide views into support operations data across channels, and highlight areas for improvement that can have the greatest impact, helping you quickly evaluate and respond to key performance indicators (KPIs) and customer satisfaction levels.

Customer Service Insights uses artificial intelligence to automatically group your cases into topics using natural language understanding. Topics enable you to discover and adapt to current and emerging trends, improve brand sentiment, and identify problem areas. By pinpointing and fixing issues before they impact customers, you can deliver better customer service experiences.

For a walkthrough of how to connect to your customer service data to gain insights into your customer support system, see [Quickstart - Get immediate insights into your customer service system's performance](https://docs.microsoft.com/en-us/dynamics365/ai/customer-service-insights/quickstart).

<<<  INCLUDE IMAGE OF CSI KPI SUMMARY PAGE >>>>

The AI-driven technology empowers informed decision making about how to improve resolution rates, reduce wait times, and decrease customer service costs. You can use case resolution insights, backlog trends, and historical comparisons to evaluate agent performance and business impact, and address inefficiencies in your system.


## Popular and emerging topics in the CSI dashboard

Looking at the **New Cases** tab in Customer Service Insights, you can see cases with similar intent that are grouped through AI learning into: 

1. **Popular topics** chart: AI technology groups related incoming support cases as support topics and then displays topics in order of volume over the specified time period.

2. **Emerging topics** chart: Displays support topics that have a high volume of change in order of the change in volume over the specified time period. This chart shows the topics with high volume changes before they become popular topics.

<<< INCLUDE IMAGE OF NEW CASES TAB IN CSI, HIGHLIGHT POPULAR TOPICS AND EMERGING TOPICS >>>

To view detailed analytics and cases for any topic, scroll to the right in the charts and click on the Details icon. 

<<< INCLUDE IMAGE OF THE POPULAR CASES CHART SCROLLED TO THE RIGHT SHOWING THE DETAILS ICON >>>


## Identifying CSI topics to automate in Power Virtual Agents

The topic details page for a topic shows Key Performance Metrics on the Analytics tab.

<<< INCLUDE IMAGE OF ANALYTICS TAB FOR A TOPIC >>>

Observe the metrics here to identify topics to automate in Power Virtual Agents.

Topics that have:
1. Large number of cases, meaning, high support volume
2. High average resolution time, could mean that customers are either waiting in queue for a long time to connect to agents
3. High resolution rate, meaning, agents are able to resolve the issue

Such topics are good candidates to optimize and automate in your bot in Power Virtual Agents.

You can also explore the Cases that are contained in this topic by clicking on the **Cases** tab. 

The Cases tab shows all the cases that Go through the case titles to determine the issues customers are reaching support for.  This will also help identify if the topic is good to auatomate.

<<< INCLUDE IMAGE OF CASES TAB FOR A TOPIC >>>


## Automate in Power Virtual Agents

Once you have identified a topic to automate in your bot, click the **Automate** button on the command bar. 

<<< INCLUDE IMAGE OF AUTOMATE BUTTON HIGHLIGHTED ON CASES TAB  >>>

This button is available on the **Analytics** tab of the topic and on the **Cases** tab of the topic.


## New topic in Power Virtual Agents

Discuss license needs and having a bot created. Discuss experience when you don't have these setup. Discuss experience of successful automation.


> [!NOTE]
>  
> Watch this video to learn more about creating topic suggestions from CSI 
>
> <<<< INCLUDE VIDEO  >>>




