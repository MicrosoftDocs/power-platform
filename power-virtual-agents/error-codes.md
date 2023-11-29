---
title: "Error Codes"
description: "Troubleshoot error code responses from your bot."
ms.date: 03/24/2023

ms.topic: troubleshooting
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: clmori
ms.service: power-virtual-agents
---

# Error codes: Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

When a bot encounters a problem during a conversation, it will respond with an error message.

If you're a bot user, the error message will contain an error code for the specific problem that was encountered.

:::image type="content" source="media/error-codes/c2-error.png" alt-text="Bot error message displayed to users.":::

If you're a bot maker testing the bot in the [Test bot pane](authoring-test-bot.md), you'll see an additional message that gives more context about the problem.

:::image type="content" source="media/error-codes/c1-error.png" alt-text="Bot error message displayed to bot makers.":::

Errors may also appear in the [Topic Checker](authoring-topic-management.md#topic-errors) where you can easily locate and fix them.

> [!NOTE]
> The following errors can occur in both the web app and Microsoft Teams. To view errors that are exclusive to Teams, please refer to [the Teams version of this topic](error-codes.md).

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


# [Web app](#tab/webApp)

When a bot encounters a problem during a conversation, it sends an error response.

If you're a bot user, the response contains an error code that identifies the problem. You should give this error code to your administrator.

:::image type="content" source="media/error-codes/c2-error.png" alt-text="Screenshot of a bot error message displayed to users.":::

If you're a bot maker testing the bot in the [Test bot pane](authoring-test-bot.md), the bot's response includes the error code and an error message that gives more context about the problem.

:::image type="content" source="media/error-codes/c1-error.png" alt-text="Screenshot of a bot error message displayed to bot makers.":::

Errors may also appear in the [Topic Checker](authoring-topic-management.md), where you can easily locate and fix them.

### Error list

> [!IMPORTANT]
> The term _dialog_ is used in some error messages when referring to a _topic_.


| Error code                                                        | Description                                                         |
| ----------------------------------------------------------------- | ------------------------------------------------------------------- |
| [ContentError](#contenterror)                                     | There's an error in the topic content.                              |
| [DataLossPreventionViolation](#datalosspreventionviolation)       | There was a data loss prevention violation.                         |
| [FlowActionException](#flowactionexception)                       | An error occurred while executing a [cloud flow][2].                |
| [FlowActionBadRequest](#flowactionbadrequest)                     | A request made to a [cloud flow][2] was malformed.                  |
| [FlowActionTimedOut](#flowactiontimedout)                         | A [cloud flow][2] took more than 100 seconds to run and timed out.    |
| [InvalidContent](#invalidcontent)                                 | Invalid content was added to the code editor.                       |
| [InfiniteLoopInBotContent](#infiniteloopinbotcontent)             | A node was executed too many times.                                 |
| [LatestPublishedVersionNotFound](#latestpublishedversionnotfound) | Unable to retrieve the published version of the bot.                |
| [RedirectToDisabledDialog](#redirecttodisableddialog)             | A topic is [redirecting][1] to a disabled topic.                    |
| [RedirectToNonExistentDialog](#redirecttononexistentdialog)       | A topic is [redirecting][1] to another topic that no longer exists. |
| [SystemError](#systemerror)                                       | A system error occurred in Microsoft Copilot Studio.                    |

[1]: authoring-topic-management.md#redirect-to-another-topic
[2]: advanced-flow.md

#### ContentError

**Error message:** This error produces dynamic messages based on the context of the error.

**Resolution:** This is a catch-all error for problems related to your bot's content. Refer to the error message for more details.

Common problems include:

- A node is missing required properties.
- Invalid YAML was added with the [code editor](authoring-create-edit-topics.md).
- A [Power Fx formula](advanced-power-fx.md) contains an error.

#### DataLossPreventionViolation

**Error message:** "This environment requires users to sign in before they can use the bot. Go to Manage > Security > Authentication and select the option to require users to sign in."

**Resolution:**

- Your environment's data loss prevention (DLP) policies require that users sign in. See [Configure user authentication](advanced-end-user-authentication.md#add-user-authentication-with-the-signin-system-topic).
- One or more connectors that are used in the bot aren't in the same data group. See [Microsoft Copilot Studio connectors](admin-data-loss-prevention.md#microsoft-copilot-studio-connectors).
- One or more connectors that are used in the bot are blocked by the tenant administrator.

#### FlowActionException

**Error messages:**

- "No output was received from flow {FlowName} ({FlowId}), even though output was expected as per the bot definition."
- "The output parameter with name {ItemKey} on flow {FlowName} ({FlowId}) is missing from the response data. Refresh the flow, or ensure the flow returns this value."
- "The output parameter with name {ItemKey} on flow {FlowName} ({FlowId}) is missing from the output schema. Please refresh the flow."

**Resolution:** [Check the flow for errors](/power-automate/error-checker).

#### FlowActionBadRequest

**Error messages:**

- "The parameter with name {KeyName} on flow {FlowName} ({FlowId}) is declared to be of type {ItemTypeKind}. This type is not supported when invoking Power Automate. Currently, only Text, Boolean and Numbers are supported."
- "The parameter with name {ItemKey} on flow {FlowName} ({FlowId}) is missing in the 'Call Flow' action."
- "The parameter with name {KeyName} on flow {FlowName} ({FlowId}) evaluated to type {ResolveType}, expected type {ExpectedType}."
- "The flow {FlowName} ({FlowId}) failed to run with response code {ResponseCode}, error code: {FlowErrorCode}."

**Resolution:** Check that the [base type](authoring-variables.md#variable-types) of any variables you pass to the flow match the parameter's type.

#### FlowActionTimedOut

**Error message:** "The flow with id {FlowId} has timed out . Error Code: {FlowErrorCode}"

**Resolution:** [Check the flow for errors](/power-automate/error-checker) to understand why the cloud flow took more than 100 seconds to run before it returned to Microsoft Copilot Studio. Try to optimize the query and the data you return from any other backend system. If some of the cloud flow logic can continue to run after a result is sent to the bot, place these actions after the 'Return value(s) to Microsoft Copilot Studio' step in your cloud flow.

#### InvalidContent

**Error message:** "A total of {TotalComponents} component(s) exist in the bot, but none are valid."

**Resolution:** [Open the code editor](authoring-create-edit-topics.md) to review issues with the content.

#### InfiniteLoopInBotContent

**Error message:** "Action {DialogId}.{TriggerId}.{ActionId} was executed more than {MaxTurnCount} times in a row. This indicates a cycle in execution of the dialog and hence dialog execution will be terminated."

**Resolution:** Make sure the topic ends properly and links to other topics that end properly, such as the **Escalate** system topic.

#### LatestPublishedVersionNotFound

**Error message:** "Unable to retrieve the latest published version of the bot."

**Resolution:** [Publish the bot](publication-fundamentals-publish-channels.md).  

#### RedirectToDisabledDialog

**Error message:** "The Dialog with Id {DialogId} is disabled in the definition. Please enable the Dialog before using it."

**Resolution:** [Re-enable the topic](authoring-topic-management.md) or [remove the redirect node](authoring-create-edit-topics.md#delete-a-node).  

#### RedirectToNonExistentDialog

**Error message:** "The Dialog with Id {DialogId} was not found in the definition. Please check that the Dialog is present and that the Id is correct."

**Resolution:** [Create a new topic](authoring-create-edit-topics.md#create-a-topic) to redirect to or [remove the redirect node](authoring-create-edit-topics.md#delete-a-node).

#### SystemError

**Error message:** This error doesn't produce an error message

**Resolution:** [Contact customer support](fundamentals-support.md) for more details.


# [Classic](#tab/classic)

### Error List

| Error    | Bot response                                                                                                                                                          | Resolution                                                                                                                                                                                                                                                                             |
| -------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **2000** | "The user is trapped in an infinite loop. Check to make sure `{Topic Name}` reaches a logical conclusion."                                                            | Make sure the topic ends properly, or links to other topics that end properly, [such as the **Escalate** system topic](advanced-hand-off.md).                                                                                                                                          |
| **2001** | "The bot content is invalid."                                                                                                                                         | [Check the topic for errors](authoring-topic-management.md#topic-errors).                                                                                                                                                                                                              |
| **2002** | "We ran into an issue with CDS."                                                                                                                                      | There was a problem accessing the [Dataverse](/powerapps/maker/data-platform/data-platform-intro). Check your configuration for errors. Otherwise try again later as there may be a service issue.                                                                                     |
| **2003** | "There's a problem with `{Flow Name}` in `{Topic Name}`. Please check your content."                                                                                  | [Check the flow for errors](/power-automate/error-checker) and [look for failed runs in the flow run history](/power-automate/fix-flow-failures#identify-the-error).                                                                                                                   |
| **2004** | "There's a problem with `{Skill Name}` in `{Topic Name}`. Please check your content."                                                                                 | There was a problem with your skill. Check both [the skill](/composer/test/test-bots-in-web-chat) and [topic](authoring-topic-management.md#topic-errors) for errors.                                                                                                                  |
| **2005** | "We ran into a problem. Please check your content."                                                                                                                   | There was a problem with your Power Automate Flow template. [Check the flow for errors](/power-automate/error-checker).                                                                                                                                                                |
| **2006** | "We couldn't find your bot."                                                                                                                                          | Your bot couldn't be found because the bot, or its environment, was deleted. To configure a new bot, see [Create and delete bots](authoring-first-bot.md). To configure a new environment, see [Working with environments](environments-first-run-experience.md).                      |
| **2007** | "The bot contains too much content to be able to work."                                                                                                               | Reduce message lengths or number of topics, then try again. Read more about [content limits](requirements-quotas.md).                                                                                                                   |
| **2008** | "We couldn't find the user's token."                                                                                                                                  | Check your bot's [authorization configuration](advanced-end-user-authentication.md) for errors.                                                                                                                                                                                        |
| **2009** | "To use this bot, publish it in Microsoft Copilot Studio."                                                                                                                | To use this bot, [publish it in Microsoft Copilot Studio](publication-fundamentals-publish-channels.md).                                                                                                                                                                                   |
| **2010** | "We can't retrieve your bot content."                                                                                                                                 | Content couldn't be found because it was deleted. To configure a new bot, see [Create and delete bots](authoring-first-bot.md). To configure a new environment, see [Working with environments](environments-first-run-experience.md).                                                 |
| **2011** | "We couldn't find `{Skill Name}` in `{Topic Name}`. Please check your content."                                                                                       | Skill couldn't be found because it was deleted. To create a new skill, see [Configure a Skill](configuration-add-skills.md).                                                                                                                                                           |
| **2012** | "We couldn't find `{Flow Name}` in `{Topic Name}`. Please check your content."                                                                                        | Your Power Automate Flow couldn't be found because it was deleted. To create a new flow, see [Add actions using Power Automate](advanced-flow-create.md).                                                                                                                              |
| **2014** | "The translation service did not respond."                                                                                                                            | Try again later. If the issue persists, [contact customer support](fundamentals-support.md).                                                                                                                                                                                           |
| **2015** | "You're not authorized to call `{Skill Name}`. Please check the skill and its usage for any issues."                                                                  | Check your [skill's configuration](configuration-add-skills.md) and ensure your bot is [added to the skill's allowlist](/azure/bot-service/skill-implement-skill).                                                                                                                     |
| **2016** | "Sorry, we couldn't find your bot."                                                                                                                                   | There was a problem with a [Azure Bot Service channel](publication-connect-bot-to-azure-bot-service-channels.md). The channel may have been deleted or configured incorrectly.                                                                                                         |
| **2017** | "Sorry, we couldn't access your bot."                                                                                                                                 | The [Azure Bot Service channel](publication-connect-bot-to-azure-bot-service-channels.md) couldn't be accessed. Check the channel configuration for authentication issues.                                                                                                             |
| **2018** | "The user is typing too fast."                                                                                                                                        | You sent messages too quickly. Read more about [quotas and limits within Microsoft Copilot Studio](requirements-quotas.md).                                                                                                                                                                |
| **2019** | "We couldn't find your environment. It may have been deleted."                                                                                                        | Your environment was deleted. To configure a new environment, see [Working with environments](environments-first-run-experience.md).                                                                                                                                                   |
| **2020** | "Something happened, and `{Flow Name}` isn't working in `{Topic Name}`. Try again later. If the issue persists, check your flow's setup and run history."             | Your Power Automate flow isn't working. Try again later. If the issue persists, [check the flow for errors](/power-automate/error-checker).                                                                                                                                            |
| **2021** | "Number of dialogs executed in the current turn exceeded the maximum of `{Dialog Limit}`."                                                                            | By default, the maximum number of topics is 50. Reduce the number of topics, then try again.                                                                                                                                                                                           |
| **2022** | "The bot sent more than `{Message Limit}` messages in this turn."                                                                                                     | Limit messages per turn to under 30.                                                                                                                                                                                                                                                   |
| **2023** | "We ran into a problem executing your composer dialog."                                                                                                               | [Check the Composer dialog for errors](/composer/test/test-bots-in-web-chat).                                                                                                                                                                                                          |
| **2024** | "This environment requires users to sign in before they can use the bot. Go to Manage > Security > Authentication and select the option to require users to sign in." | Your environment's data loss prevention (DLP) policies requires that user's sign in. To learn how to require users to sign in, see [Configure user authentication](configuration-end-user-authentication.md#required-user-sign-in-and-bot-sharing).                                    |
| **2025** | "There are one or more empty nodes in topic `{Topic Name}`, Please check your content."                                                                               | Add content to empty nodes or remove them from the topic.                                                                                                                                                                                                                              |
| **2025** | "`{Topic Name}` is redirecting to a topic, which has been turned off. Return to `{Topic Name}` and check your content."                                               | Your topic is [redirecting](authoring-create-edit-topics.md#redirect-to-another-topic) to another topic that has been turned off. [Re-enabled the topic](authoring-topic-management.md#topic-status) or [remove the redirect node](authoring-create-edit-topics.md#delete-nodes).      |
| **2025** | "The topic you're trying to redirect to no longer exists. Return to `{Topic Name}` and check your content."                                                           | The topic you're trying to [redirect](authoring-create-edit-topics.md#redirect-to-another-topic) to no longer exists. [Create a new topic](authoring-create-edit-topics.md#create-a-topic) to redirect to or [remove the redirect node](authoring-create-edit-topics.md#delete-nodes). |
| **2026** | "There was a problem with the Power Automate Flow. Please check your content."                                                                                        | [Check the flow for errors](/power-automate/error-checker).  
| **2030** | " Check Power Automate flow run history and ensure that flow ran successfully."                        
| **2101** | "The user's conversation with the bot was too long or the user's message was too long."                                                                               | Try restarting the conversation with the bot or using a shorter message.                                                                                                                                                                                                               |
| **2102** | "The user sent a message which is too large to process."                                                                                                              | You sent a message that is too large to process. Shorten your message, then try again.                                                                                                                                                                                                 |
| **3000** | "Unexpected error"                                                                                                                                                    | A system error occurred. [Contact customer support](fundamentals-support.md) for more details.                                                                                                                                                                                         |
| **3001** | "Power Automate isn't available for your flow `{Flow Name}` now. Try again later."                                                                                    | Power Automate isn't responding. Restart the conversation with your bot and try again. If the issue persists, [contact customer support](fundamentals-support.md).                                                                                                                     |
| **3002** | "Something happened in Power Automate, and your request to your flow `{Flow Name}` wasn't accepted. Try again later."                                                 | An error occurred in Power Automate and the request to your flow wasn't accepted. Your flow might have taken more than 2 minutes to respond.                                                                                                                                           |
| **3003** | "There's a network problem connecting to your flow `{Flow Name}`. Please try again later."                                                                            | Try again later. If the issue persists, [contact customer support](fundamentals-support.md).                                                                                                                                                                                           |

# [Teams](#tab/teams)

### Error List

| Error    | Bot response                   | Resolution                                                                                  |
| -------- | ------------------------------ | ------------------------------------------------------------------------------------------- |
| **2100** | "The user is typing too fast." | Interactions with the bot are rate limited to mitigate spam. Try again while typing slower. |

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
