---
title: Author using conditions (preview)
description: Learn how to add conditional branching to a topic and the conversational path in Microsoft Copilot Studio preview.
keywords: "PVA"
ms.date: 03/24/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: gapretty
manager: leeclontz
ms.custom: authoring, topics, message, question, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Author using conditions (preview)

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

You can use **Condition** nodes to add branches in your topic, comparing the value of one variable to that of another variable or to a specific value. For example, if the value of `isClubMember` is `True`, then the topic offers a discount; if the value is `False`, the topic presents the standard item price.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Add a condition

1. Open your topic.

1. Select **+** to add a node, and then select **Add a condition**.

    This action adds two branches to your topic. One branch starts with a **Condition** node and defines the conversation path for when the condition is true. The other branch starts with an **All Other Conditions** node and defines the path for when the condition is false.

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-new-condition.png" alt-text="Screenshot showing a Condition branch and an All Other Conditions branch in a topic.":::

    To build your condition in the **Condition** branch, select a variable, a logical operator, and a value.

1. Select **Select a variable** and select the variable to compare.

1. By default, the operator is set to _is equal to_. Select another operator if needed.

    The logical operators available depend on the type of the variable you selected. For example, **is equal to** is available for all variable types. **is greater than** is available for number types, but not for string types.

1. Enter a value to compare with your variable. For simple types, such as text, number, or Boolean, type a literal value. Select _Select variable_ (**>**) to select a variable or use a Power Fx formula.

    The value or variable to compare must be of a compatible type, based on the variable and the operator. Some operators, such as **is Blank** or **is not Blank**, don't require you to add a comparison value.

1. Select **+ New condition** if you need to add more criteria to your condition. Select **And** to make the criteria cumulative, or select **Or** to make them exclusive of one another.

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-or-condition.png" alt-text="Screenshot showing a Condition branch with an Or condition.":::

## Add more Condition branches

Initially, a **Condition** node inserts two branches, a **Condition** branch for when your condition is true, and an **All Other Conditions** branch for when it's false. You can add as many **Condition** branches as you need. Each condition is evaluated in order. The first branch with a condition that evaluates to true is followed. If all conditions evaluate to false, the **All Other Conditions** branch is followed.

For example, you might have a number variable and want three branches for when:

- The number is less than 10.
- The number is greater than 50.
- All other numbers&mdash;the number is greater than 10 and less than 50.

1. To add another **Condition** branch, select the **+** _above_ an existing **Condition** branch and select **Add a condition**.

    If you select **Add node** (**+**) _below_ the **Condition** branch, you'll add an entire new **Condition** and **All Other Conditions** node, not a new **Condition** branch.

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-multiple-conditions.png" alt-text="Screenshot showing multiple Condition branches and an All Other Conditions branch in a topic.":::

## Use Power Fx to define a condition

The default condition editor is good for most scenarios. If you need more flexibility, use Power Fx in the **Condition** branch.

1. In the **Condition** branch, select the _Node Menu_ (**&vellip;**), and then select **Change to formula**.

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-change-to-formula.png" alt-text="Screenshot showing the Node Menu where you can switch to use a Power Fx formula as the condition.":::

    The node switches to the formula editor control. If you defined a condition earlier, the formula behind that condition is shown in the formula editor.

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-formula-mode.png" alt-text="Screenshot showing the formula editor for a Condition node.":::

1. To change the formula, select _Select variable_ (**>**) to open the Power Fx formula editor. The formula you enter here must return a Boolean (true or false) value.

Learn how to use [Microsoft Power Fx in Microsoft Copilot Studio](advanced-power-fx.md).

To switch back to the simple condition editor, select the _Node Menu_ (**&vellip;**), and then select **Reset node**.


[!INCLUDE[footer-include](includes/footer-banner.md)]
