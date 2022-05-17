---
title: "Error Codes"
description: "Troubleshoot error code responses from your bot."
author: v-alarioza
ms.author: v-alarioza
ms.topic: troubleshooting
ms.date: 03/07/2022

ms.reviewer: clmori
manager: shellyha
#Customer intent: As a bot maker, I want learn about error codes so that I can resolve issues with my bots.
---
# Error codes: Power Virtual Agents

When a bot encounters a problem during a conversation, it will respond with an error message.

If you're a bot user, the error message will contain an error code for the specific problem that was encountered.

:::image type="content" source="media/error-codes/c2-error.png" alt-text="Bot error message displayed to users.":::

If you're a bot maker testing the bot in the [Test bot pane](authoring-test-bot.md), you'll see an additional message that gives more context about the problem.

:::image type="content" source="media/error-codes/c1-error.png" alt-text="Bot error message displayed to bot makers.":::

Errors may also appear in the [Topic Checker](authoring-topic-management.md#topic-errors) where you can easily locate and fix them.

## Error List

<!-- Best viewed and edited without word wrap -->
| Error                              | Bot response | Resolution |
| ---------------------------------- | ------------ | ---------- |
| InfiniteLoopInBotContent           |              |            |
| InvalidContent                     |              |            |
| LatestPublishedVersionNotFound     |              |            |
| RedirectToDisabledDialog           |              |            |
| RedirectToNonExistentDialog        |              |            |
| TelephonyHandoffInvalidPhoneNumber |              |            |
| TelephonyHandoffMissingPhoneNumber |              |            |
| ContentError                       |              |            |
| DialogNotFound                     |              |            |
| ActionNotFound                     |              |            |
| InvalidDialogInterruption          |              |            |
| SystemError                        |              |            |
| FlowActionException                |              |            |
| FlowActionBadRequest               |              |            |
| FlowActionServiceUnavailable       |              |            |
