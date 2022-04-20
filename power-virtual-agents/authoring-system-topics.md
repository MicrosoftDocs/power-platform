---
title: "Use system topics in Power Virtual Agents"
description: ""
keywords: "PVA"
ms.date: 04/20/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.custom: authoring, ceX
ms.collection: virtual-agent
---

# Use system topics in Power Virtual Agents

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](authoring-system-topics.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/authoring-system-topics-teams.md)

System topics are topics you're likely to need during a bot conversation.

You can't delete or disable system topics or edit their trigger phrases. However, you can customize the nodes on the authoring canvas. We recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

<!-- FIXME: flowchart of how topics are called, particularly when ending a conversation -->

If any of the following system topics are triggered, the entire conversation will end:

- End of Conversation
- Confirmed Success
- Confirmed Failure
- Goodbye
- Escalate
- Start over

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

## Greeting

This is the default greeting when a chat begins. Start by having your bot or virtual agent introduce itself.

## Thank you

The purpose of the **Thank you** topic is to acknowledge when the user thanks the bot.

It can be triggered by the user at anytime by responding with one of the built-in trigger phrases, such as:

- "thank you"
- "thanks"
- "ty"

## Goodbye

The **Goodbye** topic is intended to have the bot respond and end the conversation when the user says bids the bot farewell.

It can be triggered by the user at anytime by responding with one of the built-in trigger phrases, such as:

- "goodbye"
- "bye"
- "have a great day"

## Start over

The **Start over** topic is intended to have the bot respond and end the conversation when the user says bids the bot farewell.

It can be triggered by the user at anytime by responding with one of the built-in trigger phrases, such as:

- "start over"
- "restart"
- "let's begin again"

Resets any [global variables](authoring-variables-bot.md)

## End of Conversation

System Intent Default Customer Survey

## Confirmed Success

System Intent Confirmed Success

## Confirmed Failure

System Intent Confirmed Failure

## Fallback

System topic that includes content and behavior for when the bot can't determine the user's intent. Also includes the variable `UnrecognizedTriggerPhrase` to capture the unrecognized input.

In some scenarios, you might want to customize how the bot behaves when user input doesn't trigger any topic. For example, you can build a catchall topic to capture unrecognized user intent, or use a topic to call back-end systems or route to existing services.

[Fallback topic](authoring-system-fallback-topic.md)

## Escalate

During a conversation, a Power Virtual Agents bot [triggers the appropriate topic based on the user's input](authoring-create-edit-topics.md). If the bot can't determine the user's intent, it prompts the user again. After two prompts, the bot escalates to a live agent through the system **Escalate** topic.

The **Escalate** topic can also be triggered by the user at anytime by responding with one of the built-in trigger phrases, such as:

- "talk to agent"
- "escalate"
- "can I talk to a human"

[!INCLUDE[footer-include](includes/footer-banner.md)]
