---
title: "Triggering topics"
description: "Overview of the different ways to trigger topics in Power Virtual Agents"
author: hejammes

ms.date: 02/22/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Triggering topics

There are two main ways to trigger a topic: 
- **Based on the user query** (also known as utterance). Topic triggering based on what an end-user writes or says is also referred to as intent recognition. The AI uses natural language understanding (NLU) to parse what a user says and find the most appropriate trigger phrase or node. 
- **By redirecting** to it from another topic, with a redirect node.

## Triggering topics based on a user qurey
Example: The "Store Locations" topic gets triggered based on the user utterance and the matching trigger phrases.

![Diagram showing a Power Virtual Agents being triggered with a matching trigger phrase](./media/topics/topic-triggering-with-trigger-phrases.png)

> [!TIP]
> Check out [trigger phrases best practices](/trigger-phrases-best-practices).

## Redirecting to a topic
Example 2: The "Request New Location" topic gets triggered when it is called from another topic with a redirect.

![Diagram showing a Power Virtual Agents being triggered by a redirect from another topic](./media/topics/topic-triggering-with-redirect.png)

> [!div class="nextstepaction"]
> [Define chatbot topics](defining-chatbot-topics.md)