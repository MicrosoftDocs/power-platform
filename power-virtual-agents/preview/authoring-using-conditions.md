---
title: Add a condition
description: Learn how to add conditional branching to a topic and the conversational path.
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

# Use conditions

You can use **Condition** nodes to branch logic within your topic, comparing the value of a variable to another variable or a specific value. For example, you might check to see if a number variable is greater than a certain number.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Add a condition

1. Open your topic.
1. Select **+** to add a node, then select **Add a condition**, to add a condition node to the canvas.

    This adds two branches to your topic where you can add nodes. One branch starts with a **Condition** node defines the conversation path for when the condition is true. The other branch starts with an **All Other Conditions** node and defines the path for when the condition is false.

    To build your condition in the **Condition** node, you can select a variable, a logical operator, and a value.

    - The logical operators available depend on the type of the variable you selected. For example, **Is equal to** is available for all variable types, but **Is greater than** is available for number types, but not for string types.
    - You can enter a literal value or use _select variable_ (**>**) to select a variable. The value or variable to compare to must be a compatible type, based on the variable and the operator. Some operators, such as **Is Blank** or **Is not Blank**, do not require you to add a comparison value.

1. Choose **Select a variable** and use the variable picker to select the variable that will be compared.

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-new-condition.png" alt-text="Screenshot showing new condition with default simple editor and an all other conditions branch.":::

1. By default, the operator dropdown is set to _is equal to_, but you can choose to change this to another operator (the available list of operators can change depending on the type of variable you are comparing).

1. Finally, enter a value to compare with your variable. For simple types&mdash;such as text, number, or Boolean&mdash;you enter a literal value, or use _select variable_ (**>**) to select an existing variable or use a Power Fx formula.

## Add more condition branches

Initially, you have two condition branches, one for when your condition is true, and one for when it is false. You can add more condition branches. Each condition will be evaluated in order. The first branch with a condition that evaluates to true is followed. If all conditions evaluate to false, the **All other conditions** branch is followed.

For example, you might have a number variable and want 3 branches for when:

- The number is less than 10.
- The number is greater than 50.
- All other numbers&mdash;greater than 10 and less than 50.

1. To add an additional condition branch, select the **+** above an existing condition node and select **Add a condition**.

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-multiple-conditions.png" alt-text="Screenshot showing multiple condition branches and an all other conditions branch.":::

## Use Power Fx to author a condition

The default condition editor is good for most scenarios. If you need more flexibility to express the condition to define, you can instead use Power FX in the **Condition** node.

1. In the **Condition** node, select the _node menu_ (**&vellip;**), then **Change to formula**.

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-change-to-formula.png" alt-text="Screenshot showing the menu where you can switch the node to use a formula.":::

    The node switches to the formula editor control. If you had defined a condition earlier, the formula behind that condition is now shown in the formula editor.

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-formula-mode.png" alt-text="Screenshot showing the formula editor for a condition node.":::

1. To add or update the formula, use use _select variable_ (**>**) to open the Power Fx formula editor. The formula you enter here must return a Boolean (true or false) value.

    See [Microsoft Power Fx in Power Virtual Agents](advanced-power-fx.md) for more details about using the Power Fx formula editor.

To switch back to the simple condition editor, select the _node menu_ (**&vellip;**), then **Reset node**.
