---
title: Ask a question
description: Use a Question node to ask the user a question and store their response in a variable in Microsoft Copilot Studio preview.
keywords: "PVA"
ms.date: 04/13/2023

ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: gapretty
ms.custom: authoring, topics, message, question, bap-template
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Ask a question (preview)

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

The **Question** node allows you to prompt a user for information and store their response in a variable for use later on in the conversation.

The node allows you to choose the type of information to collect, such as a multiple-choice answer, a prebuilt entity, or a custom entity. [Question behavior properties](#configure-question-behavior) allow you to control the behavior of the node, such as what to do when the user enters an invalid response.

Just like **Message** nodes, **Question** nodes can include images, videos, cards, quick replies, and message variations. For more information, see [Send a message](authoring-send-message.md).

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)
- [Send a message](authoring-send-message.md)

## Add a question node

1. Select **Add node** (**+**), and then select **Ask a question**.

   :::image type="content" source="media/authoring-ask-a-question/topics-question.png" alt-text="Screenshot of a new Question mode.":::

1. In the **Enter a message** box, type the question you want to ask.

1. Select the box under **Identify**, then either create or select an entity to determine what the bot should listen for in the user's response. [Learn how to use entities in a conversation](advanced-entities-slot-filling.md#use-entities-in-a-conversation).

1. Depending which **Identify** option you selected, you may have more properties you need to set.

   For example, for **Multiple choice options**, you need to enter the choices the user can specify in **Options for user**. Each choice is presented as a multiple-choice button, but users can also type their answers.

1. Select the box under **Save response as** and change the name of the default variable to something meaningful, like **customerName** or **bookingDate**.

    To choose a different variable, select **>**, and then select a variable.

    :::image type="content" source="media/authoring-ask-a-question/question-variable-button.png" alt-text="Screenshot of a new variable created for a Question node.":::

## Configure question behavior

Question behavior properties allow you to control other aspects of the **Question** node, such as how the bot responds to an invalid response or how it validates user input.

1. On the **Question** node, select the _Node Menu_ (**&vellip;**), and then select **Properties**.

1. In the **Question properties** pane, select **Question behavior**.

    :::image type="content" source="media/authoring-ask-a-question/properties-pane.png" alt-text="Screenshot of properties pane.":::

    The **Question behavior** pane opens.

    :::image type="content" source="media/authoring-ask-a-question/question-properties.png" alt-text="Screenshot of the Microsoft Copilot Studio Question behavior pane.":::

### Skip behavior

**Skip behavior** determines what the bot should do if the question node's variable already has a value from earlier in the conversation.

- **Allow question to be skipped**: Skip the question if the variable has a value.
- **Ask every time**: Ask the question even if the variable has a value.

### Reprompt

**Reprompt** determines how your bot will react if it doesn't get a valid answer from the user. You can tell it to try again once, twice, or move on without getting an answer. To customize what your bot does when it moves on, see [No valid entity found](#no-valid-entity-found). You can also change the prompt to give the user more context.

- **How many reprompts**: The number of times your bot tries to get a valid answer. **Repeat up to 2 times** is the default. You can also select **Repeat once** or **Don't repeat**.

- **Retry prompt**: To change the message, select **Customize**, and then enter the new prompt.

### Additional entity validation

By default, the **Question** node checks for a valid response based only on the entity you selected. **Additional entity validation** allows you to add criteria to the basic test. For example, the **Question** node accepts any numeric value when it identifies a number, but you might want to make sure it's less than 10. You can also change the prompt to help the user enter a valid response.

- **Condition**: Enter a Power Fx formula that returns a boolean value (`true` or `false`); for example, `Topic.Var1 < 10`

- **Condition not met prompt**: To change the message, select **Customize**, and then enter the new prompt.

### No valid entity found

**No valid entity found** determines what happens when your bot stops trying to get a valid response from the user. You can escalate to a human agent or provide a default value for now. You can also change the prompt to let the user know.

- **Action if no entity found**:

  - **Escalate**: Redirect the user to the _Escalate_ system topic. This is the default.
  - **Set variable to value**: Set the output variable to a value and move on to the next node. Enter or select the value in **Default entity value**.
  - **Set variable to empty (no value)**: Set the output variable to `Blank` and move on to the next node. You can use a [**Condition**](authoring-using-conditions.md) node later to check whether the variable has a value.

- **No entity found message**: To change the message, select **Customize**, and then enter the new prompt.

### Interruptions

**Interruptions** determines whether the user can switch to a different topic during the question.

- **Allow switching to another topic**: The user can abandon the question for a new topic.
