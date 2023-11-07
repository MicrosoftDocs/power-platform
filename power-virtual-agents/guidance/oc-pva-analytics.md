---
title: "Analytics considerations for Power Virtual Agents Dynamics 365 Omnichannel"
description: "Guidance best practices to understand analytics considerations of Power Virtual Agents chatbot vs Dynamics 365 Omnichannel."
author: athinesh
ms.date: 11/03/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.reviewer: iawilt
---
# Introduction

Analytics is a top priority for Dynamics 365 Omni-channel and Power Virtual Agents customers tracking the performance of their Bots and Call-center agents. 
There are major efforts currently underway to improve the analytics across both these products. 
While the analytics will continue to improve, there are several considerations you can adopt as a Bot builder or customer service expert to improve the understating 
of analytics across Power Virtual Agents and Dynamics 365 Omnichannel to enhance bot performance. 
In this article we will touch on concepts that will help you understand the difference between Dynamics 365 Omni-channel analytics and Power Virtual Agents analytics, 
the purpose behind both. This will help you to make informed decisions about the bot performance for your implementation.

## Using Power Virtual Agents Analytics

The out-of-box analytics of Power Virtual Agents is mainly focused on providing insights on bot topics performance through the Sessions (more details below). 
They do not provide an end-to-end insight including the human agent conversation, but can be effectively used to improve the topic performance inside the bot. 
These are some key goals behind using Power Virtual Agents analytics, that comes out of box in the application,


 - Optimized to give insights about bot performance
 - The Insights you can get from Power Virtual Agents include:
 - How engaged are users with the bots?
 - Which topics are driving resolutions/escalations abandonment ?
 - In general, Power Virtual Agents analytics is useful to enhance the bot performance in terms of the topics.
 - This will give insights on what new topics need to be created, and what topics need to be updated to achieve better resolution rates for the incoming user queries.
 - Learn more: Aka.ms/PVA/Analytics

## Understanding Power Virtual Agents Analytics Definitions

It is important to understand the way Power Virtual Agents calculates the various metrics for the analytics. The basis of these calculation is the bot Sessions.   A session can be a unbilled or billed session . A billed session is a continuous interaction between a bot and a user to address ALL of user’s question within a 60-minute time window.
 - A billed session can include multiple user authored topics.
 - A billed session cannot last longer than 60 minutes or 100 turns.
A session is interaction between a bot and a user to address or assist a user with ONE query/intent (one user authored topic)
- Most sessions are engaged which means that a user authored topic or escalate was triggered. There are three possible outcomes:
- Resolved session is an engaged session when end-users are offered an end-of-conversation survey and either responds yes or leave without a response.
- Escalated session is an engaged session where end-users indicate that they need a human to help resolve the issue.
- Abandoned session is an engaged session that is neither resolved nor escalated and is inactive after 60 minutes from the beginning of the session. (user leaves)
A topic is tied to a dialog built in Power Virtual Agents. One topic has one dialog.

## Using Dynamics 365 Omni-channel Chatbot Analytics

The out-of-box analytics of Dynamics 365 Omnichannel is mainly focused on providing insights on how the overall chatbot deflection is performing through the conversations. These are some key goals behind using Dynamics 365 Omni-channel analytics, that comes out of box in the application. 
- Optimized to give insight into the overall interaction/conversation across bot and human agent, not only bot.
- You can get the Insights from Dynamics 365 Omnichannel including,
- Bot resolution time
- Bot escalation time
- Conversation escalation
  
Learn more about this in Bot dashboard | Microsoft Learn

## PVA vs Omnichannel Analytics side  by side Example

In the below example you can observe how the Analytics calculation differs between Power Virtual Agents and Dynamics 365 Omni-channel for the same set of metrics, 
like Resolution rate, Escalation rate and Abandonment rate.

In this example, Power Virtual Agents analytics considers this as two separate bot sessions, while Dynamics 365 Omnichannel analytics considers it as a single “conversation”. As a result of this, the resolution rates, Escalation rates and Abandonment rates can be different across Power Virtual Agents analytics and Dynamics 365 Omni-channel analytics. The Abandonment does not apply for Omnichannel analytics since the conversation is escalated to human agent.
These key differences in the calculation off Resolution rates and Escalation rates need to be considered while consuming the Power Virtual Agents and Dynamics 365 Omnichannel analytics to determine key metrics like deflection rate, resolution rate etc.  The general recommendation here is to rely on Dynamics 365 Omnichannel Analytics for tracking overall chatbot deflection rate for the organization and use the Power Virtual Agents Analytics mainly for enhancing the topic performance. 


