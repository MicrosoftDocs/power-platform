---
ROBOTS: NOINDEX,NOFOLLOW
title: Add a condition
description: Use the Condition node to branch a topic's logic
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

# Using conditions

You can use condition nodes to branch logic within your topic, comparing the value of a variable to another variable or a specific value. For example, you might check to see if a number variable is greater than a certain number. 

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Adding a condition

1. Select **+** to add a node, then select **Add a condition**, to add a condition node to the canvas.
   
    This adds two branches to your topic where you can add nodes, one for if the condition you define is true, and another labelled **All other conditions**, for nodes that will be executed if the condition is false.    

    By default, the node uses the simple condition editor, where you select a variable, an operator (such as 'is equal to' or 'is greater than') and a value (another variable or a literal value), to build your condition. 

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-new-condition.png" alt-text="Screenshot showing new condition with default simple editor and an all other conditions branch.":::

1. Choose **Select a variable** and use the variable picker to select the variable that will be compared.

:::image type="content" source="media/authoring-condition-node/authoring-condition-node-multiple-conditions.png" alt-text="Screenshot showing multiple condition branches and an all other conditions branch.":::

1. By default, the operator dropdown is set to _is equal to_, but you can choose to change this to another operator (the available list of operators can change depending on the type of variable you are comparing).

1. Finally, enter a value to compare with your variable. For simple types (text / number / boolean), you enter a literal value, or you can select **>** on the right of the input box to either select an existing variable, or, specify a value using a Power Fx formula.

## Adding additional condition branches

When adding a new condition, two branches are created one for if the condition you define is true, and another labelled **All other conditions**, for nodes that will be executed if the condition is false. You can choose to add additional condition based branches, which will be evaulated and used before the **All other conditions** branch.

For example, you might have a variable which holds a number and want to split your logic for the following 3 conditions.

- The number is less than 10
- The number is greater than 50
- All other numbers (greater than 10 and less than 50)

For the above, the resulting conditions in your topic might looks like this.

:::image type="content" source="media/authoring-condition-node/authoring-condition-node-multiple-conditions.png" alt-text="Screenshot showing multiple condition branches and an all other conditions branch.":::

1. To add an additional condition branch, select the **+** above an existing condition node and select **Add a condition**. 
   
## Using Power Fx to author a condition

The simple condition editor will suffice for most scenarios, but sometimes you might require more flexibility when building a condition. For this scenario, you can choose to author the condition for a specific condition node using Power Fx.

1. Select the menu icon at the top of the node, to the right of the title, and then select **Change to formula**.

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-change-to-formula.png" alt-text="Screenshot showing the menu where you can switch the node to use a formula.":::

    The node will switch to the formula editor. If you had previously used the simple editor to define a condition, notice that the formula behind that condition is now shown.

    :::image type="content" source="media/authoring-condition-node/authoring-condition-node-formula-mode.png" alt-text="Screenshot showing the formula editor for a condtion node.":::

1. To add or update the formula, use the **>** to the right of the **Function** box to open the Power Fx formula editor. The formula you enter here must return a boolean value (true / false). 

    See [Microsoft Power Fx in Power Virtual Agents](advanced-power-fx.md) for more details about using the Power Fx formula editor.

To switch back to the simple condition editor, select the menu icon at the top of the node, to the right of the title, and then select **Change to editor**.