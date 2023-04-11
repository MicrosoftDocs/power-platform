---
title: "Use topics to design a chatbot conversation in Microsoft Teams"
description: "Use the authoring canvas in the Power Virtual Agents app in Microsoft Teams to create an end-to-end conversation."
keywords: "PVA, authoring canvas, conversation, Teams"
ms.date: 01/25/2022

ms.topic: article
author: iaanw
ms.author: iawilt
ms.custom: authoring, ceX, teams
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Create and edit topics in your Power Virtual Agents bot in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](../authoring-create-edit-topics.md)
> - [Power Virtual Agents app in Microsoft Teams](authoring-create-edit-topics-teams.md)

In Power Virtual Agents, a topic determines a how a bot responds to a question from a user.
You can create topics by [customizing provided templates](authoring-template-topics-teams.md), create new topics from scratch, or [get suggestions from existing help sites](advanced-create-topics-from-web-teams.md).

All topics have trigger phrases and conversation nodes.

- Trigger phrases: phrases, keywords, or questions that a user is likely to type that is related to a specific issue. You don't need to be exact with trigger phrases - the bot can determine what the user meant (their "intent") and match it to the right topic.
- Conversation nodes: what you use to determine how a bot should respond and what it should do.

For example, a user might type "Open hours" into your bot, which will match that to the trigger phrases for the **Store hours** topic. The bot then asks which store the customer is interested in, and displays the hours the store is open.

You can see how the bot conversation works in practice by testing it in the **Test bot** pane. This lets you fine-tune the topic until you're ready to share it.

For bot and topic limits, see the [Quotas, limits, and configuration values](../requirements-quotas.md) topic.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents-teams.md).

## Use system and sample topics

When you create a bot, a number of topics are automatically created.

:::image type="content" source="../media/authoring-create-edit-topics/topics-system-teams.png" alt-text="Screenshot of the Topics list showing lesson topics and system topics.":::

These automatically created topics fall into two categories:
  
- [Lesson topics](authoring-template-topics-teams.md) help you understand simple to complex ways to use nodes to create bot conversations.

    You can edit lesson topics or delete them entirely.

- [System topics](authoring-system-topics-teams.md) are topics you're likely to need during a bot conversation.

    You can't delete or disable system topics or edit their trigger phrases. However, you can customize the nodes on the authoring canvas. We recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

## Create a topic

1. In the navigation menu, select **Topics** tab to open the topics page.

   :::image type="content" source="../media/authoring-create-edit-topics/topics-menu-teams.png" alt-text="Select Topics on the navigation menu." border="false":::

1. On the topics page, select **New topic** to open the authoring canvas for an empty topic.

   :::image type="content" source="../media/authoring-create-edit-topics/topics-new-teams.png" alt-text="Select New topic at the top of the Topics page." border="false":::

1. When you enter the authoring canvas, the **Trigger phrases** pane will automatically open for you. You can also open the pane by selecting **Trigger phrases**.

   :::image type="content" source="../media/authoring-create-edit-topics/trigger-phrases-button.png" alt-text="Selecting Trigger phrases will open the topic details pane":::

1. Specify one or more trigger phrases for the topic in the **Trigger phrases** pane.

   You can specify more than one trigger phrase for a topic. You can include punctuation in a trigger phrase, but it's best to use short phrases rather than long sentences.

   :::image type="content" source="../media/authoring-create-edit-topics/topics-details-triggers.png" alt-text="Edit trigger phrases in the trigger phrases pane":::

1. Select **Details**.

1. Specify a name, description, and one or more trigger phrases for the topic.

   :::image type="content" source="../media/authoring-create-edit-topics/open-details-pane.png" alt-text="Selecting Details will open the topic details pane":::

1. For **Name**, enter a name for your topic. You can add a **Display name** and **Description**.

   The display name is used when the bot needs to ask the person chatting which topic they're asking about.

   The description is never shown to users. Use the description to describe the purpose of the topic to yourself and other bot makers.

   :::image type="content" source="../media/authoring-create-edit-topics/details-pane.png" alt-text="The Topic details pane contains a name, display name, and description":::

   You can also rename the topic by selecting its name and entering a new value.

   :::image type="content" source="../media/authoring-create-edit-topics/rename-topic-shortcut.png" alt-text="Quickly rename a topic by selecting its name":::

1. Select **Save** to add the topic to the topics list.

## Design the topic's conversation path

1. In the topic list, select the topic you want to edit.

   :::image type="content" source="../media/authoring-create-edit-topics/topics-details-canvas-teams.png" alt-text="Selecting a topic will take you to the authoring canvas":::

1. Power Virtual Agents opens the topic in the authoring canvas and displays the topic's trigger phrases. The authoring canvas is where you define the conversation path between a customer and the bot.

1. For existing or system topics, a number of nodes will automatically be created. You can edit these nodes just as you can for other nodes.

1. When you create a new topic, a **Trigger phrases** node and a blank **Message** node are inserted for you.

1. You can add additional nodes by selecting **Add node** (**+**) on the line or branch between or after a node.

   :::image type="content" source="../media/authoring-create-edit-topics/handoff-add-node-teams.png" alt-text="Screenshot of adding a node." border="false":::

1. To move or change the paths between a node, drag the node anchor. It looks like a small circle on top of the node. When you drag the node anchor, you'll see a dotted line indicating the original path. You can also double-click the anchor and then select the new place for the anchor (you won't see a dotted line).

   :::image type="content" source="../media/authoring-create-edit-topics/move-anchor-node.png" alt-text="Screenshot of moving a node's anchor.":::

### Insert nodes

When adding a node, you can choose from five options. Each option has a specific node or nodes that will be inserted into the conversation path.

You can:

- **Ask a question**
- **Add a condition**
- **Call an action**
- **Show a message**
- **End with survey**

:::image type="content" source="../media/authoring-create-edit-topics/topics-nodes-teams.png" alt-text="When adding a node, you can choose from five options":::

If the node you are adding is the last in a topic, you can also add a **Go to another topic** node.

:::image type="content" source="../media/authoring-create-edit-topics/topics-nodes-other-topic-teams.png" alt-text="Go to another topic.":::

#### Ask a question

1. To have the bot ask a question and get a response from the user, select **Add node** (**+**) to add a node, and then **Ask a question** to add a new **Question** node.

    :::image type="content" source="../media/authoring-create-edit-topics/topics-question-teams.png" alt-text="Add a new question mode." border="false":::

1. Enter the question phrase in the first text box, **Ask a question**.

1. Choose from several options for the user's response in the **Identify** field.

   These options determine what the bot should be listening for in the user's response. For example, they could be multiple choice options, a number, or a specific string. To understand more about the different options, see [Use entities in a conversation](advanced-entities-slot-filling-teams.md).

1. Depending on what you choose in the **Identify** field, you can enter what options the user should have.

   For example, if you select **Multiple choice options**, you can then enter the options the user can specify in the **Options for user** field. Each option is presented as a multiple choice button to the user, but users can also type in their answer in the bot.

   The conversation editor creates separate paths in the conversation, depending on the customer's response. The conversation path leads the customer to the appropriate path for each user response. You can add additional nodes to create branching logic, and specify what the bot should respond with for each variable.

1. You can [save the user response in a variable](authoring-variables-teams.md) to be used later.

> [!TIP]
> You can define synonyms for each option. This can help the bot to determine the correct option in case it isn't clear what the user's response should be mapped to.
>
> 1. Select the menu icon on the top of the **Question** node, and then select **Options for user**.
>
>    :::image type="content" source="../media/authoring-create-edit-topics/topics-question-options-teams.png" alt-text="Select options for users." border="false":::
>
> 1. Select the **Synonyms** icon for the option you want to add additional keywords to.
>
>    :::image type="content" source="../media/authoring-create-edit-topics/topics-question-synonyms-teams.png" alt-text="Select the synonyms icon." border="false":::
>
> 1. Add the keywords individually, and then once you're done, select **Done** to return to the **Authoring canvas**.

#### Add a condition

1. To add branching logic based on [variables](authoring-variables-teams.md), select **Add node** (**+**) to add a node, and then **Add a condition**.

1. Choose the variable you want to use to determine if the bot conversation should branch at this point.

    :::image type="content" source="../media/authoring-create-edit-topics/topics-branch-teams.png" alt-text="Choose a variable." border="false":::

#### Call an action

You can [call Power Automate Flows](advanced-flow-teams.md) by selecting **Call an action**.

#### Show a message

1. To specify a response from the bot, select **Add node** (**+**) to add a node, and then **Show a message** to add a new **Message** node.

1. Enter what you want the bot to say in the text box. You can apply some basic formatting, such as bold, italics, and numbering.

   You can also [use variables that you have defined elsewhere](authoring-variables-teams.md) in your bot conversation.

#### End with survey

When you end the conversation, you can have a survey appear that asks the user if their question or issue was answered or resolved correctly. This information is collected under the [customer satisfaction analytics page](analytics-csat-teams.md).

1. At the end of a response that resolves the user's issue or answers the question, select **End with survey**.

    :::image type="content" source="../media/authoring-create-edit-topics/topics-nodes-survey-teams.png" alt-text="End with survey." border="false":::

#### Redirect to another topic

1. To automatically have the bot move to a separate topic, select **Add node** (**+**) to add a node, and then **Redirect to another topic**.

1. In the flyout menu, select the topic the bot should divert to. For example, you might want to send the user to a specific topic about the closure of a store if they ask about store hours for that store.

    :::image type="content" source="../media/authoring-create-edit-topics/topics-nodes-other-topic-flyout-teams.png" alt-text="Go to another topic node with options for other topics.":::

When the bot goes to another topic, the bot will go through the conversation path for that topic and then return to the original topic, at the place where it left.

You can consider the redirected topic as a "subtopic".

:::image type="content" source="../media/authoring-create-edit-topics/authoring-subtopic-redirect-teams.png" alt-text="Screenshot of the authoring canvas showing nodes under a redirected topic node.":::

If you redirect to any of the following [system topics](../authoring-system-topics.md), however, the entire conversation will end:

- End of Conversation
- Confirmed Success
- Confirmed Failure
- Goodbye
- Escalate
- Start over (this will also reset any [global variables](authoring-variables-bot-teams.md))

#### Use variables

You can also [use variables that you have defined elsewhere](authoring-variables-teams.md) in your bot conversation.

### Delete nodes

1. Select the menu icon on the top of the node's title.

1. Select **Delete**.

    :::image type="content" source="../media/authoring-create-edit-topics/topics-delete-teams.png" alt-text="Select the menu icon and then the delete button." border="false":::

## Test and publish your bot

[Test your bot](authoring-test-bot-teams.md) when you make changes to your topics, to ensure everything is working as expected.

Once you've finished designing and testing your bot, you can consider [publishing it](publication-fundamentals-publish-channels-teams.md) so other team members can use it.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
