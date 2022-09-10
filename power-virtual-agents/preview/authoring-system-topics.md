---
title: "Use system topics in Power Virtual Agents"
description: "Learn how system topics are used in conversations."
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

# Use system topics in Power Virtual Agents

System topics are built-in topics, that help your bot respond to common system events, such as escalation, or carry out essential behaviour for your bot, such as ending a conversation. You can't delete system topics but, they can be disabled.

When you first create a bot, all system topics are configured to trigger at the appropriate times, in response to related events. However, you can manually trigger system topics by [redirecting](/authoring-create-edit-topics.md#redirect-to-another-topic) to them. Some also have trigger phrases, just like customer topics and, where they do, you can also customize these to fit your bot's needs. 

> [!TIP]
> You can edit the content and nodes within system topics, wowever, we recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

## System topics

The table below lists the system topics included with a bot, their intended purpose, and details of when they will be fired.

<!-- best viewed without wordwrap -->
| System topic        | Triggered when                                      | Default behavior                                                                                                                                                                        |
| ------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Conversation Starts | When a bot first engages with a user in conversation | Provide an initial greeting to the user, introducing the bot and it's capabilities.                                                                                                                                              |
| End of Conversation            | When manually redirected to. You should call this topic from your custom topics when you're ready to end a conversation. | Confirms with the customer if their query has been answered. If, no, prompts to try again. If yes, presents the user with a satisfaction survey and ends the conversation.                                                                                                                                               |
| Escalate            | When a trigger phrase is matched (such as "talk to agent") OR when the Escalate system event is fired, such as when a [Question node](authoring-ask-question.md#additional-question-behavior) is configured to escalate if it does not recieve a valid answer from a customer. | Send a message to the customer with infromation of how they can speak to a real person.                                                                                                                                              |
| Fallback            | When the bot cannot match the user's message to an intent / topic                       | Informs the user that their query could not be matched to a topic and asks them to try again.                                                                                                                                               |
| Multiple Topics Matched            | When a user's message closely matches multiple intents / topics | Prompts the user to choose their intended topic and sets a system variable to determine which topic is ultimately triggered.                                                                                                                                              |
| Reset Conversation            | When manually redirected to.                       | When this topic is called, it resets the conversation, by clearing variable values and forcing the bot to use the latest published bot content.                                                                                                                                              |
| On Error            | When an error occurs during the conversation                       | Sends a message to inform the user that an error has occurred, including an error code, conversation Id and error time, which can be used later for debugging. If the bot is being used within the test canvas, a more detailed error message is also included, to help the bot author diagnose the issue.                                                                                                                                              |

[!INCLUDE[footer-include](includes/footer-banner.md)]
