---
title: Create expressions using Power Fx (preview)
description: Use Power Fx to create complex bot logic using formulas to manipulate data in Microsoft Copilot Studio preview.
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: kamrani
manager: leeclontz
ms.service: power-virtual-agents
ms.collection: virtual-agent
ms.custom: ceX, advanced-authoring, bap-template
---

# Create expressions using Power Fx

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Power Fx is a low-code language that uses Excel-like formulas. Use Power Fx to create complex logic that allows your bots to manipulate data. For instance, a Power Fx formula can set the value of a variable, parse a string, or use an expression in a condition. For more information, see the [Power Fx overview](/power-platform/power-fx/overview) and [formula reference](/power-platform/power-fx/formula-reference).

> [!NOTE]
> Power Fx formulas in Microsoft Copilot Studio use US-style numbering. That is, the decimal separator is a period or dot, as in `12,567.892`. This means [Power Fx parameters must be separated by commas (,)](/power-platform/power-fx/expression-grammar#separators).

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)
- [Use variables](authoring-variables.md)

## Use variables in a formula

To use a variable in a Power Fx formula, you must add a prefix to its name to indicate the variable's scope:

- For [system variables](authoring-variables.md#system-variables), use `System.`
- For [global variables](authoring-variables-bot.md), use `Global.`
- For [topic variables](authoring-variables.md), use `Topic.`

For example, to use the system variable `Conversation.Id` in a formula, you'd need to refer to it as `System.Conversation.Id`.

:::image type="content" source="media/advanced-power-fx/variable-prefix.png" alt-text="Screenshot of the Enter formula pane with an expression that contains a system variable.":::

## Use literal values in a formula

In addition to using variables in a Power Fx formula, you can enter literal values. To use a literal value in a formula, you must enter it in the format that corresponds to its [type](authoring-variables.md#variable-types). The following table lists the data types and the format of their corresponding literal values.

| Type     | Format examples                                                                         |
| -------- | --------------------------------------------------------------------------------------- |
| String   | `"hi"`, `"hello world!"`, `"chatbot"`                                                   |
| Boolean  | Only `true` or `false`                                                                  |
| Number   | `1`, `532`, `5.258`, `-9201`                                                            |
| Table    | `[1]`, `[45, 8, 2]`, `["cats", "dogs"]`                                                 |
| Record   | `{ id: 1 }`, `{ message: "hello" }`, `{ name: "John", info: { age: 25, weight: 175 } }` |
| DateTime | `Time(5,0,23)`, `Date(2022,5,24)`, `DateTimeValue("May 10, 2022 5:00:00 PM")`           |
| Choice   | Not supported                                                                           |
| Blank    | Only `Blank()`                                                                          |

## Use Power Fx to set a variable

In this example, we'll use a Power Fx expression to store the customer's name and output it in capital letters.

1. Create a topic and add a **Question** node.

1. For **Enter a message**, enter `What is your name?`.

1. Under **Identify**, select the entity **Person name**.

1. Select the box under **Save response as**, and then select the variable `Var1` and name it `customerName`.

    :::image type="content" source="media/advanced-power-fx/uppercase-question-node.png" alt-text="Screenshot of a Question node with a variable named Var1 highlighted.":::

1. Under the **Question** node, select **+** and then select **Set a variable value**.

1. Select the box under **Set variable**, and then select **Create new** and name it `capsName`.

1. In the **To value** box, select the **>** arrow, and then select the **Formula** tab.

1. In the **fx** box, enter `Upper(Text(Topic.customerName))`, and then select **Insert**.

    :::image type="content" source="media/advanced-power-fx/uppercase-pfx-formula.png" alt-text="Screenshot of a Power Fx formula in a Set a Variable node with the Formula tab highlighted.":::

1. Under the **Question** node, select **+** and then select **Send a message**.

1. Enter `HELLO `, select **{x}**, and then select `capsName`.

    :::image type="content" source="media/advanced-power-fx/uppercase-send-message.png" alt-text="Screenshot of the Send a Message node with a message defined.":::

## Use a Power Fx formula as a condition

To evaluate more complex expressions, set up **Condition** nodes to use Power Fx formulas.

In this example, the bot determines if a booking date qualifies for a discount. To do that, it checks whether the booking date provided by the customer is 14 days or more from the current date.

1. Create a topic and add a **Question** node.

1. For **Enter a message**, enter `Booking date?`.

1. Under **Identify**, select the entity **Date and time**.

1. Select the box under **Save response as**, and then select the variable `Var1` and name it `bookingDate`.

    :::image type="content" source="media/advanced-power-fx/condition-question-node.png" alt-text="Screenshot of a Question node with a date and time entity chosen and a variable set.":::

1. Select the **+** icon and then select **Add a condition**.

1. In the **Condition** node, select the **Node menu** (**&#8942;**), and then select **Change to formula**.

    :::image type="content" source="media/advanced-power-fx/condition-change-to-formula.png" alt-text="Screenshot of a Condition node with the Node Menu icon and Change to formula highlighted.":::

1. In the **Function** box, select the **>** arrow, and then select the **Formula** tab.

1. Replace the contents of the **fx** box with the formula `Topic.bookingDate > (DateAdd (Now(), 14))`, and then select **Insert**.

1. Under the **Condition** node, add a **Send a message** node and enter the message `You qualify for a discount`.

1. Under the **All Other Conditions** node, add a **Send a message** node and enter the message, `Sorry, you don't qualify for a discount`.

    :::image type="content" source="media/advanced-power-fx/condition-messages.png" alt-text="Screenshot of Message nodes in a Condition node.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
