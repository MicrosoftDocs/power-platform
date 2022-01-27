---
title: "Error Codes in Microsoft Teams"
description: "Troubleshoot error code responses from your bot in Microsoft Teams."
author: v-alarioza
ms.author: v-alarioza
ms.topic: troubleshooting
ms.date: 12/06/2021
ms.service: power-virtual-agents
ms.reviewer: clmori
manager: shellyha
#Customer intent: As a bot maker, I want learn about error codes so that I can resolve issues with my bots.
---
# Error codes: Power Virtual Agents in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../error-codes.md)
> - [Power Virtual Agents app in Microsoft Teams](error-codes-teams.md)

When your bot encounters a problem, it will respond with an error message from the table below. 

Your users will see a more generic message but will still be provided with an error code. For example, "Sorry, the bot can't talk for a while. It’s something your admin needs to address. Error code:{ErrorCode}. Conversation ID: {Conversation ID}. Time (UTC): {time}."

Errors may also appear in the [Topic Checker](authoring-topic-management-teams.md#topic-errors) where you can easily locate and fix them.

> [!NOTE]
> The following errors can only occur in Microsoft Teams. To view the full list of errors that can appear in both the web app and Teams, please refer [the web app version of this topic](../error-codes.md).

## Error List

<!-- Best viewed and edited without word wrap -->
| Error    | Bot response                                                                                                                                              | Resolution                                                                                                                                                                                                                                                                             |
| -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **2100** | "The user is typing too fast."                                                                                                                            | Interactions with the bot are rate limited to mitigate spam. Try again while typing slower.                                                                                                                                                                                            |
| **2101** | "The user’s conversation with the bot was too long or the user’s message was too long."                                                                   | Try restarting the conversation with the bot or using a shorter message.                                                                                                                                                                                                               |
| **2102** | "The user sent a message which is too large to process."                                                                                                  | You sent a message that is too large to process. Shorten your message then try again.                                                                                                                                                                                                  |