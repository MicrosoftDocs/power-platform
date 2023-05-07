---
title: "Use system topics in Power Virtual Agents"
description: "Learn how system topics are used in conversations."
keywords: "PVA"
ms.date: 04/20/2022

ms.topic: article
author: iaanw
ms.author: iawilt
ms.custom: authoring, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
ms.reviewer: ggupta
---

# Use system topics in Power Virtual Agents

[!INCLUDE[public preview disclaimer](includes/public-preview-disclaimer-prod.md)]

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](authoring-system-topics.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/authoring-system-topics-teams.md)

System topics are common topics used in conversations with a bot.

You can't delete or disable system topics, or edit their trigger phrases. However, you can customize the nodes on the authoring canvas. We recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

When you first create a bot, all system topics are configured to trigger at the appropriate times. However, you can manually trigger system topics by [redirecting](authoring-create-edit-topics.md#redirect-to-another-topic) to them.

## System topics

The following diagram provides a visualization of how conversations flow through system topics.

:::image type="content" source="media/authoring-system-topics/system-topics.png" alt-text="Diagram of system topics in a conversation.":::

The table below lists all available system topics, their intended purpose, and a small sample of the built-in trigger phrases.

To see all trigger phrases for a system topic, [open the topic to view them in the trigger phrases pane](authoring-create-edit-topics.md#create-a-topic).

<!-- best viewed without wordwrap -->
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

[!INCLUDE[footer-include](includes/footer-banner.md)]
