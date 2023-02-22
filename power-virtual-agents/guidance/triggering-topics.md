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
- **Based on the user inputs** (also known as utterances). Topic triggering based on what an end-user writes or says is also referred to as intent recognition. The AI uses natural language understanding (NLU) to parse what a user says and find the most appropriate trigger phrase or node. 
- **By redirecting** to it from another topic, with a redirect node.

**Example 1: The "Store Locations" topic gets triggered based on the user utterance and the matching trigger phrases.**

:::image type="content" source="media/topics/topic-triggering-with-trigger-phrases.png" alt-text="Diagram showing a Power Virtual Agents being triggered with a matching trigger phrase":::

**Example 2: The "Request New Location" topic gets triggered when it is called from another topic with a redirect.**

:::image type="content" source="media/topics/topic-triggering-with-redirect.png" alt-text="Diagram showing a Power Virtual Agents being triggered by a redirect from another topic":::