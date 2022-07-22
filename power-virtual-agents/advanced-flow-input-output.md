---
title: "Add input and output variables"
description: "Pass variables between a Power Automate flow and a Power Virtual Agents bot."
keywords: "PVA, flow, automate"
ms.date: 07/19/2022
ms.service: power-virtual-agents
ms.topic: article
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.reviewer: peterswimm
ms.custom: flow, ceX, advanced-authoring
ms.collection: virtual-agent
---

# Add input and output variables

Use variables as input and output parameters to pass information between Power Automate flows and Power Virtual Agents bots.

A bot is only able to _receive_ up to 1 MB of data from a flow in a single action. However, there's no limit on the size of data a bot can send or how many variables a bot can pass.

In this example, you'll create a simple flow with an input parameter and returns it back to the bot as an output parameter.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]
- [Create a flow](advanced-flow-create.md).
- [Use variables](authoring-variables.md).

## Supported parameter types

Bots can use the following types of inputs and outputs with Power Automate flows:

- Number
- String
- Boolean

The following types are not supported:

- Object
- Date
- Timestamp
- List [String]
- List [Number]
- List [Boolean]
- List [Object]
- List [Date]
- List [Timestamp]

## Create a new topic and flow

1. Create a new topic called `Echo message`.

1. Add the trigger phrase `echo`.

1. Add a **Question** node and enter the message `Tell me something and I'll say it back to you`. For **Identify**, choose **User's entire response**.

1. For **Save response as**, rename the variable to `userResponse`.

    :::image type="content" source="media/advanced-flow-input-output/new-topic.png" alt-text="Screenshot of question node.":::

1. On the Power Virtual Agents authoring canvas, select the plus (**+**) icon. Choose **Call an action**, then select **Create a flow**.

1. In the Power Automate portal, name the flow `Echo parameter`.

## Add input parameters

1. In the **Power Virtual Agents** flow trigger, select **Add an input**.

    :::image type="content" source="media/advanced-flow-input-output/PVAConnector_Inputs_1.png" alt-text="Screenshot of Add an input button highlighted.":::

1. Select **Text** and enter the name `String_Input`.

    :::image type="content" source="media/advanced-flow-input-output/PVAConnector_Inputs_2.png" alt-text="Screenshot of flow trigger input.":::

## Add output parameters

1. In the **Return value(s) to Power Virtual Agents** response action, select **Add an output**.

    :::image type="content" source="media/advanced-flow-input-output/PVAConnector_Output_1.png" alt-text="Screenshot of Add an output highlighted." border="false":::

1. Select **Text** and enter the name `String_Output`.

    :::image type="content" source="media/advanced-flow-input-output/PVAConnector_Output_2.png" alt-text="Screenshot of response action output." :::

1. For the value of **String_Output**, select the **String_Input** variable.

    :::image type="content" source="media/advanced-flow-input-output/use-input-variables-for-output.png" alt-text="Screenshot of input parameter being used as the value of the output parameter.":::

1. Select **Save** to save your flow.

## Select variables on the authoring canvas

1. On the Power Virtual Agents authoring canvas, select the plus (**+**) icon then select **Call an action**. In the action picker, choose **Echo parameter**.

1. For **String_Input(text) gets value from**, select **userResponse**.

1. Add a **Message** node. Select **Insert variable** and choose **String_Output**.

    :::image type="content" source="media/advanced-flow-input-output/action-node.png" alt-text="Screenshot of action node for the Echo parameter flow.":::

1. Test your topic in the test bot pane.

    :::image type="content" source="media/advanced-flow-input-output/test-bot.png" alt-text="Screenshot of bot conversation.":::

## Optionally use literal values for input parameters

Alternatively, instead of using a variable as an action's input parameter, you can type the value directly into the box.

:::image type="content" source="media/advanced-flow-input-output/literal-value.png" alt-text="Screenshot of a literal value passed as an input parameter.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
