---
ROBOTS: NOINDEX,NOFOLLOW
title: Use topics to design a chatbot conversation
description: Use conversation topics in the Power Virtual Agents unified authoring canvas for an intuitive, no-code way to create a bot that can help answer user questions, perform actions, and solve issues.
keywords: "PVA"
ms.date: 10/04/2022
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

In Power Virtual Agents, a topic represents part of or a complete conversational thread.

A topic contains one or more _conversation nodes_, which together define the conversational paths that that topic can take.
Each node performs an action, such as sending a message or asking a question.

Usually, a topic also has _trigger phrases_, which are phrases, keywords, and questions that a user is likely to use that are related to a specific issue.
Power Virtual Agents uses the topic trigger phrases and natural language understanding to interpret customer input and find the most appropriate topic to trigger.
So, your customer's message doesn't need to exactly match your topic trigger phrases.

For example, a topic about store hours might include the trigger phrase `check store hours`. If a customer sends, "see store opening hours", Power Virtual Agents can trigger your store hours topic.

There are two types of topics within a bot.

- _Custom_ topics, which you create to build out your conversation.
  Four custom topics are automatically created for you. These topics cover some common behavior, such as conversation for when a customer starts, ends, or restarts the conversation.

    You can make changes to the custom topics created for you, or remove them from your bot entirely.

- _System_ topics, which help your bot respond to common system events. such as escalation or carry out essential behavior for your bot, such as ending a conversation.

    Some system topics have trigger phrases, which you can customize to fit your bot's needs. You can't delete system topics but, if necessary, you can disable them. However, we recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

    See [System Topics](authoring-system-topics.md) for details on the system topics included as part of a bot.

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

1. Enter a **Name** for your topic and, optionally, a **Description**.

    The **Name** of the topic is what you will see in your bot's list of topics when you select **Topics** on the left pane. The bot also uses the **Name** when it needs to clarify with the end user which topic they are asking about.

    The **Description** is never shown to users. Use it to describe the purpose of the topic to yourself and other bot makers.

    :::image type="content" source="media/authoring-create-edit-topics/details-pane.png" alt-text="Screenshot of the topic details pane showing Name, Display name, and Description.":::

    You can also rename the topic by selecting its name and entering a new value.

    :::image type="content" source="media/authoring-create-edit-topics/rename-topic-shortcut.png" alt-text="Screenshot of the topic authoring canvas, highlighting the topic name.":::

1. Select **Save** to add the topic to the topics list.

## Design the topic's conversation path

1. Select **Topics** in the left pane and then select the topic you want to edit.

    Power Virtual Agents opens the topic in the authoring canvas and displays the topic's trigger phrases. The authoring canvas is where you define the conversation path between a customer and the bot.

    When you create a new topic, a **Trigger phrases** node is inserted for you, and you can then add additional nodes to control the conversation.

1. To add a node, select the plus (**+**) icon on the line or branch between or after nodes.

   :::image type="content" source="media/authoring-create-edit-topics/handoff-add-node.png" alt-text="Screenshot of adding a node.":::

### Insert nodes

You have several options when you add a node. Each option has a specific node or nodes that will be inserted in the conversation path.

When you add a node after the **Trigger Phrases** node or between other existing nodes, you have the following available options:

- [**Send a message**](authoring-send-message.md) - Send a message from the bot to a user.
- [**Ask a question**](authoring-ask-question.md) - Ask the user a question.
- [**Add a condition**](authoring-using-conditions.md) - Branch your conversation based on a condition.
- [**Set a variable value**](authoring-variables.md#set-a-variable) - Set a value for a new, or existing, variable.
- [**Topic management**](authoring-moving-between-topics.md) - Use one of several available nodes to control the flow of your conversation, including  redirecting to another topic or ending all topics.
- [**Call an action**](advanced-flow.md) - Call a Power Automate Flow.

:::image type="content" source="media/authoring-create-edit-topics/topics-node-after-triggers.png" alt-text="Screenshot of adding a node between existing nodes from the options.":::

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
