---
title: Create a flow
description: Create a Power Automate flow that fetches a weather forecast for use with a bot.
keywords: "PVA, flow, automate"
ms.date: 03/24/2023
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: peterswimm
ms.custom: flow, ceX, advanced-authoring
ms.collection: virtual-agent
---

# Create a flow

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Learn how to use a cloud flow in Microsoft Copilot Studio by giving a bot the ability to produce a weather forecast on request. In this first example, you'll create a flow that fetches a weather forecast. In the next example, you'll [call the flow as an action](advanced-use-flow.md) so the bot can respond with the forecast when a customer asks about the weather.

You can create a flow for use with a bot or modify an existing flow. To be suitable for bots, a Power Automate flow requires a special **Microsoft Copilot Studio** flow trigger and response action.

- Flow trigger:  **When Microsoft Copilot Studio calls a flow**  

    :::image type="content" source="media/advanced-flow-create/PVAConnectorTrigger.JPG" alt-text="Screenshot of the Microsoft Copilot Studio flow trigger.":::

- Response action:  **Return value(s) to Microsoft Copilot Studio**  

    :::image type="content" source="media/advanced-flow-create/PVAConnectorResponse.JPG" alt-text="Screenshot of the Microsoft Copilot Studio response action.":::

When you [create a flow](#create-a-flow-to-use-with-a-bot) from the Microsoft Copilot Studio authoring canvas, the trigger and the action are added for you. When you [modify an existing flow](#modify-an-existing-flow-to-use-with-a-bot) for use with a bot, you must add the **Microsoft Copilot Studio** trigger and response action.

[!INCLUDE [Requirements for Power Automate flows](includes/flow-requirements.md)]

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).
- [Get started with Power Automate](/power-automate/getting-started).

## Create a flow to use with a bot

1. Go to the [**Topics page**](authoring-create-edit-topics.md) for your bot.

1. Open the authoring canvas for the topic from which you want to call a flow.

1. Select **Add node** (**+**) below an existing node to add a new node.

1. In the node selection window, select **Call an action**, and then select **Create a flow**.

    :::image type="content" source="media/advanced-flow-create/UseCreateFlowOption.jpg" alt-text="Screenshot of the Create a flow option in the Call an action menu.":::

    The [Power Automate portal](https://flow.microsoft.com) opens in a new tab, with a starter flow template open for editing. The portal opens in the same environment as the bot and uses the same user credentials.

    :::image type="content" source="media/advanced-flow-create/PVAConnectorTemplate.JPG" alt-text="Screenshot of the Power Automate flow template called from Microsoft Copilot Studio.":::

1. Continue to [author the flow in Power Automate](#author-the-flow-on-the-power-automate-portal).

## Modify an existing flow to use with a bot

What if you already have a flow and don't want to create one from scratch to use with your bot? Add the special **Microsoft Copilot Studio** flow trigger and response action yourself. You can open an existing flow for modification in a couple of ways.

### Open a flow from the authoring canvas

1. In a topic that's open in the Microsoft Copilot Studio authoring canvas, select **Add node** (**+**).

1. Select **Call an action**.

1. Select **View flow details** under the flow.

    :::image type="content" source="media/advanced-flow-create/ModifyFlowInPicker.png" alt-text="Screenshot of the Modify a flow button in the action picker.":::

### Open a flow from an Action node

1. In a topic that's open in the Microsoft Copilot Studio authoring canvas, select the relevant **Action** node.

1. Select **View flow details**.

    :::image type="content" source="media/advanced-flow-create/ModifyFlowInAction.png" alt-text="Screenshot of the Modify a flow button in an Action node.":::

### Open a flow in Power Automate

1. Go to the [Power Automate portal](https://flow.microsoft.com).

1. Go to **Solutions** and select **Default Solution**. If you [moved your flow to another solution](#optionally-move-the-flow-to-another-solution), select that one instead.

    :::image type="content" source="media/advanced-flow-create/open-solution.png" alt-text="Screenshot of the Default Solution in the Solutions list.":::

1. Select the flow.

    :::image type="content" source="media/advanced-flow-create/open-flow-in-solution.png" alt-text="Screenshot of the Get weather forecast flow in the Default Solution.":::

### Add the Microsoft Copilot Studio flow trigger and response action

If your flow doesn't already include the special **Microsoft Copilot Studio** flow trigger and response action, you'll need to add them before you can use the flow with your bot.

1. Select **New step**.

1. Search for the **Microsoft Copilot Studio** connector and select **When Microsoft Copilot Studio calls a flow**.

1. Select **New step**.

1. Search for the **Microsoft Copilot Studio** connector and select **Return value(s) to Microsoft Copilot Studio**.

1. Select **Save**.

## Author the flow on the Power Automate portal

Now add actions to your flow. In the current example, the action you'll add fetches the current forecast from MSN Weather.

1. Select the name of the flow and rename it **Get weather forecast**.

    :::image type="content" source="media/advanced-flow-create/RenameFlow.png" alt-text="Screenshot of flow name selected.":::

1. Add the following input parameters to the **Microsoft Copilot Studio** flow trigger:

    - City (Text)
    - Zipcode (Number)

    :::image type="content" source="media/advanced-flow-create/input-params.png" alt-text="Screenshot of input parameters for Power Automate flow.":::

1. Select **Add an action** to create a new action below the **Microsoft Copilot Studio** flow trigger.

    :::image type="content" source="media/advanced-flow-create/AddAction.png" alt-text="Screenshot of the Add flow action button.":::

1. Search for **MSN weather**, and then select the **Get forecast for today** action.

    :::image type="content" source="media/advanced-flow-create/AddMSNWeather.png" alt-text="Screenshot of the Get forecast for today action under the MSN Weather connector.":::

1. In the **Get forecast for today** action, in the **Location** box, select **Add dynamic content**, and then select **City** and **Zipcode**.

    :::image type="content" source="media/advanced-flow-create/AddLocationForMSN.png" alt-text="Screenshot of variables added to the Get forecast for today action":::

1. In the **Return value(s) to Microsoft Copilot Studio** action, add the following output parameters and variables:

    | Output Parameter Name | Type   | Variable        |
    | --------------------- | ------ | --------------- |
    | `day_summary`         | String | Day Summary     |
    | `location`            | String | Location        |
    | `chance_of_rain`      | Number | Day Rain Chance |

    :::image type="content" source="media/advanced-flow-create/AddDynamicVariables.png" alt-text="Screenshot of dynamic output variables added to the flow response action.":::

1. Select **Save**.

The next step is to [turn off asynchronous responses in your flow](#turn-off-asynchronous-responses-in-the-flow).

## Optionally move the flow to another solution

To be available to bots in your environment, flows must be stored in a [solution](/power-platform/alm/solution-concepts-alm) in Power Automate. If you don't want to use the **Default Solution**, you can move your flows to a different one.

1. Go to the [Power Automate portal](https://flow.microsoft.com).

1. Go to **Solutions** and either select an existing solution or create a solution for your flows.

    To create a solution, select **New solution**.

    :::image type="content" source="media/advanced-flow-create/NewSolution.jpg" alt-text="Screenshot of the New solution button.":::

    Give your new solution a name, select **CDS Default Publisher** in the **Publisher** field, enter a **Version** number, and then select **Create**.

    :::image type="content" source="media/advanced-flow-create/NewSolution_details.jpg" alt-text="Screenshot of solution properties.":::

1. On the **Solutions** tab, go to the solution you want to use. Select **Add existing** to add a flow to it.

    :::image type="content" source="media/advanced-flow-create/AddExistingFlow.jpg" alt-text="Screenshot of the Add existing button.":::

1. On the **Add existing flow** page, select the **From solutions** tab, select your flow, and then select **Add**.

    :::image type="content" source="media/advanced-flow-create/move-flow-from-solution.png" alt-text="Screenshot of the list existing flows in solutions.":::

    To move a flow from the **My flows** tab to a solution, select **Outside solutions**, and then select **Add** to add your flow to the solution.

    :::image type="content" source="media/advanced-flow-create/AddExistingFlow_details.jpg" alt-text="Screenshot of the list of existing flows outside of solutions.":::

## Turn off asynchronous responses in the flow

Flows that you want to use in a bot must return values in real time, or [synchronously](/power-automate/guide-staff-through-common-tasks-processes#when-to-use-workflows). Flows that run in the background, or asynchronously, may cause an error when your bot tries to run them. Instead of running the flow, the bot will say, "Something unexpected happened. We're looking into it. Error code: 3000."

When you create a flow from Microsoft Copilot Studio, [asynchronous responses](/azure/connectors/connectors-native-http#asynchronous-request-response-behavior) are turned off by default. If you modified an existing flow that has asynchronous responses turned on, you'll need to change the setting.

1. [Open your flow](#modify-an-existing-flow-to-use-with-a-bot) and find the **Return value(s) to Microsoft Copilot Studio** step.

1. Select the **Menu** (**...**) icon, and then select **Settings**.

    :::image type="content" source="media/advanced-flow-create/async1.png" alt-text="Screenshot of an action's settings menu.":::

1. Set **Asynchronous Response** to **Off**, and then select **Done**.

    :::image type="content" source="media/advanced-flow-create/async2.png" alt-text="Screenshot of the Asynchronous Response toggle.":::

## Related topics

[Call the flow as an action in your bot](advanced-use-flow.md).

Learn more about [input and output variables](advanced-flow-input-output.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
