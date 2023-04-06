---
title: Troubleshoot error codes (preview)
description: Troubleshoot error responses from your bot in Power Virtual Agents preview.
ms.date: 12/07/2022

ms.topic: troubleshooting
author: iaanw
ms.author: iawilt
ms.reviewer: mvakoc
ms.service: power-virtual-agents
ms.custom: bap-template

#Customer intent: As a bot maker, I want learn about error codes so that I can resolve issues with my bots.
---

# Troubleshoot error codes (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

When a bot encounters a problem during a conversation, it sends an error response.

If you're a bot user, the response contains an error code that identifies the problem. You should give this error code to your administrator.

:::image type="content" source="media/error-codes/c2-error.png" alt-text="Screenshot of a bot error message displayed to users.":::

If you're a bot maker testing the bot in the [Test bot pane](authoring-test-bot.md), the bot's response includes the error code and an error message that gives more context about the problem.

:::image type="content" source="media/error-codes/c1-error.png" alt-text="Screenshot of a bot error message displayed to bot makers.":::

Errors may also appear in the [Topic Checker](authoring-topic-status.md#topic-errors), where you can easily locate and fix them.

## Error list

> [!IMPORTANT]
> The term _dialog_ is used in some error messages when referring to a _topic_.

<!-- table best viewed and edited without word wrap -->

| Error code                                                        | Description                                                         |
| ----------------------------------------------------------------- | ------------------------------------------------------------------- |
| [ContentError](#contenterror)                                     | There's an error in the topic content.                              |
| [DataLossPreventionViolation](#datalosspreventionviolation)       | There was a data loss prevention violation.                         |
| [FlowActionException](#flowactionexception)                       | An error occurred while executing a [flow][2].                      |
| [FlowActionBadRequest](#flowactionbadrequest)                     | A request made to a [flow][2] was malformed.                        |
| [InvalidContent](#invalidcontent)                                 | Invalid content was added to the code editor.                       |
| [InfiniteLoopInBotContent](#infiniteloopinbotcontent)             | A node was executed too many times.                                 |
| [LatestPublishedVersionNotFound](#latestpublishedversionnotfound) | Unable to retrieve the published version of the bot.                |
| [RedirectToDisabledDialog](#redirecttodisableddialog)             | A topic is [redirecting][1] to a disabled topic.                    |
| [RedirectToNonExistentDialog](#redirecttononexistentdialog)       | A topic is [redirecting][1] to another topic that no longer exists. |
| [SystemError](#systemerror)                                       | A system error occurred in Power Virtual Agents.                    |

[1]: authoring-topic-management.md#redirect-to-another-topic
[2]: advanced-flow.md

### ContentError

**Error message:** This error produces dynamic messages based on the context of the error.

**Resolution:** This is a catch-all error for problems related to your bot's content. Refer to the error message for more details.

Common problems include:

- A node is missing required properties.
- Invalid YAML was added with the [code editor](authoring-create-edit-topics.md).
- A [Power Fx formula](advanced-power-fx.md) contains an error.

### DataLossPreventionViolation

<!-- NOTE: this error message is wrong, as the UI has been changed from "Manage" to "Settings". Keeping it for now since it's what the product shows users. -->
**Error message:** "This environment requires users to sign in before they can use the bot. Go to Manage > Security > Authentication and select the option to require users to sign in."

**Resolution:**

- Your environment's data loss prevention (DLP) policies require that users sign in. See [Configure user authentication](advanced-user-authentication.md#add-user-authentication-with-the-signin-system-topic).
- One or more connectors that are used in the bot aren't in the same data group. See [Power Virtual Agents connectors](../admin-data-loss-prevention.md#power-virtual-agents-connectors).
- One or more connectors that are used in the bot are blocked by the tenant administrator.

### FlowActionException

**Error messages:**

- "No output was received from flow {FlowName} ({FlowId}), even though output was expected as per the bot definition."
- "The output parameter with name {ItemKey} on flow {FlowName} ({FlowId}) is missing from the response data. Refresh the flow, or ensure the flow returns this value."
- "The output parameter with name {ItemKey} on flow {FlowName} ({FlowId}) is missing from the output schema. Please refresh the flow."

**Resolution:** [Check the flow for errors](/power-automate/error-checker).

### FlowActionBadRequest

**Error messages:**

- "The parameter with name {KeyName} on flow {FlowName} ({FlowId}) is declared to be of type {ItemTypeKind}. This type is not supported when invoking Power Automate. Currently, only Text, Boolean and Numbers are supported."
- "The parameter with name {ItemKey} on flow {FlowName} ({FlowId}) is missing in the 'Call Flow' action."
- "The parameter with name {KeyName} on flow {FlowName} ({FlowId}) evaluated to type {ResolveType}, expected type {ExpectedType}."
- "The flow {FlowName} ({FlowId}) failed to run with response code {ResponseCode}, error code: {FlowErrorCode}."

**Resolution:** Check that the [base type](authoring-variables.md#variable-types) of any variables you pass to the flow match the parameter's type.

### InvalidContent

**Error message:** "A total of {TotalComponents} component(s) exist in the bot, but none are valid."

**Resolution:** [Open the code editor](authoring-create-edit-topics.md) to review issues with the content.

### InfiniteLoopInBotContent

**Error message:** "Action {DialogId}.{TriggerId}.{ActionId} was executed more than {MaxTurnCount} times in a row. This indicates a cycle in execution of the dialog and hence dialog execution will be terminated."

**Resolution:** Make sure the topic ends properly and links to other topics that end properly, such as the **Escalate** system topic.

### LatestPublishedVersionNotFound

**Error message:** "Unable to retrieve the latest published version of the bot."

**Resolution:** [Publish the bot](publication-fundamentals-publish-channels.md).  

### RedirectToDisabledDialog

**Error message:** "The Dialog with Id {DialogId} is disabled in the definition. Please enable the Dialog before using it."

**Resolution:** [Re-enable the topic](authoring-topic-status.md#topic-status) or [remove the redirect node](authoring-create-edit-topics.md#delete-a-node).  

### RedirectToNonExistentDialog

**Error message:** "The Dialog with Id {DialogId} was not found in the definition. Please check that the Dialog is present and that the Id is correct."

**Resolution:** [Create a new topic](authoring-create-edit-topics.md#create-a-topic) to redirect to or [remove the redirect node](authoring-create-edit-topics.md#delete-a-node).

### SystemError

**Error message:** This error doesn't produce an error message

**Resolution:** [Contact customer support](../fundamentals-support.md) for more details.
