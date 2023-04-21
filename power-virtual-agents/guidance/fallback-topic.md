---
title: "Leveraging the Fallback topic"
description: "Leveraging the Fallback topic in Power Virtual Agents"
author: HenryJammes

ms.date: 02/22/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Leveraging the Fallback topic

The Fallback topic gets triggered when Power Virtual Agents doesn’t understand a user utterance and doesn’t have sufficient confidence to trigger any of the existing topics.
There are multiple ways to leverage the Fallback topic and offer a great user experience.

## Offloading single question/answer pairs

If you have a large number question/answer pairs for single-turn conversations you can also consider offloading them to the an external system, and access them through the Fallback topic. 

Power Virtual Agents limits a chatbot to 1,000 topics, but you can decide to manage exceptions to the Power Virtual Agents topics (that should generally *do* things for the end-user) through the Fallback topic. With the Fallback topic, you can get answers for end-users that you retrieve from external systems using Power Automate, by [calling a cloud flow from an action node](/power-virtual-agents/advanced-use-flow).

> [!TIP]
> [Question answering in Azure Cognitive Service for Language](/azure/cognitive-services/language-service/question-answering/overview) provides cloud-based Natural Language Processing (NLP) that allows you to create a natural conversational layer over your data. It is used to find the most appropriate answer for any input from your custom knowledge base of information.
> [Learn how to integrate question answering in Power Virtual Agents](/power-virtual-agents/integrate-with-question-answering).

## Giving  your chatbot with a personality 

[Question answering in Azure Cognitive Service for Language](/azure/cognitive-services/language-service/question-answering/overview) provides a readily available "chitchat" data source, of various tones: professional, friendly, witty, etc.
This allows your chatbot to be able to answer trivial questions, such as "*how are you feeling today, bot?*".

## Integrate with generative AI models

You can also use the Fallback topic to call a generative AI model such as ChatGPT on the [Azure OpenAI Service](/azure/cognitive-services/openai/overview), and try to handle additional questions from your end-users.

Through the system prompt and [prompt engineering](/azure/cognitive-services/openai/concepts/prompt-engineering), you can also feed the model with instructions, rules and input data before it generates an answer.

## Learning from the Fallback topic

You should track what your customers are saying that doesn’t trigger a standard Power Virtual Agents topic. These could be used to enrich an existing topic’s trigger phrases (typically when the user utterance should have triggered a topic) or lead to the creation of new topics to better serve your users as you understand better what they’re trying to accomplish.

> [!div class="nextstepaction"]
> [Optimize trigger phrases and Natural Language Understanding](trigger-phrases-best-practices.md)