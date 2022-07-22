---
title: "Call a flow as an action"
description: "Call a Power Automate flow from a bot topic using an action node."
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

# Call a flow as an action

Call a Power Automate flow from a bot topic using the **Call an action** node.

These instructions use adding weather information to a flow as an example. If you haven't already, follow the steps under the [Author a flow on the Power Automate portal](advanced-flow-create.md#author-a-flow-on-the-power-automate-portal) to create a weather forecast flow.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]
- [Create a flow](advanced-flow-create.md).
- [Add input and output variables](advanced-flow-input-output.md).

## Call a flow from within a topic

1. In Power Virtual Agents, go to the [**Topics page**](authoring-create-edit-topics.md) for the bot you want to edit.

1. Create a new topic, and name it **Get weather**.

1. Add the following **trigger phrases**:

    - will it rain
    - today's forecast
    - get weather
    - what's the weather

    :::image type="content" source="media/advanced-use-flow/create-get-weather-topic.png" alt-text="Create a new topic." border="false":::

1. By default, a message node is created. Enter **I can help you with that** into the node, and then select the plus (**+**) button under it to add a new node.

    :::image type="content" source="media/advanced-use-flow/handoff-add-node.png" alt-text="Screenshot of adding a node." border="false":::

1. Add two new **Ask a question** nodes to ask users for the **City (String)** and **Zipcode (Number)** inputs.

    :::image type="content" source="media/advanced-use-flow/TopicDialogQuestions.jpg" alt-text="Add Topic Dialog questions." border="false":::

1. Select the plus (**+**) button under the question nodes to add a new node. In the node selection window, select **Call an action**, and then select the flow you created earlier called **Get weather forecast**.

    :::image type="content" source="media/advanced-use-flow/SelectFlowGetWeatherForecast.png" alt-text="Call action." border="false":::

1. Map the flow input blocks to the output variables from the question nodes. **City (text)** gets its value from `Var1 (text)` and **Zipcode (number)** gets its value from `Var2 (number)`.

1. Under the flow's node, add a **Message** node and then enter a message that uses the flow's outputs. For example:

    **Today's forecast for `(x)location`:`{x}day_summary`.
    Chance of rain is `{x}chance_of_rain`%**

    :::image type="content" source="media/advanced-use-flow/ActionNodeGetWeatherForecast.png" alt-text="Input the variables." border="false":::

1. Select **Save** to save your topic.

## Modify a flow on the Power Virtual Agents authoring canvas

Using the node's context menu, you'll see the following options to manage the flow in your dialog:

:::image type="content" source="media/advanced-use-flow/advanced-flow-nodemanage.png" alt-text="Modify flow from the authoring canvas.":::

- **Delete**: This will permanently delete the node that runs the flow, which could disrupt the functionality of the dialog.  

- **Refresh flow**: If changes have been made to a flow in the Power Automate portal, select this to reload the flow in the Power Virtual Agents authoring canvas. The flow will then be validated, and any problems detected will need to be fixed before you can save.

- **Replace flow**: This will show the action picker, allowing you to select or create a different flow to use in your dialog.

## Test your flow and topic

In the **Test bot** pane, start a conversation with the bot by typing in a trigger phrase for the topic that contains the flow.

Enter your city and zip code at the prompt to get today's weather forecast from the bot.

:::image type="content" source="media/advanced-use-flow/GetWeatherE2E.png" alt-text="Test Dialog." border="false":::

## Troubleshoot your bot

[Test your bot](authoring-test-bot.md) when you make changes to your topics and flows, to ensure everything is working as expected. When a bot encounters a problem during a conversation, it will respond with an [error message](error-codes.md).

Most flow-related issues can be found in the [Flow Checker](/power-automate/error-checker), but any issues on the authoring canvas will appear in [topic checker](authoring-topic-management.md#topic-errors).

[!INCLUDE[footer-include](includes/footer-banner.md)]
