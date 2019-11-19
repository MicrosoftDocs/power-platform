---
title: "Automate topics to Power Virtual Agents"
description: "Learn how to automate topics discovered by Dynamics 365 Customer Service Insights to Power Virtual Agents"
keywords: "Customer Service Insights"
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


## Identifying CSI topics to automate to Power Virtual Agents

To view topic details analytics, see the [Topic details analytics dashboard](https://docs.microsoft.com/en-us/dynamics365/ai/customer-service-insights/dashboard-topic-details) for more information.

<<< INCLUDE IMAGE OF ANALYTICS TAB FOR A TOPIC >>>


You can consider topics as good candidates for automation, if they are:

1. Straightforward to resolve, and hence the bot is more likely to be able to handle it. You can tell that if a topic has lower average resolution time, higher resolution rate, and/or fewer escalations.

2. Have high volume, so the automation can bring you more business benefit and impact. You can tell that from [case volume drivers](https://docs.microsoft.com/en-us/dynamics365/ai/customer-service-insights/dashboard-kpi-summary#case-volume-drivers-chart) and [emerging topics](https://docs.microsoft.com/en-us/dynamics365/ai/customer-service-insights/dashboard-kpi-summary#emerging-topics-chart) in Customer Service Insights.

Customer Service Insights also calculates resolution time impact for each topic, which has already taken into account both average resolution time and case volume. See the [Resolution time drivers chart](https://docs.microsoft.com/en-us/dynamics365/ai/customer-service-insights/dashboard-case-resolutions#resolution-time-drivers-chart) for more details how resolution time impact is calculated.

You can also explore the Cases that are contained in this topic by clicking on the **Cases** tab. 

<<< INCLUDE IMAGE OF CASES TAB FOR A TOPIC >>>

## Pre-requisite to automate topics to Power Virtual Agents

In order to automate a topic from Customer Service Insights to Power Virtual Agents, you need the following:

1. A valid license to access Power Virtual Agents. Go to [http://aka.ms/TryPVA](http://aka.ms/TryPVA) to sign up for a trial Power Virtual Agents license if you don't already have one.

2. A bot created in Power Virtual Agents. See [Quickstart: Create and deploy a Power Virtual Agents bot](fundamentals-get-started.md) to get started.


## Automate to Power Virtual Agents

### Automate topics from topic details page

Once you have identified a topic to automate in your bot, you can automate the topic right away from the topic details page:

In topic details page, select **Automate** on the top.

<<< INCLUDE IMAGE OF AUTOMATE BUTTON HIGHLIGHTED  >>>

Customer Service Insights creates a new topic in Power Virtual Agents in a new browser tab. The topic name and upto 3 trigger phrases are pre-filled from the topic you selected for automation. Customer Service Insights prefills trigger phrases with non-duplicated case titles from the most relevant cases. We recommend making these trigger phrases shorter and diverse. 

Review the topic name and trigger phrases, and follow the other steps in [Create and edit your topics](authoring-create-edit-topics.md) to complete the creation of your bot topic.

This button is available on the **Analytics** tab of the topic and on the **Cases** tab of the topic.

### Automate topics from Topics page

You can also automate topics from the Topics page. On the Topics page, hover over the topic you want to automate in the topic list, and select the **Automate** icon.


<<< INCLUDE IMAGE OF AUTOMATE BUTTON HIGHLIGHTED on the Topics page >>>


> [!NOTE]
>  
> Watch this video to learn more about creating topic suggestions from CSI 
>
> <<<< INCLUDE VIDEO  >>>




