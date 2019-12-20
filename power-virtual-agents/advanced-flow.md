---
title: "Automate Power Virtual Agents bot activities with flows"
description: "Retrieve data and automate processes in your Power Virtual Agents bot with flows."
keywords: ""
ms.date: 12/12/2019
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: flow
ms.collection: virtual-agent
---




# Add actions to a bot using Power Automate 


[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

You can enable your bot to perform an action by calling a Microsoft Power Automate flow. Flows can help you automate activities, or call backend systems. For example, you can use flows in conjunction with [end-user authentication](advanced-end-user-authentication.md) to retrieve information about a specific user after they've signed in.

You call flows from within topics, as a discrete **Call an action** node. You can utilize existing flows that have been created in your [Power Apps environment](environments-first-run-experience.md) or you can create a flow from within the Power Virtual Agents [authoring canvas](authoring-create-edit-topics.md).

>[!IMPORTANT]
>The flow that can be called from a topic must be in the same [Common Data Service environment](/powerapps/maker/common-data-service/data-platform-intro) as your bot.
>Flows must also be in a solution in Microsoft Power Automate. You can [move flows into solutions](#move-a-flow-to-the-solutions-tab-on-the-power-automate-portal) so they appear in the authoring canvas.

Flow typically use variables to take in and output information. The variables can then be used in other nodes within the topic.

## Create a new flow from the Power Virtual Agents authoring canvas 


 

**Create a new flow for an existing bot:**


1. Go to the [**Topics page**](authoring-create-edit-topics.md) for the bot you want to edit.

1. Open the authoring canvas for the topic you want to call a flow from.

1. Select the plus (**+**) icon underneath an existing node to add a new node. 

    ![Screenshot of adding a node](media/handoff-add-node.png)

1. In the node selection window, select **Call an action**, and then select **Create a flow**. 


    ![Create a new Power Automate flow](media/UseCreateFlowOption.jpg)


Using the **Create a flow** option will open a starter flow template in the [Power Automate portal](https://preview.flow.microsoft.com/en-us/) in a separate tab.

![Power Automate flow template](media/FlowTemplate.jpg)

>[NOTE]
>The Power Automate portal will automatically open in the same environment as the bot using the same user credentials

This template is an example of a flow that can be used by bots. To be suitable for bots, a Power Automate flow requires a special kind of trigger and response action: 

- Flow trigger:  **HTTP Request**
- Response action:  **HTTP Response**

## Input and output parameters

Bots can use the following types of inputs and outputs with Power Automate flows:

- Number
- String
- Boolean

The following types are unsupported :

- Object
- Date
- Timestamp
- List [String]
- List [Number]
- List [Boolean]
- List [Object]
- List [Date]
- List [Timestamp]


### Input parameters

This example in the template shows how to specify a flow to accept two *input* parameters from a bot - a `string` and a `number` - as specified in the **Request Body JSON Schema** by this JSON snippet:


![Power Automate flow template inputs](media/FlowHttpRequestInputs.jpg)



   ``` JSON
{
    "type": "object",
    "properties": {
        "flow_input_string": {
            "type": "string"
        },
        "flow_input_number": {
            "type": "number"
        }
    }
}
 ```

### Output parameters

An **HTTP Response** action must be used to return outputs to the bot. 

This template provides an example on how to return two *output* parameters to the bot, a `string` and a `number`.


![Power Automate flow template outputs](media/FlowHttpResponseOutputs.jpg)


Note that both the **Body** and **HTTP Response Body JSON Schema** (under **Advanced options**) sections must be filled out in the **HTTP Response** action.

In this example, the **Body** section defines the flow outputs `string` and `number`:

![Power Automate flow template outputs - Body](media/Body.jpg)

```
    {
      "flow_output_string": <flow-provided variable block>
      "flow_output_number": <flow-provided variable block>
    }
```

The **Response Body JSON Schema** section defines the type for the flow outputs defined in the body section:


![Power Automate flow template outputs - Body Schema](media/HttpResponseBodySchema.jpg)


   ``` JSON

{
    "type": "object",
    "properties": {
        "flow_output_string": {
            "type": "string"
        },
        "flow_output_number": {
            "type": "number"
        }
    }
}
```

This template provides a fully functional flow that accepts two parameters, a `string` and a `number`, and returns them to a bot as outputs. 

Select **Save** to save your new flow.

![Power Automate flow template - Save](media/SaveFlowTemplate.jpg)


Your flow will be saved to **My flows** tab on the Power Automate portal.


![Power Automate flow template - Save](media/MyFlows.jpg)





## Move a flow to the Solutions tab on the Power Automate portal

To ensure your flow can be used with a Power Virtual Agent bot, it must be moved from the **My Flows** tab to the **Solutions** tab in the Power Automate portal. 

**Move flow to new or existing solution:**

1. On the Power Automate portal, go to the **Solutions** tab. Here you can see what solutions are already available to you; you can use any of the existing solutions or you can create a new solution for your flows.

1. To create a new solution, select **New solution**.

    ![Create a solution](media/NewSolution.jpg)


1. Give your new solution a name, select **CDS Default Publisher** in the **Publisher** field, provide a **Version** number, and press **Create**. 

    ![Save a new solution](media/NewSolution_details.jpg)


1. On the **Solutions** tab, go to the solution you want to use, such as the one you just create. Select **Add existing** to add a flow.

    ![Add existing menu](media/AddExistingFlow.jpg)


1. In the **Add existing flow** screen, select the **Outside of solutions** tab and select your flow. Then press **Add** to add your flow to the solution.

    ![Add flow from outside solutions](media/AddExistingFlow_details.jpg)


This flow will be moved from the **My Flows** tab and into the solution you chose, on the **Solutions** tab. It is now ready to be used in a bot. 

In Power Virtual Agents, you can now see this flow on the list of available actions when you use the **Call an action node** in the authoring canvas.

![New flow shows up in Action picker](media/FlowInActionPicker.jpg)


## Modify a flow on Power Automate portal

You can rename and modify your flow on the Power Automate Portal. For example, the flow you just created using the template can be updated to provide a weather forecast when called from a bot.

**Modify a flow:**

1. On the Microsoft Power Automate portal, go to the **Solutions** tab and open your flow's solution. Use the flow’s **Edit menu** option to open this flow for editing.

    ![Open your flow for Editing](media/EditFlow.jpg)

1. Rename the flow to **Get weather forecast** and add the following flow input parameters to **Request body JSON Schema** in the **When a HTTP request is received** trigger:

    - City (String)
    - Zipcode (Number)


    ![Open your flow for Editing](media/RenameFlow.jpg)

    ``` JSON
    { 
        "type": "object",
        "properties": {
            "City": {
                "type": "string"
            },
            "Zipcode": {
                "type": "number"
            }
        }
    }
    ``` 

1. Choose **Add an action** to create a new action below the **When a HTTP request is received** trigger

    ![Add flow action](media/AddAction.jpg)

1. Enter **MSN weather** into the search box and choose the **Get forecast for today** action from the list.

    ![Add Get forecast action](media/AddMSNWeather.jpg)

1. A new **MSN Weather Connector** is added to the flow. Under Location, select **Add dynamic content**. Select **City** and **Zipcode** from the list. 

    ![Pass flow's input parameters to MSN Weather connector as location](media/AddLocationForMSN.jpg)

1. Delete both **Initialize Variable** nodes by selecting the **...** icon and then **Delete**.

    ![Add Dynamic variables](media/DeleteVariables.jpg)


1. In the response node **Respond to Power Virtual Agents**, add output parameters that you want to return to the bot. Under **Body**, select **Add dynamic content** and select the following outputs to add them to body of the response node:

    - day_summary (String)
    - location (String)
    - chance_of_rain (Number)


![Add Dynamic variables to flow's reponse](media/AddDynamicVariables.jpg)

1. Under **Advanced options**, add the following JSON code to **Response Body JSON Schema** and then **Save** your changes.

    ![Add Dynamic variables to flow's reponse](media/GetWeatherFlowSave.jpg)

    ``` JSON
    {
        "type": "object",
        "properties": {
            "day_summary": {
                "type": "string"        },
            "location": {
                "type": "string"
            },
            "chance_of_rain": {
                "type": "number"
            }
        }
    }
    
    ```

This flow is now ready to be used in your bots.


## Call Power Automate flow as an Action from a bot 

You can call a Power Automate flow from a bot topic using the **Call an action** node. You can then pass variables to the flow and receive flow outputs that can be used in a bot conversation.

These instructions use the examples described above to add weather information to a flow.

**Call a flow from within a topic:**

1. In Power Virtual Agents, go to the [**Topics page**](authoring-create-edit-topics.md) for the bot you want to edit.

1. Create a new topic, and name it **Get weather**. 

1. Add the following **Trigger phrases**:

    - will it rain
    - today’s forecast
    - get weather
    - what’s the weather

1. Go the **Authoring canvas** for the new topic.

    ![Create a new Topic](media/CreateTopic.jpg)

1. By default, a message node will be created. Enter **I can help you with that.** into the node, and then select the plus (**+**) icon underneath it to add a new node. 

    ![Screenshot of adding a node](media/handoff-add-node.png)

1. Add two new **Ask a question** nodes to have the bot ask users for the **City (String)** and **Zipcode (Number)** inputs.


    ![Add Topic Dialog questions](media/TopicDialogQuestions.jpg)


1. Select the plus (**+**) icon underneath the question nodes to add a new node. In the node selection window, select **Call an action**, and then select the flow you created earlier **Get weather forecast**. 

    ![Call action](media/TopicCallActionWeather.jpg)


1. Map the flow input blocks to the output variables from the question nodes. **City (text)** gets its value from `Var1 (text)` and **Zipcode (number)** gets its value from `Var2 (number)`.

1. Under the flow's node, and a **Message** node and enter a message that uses the  flow’s outputs. For example:

    **Today's forecast for `(x)location`:`{x}day_summary`. 
    Chance of rain is `{x}chance_of_rain`%**


    ![Call action](media/TopicDisplayWeather.jpg)


Press **Save** to save your topic. 


## Test your flow and topic

In the **Test chat** pane, start a conversation with the bot by typing in a trigger phrase for the topic that contains the flow.

Enter your city and zipcode at the prompt to get today's weather forecast from the bot

![Test Dialog](media/TopicTestDialog.jpg)



