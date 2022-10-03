---
title: Use topics to design a chatbot conversation (preview)
description: Use conversation topics in the Power Virtual Agents unified authoring canvas for an intuitive, no-code way to create a bot that can help answer user questions, perform actions, and solve issues in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 10/10/2022
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

# Create and edit topics in your Power Virtual Agents bot (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

In Power Virtual Agents, a _topic_ represents some portion of a conversational thread. Power Virtual Agents provides an _authoring canvas_ for defining and working with your topics.

A topic contains one or more _conversation nodes_, which together define the conversational paths that that topic can take. Each node performs an action, such as sending a message or asking a question.

Often, a topic also has a set of _trigger phrases_&mdash;phrases, keywords, and questions that a user is likely to use that are related to a specific issue.
The Power Virtual Agents AI uses natural language understanding, your customer's message, and the trigger phrases for all your topics to find the most appropriate topic to trigger. The message doesn't need to be an exact match to a topic's trigger phrases to trigger the topic.

For example, a topic about store hours might include the trigger phrase `check store hours`. If a customer sends, "see store opening hours", Power Virtual Agents can still trigger your store hours topic.

## Topic types

There are two types of topics within a bot. Every new bot starts with a set of custom and system topics.

- _Custom_ topics are ones you can create to build out your conversation. These topics cover some common behavior, such as ways to greet a customer, to acknowledge the end of a conversation, or to start a conversation over.

  - All new topics you create will be custom topics.
  - You can make changes to the custom topics created for you, or remove them from your bot entirely.

- _System_ topics are ones that support essential behavior for your bot, such as a custom request to speak to a person or end the conversation. Some system topics have trigger phrases, which you can customize to fit your bot's needs.

  - You can't create new system topics.
  - You can't delete a system topic, but you can disable one or more of them.
  - Until you're comfortable creating end-to-end bot conversations, you shouldn't edit the system topics.

  For more information, see [System Topics](authoring-system-topics.md).

## Create a topic

1. Open your bot and select **Topics**.

   :::image type="content" source="media/authoring-create-edit-topics/topics-menu.png" alt-text="Screenshot of the Power Virtual Agents navigation pane, highlighting Topics.":::  

1. On the **Topics** page, select **+ New Topic**. Power Virtual Agents creates and opens a new topic for you.
1. The **Trigger phrases** pane should already be open. If not, select the **Trigger phrases** node to open the pane.

    :::image type="content" source="media/authoring-create-edit-topics/trigger-phrases-button.png" alt-text="Screenshot of the topic authoring canvas, highlighting Trigger phrases.":::

1. Add one or more trigger phrases for your topic in the **Trigger phrases** pane.

    :::image type="content" source="media/authoring-create-edit-topics/topics-details-triggers.png" alt-text="Screenshot of the topic authoring canvas, highlighting adding trigger phrases.":::

    > [!TIP]
    > You can specify more than one trigger phrase for a topic. You can include punctuation in a trigger phrase, but it's best to use short phrases rather than long sentences.
    >
    > A trigger phrase is a phrase that a customer enters in the chat window to start a conversation with the bot. Once the conversation is started, the conversation follows the path as defined in the topic.

1. Select **Details** to open the topic details pane.

    :::image type="content" source="media/authoring-create-edit-topics/open-details-pane.png" alt-text="Screenshot of the topic authoring canvas, highlighting Details.":::

1. Enter a **Name** for your topic and, optionally, a **Description**.

    - Use the name to identify the topic.
      The **Topics** page lists all the topics currently defined in your bot, by name.
      A customer might see the topic name&mdash;the bot will use topic names if it can't determine which topic matches a customer message.

    - The **Description** is never shown to users. Use it to describe the purpose of the topic to yourself and other the bot makers on your team.

    :::image type="content" source="media/authoring-create-edit-topics/details-pane.png" alt-text="Screenshot of the topic details pane showing Name, Display name, and Description.":::

1. Select **Save** to save your changes and add the topic to the topics list.

When you edit a topic, you can also use the toolbar to rename it.

:::image type="content" source="media/authoring-create-edit-topics/rename-topic-shortcut.png" alt-text="Screenshot of the topic authoring canvas, highlighting the topic name.":::

## Design a topic conversation path

1. Open your bot and select **Topics**.
1. On the **Topics** page, select the topic you want to edit.

    Power Virtual Agents opens the topic in the authoring canvas and displays the topic's trigger phrases.

    When you create a new topic, a **Trigger phrases** node is inserted for you. Add more nodes to control the conversation.

1. To add a node, select the plus sign (**+**) icon on the line or branch between or after nodes.

   :::image type="content" source="media/authoring-create-edit-topics/handoff-add-node.png" alt-text="Screenshot of adding a node.":::

1. Then insert the type of node you want.

### Insert a node

You have several options for the type of node to insert. Each option describes the type of node or nodes that will be inserted in the conversation path.

When you add a node after the **Trigger Phrases** node or between other existing nodes, you have the following options:

| Option                                                            | Description                                           |
| :---------------------------------------------------------------- | :---------------------------------------------------- |
| [**Send a message**](authoring-send-message.md)                   | Send the customer a message .                         |
| [**Ask a question**](authoring-ask-a-question.md)                 | Ask the customer a question.                          |
| [**Add a condition**](authoring-using-conditions.md)              | Branch your conversation based on a condition.        |
| [**Set a variable value**](authoring-variables.md#set-a-variable) | Set a value for a new or existing variable.           |
| [**Topic management**](authoring-moving-between-topics.md)        | Redirect, transfer, or end the topic or conversation. |
| [**Call an action**](advanced-flow.md)                            | Call a Power Automate Flow.                           |

:::image type="content" source="media/authoring-create-edit-topics/topics-node-after-triggers.png" alt-text="Screenshot of adding a node between existing nodes from the options.":::

### Delete a node

Select the the node's _node menu_ (**&vellip;**) then **Delete**.

:::image type="content" source="media/authoring-create-edit-topics/topics-delete.png" alt-text="Screenshot highlighting the node menu button and the Delete button.":::

## Controls for editing nodes on the canvas

You can use controls on the toolbar to cut, copy, paste, and delete nodes on the canvas.

:::image type="content" source="media/authoring-create-edit-topics/toolbar-edit-controls.png" alt-text="Screenshot of the toolbar controls for editing nodes on the canvas.":::

The toolbar also has a control for undo.

:::image type="content" source="media/authoring-create-edit-topics/toolbar-undo-redo.png" alt-text="Screenshot of the toolbar controls for undo and redo.":::

To access **Undo to last save** and **Redo**, open the undo menu.

:::image type="content" source="media/authoring-create-edit-topics/undo-menu.png" alt-text="Screenshot of the undo menu.":::

### To cut, copy, or delete nodes

1. Select one or more adjacent nodes.

1. Select **Cut**, **Copy**, or **Delete** on the canvas toolbar.

### To paste nodes

Once you have used **Cut** or **Copy** to add one or more nodes to the clipboard, there are a couple of ways to paste them to the canvas:

- If you select a node and then select **Paste**, the nodes from the clipboard are added after the selected node.

- If you select the _add node_ (**+**) menu, then **Paste**, the nodes from the clipboard are added at that point.

<!--
## Edit topics with the code editor

The code editor shows the topic in [YAML](https://yaml.org/), a markup language that is easy to read and understand. Use the code editor to copy and paste topics from other bots, even ones created by other authors.

> [!IMPORTANT]
> Designing a topic entirely in the code editor is currently not fully supported.

In this example, you'll copy and paste YAML into the code editor to quickly add a topic that asks the user if they prefer cats or dogs.

1. On the topic list, create a **New topic**.

1. On the authoring canvas, select _more options_ (**&hellip;**) then **Open code editor**.

    :::image type="content" source="media/authoring-create-edit-topics/code-editor-open.png" alt-text="Screenshot of how to open the code editor.":::

1. Remove all of the existing YAML. Then copy and paste the following:

    ```yaml
    kind: AdaptiveDialog
    beginDialog:
      kind: OnRecognizedIntent
      actions:
        - kind: Question
          id: question_b9p80Y
          alwaysPrompt: false
          variable: init:Topic.chosenAnimal
          prompt: Do you like cats or dogs?
          maxTurnCount: 3
          entity:
            kind: EmbeddedEntity
            definition:
              kind: ClosedListEntity
              items:
                - id: d24VJv
                  displayName: Cats

                - id: vXYBtP
                  displayName: Dogs

        - kind: ConditionGroup
          id: conditionGroup_wugqYZ
          conditions:
            - id: conditionItem_XN8zwO
              condition: =Topic.chosenAnimal = 'cr638_08252022.topic.Animal.main.question_b9p80Y'.d24VJv
              actions:
                - kind: SendMessage
                  id: sendMessage_mZoPeG
                  message: Meow!

            - id: conditionItem_VxJuyY
              condition: =Topic.chosenAnimal = 'cr638_08252022.topic.Animal.main.question_b9p80Y'.vXYBtP
              actions:
                - kind: SendMessage
                  id: sendMessage_zMgiKJ
                  message: Woof!

      id: main
      intent:
        displayName: Animal

    inputType: {}
    outputType: {}
    ```

1. Select the three dots icon, then select **Close code editor**. You'll see the new conversation path generated from the YAML on the authoring canvas.

    :::image type="content" source="media/authoring-create-edit-topics/code-editor-conversation.png" alt-text="Screenshot conversation created from YAML.":::
-->

## Test and publish your bot

[Test your bot](authoring-test-bot.md) when you make changes to your topics, to make sure that everything is working as expected.

After you've designed and tested your bot, [publish it to the web, mobile or native apps, or Microsoft Bot Framework channels](publication-fundamentals-publish-channels.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
