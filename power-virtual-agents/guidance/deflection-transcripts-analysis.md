---
title: "Agent transcripts analysis"
description: "Guidance and best practices based on agent transcript analysis to improve the deflection rate of a Microsoft Copilot Studio chatbot."
author: athinesh
ms.date: 05/23/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.reviewer: iawilt
---

# Agent transcript analysis

[!INCLUDE[pva-rebrand](../includes/pva-rebrand.md)]

> [!TIP]
> Analyzing the agent transcripts can provide insights on what new topics or self-service actions can be added to the chatbot to reduce escalation and improve deflection.

The agent transcript review process is similar to the [chatbot transcript review](./deflection-topic-escalation-analysis.md#topic-escalation-analysis-1):

1. Identify the top escalation driver topics.

1. Download the agent conversation transcripts from your engagement hub (for example, [download transcripts from Dynamics 365 Omnichannel for Customer Service](/dynamics365/customer-service/download-transcripts-bulk)).  

1. Select the most recent sample set of human agent conversation transcripts for that topic (for example, 10 sessions). The size of the sample set depends on how much accuracy you're looking for. For a quick analysis you can start with 10 sessions.

1. Read through each of the human agent conversations and identify the resolution path provided by the human agents and patterns that are emerging for that conversation.

1. List out the resolution paths identified for each session and group them as per the resolution paths.

1. For each resolution path group, come up with a recommendation to implement in Microsoft Copilot Studio as a topic or a self-service action and so on.

1. Implement the recommendations in the chatbot topics and observe the change in the escalation rate and deflection.
