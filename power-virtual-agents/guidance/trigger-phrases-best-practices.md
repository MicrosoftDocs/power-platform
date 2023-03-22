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

| Tip | Examples |
|----------|-----------|
| **Have at least 5-10 trigger phrases per topic** <br>Iterate and add more as your learn from users | |
| **Vary sentence structure and key terms** | *"Find my nearest store"*<br>*"Check shop location"* |
| **Use short trigger phrases** <br> Usually less than 10 words | |
| **Avoid single-word trigger phrases** | |
| **Use complete phrases** | |
| **Have unique verb/noun or combinations of those** | |
| **When using examples from entities, avoid using the same  variation** <br> You also don't need to use all of the examples from the entity value, as the NLU will automatically consider all the variations. | *I want to order a **burger*** <br> *I would like a **pizza***<br> *I want **chicken nuggets*** |

## Assessing the impact of your changes

When updating trigger phrases, or when merging or splitting topics, there are two ways to assess the changes:
> [!div class="checklist"]
> * An immediate change in chatbot behavior, which can be observed through the "test bot" canvas (e.g. a topic that is now triggering or not based on trigger phrases updates).
> * A change after bot deployment and facing traffic, which translates to higher/lower deflection (non-escalation) rates. This can be observed from the analytics tab in Power Virtual Agents.