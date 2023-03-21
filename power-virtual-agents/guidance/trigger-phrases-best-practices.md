---
title: "Trigger phrases best practices"
description: "Best practices for topic trigger phrases in Power Virtual Agents"
author: hejammes

ms.date: 03/21/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Optimizing trigger phrases and Natural Language Understanding 

## What are trigger phrases in Power Virtual Agents

Trigger phrases train your chatbot Natural Language Understanding (NLU) model. Trigger phrases are configured at the topic level and indicate to the chatbot for what typical user utterances a specific topic should be triggered. 

Trigger phrases typically capture the way an end-user might ask about a problem or issue.
E.g. *"problem with weeds in lawn"*

> [!TIP]
> When creating a new topic, a maker only needs to provide a few sample phrases. When the chatbot is used, the AI will parse what the user says and trigger the topic closest in meaning to the user utterance. 

## Creating new trigger phrases

If available, use real customer data or production data over making up your own trigger phrases. The best trigger phrases are the ones similar to actual data coming from end-users (as these are the ones that will be asked to the chatbot when it is deployed).

There is no need to leave speficic words out, as the model is already designed to give less weight to unecessary words, such as stop words (words that are filtered out before processing of natural language data because they are insignificant).


## Optimizing trigger phrases

| Tip | Example |
|----------|-----------|
| **Have at least 5-10 trigger phrases per topic, then iterate** | - |
| **Vary sentence structure and key terms** | *"Find my nearest store"* <br> *"Check shop location"* |
| **Use short trigger phrases, usually less than 10 words** | - |
| **Avoid single-word trigger phrases** |  |
| **Use complete phrases** |  |
| **Use complete phrases** |  |
| **Have unique verb/noun or combinations of those to increase accuracy** |  |
| **If you use examples from entities, avoid using always the same  variation of the entity value. You don't need all examples, as the NLU will consider all the variations of the entity** | *I want to order a **burger*** <br> *I would like a **pizza*** <br> *I want **chicken nuggets*** |

## Volume of training data (i.e. Trigger Phrases)

When thinking about the question “how much training data is sufficient”? You should resist the general answer “the more the better”. In best cases it doesn’t help your Natural Language Understanding model and in worst case it can have an have negative effect by overfitting it. 
You should keep your training data small and focused.

## Assessing the impact of your changes to an existing chatbot

When updating trigger phrase, or when merging or splitting topics, there are twi ways to assess the changes:
1.	An immediate change in chatbot behavior which can be observed through the "test bot" canvas (e.g. a topic that is now triggering or not based on trigger phrases updates).
2.	A change after bot deployment and facing traffic, which translates to higher/lower deflection (non-escalation) rates. This can be observed from the analytics tab in PVA.