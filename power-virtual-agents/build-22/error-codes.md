---
title: "Troubleshoot error codes"
description: "Troubleshoot error responses from your bot."
author: v-alarioza
ms.author: v-alarioza
ms.topic: troubleshooting
ms.date: 03/07/2022

ms.reviewer: clmori
manager: shellyha
#Customer intent: As a bot maker, I want learn about error codes so that I can resolve issues with my bots.
---
# Troubleshoot error codes

When a bot encounters a problem during a conversation, it will send an error response.

If you're a bot user, the response will contain an **error code** for the specific problem that was encountered which should be given to your administrator.

:::image type="content" source="media/error-codes/c2-error.png" alt-text="Bot error message displayed to users.":::

If you're a bot maker testing the bot in the [Test bot pane](authoring-test-bot.md), in addition to the error code, you'll also see an **error message** that gives more context about the problem.

:::image type="content" source="media/error-codes/c1-error.png" alt-text="Bot error message displayed to bot makers.":::

Errors may also appear in the [Topic Checker](authoring-topic-management.md#topic-errors) where you can easily locate and fix them.

## Error list

> [!IMPORTANT]
> The term _dialog_ is used in some error messages when it is referring to a _topic_.

<!-- table best viewed and edited without word wrap -->
| Error code                                                                | Description                                                      |
| ------------------------------------------------------------------------- | ---------------------------------------------------------------- |
| [ContentError](#contenterror)                                             | There is an error in the topic content.                          |
| [FlowActionException](#flowactionexception)                               | An error occurred while executing a [flow][2].                   |
| [FlowActionBadRequest](#flowactionbadrequest)                             | A request made to a [flow][2] was malformed.                     |
| [InvalidContent](#invalidcontent)                                         | Invalid content was added to the [code editor][5].               |
| [InfiniteLoopInBotContent](#infiniteloopinbotcontent)                     | A node was executed too many times.                              |
| [LatestPublishedVersionNotFound](#latestpublishedversionnotfound)         | Unable to retrieve the published version of the bot.             |
| [RedirectToDisabledDialog](#redirecttodisableddialog)                     | A topic is [redirecting][1] to a disabled topic.                 |
| [RedirectToNonExistentDialog](#redirecttononexistentdialog)               | A topic is [redirecting][1] to another topic that longer exists. |
| [SystemError](#systemerror)                                               | A system error occurred in Power Virtual Agents.                 |
| [TelephonyHandoffInvalidPhoneNumber](#telephonyhandoffinvalidphonenumber) | The phone number provided to [telephony][4] is not valid.        |
| [TelephonyHandoffMissingPhoneNumber](#telephonyhandoffmissingphonenumber) | A phone number has not been set for [telephony][4].              |

[1]: authoring-create-edit-topics.md#go-to-another-topic
[2]: advanced-flow.md
[3]: authoring-create-edit-topics.md#edit-topics-with-the-code-editor
[4]: publication-connect-bot-to-telephony.md
[5]: authoring-create-edit-topics.md#edit-topics-with-the-code-editor

### ContentError

**Error message:** This error produces dynamic messages based on the context of the error.

**Resolution:** This is a catch-all error for a variety of problems related to your bot's content. Please refer to the error message for more details.

Common problems include, but are not limited to:

- A node missing required properties.
- Invalid YAML added with the [code editor](authoring-create-edit-topics.md#edit-topics-with-the-code-editor).
- An error in a [Power Fx formula](advanced-power-fx.md).

### FlowActionException

**Error messages:**

- "No output was received from flow {FlowName} ({FlowId}), even though output was expected as per the bot definition."
- "The output parameter with name {ItemKey} on flow {FlowName} ({FlowId}) is missing from the response data. Please refresh the flow, or ensure the flow returns this value."
- "The output parameter with name {ItemKey} on flow {FlowName} ({FlowId}) is missing from the output schema. Please refresh the flow."

**Resolution:** [Check the flow for errors](/power-automate/error-checker).

### FlowActionBadRequest

**Error messages:**

- "The parameter with name {KeyName} on flow {FlowName} ({FlowId}) is declared to be of type {ItemTypeKind}. This type is not supported when invoking Power Automate. Currently, only Text, Boolean and Numbers are supported."
- "The parameter with name {ItemKey} on flow {FlowName} ({FlowId}) is missing in the 'Call Flow' action."
- "The parameter with name {KeyName} on flow {FlowName} ({FlowId}) evaluated to type {ResolveType}, expected type {ExpectedType}."
- "The flow {FlowName} ({FlowId}) failed to run with response code {ResponseCode}, error code: {FlowErrorCode}."

**Resolution:** Check that the [base type](authoring-variables.md#variable-types) of any variables you are passing to the flow [match the parameter type](authoring-variables.md#use-variables-in-action-nodes).

### InvalidContent

**Error message:** "A total of {TotalComponents} component(s) exist in the bot, but none are valid."

**Resolution:** [Open the code editor](authoring-create-edit-topics.md#edit-topics-with-the-code-editor) to review issues with the content.

### InfiniteLoopInBotContent

**Error message:** "Action {DialogId}.{TriggerId}.{ActionId} was executed more than {MaxTurnCount} times in a row. This indicates a cycle in execution of the dialog and hence dialog execution will be terminated."

**Resolution:** Make sure the topic ends properly, and links to other topics that end properly, such as the **Escalate** system topic.

### LatestPublishedVersionNotFound

**Error message:** "Unable to retrieve the latest published version of the bot."

**Resolution:** To use this bot, [publish it in Power Virtual Agents](publication-fundamentals-publish-channels.md).  

### RedirectToDisabledDialog

**Error message:** "The Dialog with Id {DialogId} is disabled in the definition. Please Enable the Dialog before using it."

**Resolution:** [Re-enabled the topic](authoring-topic-management.md#topic-status) or [remove the redirect node](authoring-create-edit-topics.md#delete-nodes).  

### RedirectToNonExistentDialog

**Error message:** "The Dialog with Id {DialogId} was not found in the definition. Please check that the Dialog is present and that the Id is correct."

**Resolution:** [Create a new topic](authoring-create-edit-topics.md#create-a-topic) to redirect to or [remove the redirect node](authoring-create-edit-topics.md#delete-nodes).

### SystemError
**Error message:** This error doesn't produce an error message

**Resolution:** Contact customer the support for more details.

### TelephonyHandoffInvalidPhoneNumber

**Error message:** "The phone number {PhoneNumber} used in the transfer to agent activity is not a valid phone number format. Phone number should be in international format without dashes ex: +14251231234."

**Resolution:** Check your [telephony configuration](publication-connect-bot-to-telephony.md) and ensure the phone number is in an international format. For example, `+14251231234`.

### TelephonyHandoffMissingPhoneNumber

**Error message:** "The transfer to agent activity failed as the 'TargetPhoneNumber' property is missing from the context."

**Resolution:** Go to your [telephony configuration](publication-connect-bot-to-telephony.md) and add a phone number.
