---
title: "Agent transcripts analysis"
description: "Set of best practices based on agent transcript analysis to improve  the deflection rate of a Power Virtual Agents chatbot"
author: athinesh
ms.date: 1/20/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
---
# Agent transcript analysis

> [!TIP]
> Analyzing the agent transcripts can provide insights on what new topics or self-service actions can be added to the chatbot to reduce escalation and improve deflection.

The agent transcript review process is similar to the [chatbot transcript review](./deflection-topic-escalation-analysis.md#topic-escalation-analysis-1) we discussed earlier in this playbook:

1. Identify the top escalation driver topics.
2. Download the agent conversation transcripts from your engagement hub (for example, [download transcripts from Dynamics 365 Omnichannel for Customer Service](/dynamics365/customer-service/download-transcripts-bulk)).
3. Select the most recent sample set of human agent conversation transcripts for that topic (for example, 10 sessions). The size of the sample set depends on how much accuracy you're looking for. For a quick analysis you can start with 10 sessions.
4. Read through each of the human agent conversations and identify the resolution path provided by the human agents and patterns that are emerging for that conversation.
5. List out the resolution paths identified for each session and group them as per the resolution paths.
6. For each resolution path group, come up with a recommendation, to implement in Power Virtual Agents as a topic or a self-service action etc.
7. Implement the recommendations in the chatbot topics and observe the change in the escalation rate and deflection.
