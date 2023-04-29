---
title: Use topics to design a chatbot conversation
description: Use conversation topics in the Power Virtual Agents authoring canvas for an intuitive, no-code way to create a bot that can help answer user questions, perform actions, and solve issues.
keywords: "PVA"
ms.date: 12/29/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: clmori
ms.custom: authoring, topics, variables, ceX
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

# Create and edit topics in your Power Virtual Agents bot

[!INCLUDE[public preview disclaimer](includes/public-preview-disclaimer-prod.md)]

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](authoring-create-edit-topics.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/authoring-create-edit-topics-teams.md)

In Power Virtual Agents, a topic defines a how a bot conversation plays out.

To author topics, you can [customize provided templates](authoring-template-topics.md), create topics from scratch, or [get suggestions from existing help sites](advanced-create-topics-from-web.md).

A topic has _trigger phrases_ and _conversation nodes_. Trigger phrases are phrases, keywords, and questions that a user is likely to type that relate to a specific issue. Conversation nodes define how a bot should respond to a trigger phrase and what it should do.

The AI uses natural language understanding (NLU) to parse what a customer typed and find the most appropriate trigger phrase or node.

For example, a user might type "Open hours" into your bot. The AI matches that to the **Store hours** topic, begins a conversation that asks which store the customer is interested in, and then displays the hours the store is open.

The **Test bot** pane shows how the bot conversation plays out at every step. You can use the **Test bot** pane to fine-tune a topic without having to exit the Power Virtual Agents portal.

For bot and topic limits, see [Quotas, limits, and configuration values](requirements-quotas.md).

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Use system and sample topics

When you create a bot, several topics are created for you.

:::image type="content" source="media/authoring-create-edit-topics/topics-system.png" alt-text="Screenshot of the Topics list showing lesson topics and system topics.":::

These automatically created topics fall into two categories:
  
- [Lesson topics](authoring-template-topics.md) help you understand simple to complex ways to use nodes to create bot conversations.

    You can edit lesson topics or delete them entirely.

- [System topics](authoring-system-topics.md) are topics you're likely to need during a bot conversation.

    You can't delete or disable system topics or edit their trigger phrases. However, you can customize the nodes on the authoring canvas. We recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

## Create a topic

1. In the navigation menu, select **Topics**.

   :::image type="content" source="media/authoring-create-edit-topics/topics-menu.png" alt-text="Screenshot of the Power Virtual Agents navigation pane, highlighting Topics.":::

1. Select **New topic**.

1. The **Trigger phrases** pane should open. If it doesn't open, select **Trigger phrases**.

    :::image type="content" source="media/authoring-create-edit-topics/trigger-phrases-button.png" alt-text="Screenshot of the topic authoring canvas, highlighting Trigger phrases.":::

1. Specify one or more trigger phrases for the topic in the **Trigger phrases** pane.

    :::image type="content" source="media/authoring-create-edit-topics/topics-details-triggers.png" alt-text="Screenshot of the topic authoring canvas, highlighting adding trigger phrases.":::

    You can specify more than one trigger phrase for a topic. You can include punctuation in a trigger phrase, but it's best to use short phrases rather than long sentences.

1. Select **Details** to open the topic details pane.

    :::image type="content" source="media/authoring-create-edit-topics/open-details-pane.png" alt-text="Screenshot of the topic authoring canvas, highlighting Details.":::

1. Enter a **Name** for your topic and, optionally, a **Display name** and **Description**.

    The bot uses the **Display name** when it needs to know which topic the person is asking about.

    The **Description** is never shown to users. Use it to describe the purpose of the topic to yourself and other bot makers.

    :::image type="content" source="media/authoring-create-edit-topics/details-pane.png" alt-text="Screenshot of the topic details pane showing Name, Display name, and Description.":::

    You can also rename the topic by selecting its name and entering a new value.

    :::image type="content" source="media/authoring-create-edit-topics/rename-topic-shortcut.png" alt-text="Screenshot of the topic authoring canvas, highlighting the topic name.":::

1. Select **Save** to add the topic to the topics list.

## Design the topic's conversation path

1. In the topic list, select the topic you want to edit.

    Power Virtual Agents opens the topic in the authoring canvas and displays the topic's trigger phrases. The authoring canvas is where you define the conversation path between a customer and the bot.

    For existing or system topics, several nodes are created automatically. You can edit these nodes just as you would edit other nodes.

    When you create a new topic, a **Trigger phrases** node and a blank **Message** node are inserted for you.

1. To add a node, select **Add node** (**+**) on the line or branch between or after nodes.

   :::image type="content" source="media/authoring-create-edit-topics/handoff-add-node.png" alt-text="Screenshot of adding a node.":::

1. To move or change the paths between a node, drag the node anchor. It looks like a small circle on top of the node. When you drag the node anchor, you'll see a dotted line indicating the original path. You can also double-click the anchor and then select the new place for the anchor (you won't see a dotted line).

   :::image type="content" source="media/authoring-create-edit-topics/move-anchor-node.png" alt-text="Screenshot of moving a node's anchor.":::

### Insert nodes

You have several options when you add a node. Each option has a specific node or nodes that will be inserted in the conversation path.

When you add a node after the **Trigger Phrases** node or between **Message nodes**, you can:

- Ask a question
- Call an action
- Show a message
- Go to another topic

:::image type="content" source="media/authoring-create-edit-topics/topics-node-after-triggers.png" alt-text="Screenshot of adding a node between existing nodes from the options.":::

After the last node, you can also:

- End the conversation

Additionally, you can **Add a condition** when you insert a node after a **Question** node.

#### Ask a question

1. To have the bot ask a question and get a response from the user, select **Add node** (**+**) to add a node, and then select **Ask a question** to add a new **Question** node.

   :::image type="content" source="media/authoring-create-edit-topics/topics-question.png" alt-text="Screenshot of adding a new question mode.":::

1. Enter the question phrase in **Ask a question**.

1. In the **Identify** list, select an option for the user's response.

   The options determine what the bot should listen for when the user responds. For more information, see [Use entities in a conversation](advanced-entities-slot-filling.md#use-entities-in-a-conversation).

1. Depending on what you selected in **Identify**, enter the options the user should have.

   For example, if you selected **Multiple choice options**, enter the choices the user can specify in **Options for user**. Each choice is presented to the user as a multiple choice button, but users can also type their answer.

   The conversation editor creates separate paths in the conversation depending on the customer's response. The conversation path leads the customer to the appropriate resolution for each response. You can add nodes to create branching logic, and specify what the bot should respond with for each variable.

1. (Optional) [Save the user response in a variable](authoring-variables.md) to be used later.

> [!TIP]
> Define synonyms for each option to help the bot determine the correct one if it isn't clear what the user's response should map to.
>
> 1. Select the menu icon at the top of the **Question** node, and then select **Options for user**.
>
>    :::image type="content" source="media/authoring-create-edit-topics/topics-question-options.png" alt-text="Screenshot of selecting options for users.":::
>
> 1. Select the **Synonyms** icon for the option you want to add additional keywords to.
>
>    :::image type="content" source="media/authoring-create-edit-topics/topics-question-synonyms.png" alt-text="Screenshot highlighting the synonyms icon.":::
>
> 1. Add the keywords individually. When you've entered all the synonyms you want, select **Done**.

#### Call an action

To [call Power Automate Flows](advanced-flow.md) and [insert authentication nodes](advanced-end-user-authentication.md), select **Call an action**.

If you've enabled voice-based capabilities for your bot, you'll see [more actions](configuration-hand-off-omnichannel.md#voice-based-capabilities).

#### Show a message

1. To specify a response from the bot, select **Add node** (**+**) to add a node, and then select **Show a message** to add a new **Message** node.

1. Enter what you want the bot to say in the text box.

    You can apply some basic formatting, such as bold, italics, and numbering. You can also [use variables](authoring-variables.md) that you defined elsewhere in your bot conversation.

#### Redirect to another topic

1. To have the bot move to a different topic, select **Add node** (**+**) to add a node, and then select **Redirect to another topic**.

1. Select the topic that the bot should divert to. For example, you might send the user to a topic about the closure of a store if they ask about the store's hours.

    :::image type="content" source="media/authoring-create-edit-topics/topics-nodes-other-topic-flyout.png" alt-text="Screenshot showing redirection to another topic node with options for other topics.":::

You can consider the redirected topic as a "subtopic".

In the authoring canvas for the original topic, you can insert additional nodes under the subtopic's node.

When the path for the subtopic is finished, the bot will return to the original topic. The bot will then follow the nodes that are under the subtopic's node.

:::image type="content" source="media/authoring-create-edit-topics/authoring-subtopic-redirect.png" alt-text="Screenshot of the authoring canvas showing nodes under a redirected topic node.":::

If you redirect to any of the following [system topics](authoring-system-topics.md), however, the entire conversation will end:

- End of Conversation
- Confirmed Success
- Confirmed Failure
- Goodbye
- Escalate
- Start over (also resets any [global variables](authoring-variables-bot.md))

#### End the conversation

When the conversation ends, you can have a survey ask users if their question or issue was answered or resolved. The response is collected on the [customer satisfaction analytics page](analytics-csat.md).

You can also have the conversation [handed over to a live agent](advanced-hand-off.md) if you're using a suitable customer service portal, such as Omnichannel for Customer Service.

1. At the end of a response that resolves the user's issue or answers the question, select **End the conversation**.

    :::image type="content" source="media/authoring-create-edit-topics/topics-nodes-end.png" alt-text="Screenshot showing options for ending a conversation.":::

    - To end with a customer satisfaction survey, select **End with survey**.

    - To insert a hand-off node that will link with your [configured hand-off product](configuration-hand-off-omnichannel.md), select **Transfer To Agent**.

        (Optional) Enter a private message to the agent.

        :::image type="content" source="media/authoring-create-edit-topics/topics-nodes-handoff.png" alt-text="Transfer To Agent." border="false":::

#### Add a condition

1. To add branching logic based on [variables](authoring-variables.md), select **Add node** (**+**) to add a node, select **Add a condition**, and then select **Branch based on a condition**.

1. Select the variable that will determine whether the bot conversation should branch at this point.

    For example, if you've set up [user authentication](advanced-end-user-authentication.md), you might specify a different message if the user is signed in (which may have happened earlier in the conversation).

### Delete nodes

Select the menu icon at the top of the node's title, and then select **Delete**.

:::image type="content" source="media/authoring-create-edit-topics/topics-delete.png" alt-text="Screenshot highlighting the node menu button and the Delete button.":::

## Test and publish your bot

[Test your bot](authoring-test-bot.md) when you make changes to your topics, to make sure that everything is working as expected.

After you've designed and tested your bot, [publish it to the web, mobile or native apps, or Microsoft Bot Framework channels](publication-fundamentals-publish-channels.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
