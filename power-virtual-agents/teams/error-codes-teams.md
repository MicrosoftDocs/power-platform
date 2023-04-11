---
title: "Error Codes in Microsoft Teams"
description: "Troubleshoot error code responses from your bot in Microsoft Teams."
ms.date: 02/07/2022
keywords: "PVA, Teams"
ms.topic: troubleshooting
author: iaanw
ms.author: iawilt
ms.reviewer: clmori
ms.service: power-virtual-agents

#Customer intent: As a bot maker, I want learn about error codes so that I can resolve issues with my bots.
---

# Error codes: Power Virtual Agents in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](../error-codes.md)
> - [Power Virtual Agents app in Microsoft Teams](error-codes-teams.md)

When a bot encounters a problem during a conversation, it will respond with an error message.

If you're a bot user, the error message will contain an error code for the specific problem that was encountered.

:::image type="content" source="../media/error-codes/c2-error.png" alt-text="Bot error message displayed to users.":::

If you're a bot maker testing the bot in the [Test bot pane](authoring-test-bot-teams.md), you'll see an additional message that gives more context about the problem.

:::image type="content" source="../media/error-codes/c1-error.png" alt-text="Bot error message displayed to bot makers.":::

Errors may also appear in the [Topic Checker](authoring-topic-management-teams.md#topic-errors) where you can easily locate and fix them.

> [!NOTE]
> The following errors can only occur in Microsoft Teams. To view the full list of errors that can appear in both the web app and Teams, please refer to [the web app version of this topic](../error-codes.md).

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents-teams.md).

## Error List

<!-- Best viewed and edited without word wrap -->
| Error    | Bot response                   | Resolution                                                                                  |
| -------- | ------------------------------ | ------------------------------------------------------------------------------------------- |
| **2100** | "The user is typing too fast." | Interactions with the bot are rate limited to mitigate spam. Try again while typing slower. |
