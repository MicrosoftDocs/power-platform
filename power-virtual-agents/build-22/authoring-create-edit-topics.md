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

You can [customize provided templates](authoring-template-topics.md), create topics from scratch, or get suggestions from existing help sites to author topics.

A topic has _trigger phrases_ and _conversation nodes_. Trigger phrases are phrases, keywords, and questions that a user is likely to type that are related to a specific issue. Conversation nodes define how a bot should respond to a trigger phrase and what it should do.

The AI uses natural language understanding (NLU) to parse what a customer types and find the most appropriate trigger phrase or node.

For example, a user might type "Open hours" into your bot. The AI matches that to the **Store hours** topic, begins a conversation that asks which store the customer is interested in, and then displays the hours the store is open.

The **Test bot** pane shows how the bot conversation plays out at every step. You can use the **Test bot** pane to fine-tune a topic without having to exit the Power Virtual Agents portal.

## Use system and sample topics

When you create a bot, Power Virtual Agents creates several topics for you.

:::image type="content" source="media/authoring-template-topics/template-list.png" alt-text="Screenshot of the Topics list showing sample topics and system topics.":::

These automatically created topics fall into two categories:
  
- [Sample topics](authoring-template-topics.md) help you understand simple to complex ways to use nodes to create bot conversations.

    You can edit sample topics or delete them entirely.

- System topics are topics you're likely to need during a bot conversation.

    You can't delete or disable system topics or edit their trigger phrases. However, you can customize the nodes on the authoring canvas. We recommend that you don't customize these topics until you're comfortable creating an end-to-end bot conversation.

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

1. Enter a **Name** for your topic and, optionally, a **Display name** and **Description**.

    The bot uses the **Display name** when it needs to know which topic the person is asking about.

    The **Description** is never shown to users. Use it to describe the purpose of the topic to yourself and other bot makers.

    :::image type="content" source="media/authoring-create-edit-topics/details-pane.png" alt-text="Screenshot of the topic details pane showing Name, Display name, and Description.":::

    You can also rename the topic by selecting its name and entering a new value.

    :::image type="content" source="media/authoring-create-edit-topics/rename-topic-shortcut.png" alt-text="Screenshot of the topic authoring canvas, highlighting the topic name.":::

1. Select **Save** to add the topic to the topics list.

## Design the topic's conversation path

1. Select **Topics** in the left pane and then select the topic you want to edit.

    Power Virtual Agents opens the topic in the authoring canvas and displays the topic's trigger phrases. The authoring canvas is where you define the conversation path between a customer and the bot.

    For existing or system topics, several nodes are created automatically. You can edit these nodes just as you would edit other nodes.

    When you create a new topic, a **Trigger phrases** node and a blank **Message** node are inserted for you

1. To add a node, select the plus (**+**) icon on the line or branch between or after nodes.

   :::image type="content" source="media/authoring-create-edit-topics/handoff-add-node.png" alt-text="Screenshot of adding a node.":::

### Insert nodes

You have several options when you add a node. Each option has a specific node or nodes that will be inserted in the conversation path.

When you add a node after the **Trigger Phrases** node or between **Message nodes**, you can:

- Send a message
- Ask a question
- Add a condition
- Set a variable value
- Manage topics
- Call an action

:::image type="content" source="media/authoring-create-edit-topics/topics-node-after-triggers.png" alt-text="Screenshot of adding a node between existing nodes from the options.":::

#### Ask a question

1. To have the bot ask a question and get a response from the user, select **+** to add a node, and then select **Ask a question** to add a new **Question** node.

   :::image type="content" source="media/authoring-create-edit-topics/topics-question.png" alt-text="Screenshot of adding a new question mode.":::

1. Enter the question phrase in **Ask a question**.

1. Optionally, you can add [variations of the question](#message-variations).

1. In the **Identify** list, select an option for the user's response.

   The options determine what the bot should listen for when the user responds. For more information, see [Use entities in a conversation](advanced-entities-slot-filling.md#use-entities-in-a-conversation).

1. Depending on what you selected in **Identify**, enter the options the user should have.

   For example, if you selected **Multiple choice options**, enter the choices the user can specify in **Options for user**. Each choice is presented as a multiple-choice button, but users can also type their answers.

1. In **Save response as**, select an existing variable or create a new one to save the user response.

   - For **Save response as**, you can use an existing variable or create a new one.
   - If you create a new variable, select the variable name to display the variable properties, where you can modify the variable's settings, including its name.

     :::image type="content" source="media/authoring-create-edit-topics/question-variable-button.png" alt-text="Select variable name to display variable properties":::

1. Optionally, open the properties pane for the question node to modify addition settings, such as maximum retry count and what to do if the user exceeds that count.

Later, you can add a condition to create branching logic or add nodes to control how the bot responds based on each variable.

> [!TIP]
> Define synonyms for each option to help the bot determine the correct one if it isn't clear what the user's response should map to.
>
> 1. Select the **Edit synonyms** icon for the option you want to add additional keywords to.
>
>    :::image type="content" source="media/authoring-create-edit-topics/topics-question-synonyms.png" alt-text="Screenshot highlighting the synonyms icon.":::
>
> 1. Add the keywords individually. When you've entered all the synonyms you want, select **Done**.

#### Call an action

To [call Power Automate Flows](advanced-flow.md) and insert authentication nodes, select **Call an action**.

If you've configured hand-off to omnichannel with voice-based capabilities, you'll see more actions.

#### Send a message

1. To specify a response from the bot, select **+** to add a node, and then select **Send a message** to add a new **Message** node.

1. Enter what you want the bot to say in the text box.

    You can apply some basic formatting, such as bold, italics, and numbering. You can also [use variables](authoring-variables.md) that you defined elsewhere in your bot conversation.

1. Optionally, you can add [message variations](#message-variations).

To enhance messages with rich multimedia cards, see [Add multimedia cards to messages](/advanced-cards.md).

#### Go to another topic

1. To have the bot move to a different topic, select **+** to add a node, and then select **Topic Management**, then **Go to another topic**.

    :::image type="content" source="media/authoring-create-edit-topics/topics-redirect-add-subtopic.png" alt-text="Screenshot showing redirection to another topic node with options for other topics.":::

1. Select an existing topic from the list, or **Create a topic**.

    > [!TIP]
    > Before creating a new topic, save your current topic first.
    > Creating a new topic will open the new topic in the authoring canvas, and any unsaved edits you have in the current topic will be lost.

    :::image type="content" source="media/authoring-create-edit-topics/topics-redirect-select-topic.png" alt-text="Screenshot of redirect topic list.":::

1. If there are any [input](/authoring-variables.md#receive-values-from-other-topics) or [output](/authoring-variables.md#return-values-to-original-topics) variables in the next topic, enter or select a value for each one.

1. Save your topic, then use the test bot pane to confirm that your bot successfully calls the next topic.

In the authoring canvas for the original topic, you can insert additional nodes under the **Redirect** node.

When the path for the topic chosen in the **Redirect** node is finished, the bot will return to the original topic. The bot will then follow the nodes that are under the **Redirect** node.

:::image type="content" source="media/authoring-create-edit-topics/authoring-subtopic-redirect.png" alt-text="Screenshot of the authoring canvas showing nodes under a redirected topic node.":::

#### End the conversation or topic

If you redirect to any of the following [system topics](#use-system-and-sample-topics), the current conversation flow will end. Unless modified, these topics have the following behavior. To provide a consistent user experience at the end of a conversation, you can redirect to these topics or implement your own.

| Topic | Behavior |
|:-|:-|
| Confirmed Failure| The user can ask another question or request to talk to an agent, which redirects to the Escalate topic.|
| Confirmed Success| The user is presented with a satisfaction survey, and then can ask another question or leave the conversation, which redirects to the Goodbye topic. The survey response is collected on the [customer satisfaction analytics page](analytics-csat.md). |
| End of Conversation | The user is asked if their question was answered. Based on their response, the bot redirects to the Confirmed Success or the Confirmed Failure topic. |
| Escalate | This topic is incomplete. You can hand the conversation over to a live agent if you're using a suitable customer service portal, such as Omnichannel for Customer Service. |
| Goodbye | Thanks the user and indicates to the user's client that the session is over. The behavior varies based on the client. On the telephony channel, for example, the client will hang up. |
| Start over | Resets the conversation and resets [global variables](authoring-variables-bot.md) for the current session. |

Use the following nodes to design conversation flow in your bots.

1. Select **+** to add a node, and then select **Topic Management**, then one of the following:

    :::image type="content" source="media/authoring-create-edit-topics/topics-nodes-end.png" alt-text="Screenshot showing options for ending a conversation.":::

   - Select **End conversation** to notify the user's client that the session is over. The behavior varies based on the client. On the telephony channel, for example, the client ends the call.
   - Select **End all topics** to clear all active topics and start the conversation from the beginning. However, this does not clear or reset any global variables. To clear global variables, redirect to the Start over system topic.
   - Select **End current topic** to end the current topic and return to the calling topic, if any. You can use this node to create a conversation branch that exits the topic while another branch continues.
   - Select **Go to another topic** to _call_ or redirect to another topic. When that topic ends, control returns to the calling topic.

#### Add a condition

1. To add branching logic based on [variables](authoring-variables.md), select **+** to add a node, then select **Add a condition**.

1. In the first condition node, select the variable and condition that will determine how the bot conversation should branch at this point.

    - For example, if you've set up user authentication, you might specify a different message if the user is signed in (which may have happened earlier in the conversation).
    - You can create a condition using the basic editor or switch to the Power Fx formula editor and manually enter an expression.
    - To switch from the formula editor back to the basic editor, reset the node; however, you will need to enter your condition again.
    - Use the _node menu_ (&vellip;) to switch editing modes or reset the node.

    :::image type="content" source="media/authoring-create-edit-topics/condition-switch-to-formula.png" alt-text="Switch to the Power Fx expression editor":::

1. When working with a string variable in the basic condition editor, you can enter a string literal in the value field, such as `Contoso`. For other variable types, such as Boolean, use the Power Fx editor to compare the variable to a literal value, such as `true`.

1. Use the **+** that precedes the condition, then **Add a condition** to add more branches.

### Quick replies

The **Message** and **Question** nodes allow you to add _quick replies_.
To add a quick reply, select **Add**, then **Quick reply**, and provide information for each _quick reply_.

- A quick reply generates a button the user can select.
- You can select what type of action the button initiates, such as sending a message from the user's client, opening a URL, or calling a phone number.
- The quick reply buttons are removed from the chat history when the bot or user sends another activity.

:::image type="content" source="media/authoring-create-edit-topics/add-quick-reply.png" alt-text="Add quick replies to a question node" border="false":::

A quick reply works like a suggestion that the user can use or ignore. To enforce a choice from a finite list, use a multiple choice question node.

> [TIP]
> Some user clients do not support quick replies, in which case the client may not render them. Some user clients have an upper limit on the number of quick replies that they allow.

#### Set a variable value

See [Set variable value](authoring-variables.md#set-a-variable).

### Message variations

The **Message** and **Question** nodes allow you to add message variations. When you do this, the bot will respond randomly with one of the variations.

1. Select **Add** and then select **Message variation** to add a text box for a message variation.

    :::image type="content" source="media/authoring-create-edit-topics/message-node-variation.png" alt-text="Select the synonyms icon." border="false":::

1. Enter what you want the bot to say. You can apply basic formatting, such as bold, italics, and numbering.

1. Repeat to add as many variations as you like.

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
