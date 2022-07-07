---
# FIXME: metadata
title: "Add input and output variables"
description: ""
keywords: "PVA, flow, automate"
ms.date: 07/07/2022
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

Flows use variables as input and output parameters to pass information between Power Automate flows and Power Virtual Agents bots.

A bot is only able to _receive_ up to 1 MB of data from a flow in a single action. However, there's no limit on the size of data a bot can send or how many variables a bot can pass.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]
- [Create a flow](advanced-flow.md).

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

## Input parameters

To specify a flow to accept input parameters from a bot, select the **Add an input** option in the **Power Virtual Agents** flow trigger, and then select the type a - `string`, `number`, or a `boolean`.

:::image type="content" source="media/advanced-flow/PVAConnector_Inputs_1.JPG" alt-text="Power Virtual Agents flow trigger input types." border="false":::

For example, select **Text** and **Number** to add the following input parameters to the flow:

- **String_Input** of type `string`
- **Number_Input** of type `number`

:::image type="content" source="media/advanced-flow/PVAConnector_Inputs_2.JPG" alt-text="Power Virtual Agents flow trigger inputs." border="false":::

## Output parameters

To return output parameters to the bot that can be a `string`, `number`, or a `boolean`, select **Add an output** option in **Return value(s) to Power Virtual Agents** response, and then select the type for the output.

:::image type="content" source="media/advanced-flow/PVAConnector_Output_1.JPG" alt-text="Power Virtual Agents response output types." border="false":::

For example, select **Text** and **Number** to add the following output parameters to the flow and assign return values for them.

- **String_Output** of type `string`
- **Number_Output** of type `number`

:::image type="content" source="media/advanced-flow/PVAConnector_Output_2.JPG" alt-text="Power Virtual Agents response outputs." border="false":::

This example creates a fully functional flow that accepts two parameters, a `string` and a `number`, and returns them to a bot as outputs.

Select **Save** to save your new flow.

:::image type="content" source="media/advanced-flow/PVAConnectorTemplate_SAVE.jpg" alt-text="Power Automate flow template - Save." border="false":::

Your flow is saved to the **Default Solution** under the **Solutions** tab on the Power Automate portal.

:::image type="content" source="media/advanced-flow/default-solution.png" alt-text="Power Automate flow template - Default Solution." border="false":::

<!-- FIXME: array sounds too technical - database, list, ...? -->
## Return an array of results
<!-- FIXME: add array draft -->

[!INCLUDE[footer-include](includes/footer-banner.md)]
