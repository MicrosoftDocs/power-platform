---
title: "Deflection topic enrichment analysis"
description: "Set of best practices on how to improve deflection rate in a PVA chatbot"
author: athinesh

ms.date: 1/20/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.collection: virtual-agent
---
# Technique 2: topic enrichment analysis  
PVA has a built-in fallback system topic that is set to fire when the AI is not able to find a matching intent/topic for a given user query. If most fallback topic conversations are escalated to a human agent – i.e. not deflected – there is an opportunity to improve the deflection by addressing the usage patterns of the user that triggers fallback consistently. Topic enrichment is an offline data analysis exercise, focusing on repurposing such user queries that triggered a fallback topic into triggering relevant topics in PVA. The analyzed user queries from the fallback topic typically fall into these buckets below:
   1.	User queries that are expected to trigger existing topics, but are somehow missed by the Natural Language Understanding (NLU) of the bot.
   2.	User queries that can be converted to newly suggested topics.
   3.	Unmapped user queries that are not relevant to any existing or new topics.
   4.	Other categories including, user queries that triggered a DYM followed by fallback, unclear user queries that hit fallback, user queries from incomplete conversations that led to fallback.
Of the 4 categories above, 1 and 2 are immediately actionable. Based on the findings from 1 and 2, you can enrich the topics by adding more trigger phrases for existing topics or creating new topics.
 ![enrichment or fallback analysis](./media/introduction/df-enrichment-analysis.png)

Topic enrichment through out-of-the-box PVA Analytics.
PVA provides some advanced AI capabilities out of box to identify the list of newly suggested topics, by enabling the “Advanced AI capabilities” in PVA for “Topic Suggestions based on Transcripts” when the author does not want to set up a fall back. This info can also be used to create new Topics to improve deflection rate.
![OOB enrichment analysis](./media/introduction/df-oob-enrichment.png)
 
Other approach topic enrichment exercise (COMING SOON!)
•	Install the custom analytics for PVA (https://aka.ms/PVAAnalytics) that includes a "deflection analysis” page.
•	Analyze a representative set of conversation transcripts for this exercise.
•	Under the deflection analysis report, you will find charts of session clusters with word cloud based on user queries and their occurrences. This will contain the following info:
    o	Word clouds of user queries similar to existing topics
    o	Word clouds of user queries for new topics  

•	Label and organize the top list of user queries you want to address for topic enrichment in an Excel sheet based on the word clouds.
•	Rephrase the “user queries” to create topic trigger phrases.
•	For the trigger phrases from "similar to existing topics" bucket , add them to the appropriate existing topics in the bot. This will improve the triggering of the topic and increase the deflection.
•	For the trigger phrases from "Newly suggested topics" bucket, create new topics and add the trigger phrases to those topics. This will address the top user queries missed by the bot are now handled by the bot through these new topics, hence improving the deflection.
