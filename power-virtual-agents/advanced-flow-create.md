---
title: "Create a flow"
description: "Create a Power Automate flow that provides a weather forecast."
keywords: "PVA, flow, automate"
ms.date: 07/19/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.reviewer: peterswimm
ms.custom: flow, ceX, advanced-authoring
ms.collection: virtual-agent
---

# Create a flow

Launch the Power Automate portal directly from Power Virtual Agents to create flows for your bot.

In this example, you'll learn how to create a flow that provides a weather forecast.

[!INCLUDE [Requirements for Power Automate flows](includes/flow-requirements.md)]

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]
- [Get started with Power Automate](/power-automate/getting-started)

## Create a new flow from the authoring canvas

1. Go to the [**Topics page**](authoring-create-edit-topics.md) for the bot you want to edit.

1. Open the authoring canvas for the topic from which you want to call a flow.

1. Select the plus (**+**) button below an existing node to add a new node.

1. In the node selection window, select **Call an action** then **Create a flow**.

    :::image type="content" source="media/advanced-flow/UseCreateFlowOption.jpg" alt-text="Screenshot of the Create a flow option in the Call an action menu." border="false":::

1. A starter flow template is opened in the [Power Automate portal](https://flow.microsoft.com) in a separate tab. The portal automatically opens in the same environment as the bot and uses the same user credentials.

    :::image type="content" source="media/advanced-flow/PVAConnectorTemplate.JPG" alt-text="Screenshot of Power Automate flow template." border="false":::

## Author a flow on the Power Automate portal

To be suitable for bots, a Power Automate flow requires a special **Power Virtual Agents** flow trigger and response action:

- Flow trigger:  **When Power Virtual Agents calls a flow**  

    :::image type="content" source="media/advanced-flow/PVAConnectorTrigger.JPG" alt-text="Screenshot of the Power Virtual Agents flow trigger." border="false":::

- Response action:  **Return value(s) to Power Virtual Agents**  

    :::image type="content" source="media/advanced-flow/PVAConnectorResponse.JPG" alt-text="Screenshot of the Power Virtual Agents response action." border="false":::

Both the trigger and action are automatically added to the flow when you create a flow from the [Power Virtual Agents authoring canvas](#create-a-new-flow-from-the-authoring-canvas).

Now you'll add various actions to your flow to obtain the weather forecast.

1. Select the name of the flow to rename it. Enter `Get weather forecast` as the new name.

    :::image type="content" source="media/advanced-flow/RenameFlow.png" alt-text="Screenshot of flow name selected.":::

1. Add the following flow input parameters to **Power Virtual Agents** flow trigger:

    - City (String)
    - Zipcode (Number)

    :::image type="content" source="media/advanced-flow/input-params.png" alt-text="Screenshot of input parameters for Power Automate flow.":::

1. Choose **Add an action** to create a new action below the **Power Virtual Agents** flow trigger.

    :::image type="content" source="media/advanced-flow/AddAction.png" alt-text="Screenshot of the Add flow action button.":::

1. Enter **MSN weather** into the search box, and then select the **Get forecast for today** action from the list.

    :::image type="content" source="media/advanced-flow/AddMSNWeather.png" alt-text="Screenshot of the Get forecast for today action under the MSN Weather connector.":::

1. A new **MSN Weather Connector** is added to the flow. Under **Location**, select **Add dynamic content**. Select **City** and **Zipcode** from the list.

    :::image type="content" source="media/advanced-flow/AddLocationForMSN.png" alt-text="Screenshot of variables added to the Get forecast for today action":::

1. In the **Return value(s) to Power Virtual Agents** response action, add the following output parameters with the respective variables assigned to them:

    | Output Parameter Name | Type   | Variable        |
    | --------------------- | ------ | --------------- |
    | `day_summary`         | String | Day Summary     |
    | `location`            | String | Location        |
    | `chance_of_rain`      | Number | Day Rain Chance |

    :::image type="content" source="media/advanced-flow/AddDynamicVariables.png" alt-text="Screenshot of dynamic output variables added to the flow response action.":::

1. Select **Save** to save your flow.

## Open an existing flow

There are several ways to open an existing flow for modification.

### Open a flow from the authoring canvas

1. Select the plus (**+**) button on the authoring canvas.

1. Select **Call an action**.

1. Select **View flow details** under the flow in the list.

    :::image type="content" source="media/advanced-flow/ModifyFlowInPicker.png" alt-text="Screenshot of the Modify a flow button in the action picker." border="false":::

### Open a flow from an Action node

Select **View flow details** from the relevant **Action** node.

:::image type="content" source="media/advanced-flow/ModifyFlowInAction.png" alt-text="Screenshot of the Modify a flow button in an Action node." border="false":::

### Open a flow in Power Automate

1. Go to the [Power Automate portal](https://flow.microsoft.com).

1. Go to **Solutions** and select **Default Solution**. If you [moved your flow to another solution](#optionally-move-a-flow-to-another-solution) select that solution instead.

    :::image type="content" source="media/advanced-flow/open-solution.png" alt-text="Screenshot of the Default Solution in the Solutions list.":::

1. Select the flow from the list.

    :::image type="content" source="media/advanced-flow/open-flow-in-solution.png" alt-text="Screenshot of the Get weather forecast flow in the Default Solution.":::

## Optionally move a flow to another solution

To be available to your bots, flows must be stored in a solution in Power Automate. If you don't want to use the **Default Solution** for this purpose, you can move your flows to another solution.

1. On the Power Automate portal, go to the **Solutions** tab to see the available solutions. Use any of the existing solutions or create a new solution for your flows.

1. To create a new solution, select **New solution**.

    :::image type="content" source="media/advanced-flow/NewSolution.jpg" alt-text="Screenshot of the New solution button." border="false":::

1. Give your new solution a name, select **CDS Default Publisher** in the **Publisher** field, enter a **Version** number, and then select **Create**.

    :::image type="content" source="media/advanced-flow/NewSolution_details.jpg" alt-text="Screenshot of solution properties." border="false":::

1. On the **Solutions** tab, go to the solution you want to use. Select **Add existing** to add a flow.

    :::image type="content" source="media/advanced-flow/AddExistingFlow.jpg" alt-text="Screenshot of the Add existing button." border="false":::

1. On the **Add existing flow** page, select the **From solutions** tab, and then select your flow. Select **Add** to add your flow to the solution.

    :::image type="content" source="media/advanced-flow/move-flow-from-solution.png" alt-text="Screenshot of the list existing flows in solutions." border="false":::

    To move a flow from the **My flows** tab to a solution, select the **Outside solutions** option. Select **Add** to add your flow to the solution.

    :::image type="content" source="media/advanced-flow/AddExistingFlow_details.jpg" alt-text="Screenshot of the list of existing flows outside of solutions." border="false":::

## Disable asynchronous responses from flows

Power Virtual Agents doesn't support Power Automate flows that return values [asynchronously](/power-automate/guide-staff-through-common-tasks-processes#when-to-use-workflows). When creating a new flow from within Power Virtual Agents, this behavior is disabled by default.

Flows that have the Asynchronous Response feature enabled may cause an error when your bot tries to run the flow. Instead of running the flow, the bot will say, "Something unexpected happened. We're looking into it. Error code: 3000."

If you've enabled [Asynchronous Response](/azure/connectors/connectors-native-http#asynchronous-request-response-behavior), you'll need to disable it for the bot to work properly when it runs the flow.

<!-- At the time of writing, steps to find the async response setting (specifically in the PVA step/action) didn't exist in PA docs. If this has changed, please remove these steps and replace with the relevant link. -->

1. [Locate and open your flow](#open-an-existing-flow).

1. In your Power Automate flow, locate the Power Virtual Agents step that returns values.

1. Next to the name of the flow, select the three dots, and then select **Settings**.

    :::image type="content" source="media/advanced-flow/async1.png" alt-text="Screenshot of an action's settings menu.":::

1. Set **Asynchronous Response** to **Off**, and then select **Done**.

    :::image type="content" source="media/advanced-flow/async2.png" alt-text="Screenshot of the Asynchronous Response toggle.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
