---
title: "Topics in Power Virtual Agents"
description: "Overview of the different topic types in Power Virtual Agents"
author: hejammes

ms.date: 02/22/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Topics in Power Virtual Agents

## Topic definition

[Topics](/power-virtual-agents/authoring-fundamentals) are the core building blocks of your bot. They can be seen as the bot competencies, and they define how a conversation dialog plays out, by being discrete conversation paths that, when used together within a single bot, allow for users to have a conversation with a bot that feels natural and flows appropriately. 

To author topics, you can:
- Customize provided [templates](/power-virtual-agents/authoring-template-topics), 
- Create [new topics](/power-virtual-agents/authoring-create-edit-topics) from scratch, 
- Or [use content from existing webpages](/power-virtual-agents/advanced-create-topics-from-web). This is useful if you already have help or support content, such as FAQ pages or support sites.

A topic can have trigger phrases and typically contains conversation nodes:
- **Trigger phrases** are phrases, keywords, and questions that a user is likely to use that are related to a specific topic. 
- **Conversation nodes** define how a bot should respond to a trigger phrase and what it should do.

## System topics

When setting up a new bot, several [system topics](/power-virtual-agents/preview/authoring-system-topics) are automatically created to  make the bot readily operational with some basic and core capabilities (e.g. Greetings, Goodbye, Thank you, etc.).
There are also a few system topics that are used to manage specific events:
- **[Conversation Start](/power-virtual-agents/preview/authoring-system-topics#conversation-start)**: this is the a that proactlvely starts the conversation in the unified authoring experience. Users can be greeted with messages by the bot, even before they’ve started entering any input.
- **[Multiple Topics Matched](/power-virtual-agents/preview/authoring-system-topics#multiple-topics-matched)** (also known as 'Did You Mean' or DYM): this topic is triggered when multiple topics can potentially address the user input and the bot doesn't have sufficient confidence to trigger one over the others. When a 'Multiple Topics Matched' topic is triggered, the user is presented with a list of topics and can choose the most appropriate one.
- **[End of conversation](/power-virtual-agents/preview/authoring-system-topics#end-of-conversation)**: at the end of each conversation with a bot, you should redirect the user to the ‘end of conversation’ topic, so that the user can either confirm success or failure, and fill out a statisfaction survey.
- **[Escalate](/power-virtual-agents/preview/authoring-system-topics#escalate)**: this topic is used to hand off the conversation to a live agent (when configured – for example to [Dynamics 365 Omnichannel for Customer Service](/power-virtual-agents/configuration-hand-off-omnichannel)).
- **[Fallback](/power-virtual-agents/preview/authoring-system-topics#fallback)**: this is a specific topic that gets triggered when the user intent isn’t understood and can’t be associated with confidence with any existing topic.