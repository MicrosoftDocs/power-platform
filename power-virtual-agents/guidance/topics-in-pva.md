---
title: "Topics in Power Virtual Agents"
description: "Overview of the different topic types in Power Virtual Agents"
author: HenryJammes

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
- Create [new topics](/power-virtual-agents/preview/authoring-create-edit-topics) from scratch.

- Create new topics using [Copilot (preview)](/power-virtual-agents/nlu-authoring): Copilot lets you create and iterate on topics by describing what you want and having AI build it for you.

<!--- Commenting as this feature is no longer available in the unified authoring canvas.
- [Use content from existing webpages](/power-virtual-agents/advanced-create-topics-from-web) to suggest new topics: this is useful to quickly create single-turn, question and answer pair topics, when content already exists in an FAQ format, in a publicly available website.
--->

- Customize provided [templates](/power-virtual-agents/fundamentals-templates) and [samples](/power-virtual-agents/preview/authoring-template-topics).

## Topic content

A topic can optionally have trigger phrases associated to it, and contains conversation nodes:
- **Trigger phrases** are phrases, keywords, and questions that a user is likely to use that are related to the topic. When a user says something to the chatbot that is sufficiently close to the configured trigger phrases, the matching topic gets triggered.
- **Conversation nodes** can be seen as action steps and define what the topic should do once it is triggered (e.g. ask questions, send a message, trigger a cloud flow, set variable values, or use conditions for branching logic, etc.).

## Default topics

> [!TIP]
> > [!div class="checklist"]
> > * Any new chatbot comes with a set of **pre-created topics** that make the chatbot readily operational with core capabilities.
> > * Both **custom** and **system topics** are pre-created.

### Custom topics
The generated custom topics offer fundamental conversational abilities, such as Greetings, Goodbye, Thank you, Start Over, etc. while the [lesson topics](/power-virtual-agents/authoring-template-topics) serve as example topics for topic authors. 

> [!IMPORTANT]
> - Bot authors can choose to disable or delete custom topics. 
> - Any new topic is created as a custom topic.

### System topics

A number of  [system topics](/power-virtual-agents/preview/authoring-system-topics) are also natively available and help manage specific conversation events. 

> [!IMPORTANT]
> System topics can be disabled (with caution, as they can impact the chatbot's behavior) but cannot be deleted.

| System topic | Description |
|--|--|
| **[Conversation Start](/power-virtual-agents/preview/authoring-system-topics#conversation-start)** | Depending on the chatbot client, this topic gets proactively started to initiate the conversation with the user. Users can be greeted with messages by the bot, even before they’ve started entering any input. |
| **[End of Conversation](/power-virtual-agents/preview/authoring-system-topics#end-of-conversation)** | This topic is meant to be positioned at the end of the conversation with a chatbot, so that the user can confirm if their query has been addressed or not, and fill out a satisfaction  survey. This topic is important to measure a chatbot's performance and act on it. <br> When this topic is reached, the session outcome is assumed to be _resolved_, unless the end-user explicitely doesn't confirm resolution. |
| **[Escalate](/power-virtual-agents/preview/authoring-system-topics#escalate)** | The escalate topic is used to hand off the conversation to an external system, typically to a live agent (when configured – for example to [Dynamics 365 Omnichannel for Customer Service](/power-virtual-agents/configuration-hand-off-omnichannel)). When this topic is reached, the session outcome is *escalated*. |
| **[Fallback](/power-virtual-agents/preview/authoring-system-topics#fallback)** | This topic is triggered when the user query isn’t understood and can’t be associated with confidence with any existing topic. It is useful to have a strategy to catch these exceptions and handle them in a graceful way (with additional data sources or through an escalation path). |
| **[Multiple Topics Matched](/power-virtual-agents/preview/authoring-system-topics#multiple-topics-matched)** (also known as 'Did You Mean' or DYM) | This topic is triggered when multiple topics can potentially address the user input and the chatbot doesn't have sufficient confidence to trigger one over the others. When a 'Multiple Topics Matched' topic is triggered, the user is presented with a list of potential matching topics and can choose the most appropriate one. | * |
| **[On Error](/power-virtual-agents/preview/authoring-system-topics#on-error)** | The On Error topic informs end-users that an error has occurred. The message includes the [error code](/power-virtual-agents/preview/error-codes), the conversation ID, and the error timestamp, which can be used later for debugging. <br> This topic can be customized to change the way errors are presented to the end-user and what should happen when an error occurs. |
| **[Reset conversation](/power-virtual-agents/preview/authoring-system-topics#reset-conversation)** | This topic resets the conversation by clearing all variable values and forcing the chatbot to use the latest published content. It only triggers when redirected to, which is the default behavior with the Start Over topic. |
| **[Sign in](/power-virtual-agents/preview/authoring-system-topics#signin)** | This topic prompts end-users to sign in when user authentication is enabled. It triggers at the beginning of the conversation when users are required to sign in, or when the conversation reaches a node that uses authentication variables. |

> [!div class="nextstepaction"]
> [Learn about triggering topics](triggering-topics.md)