---
title: Call a flow as an action
description: Call a Power Automate flow from a bot topic using an action node.
keywords: "PVA, flow, automate"
ms.date: 07/28/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: peterswimm
ms.custom: flow, ceX, advanced-authoring
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Call a flow as an action

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Learn how to use a cloud flow in Microsoft Copilot Studio by giving a bot the ability to produce a weather forecast on request. In the previous example, you [created a flow](advanced-flow-create.md) that fetches a weather forecast. In this example, you'll use a **Call an action** node in a bot topic to call the flow when a customer asks about the weather.

If you haven't already [created the weather forecast flow](advanced-flow-create.md), do that now.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Create a flow](advanced-flow-create.md).

## Call a flow from a topic

1. In Microsoft Copilot Studio, go to the [**Topics page**](authoring-create-edit-topics.md) for the bot you want to edit.

1. Create a new topic, and name it **Get weather**.

1. Add the following **trigger phrases**:

    - will it rain
    - today's forecast
    - get weather
    - what's the weather

    :::image type="content" source="media/advanced-use-flow/create-get-weather-topic.png" alt-text="Screenshot of trigger phrases in a new topic.":::

    A message node is created.

1. Enter **I can help you with that** in the message node, and then select **Add node** (**+**) under it to add a new node.

1. Add two **Ask a question** nodes for the **City** and **Zipcode** inputs the flow needs, as shown in the following example.

    :::image type="content" source="media/advanced-use-flow/TopicDialogQuestions.jpg" alt-text="Screenshot of City and Zipcode question nodes in a topic.":::

    Note the names of the variables associated with each response, `Var1` for **City** and `Var2` for **Zipcode**. You can leave them as-is or select the pencil icon and give them a more meaningful name such as "City" and "Zipcode."

1. Select **Add node** (**+**) under the **Zipcode** question node.

1. In the node selection window, select **Call an action**, and then select the flow you created earlier, **Get weather forecast**.

    :::image type="content" source="media/advanced-use-flow/SelectFlowGetWeatherForecast.png" alt-text="Screenshot of a Call an action node with the Get weather forecast flow highlighted.":::

1. Assign the flow inputs to the output variables from the question nodes. **City (text)** gets its value from `Var1` and **Zipcode (number)** gets its value from `Var2`. If you changed the names of the variables, enter the new names instead.

1. Under the flow node, add a **Message** node, and then enter a message that uses the flow's outputs. For example:

    **Today's forecast for `(x)location`:`{x}day_summary`.
    Chance of rain is `{x}chance_of_rain`%**

    :::image type="content" source="media/advanced-use-flow/ActionNodeGetWeatherForecast.png" alt-text="Screenshot of the flow inputs and outputs and the outputs used in a message node.":::

1. Select **Save**.

## Manage a flow used in a bot topic

After you've called a flow from an action node in a bot topic, you can use the node menu to manage the flow. The Microsoft Copilot Studio authoring canvas gives you three options:

- **Delete**: Select to permanently delete the node, and the flow, from the topic.  

- **Refresh flow**: If you've made changes to the flow in the Power Automate portal, select to reload and validate the flow in the topic. You'll need to fix any problems with the flow before you can save the topic.

- **Replace flow**: Select to open the action picker, where you can select or create a different flow.

:::image type="content" source="media/advanced-use-flow/advanced-flow-nodemanage.png" alt-text="Screenshot of flow options in the Microsoft Copilot Studio authoring canvas.":::

## Test your flow and topic

It's a good idea to test the flow and the topic that calls it.

In the **Test bot** pane, type one of the topic's trigger phrases to start a conversation with the bot. Enter your city and zip code when the bot asks for them. Make sure the bot returns today's weather forecast and your message looks the way you expect.

:::image type="content" source="media/advanced-use-flow/GetWeatherE2E.png" alt-text="Screenshot of testing a bot.":::

## Troubleshoot your bot

[Test your bot](authoring-test-bot.md) when you make changes to topics and flows to make sure everything is working. If the bot encounters a problem during a conversation, it will respond with an [error message](error-codes.md).

You'll find most flow-related issues in the [Flow Checker](/power-automate/error-checker). Any issues on the authoring canvas will appear in the [topic checker](authoring-topic-management.md#topic-errors).

[!INCLUDE[footer-include](includes/footer-banner.md)]
