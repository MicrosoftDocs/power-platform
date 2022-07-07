---
# FIXME: metadata
title: "Create a flow"
description: ""
keywords: "PVA, flow, automate"
ms.date: 07/07/2022
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

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](advanced-flow.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/advanced-flow-teams.md)

Enable your bot to perform an action by calling a Microsoft Power Automate flow. Flows can help you automate activities or call back-end systems. For example, you can use flows with [end-user authentication](advanced-end-user-authentication.md) to retrieve information about a user after they've signed in.

Flows are called from within topics, as a discrete **Call an action** node. You can use flows that have already been created in your [Power Apps environment](environments-first-run-experience.md), or you can create a flow from within the Power Virtual Agents [authoring canvas](authoring-create-edit-topics.md).

> [!IMPORTANT]
> To use flows within Power Virtual Agents, they must meet the following requirements:
>
> - A flow can only be called from a topic located in the same [Microsoft Dataverse environment](/powerapps/maker/common-data-service/data-platform-intro) as your bot.
>
> - Flows must also be in a solution in Power Automate. You can [move flows into solutions](#optionally-move-a-flow-from-default-solution-to-another-solution) so they're listed in the authoring canvas.
>
> - [Flow values must be returned synchronously to Power Virtual Agents](#disable-asynchronous-responses-from-flows).

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

## Create a new flow from the Power Virtual Agents authoring canvas

1. Go to the [**Topics page**](authoring-create-edit-topics.md) for the bot you want to edit.

1. Open the authoring canvas for the topic from which you want to call a flow.

1. Select the plus (**+**) button below an existing node to add a new node.

1. In the node selection window, select **Call an action** > **Create a flow**.

    :::image type="content" source="media/advanced-flow/UseCreateFlowOption.jpg" alt-text="Create a new Power Automate flow." border="false":::

    You can also select an existing flow from the list and it will automatically be added to the authoring canvas.

    :::image type="content" source="media/advanced-flow/FlowInActionPicker.png" alt-text="New flow shows up in Action picker.":::

Using the **Create a flow** option opens a starter flow template in the [Power Automate portal](https://flow.microsoft.com/) in a separate tab. The portal automatically opens in the same environment as the bot and uses the same user credentials.

:::image type="content" source="media/advanced-flow/PVAConnectorTemplate.JPG" alt-text="Power Automate flow template." border="false":::

> [!NOTE]
> The Power Automate portal automatically opens in the same environment as the bot (using the same user credentials).

This template is an example of a flow that can be used by bots. To be suitable for bots, a Power Automate flow requires a special **Power Virtual Agents** flow trigger and response action:

- Flow trigger:  **When Power Virtual Agents calls a flow**  

    :::image type="content" source="media/advanced-flow/PVAConnectorTrigger.JPG" alt-text="Power Virtual Agents flow trigger." border="false":::

- Response action:  **Return value(s) to Power Virtual Agents**  

    :::image type="content" source="media/advanced-flow/PVAConnectorResponse.JPG" alt-text="Power Virtual Agents response." border="false":::

## Optionally move a flow from Default Solution to another solution

To be available to your bots, flows must be stored in a solution in Power Automate. If you don't want to use the **Default Solution** for this purpose, you can move your flows to another solution.

1. On the Power Automate portal, go to the **Solutions** tab to see the available solutions. Use any of the existing solutions or create a new solution for your flows.

1. To create a new solution, select **New solution**.

    :::image type="content" source="media/advanced-flow/NewSolution.jpg" alt-text="Create a solution." border="false":::

1. Give your new solution a name, select **CDS Default Publisher** in the **Publisher** field, enter a **Version** number, and then select **Create**.

    :::image type="content" source="media/advanced-flow/NewSolution_details.jpg" alt-text="Save a new solution." border="false":::

1. On the **Solutions** tab, go to the solution you want to use. Select **Add existing** to add a flow.

    :::image type="content" source="media/advanced-flow/AddExistingFlow.jpg" alt-text="Add existing menu." border="false":::

1. On the **Add existing flow** page, select the **From solutions** tab, and then select your flow. Select **Add** to add your flow to the solution.

    :::image type="content" source="media/advanced-flow/move-flow-from-solution.png" alt-text="Add flow to a solution." border="false":::

    To move a flow from the **My flows** tab to a solution, select the **Outside solutions** option. Select **Add** to add your flow to the solution.

    :::image type="content" source="media/advanced-flow/AddExistingFlow_details.jpg" alt-text="Add flow from outside solutions." border="false":::

## Modify a flow on the Power Automate portal

You can rename and modify your flow on the Power Automate portal. For example, the flow you just created using the template can be updated to provide a weather forecast when called from a bot.

1. Open a flow in then Power Virtual Agents authoring canvas when using the **Call an action node** by selecting the **View flow details** from the list available actions.

    :::image type="content" source="media/advanced-flow/ModifyFlowInPicker.png" alt-text="Modify a flow from Action Picker." border="false":::

    - If you want to update a flow that is already used in your dialog, the same **View flow details** link is available directly in the Action node.

        :::image type="content" source="media/advanced-flow/ModifyFlowInAction.png" alt-text="Modify a flow from Action node." border="false":::

    - Using the flow's **View flow details** link launches the Power Automate portal in a separate browser tab, and opens the flow in a **Details** page where you can modify it using the **Edit** command.

        :::image type="content" source="media/advanced-flow/FlowEditDetailsPage.png" alt-text="Edit your flow using the Details page." border="false":::

    - If you want to open a flow on the Power Automate portal, go to the **Solutions** tab and then open your flow's solution. Use the flow's **Edit menu** to open the flow for editing.

        :::image type="content" source="media/advanced-flow/EditFlow.jpg" alt-text="Open your flow for editing." border="false":::

1. Rename the flow to **Get weather forecast** and then add the following flow input parameters to **Power Virtual Agents** flow trigger:

    - City (String)
    - Zipcode (Number)

    :::image type="content" source="media/advanced-flow/RenameFlow.jpg" alt-text="Add inputs to the flow." border="false":::

1. Choose **Add an action** to create a new action below the **Power Virtual Agents** flow trigger.

    :::image type="content" source="media/advanced-flow/AddAction.jpg" alt-text="Add flow action." border="false":::

1. Enter **MSN weather** into the search box, and then select the **Get forecast for today** action from the list.

    :::image type="content" source="media/advanced-flow/AddMSNWeather.jpg" alt-text="Add Get forecast action." border="false":::

1. A new **MSN Weather Connector** is added to the flow. Under **Location**, select **Add dynamic content**. Select **City** and **Zipcode** from the list.

    :::image type="content" source="media/advanced-flow/AddLocationForMSN.jpg" alt-text="Pass flow's input parameters to MSN Weather connector as location." border="false":::

1. In the response node **Return value(s) to Power Virtual Agents**, add the output parameters that you want to return to the bot. **Save** your flow.

    - day_summary (String)
    - location (String)
    - chance_of_rain (Number)

    :::image type="content" source="media/advanced-flow/AddDynamicVariables.jpg" alt-text="Add dynamic variables to the flow's response." border="false":::

This flow is now ready to be [used in your bots](advanced-use-flow.md).

## Disable asynchronous responses from flows

Power Virtual Agents doesn't support Power Automate flows that return values [asynchronously](/power-automate/guide-staff-through-common-tasks-processes#when-to-use-workflows). When creating a new flow from within Power Virtual Agents, this behavior is disabled by default.

Flows that have the Asynchronous Response feature enabled may cause an error when your bot tries to run the flow. Instead of running the flow, the bot will say, "Something unexpected happened. We're looking into it. Error code: 3000."

If you've enabled [Asynchronous Response](/azure/connectors/connectors-native-http#asynchronous-request-response-behavior), you'll need to disable it for the bot to work properly when it runs the flow.

<!-- At the time of writing, steps to find the async response setting (specifically in the PVA step/action) didn't exist in PA docs. If this has changed, please remove these steps and replace with the relevant link. -->

### To disable Asynchronous Response

1. [Locate and modify your flow](#modify-a-flow-on-the-power-automate-portal).

1. In your Power Automate flow, locate the Power Virtual Agents step that returns values.

1. Next to the name of the flow, select the three dots, and then select **Settings**.

    :::image type="content" source="media/advanced-flow/async1.png" alt-text="Open step settings.":::

1. Set **Asynchronous Response** to **Off**, and then select **Done**.

    :::image type="content" source="media/advanced-flow/async2.png" alt-text="Disable Asynchronous Response.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
