---
title: Ask a question (preview)
description: Use the question node to ask the user a question and store their response in a variable in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 10/10/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: gapretty
manager: shellyha
ms.custom: authoring, topics, message, question
ms.collection: virtual-agent
---

# Ask a question (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

The **Question** node allows you to prompt a user for information and store their response into a variable, for use later on in the conversation.

The node allows you to choose the type of information you want to collect, such as a multiple choice answer, a pre-built entity, or a custom entity that you have created via the entities page. There are also some extra [question behavior properties](#configure-question-behavior) that allow you to control the behavior of the node, such as, what to do when an invalid response is received or additional validation rules that need to be met by the user.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)
- [Send a message](authoring-send-message.md)

## Add a question node

To have the bot ask a question and get a response from the user:

1. Select **Add node** (**+**), then select **Ask a question**. A new **Question** node is added to the canvas.

   :::image type="content" source="media/authoring-ask-a-question/topics-question.png" alt-text="Screenshot of a new question mode.":::

1. Enter a question in the first field.

    > [!TIP]
    > Message fields in a **Question** node have the same capabilities as fields in a **Message** node. This includes the ability to use images, videos, cards, quick replies, and send message variations. For more information, see [Send a message](authoring-send-message.md).

1. For **Identify**, select an option for the bot will interpret the user's response.

   The options determine what the bot should listen for when the user responds. For more information, see [Use entities in a conversation](advanced-entities-slot-filling.md#use-entities-in-a-conversation).

1. Depending which **Identify** option you selected, you may have more properties you need to set.

   For example, for **Multiple choice options**, you need to enter the choices the user can specify in **Options for user**. Each choice is presented as a multiple-choice button, but users can also type their answers.

1. In **Save response as**, a new variable is created for you to store the user's response to the question. You can also choose another existing variable to use instead.

    :::image type="content" source="media/authoring-ask-a-question/question-variable-button.png" alt-text="Screenshot of new variable created for question node.":::

## Configure question behavior

Question behavior properties allow you to control other aspects of the **Question** node, such as how the bot responds to an invalid response or how it validates user input.

:::image type="content" source="media/authoring-ask-a-question/question-properties.png" alt-text="Screenshot of question properties.":::

To open the question properties pane:

1. On the **Question** node, select the _node menu_ (**&vellip;**), then select **Properties**.

    :::image type="content" source="media/authoring-ask-a-question/properties-button.png" alt-text="Screenshot of properties button.":::

1. In the properties pane, select **Question behavior**.

    :::image type="content" source="media/authoring-ask-a-question/properties-pane.png" alt-text="Screenshot of properties pane.":::

### Skip behavior

In some cases, the question node's variable may already have a value, from [slot filling](advanced-entities-slot-filling.md) or from earlier in the conversation.

Decide whether your bot should ask the question, if it already has a value for the associated variable. Under **Skip question**, select:

- **Allow question to be skipped** to skip the question entirely.
- **Ask every time** to always ask the user the question every time.

### Reprompt

A user might enter an invalid response, such as providing a number when asked for a date. Use the **Reprompt** settings to configure how your bot will react.

Change **How many reprompts** to change how many times your bot will reprompt the user for a valid answer before it stops trying:

- **Don't repeat**: your bot won't repeat the question and immediately moves on.
- **Repeat once:**: your bot will repeat the question at most _one_ time.
- **Repeat up to 2 times** (_default_): your bot will repeat the question at most _two_ times.

By default, when the bot reprompts the user, it uses the same message again. However, you can use a different message to provide the user with additional context.

To customize the reprompt message, under **Retry prompt**, select **Customize**, then enter the reprompt message to use. You have the same options as for other types of messages. For more information on editing messages, see [Send a message](authoring-send-message.md).

To customize what your bot does when it moves on, see [No valid entity found](#no-valid-entity-found).

### Additional entity validation

The question node will check if a user's response is valid based on the selected entity. To add extra validation criteria, use the **Additional entity validation** settings.

For example, you might want to accept a number from a user, but ensure that the number is less than 10. By default, the question node will accept any numeric value when identifying a number. Add a Boolean condition, using Power Fx, to determine if the user input is valid.

Use the **Condition** field to enter your validation criteria as a Power Fx formula. The formula you provide must return a Boolean value (`true` or `false`), for example, `Topic.Var1 < 10`.

By default, when the condition is not met, the bot reprompts the user with the same message again. However, you can use a different message to provide the user with additional context.

To customize the invalid value message, under **Condition not met prompt**, select **Customize** to display the message editor, then enter your custom message. You have the same options as for other types of messages. For more information on editing messages, see [Send a message](authoring-send-message.md).

### No valid entity found

When your bot stops trying to get a valid response from the user, it stops trying. To control what it does next, use the **No valid entity found** settings.

To configure what to do next, choose one of the **Action If no entity found** options.

- **Redirect to topic: Escalate** (_default_): Redirect the user to the _Escalate_ system topic.
- **Set variable to value**: Set the output variable to a value and move on to the next node. Enter the value to use the **Default entity value** field.
- **Set variable to empty (no value)**: Set the output variable to `Blank` and move on to the next node. You can use a [condition](authoring-using-conditions.md) node later to check if the variable has a value.

By default, when the entity is not found, the bot shows a standard error message. However, you can use a different message to provide the user with additional context.

To customize the error message, under **No entity found message**, select **Customize** to display the message editor, then enter your custom message. You have the same options as for other types of messages. For more information on editing messages, see [Send a message](authoring-send-message.md).
