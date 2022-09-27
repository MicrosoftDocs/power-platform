---
title: "Use system topics in Power Virtual Agents"
description: "Learn how system topics are used in conversations in public preview."
keywords: "PVA"
ms.date: 04/20/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.custom: authoring, ceX
ms.collection: virtual-agent
ms.reviewer: ggupta
---

# Use system topics in Power Virtual Agents public preview

System topics are built-in topics, that help your bot respond to common system events, such as escalation, or carry out essential behavior for your bot, such as ending a conversation. You can't delete system topics but, they can be disabled.

When you first create a bot, all system topics are configured to trigger at the appropriate times, in response to related events. However, you can manually trigger system topics by [redirecting](/authoring-create-edit-topics.md#redirect-to-another-topic) to them. Some also have trigger phrases that you can customize to fit your needs.

> [!TIP]
> You can edit the content and nodes within system topics, however, we recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

Below are the system topics included with a bot, their intended purpose, and details of when they're triggered.

## Conversation Start

Provides an initial greeting to the user, introducing the bot and it's capabilities.

**Trigger:** When a bot first engages with a user in conversation.

## End of Conversation

Confirms with the customer if their query has been answered.

**Trigger:** When manually redirected to. You should call this topic from your custom topics when you're ready to end a conversation.

## Escalate

Sends a message to the customer with information of how they can speak to a real person.

**Trigger:** When a trigger phrase is matched (such as "talk to agent") OR when the Escalate system event is triggered, such as when a [Question node](authoring-ask-a-question.md#additional-question-behavior) is configured to escalate if it does not receive a valid answer from a customer.

## Fallback

Informs the user that their query could not be matched to a topic and asks them to try again.

**Trigger:** When the bot cannot match the user's message to an topic

## Multiple Topics Matched

Prompts the user to choose their intended topic and sets a system variable to determine which topic is ultimately triggered.

**Trigger:** When a user's message closely matches multiple topics.

## Reset Conversation

Resets the conversation by clearing variable values and forcing the bot to use the latest published bot content.

**Trigger:** When manually redirected to.

## On Error

Sends a message to inform the user that an error has occurred, including an error code, conversation ID, and error time, which can be used later for debugging. If the bot is being used within the test bot pane, a more detailed error message is also included to help the bot author diagnose the issue. See [Troubleshoot error codes](error-codes.md).

**Trigger:** When an error occurs during the conversation.

## Signin

Prompts the user to sign in when user authentication is enabled.

**Trigger:** At the beginning of the conversation when sign in is required, or when the conversation reaches a node that uses authentication variables.

[!INCLUDE[footer-include](includes/footer-banner.md)]
