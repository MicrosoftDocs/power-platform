---
title: "Use system topics in Microsoft Copilot Studio"
description: "Learn how system topics are used in conversations."
ms.date: 03/24/2023
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.service: power-virtual-agents
ms.collection: virtual-agent
ms.reviewer: ggupta
---

# Use system topics in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

System topics are common topics used in conversations with a bot.

When you first create a bot, all system topics are configured to trigger at the appropriate times. However, you can manually trigger system topics by [redirecting](authoring-create-edit-topics.md#redirect-to-another-topic) to them.

## System topics

### [Web app](#tab/webApp)

Unlike topics that you create, system topics are built into Microsoft Copilot Studio. They're added to a bot automatically when you create it. System topics help your bot respond to common system events, such as escalation, or carry out essential behavior, such as ending a conversation. You can't delete system topics. You can disable ones that you don't need, however.

When you create a bot, all system topics are configured to trigger at the appropriate times, in response to related events. However, you can manually trigger system topics by [redirecting](authoring-create-edit-topics.md#redirect-to-another-topic) to them. Some also have trigger phrases that you can customize to fit your needs.

You can't delete or disable system topics, or edit their trigger phrases. However, you can customize the nodes on the authoring canvas. We recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation. If you make changes to a system topic that later you don’t want anymore, you need to go back to the default. This can be done using the Reset to Default button available on system topics.

:::image type="content" source="media/authoring-system-topics/reset-system-topic.png" alt-text="Diagram of resetting system topics.":::

> [!TIP]
> Although you can edit the content and nodes in system topics, we recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

Following are the system topics that are included with a bot, their intended purpose, and details about when they're triggered.

### Conversation Start

Greets users and introduces the bot and its capabilities.

Triggers when a bot first engages with a user in conversation.

### End of Conversation

Confirms with customers that their query has been answered.

Triggers when redirected to. You should call this topic from your custom topics when you're ready to end a conversation.

### Escalate

Informs customers about how they can speak to a human.

Triggers when a trigger phrase such as "talk to agent" is matched or when the Escalate system event is triggered. For example, **Question** nodes can be configured to escalate if they don't receive a valid answer from the customer.

> [!NOTE]
> If using Microsoft Copilot Studio with [hand off to OmniChannel](configuration-hand-off-omnichannel.md) configured, follow the instructions on the [Hand off to a live agent](advanced-hand-off.md#configuring-the-escalate-system-topic) to ensure proper hand-off to Dynamics 365 Customer Service.

### Fallback

Informs users that their query couldn't be matched to a topic and asks them to try again.

Triggers when the bot can't match the user's message to a topic.

### Multiple Topics Matched

Prompts users to choose their intended topic and sets a system variable to identify the topic that's ultimately triggered.

Triggers when a user's message closely matches multiple topics.

### Reset Conversation

Resets the conversation by clearing variable values and forcing the bot to use the latest published bot content.

Triggers when redirected to.

### On Error

Informs customers that an error has occurred. The message includes an error code, the conversation ID, and the error timestamp, which can be used later for debugging. If the conversation is taking place in the Test bot pane, a more detailed error message is also included to help the bot author diagnose the issue. Learn how to [troubleshoot error codes](error-codes.md).

Triggers when an error occurs during the conversation.

### Signin

Prompts customers to sign in when user authentication is enabled. Learn how to [add user authentication](advanced-end-user-authentication.md).

Triggers at the beginning of the conversation when users are required to sign in, or when the conversation reaches a node that uses authentication variables.


# [Classic](#tab/classic)

The following diagram provides a visualization of how conversations flow through system topics.

:::image type="content" source="media/authoring-system-topics/system-topics.png" alt-text="Diagram of system topics in a conversation.":::

> [!NOTE]
> Some of these topics are only available for Classic bots.

The table below lists all available system topics, their intended purpose, and a small sample of the built-in trigger phrases.

To see all trigger phrases for a system topic, [open the topic to view them in the trigger phrases pane](authoring-create-edit-topics.md).

| System topic        | Trigger phrases                                      | Purpose                                                                                                                                                                         |
| ------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Greeting            | "hey", "hello", "good morning"                       | Greet the user when a chat begins.                                                                                                                                              |
| Thank you           | "thank you", "thanks", "ty"                          | Acknowledge when the user thanks the bot.                                                                                                                                       |
| Goodbye             | "goodbye", "bye", "have a great day"                 | End the conversation when the user bids the bot farewell.                                                                                                                       |
| Start over          | "start over", "restart", "let's begin again"         | Start the conversation over and reset all [bot variables](authoring-variables-bot.md).                                                                                       |
| Escalate            | "talk to agent", "escalate", "can I talk to a human" | Escalates to a live agent. To learn more, see [Hand off to a live agent](advanced-hand-off.md).                                                                                |
| End of Conversation | None                                                 | [Redirect](authoring-create-edit-topics.md#redirect-to-another-topic) to this topic at the end of a conversation to give the user a [satisfaction survey](analytics-csat.md). |
| Confirmed Success   | None                                                 | When the user responds "yes" to the end-of-conversation [satisfaction survey](analytics-csat.md).                                                                              |
| Confirmed Failure   | None                                                 | When the user responds "no" to the end-of-conversation [satisfaction survey](analytics-csat.md).                                                                               |
| Fallback            | None                                                 | When the bot can't determine the user's intent. To learn more, see [Fallback topic](authoring-system-fallback-topic.md).                                                        |

> [!IMPORTANT]
> If any of the following system topics are triggered, the entire conversation will end:
>
> - End of Conversation
> - Confirmed Success
> - Confirmed Failure
> - Goodbye
> - Escalate
> - Start over

---
