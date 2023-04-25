---
title: "Trigger phrases best practices"
description: "Best practices for topic trigger phrases in Power Virtual Agents"
author: HenryJammes

ms.date: 03/21/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Optimizing trigger phrases and Natural Language Understanding 

## What are trigger phrases in Power Virtual Agents

- Trigger phrases train your chatbot's **Natural Language Understanding** (NLU) model.

- Trigger phrases are configured at the topic level and indicate to the chatbot for what typical user utterances a specific topic should be triggered. 

- Trigger phrases typically capture the way an end-user would ask about a problem or issue. <br> E.g. *"problem with weeds in lawn"*

> [!TIP]
> When creating a new topic, a maker only needs to provide a few sample phrases (ideally between 5 and 10). When the chatbot is used, the AI will parse what the user says and trigger the topic closest in meaning to the user utterance. 

## The importance of the triggering context

Power Virtual Agents Natural Understanding (NLU) behaves slightly differently based on the conversation state. This can sometimes lead to different behaviors for the same user utterance.

Below are the different conversation states:
 - **Start of the conversation**: the chatbot has no context, so a user utterance is expected to either: trigger a topic directly (*IntentRecognition*), trigger a 'Did You Mean' (Multiple Topics Matched) disambiguation question (*IntentCandidates*) if there are multiple matching topics, or fallback (*UnknownIntent*) if the intent is not recognized.
 - **After a 'Did You Mean' (Multiple Topics Matched) is triggered**: NLU will optimize to match one of the suggested topics, with higher thresholds to move out of the presented options.
 - **Switching out from a current topic**: if the NLU is trying to fill a slot in a topic, and user is giving a user query, that could trigger another topic (topic switching).

## On punctuation

 The Natural Understanding (NLU) model is agnostic to punctuation, including question marks.

## Creating new trigger phrases

If possible, start with **real production data** over making up your own trigger phrases. The best trigger phrases are the ones similar to actual data coming from end-users. These are the ones that will likely be asked to the chatbot when it is deployed.

There is no need to leave speficic words out: the model is designed to give less weight to unecessary words, such as stop words (words that are filtered out before processing of natural language data because they are insignificant).

## Optimizing trigger phrases

| # | Tip | Examples |
|----------|----------|-----------|
| **1** | **Have at least 5-10 trigger phrases per topic** <br>Iterate and add more as your learn from users. | *Find my nearest store* <br> *Check store location* <br> *Find a store* <br> *Find me your nearest location* <br> *Store near me* |
| **2** | **Vary sentence structure and key terms** <br> The model will automatically consider variations of those | *When are you closed*<br>*Daily open hours* |
| **3** | **Use short trigger phrases** <br> Usually less than 10 words. | *When are you open* |
| **4** | **Avoid single-word trigger phrases** <br> This increases weight for specific words in topic triggering. <br> It can introduce confusion between similar topics. | *Store* |
| **5** | **Use complete phrases** | *Can I talk to a human assistant* |
| **6** | **Have unique verb/noun or combinations of those** | *I need customer service* <br> *I want to speak with a consultant* |
| **7** | **Aoid using the same entity variation** <br> You don't need to use all of the examples from the entity value. <br> The NLU will automatically consider all the variations. | *I want to order a **burger*** <br> *I would like a **pizza***<br> *I want **chicken nuggets*** |

## Balance the number of trigger phrases per topic

Try to balance the number of trigger phrases between topic. 

> [!TIP]
> That way, the Power Virtual Agents Natural Language Understanding capabilities don’t overweight a topic versus another based on the configured trigger phrases. 

## Assessing the impact of your changes

When updating trigger phrases, or when merging or splitting topics, there are multiple ways to assess the changes:
> [!div class="checklist"]
> * An immediate change in chatbot behavior, which can be observed through the "test bot" canvas (e.g. a topic that is now triggering or not based on trigger phrases updates).
> * A change after bot deployment and facing traffic, which translates to higher/lower deflection (non-escalation) rates. This can be observed from the analytics tab in Power Virtual Agents.

> [!TIP]
> You can test topic triggering and how your Natural Language Understanding model performs against test data in bulk, by leveraging the [Bot Test Framework](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/BotTestFramework). 
> 
> Although the underlying features and components used to build the Bot Test Framework (such as interacting with the Direct Line API) are fully supported, the Bot Test Framework itself represents sample implementations of these features.
> 
> Our customers and community can use and adjust it to implement bulk testing. If you face issues with the Bot Test Framework, report them issue here: https://aka.ms/PVASamples. (Microsoft Support won’t help you with issues related to this kit, but they will help with related, underlying platform and feature issues.)


> [!div class="nextstepaction"]
> [Entities and slot filling best practices](slot-filling-best-practices.md)