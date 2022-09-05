---
ROBOTS: NOINDEX,NOFOLLOW
title: Use topics to design a chatbot conversation
description: Use conversation topics in the Power Virtual Agents authoring canvas for an intuitive, no-code way to create a bot that can help answer user questions, perform actions, and solve issues.
keywords: "PVA"
ms.date: 05/10/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: clmori
manager: shellyha
ms.custom: authoring, topics, variables, ceX
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

# Create and edit topics in your Power Virtual Agents bot

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

In Power Virtual Agents, a topic defines how a bot conversation plays out.

A topic has _trigger phrases_ and _conversation nodes_. Trigger phrases are phrases, keywords, and questions that a user is likely to type that are related to a specific issue. Conversation nodes define how a bot should respond to a trigger phrase and what it should do.

The AI uses natural language understanding (NLU) to parse what a customer types and find the most appropriate trigger phrase or node.

For example, a user might type "Open hours" into your bot. The AI matches that to the **Store hours** topic, begins a conversation that asks which store the customer is interested in, and then displays the hours the store is open.

The **Test bot** pane shows how the bot conversation plays out at every step. You can use the **Test bot** pane to fine-tune a topic without having to exit the Power Virtual Agents portal.

## Use system and sample topics

When you create a bot, Power Virtual Agents creates several topics for you.

:::image type="content" source="media/authoring-template-topics/template-list.png" alt-text="Screenshot of the Topics list showing sample topics and system topics.":::

These automatically created topics fall into two categories:
  
- Some example [Custom topics](authoring-template-topics.md) to handle some common scenarios that most bots will need to handle, such as **Greeting** and **Goodbye** topics.

    You can edit custom topics or delete them entirely.

- System topics are topics that help you respond to common system events, such as escalation or carry out critical behaviour for your bot, such as ending a conversation.

    You can't delete system topics. However, you can customize the trigger phrases or the nodes on the authoring canvas. We recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

## Create a topic

1. In the left pane, select **Topics** and then select **+New Topic** to create a new topic.

   :::image type="content" source="media/authoring-create-edit-topics/topics-menu.png" alt-text="Screenshot of the Power Virtual Agents navigation pane, highlighting Topics.":::  

1. The **Trigger phrases** pane should open. If it doesn't open, select **Trigger phrases**.

    :::image type="content" source="media/authoring-create-edit-topics/trigger-phrases-button.png" alt-text="Screenshot of the topic authoring canvas, highlighting Trigger phrases.":::

1. Specify one or more trigger phrases for the topic in the **Trigger phrases** pane.

    :::image type="content" source="media/authoring-create-edit-topics/topics-details-triggers.png" alt-text="Screenshot of the topic authoring canvas, highlighting adding trigger phrases.":::

    A trigger phrase is a phrase that a customer enters in the chat window to start a conversation with the bot. Once the conversation is started, the conversation follows the path you define.

    You can specify more than one trigger phrase for a topic. You can include punctuation in a trigger phrase, but it's best to use short phrases rather than long sentences.

1. Select **Details** to open the topic details pane.

    :::image type="content" source="media/authoring-create-edit-topics/open-details-pane.png" alt-text="Screenshot of the topic authoring canvas, highlighting Details.":::

2. Enter a **Name** for your topic and, optionally, a **Description**.

    The **Name** of the topic is what you will see in your bot's list of topics when you select **Topics** on the left pane. The bot also uses the **Name** when it needs to clarify with the end user which topic they are asking about.

    The **Description** is never shown to users. Use it to describe the purpose of the topic to yourself and other bot makers.

    :::image type="content" source="media/authoring-create-edit-topics/details-pane.png" alt-text="Screenshot of the topic details pane showing Name, Display name, and Description.":::

    You can also rename the topic by selecting its name and entering a new value.

    :::image type="content" source="media/authoring-create-edit-topics/rename-topic-shortcut.png" alt-text="Screenshot of the topic authoring canvas, highlighting the topic name.":::

3. Select **Save** to add the topic to the topics list.

## Design the topic's conversation path

1. Select **Topics** in the left pane and then select the topic you want to edit.

    Power Virtual Agents opens the topic in the authoring canvas and displays the topic's trigger phrases. The authoring canvas is where you define the conversation path between a customer and the bot.

    When you create a new topic, a **Trigger phrases** node is inserted for you, and you can then add additional nodes to control the conversation.

2. To add a node, select the plus (**+**) icon on the line or branch between or after nodes.

   :::image type="content" source="media/authoring-create-edit-topics/handoff-add-node.png" alt-text="Screenshot of adding a node.":::

### Insert nodes

You have several options when you add a node. Each option has a specific node or nodes that will be inserted in the conversation path.

When you add a node after the **Trigger Phrases** node or between other existing nodes, you have the following available options:

- **Send a message** - Send a message from the bot to a user.
- **Ask a question** - Ask the user a question.
- **Add a condition** - Branch your conversation based on a condition.
- **Set a variable value** - Set a value for a new, or existing, variable.
- **Topic management** - Use one of several available nodes to control the flow of your conversation, including  redirecting to another topic or ending all topics.
- **Call an action** - Call a Power Automate Flow.

:::image type="content" source="media/authoring-create-edit-topics/topics-node-after-triggers.png" alt-text="Screenshot of adding a node between existing nodes from the options.":::

#### Send a message

To send a message consisting of text, or richer components such as images, videos, card and quick replies, select **Send a Message**.

See [Send a message](authoring-message-node).

#### Ask a question

To have the bot ask a question and get a response from the user, select **+** to add a node, and then select **Ask a question** to add a new **Question** node.

See [Ask a question](authoring-question-node).

#### Add a condition

You can use conditions to branch logic within your topic.

See [Using conditions](authoring-condition-node).

#### Set a variable value

See [Set variable value](authoring-variables.md#set-a-variable).

#### Call an action

To [call Power Automate Flows](advanced-flow.md), select **Call an action**.

> [!TIP]
> If you've configured authentication or hand-off to omnichannel, you'll see some additional actions for use in those scenarios.

#### Moving between topics

When you add a node, the **Topic Management** sub menu contains several options to allow you to move between topics and to manage your conversation, including options for ending the conversation.

See [Moving between topics](authoring-moving-between-topics.md).

### Delete nodes

Select the menu icon at the top of the node's title and select **Delete**.

:::image type="content" source="media/authoring-create-edit-topics/topics-delete.png" alt-text="Screenshot highlighting the node menu button and the Delete button.":::

## Edit topics with the code editor

The code editor shows the topic in [YAML](https://yaml.org/), a markup language that is easy to read and understand. Use the code editor to copy and paste topics from other bots, even ones created by other authors.

> [!IMPORTANT]
> Designing a topic entirely in the code editor is currently not fully supported.

In this example, you'll copy and paste YAML into the code editor to quickly add a topic that asks the user if they prefer cats or dogs.

1. On the topic list, create a **New topic**.

1. Select the three dots icon and then select **Open code editor**

    :::image type="content" source="media/authoring-create-edit-topics/code-editor-open.png" alt-text="Screenshot of how to open the code editor.":::

1. Remove all of the existing YAML. Then copy and paste the following:

    ```yaml
    kind: AdaptiveDialog
    id: FL9xjs
    autoEndDialog: true
    beginDialog:
    kind: OnRecognizedIntent
    actions:
        - kind: Question
        id: question_Pf6ZSq
        disabled: false
        allowInterruptions: true
        property: Topic.chosenAnimal
        prompt:
            kind: Message
            text:
            - Do you like cats or dogs?

        maxTurnCount: 3
        entity:
            kind: EmbeddedEntity
            definition:
            kind: ClosedListEntity
            items:
                - id: pD60EN
                displayName: Cats

                - id: aZdKO5
                displayName: Dogs

        - kind: Condition
        id: condition_65zClW
        conditions:
            - id: conditionItem_7mbFIC
            condition: =Topic.chosenAnimal = 'cr08a_codeEditor050922.topic.Untitled.main.question_Pf6ZSq'.pD60EN
            actions:
                - kind: SendMessage
                id: sendMessage_3IR6t8
                disabled: false
                message:
                    text:
                    - Meow!

            - id: conditionItem_XN7izI
            condition: =Topic.chosenAnimal = 'cr08a_codeEditor050922.topic.Untitled.main.question_Pf6ZSq'.aZdKO5
            actions:
                - kind: SendMessage
                id: sendMessage_uVbAox
                disabled: false
                message:
                    text:
                    - Woof!

    id: main
    intent:
        displayName: Animal

    inputType: {}
    outputType: {}
    variables:
    - name: chosenAnimal
        scope: Dialog
        isExternalInitializationAllowed: false
        initializer:
        kind: ActionInitializer
        action:
            triggerId: main
            actionId: question_Pf6ZSq

    disabled: false
    ```

1. Select the three dots icon, then select **Close code editor**. You'll see the new conversation path generated from the YAML on the authoring canvas.

    :::image type="content" source="media/authoring-create-edit-topics/code-editor-conversation.png" alt-text="Screenshot conversation created from YAML.":::

## Test and publish your bot

[Test your bot](authoring-test-bot.md) when you make changes to your topics, to make sure that everything is working as expected.

After you've designed and tested your bot, [publish it to the web, mobile or native apps, or Microsoft Bot Framework channels](publication-fundamentals-publish-channels.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
