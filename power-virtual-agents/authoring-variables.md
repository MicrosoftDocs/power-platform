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
manager: leeclontz
ms.custom: authoring, ceX
ms.collection: virtual-agent
---

# Use variables

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can save customers' responses in a bot conversation to variables and reuse them later in the conversation. 

You can also use variables to create logical expressions that dynamically route the customer down different conversation paths. For example, save a customer's name in a variable called `UserName`, and the bot can address the customer by name as the conversation continues.

Variables can also be passed to, and returned from, [other topics](authoring-variables-bot.md) and [Power Automate flows](advanced-flow.md).  

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


# [Web app](#tab/webApp)

Variables can exist at three levels, or scopes:

- **Topic** variables can only be used in the topics in which they're created. This scope is the default for variables that you create.
- [**Global** variables](authoring-variables-bot.md) can be used in all topics. You can change the scope of a topic variable to make it a global variable.
- [**System** variables](#system-variables) are created automatically with your bot. They provide more contextual information about the conversation or the user. They're available in all topics.

### Variable types

A variable is associated with a **base type**. The type determines what values the variable can contain and the operators that you can use when you construct a logical expression with it.

| Type     | Description                                                                                                                                |
| -------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| String   | A sequence of characters used to represent text                                                                                            |
| Boolean  | A logical value that can only be `true` or `false`                                                                                         |
| Number   | Any real number                                                                                                                            |
| Table    | A list of values, but all values must be of the same type                                                                                  |
| Record   | A collection of name-value pairs where values can be of any type                                                                           |
| DateTime | A date, time, day of the week, or month relative to a point in time                                                                        |
| Choice   | A list of string values that have associated synonyms                                                                                      |
| Blank    | A placeholder for "no value" or "unknown value"; for more information, see [Blanks in Power Fx](/power-platform/power-fx/data-types#blank) |

A variable's type is set the first time a value is assigned to it. After that, the type for that variable is fixed and it can't be assigned values of any other type. For example, a variable given the starting value of `1` is assigned the type **Number**. Attempting to assign it to a **String** value of `"apples"` will result in an error.

When you're testing a bot, a variable may appear temporarily as the type **unknown**. An **unknown** variable hasn't been assigned a value yet.

Order of variables is determined from top to bottom of the authoring canvas. That is, nodes at the top of the authoring canvas are considered before nodes at the bottom. When you create branches with **Condition** nodes, branches are ordered from left to right. That is, nodes in the leftmost branch are considered before nodes in the rightmost branch.

### Entities

Microsoft Copilot Studio uses [entities](advanced-entities-slot-filling.md) to identify a specific type of information from a user's responses. The identified information is saved in a variable of the type that's appropriate for the information. The following table lists the variable base type that's associated with prebuilt entities.

| Entity                  | Variable Base Type |
| ----------------------- | ------------------ |
| Multiple-choice options | Choice             |
| User's entire response  | String             |
| Age                     | Number             |
| Boolean                 | Boolean            |
| City                    | String             |
| Color                   | String             |
| Continent               | String             |
| Country or region       | String             |
| Date and time           | DateTime           |
| Email                   | String             |
| Event                   | String             |
| Integer                 | Integer            |
| Language                | String             |
| Money                   | Number             |
| Number                  | Number             |
| Ordinal                 | Number             |
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
| Custom entity           | Choice             |

### Create a variable

Any node that prompts you to select a variable as an output, such as a **Question** node, automatically creates an output variable of the appropriate type.

:::image type="content" source="media/authoring-variables/authoring-variables-default-variable.png" alt-text="Screenshot of a Question node, with the name and type of the default variable highlighted.":::

### Pick an entity to use

**Question** nodes are created with multiple-choice options by default. To use a different prebuilt or custom entity, select the **Identify** box and choose the type of information the bot should listen for.

:::image type="content" source="media/authoring-variables/authoring-variables-select-entity.png" alt-text="Screenshot of a Question node with the Choose information to identify menu open and the Person name entity highlighted.":::

### Rename a variable

Variables are automatically assigned a name when you create them. A best practice is to give your variables meaningful names to make their purpose clear to anyone else who must maintain your bot.

1. Select the variable to open it in the [**Variable properties** pane](#variable-properties-pane).

1. Under **Variable name**, enter a new name for your variable.

### Set a variable

Typically you'll use a **Question** nodeto save user input to a variable. There may be situations where you want to set the value yourself, however. In those cases, use a **Set Variable Value** node.

1. Select **Add node** (**+**) to add a node, and then select **Set a variable value**.

1. Select the box under **Set variable**, and then select **Create a new variable**.

    :::image type="content" source="media/authoring-variables/create-variable.png" alt-text="Screenshot of the Create a new variable button.":::

    A new variable is created. Its type is **unknown** until you assign a value to it.

    :::image type="content" source="media/authoring-variables/authoring-variables-set-variable-value.png" alt-text="Screenshot of a Set Variable Value node with a new variable of unknown type.":::

1. For **To value**, assign a value using one of the following options:

   - Type a [literal value](#use-literal-values).
   - Select an existing variable of the same type. This action sets your variable to the same value as the variable you select.
   - Use a [Power Fx formula](advanced-power-fx.md). Power Fx formulas are useful for more complex types where literal values can't be used, such as Table and Record types.

### Use literal values

Instead of selecting a variable value, you can enter a literal value into any variable.

:::image type="content" source="media/authoring-variables/set-variable-to-literal.png" alt-text="Screenshot showing the use of a literal value for a variable named productName.":::

:::image type="content" source="media/authoring-variables/set-redirect-variable-to-literal.png" alt-text="Screenshot showing a literal value as the input for a variable in a redirect node.":::

The node attempts to interpret literal values as a string, a number, or a boolean type. For example, `123` is interpreted as a number. If you want it to be interpreted as a string value instead, you can wrap the value in double quotes, like this: `"123"`.

For some scenarios, or where you're using more complex types, use a [Power Fx formula](advanced-power-fx.md) to set a specific type.

### Variables pane

The **Variables** pane is where you can view all the variables that are available in the topic, regardless of which nodes they're defined or used in. For each variable, you can select whether it can receive its value from other topics, return its value to other topics, or both. You can also select a variable to edit its properties in the [**Variable properties** pane](#variable-properties-pane).

To open the **Variables** pane, in the topic's menu bar, select **Variables**.

:::image type="content" source="media/authoring-variables/authoring-variables-open-variable-pane.png" alt-text="Screenshot of the Variables pane in the Microsoft Copilot Studio authoring canvas, with the Variables button highlighted.":::

### Variable properties pane

In the **Variable properties** pane, you can rename a variable, see where it's used, or convert it to a [global variable](authoring-variables-bot.md). You can't convert it from a global variable back to a topic variable, however. You can also select whether it can receive values from or pass its value to other topics.

To open the **Variable properties** pane, select a variable in the [**Variables** pane](#variables-pane). You can also open the **Variable properties** pane by selecting a variable in any node.

:::image type="content" source="media/authoring-variables/variable-properties.png" alt-text="Screenshot of the Variable properties pane.":::

### System variables

Every bot comes with built-in system variables that provide additional information about a conversation.

:::image type="content" source="media/authoring-variables/authoring-variables-system-variable-picker.png" alt-text="Screenshot of system variables in a bot topic.":::

Not all system variables are shown in the list. You must access these hidden system variables with a [Power Fx formula](advanced-power-fx.md).

To use system variables in a Power Fx formula, you must add `System.` before the variable name. For example, to include the system variable `User.DisplayName` in a formula, you'd need to refer to it as `System.User.DisplayName`.

| Name                           | Type   | Hidden  | Definition                                                  |
|--------------------------------|--------|---------|-------------------------------------------------------------|
| Activity.Channel               | choice | visible | The channel ID of the current conversation                  |
| Activity.ChannelData           | any    | hidden  | An object that contains channel-specific content            |
| Activity.ChannelId             | string | hidden  | The channel ID of the current conversation, as a string     |
| Activity.From.Id               | string | hidden  | The channel-specific unique ID of the sender                |
| Activity.From.Name             | string | hidden  | The channel-specific user-friendly name of the sender       |
| Activity.Name                  | string | visible | The name of the event                                       |
| Activity.Text                  | string | visible | The most recent message sent by the user                    |
| Activity.Type                  | choice | visible | Type of [activity][]                                        |
| Activity.TypeId                | string | hidden  | Type of [activity][], as a string                           |
| Activity.Value                 | any    | hidden  | Open-ended value                                            |
| Bot.Name                       | string | visible | The name of your bot                                        |
| Channel.DisplayName            | string | hidden  | The display the name of the channel                         |
| Conversation.Id                | string | visible | The unique ID of the current conversation                   |
| LastActivity.Id                | string | visible | The ID of the previously sent [activity][]                  |
| LastMessage.Id                 | string | visible | The ID of the previous message sent by the user             |
| LastMessage.Text               | string | visible | The previous message sent by the user                       |
| Recognizer.TriggerMessage.Id   | string | visible | The ID of the user message that triggered the current topic |
| Recognizer.TriggerMessage.Text | string | visible | The user message that triggered the current topic           |
| User.DisplayName               | string | visible | The display name of the signed-in user                      |

[activity]: /azure/bot-service/bot-activity-handler-concept

### Pass variables between topics

When you redirect one topic to another, you can pass the values of variables between the original topic and the destination topic. Passing variables between topics is especially useful when an earlier topic already collected information that a later topic needs. Your users will appreciate not having to answer the same questions again.

### Receive values from other topics

When a topic defines a variable (for example, in a Question node), the bot asks the user the question to fill in the variable's value. If the bot has already acquired the value in an earlier topic, there's no reason to ask the question again. In these cases, you can set the variable to **Receive values from other topics**. When another topic redirects to this one, it can pass either the value of a variable (or a [literal value](#use-literal-values)) to this variable and skip the question. The experience for the user talking to the bot is seamless.

In this example, we'll use two topics, Greeting and Talk to Customer. Both topics ask for the customer's name. However, if the Greeting topic runs first, the Talk to Customer topic skips its question. Instead, it uses the value of the variable that's passed from the Greeting topic.

Here's the flow of the Talk to Customer topic:

:::image type="content" source="media/authoring-variables/authoring-variables-passed-ex3.png" alt-text="Screenshot of the Talk to Customer topic conversation flow.":::

As shown in the Test bot pane, if this topic is triggered first, it asks the user, "What should I call you?" It stores the value in a string variable called `userName`. The `userName` variable is also set to get its value from other topics. The topic concludes with the message, "I hope you're having a wonderful day, {userName}!"

Here's the flow of the Greeting topic:

:::image type="content" source="media/authoring-variables/authoring-variables-passed-ex1.png" alt-text="Screenshot of the Greeting topic conversation flow.":::

As shown in the Test bot pane, if this topic is triggered first, it asks the user, "What's your name?" It stores the value in a string variable called `UserName`. The topic sends the message, "Pleased to meet you, {UserName}!" It then redirects to the Talk to Customer topic, which sends the message, "I hope you're having a wonderful day, {userName}!" Note, however, that the Talk to Customer topic skipped asking for the user's name again. Instead, it used the value of the `UserName` variable passed from the Greeting topic.

Finally, here's that second conversation again, this time from the perspective of the Talk to Customer topic:

:::image type="content" source="media/authoring-variables/authoring-variables-passed-ex2.png" alt-text="Screenshot of the Talk to Customer topic conversation flow when the Greeting topic is triggered first.":::

Let's walk through the steps to set up a topic to receive values from other topics. We'll use our current example, but the same steps will work anytime a topic needs to get a value from an earlier topic.

#### Set up the destination topic

The destination topic is the topic being redirected to, the one that will receive values from other topics. In our example, it's Talk to Customer.

1. Create or go to your destination topic.

1. Add a Question node and enter `What should I call you?` for the message.

1. Under **Identify**, select the prebuilt entity **Person name**.

1. Select the variable to open the **Variable properties** pane. Name it `userName`, and then select **Receive values from other topics**.

    :::image type="content" source="media/authoring-variables/authoring-variables-passed-destination.png" alt-text="Screenshot of the Talk to Customer topic with the userName variable and its properties highlighted.":::

1. [Add a Message node](authoring-create-edit-topics.md#show-a-message).

1. In the message box, type `I hope you're having a wonderful day, `.

1. Select the **Insert variable** icon (**{x}**), and then select **userName**.

1. Select the space after the variable and type `!`.

1. Save the topic.

#### Set up the source topic

The source topic is the topic doing the redirecting, the one that provides the value that will be passed to the destination topic. In our example, it's Greeting.

1. Go to the source topic.

1. [Add a Redirect node](authoring-topic-management.md#redirect-to-another-topic) and select the destination topic.

1. Select **+ Add input**, and then select the variable from the destination topic that you want to pass a value to.

    :::image type="content" source="media/authoring-variables/authoring-variables-passed-source.png" alt-text="Screenshot of the Greeting topic with the userName variable added as input in a redirect node.":::

1. Select the **>** icon, and then select the variable whose value you want to pass.

    :::image type="content" source="media/authoring-variables/authoring-variables-passed-source-selected.png" alt-text="Screenshot of the Greeting topic with the UserName variable value selected.":::

    The Redirect node should look like this:

    :::image type="content" source="media/authoring-variables/authoring-variables-passed-source-final.png" alt-text="Screenshot of the Greeting topic with the completed Redirect node.":::

1. Save the topic.

### Return values to original topics

When a topic is redirected to and obtains a variable by asking a question or in some other way, the variable can be returned to the original topic. The variable becomes part of the original topic and can be used like any other variable. Information the bot obtains is thus available across topics, reducing the need for [global variables](authoring-variables-bot.md).

Let's continue with the example from the previous section. We'll ask a new question in the Talk to Customer topic, and then return the answer to the Greeting topic.

#### Set up the source topic for a returned variable

When you're returning a variable to a topic, the source topic is the topic being redirected to, the one that provides the value that will be passed back to the original topic. In this example, it's Talk to Customer.

1. Go to the source topic.

1. Add a Question node and enter `What city do you live in?` for the message.

1. Under **Identify**, select the prebuilt entity **City**.

1. Select the variable to open the **Variable properties** pane. Name it `userCity`, and then select **Return values to original topics**.

    :::image type="content" source="media/authoring-variables/authoring-variables-returned-source.png" alt-text="Screenshot of the Talk to Customer topic with the userCity variable and its properties highlighted.":::

1. Save the topic.

#### Set up the destination topic for a returned variable

When you're returning a variable to a topic, the destination topic is the topic doing the redirecting, the one that will receive values from other topics. In our example, it's Greeting.

1. Go to the destination topic.

1. The variable you selected in the source topic should appear in the Redirect node as an output variable.

    :::image type="content" source="media/authoring-variables/authoring-variables-returned-destination.png" alt-text="Screenshot of the Greeting topic conversation flow with a returned variable in a Redirect node.":::

1. Save the topic.


# [Classic](#tab/classic)

### Entity and variable type

Microsoft Copilot Studio uses [entities](advanced-entities-slot-filling.md) to identify a specific type of information from a user's responses. A variable type is associated with the identified information when it's saved. The variable type is analogous with the entity.

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

### Create a variable

In the bot authoring canvas, add a question node. A variable is created automatically in the node.

1. Go to your bot's [**Topics page**](./authoring-create-edit-topics.md) and open the topic you want to add a variable to.

1. Select **Add node** (**+**), and then select **Ask a question**.

   :::image type="content" source="media/authoring-variables/handoff-add-node.png" alt-text="Screenshot of adding a node.":::

    A variable that contains the user's response is automatically created.

    :::image type="content" source="media/authoring-variables/Automatically_created_variable_(draft).PNG" alt-text="Create a variable.":::

### Pick an entity to use

By default, a question node is created with multiple-choice options. To use a different prebuilt or custom entity, choose what to identify from the node.

:::image type="content" source="media/authoring-variables/Pick_an_entity_(draft).PNG" alt-text="Screenshot of selecting an entity.":::

### Rename a variable

Automatically created variables come with a default name. To rename a variable, select the variable name, enter a new name, and select **Done**.

:::image type="content" source="media/authoring-variables/Rename_a_variable_(draft).PNG" alt-text="Screenshot of renaming a variable.":::

### Use variables in action nodes

When you use a variable in an action node, if its base type matches a parameter type that's specified for a flow or Bot Framework skill, you can feed it to that parameter. The output from action nodes generates new variables.  

:::image type="content" source="media/authoring-variables/User_a_variable_in_Skills(draft).PNG" alt-text="Screenshot of using an entity in an action node.":::

### Use literal values in action nodes

You can type a literal value into the variable input field in an action node instead of selecting a variable from the menu.

:::image type="content" source="media/authoring-variables/LiteralActionInput.png" alt-text="Screenshot showing the use of literal values for action inputs.":::

## Parse Value node

The Parse Value node allows you to convert a value of one type, to a value of another type. When adding a node to a topic, select Add node (+), then Variable management, and Parse Value.

:::image type="content" source="media/authoring-variables/nlu-var-mgt-parse-value.png" alt-text="Screenshot of adding a node, selecting variable management, then parse value.":::

Key scenarios using the Parse Value node focus on converting raw JSON or untyped variables (whose value or structure isn’t know until runtime; for example ChannelData) to concrete types.

The process starts when a Flow is called, which in turn calls an API. The API then returns a result. Typically, you would need to parse this response and return one or more primitive variables to Microsoft Copilot Studio. With the Parse Value node, you can send the entire API result as a string:

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

:::image type="content" source="media/authoring-variables/nlu-parse-value-select-var.png" alt-text="Screenshot showing selection of the variable to parse.":::

2. Select the data type. In this case choose “From Sample Data”.

:::image type="content" source="media/authoring-variables/nlu-parse-value-select-data-type.png" alt-text="Screenshot showing selection of data type for a Parse value node.":::

3. Now you can provide JSON by clicking ‘Get Schema from Sample JSON’. Clicking this opens an editor where you can paste the example.
 
:::image type="content" source="media/authoring-variables/nlu-parse-value-json-sample.png" alt-text="Screenshot showing 'Get schema from sample json.":::

4. Finally, specify which variable you want to place the parsed value into. Usually you would create a new variable for this.

:::image type="content" source="media/authoring-variables/nlu-parse-value-target-var.png" alt-text="Screenshot showing selection of a target variable for a parsed value.":::

Note that the output variable is now of the correct type – Record.

:::image type="content" source="media/authoring-variables/nlu-parse-value-target-verify-content.png" alt-text="Screenshot showing the target variable for the parsed data has the desired type - Record.":::

5. You can now use your new variable. Here in the Power Fx editor, you can see that you get full intellisense for the various properties.

:::image type="content" source="media/authoring-variables/nlu-parse-value-iltellisense.png" alt-text="Screenshot showing access to full intellisense for various properties through the Power FX editor.":::

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

## Related topics

- [Reuse variables across topics](authoring-variables-bot.md)
- [Customize the look and feel of the bot](customize-default-canvas.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
