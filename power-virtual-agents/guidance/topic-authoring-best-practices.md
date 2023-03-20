---
title: "Topic authoring best practices"
description: "Topic authoring best practices in Power Virtual Agents"
author: hejammes

ms.date: 02/23/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Topic authoring best practices in Power Virtual Agents

## Create bite-size topics

Bite-size topics doesn’t mean that all topics should have trigger phrases, as topics triggered with trigger phrases can in turn redirect to other topics based on additional user inputs and answers.

> [!TIP]
> It’s often more manageable to create many bite-size topics rather than a few large topics. Taking this approach also helps making triggering more effective, by clearly mapping trigger phrases to the specific topics that address those areas.

The number of topics is a Conversational Design preference and decision, as it either results in having a few bigger topic (in case of joining) or having more smaller topics (in case of splitting). 

<!-- ADD EXAMPLE + VISUAL. Check Order Status > Update Order -->

## When multiple topics are too close, create a disambiguation topic

> [!TIP]
> On joining vs splitting topics, E.g. “unblock credit card” and “unblock debit card”. Users might just say “unblock card” and the model doesn’t know what specific topic and process to trigger. You can start an “unblock card” topic, use a question and an entity for the type of card (debit or credit) and launch the appropriate child topic accordingly.

<!-- ADD EXAMPLE + VISUAL. E.g. Credit Card / Debit Card  -->

## Balance the number of trigger phrases per topic

> [!TIP]
> Try to balance the number of trigger phrases between topic (starting with at least 5 to 10 per topic). That way, the Power Virtual Agents Natural Language Understanding capabilities don’t overweight a topic versus another based on the configured trigger phrases. 

<!-- ADD EXAMPLE + VISUAL. E.g. same amout of trigger phrases in different topics -->

## Leverage entities to reduce the number of topics

> [!TIP]
> For intents that are more complex to recognize (for example when they could be about a large number of options in a customer’s existing implementation, e.g. “request” for a banking customer, as one could request many different things), then splitting the topics might be a better option, with adequate trigger phrases.

Instead of creating similar topics:
- Order Pizzas
- Order Burgers
- Order Drinks
Create:
- 1 topic for Order
- 1 entity for Pizzas/Burgers/Drinks

<!-- ADD EXAMPLE + VISUAL -->

## Avoid topic overlap

> [!TIP]
> 
For topics triggered with trigger phrases, you should:
- Compare the trigger phrases across your topics and remove ambiguous pairs.
- Try to not use the same words in different topics. 
There are multiple ways to monitor topic overlap:
- Analyze the user utterances that trigger a “Did You Mean” topic, as it’s a key indicator that you have overlap
- Power Virtual Agents offers a Topic Overlap detection feature that enables authors to discover overlapping topics to resolve accordingly (deleting/moving trigger phrases between topics).

<!-- ADD EXAMPLE + VISUAL -->