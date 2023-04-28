---
title: "Deflection topic enrichment analysis"
description: "Set of best practices based on topic enrichment to improve the deflection rate of a Power Virtual Agents chatbot"
author: athinesh

ms.date: 1/20/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.collection: virtual-agent
---

# Topic enrichment analysis  

## Analyzing the Fallback topic conversations

Power Virtual Agents has a built-in [Fallback](/power-virtual-agents/preview/authoring-system-topics#fallback) system topic that is set to trigger when the Natural Language Understanding (NLU) model isn't able to find a matching topic for a given user query.

If most Fallback topic conversations are escalated to a human agent – that is, not deflected – there's an opportunity to improve the deflection by addressing the usage patterns of the user that triggers fallback consistently.

> [!TIP]
> Topic enrichment is an offline data analysis exercise, focusing on repurposing such user queries that triggered the Fallback topic into triggering relevant topics in Power Virtual Agents.

The analyzed user queries from the Fallback topic typically fall into these buckets:

1. User queries that are expected to trigger existing topics, but are somehow missed by the NLU  of the bot.
2. User queries that can be converted to newly suggested topics.
3. Unmapped user queries that aren't relevant to any existing or new topics.
4. Other categories including, user queries that triggered a [Multiple Topics Matched](/power-virtual-agents/preview/authoring-system-topics#multiple-topics-matched) (also known as _Did You Mean_) followed by Fallback, unclear user queries that hit Fallback, user queries from incomplete conversations that led to Fallback.

Of the four categories, #1 and #2 are immediately actionable. Based on the findings from #1 and #2, you can enrich the topics by adding more trigger phrases for existing topics or creating new topics.

 ![enrichment or fallback analysis](./media/introduction/df-enrichment-analysis.png)

## Topic enrichment through out-of-the-box analytics

Power Virtual Agents provides advanced AI capabilities out-of-the-box, to identify a list of suggested new topics, by enabling the [advanced AI features](/power-virtual-agents/advanced-ai-features) for [topic suggestion from chat transcripts (preview)](/power-virtual-agents/advanced-ai-features#topic-suggestion-from-chat-transcripts-preview), when the author doesn't want to enable the Fallback topic.

This information can also be used to create new topics to improve deflection rate.

![OOB enrichment analysis](./media/introduction/df-oob-enrichment.png)

<!--- COMMENTING AS NOT AVAILABLE / TBD
## Topic enrichment exercise 

1. Install the [custom analytics sample template](https://aka.ms/PVAAnalytics) that includes a `deflection analysis` page.
2. Analyze a representative set of conversation transcripts for this exercise.
3. Under the deflection analysis report, you will find charts of session clusters with word cloud based on user queries and their occurrences. This will contain the following info:
    - Word clouds of user queries similar to existing topics
    - Word clouds of user queries for new topics  

3. Label and organize the top list of user queries you want to address for topic enrichment in an Excel sheet based on the word clouds.
4. Rephrase the `user queries` to create topic trigger phrases.
5. For the trigger phrases from `similar to existing topics` bucket , add them to the appropriate existing topics in the bot. This will improve the triggering of the topic and increase the deflection.
6. For the trigger phrases from `Newly suggested topics` bucket, create new topics and add the trigger phrases to those topics. This will address the top user queries missed by the bot are now handled by the bot through these new topics, hence improving the deflection. 
--->

> [!div class="nextstepaction"]
> [Topic confusion analysis](deflection-topic-confusion-analysis.md)
