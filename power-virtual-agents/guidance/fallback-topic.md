---
title: "Leveraging the Fallback topic"
description: "Leveraging the Fallback topic in Power Virtual Agents"
author: hejammes

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

## Offloading single question/answer pairs.

If you have a large number question/answer pairs for single-turn conversations you can also consider offloading them to the Fallback topic and integrate with external services such as custom question answering in Azure Language Studio (part of Azure Cognitive Services). It will also help Power Virtual Agents Natural Language Understanding focus on the trigger phrases you have configured for your topics.

<!-- ADD EXAMPLE + VISUAL -->

## Providing your chatbot with a personality 

When user inputs are not understood, you can also leverage Custom Question Answering in the Azure Cognitive Services Language Studio. “Chitchat” skills of various tone (professional, familiar, etc.) are available. This allows your chatbot to be able to answer trivial questions, such as “how are you feeling today, bot?”.

<!-- ADD EXAMPLE + VISUAL -->

## Learning from the Fallback topic

You should track what your customers are saying that doesn’t trigger a standard Power Virtual Agents topic. These could be used to enrich an existing topic’s trigger phrases (typically when the user utterance should have triggered a topic) or lead to the creation of new topics to better serve your users as you understand better what they’re trying to accomplish.

<!-- ADD EXAMPLE + VISUAL -->