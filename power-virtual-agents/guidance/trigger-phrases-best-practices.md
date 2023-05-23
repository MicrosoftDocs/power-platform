---
title: "Trigger phrases best practices"
description: "Guidance and best practices for topic trigger phrases in Power Virtual Agents."
author: HenryJammes
ms.date: 05/23/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.reviewer: iawilt
---

# Optimizing trigger phrases and natural language understanding

## What are trigger phrases in Power Virtual Agents

- Trigger phrases train your chatbot's natural language understanding (NLU) model.

- Trigger phrases are configured at the topic level and indicate to the chatbot for what typical user utterances a specific topic should be triggered.

- Trigger phrases typically capture the way an end-user would ask about a problem or issue.   
    For example,  _"problem with weeds in lawn"_

> [!TIP]
> When creating a new topic, a maker only needs to provide a few sample phrases (ideally between five and ten). When the chatbot is used, the AI will parse what the user says and trigger the topic closest in meaning to the user utterance.

## The importance of the triggering context

Power Virtual Agents NLU behaves differently based on the conversation state, which can sometimes lead to different behaviors for the same user utterance.

The following are the different conversation states:

- **Start of the conversation**: the chatbot has no context, so a user utterance is expected to either: trigger a topic directly (_IntentRecognition_), trigger a "did you mean" (Multiple Topics Matched) disambiguation question (_IntentCandidates_) if there are multiple matching topics, or fallback (_UnknownIntent_) if the intent isn't recognized.
- **After a "did you mean" (Multiple Topics Matched) is triggered**: NLU optimizes to match one of the suggested topics, with higher thresholds to move out of the presented options.
- **Switching out from a current topic**: If the NLU Is trying to fill a slot In a topic, and the user is giving a user query that could trigger another topic (topic switching).

## On punctuation

 The NLU model Is agnostic to punctuation, including question marks.

## Creating new trigger phrases

If possible, start with real production data over making up your own trigger phrases. The best trigger phrases are the ones similar to actual data coming from end users. These phrases are the ones that users ask the chatbot when it's deployed.

There's no need to leave specific words out: the model is designed to give less weight to unnecessary words, such as stop words (words that are filtered out before the processing of natural language data because they're insignificant).

## Optimizing trigger phrases

| # | Tip | Examples |
|----------|----------|-----------|
| **1** | **Have at least 5-10 trigger phrases per topic** <br>Iterate and add more as you learn from users. | _Find my nearest store_ <br> _Check store location_ <br> _Find a store_ <br> _Find me your nearest location_ <br> _Store near me_ |
| **2** | **Vary sentence structure and key terms** <br> The model automatically considers variations of those phrases. | _When are you closed_<br>_Daily open hours_ |
| **3** | **Use short trigger phrases** <br> Fewer than 10 words. | _When are you open_ |
| **4** | **Avoid single-word trigger phrases** <br> This increases weight for specific words in topic triggering. <br> It can introduce confusion between similar topics. | _Store_ |
| **5** | **Use complete phrases** | _Can I talk to a human assistant_ |
| **6** | **Have unique verbs and nouns or combinations of those** | _I need customer service_ <br> _I want to speak with a consultant_ |
| **7** | **Avoid using the same entity variation** <br> You don't need to use all of the examples from the entity value. <br> The NLU automatically considers all the variations. | _I want to order a **burger**_ <br> _I would like a **pizza**_ <br> _I want **chicken nuggets**_ |

## Balance the number of trigger phrases per topic

Try to balance the number of trigger phrases between topics.

> [!TIP]
> That way, the NLU capabilities don't overweight a topic versus another based on the configured trigger phrases.

## Assessing the impact of your changes

When updating trigger phrases, or when merging or splitting topics, there are multiple ways to assess the changes:

> [!div class="checklist"]
>
> - An immediate change in chatbot behavior, which can be observed through the "test bot" canvas (for example, a topic that is now triggering or not based on trigger phrase updates).
> - A change after bot deployment and facing traffic, which translates to higher or lower deflection (non-escalation) rates. This can be observed from the analytics tab in Power Virtual Agents.

> [!TIP]
> You can test topic triggering and how your NLU model performs against test data in bulk, by leveraging the [Bot Test Framework](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/BotTestFramework).
>
> Although the underlying features and components used to build the Bot Test Framework (such as interacting with the Direct Line API) are fully supported, the Bot Test Framework itself represents sample implementations of these features.
>
> Our customers and community can use and adjust the Bot Test Framework to implement bulk testing. If you face issues with the Bot Test Framework, report the issue here: https://aka.ms/PVASamples. (Microsoft Support won’t help you with issues related to these samples, but they will help with related, underlying platform and feature issues.)

> [!div class="nextstepaction"]
> [Entities and slot filling best practices](slot-filling-best-practices.md)
