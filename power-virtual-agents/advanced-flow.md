---
title: "Automate chatbot actions with flows"
description: "Retrieve data and automate processes in your Power Virtual Agents bot with flows."
keywords: "PVA, flow, automate"
ms.date: 01/06/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: flow, ceX, advanced-authoring
ms.collection: virtual-agent
---




# Add actions to a bot using Power Automate 

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](advanced-flow.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/advanced-flow-teams.md)

You can enable your bot to perform an action by calling a Microsoft Power Automate flow. Flows can help you automate activities, or call backend systems. For example, you can use flows with [end-user authentication](advanced-end-user-authentication.md) to retrieve information about a user after they've signed in.

You call flows from within topics, as a discrete **Call an action** node. You can utilize flows that have already been created in your [Power Apps environment](environments-first-run-experience.md), or you can create a flow from within the Power Virtual Agents [authoring canvas](authoring-create-edit-topics.md).

>[!IMPORTANT]
>To use flows within Power Virtual Agents, they must meet the following requirements:
>* A flow can only be called from a topic located in the same [Microsoft Dataverse environment](/powerapps/maker/common-data-service/data-platform-intro) as your bot.
>* Flows must also be in a solution in Power Automate. You can [move flows into solutions](#optionally-move-a-flow-from-default-solution-to-another-solution) so they are listed in the authoring canvas.
>* [Flow values must be returned synchronously to Power Virtual Agents](#disable-asynchronous-responses-from-flows).


Flows typically use variables to input and output information. The variables can then be used in other nodes within the topic.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]


## Create a new flow from the Power Virtual Agents authoring canvas 



1. Go to the [**Topics page**](authoring-create-edit-topics.md) for the bot you want to edit.

1. Open the authoring canvas for the topic from which you want to call a flow.

1. Select the plus (**+**) button below an existing node to add a new node. 

1. In the node selection window, select **Call an action**, and then select **Create a flow**. 


    :::image type="content" source="media/advanced-flow/UseCreateFlowOption.jpg" alt-text="Create a new Power Automate flow." border="false":::


Using the **Create a flow** option opens a starter flow template in the [Power Automate portal](https://flow.microsoft.com/) in a separate tab.

:::image type="content" source="media/advanced-flow/PVAConnectorTemplate.JPG" alt-text="Power Automate flow template." border="false":::

>[!NOTE]
>The Power Automate portal automatically opens in the same environment as the bot (using the same user credentials).

This template is an example of a flow that can be used by bots. To be suitable for bots, a Power Automate flow requires a special **Power Virtual Agents** trigger and response action: 

- Flow trigger:  **Power Virtual Agents**  

    :::image type="content" source="media/advanced-flow/PVAConnectorTrigger.JPG" alt-text="Power Virtual Agents trigger." border="false":::


- Response action:  **Power Virtual Agents**  

    :::image type="content" source="media/advanced-flow/PVAConnectorResponse.JPG" alt-text="Power Virtual Agents response." border="false":::

## Input and output parameters

There is no upper limit on how many input or output parameters Power Automate flow for a bot can have. Bots can use the following types of inputs and outputs with Power Automate flows:

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

>[!NOTE]
>A bot is able to receive up to 1 MB of data from a Power Automate flow in a single action. There is no upper limit on the maximum size of data that a bot can pass to a Power Automate flow.

### Input parameters

To specify a flow to accept input parameters from a bot, select the **Add an input** option in the **Power Virtual Agents trigger** user interface, and then select the type a - `string`, `number`, or a `boolean`.


:::image type="content" source="media/advanced-flow/PVAConnector_Inputs_1.JPG" alt-text="Power Virtual Agents trigger input types." border="false":::


For example, you can select **Text** and **Number** to add the following input parameters to the flow:
- **String_Input** of type `string`
- **Number_Input** ot type `number` 

:::image type="content" source="media/advanced-flow/PVAConnector_Inputs_2.JPG" alt-text="Power Virtual Agents trigger inputs." border="false":::

### Output parameters

To return output parameters to the bot that can be a `string`, `number`, or a `boolean`, select **Add an output** option in **Power Virtual Agents response** user interface, and then select the type for the output.


:::image type="content" source="media/advanced-flow/PVAConnector_Output_1.JPG" alt-text="Power Virtual Agents response output types." border="false":::


For example, you can select **Text** and **Number** to add the following output parameters to the flow and assign return values for them.
- **String_Output** of type `string`
- **Number_Output** ot type `number`

:::image type="content" source="media/advanced-flow/PVAConnector_Output_2.JPG" alt-text="Power Virtual Agents response outputs." border="false":::

This example creates a fully functional flow that accepts two parameters, a `string` and a `number`, and returns them to a bot as outputs. 

Select **Save** to save your new flow.

:::image type="content" source="media/advanced-flow/PVAConnectorTemplate_SAVE.jpg" alt-text="Power Automate flow template - Save." border="false":::


Your flow is saved to the **Default Solution** under the **Solutions** tab on the Power Automate portal.


:::image type="content" source="media/advanced-flow/default-solution.png" alt-text="Power Automate flow template - Default Solution." border="false":::



## Flows created from the Power Virtual Agents authoring canvas are immediately available to the bot

All flows created from the Power Virtual Agents authoring canvas are saved in a **Default Solution** in Power Automate. They can be used by your bots immediately.

In Power Virtual Agents, you can now see this new flow on the list of available actions when you use the **Call an action node** in the authoring canvas.

:::image type="content" source="media/advanced-flow/FlowInActionPicker.png" alt-text="New flow shows up in Action picker." border="false":::




## Optionally move a flow from Default Solution to another solution

To be available to your bots, flows must be stored in a solution in Power Automate. If you do not want to use the **Default Solution** for this purpose, you can move your flows to another solution.

**Move flow to new or existing solution:**

1. On the Power Automate portal, go to the **Solutions** tab where you can see the available solutions. Use any of the existing solutions or create a new solution for your flows.

1. To create a new solution, select **New solution**.

    :::image type="content" source="media/advanced-flow/NewSolution.jpg" alt-text="Create a solution." border="false":::


1. Give your new solution a name, select **CDS Default Publisher** in the **Publisher** field, enter a **Version** number, and then select **Create**. 

    :::image type="content" source="media/advanced-flow/NewSolution_details.jpg" alt-text="Save a new solution." border="false":::


1. On the **Solutions** tab, go to the solution you want to use. Select **Add existing** to add a flow.

    :::image type="content" source="media/advanced-flow/AddExistingFlow.jpg" alt-text="Add existing menu." border="false":::


1. On the **Add existing flow** page, select the **From solutions** tab, and then select your flow. Select **Add** to add your flow to the solution.

    :::image type="content" source="media/advanced-flow/move-flow-from-solution.png" alt-text="Add flow to a solution." border="false":::
    
   To move a flow from **My flows** tab to a solution, select the **Outside solutions** option. Select **Add** to add your flow to the solution.

    :::image type="content" source="media/advanced-flow/AddExistingFlow_details.jpg" alt-text="Add flow from outside solutions." border="false":::
    

## Modify a flow on the Power Automate portal

You can rename and modify your flow on the Power Automate portal. For example, the flow you just created using the template can be updated to provide a weather forecast when called from a bot.

1. In Power Virtual Agents, you can open a flow by using the flow's **View flow details** link on the list of available actions when you use the **Call an action node** in the authoring canvas.

    :::image type="content" source="media/advanced-flow/ModifyFlowInPicker.png" alt-text="Modify a flow from Action Picker." border="false":::

    If you want to update a flow that is already used in your dialog, the same **View flow details** link is available directly in the Action node.
 
    :::image type="content" source="media/advanced-flow/ModifyFlowInAction.png" alt-text="Modify a flow from Action node." border="false":::
 
    Using the flow's **View flow details** link launches the Power Automate portal in a separate browser tab, and opens the flow in a **Details** page where you can modify it using the **Edit** command.

    :::image type="content" source="media/advanced-flow/FlowEditDetailsPage.png" alt-text="Edit your flow using the Details page." border="false":::

    If you want to open a flow on the Power Automate portal, go to the **Solutions** tab and then open your flow's solution. Use the flow's **Edit menu** to open the flow for editing.

    :::image type="content" source="media/advanced-flow/EditFlow.jpg" alt-text="Open your flow for editing." border="false":::

    
1.  Rename the flow to **Get weather forecast** and then add the following flow input parameters to **Power Virtual Agents** trigger:

    - City (String)
    - Zipcode (Number)


    :::image type="content" source="media/advanced-flow/RenameFlow.jpg" alt-text="Add inputs to the flow." border="false":::

   

1. Choose **Add an action** to create a new action below the **Power Virtual Agents** trigger.

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


This flow is now ready to be used in your bots.


## Call a Power Automate flow as an action from a bot 

You can call a Power Automate flow from a bot topic using the **Call an action** node. You can then pass variables to the flow and receive flow outputs that can be used in a bot conversation.

These instructions use adding weather information to a flow as an example. If you haven't already, follow the steps under the [Modify a flow on the Power Automate portal](#modify-a-flow-on-the-power-automate-portal) section in this topic to create a weather forecast flow.

**Call a flow from within a topic:**

1. In Power Virtual Agents, go to the [**Topics page**](authoring-create-edit-topics.md) for the bot you want to edit.

1. Create a new topic. Name the topic **Get weather** and add the following **trigger phrases**:

    - will it rain
    - today's forecast
    - get weather
    - what's the weather

    :::image type="content" source="media/advanced-flow/create-get-weather-topic.png" alt-text="Create a new Topic." border="false":::

1. By default, a message node is created. Enter **I can help you with that** into the node, and then select the plus (**+**) button under it to add a new node. 

    :::image type="content" source="media/advanced-flow/handoff-add-node.png" alt-text="Screenshot of adding a node." border="false":::

1. Add two new **Ask a question** nodes to ask users for the **City (String)** and **Zipcode (Number)** inputs.


    :::image type="content" source="media/advanced-flow/TopicDialogQuestions.jpg" alt-text="Add Topic Dialog questions." border="false":::


1. Select the plus (**+**) button under the question nodes to add a new node. In the node selection window, select **Call an action**, and then select the flow you created earlier called **Get weather forecast**. 

    :::image type="content" source="media/advanced-flow/SelectFlowGetWeatherForecast.png" alt-text="Call action." border="false":::


1. Map the flow input blocks to the output variables from the question nodes. **City (text)** gets its value from `Var1 (text)` and **Zipcode (number)** gets its value from `Var2 (number)`.

1. Under the flow's node, add a **Message** node and then enter a message that uses the flow's outputs. For example:

    **Today's forecast for `(x)location`:`{x}day_summary`. 
    Chance of rain is `{x}chance_of_rain`%**


    :::image type="content" source="media/advanced-flow/ActionNodeGetWeatherForecast.png" alt-text="Input the variables." border="false":::


1. Select **Save** to save your topic. 

## Pass literal values into action input fields

Alternatively, if you'd rather type in a literal value for an action input instead of using a variable as an action input, you can type the value directly into the field. 

:::image type="content" source="media/advanced-flow/LiteralActionInput.png" alt-text="Pass literal values into action inputs.":::

## Test your flow and topic

In the **Test chat** pane, start a conversation with the bot by typing in a trigger phrase for the topic that contains the flow.

Enter your city and zip code at the prompt to get today's weather forecast from the bot.

:::image type="content" source="media/advanced-flow/GetWeatherE2E.png" alt-text="Test Dialog." border="false":::

## Disable asynchronous responses from flows
Power Virtual Agents doesn't support Power Automate flows that return values [asynchronously](/power-automate/guide-staff-through-common-tasks-processes#when-to-use-workflows). When creating a new flow from within Power Virtual Agents, this behavior is disabled by default.

<!-- TODO: link to 3000 error code page when it exists -->
Flows that have the Asynchronous Response feature enabled may cause an error when your bot tries to run the flow. Instead of running the flow, the bot will say "Something unexpected happened. We're looking into it. Error code: 3000.".

If you've enabled [Asynchronous Response](/azure/connectors/connectors-native-http#asynchronous-request-response-behavior), you'll need to disable it for the bot to work properly when it runs the flow:

<!-- At the time of writing, steps to find the async response setting (specifically in the PVA step/action) didn't exist in PA docs. If this has changed, please remove these steps and replace with the relevant link. -->
**To disable Asynchronous Response**

1. [Locate and modify your flow](#modify-a-flow-on-the-power-automate-portal).
   
1. In your Power Automate flow, locate the Power Virtual Agents step that returns values.
   
1. Next to the name of the flow, select the three dots, and then select **Settings**.
   
    :::image type="content" source="media/advanced-flow/async1.png" alt-text="Open step settings.":::

1. Set **Asynchronous Response** to **Off**, and then select **Done**.
   
    :::image type="content" source="media/advanced-flow/async2.png" alt-text="Disable asynchronous response.":::

## Troubleshoot your bot

While testing your bot in the **Test chat** pane, you can use the **Save snapshot** command to get conversational diagnostics data. This data can help you troubleshoot issues, such as the bot not responding in the way you expect. 

>[!WARNING]
>The snapshot contains all of your bot content, which may include sensitive information.

1. At the top of the **Test chat** pane, select the menu icon (three vertical periods) and then **Save snapshot**.

    :::image type="content" source="media/advanced-flow/save-snapshot.png" alt-text="Save snapshot.":::

2. In the window that appears, select **Save**.

    :::image type="content" source="media/advanced-flow/save-snapshot-window.png" alt-text="Save snapshot message.":::

3. The bot's content and conversational diagnostics will be saved in a .zip archive file called *DSAT.zip*.

    :::image type="content" source="media/advanced-flow/dsat.png" alt-text="Conversational diagnostics archive.":::

4. The *DSAT.zip* file contains two files: *botContent.json* and *dialog.json*. 

    1. *dialog.json* contains conversational diagnostics, including detailed descriptions of errors.

        :::image type="content" source="media/advanced-flow/conversation-file.png" alt-text="Conversational diagnostics file.":::

    1. *botContent.json* contains the bot's topics and other content, including entities and variables used in the bot.


You can help us improve Power Virtual Agents by flagging issues with the **Flag an issue** command on the test bot pane. This submits your conversation ID to Microsoft, which is a unique identifier that Microsoft uses to troubleshoot the issue of the conversation. Other information, such as that in the *DSAT.zip* file, is not sent when you flag an issue.


:::image type="content" source="media/advanced-flow/flag-issue.png" alt-text="Flag an issue.":::


All information collected is anonymous and will be used to help improve bot quality.


[!INCLUDE[footer-include](includes/footer-banner.md)]
