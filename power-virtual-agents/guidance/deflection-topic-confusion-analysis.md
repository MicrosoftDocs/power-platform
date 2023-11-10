---
title: "Deflection topic confusion analysis"
description: "Set of best practices based on confusion analysis to improve the deflection rate of a Microsoft Copilot Studio chatbot."
author: athinesh
ms.date: 05/23/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.reviewer: iawilt
---
# Topic confusion analysis

[!INCLUDE[pva-rebrand](../includes/pva-rebrand.md)]

Using semantically similar trigger phrases for two different topics can lead to confusion, as the chatbot may not know which topic to open and will need to ask follow-up questions to the end-user.

> [!TIP]
> Confusion Is typically measured by the frequency of the [Multiple Topics Matched](/power-virtual-agents/preview/authoring-system-topics#multiple-topics-matched) topic (also known as "did you mean") being triggered.

This often results in the escalation to an agent, and spikes the deflection rate of the bot.

**A topic confusion analysis exercise** helps you improve topic triggering accuracy by finding overlaps between topics.
Resolving topic overlaps can help reduce the need for the bot to ask clarifying questions before triggering a topic.

Identifying semantically similar trigger phrases can also help you determine if you have topics that themselves are similar and could be consolidated to simplify the bot authoring process or edited to make the topics more distinct with high triggering accuracy, which in turn improves the deflection rate.

You can identify the list of topics causing confusion during triggering, by enabling the [advanced AI features](/power-virtual-agents/advanced-ai-features) in Microsoft Copilot Studio for [topic overlap detection](/power-virtual-agents/advanced-ai-features#topic-overlap-detection).

This standard capability helps you identify the trigger phrases causing confusion, remove duplicates, and consolidate similar topics.

![topic confusion analysis](./media/introduction/df-topic-confusion-analysis.png)

> [!div class="nextstepaction"]
> [Alternate escalation paths](deflection-alternate-escalation-paths.md)
