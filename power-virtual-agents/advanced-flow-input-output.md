---
title: Add input and output variables
description: Pass variables between a Power Automate flow and a Microsoft Copilot Studio bot.
keywords: "PVA, flow, automate"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: peterswimm
ms.custom: flow, ceX, advanced-authoring
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Add input and output variables

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Use variables as input and output parameters to pass information between Power Automate flows and Microsoft Copilot Studio bots.

> [!IMPORTANT]
> A bot can only _receive_ up to 1 MB of data from a flow in a single action. However, there's no limit on the amount of data a bot can send or how many variables a bot can pass.

In this example, you'll create a flow with an input parameter and return it to a bot as an output parameter.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- Understand how to [create a flow](advanced-flow-create.md) from the Microsoft Copilot Studio authoring canvas.

## Supported parameter types

Bots can use the following types of inputs and outputs with Power Automate flows:

- Number
- String
- Boolean

The following types aren't supported:

- Object
- Date
- Timestamp
- List [String]
- List [Number]
- List [Boolean]
- List [Object]
- List [Date]
- List [Timestamp]

## Create a topic and flow

1. Go to the [**Topics page**](authoring-create-edit-topics.md) for your bot.

1. Create a new topic called **Echo message**.

1. Add the trigger phrase **echo**.

1. Add a **Question** node and enter the message **Tell me something and I'll say it back to you**.

1. For **Identify**, choose **User's entire response**.

1. For **Save response as**, select the pencil icon and rename the variable to **userResponse**.

    :::image type="content" source="media/advanced-flow-input-output/new-topic.png" alt-text="Screenshot of a Question node.":::

1. On the authoring canvas, select **Add node** (**+**). Select **Call an action**, and then select **Create a flow**.

1. In the Power Automate portal, name the flow **Echo parameter**.

## Add input parameters to the flow

1. In the **Microsoft Copilot Studio** flow trigger, select **Add an input**.

    :::image type="content" source="media/advanced-flow-input-output/PVAConnector_Inputs_1.png" alt-text="Screenshot of a Microsoft Copilot Studio flow trigger, with Add an input highlighted.":::

1. Select **Text** and enter the name **String_Input**.

    :::image type="content" source="media/advanced-flow-input-output/PVAConnector_Inputs_2.png" alt-text="Screenshot of the flow trigger input.":::

## Add output parameters to the flow

1. In the **Return value(s) to Microsoft Copilot Studio** response action, select **Add an output**.

    :::image type="content" source="media/advanced-flow-input-output/PVAConnector_Output_1.png" alt-text="Screenshot of the flow response action, with Add an output highlighted.":::

1. Select **Text** and enter the name **String_Output**.

    :::image type="content" source="media/advanced-flow-input-output/PVAConnector_Output_2.png" alt-text="Screenshot of the response action output." :::

1. For the value of **String_Output**, select the **String_Input** variable.

    :::image type="content" source="media/advanced-flow-input-output/use-input-variables-for-output.png" alt-text="Screenshot of an input parameter selected as the value of an output parameter.":::

1. Select **Save**.

## Select variables in the bot topic

1. On the Microsoft Copilot Studio authoring canvas, select **Add node** (**+**), and then select **Call an action**.

1. Select the flow you created earlier, **Echo parameter**.

1. For **String_Input(text) gets value from**, select **userResponse**.

1. Add a **Message** node. Select **Insert variable**, and then select **String_Output**.

    :::image type="content" source="media/advanced-flow-input-output/action-node.png" alt-text="Screenshot of an Action node for the Echo parameter flow.":::

1. Test your topic in the **Test bot** pane.

    :::image type="content" source="media/advanced-flow-input-output/test-bot.png" alt-text="Screenshot of a bot conversation.":::

## Optionally use literal values for input parameters

Alternatively, instead of using a variable as an action's input parameter, you can type the value directly into the "gets value from" box.

:::image type="content" source="media/advanced-flow-input-output/literal-value.png" alt-text="Screenshot of a literal value passed as an input parameter.":::

### Related topics

[Use variables](authoring-variables.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
