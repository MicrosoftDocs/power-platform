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

> [!IMPORTANT]
> The term _dialog_ is used in some error messages when it is referring to a _topic_.

<!-- FIXME: are telephony errors regarding the hand-off number, or the number provided by the user? -->

## ActionNotFound

_Target DialogAction with Action Id {0} not found for the GotoAction of Action Id {1}._

The topic you're trying to [redirect](authoring-create-edit-topics.md#go-to-another-topic) to no longer exists. [Create a new topic](authoring-create-edit-topics.md#create-a-topic) to redirect to or [remove the redirect node](authoring-create-edit-topics.md#delete-nodes).

## ContentError

<!-- FIXME -->
_Message here._

[Check the topic for errors](authoring-topic-management.md#topic-errors).  

## DialogNotFound

_The Dialog with Id {0} was not found in the definition. Please check that the Dialog is present and that the Id is correct._

<!-- FIXME -->
Resolution steps here.

## FlowActionException

<!-- FIXME -->
_Message here._

[Check the flow for errors](/power-automate/error-checker)  

## FlowActionBadRequest

<!-- FIXME -->
_Message here._

Check the variables you are passing to your flow

## FlowActionServiceUnavailable

<!-- FIXME -->
_Message here._

<!-- FIXME -->
Resolution steps here.

## InvalidDialogInterruption

_Received async response while the dialog is not waiting for an async response. Dialog: {0}, TriggerId: {1}, ActionId: {2}._

Asynchronous responses from flows are not supported and [must be disabled](advanced-flow.md#disable-asynchronous-responses-from-flows).

## InfiniteLoopInBotContent

_Action {0}.{1}.{2} was executed more than {3} times in a row. This indicates a cycle in execution of the dialog and hence dialog execution will be terminated._

Make sure the topic ends properly, or links to other topics that end properly, such as the **Escalate** system topic.

## InvalidContent

<!-- FIXME -->
_Message here._

[Check the topic for errors](authoring-topic-management.md#topic-errors).  

## LatestPublishedVersionNotFound

<!-- FIXME -->
_Message here._

To use this bot, [publish it in Power Virtual Agents](publication-fundamentals-publish-channels.md).  

## RedirectToDisabledDialog

_The Dialog with Id {0} is disabled in the definition. Please Enable the Dialog before using it._

Your topic is [redirecting](authoring-create-edit-topics.md#go-to-another-topic) to another topic that has been turned off. [Re-enabled the topic](authoring-topic-management.md#topic-status) or [remove the redirect node](authoring-create-edit-topics.md#delete-nodes).  

## RedirectToNonExistentDialog

_The Dialog with Id {0} was not found in the definition. Please check that the Dialog is present and that the Id is correct._

The topic you're trying to [redirect](authoring-create-edit-topics.md#go-to-another-topic) to no longer exists. [Create a new topic](authoring-create-edit-topics.md#create-a-topic) to redirect to or [remove the redirect node](authoring-create-edit-topics.md#delete-nodes).

## SystemError

<!-- FIXME -->
_Message here._

A system error occurred. Contact support for more details.  

## TelephonyHandoffInvalidPhoneNumber

_The phone number '{0}' used in the transfer to agent activity is not a valid phone number format. Phone number should be in international format without dashes ex: +14251231234._

The phone number provided to telephony is not valid. Check your [telephony configuration](publication-connect-bot-to-telephony.md].

## TelephonyHandoffMissingPhoneNumber

_The transfer to agent activity failed as the 'TargetPhoneNumber' property is missing from the context._

<!-- FIXME -->
Resolution steps here.
