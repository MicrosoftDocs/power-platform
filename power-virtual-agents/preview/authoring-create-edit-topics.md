---
title: Create and edit topics (preview)
description: Use conversation topics in the Power Virtual Agents unified authoring canvas for an intuitive, no-code way to create a bot that can help answer user questions, perform actions, and solve issues in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 12/12/2022
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: clmori
ms.custom: authoring, topics, variables, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
searchScope:
  - "Power Virtual Agents"
---

# Create and edit topics (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

In Power Virtual Agents, a _topic_ represents some portion of a conversational thread between a user and a chatbot. You define and work with topics on an _authoring canvas_.

A topic contains one or more _conversation nodes_, which together define the conversational paths that that topic can take. Each node performs an action, such as sending a message or asking a question.

Often, a topic also has a set of _trigger phrases_&mdash;phrases, keywords, and questions that a customer is likely to use that are related to a specific issue. The Power Virtual Agents AI uses natural language understanding, your customer's message, and the trigger phrases for all your topics to find the most appropriate topic to trigger. The message doesn't need to exactly match a topic's trigger phrases to trigger the topic. For example, a topic about store hours might include the trigger phrase `check store hours`. If a customer sends, "see store opening hours," Power Virtual Agents can still trigger your store hours topic.

## Topic types

A bot can include two types of topics, _system_ and _custom_. Every new bot starts with a set of system and custom topics.

- _System_ topics are ones that support essential behaviors, such as a custom request to speak to a person or end the conversation. Some system topics have trigger phrases, which you can customize to fit your bot's needs.

  - You can't create system topics.
  - You can't delete system topics, but you can disable them.
  - You can make changes to system topics. However, until you're comfortable creating end-to-end bot conversations, you shouldn't edit the system topics.

  For more information, see [Use system topics](authoring-system-topics.md).

- _Custom_ topics cover common behaviors, such as greeting a customer, ending a conversation, or starting a conversation over.

  - You can make changes to the custom topics that your bot starts with or remove them from your bot entirely.
  - All topics that you create are custom topics.

## Create a topic

1. Open your bot and select **Topics**. On the **Topics** page, select **+ New topic**.

   :::image type="content" source="media/authoring-create-edit-topics/topics-menu.png" alt-text="Screenshot of the Power Virtual Agents navigation pane with Topics and the New topics button highlighted.":::

1. The **Trigger phrases** pane should already be open. If not, select the **Trigger phrases** node to open it.

    :::image type="content" source="media/authoring-create-edit-topics/trigger-phrases-button.png" alt-text="Screenshot of the topic authoring canvas with Trigger phrases highlighted.":::

1. Under **Add phrases**, type a trigger phrase for your topic.

    Your bot needs 5 to 10 trigger phrases to train the AI to understand your customers' responses. To add more trigger phrases, you can either:

    - Select the **+** button.
    - Paste a set of trigger phrases, each one on a separate line.
    - Type a set of trigger phrases, pressing Shift+Enter after each one to place it on a separate line.

    You can include punctuation in a trigger phrase, but it's best to use short phrases rather than long sentences.

1. Select **Details** to open the topic details pane.

    :::image type="content" source="media/authoring-create-edit-topics/open-details-pane.png" alt-text="Screenshot of the topic authoring canvas with Details highlighted.":::

1. Enter a **Name** for your topic and, optionally, a **Description**.

    - Use the name to identify the topic. The **Topics** page lists all the topics defined in your bot, by name.
      A customer might see the topic name if the bot can't determine which topic matches the customer's message.

    - The **Description** is never shown to users. Use it to describe the purpose of the topic for yourself and other bot makers on your team.

1. Select **Save** to save your changes and add the topic to the topics list.

## Design a topic conversation path

When you create a topic, a **Trigger phrases** node is inserted for you. Add more nodes to control the conversation.

1. Open your bot and select **Topics**, and then select a topic.

1. To add a node, select **Add node** (**+**) on the line or branch between or after a node.

   :::image type="content" source="media/authoring-create-edit-topics/handoff-add-node.png" alt-text="Screenshot of the Add node button in the Power Virtual Agents authoring canvas.":::

1. Select a node type to insert the node.

The following table lists the types of nodes you can insert in a topic:

| Option                                                            | Description                                           |
| :---------------------------------------------------------------- | :---------------------------------------------------- |
| [**Send a message**](authoring-send-message.md)                   | Send the customer a message.                         |
| [**Ask a question**](authoring-ask-a-question.md)                 | Ask the customer a question.                          |
| [**Add a condition**](authoring-using-conditions.md)              | Branch your conversation based on a condition.        |
| [**Set a variable value**](authoring-variables.md#set-a-variable) | Set a value for a new or existing variable.           |
| [**Topic management**](authoring-topic-management.md)             | Redirect, transfer, or end the topic or conversation. |
| [**Call an action**](advanced-flow.md)                            | Call a Power Automate flow.                           |

:::image type="content" source="media/authoring-create-edit-topics/topics-node-after-triggers.png" alt-text="Screenshot of node types to insert after a Trigger Phrases node.":::

### Delete a node

Select the node's Node Menu (**&vellip;**), and then select **Delete**.

:::image type="content" source="media/authoring-create-edit-topics/topics-delete.png" alt-text="Screenshot highlighting the Node Menu button and the Delete button.":::

### Controls for editing nodes on the canvas

You can use the authoring canvas toolbar to quickly rename the topic. Select the topic name in the toolbar, type the new name, and then press Enter.

:::image type="content" source="media/authoring-create-edit-topics/rename-topic-shortcut.png" alt-text="Screenshot of the topic authoring canvas with the topic name highlighted.":::

You can use controls on the toolbar to cut, copy, paste, and delete the selected node or selected adjacent nodes.

:::image type="content" source="media/authoring-create-edit-topics/toolbar-edit-controls.png" alt-text="Screenshot of the toolbar controls for editing nodes on the authoring canvas.":::

The toolbar also has a control for undo. Open the Undo menu to revert all actions back to the last save or to redo the previous action.

:::image type="content" source="media/authoring-create-edit-topics/undo-menu.png" alt-text="Screenshot of the Undo menu.":::

### Paste nodes

Once you've used the **Cut** or **Copy** tools to place one or more nodes on the clipboard, there are a couple of ways to paste them in the canvas:

- If you select a node and then select **Paste**, the nodes on the clipboard are inserted after the selected node.

- If you select the _Add node_ (**+**) menu and then select **Paste**, the nodes on the clipboard are inserted at that point.

## Edit topics with the code editor

The code editor shows the topic in [YAML](https://yaml.org/), a markup language that's easy to read and understand. Use the code editor to copy and paste topics from other bots, even ones created by other authors.

> [!IMPORTANT]
> Designing a topic entirely in the code editor and pasting complex topics isn't fully supported.

In this example, you'll copy and paste YAML into the code editor to quickly add a topic that asks the customer for shipping information.

1. On the **Topics** page, select **+ New topic**.

1. In the upper-right corner of the authoring canvas, select _More options_ (**&hellip;**), and then select **Open code editor**.

    :::image type="content" source="media/authoring-create-edit-topics/code-editor-open.png" alt-text="Screenshot of how to open the code editor.":::

1. Select and delete the contents of the code editor. Then copy and paste the following YAML code:

    ```yaml
    kind: AdaptiveDialog
    beginDialog:
      kind: OnRecognizedIntent
      id: main
      intent:
        displayName: Lesson 3 - A topic with a condition, variables and a pre-built entity
        triggerQueries:
          - Buy items
          - Buy online
          - Buy product
          - Purchase item
          - Order product
    
      actions:
        - kind: SendMessage
          id: Sjghab
          message: I am happy to help you place your order.
    
        - kind: Question
          id: eRH3BJ
          alwaysPrompt: false
          variable: init:Topic.State
          prompt: To what state will you be shipping?
          entity: StatePrebuiltEntity
    
        - kind: ConditionGroup
          id: sEzulE
          conditions:
            - id: pbR5LO
              condition: =Topic.State = "California" || Topic.State = "Washington" || Topic.State     = "Oregon"
    
          elseActions:
            - kind: SendMessage
              id: X7BFUC
              message: There will be an additional shipping charge of $27.50.
    
            - kind: Question
              id: 6lyBi8
              alwaysPrompt: false
              variable: init:Topic.ShippingRateAccepted
              prompt: Is that acceptable?
              entity: BooleanPrebuiltEntity
    
            - kind: ConditionGroup
              id: 9BR57P
              conditions:
                - id: BW47C4
                  condition: =Topic.ShippingRateAccepted = true
    
              elseActions:
                - kind: SendMessage
                  id: LMwySU
                  message: Thank you and please come again.
    ```

1. Select **Save**, and then select **Close code editor**.

    :::image type="content" source="media/authoring-create-edit-topics/code-editor-conversation.png" alt-text="Screenshot of a conversation created from YAML in the Power Virtual Agents code editor.":::

## Test and publish your bot

[Test your bot](authoring-test-bot.md) when you make changes to your topics, to make sure that everything is working as expected.

After you've designed and tested your bot, [publish it to the web, mobile or native apps, or Microsoft Bot Framework channels](publication-fundamentals-publish-channels.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
