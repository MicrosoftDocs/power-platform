---
ROBOTS: NOINDEX,NOFOLLOW
title: Ask a question
description: Use the Question node to ask the user a question and store their response in a variable.
keywords: "PVA"
ms.date: 09/05/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: gapretty
manager: shellyha
ms.custom: authoring, topics, message, question
ms.collection: virtual-agent
---

# Asking a Question

The **Question** node allows you to prompt a user for information and store their response into a variable, for use later on in the conversation. 

The node allows you to choose the type of information you want to collect, such as multiple choice, a pre-built entity such as Number, or a custom entity that you have created via the entities page. There are also a number of [additional properties](#additional-question-behavior-properties) that allow you to control the behavior of the node, such as what to do when an invalid response is recieved or additional validation rules that need to be met by the user.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)
- [Send a message](authoring-message-node.md)

## Asking a question

1. To have the bot ask a question and get a response from the user, select **+** to add a node, and then select **Ask a question** to add a new **Question** node.

   :::image type="content" source="media/authoring-question-node/topics-question.png" alt-text="Screenshot of adding a new question mode.":::

1. Enter the text for your question in the first input on the node, which has a placeholder **Enter a response**.

> [!TIP]
> The Question node has all the same capabiltiies as the Message node for authoring a response including the ability to use images, videos, cards and quick replies. See [Send a message](authoring-message-node.md).

1. In the **Identify** list, select an option for the user's response.

   The options determine what the bot should listen for when the user responds. For more information, see [Use entities in a conversation](advanced-entities-slot-filling.md#use-entities-in-a-conversation).

1. Depending on what you selected in **Identify**, there may be additional properties that need to be set.

   For example, if you selected **Multiple choice options**, you will be required to enter the choices the user can specify in **Options for user**. Each choice is presented as a multiple-choice button, but users can also type their answers.

1. In **Save response as**, a new variable is created for you to store the user's response to the question. You can, optionally, create a new variable, or choose another existing variable, to use instead.

     :::image type="content" source="media/authoring-question-node/question-variable-button.png" alt-text="Select variable name to display variable properties":::

2. Optionally, open the properties pane for the question node to modify [additional question behavior](#additional-question-behavior).

## Additional question behavior

There are also a number of additional properties that allow you to control the behavior of the node, such as what to do when an invalid response is recieved or additional validation rules that need to be met by the user.

### Skip question

In some cases, the variable set within the **Save response as** property may already have a value via [slot filling](advanced-entities-slot-filling.md), or having a value assinged earlier in the conversation. 

By default, if the variable does already have a value, the question will be skipped entirely, but you can choose to always ask the user the question, even if the variable already has a value.

To configure your chosen behavior.

1. Open the property pane for the question node.

1. Under the heading **Start question**, use the **Skip question** property to choose either **Allow question to be skipped** or **Ask every time** depending on your needs.

### Retry behavior

If the user responds with an invalid response (such as responding with a number when asked for a date), you can configure how many times the question node should retry asking the question before giving up.

1. Open the properties pane for the question node and select **Question behavior**.

1. Under the heading **How many reprompts**, choose the desired behavior. You can choose never retry, or to retry up to 2 times.

By default, When the question node does reprompt, it will use the same message (and other content) again but, optionally, you can provide a specific message to be used for that case, to provide the user with additional context. For example, if the question node is expecting a date, but the user entered a number, an appropriate retry message might be, _Sorry. I didn't get that. Which day? e.g. tomorrow or 9/15_.

1. Under the heading **Retry prompt** tick the **Customize** checkbox, which reveals the message editor.

2. Use the message editor to set your desired re-prompt message.

If the question node reaches the maximum number of retries (which could be zero) and has not recieved a valid response, you can configure what the node should do in this case.

1. Under the heading **End question**, use the **If no entity found** dropdown box to select one of the following.

- **Redirect to topic: Ecalate** (_default_) - This will redirect the user to the _Escalate_ system topic.
- **Set variable to value** - If this option is selected, an additional property, **Default entity value** is available, where you can specify a value to be used in place of a valid response from the user.
- **Set variable to empty (no value)** - This sets the output variable to Blank and the topic moves onto the next node. You can later use a [condition](authoring-condition-node.md) to check if the variable has a value.

1. You can also, optionally, set a **Default entity message**, to be sent if the maximum reprompt count is reached and one of the above behavior's is used. Check the **Customize** checkbox to reveal the message editor.

### Validating a response

The question node will check if a user's response is valid, based on the type being identified but, in some cases it can be useful to add additional validation rules to add further define what is a valid response. 

For example, you might want to accept a number from a user, but ensure that the number is less than 10. By default, the question node will accept any numeric value when identifying a number, so you can set a boolean condition, using Power Fx, to determine if the user input is valid.

1. Open the properties pane for the question node and select **Question behavior**.

1. Under the heading **Additional conditions**, set the **Condition** property using Power Fx, ensuring the formula you provide returns a boolean value (true / false). e.g. _Topic.Var1 < 10_.