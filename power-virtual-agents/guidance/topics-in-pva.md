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

[Topics](/power-virtual-agents/authoring-fundamentals) are the core building blocks of a chatbot. Topics can be seen as the bot competencies: they define how a conversation dialog plays out, by being discrete conversation paths that, when used together, allow for users to have a conversation with a bot that feels natural and flows appropriately. 

To author topics, makers can:
- Customize provided [templates and examples](/power-virtual-agents/authoring-template-topics), 
- Create [new topics](/power-virtual-agents/authoring-create-edit-topics) from scratch, 
- Or [use content from existing webpages](/power-virtual-agents/advanced-create-topics-from-web) to suggest new topics. This is useful when content already exists in an FAQ format, in a publicly available website.

## Topic concent

A topic can have trigger phrases and typically contains conversation nodes:
- **Trigger phrases** are phrases, keywords, and questions that a user is likely to use that are related to a specific topic. 
- **Conversation nodes** define how a chatbot should respond to a trigger phrase and what it should do (e.g. ask questions, send a message, trigger an action, or conditions for branching logic).

## System topics

When setting up a new chatbot, several [system topics](/power-virtual-agents/preview/authoring-system-topics) are automatically created to  make the chatbot readily operational with some basic and core capabilities (e.g. Greetings, Goodbye, Thank you, etc.).
There are also a few system topics that are used to manage specific events:

| System topic | Description |
|----------|-----------|
|**[Conversation Start](/power-virtual-agents/preview/authoring-system-topics#conversation-start)** | This topic is the one that gets proactively started to initiate the conversation. Users can be greeted with messages by the bot, even before they’ve started entering any input. |
| **[Multiple Topics Matched](/power-virtual-agents/preview/authoring-system-topics#multiple-topics-matched)** (also known as 'Did You Mean' or DYM)| This topic is triggered when multiple topics can potentially address the user input and the chatbot doesn't have sufficient confidence to trigger one over the others. When a 'Multiple Topics Matched' topic is triggered, the user is presented with a list of potential matching topics and can choose the most appropriate one. |
| **[End of conversation](/power-virtual-agents/preview/authoring-system-topics#end-of-conversation)** | This topic should be positioned at the end of each conversation with a chatbot, so that the user can confirm if the provided answer was useful or not, and fill out a statisfaction survey. This is crucial to act on your chatbot key performance indicators. |
| **[Escalate](/power-virtual-agents/preview/authoring-system-topics#escalate)** | This topic is used to hand off the conversation to a live agent (when configured – for example to [Dynamics 365 Omnichannel for Customer Service](/power-virtual-agents/configuration-hand-off-omnichannel)). |
| **[Fallback](/power-virtual-agents/preview/authoring-system-topics#fallback)** | This topic is triggered when the user query isn’t understood and can’t be associated with confidence with any existing topic. It is useful to have a strategy to catch these exceptions and handle them in a graceful way (with additional data sources or through an escalation path). |

> [!div class="nextstepaction"]
> [Learn about triggering topics](triggering-topics.md)