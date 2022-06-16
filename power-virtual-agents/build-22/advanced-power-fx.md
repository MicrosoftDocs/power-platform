---
ROBOTS: NOINDEX,NOFOLLOW
title: "Use Power Fx formulas"
description: "Use Power Fx to create complex bot logic using formulas to manipulate data."
keywords: "PVA"
ms.date: 05/10/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: kamrani
manager: iawilt
ms.collection: virtual-agent
ms.custom: ceX, advanced-authoring
---

# Microsoft Power Fx in Power Virtual Agents

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

Power Fx is a low-code language that makers can work with directly in an Excel-like formula bar. Use Power Fx to create complex bot logic via formulas to manipulate data, such as setting the value of variables, parsing a string, or using expressions in conditionals.

For more information, see the [Power Fx overview](/power-platform/power-fx/overview) and [formula reference](https://aka.ms/pfx-reference) documentation.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)
- [Use variables](authoring-variables.md)

## Use variables in a formula

To use a variable in a Power Fx formula, you must add a prefix depending on the variable's scope:

- For [system variables](authoring-variables.md#system-variables), use `System.`
- For [global variables](authoring-variables-bot.md), use `Global.`
- For [topic variables](authoring-variables.md), use `Topic.`

For example, you'd need to use `System.Conversation.Id` to access the respective [system variable](authoring-variables.md#system-variables).

:::image type="content" source="media/advanced-power-fx/variable-prefix.png" alt-text="Screenshot of the Question node with the user's response set to a variable named Var1.":::

## Use Power Fx to set a variable

In this example, a Power Fx expression is used to convert the user's name to uppercase.

1. Create a new topic.

1. Select the **+** icon and then choose **Ask a question**.

1. For **Enter a response**, enter `What is your name?`.

1. Select the **Identify** box, and in the flyout menu, choose **Person name**.

1. In the **Save response as** box, select the **>** arrow and **Create a new variable** named `Var1`.

    :::image type="content" source="media/advanced-power-fx/uppercase-question-node.png" alt-text="Screenshot of the Question node with the user's response set to a variable named Var1.":::

1. Under the **Question** node, select **+** and choose **Set a property**.

1. In the **Set variable** box, select the **>** arrow and **Create a new variable** named `Var2`.

1. In the **To value** box, select the **>** arrow.

1. Select the **Formula** tab. In the **fx** box, enter `Upper(Text(Topic.Var1))` and select **Insert**.

    :::image type="content" source="media/advanced-power-fx/uppercase-pfx-formula.png" alt-text="Screenshot of the Set a Variable node with a Power Fx formula.":::

1. Under the **Question** node, select **+** and choose **Send a message**.

1. Enter the `User Name:` and then add `Var2`.

    :::image type="content" source="media/advanced-power-fx/uppercase-send-message.png" alt-text="Screenshot of the Send a Message node with a message defined.":::

## Use Power Fx as a condition

To evaluate more complex expressions, configure Condition nodes to use Power Fx formulas.

In this example, the bot will determine if a booking date qualifies for a discount. To do this, it checks if the booking date provided by the user is 14 days or more from the current date.

1. Create a new topic.

1. Select the **+** icon and then choose **Ask a question**.

1. For **Enter a response**, enter the `Booking date?`.

1. In the **Identify** box, select the **>** arrow and choose **Date and time**.

1. In the **Save response as** box, select the **>** arrow and **Create a new variable** named `Var1`.

    :::image type="content" source="media/advanced-power-fx/condition-question-node.png" alt-text="Screenshot of question node with date and time entity chosen and variable set.":::

1. Select the **+** icon and then choose **Add a condition**.

1. In the **ConditionItem** node, select the **Node menu** (vertical three dots), then **Change to formula**.

1. In the **Enter or select a value** box, select the **>**.

1. Select the **Formula** tab. In the **fx** box enter `Topic.Var1 > (DateAdd (Now(), 14))` and select **Insert**.

    :::image type="content" source="media/advanced-power-fx/condition-formula.png" alt-text="Screenshot of Power Fx formula entered into condition node.":::

1. Under the **ConditionItem** node, add a **Send a message** node to let the user know they qualify for a discount. Enter the message `You qualify for a discount`.

1. Under the **All Other Conditions** node, add a **Send a message** node. Enter the message, `Sorry, you don't qualify for a discount`.

    :::image type="content" source="media/advanced-power-fx/condition-messages.png" alt-text="Screenshot of message nodes in condition branches.":::
