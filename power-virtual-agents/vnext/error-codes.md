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

> [!IMPORTANT]
> The term _dialog_ is used in some error messages when it is referring to a _topic_.

<!-- Best viewed and edited without word wrap -->
<!-- FIXME: are telephony errors regarding the hand-off number, or the number provided by the user? -->
| Error                                                                                                                                                                                                                      | Resolution                                                                                                                             |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------- |
| **ActionNotFound**<br>Target DialogAction with Action Id {0} not found for the GotoAction of Action Id {1}.                                                                                                                | The topic you're trying to [redirect][1] to no longer exists. [Create a new topic][4] to redirect to or [remove the redirect node][3]. |
| **ContentError**<br>                                                                                                                                                                                                       | [Check the topic for errors](authoring-topic-management.md#topic-errors).                                                              |
| **DialogNotFound**<br>The Dialog with Id `{0} was not found in the definition. Please check that the Dialog is present and that the Id is correct.                                                                         |                                                                                                                                        |
| **FlowActionException**<br>                                                                                                                                                                                                | [Check the flow for errors](/power-automate/error-checker)                                                                             |
| **FlowActionBadRequest**<br>                                                                                                                                                                                               | Check the variables you are passing to your flow                                                                                       |
| **FlowActionServiceUnavailable**<br>                                                                                                                                                                                       |                                                                                                                                        |
| **InvalidDialogInterruption**<br>Received async response while the dialog is not waiting for an async response. Dialog: {0}, TriggerId: {1}, ActionId: {2}.                                                                | Asynchronous responses from flows are not supported and [must be disabled][5].                                                         |
| **InfiniteLoopInBotContent**<br>Action {0}.{1}.{2} was executed more than {3} times in a row. This indicates a cycle in execution of the dialog and hence dialog execution will be terminated.                             | Make sure the topic ends properly, or links to other topics that end properly, such as the **Escalate** system topic.                  |
| **InvalidContent**<br>                                                                                                                                                                                                     | [Check the topic for errors](authoring-topic-management.md#topic-errors).                                                              |
| **LatestPublishedVersionNotFound**<br>                                                                                                                                                                                     | To use this bot, [publish it in Power Virtual Agents](publication-fundamentals-publish-channels.md).                                   |
| **RedirectToDisabledDialog**<br>The Dialog with Id {0} is disabled in the definition. Please Enable the Dialog before using it.                                                                                            | Your topic is [redirecting][1] to another topic that has been turned off. [Re-enabled the topic][2] or [remove the redirect node][3].  |
| **RedirectToNonExistentDialog**<br>The Dialog with Id {0} was not found in the definition. Please check that the Dialog is present and that the Id is correct.                                                             | The topic you're trying to [redirect][1] to no longer exists. [Create a new topic][4] to redirect to or [remove the redirect node][3]. |
| **SystemError**<br>                                                                                                                                                                                                        | A system error occurred. Contact support for more details.                                                                             |
| **TelephonyHandoffInvalidPhoneNumber**<br>The phone number '{0}' used in the transfer to agent activity is not a valid phone number format. Phone number should be in international format without dashes ex: +14251231234 | The phone number provided to telephony is not valid. Check your [telephony configuration][6].                                          |
| **TelephonyHandoffMissingPhoneNumber**<br>The transfer to agent activity failed as the 'TargetPhoneNumber' property is missing from the context.                                                                           |                                                                                                                                        |

[1]: authoring-create-edit-topics.md#go-to-another-topic
[2]: authoring-topic-management.md#topic-status
[3]: authoring-create-edit-topics.md#delete-nodes
[4]: authoring-create-edit-topics.md#create-a-topic
[5]: advanced-flow.md#disable-asynchronous-responses-from-flows
[6]: publication-connect-bot-to-telephony.md
