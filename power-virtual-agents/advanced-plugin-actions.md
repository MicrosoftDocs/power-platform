---
title: Use plugin actions in Power Virtual Agents
description: Use plugin actions to extend the capabilities of your bots.
keywords: "PVA, plugin, connector, flow, automate"
ms.date: 09/14/2023
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: gapretty
ms.custom: plugin, connector, flow, advanced-authoring
ms.collection: virtual-agent
---

# Key concepts - Use plugin actions in Power Virtual Agents (preview)

You can extend the capabilities of your bot by adding one or more plugin actions, which you can call from a Topic. Plugin actions are based on one of the following core action types.

- Pre-built connector action
- Custom connector action
- Power Automate Cloud Flow
- Bot Framework Skill

The core action is marked up with additional information that describes its purpose, allowing the bot to use GPT to generate the questions required to fill any required inputs in order to execute the action. This means that instead of needing to manually author Question nodes to gather all of the input values needed, such as the inputs on a Flow, this is handled for you during runtime.

> [!TIP]
> When using AI generated content, such as the generated questions when running a plugin action, it's a good idea to inform your users that some of the conversation may be AI generated. A common way of achieving this by adding an extra message in the **Start conversation** [System Topic](authoring-system-topics.md), which controls the message shown to your users when a new conversation is started with the bot.

## Adding a plugin action

1. Open your bot and select **Topics**. On the **Topics** page, select **+ Add**, and then select **Plugin action (preview)**. 

   :::image type="content" source="media/advanced-plugin-actions/add-plugin-action.png" alt-text="Screenshot of the Power Virtual Agents navigation pane with Topics and the plugin action button highlighted.":::

1. On the **Add an action (preview)** wizard that is now open, you can search for the action that you would like to use as a plugin action within your bot. The default list shown when you open the wizard contains Power Automate Flows and custom connectors that are available within the environment, commonly used pre-built connectors and Bot Framework Skills that have been registered with your bot.

   :::image type="content" source="media/advanced-plugin-actions/wizard-start.png" alt-text="Screenshot of the first page in the plugin action wizard with the action type filter open":::

1. Select the action that you want to use. You will move to the next step of the wizard to configure the connection for the action. Here your connection may be automatically configured for you, as shown in the example below, or you may be required to configure the connection by following the instructions shown. Once your connection has been successfully configured select **Next**.

   :::image type="content" source="media/advanced-plugin-actions/wizard-connection.png" alt-text="Screenshot of the first page in the plugin action wizard on the connection page":::   

1. Configure the **Display name** and **Description** for your plugin action. Usually, these will have been pre-populated for you based on the action you selected. On this page you can choose if you would like your users to confirm the information they have provided before the plugin action is executed, which can often be useful, especially for actions that make changes for a user such as inserting or updating a record in a table.

To configure a confirmation, check the **Ask the user before running this action** box. You can then choose to either author a message or a card for your confirmation. In both cases you can use Power Fx to insert references to the input values that the user has entered. The input values are held within a Power Fx Record variable called ***Topic.Input***. In the example below, using the MSN Weather connector, the location that the user entered is being inserted by adding ***Topic.Input.location*** as a Power FX snippet.

When you have configured your name, description and confirmation options, select **Next**.

   :::image type="content" source="media/advanced-plugin-actions/wizard-name-description.png" alt-text="Screenshot of the wizard where the name, description and confirmation options can be configured":::

1. For each input on your action, you can now configure the **Display name** and **Description**. These will be used to help the bot generate a question when your plugin runs, to ask the users for a value for the input. e.g. a generated question for the location input shown below could be, ***What is the location you would like to check the weather for? You can enter a City, Region, State, Country, Landmark or Postal Code"***. You can see how the description of the input can influence the generated question. You can also change the **Identify as** option to a specific entity type, depending on the input being collected. 

   :::image type="content" source="media/advanced-plugin-actions/wizard-inputs.png" alt-text="Screenshot of the inputs page in the plugin action wizard":::

1. Once you have configured your inputs, click **Next**.  

1. You can now choose one or more outputs that your plugin action should make available as variables for use within the Topic where your plugin action is called, or elsewhere within your bot. To add an output, select **Add** and then choose from the outputs available, which is defined by the action you selected at the start of the wizard.

   :::image type="content" source="media/advanced-plugin-actions/wizard-outputs.png" alt-text="Screenshot of the output configuration page in the wizard":::

1. As well as defining which variables will be populated by your plugin action for you to use within your Topic, you can choose to have your plugin action output a response back to the user once the action has been executed, such as in the example below where the weather action has been ran and we want to show the user the hi and low temperatures. As with the confirmation editor, you can insert references to output variables from the action using Power Fx, such as the ***Topic.Output.responses.daily.tempLo*** variable shown below.

   :::image type="content" source="media/advanced-plugin-actions/wizard-outputs-response.png" alt-text="Screenshot of the output response editor with the Power Fx editor open":::

1. Select **Next** and you're presented with the final step in the wizard, where you can review your plugin action configuration, optionally going back to make changes. When you're happy with the configuration, select **Add** to finish adding your plugin action to your bot. Once added, your plugin can be see in the **Plugin actions (preview)** tab on the **Topics** page. 

   :::image type="content" source="media/advanced-plugin-actions/plugin-added.png" alt-text="Screenshot of the plugin shown in the plugin actions list":::

## Calling a plugin action

You call a plugin action explicitly from within a Topic, just as when calling other action types, such as Power Automate Flows. Depending on your use case you might use your Flow as part of a wider Topic which uses more nodes or, like the example below for the weather, adding a single plugin action node to a Topic might be all that is needed.

1. In Power Virtual Agents, go to the [**Topics page**](authoring-create-edit-topics.md) for the bot you want to edit.

1. Create a new topic, and name it **Get weather**.

1. Add the following **trigger phrases**:

    - will it rain
    - today's forecast
    - get weather
    - what's the weather

    :::image type="content" source="media/advanced-plugin-action/weather-topic-trigger-phrases.png" alt-text="Screenshot of trigger phrases in a new topic.":::

1. Select **Add node** (**+**) and then select **Call an action**. Switch to the **Plugin actions (preview)** tab and then select the plugin action you created earlier, **Get weather forecast**.

    :::image type="content" source="media/advanced-plugin-action/weather-topic-add-action.png" alt-text="Screenshot of new node menu open and the weather plugin action selected.":::

1. Your **plugin action (preview)** node is now added to your Topic.

    :::image type="content" source="media/advanced-plugin-action/weather-topic-node-added.png" alt-text="Screenshot of the new plugin action node node in the topic.":::

1.  Select **Save**.

## Overriding inputs

By default, when your plugin actions runs, your bot will generate questions for the user to populate the required inputs. However, in some cases you might want to override one or more inputs and provide an explicit value instead of asking the user.

1. Select **Set value** on the node and choose the input you would like to override.

    :::image type="content" source="media/advanced-plugin-action/weather-topic-select-input-override.png" alt-text="Screenshot of the list of inputs that are available to be overridden.":::

1. You can now enter the value you want to set the input to, either by typing a value, selecting a variable or using a formula.

    :::image type="content" source="media/advanced-plugin-action/weather-topic-overridden-input.png" alt-text="Screenshot of the units input having been overridden.":::

Now that this input has been overridden, the bot will no longer ask the user for a value. 

## Test your plugin action

Once you have added a plugin action to a Topic, you can test it. You can see the weather plugin action added earlier being tested below.

GPT driven conversation can be more fluid than traditionally authored questions, allowing a user to answer more than one question in a single turn or amending values that they entered previously. In this example, you can see that the user first chose to check the weather for ***Orlando, FL*** but then, at confirmation stage, they indicated that they wanted to change their location to ***Seattle***. This change to the input value can be done at any time, not just at the confirmation stage.

    :::image type="content" source="media/advanced-plugin-action/weather-topic-test-plugin-action.png" alt-text="Screenshot of the list of inputs that are available to be overridden.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
