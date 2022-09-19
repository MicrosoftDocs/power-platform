---
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

# Ask a Question

The **Question** node allows you to prompt a user for information and store their response into a variable, for use later on in the conversation.

The node allows you to choose the type of information you want to collect, such as multiple choice, a pre-built entity, or a custom entity that you have created via the entities page. There are also a number of [additional properties](#additional-question-behavior) that allow you to control the behavior of the node, such as, what to do when an invalid response is received or additional validation rules that need to be met by the user.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)
- [Send a message](authoring-send-message.md)

## Add a question node

To have the bot ask a question and get a response from the user:

1. Select **Add node** (**+**), then select **Ask a question** to add a new Question node.

   :::image type="content" source="media/authoring-ask-a-question/topics-question.png" alt-text="Screenshot of adding a new question mode.":::

1. Enter a question in the first box.

    > [!TIP]
    > The Question node has all the same capabilities as the Message nodes. This includes the ability to use images, videos, cards, quick replies, and send message variations. For more information, see [Send a message](authoring-send-message.md).

1. For **Identify**, select an option for the user's response.

   The options determine what the bot should listen for when the user responds. For more information, see [Use entities in a conversation](advanced-entities-slot-filling.md#use-entities-in-a-conversation).

1. Depending on what you selected in **Identify**, there may be additional properties that need to be set.

   For example, if you selected **Multiple choice options**, you'll be required to enter the choices the user can specify in **Options for user**. Each choice is presented as a multiple-choice button, but users can also type their answers.

1. In **Save response as**, a new variable is created for you to store the user's response to the question. You can also choose another existing variable to use instead.

    :::image type="content" source="media/authoring-ask-a-question/question-variable-button.png" alt-text="Screenshot of new variable created for question node.":::

## Configure question behavior

There are additional properties that allow you to control the behavior of the Question node, such as, what to do when an invalid response is received or validation rules that need to be met by the user.

:::image type="content" source="media/authoring-ask-a-question/question-properties.png" alt-text="Screenshot of question properties.":::

To open the question properties pane:

1. Select the vertical three dots, then select **Properties**.

    :::image type="content" source="media/authoring-ask-a-question/properties-button.png" alt-text="Screenshot of properties button.":::

1. In the properties pane, select **Question behavior**.

    :::image type="content" source="media/authoring-ask-a-question/properties-pane.png" alt-text="Screenshot of properties pane.":::

### Skip behavior

In some cases, the Question node's variable may already have a value from [slot filling](advanced-entities-slot-filling.md) or assigned a value earlier in the conversation.

To customize how your bot handles this situation, choose the appropriate value for **Skip question**:

- **Allow question to be skipped**: if the variable already has a value, the question will be skipped entirely.
- **Ask every time**: always ask the user the question, even if the variable already has a value.

### Reprompt

If the user responds with an invalid response (such as responding with a number when asked for a date), you can configure how many times the bot should try asking the question again before giving up. To customize what your bot does when it gives up, see [No valid entity found](#no-valid-entity-found).

To customize how many times your bot reprompts the user, choose one of the following values for **How many reprompts**:

- **Don't repeat**: The question is not repeated and your bot will immediately escalate the conversation.
- **Repeat once:**: The question is repeated _once_.
- **Repeat up to 2 times** (_default_): The question is repeated _twice_.

By default, when the bot reprompts the user it will use the same message again. However, you can use a different message to provide the user with additional context.

To customize the reprompt message, under **Retry prompt**, turn on **Customize** to reveal the message editor. Then enter your desired reprompt message.

To learn more, see [Customize reprompt messages](#customize-reprompt-messages).

### Additional entity validation

The question node will check if a user's response is valid based on the selected entity. However, in some cases it can be useful to add additional validation rules to further define what is a valid response.

For example, you might want to accept a number from a user, but ensure that the number is less than 10. By default, the question node will accept any numeric value when identifying a number, so you can set a boolean condition, using Power Fx, to determine if the user input is valid.

To add additional validation, enter a Power Fx formula for **Condition**. The formula you provide must return a boolean value (`true` or `false`), for example, `Topic.Var1 < 10`.

By default when the condition is not met, the bot reprompts the user with the same message again. However, you can use a different message to provide the user with additional context.

To customize the reprompt message, under **Condition not met prompt**, turn on **Customize** to reveal the message editor. Then enter your desired reprompt message.

To learn more, see [Customize reprompt messages](#customize-reprompt-messages).

### No valid entity found

If the question node reaches the maximum number of retries and hasn't received a valid response, your bot will give up.

To configure what the node should do in this situation, choose one of the following values for **Action If no entity found**:

- **Redirect to topic: Escalate** (_default_): Redirect the user to the _Escalate_ system topic.
- **Set variable to value**: Reveals an additional box named **Default entity value** where you can enter a value to be used in place of a valid response from the user.
- **Set variable to empty (no value)**: Sets the output variable to `Blank` and the topic moves onto the next node. You can later use a [condition](authoring-using-conditions.md) to check if the variable has a value.

<!-- FIXME: this is not a reprompt message, but a message to let he user know a default value was used -->
By default when the entity is not found, the bot reprompts the user with the same message again. However, you can use a different message to provide the user with additional context.

To customize the reprompt message, under **No entity found message**, turn on **Customize** to reveal the message editor. Then enter your desired reprompt message.

To learn more, see [Customize reprompt messages](#customize-reprompt-messages).

## Customize reprompt messages

By default, when the bot reprompts the user it will use the same message again. However, you can provide a different message to be used to provide the user with additional context.

For example, if the question node is expecting a date, but the user entered a number, an appropriate retry message might be, _"Sorry, I didn't get that. Which day? For example, 'tomorrow' or '9/15'"_.

The reprompt message editor has all the same capabilities as the editors for Message and Question nodes. This includes the ability to use images, videos, cards, quick replies, and send message variations. For more information, see [Send a message](authoring-send-message.md).
