---
title: "Work with chatbot variables"
description: "Use variables with custom and prebuilt entities to created customized bot conversations."
keywords: "PVA"
ms.date: 04/05/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: clmori
ms.custom: authoring, ceX
ms.collection: virtual-agent
---

# Use variables

[!INCLUDE[public preview disclaimer](includes/public-preview-disclaimer-prod.md)]

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](authoring-variables.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/authoring-variables-teams.md)

Save customers' responses in a bot conversation to variables and reuse them later in the conversation.

For example, save a customer's name in a variable called `UserName` and the bot can address the customer by name as the conversation continues. Or, use variables to create logical expressions that dynamically route the customer down different conversation paths. You can also [feed variables to Power Automate](advanced-flow-input-output.md) and [Bot Framework skills](/azure/bot-service/bot-builder-skills-overview?view=azure-bot-service-4.0&preserve-view=true) as input parameters, and save the output results from those actions.  

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Entity and variable type

Power Virtual Agents uses [entities](advanced-entities-slot-filling.md) to identify a specific type of information from a user's responses. A variable type is associated with the identified information when it's saved. The variable type is analogous with the entity.

Each entity or variable type maps to a base type, as listed in the following table. The base type determines the operators that you can use when you construct a logical expression with the corresponding variable. It also determines whether you can [feed a variable to a flow](advanced-flow-input-output.md) or [Bot Framework skill](/azure/bot-service/bot-builder-skills-overview?view=azure-bot-service-4.0&preserve-view=true) as an input parameter.

For example, a **boolean** base type maps to an operator "is equal to" with possible values being True or False. A **number** base type gives you numeric operators such as "is equal to," "is greater than," or "is greater than or equal to," and so on.

 | Entity                  | Variable Base Type |
 | ----------------------- | ------------------ |
 | Multiple choice options | String             |
 | User's entire response  | String             |
 | Age                     | Number             |
 | Boolean                 | Boolean            |
 | City                    | String             |
 | Color                   | String             |
 | Continent               | String             |
 | Country or region       | String             |
 | Date and time           | String             |
 | Duration                | String             |
 | Email                   | String             |
 | Event                   | String             |
 | Language                | String             |
 | Money                   | String             |
 | Number                  | String             |
 | Ordinal                 | String             |
 | Organization            | String             |
 | Percentage              | Number             |
 | Person name             | String             |
 | Phone number            | String             |
 | Point of interest       | String             |
 | Speed                   | Number             |
 | State                   | String             |
 | Street address          | String             |
 | Temperature             | Number             |
 | URL                     | String             |
 | Weight                  | Number             |
 | Zip code                | String             |
 | Custom entity           | String             |

## Create a variable

In the bot authoring canvas, add a question node. A variable is created automatically in the node.

1. Go to your bot's [**Topics page**](./authoring-create-edit-topics.md) and open the topic you want to add a variable to.

1. Select **Add node** (**+**), and then select **Ask a question**.

   :::image type="content" source="media/authoring-variables/handoff-add-node.png" alt-text="Screenshot of adding a node.":::

    A variable that contains the user's response is automatically created.

    :::image type="content" source="media/authoring-variables/Automatically_created_variable_(draft).PNG" alt-text="Create a variable.":::

## Pick an entity to use

By default, a question node is created with multiple-choice options. To use a different prebuilt or custom entity, choose what to identify from the node.

:::image type="content" source="media/authoring-variables/Pick_an_entity_(draft).PNG" alt-text="Screenshot of selecting an entity.":::

## Rename a variable

Automatically created variables come with a default name. To rename a variable, select the variable name, enter a new name, and select **Done**.

:::image type="content" source="media/authoring-variables/Rename_a_variable_(draft).PNG" alt-text="Screenshot of renaming a variable.":::

## Use variables in action nodes

When you use a variable in an action node, if its base type matches a parameter type that's specified for a flow or Bot Framework skill, you can feed it to that parameter. The output from action nodes generates new variables.  

:::image type="content" source="media/authoring-variables/User_a_variable_in_Skills(draft).PNG" alt-text="Screenshot of using an entity in an action node.":::

## Use literal values in action nodes

You can type a literal value into the variable input field in an action node instead of selecting a variable from the menu.

:::image type="content" source="media/authoring-variables/LiteralActionInput.png" alt-text="Screenshot showing the use of literal values for action inputs.":::

## Parse Value node

The Parse Value node allows you to convert a value of one type, to a value of another type. When adding a node to a topic, select Add node (+), then Variable management, and Parse Value.

:::image type="content" source="media/authoring-variables/nlu-var-mgt-parse-value.png" alt-text="Screenshot of adding a node, selecting variable management, then parse value.":::

Key scenarios using the Parse Value node focus on converting raw JSON or untyped variables (whose value or structure isn’t know until runtime; for example ChannelData) to concrete types.

The process starts when a Flow is called, which in turn calls an API. The API then returns a result. Typically, you would need to parse this response and return one or more primitive variables to PVA. With the Parse Value node, you can send the entire API result as a string:

```json
{
	"Name" : "Gary",
	"Position" : "PM",
	"Company" : "Microsoft",
	"FormerPositions" : [
		{ "Position" : "Engineer" }
	]
}
```

The string variable that you have now can be converted to a Record variable, with full intellisense support in Power Fx, using this new node. An example using sample data will help illustrate this process.

### Example of using the Parse Value node

1. Add a Parse Value node, and select the variable you want to parse.

:::image type="content" source="media/authoring-variables/nlu-parse-value-select-var.png" alt-text="Screenshot showing the use of literal values for action inputs.":::

2. Select the data type. In this case choose “From Sample Data”.

:::image type="content" source="media/authoring-variables/nlu-parse-value-select-data-type.png" alt-text="Screenshot showing selection of data type for a Parse value node.":::

3. Now you can provide JSON by clicking ‘Get Schema from Sample JSON’. Clicking this opens an editor where you can paste the example.
 
:::image type="content" source="media/authoring-variables/nlu-parse-value-json-sample.png" alt-text="Screenshot showing 'Get schema from sample json.":::

4. Finally, specify which variable you want to place the parsed value into. Usually you would create a new variable for this.

:::image type="content" source="media/authoring-variables/nlu-parse-value-target-var.png" alt-text="Screenshot showing selection of a target variable for a parsed value.":::

Note that the output variable is now of the correct type – Record.

:::image type="content" source="media/authoring-variables/nlu-parse-value-target-verify-content.png" alt-text="Screenshot showing the target variable for the parsed data has the desired type - Record.":::

5. You can now use your new variable. Here in the Power Fx editor, you can see that you get full intellisense for the various properties.

:::image type="content" source="media/authoring-variables/nlu-parse-value-intellisense.png" alt-text="Screenshot showing access to full intellisense for various properties through the Power FX editor.":::

As well as parsing JSON strings, a key use of the Parse value node will be for parsing UntypedObjects at runtime. The most common of these will be when you receive an Event (probably link to the Triggers article here) and you need to parse the Event value. Or you may want to parse the System.Activity.ChannelData property, which varies at runtime by channel.

In the following example, if the event was coming from Teams, you would need to use the Teams developer docs [LINK!?] to find an example of what the incoming event will look like and then use from sample data as outlined in this section.

:::image type="content" source="media/authoring-variables/nlu-parse-value-teams-event.png" alt-text="Screenshot showing an event coming from Teams.":::

## Passing variables between topics

When you redirect to other topics, you can pass values into variables in the destination topic or get variables back from it. Passing variables between topics is especially useful when you already have information that the topic needs. Your users will appreciate not having to answer the question again. It's also helpful when you refactor and separate your topics into reusable components and you want to pass variables across the topics.

> [!NOTE]
> Variables of type `Custom Entity`, `Date and Time`, `Duration`, and `Multiple-choice` can't be passed between topics.  

### Receive values from other topics

When a topic defines a variable (for example, by a question node), the bot asks the user the question to fill in the variable's value. If the bot has already acquired the value, there's no reason to ask the question again. In these cases, you can define the variable as **Receive values from other topics**. When another topic redirects to this one, it can pass a variable (or [literal values](#using-literal-values-on-variable-inputs)) into this variable and skip the question. The experience for the user talking to the bot is seamless.

To receive values from other topics, set the variable's property:

1. In the **Question** node, select the variable that you want to receive values from other topics.

1. In the **Variables properties** pane,  under **Topic (limited scope)** select **Receive values from other topics**.

    :::image type="content" source="media/authoring-variables/authoring-subtopic-pass-variable-properties-receive-input.png" alt-text="Screenshot of the authoring canvas showing the Variable properties pane with Receive values from other topics selected.":::

1. Save the topic.

1. Go to a topic that you want to redirect to. Follow the steps in [Redirect to another topic](authoring-create-edit-topics.md#redirect-to-another-topic) to redirect to the correct topic.

1. Select **+ Add input for destination topic**.

    :::image type="content" source="media/authoring-variables/authoring-subtopic-pass-variable-step1.png" alt-text="Screenshot of the authoring canvas showing adding input for the destination topic.":::
<!-- Please correct the misspelled "Restautant" in this screenshot and any others that show the same topic. :) -->

1. Select a variable in the redirected topic that you want to pass the variable to.

    :::image type="content" source="media/authoring-variables/authoring-subtopic-pass-variable-step2.png" alt-text="Screenshot of the authoring canvas showing selecting the variable in the redirected topic.":::

1. Under **Enter or select a value**, select the variable in the current topic that you want to pass to the redirected topic.

    :::image type="content" source="media/authoring-variables/authoring-subtopic-pass-variable-step3.png" alt-text="Screenshot of the authoring canvas showing selecting the variable from the list of options.":::

    The variable is shown in the redirected node.

    :::image type="content" source="media/authoring-variables/authoring-subtopic-pass-variable-step4.png" alt-text="Screenshot of the authoring canvas showing the variable being passed into the redirected node.":::

### Return values to original topics

When a topic asks a question, or obtains a variable from an action in some other way, the variable can be returned to the original topic that redirected to it.

In this case, the variable also becomes part of the original topic and can be used like any other variable. This helps you construct the topic so that information the bot obtains is available across topics, reducing the need for global variables.

To return a variable to the original topic, set the variable's property:

1. In the **Question** node, select the variable that you want to receive values from other topics.

1. In the **Variables properties** pane, under **Topic (limited scope)** select **Return values to original topics**.

    :::image type="content" source="media/authoring-variables/authoring-subtopic-pass-variable-properties-return-value.png" alt-text="Screenshot of the authoring canvas showing the Variable properties pane with Return values to original topic selected.":::

1. Save the topic.

1. Go to a topic that you want to redirect to. Follow the steps in [Redirect to another topic](authoring-create-edit-topics.md#redirect-to-another-topic) to redirect to the correct topic.

    The variable that's being returned to the topic is shown in the redirected topic. Use the returned variable in your topic.

    :::image type="content" source="media/authoring-variables/authoring-subtopic-pass-variable-pass-receive.png" alt-text="Screenshot of the authoring canvas showing a redirected topic with both values input and returned.":::

### Using the Variables pane

Use the **Variables** pane to select the receive or return status of multiple variables at once.

1. On the topic's menu bar, select **Variables**.

    :::image type="content" source="media/authoring-variables/authoring-subtopic-pass-variable-variables-bar.png" alt-text="Screenshot of the authoring canvas showing the Variables pane icon.":::

1. For each of the variables in the topic, select whether you want the values to be passed, received, or both between topics.

    :::image type="content" source="media/authoring-variables/authoring-subtopic-pass-variable-variable-return-value.png" alt-text="Screenshot of the authoring canvas showing the Variable pane with two variables and a combination of input and output selected.":::

### Using literal values on variable inputs

You can pass literal values as well as variables to a topic. To pass a literal value, type the value you want to use as the input instead of selecting a variable.

:::image type="content" source="media/authoring-variables/authoring-subtopic-pass-variable-literal-value.png" alt-text="Screenshot of the authoring canvas showing literal input on an input variable in a redirect node.":::

## Related links

- [Reuse variables across topics](authoring-variables-bot.md)
- [Customize the look and feel of the bot](customize-default-canvas.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
