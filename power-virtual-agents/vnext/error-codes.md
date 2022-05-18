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

## Error list

> [!IMPORTANT]
> The term _dialog_ is used in some error messages when it is referring to a _topic_.

<!-- FIXME: add other messages when found -->
<!-- table best viewed and edited without wordwrap -->
| Error                                                                     | Bot Message                                                                                                                                                                      |
| ------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [ContentError](#contenterror)                                             |                                                                                                                                                                                  |
| [DialogNotFound](#dialognotfound)                                         | The Dialog with Id `{0} was not found in the definition. Please check that the Dialog is present and that the Id is correct.                                                     |
| [FlowActionException](#flowactionexception)                               |                                                                                                                                                                                  |
| [FlowActionBadRequest](#flowactionbadrequest)                             |                                                                                                                                                                                  |
| [FlowActionServiceUnavailable](#flowactionserviceunavailable)             |                                                                                                                                                                                  |
| [InvalidDialogInterruption](#invaliddialoginterruption)                   | Received async response while the dialog is not waiting for an async response. Dialog: {0}, TriggerId: {1}, ActionId: {2}.                                                       |
| [InfiniteLoopInBotContent](#infiniteloopinbotcontent)                     | Action {0}.{1}.{2} was executed more than {3} times in a row. This indicates a cycle in execution of the dialog and hence dialog execution will be terminated.                   |
| [InvalidContent](#invalidcontent)                                         |                                                                                                                                                                                  |
| [LatestPublishedVersionNotFound](#latestpublishedversionnotfound)         |                                                                                                                                                                                  |
| [RedirectToDisabledDialog](#redirecttodisableddialog)                     | The Dialog with Id {0} is disabled in the definition. Please Enable the Dialog before using it.                                                                                  |
| [RedirectToNonExistentDialog](#redirecttononexistentdialog)               | The Dialog with Id {0} was not found in the definition. Please check that the Dialog is present and that the Id is correct.                                                      |
| [SystemError](#systemerror)                                               |                                                                                                                                                                                  |
| [TelephonyHandoffInvalidPhoneNumber](#telephonyhandoffinvalidphonenumber) | The phone number '{0}' used in the transfer to agent activity is not a valid phone number format. Phone number should be in international format without dashes ex: +14251231234 |
| [TelephonyHandoffMissingPhoneNumber](#telephonyhandoffmissingphonenumber) | The transfer to agent activity failed as the 'TargetPhoneNumber' property is missing from the context.                                                                           |

### ContentError

There is an error in the topic content. Check that your [Power Fx formulas](advanced-power-fx.md) evaluate to a valid result.

### DialogNotFound

The topic you're trying to [redirect](authoring-create-edit-topics.md#go-to-another-topic) to no longer exists. [Create a new topic](authoring-create-edit-topics.md#create-a-topic) to redirect to or [remove the redirect node](authoring-create-edit-topics.md#delete-nodes).

### FlowActionException

[Check the flow for errors](/power-automate/error-checker).

### FlowActionBadRequest

Check that the [base type](authoring-variables.md#variable-types) of any variables you are passing to the flow [match the parameter type](authoring-variables.md#use-variables-in-action-nodes).

### FlowActionServiceUnavailable

Power Automate is not responding, try again later. If the issue persists, contact customer support.

### InvalidDialogInterruption

Asynchronous responses from flows are not supported and [must be disabled](advanced-flow.md#disable-asynchronous-responses-from-flows).

### InfiniteLoopInBotContent

Make sure the topic ends properly, or links to other topics that end properly, such as the **Escalate** system topic.

### InvalidContent

Invalid YAML has been added with the code editor. [Open the code editor](authoring-create-edit-topics.md#edit-topics-with-the-code-editor) to review issues with the content.

### LatestPublishedVersionNotFound

To use this bot, [publish it in Power Virtual Agents](publication-fundamentals-publish-channels.md).  

### RedirectToDisabledDialog

Your topic is [redirecting](authoring-create-edit-topics.md#go-to-another-topic) to another topic that has been turned off. [Re-enabled the topic](authoring-topic-management.md#topic-status) or [remove the redirect node](authoring-create-edit-topics.md#delete-nodes).  

### RedirectToNonExistentDialog

The topic you're trying to [redirect](authoring-create-edit-topics.md#go-to-another-topic) to no longer exists. [Create a new topic](authoring-create-edit-topics.md#create-a-topic) to redirect to or [remove the redirect node](authoring-create-edit-topics.md#delete-nodes).

### SystemError

A system error occurred. Contact customer support for more details.  

### TelephonyHandoffInvalidPhoneNumber

<!-- FIXME: are telephony errors regarding the hand-off number, or the number provided by the user? -->
The phone number provided to telephony is not valid. Check your [telephony configuration](publication-connect-bot-to-telephony.md).

### TelephonyHandoffMissingPhoneNumber

FIXME: resolution steps here
