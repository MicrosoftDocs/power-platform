---
title: "Analytics considerations for Copilot Studio vs Dynamics 365 Omnichannel"
description: "Guidance best practices to understand analytics considerations for copilots in Copilot Studio vs Dynamics 365 Omnichannel."
author: athinesh
ms.date: 3/22/2024
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.reviewer: iawilt
---

# Analytics considerations for Copilot Studio vs Dynamics 365 Omnichannel

TEST

Analytics is a top priority for Dynamics 365 Omnichannel and Copilot Studio customers tracking the performance of their copilots and call center agents. 
There are major efforts currently underway to improve the analytics across both these products. While the analytics will continue to improve, there are several considerations you can adopt as a copilot builder or customer service expert to improve your understanding of analytics across Copilot Studio and Dynamics 365 Omnichannel to enhance copilot performance. 

In this article we will touch on concepts that will help you understand the difference between Dynamics 365 Omnichannel analytics and Copilot Studio analytics, as well as the purpose behind the analytics tools in each of them. This will help you make informed decisions about the copilot performance for your implementation.

## Using Copilot Studio Analytics

The standard analytics tools in Coplilot Studio copilots are focused mainly on providing insights about copilot topics performance through during chat sessions. They do not provide an end-to-end insight that includes any human-agent conversation. But they can be used to improve the topic performance inside the copilot. 

The insights you can get from Copilot Studio analytics include metrics for questions like:
 - How engaged are users with the copilots?
 - Which topics are driving resolutions, escalations, and abandonment ?

In general, Copilot Studio analytics tools are useful to enhance the bot performance in terms of the topics. This gives insights about what new topics need to be created, and what topics need to be updated to achieve better resolution rates for future user queries.

:::image type="content" source="media/oc-pva-analytics/copilot-studio-analytics.png" alt-text="Copilot Studio analytics." border="false":::

To learn more, see [Key concepts - Analytics in Microsoft Copilot Studio](../analytics-overview.md)

## Understanding Copilot Studio analytics definitions

It is important to understand the way Copilot Studio calculates the various metrics made available to [Analyze bot performance and usage in Copilot Studio](../analytics-summary.md). These calculations are based on the copilot sessions. A session can be an *unbilled* or a *billed* session. A billed session is a continuous interaction between a copilot and a user to address all of user’s question within a 60-minute time window.

A billed session can include multiple user authored topics and cannot last longer than 60 minutes or 100 turns.

A session is interaction between a copilot and a user to address or assist a user with one query or intent (one user authored topic).
Most sessions are *engaged*, which means that a user-authored topic or an escalation was triggered. There are three possible outcomes for an engaged session:

- Resolved: End users are offered an end-of-conversation survey and either responds yes or leaves without a response.
- Escalated: End users indicate that they need a human to help resolve the issue.
- Abandoned: An engaged session that is neither resolved nor escalated and is inactive after 60 minutes from the beginning of the session. This would happen, for example, if the user leaves.

A topic is tied to a dialog flow built in Copilot Studio. One topic contains one dialog flow.

## Using Dynamics 365 Omnichannel chatbot analytics

The [standard bot analytics tools in Dynamics 365 Omnichannel](/dynamics365/customer-service/use/oc-bot-dashboard) are mainly focused on providing insights about how the overall copilot deflection is performing through the conversations. These analytics are optimized to give insight into the overall interaction/conversation across both copilot and human agent.

:::image type="content" source="media/oc-pva-analytics/d365-oc-bot-analytics.png" alt-text="Example comparing analytics between Copilot Studio and Dynamics 365 Omnichannel." border="false":::

The insights you can get from Dynamics 365 Omnichannel include:

- Bot resolution time
- Bot escalation time
- Conversation escalation

## Copilot Studio vs Omnichannel analytics comparison

Analytics calculations differ between Copilot Studio and Dynamics 365 Omnichannel for metrics with similar names, 
such as resolution rate, escalation rate and abandonment rate.

For example, an ongoing interaction with a user that would be considered one conversation and one bot session in Dynamics 365 Omnichannel analytics may be considered by Copilot Studio analytics to be multiple separate analytic sessions. As a result of this, the resolution rates, escalation rates and abandonment rates can be somewhat different across Copilot Studio analytics and Dynamics 365 Omnichannel analytics. 

Here is an example showing the differences for analytics between the two for a single conversation:

:::image type="content" source="media/oc-pva-analytics/bot-cs-d365-analytics-compare.png" alt-text="Dynamics 365 Omnichannel analytics." border="false":::

These key differences in the calculation of resolution rates and escalation rates need to be considered when consuming the Copilot Studio and Dynamics 365 Omnichannel analytics to determine key metrics like deflection rate, resolution rate, and so on. The general recommendation is that you rely on Dynamics 365 Omnichannel analytics for tracking the overall copilot deflection rate for the organization and use the Copilot Studio analytics for enhancing the topic performance. 


