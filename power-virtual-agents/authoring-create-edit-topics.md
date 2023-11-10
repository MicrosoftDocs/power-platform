---
title: Use topics to design a chatbot conversation
description: Use conversation topics in the Microsoft Copilot Studio authoring canvas for an intuitive, no-code way to create a bot that can help answer user questions, perform actions, and solve issues.
keywords: "PVA"
ms.date: 03/24/2023
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: clmori
manager: leeclontz
ms.custom: authoring, topics, variables, ceX
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

# Create and edit topics in your Microsoft Copilot Studio bot

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

In Microsoft Copilot Studio, a topic defines a how a bot conversation plays out.

To author topics, you can [customize provided templates](authoring-template-topics.md), create topics from scratch, or [get suggestions from existing help sites](advanced-create-topics-from-web.md).

In Microsoft Copilot Studio, a _topic_ represents some portion of a conversational thread between a user and a chatbot. You define and work with topics on an _authoring canvas_. A topic contains one or more _conversation nodes_, which together define the conversational paths that that topic can take. Each node performs an action, such as sending a message or asking a question.

Often, a topic also has a set of _trigger phrases_&mdash;phrases, keywords, and questions that a customer is likely to use that are related to a specific issue. The Microsoft Copilot Studio AI uses natural language understanding, your customer's message, and the trigger phrases for all your topics to find the most appropriate topic to trigger. The message doesn't need to exactly match a topic's trigger phrases to trigger the topic. For example, a topic about store hours might include the trigger phrase `check store hours`. If a customer sends, "see store opening hours," Microsoft Copilot Studio can still trigger your store hours topic.

## Natural language understanding
 
The AI uses natural language understanding (NLU) to parse what a customer typed and find the most appropriate trigger phrase or node.

For example, a user might type "Open hours" into your bot. The AI matches that to the **Store hours** topic, begins a conversation that asks which store the customer is interested in, and then displays the hours the store is open.

The **Test bot** pane shows how the bot conversation plays out at every step. You can use the **Test bot** pane to fine-tune a topic without having to exit the Microsoft Copilot Studio portal.

For bot and topic limits, see [Quotas, limits, and configuration values](requirements-quotas.md).

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


# [Web app](#tab/webApp)

### Topic types

A bot can include two types of topics, _system_ and _custom_. Every new bot starts with a set of system and custom topics.

- _System_ topics are ones that support essential behaviors, such as a custom request to speak to a person or end the conversation. Some system topics have trigger phrases, which you can customize to fit your bot's needs.

  - You can't create system topics.
  - You can't delete system topics, but you can disable them.
  - You can make changes to system topics. However, until you're comfortable creating end-to-end bot conversations, you shouldn't edit the system topics.

  For more information, see [Use system topics](authoring-system-topics.md).

- _Custom_ topics cover common behaviors, such as greeting a customer, ending a conversation, or starting a conversation over.

  - You can make changes to the custom topics that your bot starts with or remove them from your bot entirely.
  - All topics that you create are custom topics.

### Create a topic

1. Open your bot and select **Topics**. On the **Topics** page, select **+ New topic**.

   :::image type="content" source="media/authoring-create-edit-topics/topics-menu.png" alt-text="Screenshot of the Microsoft Copilot Studio navigation pane with Topics and the New topics button highlighted.":::

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

### Design a topic conversation path

When you create a topic, a **Trigger phrases** node is inserted for you. Add more nodes to control the conversation.

1. Open your bot and select **Topics**, and then select a topic.

1. To add a node, select **Add node** (**+**) on the line or branch between or after a node.

   :::image type="content" source="media/authoring-create-edit-topics/handoff-add-node.png" alt-text="Screenshot of the Add node button in the Microsoft Copilot Studio authoring canvas.":::

1. Select a node type to insert the node.

The following table lists the types of nodes you can insert in a topic:

| Option | Description |
| --- | --- |
| [**Send a message**](authoring-send-message.md) | Send the customer a message. |
| [**Add a condition**](authoring-using-conditions.md) | Branch your conversation based on a condition. |
| [**Set a variable value**](authoring-variables.md#set-a-variable) | Set a value for a new or existing variable. |
| [**Topic management**](authoring-topic-management.md) | Redirect, transfer, or end the topic or conversation. |
| [**Call an action**](advanced-flow.md) | Call a Power Automate flow. |

:::image type="content" source="media/authoring-create-edit-topics/topics-node-after-triggers.png" alt-text="Screenshot of node types to insert after a Trigger Phrases node.":::

### Add a question node

The **Question** node allows you to prompt a user for information and store their response in a variable for use later on in the conversation.

The node allows you to choose the type of information to collect, such as a multiple-choice answer, a prebuilt entity, or a custom entity. [Question behavior properties](#configure-question-behavior) allow you to control the behavior of the node, such as what to do when the user enters an invalid response.

Just like **Message** nodes, **Question** nodes can include images, videos, cards, quick replies, and message variations. For more information, see [Send a message](authoring-send-message.md).

1. Select **Add node** (**+**), and then select **Ask a question**.

   :::image type="content" source="media/authoring-ask-a-question/topics-question.png" alt-text="Screenshot of a new Question mode.":::

1. In the **Enter a message** box, type the question you want to ask.

1. Select the box under **Identify**, then either create or select an entity to determine what the bot should listen for in the user's response. [Learn how to use entities in a conversation](advanced-entities-slot-filling.md#use-entities-in-a-conversation).

1. Depending which **Identify** option you selected, you may have more properties you need to set.

   For example, for **Multiple choice options**, you need to enter the choices the user can specify in **Options for user**. Each choice is presented as a multiple-choice button, but users can also type their answers.

1. Select the box under **Save response as** and change the name of the default variable to something meaningful, like **customerName** or **bookingDate**.

    To choose a different variable, select **>**, and then select a variable.

    :::image type="content" source="media/authoring-ask-a-question/question-variable-button.png" alt-text="Screenshot of a new variable created for a Question node.":::

### Configure question behavior

Question behavior properties allow you to control other aspects of the **Question** node, such as how the bot responds to an invalid response or how it validates user input.

1. On the **Question** node, select the _Node Menu_ (**&vellip;**), and then select **Properties**.

1. In the **Question properties** pane, select **Question behavior**.

    :::image type="content" source="media/authoring-ask-a-question/properties-pane.png" alt-text="Screenshot of properties pane.":::

    The **Question behavior** pane opens.

    :::image type="content" source="media/authoring-ask-a-question/question-properties.png" alt-text="Screenshot of the Microsoft Copilot Studio Question behavior pane.":::

#### Skip behavior

**Skip behavior** determines what the bot should do if the question node's variable already has a value from earlier in the conversation.

- **Allow question to be skipped**: Skip the question if the variable has a value.
- **Ask every time**: Ask the question even if the variable has a value.

#### Reprompt

**Reprompt** determines how your bot will react if it doesn't get a valid answer from the user. You can tell it to try again once, twice, or move on without getting an answer. To customize what your bot does when it moves on, see [No valid entity found](#no-valid-entity-found). You can also change the prompt to give the user more context.

- **How many reprompts**: The number of times your bot tries to get a valid answer. **Repeat up to 2 times** is the default. You can also select **Repeat once** or **Don't repeat**.

- **Retry prompt**: To change the message, select **Customize**, and then enter the new prompt.

#### Additional entity validation

By default, the **Question** node checks for a valid response based only on the entity you selected. **Additional entity validation** allows you to add criteria to the basic test. For example, the **Question** node accepts any numeric value when it identifies a number, but you might want to make sure it's less than 10. You can also change the prompt to help the user enter a valid response.

- **Condition**: Enter a Power Fx formula that returns a boolean value (`true` or `false`); for example, `Topic.Var1 < 10`

- **Condition not met prompt**: To change the message, select **Customize**, and then enter the new prompt.

#### No valid entity found

**No valid entity found** determines what happens when your bot stops trying to get a valid response from the user. You can escalate to a human agent or provide a default value for now. You can also change the prompt to let the user know.

- **Action if no entity found**:

  - **Escalate**: Redirect the user to the _Escalate_ system topic. This is the default.
  - **Set variable to value**: Set the output variable to a value and move on to the next node. Enter or select the value in **Default entity value**.
  - **Set variable to empty (no value)**: Set the output variable to `Blank` and move on to the next node. You can use a [**Condition**](authoring-using-conditions.md) node later to check whether the variable has a value.

- **No entity found message**: To change the message, select **Customize**, and then enter the new prompt.

#### Interruptions

**Interruptions** determines whether the user can switch to a different topic during the question.

- **Allow switching to another topic**: The user can abandon the question for a new topic.

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

### Edit topics with the code editor

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

1. Select **Save**, and then select **Close code editor**.

    :::image type="content" source="media/authoring-create-edit-topics/code-editor-conversation.png" alt-text="Screenshot of a conversation created from YAML in the Microsoft Copilot Studio code editor.":::

### Test and publish your bot

[Test your bot](authoring-test-bot.md) when you make changes to your topics, to make sure that everything is working as expected.

After you've designed and tested your bot, [publish it to the web, mobile or native apps, or Microsoft Bot Framework channels](publication-fundamentals-publish-channels.md).


# [Classic](#tab/classic)

### Use system and sample topics

When you create a bot, several topics are created for you.

:::image type="content" source="media/authoring-create-edit-topics/topics-system.png" alt-text="Screenshot of the Topics list showing lesson topics and system topics.":::

These automatically created topics fall into two categories:
  
- [Lesson topics](authoring-template-topics.md) help you understand simple to complex ways to use nodes to create bot conversations.

    You can edit lesson topics or delete them entirely.

- [System topics](authoring-system-topics.md) are topics you're likely to need during a bot conversation.

    You can't delete or disable system topics or edit their trigger phrases. However, you can customize the nodes on the authoring canvas. We recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

### Create a topic

1. In the navigation menu, select **Topics**.

   :::image type="content" source="media/authoring-create-edit-topics/topics-menu-teams.png" alt-text="Screenshot of the Microsoft Copilot Studio navigation pane, highlighting Topics.":::

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

### Design the topic's conversation path

1. In the topic list, select the topic you want to edit.

    Microsoft Copilot Studio opens the topic in the authoring canvas and displays the topic's trigger phrases. The authoring canvas is where you define the conversation path between a customer and the bot.

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

### Test and publish your bot

[Test your bot](authoring-test-bot.md) when you make changes to your topics, to make sure that everything is working as expected.

After you've designed and tested your bot, [publish it to the web, mobile or native apps, or Microsoft Bot Framework channels](publication-fundamentals-publish-channels.md).

# [Teams](#tab/teams)

### Design the topic's conversation path

1. In the topic list, select the topic you want to edit.

   :::image type="content" source="media/authoring-create-edit-topics/topics-details-canvas-teams.png" alt-text="Selecting a topic will take you to the authoring canvas":::

1. Microsoft Copilot Studio opens the topic in the authoring canvas and displays the topic's trigger phrases. The authoring canvas is where you define the conversation path between a customer and the bot.

1. For existing or system topics, a number of nodes will automatically be created. You can edit these nodes just as you can for other nodes.

1. When you create a new topic, a **Trigger phrases** node and a blank **Message** node are inserted for you.

1. You can add additional nodes by selecting **Add node** (**+**) on the line or branch between or after a node.

   :::image type="content" source="media/authoring-create-edit-topics/handoff-add-node-teams.png" alt-text="Screenshot of adding a node." border="false":::

1. To move or change the paths between a node, drag the node anchor. It looks like a small circle on top of the node. When you drag the node anchor, you'll see a dotted line indicating the original path. You can also double-click the anchor and then select the new place for the anchor (you won't see a dotted line).

   :::image type="content" source="media/authoring-create-edit-topics/move-anchor-node.png" alt-text="Screenshot of moving a node's anchor.":::

### Insert nodes

When adding a node, you can choose from five options. Each option has a specific node or nodes that will be inserted into the conversation path.

You can:

- **Ask a question**
- **Add a condition**
- **Call an action**
- **Show a message**
- **End with survey**

:::image type="content" source="media/authoring-create-edit-topics/topics-nodes-teams.png" alt-text="When adding a node, you can choose from five options":::

If the node you are adding is the last in a topic, you can also add a **Go to another topic** node.

:::image type="content" source="media/authoring-create-edit-topics/topics-nodes-other-topic-teams.png" alt-text="Go to another topic.":::

#### Ask a question

1. To have the bot ask a question and get a response from the user, select **Add node** (**+**) to add a node, and then **Ask a question** to add a new **Question** node.

    :::image type="content" source="media/authoring-create-edit-topics/topics-question-teams.png" alt-text="Add a new question mode." border="false":::

1. Enter the question phrase in the first text box, **Ask a question**.

1. Choose from several options for the user's response in the **Identify** field.

   These options determine what the bot should be listening for in the user's response. For example, they could be multiple choice options, a number, or a specific string. To understand more about the different options, see [Use entities in a conversation](advanced-entities-slot-filling.md).

1. Depending on what you choose in the **Identify** field, you can enter what options the user should have.

   For example, if you select **Multiple choice options**, you can then enter the options the user can specify in the **Options for user** field. Each option is presented as a multiple choice button to the user, but users can also type in their answer in the bot.

   The conversation editor creates separate paths in the conversation, depending on the customer's response. The conversation path leads the customer to the appropriate path for each user response. You can add additional nodes to create branching logic, and specify what the bot should respond with for each variable.

1. You can [save the user response in a variable](authoring-variables.md) to be used later.

> [!TIP]
> You can define synonyms for each option. This can help the bot to determine the correct option in case it isn't clear what the user's response should be mapped to.
>
> 1. Select the menu icon on the top of the **Question** node, and then select **Options for user**.
>
>    :::image type="content" source="media/authoring-create-edit-topics/topics-question-options-teams.png" alt-text="Select options for users." border="false":::
>
> 1. Select the **Synonyms** icon for the option you want to add additional keywords to.
>
>    :::image type="content" source="media/authoring-create-edit-topics/topics-question-synonyms-teams.png" alt-text="Select the synonyms icon." border="false":::
>
> 1. Add the keywords individually, and then once you're done, select **Done** to return to the **Authoring canvas**.

#### Add a condition

1. To add branching logic based on [variables](authoring-variables.md), select **Add node** (**+**) to add a node, and then **Add a condition**.

1. Choose the variable you want to use to determine if the bot conversation should branch at this point.

    :::image type="content" source="media/authoring-create-edit-topics/topics-branch-teams.png" alt-text="Choose a variable." border="false":::

#### Call an action

You can [call Power Automate Flows](advanced-flow.md) by selecting **Call an action**.

#### Show a message

1. To specify a response from the bot, select **Add node** (**+**) to add a node, and then **Show a message** to add a new **Message** node.

1. Enter what you want the bot to say in the text box. You can apply some basic formatting, such as bold, italics, and numbering.

   You can also [use variables that you have defined elsewhere](authoring-variables.md) in your bot conversation.

#### End with survey

When you end the conversation, you can have a survey appear that asks the user if their question or issue was answered or resolved correctly. This information is collected under the [customer satisfaction analytics page](analytics-csat.md).

1. At the end of a response that resolves the user's issue or answers the question, select **End with survey**.

    :::image type="content" source="media/authoring-create-edit-topics/topics-nodes-survey-teams.png" alt-text="End with survey." border="false":::

#### Redirect to another topic

1. To automatically have the bot move to a separate topic, select **Add node** (**+**) to add a node, and then **Redirect to another topic**.

1. In the flyout menu, select the topic the bot should divert to. For example, you might want to send the user to a specific topic about the closure of a store if they ask about store hours for that store.

    :::image type="content" source="media/authoring-create-edit-topics/topics-nodes-other-topic-flyout-teams.png" alt-text="Go to another topic node with options for other topics.":::

When the bot goes to another topic, the bot will go through the conversation path for that topic and then return to the original topic, at the place where it left.

You can consider the redirected topic as a "subtopic".

:::image type="content" source="media/authoring-create-edit-topics/authoring-subtopic-redirect-teams.png" alt-text="Screenshot of the authoring canvas showing nodes under a redirected topic node.":::

If you redirect to any of the following [system topics](authoring-system-topics.md), however, the entire conversation will end:

- End of Conversation
- Confirmed Success
- Confirmed Failure
- Goodbye
- Escalate
- Start over (this will also reset any [global variables](authoring-variables-bot.md))

#### Use variables

You can also [use variables that you have defined elsewhere](authoring-variables.md) in your bot conversation.

### Delete nodes

1. Select the menu icon on the top of the node's title.

1. Select **Delete**.

    :::image type="content" source="media/authoring-create-edit-topics/topics-delete-teams.png" alt-text="Select the menu icon and then the delete button." border="false":::

### Test and publish your bot

[Test your bot](authoring-test-bot.md) when you make changes to your topics, to ensure everything is working as expected.

Once you've finished designing and testing your bot, you can consider [publishing it](publication-fundamentals-publish-channels.md) so other team members can use it.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
