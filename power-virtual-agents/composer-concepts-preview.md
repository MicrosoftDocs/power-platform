---
title: Key concepts for Bot Framework Composer users
description: Overview of how key concepts in Microsoft Bot Framework Composer translate to concepts in Microsoft Copilot Studio preview.
ms.date: 03/24/2023
ms.topic: conceptual
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: fundamentals, ceX, bap-template
ms.service: power-virtual-agents
ms.collection:
  - virtual-agent
  - get-started
searchScope:
  - "Power Virtual Agents"
---

# Key concepts for Bot Framework Composer users

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

If you're used to designing bots in Bot Framework Composer, you'll find that some things are different in the Microsoft Copilot Studio preview, and some things are similar. The following table lists some key concepts in Composer and where to find similar concepts in Microsoft Copilot Studio preview.

| Composer concept               | Microsoft Copilot Studio concept                        | Description                                                                                                                                                                                                                                        |
| :----------------------------- | :-------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Dialogs and triggers           | [Topics][]                                          | Use topics to organize conversation flow or paths. A topic has a set of _trigger phrases_ that indicate when the bot should start the topic and a set of _nodes_ that describe the topic's conversation path.                                      |
| Intents                        | [Trigger phrases][]                                 | Add trigger phrases to a topic for the phrases, keywords, and questions that a customer is likely to type related to a specific issue. Microsoft Copilot Studio uses natural language understanding to parse what a customer types and find the most appropriate topic. |
| Actions and prompts            | [Nodes][]                                           | Use nodes, such as messages, questions, and conditional branches, on the authoring canvas to create a topic's conversation path.                                                                                                           |
| Bot response variation         | [Response variations][] and [question variations][] | Use response and question variations to add variety to your bot's messages and questions.                                                                                                                                                          |
| Suggested actions              | [Quick replies][]                                   | Use quick replies to provide default reply options to the customer.                                                                                                                                                                                    |
| Entities                       | [Entities][]                                        | Define and use entities to extract semantic information from what a customer types.                                                                                                                                                                   |
| State, storage, and properties | [Variables][]                                       | Use variables to track state.                                                                                                                                                                                                                      |
| Formulas and expressions       | [Power Fx][]                                        | Use Power Fx to create expressions.                                                                                                                                                                                                                |

[Entities]: advanced-entities-slot-filling.md
[Nodes]: authoring-create-edit-topics.md
[Power Fx]: advanced-power-fx.md
[question variations]: authoring-send-message.md#use-message-variations
[Quick replies]: authoring-send-message.md#use-quick-replies
[Response variations]: authoring-send-message.md#use-message-variations
[Topics]: authoring-create-edit-topics.md
[Trigger phrases]: authoring-create-edit-topics.md
[Variables]: authoring-variables.md


[!INCLUDE[footer-include](includes/footer-banner.md)]
