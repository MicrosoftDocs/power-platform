---
title: "Triggering topics"
description: "Overview of the different ways to trigger topics in Power Virtual Agents"
author: HenryJammes

ms.date: 02/22/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Triggering topics

There are two main ways to trigger a topic: 
> [!div class="checklist"]
> * **Based on the user query** (also known as *utterance*). <br> Topic triggering based on what an end-user writes or says is also referred to as *intent recognition*. <br> The AI uses its Natural Language Understanding (NLU) model to parse the end-user utterance and finds the most relevant topic based on the configured trigger phrases that match the intent. <br> If multiple topics are found, the [Multiple Topics Matched](/power-virtual-agents/preview/authoring-system-topics#multiple-topics-matched) topic is triggered, so the that the user can select the appropriate topic from a list.
> * **By redirecting** to it from another topic, with a redirect node.

## Triggering topics based on a user qurey
> [!div class="checklist"]
> * Example: The "*Store Locations*" topic gets triggered based on the user utterance and the matching **trigger phrases**.

![Diagram showing a Power Virtual Agents being triggered with a matching trigger phrase](./media/topics/topic-triggering-with-trigger-phrases.png)

> [!TIP]
> Review [trigger phrases best practices](/trigger-phrases-best-practices).

## Redirecting to a topic
> [!div class="checklist"]
> * Example: the "*Request New Location*" topic gets triggered when it is explicitely called from an existing topic, with a **redirect** node.

![Diagram showing a Power Virtual Agents being triggered by a redirect from another topic](./media/topics/topic-triggering-with-redirect.png)

> [!div class="nextstepaction"]
> [Define chatbot topics](defining-chatbot-topics.md)