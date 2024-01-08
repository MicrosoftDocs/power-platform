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

System topics are common topics used in conversations with a copilot.

System topics are configured to trigger at appropriate times in response to related events. However, you can manually trigger system topics by [redirecting](authoring-create-edit-topics.md#redirect-to-another-topic) a conversation to them. Some system events have trigger phrases that you can customize to fit your needs.

## System topics

### [Web app](#tab/webApp)

Unlike topics that you create, system topics are built into Microsoft Copilot Studio and added to a copilot automatically when you create it. System topics help your copilot respond to common system events like escalation and have essential behavior like ending a conversation. You can't delete system topics. You can disable system topics you don't need, however.

We recommend not customizing system topics until you're comfortable creating an end-to-end copilot conversation. If you make changes to a system topic that you want to remove later, you can return to a default state with the **Reset to default** option available in a system topic.

:::image type="content" source="media/authoring-system-topics/reset-system-topic.png" alt-text="Screenshot showing the Reset to default option in a system topic.":::

#### System topic conditions and behaviors

This list describes the available system topics and reveals what triggers them.

##### Conversation Start

- Greets users and introduces the copilot and its capabilities.

- Triggers when a copilot first engages with a user in conversation.

##### Conversational boosting

- Creates generative answers from external data sources.

- Triggers when the copilot can't find a match for the user query.

##### End of Conversation

- Confirms with customers that their query is answered.

- Triggers from a redirection. Call this topic from your custom topics when you're ready to end a conversation.

##### Escalate

- Informs customers if they need to speak with a human.

- Triggers when "talk to agent" is matched or the **Escalate system event** is called. 

  For example, **Question** nodes can be configured to escalate if they don't receive a valid answer from the customer.

> [!NOTE]
> If using Copilot Studio with [hand off to OmniChannel](configuration-hand-off-omnichannel.md) configured, follow the instructions in [Hand off to a live agent](advanced-hand-off.md#configuring-the-escalate-system-topic) to ensure proper hand-off to Dynamics 365 Customer Service.

##### Fallback

- Informs users their query couldn't be matched to a topic and asks them to try again.
- Triggers when the copilot can't match the user's question or message to a topic.

##### Multiple Topics Matched

- Prompts users to choose their intended topic and sets a system variable to identify the topic triggered.
- Triggers when a user's message closely matches multiple topics.

##### On Error

- Informs customers that an error occurred.

  The message includes an error code, the conversation ID, and the error timestamp, which can be used later for debugging. If the conversation is taking place in the Test copilot pane, a detailed error message is included to help the copilot author diagnose the issue. Learn how to [troubleshoot error codes](error-codes.md).

- Triggers when an error occurs during the conversation.

##### Reset Conversation

- Resets the conversation by clearing variable values and forcing the copilot to use the latest published copilot content.

- Triggers with a redirection.

##### Sign in

- Prompts customers to sign in when user authentication is enabled. Learn how to [add user authentication](advanced-end-user-authentication.md).

- Triggers at the beginning of the conversation when users are required to sign in, or when the conversation reaches a node that uses authentication variables.

## [Classic](#tab/classic)

The following diagram provides a visualization of how conversations flow through system topics.

:::image type="content" source="media/authoring-system-topics/system-topics-classic.png" alt-text="Diagram of system topics in a conversation.":::

> [!NOTE]
> Some of these topics are only available for Classic bots.

This table lists all available system topics, their intended purpose, and a small sample of the built-in trigger phrases.

To see all trigger phrases for a system topic, [open the topic to view them in the trigger phrases pane](authoring-create-edit-topics.md).

| System topic | Trigger phrases | Purpose |
| ------------ | --------------- | ------- |
| Greeting     | "hey", "hello", "good morning" | Greet the user when a chat begins. |
| Thank you    | "thank you", "thanks", "ty"    | Acknowledge when the user thanks the bot. |
| Goodbye      | "goodbye", "bye", "have a great day" | End the conversation when the user bids the bot farewell. |
| Start over   | "start over", "restart", "let's begin again" | Start the conversation over and reset all [bot variables](authoring-variables-bot.md). |
| Escalate     | "talk to agent", "escalate", "can I talk to a human" | Escalate to a live agent. To learn more, see [Hand off to a live agent](advanced-hand-off.md). |
| End of Conversation | None | [Redirect](authoring-create-edit-topics.md#redirect-to-another-topic) to this topic at the end of a conversation to give the user a [satisfaction survey](analytics-csat.md). |
| Confirmed Success | None | When the user responds "yes" to the end-of-conversation [satisfaction survey](analytics-csat.md). |
| Confirmed Failure | None | When the user responds "no" to the end-of-conversation [satisfaction survey](analytics-csat.md). |

> [!IMPORTANT]
> If any ofthese system topics are triggered, the conversation ends:
>
> - End of Conversation
> - Confirmed Success
> - Confirmed Failure
> - Goodbye
> - Escalate
> - Start over

---
