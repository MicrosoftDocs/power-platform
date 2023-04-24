---
title: Use system topics in Power Virtual Agents (preview)
description: Learn how to use system topics in conversations in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 12/13/2022

ms.topic: conceptual
author: iaanw
ms.author: iawilt
ms.reviewer: ggupta
ms.custom: authoring, ceX, bap-template
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Use system topics in Power Virtual Agents (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Unlike topics that you create, system topics are built into Power Virtual Agents. They're added to a bot automatically when you create it. System topics help your bot respond to common system events, such as escalation, or carry out essential behavior, such as ending a conversation. You can't delete system topics. You can disable ones that you don't need, however.

When you create a bot, all system topics are configured to trigger at the appropriate times, in response to related events. However, you can manually trigger system topics by [redirecting](/authoring-create-edit-topics.md#redirect-to-another-topic) to them. Some also have trigger phrases that you can customize to fit your needs.

> [!TIP]
> Although you can edit the content and nodes in system topics, we recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

Following are the system topics that are included with a bot, their intended purpose, and details about when they're triggered.

## Conversation Start

Greets users and introduces the bot and its capabilities.

Triggers when a bot first engages with a user in conversation.

## End of Conversation

Confirms with customers that their query has been answered.

Triggers when redirected to. You should call this topic from your custom topics when you're ready to end a conversation.

## Escalate

Informs customers about how they can speak to a human.

Triggers when a trigger phrase such as "talk to agent" is matched or when the Escalate system event is triggered. For example, [**Question** nodes](authoring-ask-a-question.md#configure-question-behavior) can be configured to escalate if they don't receive a valid answer from the customer.

## Fallback

Informs users that their query couldn't be matched to a topic and asks them to try again.

Triggers when the bot can't match the user's message to a topic.

## Multiple Topics Matched

Prompts users to choose their intended topic and sets a system variable to identify the topic that's ultimately triggered.

Triggers when a user's message closely matches multiple topics.

## Reset Conversation

Resets the conversation by clearing variable values and forcing the bot to use the latest published bot content.

Triggers when redirected to.

## On Error

Informs customers that an error has occurred. The message includes an error code, the conversation ID, and the error timestamp, which can be used later for debugging. If the conversation is taking place in the Test bot pane, a more detailed error message is also included to help the bot author diagnose the issue. Learn how to [troubleshoot error codes](error-codes.md).

Triggers when an error occurs during the conversation.

## Signin

Prompts customers to sign in when user authentication is enabled. Learn how to [add user authentication](advanced-user-authentication.md).

Triggers at the beginning of the conversation when users are required to sign in, or when the conversation reaches a node that uses authentication variables.

[!INCLUDE[footer-include](includes/footer-banner.md)]
