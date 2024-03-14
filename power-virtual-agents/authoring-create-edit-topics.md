---
title: Use topics to design a copilot conversation
description: Use conversation topics in the Microsoft Copilot Studio authoring canvas for an intuitive, no-code way to create a copilot that can help answer user questions, perform actions, and solve issues.
keywords: "PVA"
ms.date: 1/2/2023
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: clmori
manager: leeclontz
ms.custom: authoring, topics, variables, ceX


---

# Create and edit topics in your Microsoft Copilot Studio copilot

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

In Copilot Studio, a topic defines a how a copilot conversation progresses.

To author topics, you can [customize provided templates](authoring-template-topics.md), create topics from scratch, or [get suggestions from existing help sites](advanced-create-topics-from-web.md).

In Copilot Studio, a _topic_ represents some portion of a conversational thread between a user and a copilot. You define and work with topics on an _authoring canvas_, which is the app itself. A topic contains one or more _conversation nodes_, which together define the conversational paths that a topic can take. Each node performs an action, such as sending a message or asking a question.

Often, a topic has a set of _trigger phrases_—phrases, keywords, and questions that a customer is likely to use that are related to a specific issue. The Copilot Studio AI uses natural language understanding, your customer's message, and the trigger phrases for all your topics to find the best topic to trigger. The message doesn't need to exactly match a topic's trigger phrases to trigger the topic. For example, a topic about store hours might include the trigger phrase `check store hours`. If a customer sends, "see store opening hours," Copilot Studio triggers your store hours topic.

## Natural language understanding

The AI uses natural language understanding (NLU) to parse what a customer typed and find the best trigger phrase or node.

For example, a user might type "Open hours" into your copilot. The AI matches that to the **Store hours** topic, begins a conversation that asks which store the customer is interested in, and then displays the hours the store is open.

The **Test copilot** pane shows how the copilot conversation progresses at every step. You can use the **Test copilot** pane to fine-tune a topic without having to exit the Copilot Studio portal.

For copilot and topic limits, see [Quotas, limits, and configuration values](requirements-quotas.md).

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- An existing copilot. To create one, see [Quickstart: Create and deploy a Microsoft Copilot Studio copilot](fundamentals-get-started.md).

## Topics

# [Web app](#tab/webApp)

### Topic types

A copilot can include two types of topics, _system_ and _custom_. Every new copilot starts with a set of system and custom topics.

- _System_ topics support essential behaviors, such as a custom request to speak to a person or end the conversation. Some system topics have trigger phrases, which you can customize to fit your copilot's needs.

  - You can't create system topics.
  - You can't delete system topics, but you can disable them.
  - You can make changes to system topics. However, until you're comfortable creating end-to-end copilot conversations, we don't recommend editing the system topics.

  For more information, see [Use system topics](authoring-system-topics.md).

- _Custom_ topics cover common behaviors, such as greeting a customer, ending a conversation, or restarting conversation.

  - You can make changes to the starting custom topics or remove them from your copilot entirely.
  - All topics that you create are custom topics.

### Create a topic

1. Open your copilot from the list on the **Copilot** page. For better visibility,  close the **Test copilot** window for now.

1. From the **Topics & Plugins** page, select **+ Add** > **Topic** > **From blank**.

   :::image type="content" source="media/authoring-create-edit-topics/topics-menu.png" alt-text="Screenshot of the Copilot Studio Topics & Plugins page with +Add highlighted.":::

1. On the **Trigger** node, select **Edit** under **Phrases** twice to see the **Add phrases** section.

    :::image type="content" source="media/authoring-create-edit-topics/edit-phrases.png" alt-text="Screenshot of the topic authoring canvas showing the Trigger node and the Add phrases section." lightbox="media/authoring-create-edit-topics/edit-phrases.png":::

1. Under **Add phrases**, enter text to add a trigger phrase for your topic.

    Your copilot needs 5 to 10 trigger phrases to train the AI to understand your customers' responses. To add more trigger phrases, you can either:

    - Select the "**+**" next to the text field.
    - Paste a set of trigger phrases, each one on a separate line.
    - Type a set of trigger phrases, pressing **Shift**+**Enter** after each one to place it on a separate line.
    - Select **Enter** to complete adding the phrase(s).

    You can include punctuation in a trigger phrase, but it's best to use short phrases rather than long sentences.

1. Select **Details** to open the **Topic details** pane.

   :::image type="content" source="media/authoring-create-edit-topics/details-pane.png" alt-text="Screenshot of the topic authoring canvas with Details highlighted.":::

1. Add your copilot topic details:

    - Add a **Name** to identify the topic, such as "Store hours". The **Topics** page lists all the topics defined in your copilot, by this name.
      A customer might see the topic name if the copilot can't determine which topic matches the customer's message.

    - The **Description** is never shown to users. Use it to describe the purpose of the topic for yourself and other copilot makers on your team.

1. Select **Save** at the top of the page to save your changes and add the topic to the topics list.

### Design a topic conversation path

When you create a topic, a **Trigger** node is inserted for you on the **Topics & Plugins** page. You can add more nodes to control the conversation.

1. Select a topic from the **Topics & Plugins** page of your copilot.

1. Select the "**+**" to add another node, which might be shown before or after any node. The locations you can add a node give you flexibility to edit any part of a conversation.

   :::image type="content" source="media/authoring-create-edit-topics/handoff-add-node.png" alt-text="Screenshot of the Add node button in the Microsoft Copilot Studio authoring canvas.":::

1. Select a node type to insert the node.

   Here are the types of nodes you can insert in a topic:

   | Option | Description |
   | --- | --- |
   | [Send a message](authoring-send-message.md) | Send the customer a message. |
   | [Ask a question](authoring-ask-a-question.md) | Ask the customer a question. |
   | [Ask with adaptive card](authoring-send-message.md#add-an-adaptive-card) | Create a JSON snippet to exchange with other apps. |
   | [Add a condition](authoring-using-conditions.md) | Branch your conversation based on a condition. |
   | [Variable management](authoring-variables.md#set-a-variable) | Set a value or parse a new or existing variable. |
   | [Topic management](authoring-topic-management.md) | Redirect, transfer, or end the topic or conversation. |
   | [Call an action](advanced-flow-create.md) | Call a flow like Power Automate or Excel Online. |
   | Advanced| [Generative answers](nlu-boost-conversations.md), [HTTP requests](authoring-http-node.md), [events](authoring-send-event-activities.md), and more. |

   :::image type="content" source="media/authoring-create-edit-topics/topics-node-after-triggers.png" alt-text="Screenshot of node types to insert after a Trigger node.":::

### Add a question node

The **Question** node can prompt a user for information and store their response in a variable for use later in the conversation.

The node allows you to choose the type of information to collect, such as a multiple-choice answer, a prebuilt entity, or a custom entity. [Question behavior properties](#configure-question-behavior) allow you to control the behavior of the node, such as what to do when the user enters an invalid response.

Just like **Message** nodes, **Question** nodes can include images, videos, cards, quick replies, and message variations. For more information, see [Send a message](authoring-send-message.md).

Here's how to build a **Question** node:

1. Select the "**+**" on any node, then select **Ask a question**. The **Question** node form appears.

   :::image type="content" source="media/authoring-ask-a-question/topics-question.png" alt-text="Screenshot of a new Question mode.":::

1. In the **Enter a message** box, type the question you want to ask.

1. Select the menu under **Identify**, then either create or select an option. Your chosen entity determines what the copilot should listen for in the user's response. For more information on entities, see [Learn how to use entities in a conversation](advanced-entities-slot-filling.md#use-entities-in-a-conversation).

1. Depending which **Identify** option you selected, you may have more properties you need to set.

   For example, if you choose **Multiple choice options**, select **+ New option** under **Options for user** to add choices the user can select. Each choice is presented as a multiple-choice button in a conversation, but users can also type their answers.

1. Select the variable name under **Save response as** and change the name of the default variable to something meaningful, like **customerName** or **bookingDate**. You can set the scope of the variable in the **Variable properties** pane as well.

   :::image type="content" source="media/authoring-ask-a-question/question-variable-button.png" alt-text="Screenshot of a new variable created for a Question node.":::

### Configure question behavior

Question behavior properties allow you to control how the copilot responds to an invalid response or how it validates user input.

1. On the **Question** node, select the `...` to see the the _Node Menu_, and then select **Properties**. The **Question properties** pane appears.

1. In the **Question properties** pane, select **Question behavior** to open the **Question behavior** pane.

   :::image type="content" source="media/authoring-ask-a-question/properties-pane.png" alt-text="Screenshot of properties pane.":::

The **Question behavior** pane is where you can adjust behaviors like prompts, validations, and interruptions. Let's examine a few behaviors.

#### Skip behavior

**Skip behavior** determines what the copilot should do if the question node's variable already has a value from earlier in the conversation.

- **Allow question to be skipped**: Skip the question if the variable has a value.
- **Ask every time**: Ask the question even if the variable has a value.

#### Reprompt

**Reprompt** determines how your copilot reacts if it doesn't get a valid answer from the user. You can tell it to try again once, twice, or move on without getting an answer. To customize what your copilot does when it moves on, see [No valid entity found](#no-valid-entity-found) in the **Question behavior** pane. You can also change the prompt to give the user more context.

- **How many reprompts**: The number of times your copilot tries to get a valid answer. **Repeat up to 2 times** is the default. You can also select **Repeat once** or **Don't repeat**.

- **Retry prompt**: To change the message, select **Customize**, and then enter the new prompt.

#### Entity validation

By default, the **Question** node checks for a valid response based only on the entity you selected. **Additional entity validation** allows you to add criteria to the basic test. For example, the **Question** node accepts any numeric value when it identifies a number, but you might want to set it to less than 10. You can also change the prompt to help the user enter a valid response.

- **Condition**: Enter a Power Fx formula that returns a boolean value (`true` or `false`); for example, `Topic.Var1 < 10`

- **Condition not met prompt**: When the condition isn't met, you can provide a message. Select **Customize** and enter the new prompt.

#### No valid entity found

**No valid entity found** determines what happens when your copilot stops trying to get a valid response from the user. You can escalate to a human agent or provide a default value. You can also change the prompt to let the user know.

- **Action if no entity found**:

  - **Escalate**: Redirect the user to the _Escalate_ system topic. Escalate is the default.
  - **Set variable to value**: Set the output variable to a value and move on to the next node. Enter or select the value in **Default entity value**.
  - **Set variable to empty (no value)**: Set the output variable to `Blank` and move on to the next node. You can use a [**Condition**](authoring-using-conditions.md) node later to check whether the variable has a value.

- **No entity found message**: To change the message, select **Customize**, and then enter the new prompt.

#### Interruptions

**Interruptions** determine whether the user can switch to a different topic during the question.

- **Allow switching to another topic**: The user can abandon the question for a new topic.

### Delete a node

Select the `...` to see the _Node Menu_, and then select **Delete**.

:::image type="content" source="media/authoring-create-edit-topics/topics-delete.png" alt-text="Screenshot highlighting the Node Menu button and the Delete button.":::

### Controls for editing nodes on the canvas

You can use the authoring canvas toolbar to quickly rename the topic. Select the topic name in the toolbar, type the new name, then press Enter.

:::image type="content" source="media/authoring-create-edit-topics/rename-topic-shortcut.png" alt-text="Screenshot of the topic authoring canvas with the topic name highlighted.":::

You can use controls on the toolbar to cut, copy, paste, and delete the selected node or selected adjacent nodes.

:::image type="content" source="media/authoring-create-edit-topics/toolbar-edit-controls.png" alt-text="Screenshot of the toolbar controls for editing nodes on the authoring canvas.":::

The toolbar also has a control to undo an edit. Open the **Undo** menu to revert all actions back to the last save or to redo the previous action.

:::image type="content" source="media/authoring-create-edit-topics/undo-menu.png" alt-text="Screenshot of the Undo menu.":::

### Paste nodes

Once you use the **Cut** or **Copy** tools to place one or more nodes on the clipboard, there are two ways to paste them in the canvas:

- If you select a node and then select **Paste**, the nodes on the clipboard are inserted after the selected node.

- If you select the "**+**" to see the _Add node_ menu, then select **Paste**, the node on the clipboard is inserted at that location.

### Edit topics with the code editor

The code editor shows the topic in [YAML](https://yaml.org/), a markup language that's easy to read and understand. Use the code editor to copy and paste topics from other bots, even ones created by other authors.

> [!IMPORTANT]
> Designing a topic entirely in the code editor and pasting complex topics isn't fully supported.

In this example, you copy and paste YAML into the code editor to quickly add a topic that asks the customer for shipping information.

1. On the **Topics** page, select **+ New topic**.

1. In the upper-right corner of the authoring canvas, select the `...` to see _More options_, then select **Open code editor**.

   :::image type="content" source="media/authoring-create-edit-topics/code-editor-open.png" alt-text="Screenshot of how to open the code editor.":::

1. Select and delete the contents of the code editor. Then copy and paste the following YAML code:

    ```yaml
    kind: AdaptiveDialog
    beginDialog:
      kind: OnRecognizedIntent
      id: main
      intent:
        displayName: Lesson 3 - A topic with a condition, variables and a prebuilt entity
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

1. Select **Save**, and then select **Close code editor**. The **Question** node now has many conditions to the question about shipping.

   :::image type="content" source="media/authoring-create-edit-topics/code-editor-conversation.png" alt-text="Screenshot of a conversation created from YAML in the Microsoft Copilot Studio code editor." lightbox="media/authoring-create-edit-topics/code-editor-conversation.png":::

### Test and publish your copilot

[Test your copilot](authoring-test-bot.md) when you make changes to your topics, to make sure everything works as expected.

After you design and test your copilot, [publish it to the web, mobile or native apps, or Microsoft Bot Framework channels](publication-fundamentals-publish-channels.md).

# [Classic](#tab/classic)

### Use system and sample topics

When you create a bot, several topics are created for you.

:::image type="content" source="media/authoring-create-edit-topics/topics-system.png" alt-text="Screenshot of the Topics list showing lesson topics and system topics." lightbox="media/authoring-create-edit-topics/topics-system.png":::

These automatically created topics fall into two categories:
  
- [Lesson topics](authoring-template-topics.md) help you understand simple to complex ways to use nodes to create bot conversations.

    You can edit lesson topics or delete them entirely.

- [System topics](authoring-system-topics.md) are topics you're likely to need during a bot conversation.

    You can't delete or disable system topics or edit their trigger phrases. However, you can customize the nodes on the authoring canvas. We recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

### Create a topic

1. From the navigation menu, select **Topics**, then **+ New topic**, then **From blank**.

   The **Trigger phrases** pane opens.

1. Add several trigger phrases for your topic in the **Add phrases** section.

    :::image type="content" source="media/authoring-create-edit-topics/topics-details-triggers.png" alt-text="Screenshot of the topic authoring canvas, highlighting Add phrases of the Trigger phrases pane." lightbox="media/authoring-create-edit-topics/topics-details-triggers.png":::

    You can specify more than one trigger phrase for a topic, using a new line for each phrase. You can include punctuation in a trigger phrase, but it's best to use short phrases rather than long sentences.

1. In the top bar, edit the title of your topic to give it a name.

    :::image type="content" source="media/authoring-create-edit-topics/name-your-topic-classic.png" alt-text="Screenshot of the topic authoring canvas, highlighting Details.":::

1. Press **Enter**  or select the **Save** icon to save your changes.

1. Select the **Details** icon. Here you can alternatively edit the **Name** and add a **Display name** and **Description**.

   The **Display name** tells the bot which topic the person is asking about.

   The **Description** describes the purpose of the topic for yourself and other bot makers. This description isn't shown to users.

    :::image type="content" source="media/authoring-create-edit-topics/details-pane.png" alt-text="Screenshot of the topic details pane showing Name, Display name, and Description." lightbox="media/authoring-create-edit-topics/details-pane.png":::

1. Select **Save** to add the topic to the topics list.

### Design the topic's conversation path

1. In the topic list, select the topic you want to edit. You see the topic's trigger phrases. Here you define the conversation path between a customer and the copilot.

    For existing or system topics, several nodes are created automatically. You can edit these nodes just as you would edit other nodes.

    When you create a new topic, a **Trigger Phrases** node and a blank **Message** node are inserted for you.

1. To add a node, select "**+**", _Add node_, located between or after nodes.

   :::image type="content" source="media/authoring-create-edit-topics/handoff-add-node.png" alt-text="Screenshot of adding a node.":::

1. To change the paths between nodes, drag the small circle on top of the node—its node anchor—to a new location in the canvas. The dotted line represents the original path.

   :::image type="content" source="media/authoring-create-edit-topics/move-anchor-node.png" alt-text="Screenshot of moving a node's anchor.":::

### Insert nodes

When you add a node after the **Trigger Phrases** node or between **Message** nodes, you can:

- Ask a question
- Call an action
- Show a message
- Redirect to another topic
- End the conversation

:::image type="content" source="media/authoring-create-edit-topics/topics-node-options.png" alt-text="Screenshot of adding a node between existing nodes from the options.":::

#### Ask a question

1. Select the **Ask a question** option of the "**+**" _Add node_ menu to add a new **Question** node. A question node appears.

   :::image type="content" source="media/authoring-create-edit-topics/topics-question.png" alt-text="Screenshot of adding a new question mode.":::

1. Enter the question phrase in the **Ask a question** field.

   For example, if the user wants to know store hours, the bot's question might be _Which store location do you need?_

1. Under **Identify**, select an option for the user's response, such as **Multiple choice options**.

   This option determines what the bot should listen for when the user responds. For more information, see [Use entities in a conversation](advanced-entities-slot-filling.md#use-entities-in-a-conversation).

1. Under **Options for user**, enter expected responses to the bot's question.

   For example, if you chose **Multiple choice options** in **Identify**, the options might include store locations such as _Seattle_, _Bellevue_, or _Kirkland_.

   :::image type="content" source="media/authoring-create-edit-topics/adding-options-for-question-node.png" alt-text="Screenshot of possible options for the user based on the multiple choice selection in Identify.":::

   Each choice is presented to the user as a multiple choice button in the chat, but users can also type their answer.

1. (Optional) [Save the user response in a variable](authoring-variables.md) to be used later.

The conversation editor creates separate paths in the conversation depending on the customer's response. The conversation path leads the customer to the appropriate resolution for each response. You can add nodes to create branching logic, and specify what the bot should respond with for each path or variable.

#### Call an action

To [call Power Automate Flows](advanced-flow.md) and [insert authentication nodes](advanced-end-user-authentication.md), select **Call an action** from the "+" _Add node_ menu.

If voice-based capabilities are enabled for your bot, you see [more actions](configuration-hand-off-omnichannel.md#voice-based-capabilities).

#### Show a message

1. To specify a response from the bot, select the "**+**" _Add node_ to add a node, and then select **Show a message** to add a new **Message** node.

1. Enter the message you want the bot to say in the text box.

    You can apply some basic formatting, such as bold, italics, ordered and unordered lists, and hyperlinks. You can also [use variables](authoring-variables.md) that you define elsewhere in your bot conversation.

#### Redirect to another topic

1. To have the bot move to a different topic, select the "**+**" _Add node_ to add a node, and then select **Redirect to another topic**. A list of topics appears.

1. Select the topic the bot should divert to. For example, you might send the user to a topic about the closure of a store if they ask about the store's hours.

   :::image type="content" source="media/authoring-create-edit-topics/topics-nodes-other-topic-flyout.png" alt-text="Screenshot showing redirection to another topic node with options for other topics.":::

The redirected topic is a subtopic.

You can insert more nodes under the subtopic's node.

When the conversation path for the subtopic is finished, the bot returns to the original topic. The bot then follows the nodes that are under the subtopic's node.

:::image type="content" source="media/authoring-create-edit-topics/authoring-subtopic-redirect.png" alt-text="Screenshot of the authoring canvas showing nodes under a redirected topic node.":::

If you redirect to any of these [system topics](authoring-system-topics.md), however, the entire conversation ends.

- End of Conversation
- Confirmed Success
- Confirmed Failure
- Goodbye
- Escalate
- Start over (also resets any [global variables](authoring-variables-bot.md))

#### End the conversation

When the conversation ends, you can have a survey ask users if their question or issue was answered or resolved. The response is collected on the [customer satisfaction analytics page](analytics-csat.md).

You can also have the conversation [handed over to a live agent](advanced-hand-off.md) if you're using a suitable customer service portal, such as Omnichannel for Customer Service.

1. At the end of a response that resolves the user's issue or answers the question, add an **End the conversation** node.

    :::image type="content" source="media/authoring-create-edit-topics/topics-nodes-end.png" alt-text="Screenshot showing options for ending a conversation.":::

    - To end with a customer satisfaction survey, select **End with survey**.

    - To insert a hand-off node that links with your [configured hand-off product](configuration-hand-off-omnichannel.md), select **Transfer to agent**.

        (Optional) Enter a private message to the agent.

        :::image type="content" source="media/authoring-create-edit-topics/topics-nodes-handoff.png" alt-text="Transfer To Agent." border="false":::

#### Add a condition

1. To add branching logic based on [variables](authoring-variables.md), select the "**+**" _Add node_ to add a node.
1. Select **Add a condition**.
1. Select **Branch based on a condition**.
1. Select the variable that determines whether the bot conversation should branch at this point.

   For example, if you set up [user authentication](advanced-end-user-authentication.md), you might want a different message if the user is signed in.

### Delete nodes

Select the `...` menu of your node and then select **Delete**.

:::image type="content" source="media/authoring-create-edit-topics/topics-delete.png" alt-text="Screenshot highlighting the node menu button and the Delete button.":::

### Test and publish your bot

[Test your bot](authoring-test-bot.md) when you make changes to your topics to insure everything works as expected.

After you design and test your bot, [publish it to the web, mobile or native apps, or Microsoft Bot Framework channels](publication-fundamentals-publish-channels.md).

# [Teams](#tab/teams)

### Design the topic's conversation path - Teams

1. In the topic list of your copilot, select the topic you want to edit. For example, you might want to edit the topic _Store Hours_.

   :::image type="content" source="media/authoring-create-edit-topics/topics-details-canvas-teams.png" alt-text="Selecting a topic will take you to the authoring canvas":::

   Once open, you see the topic's trigger phrases. This authoring canvas is where you define the conversation path between a customer and the bot.

   When you create a new topic, a **Trigger Phrases** node and a blank **Message** node are inserted for you.

   For existing or system topics, several nodes are automatically created with each new topic. You can edit these nodes if needed.

1. You can add more nodes by selecting "**+**" _Add node_ between nodes or after a node.

   :::image type="content" source="media/authoring-create-edit-topics/handoff-add-node-teams.png" alt-text="Screenshot of adding a node." border="false":::

1. To change the paths between nodes, drag the node anchor—a small circle on top of the node. You see a dotted line indicating the original path.

   :::image type="content" source="media/authoring-create-edit-topics/move-anchor-node.png" alt-text="Screenshot of moving a node's anchor.":::

### Insert nodes - Teams

When adding a node to a trigger phrases node, choose from five different options:

- **Ask a question**
- **Call an action**
- **Show a message**
- **Redirect to another topic**
- **End the conversation**

:::image type="content" source="media/authoring-create-edit-topics/topics-nodes-teams.png" alt-text="Screenshot that shows the five options available when you add a node to the trigger phrases node.":::

If you want to redirect a topic, you can go to another topic.

:::image type="content" source="media/authoring-create-edit-topics/topics-nodes-other-topic-flyout.png" alt-text="Go to another topic.":::

#### Ask a question - Teams

1. Select the **Ask a question** option of the "**+**" _Add node_ menu to add a new **Question** node. A question node appears.

   :::image type="content" source="media/authoring-create-edit-topics/topics-question.png" alt-text="Screenshot of adding a new question mode.":::

1. Enter the question phrase in the **Ask a question** field.

   For example, if the user wants to know store hours, the bot's question might be _Which store location do you need?_

1. Under **Identify**, select an option for the user's response, such as **Multiple choice options**.

   This option determines what the bot should listen for when the user responds. For more information, see [Use entities in a conversation](advanced-entities-slot-filling.md#use-entities-in-a-conversation).

1. Under **Options for user**, enter expected responses to the bot's question.

   For example, if you chose **Multiple choice options** in **Identify**, the options might include store locations such as _Seattle_, _Bellevue_, or _Kirkland_.

   :::image type="content" source="media/authoring-create-edit-topics/adding-options-for-question-node.png" alt-text="Screenshot of possible options for the user based on the multiple choice selection in Identify.":::

   Each choice is presented to the user as a multiple choice button in the chat, but users can also type their answer.

1. (Optional) [Save the user response in a variable](authoring-variables.md) to be used later.

The conversation editor creates separate paths in the conversation depending on the customer's response. The conversation path leads the customer to the appropriate resolution for each response. You can add nodes to create branching logic, and specify what the bot should respond with for each path or value.

#### Add a condition - Teams

On some node types, you can add a condition.

1. To add branching logic based on [variables](authoring-variables.md), select the "**+**" _Add node_ menu, then select **Add a condition** to add a new node. A couple of condition nodes appear.

1. Choose the variable you want to use to determine if the bot conversation should branch at this point.

   :::image type="content" source="media/authoring-create-edit-topics/topics-branch-teams.png" alt-text="Screenshot that shows two condition nodes where you can choose a variable.":::

#### Call an action - Teams

You can [call Power Automate Flows](advanced-flow.md) by selecting **Call an action** in the "**+**" _Add node_ menu.

:::image type="content" source="media/authoring-create-edit-topics/call-an-action.png" alt-text="Screenshot that shows how to call an action when adding a new node.":::

#### Show a message - Teams

A message can specify a response from your bot to the user.

1. Select the "**+**" _Add node_ menu, then select **Show a message** to add a new **Message** node.

1. Enter what you want the bot to say in the text box. You can apply some basic formatting, such as bold, italics, ordered and unordered lists, and hyperlinks.

   You can also [use variables that you defined elsewhere](authoring-variables.md) in your bot conversation.

#### End the conversation - Teams

You can choose to **End the conversation** as a final node to your bot's conversation.

There are two options:

1. **End with survey** shows a survey that asks the user if their question or issue was answered or resolved correctly. This information is collected under the [customer satisfaction analytics page](analytics-csat.md).

    :::image type="content" source="media/authoring-create-edit-topics/end-with-survey.png" alt-text="End with survey." border="false":::

1. **Transfer to agent** allows you to type a private message to an agent that initiates their contact with the user.

#### Redirect to another topic - Teams

1. To automatically have the bot move to a separate topic, select **Add node** (**+**) to add a node, and then **Redirect to another topic**.

1. In the flyout menu, select the topic the bot should divert to. For example, you might want to send the user to a specific topic about the closure of a store if they ask about store hours for that store.

    :::image type="content" source="media/authoring-create-edit-topics/topics-nodes-other-topic-flyout-teams.png" alt-text="Go to another topic node with options for other topics.":::

When the bot goes to another topic, the bot goes through the conversation path for that topic and then returns to the original topic—the place where it left.

You can consider the redirected topic as a subtopic.

:::image type="content" source="media/authoring-create-edit-topics/authoring-subtopic-redirect-teams.png" alt-text="Screenshot of the authoring canvas showing nodes under a redirected topic node.":::

If you redirect to any of the following [system topics](authoring-system-topics.md), however, the entire conversation ends:

- Start over (resets any [global variables](authoring-variables-bot.md))
- Escalate
- End of Conversation
- Confirmed Failure
- Confirmed Success
- Goodbye

#### Use variables

You can [use variables that you defined elsewhere](authoring-variables.md) in your bot conversation.

### Delete nodes - Teams

Select the `...` menu of your node and then select **Delete**.

:::image type="content" source="media/authoring-create-edit-topics/topics-delete-teams.png" alt-text="Select the menu icon and then the delete button." border="false":::

### Test and publish your bot - Teams

After you make changes to your topics, [Test your bot](authoring-test-bot.md) to ensure everything is working as expected.

Once you finish designing and testing your bot, you can [publish it](publication-fundamentals-publish-channels.md), so other team members can use it.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
