---
# FIXME: fill out metadata
title: ""
description: ""
keywords: "PVA"
ms.date: 04/13/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: kamrani
manager: iawilt
ms.collection: virtual-agent
ms.custom: ceX, advanced-authoring
---

# Microsoft Power Fx in Power Virtual Agent

Power Fx is a low-code language that makers can work with directly in an Excel-like formula bar. For example, you can use Power Fx to create complex bot logic using formulas to manipulate data, such as setting the value of variables, parsing the string, or using expressions in conditionals.

For more information, see [Power Fx overview](/power-platform/power-fx/overview) and [formula reference](https://aka.ms/pfx-reference) documentation.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)
- [Use variables](authoring-variables.md)

## Use Power Fx expression in a topic

1. Create a new topic and in your bot.

1. Select the **+** icon and then choose **Ask a question**.

1. For **Enter a response**, enter `What is your name?`.

    <!-- FIXME:  do users need to select the icon, or can the select the whole box? -->
1. In the **Identify** box, select the **>** arrow and choose **Person name**.

    <!-- FIXME: can users choose a var name at this point? -->
1. In the **Save response as** box, select the **>** arrow and **Create a new variable** named `Var1`.

    :::image type="content" source="media/advanced-power-fx/uppercase-question-node.png" alt-text="Screenshot of the Question node with the user's response set to a variable named Var1.":::

1. Under the **Question** node, select **+** and choose **Set a property**.

1. In the **Set variable** box, select the **>** arrow and **Create a new variable** named `Var2`.

1. In the **To value** box, select the **>** arrow.

1. Select the **Formula** tab. In the **fx** box enter `Upper(Text(Topic.Var1))` and select **Insert**.

    :::image type="content" source="media/advanced-power-fx/uppercase-pfx-formula.png" alt-text="Screenshot of the Set a Variable node with a Power Fx formula.":::

1. Under the **Question** node, select **+** and choose **Send a message**.

1. Enter the `User Name:` and then add `Var2`.

    <!-- FIXME: this screenshot doesn't seem to have the correct UI -->
    :::image type="content" source="media/advanced-power-fx/uppercase-send-message.png" alt-text="Screenshot of the Send a Message node with a message defined.":::

## Using Power Fx expressions in Conditions

Create a new topic and in your bot as shown below:

A new topic is created with a single **Trigger Phrases** node as shown below:

:::image type="content" source="media/advanced-power-fx/image2.png" alt-text="Chart Description automatically generated with medium confidence":::

Click on the ellipses and choose **Edit trigger** **phrases** as shown below:

In the **Trigger phrases** (0) pane, type _Reservation_ in the**Add phrases** textbox and press enter.

Your **Trigger Phrases** node should look like the following:

Next, create **Ask a question** node by clicking on the (**+**) sign as shown below:

Next select **Ask a question** as shown below**:**

You'll end up with a Question node as shown below:

:::image type="content" source="media/advanced-power-fx/image24.png" alt-text="Graphical user interface  text  application  email Description automatically generated":::

In the **Question** node, type a prompt for user in the **Enter a response** textbox as shown below:

Next, click the arrow in the **Identify** box, select **Date and time** as shown below:

Next, click on the arrow (>) in **Select a variable** box and then click on **Create a new variable** as shown below:

The completed **Question** node looks like the following:

:::image type="content" source="media/advanced-power-fx/image28.png" alt-text="Graphical user interface  text  application  email Description automatically generated":::

Next create **Add a condition** node using the (**+**) icon.

Two condition nodes are created. The **ConditionItem** node is for when a specific condition is met and the other (**All Other Conditions)** for all other cases.

:::image type="content" source="media/advanced-power-fx/image30.png" alt-text="Graphical user interface Description automatically generated with low confidence":::

In the **ConditionItem** node, click on the three dots, select **Change to formula** as shown below:

The ConditionItem node should look like the following:

:::image type="content" source="media/advanced-power-fx/image32.png" alt-text="Graphical user interface  application Description automatically generated":::

Next, to calculate whether a booking qualifies for discount, the booking date must be 14 days in advance. To open formula editor, click on the (**>**) in the **Enter or select a value** box. And in the **Enter formula** pane, type:

Topic.Var1 > (DateAdd (Now(), 14))

Next, click **Insert**.

Save the topic.

Next add two **Send a message** nodes to inform the user about discount as shown below.

Save the topic.

To test the bot, enter _What's up_, answer the question_Are you a member or not?_ using**Yes** or **No**. The bot should display appropriate response.
