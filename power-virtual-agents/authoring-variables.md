---
title: "Work with chatbot variables"
description: "Use variables with custom and prebuilt entities to created customized bot conversations."
keywords: "PVA"
ms.date: 05/10/2022
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: clmori
manager: shellyha
ms.custom: authoring, ceX
ms.collection: virtual-agent
---

# Use variables

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](authoring-variables.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/authoring-variables-teams.md)

Save customers' responses in a bot conversation to variables and reuse them later in the conversation. Or, use variables to create logical expressions that dynamically route the customer down different conversation paths.

For example, save a customer's name in a variable called `UserName` and the bot can address the customer by name as the conversation continues.

You can also pass variables to [Power Automate](advanced-flow.md) and [Bot Framework skills](/azure/bot-service/bot-builder-skills-overview?view=azure-bot-service-4.0&preserve-view=true) as input parameters, and save the output results from those actions.  

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

## Variable types

A variable is associated with a **type**. The type determines what values the variable can contain and the operators that you can use when you construct a logical expression with the corresponding variable.

| Type     | Description                                                                                        |
| -------- | -------------------------------------------------------------------------------------------------- |
| String   | A sequence of characters used to represent text.                                                   |
| Boolean  | A logical value that can only be `true` or `false`.                                                |
| Number   | Any real number.                                                                                   |
| Table    | A list of any number of values, but all values must the same type.                                 |
| Record   | A collection of name-value pairs where values can be any type.                                     |
| TimeSpan | A time interval that is measured in days, hours, minutes, seconds, and fractions of a second.      |
| DateTime | A date, time, day of the week, or month relative to a point in time.                               |
| Choice   | A list of string values that have associated synonyms.                                             |
| Blank    | A variable that has no value. See [Blanks in Power Fx](/power-platform/power-fx/data-types#blank). |

A variable's type is set based on the value it is first assigned.

Variables can't be assigned values from other types. For example, a variable given the starting value of `1` is assigned the type "number", so you can't assign the string value `apples`.

When you're testing a bot, a variable may appear temporarily as the type **Unspecified**. An **Unspecified** variable is one that hasn't been initialized yet.

## Entities

Power Virtual Agents uses [entities](advanced-entities-slot-filling.md) to identify a specific type of information from a user's responses. Each entity maps to a **base type**, as listed in the following table.

| Entity                  | Variable Base Type |
| ----------------------- | ------------------ |
| Multiple choice options | Choice             |
| User's entire response  | String             |
| Age                     | Number             |
| Boolean                 | Boolean            |
| City                    | String             |
| Color                   | String             |
| Continent               | String             |
| Country or region       | String             |
| Date and time           | DateTime           |
| Duration                | TimeSpan           |
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

## Create a variable

Variables can be created in any node that prompts you to select a variable, such as the **Set Variable Value** node.

1. Select **+** to add a node, select **Set a variable value**.

1. In the **Set variable** box, select the **>** arrow.

    :::image type="content" source="media/authoring-variables/create-new-variable-button.png" alt-text="Create a variable.":::

1. In the flyout menu that appears, select **Create a new variable**.

    :::image type="content" source="media/authoring-variables/create-variable.png" alt-text="Create a variable.":::

A new variable will be created with a type that's appropriate for its usage. Use the [variable properties pane](#variable-properties-pane) to rename it.

## Set a variable

Typically you'll use a [question node](authoring-create-edit-topics.md#ask-a-question) to save user input to a variable, but there may be situations where you want to set the value manually.

1. To assign a value to a [variable](authoring-variables.md), select **+** to add a node, select **Set a variable value**.

1. For **Set variable**, choose or create a [new variable](#create-a-variable).

    <!-- FIXME: link to powerfx doc -->
1. For **To value**, directly enter a value, select another variable, or use a [PowerFX formula]().

Values entered directly into the **To value** box will always be treated as a string. To set a specific type, use the appropriate PowerFX formula as per the following table:

| Type     | Example formulas                                                                      |
| -------- | ------------------------------------------------------------------------------------- |
| String   | `hi` `hello world!` `chatbot`                                                         |
| Boolean  | Only `true` or `false`                                                                |
| Number   | `1` `532` `5.258` `-9201`                                                             |
| Table    | `[1]` `[45, 8, 2]` `["cats", "dogs"]` `[{ id: 1 }, { id: 4 }]`                        |
| Record   | `{ id: 1 }` `{ message: "hello" }` `{ name: "John", info: { age: 25, weight: 175 } }` |
| TimeSpan | Not supported                                                                         |
| DateTime | `Time(5,0,23)` `Date(2022,5,24)` `DateTimeValue("May 10, 2022 5:00:00 PM")`           |
| Choice   | Not supported                                                                         |
| Blank    | Only `Blank()`                                                                        |

## System variables

There are a number of built-in system variables that provide additional information about a conversation.

<!-- FIXME: link to telephony doc -->
<!-- FIXME: what are "onError triggers"? -->
<!-- best viewed without wordwrap -->
| Name                                 | Type    | Definition                                                                                                                                      |
| ------------------------------------ | ------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| Conversation.Id                      | string  | Unique ID for the current conversation.                                                                                                         |
| Conversation.TopicInitialUserMessage | string  | User message which triggered the current topic.                                                                                                 |
| LastActivity.Id                      | string  | ID of the previously sent [activity](/azure/bot-service/bot-activity-handler-concept?view=azure-bot-service-4.0&tabs=csharp#activity-handling). |
| User.IsLoggedIn                      | boolean | Only `true` when the user is currently signed in.                                                                                               |
| User.Id                              | string  | Unique ID of the user.                                                                                                                          |
| User.DisplayName                     | string  | Display name of the user.                                                                                                                       |
| User.AccessToken                     | string  | Access token for the user.                                                                                                                      |
| User.Language                        | string  | Language of the user.                                                                                                                           |
| Error.Code                           | string  | The error code for the current error. Only visible in OnError trigger.                                                                          |
| Error.Message                        | string  | Message for the current error. Only visible in OnError trigger.                                                                                 |
| Activity.Channel                     | choice  | Channel ID of the current conversation.                                                                                                         |
| Activity.ChannelId                   | string  | Channel ID of the current conversation, as a string.                                                                                            |
| Channel.Specifier                    | string  | Raw value of `ChannelSpecifier` string that was passed by the client.                                                                           |
| Channel.DisplayName                  | string  | Display name of the channel.                                                                                                                    |
| Activity.Text                        | string  | Last message sent by the user.                                                                                                                  |
| Activity.ChannelData                 | any     | An object that contains channel-specific content.                                                                                               |
| Activity.Value                       | any     | Open-ended value.                                                                                                                               |
| Activity.Type                        | choice  | Type of [activity](/azure/bot-service/bot-activity-handler-concept?view=azure-bot-service-4.0&tabs=csharp#activity-handling).                   |
| Activity.TypeId                      | string  | Type of [activity](/azure/bot-service/bot-activity-handler-concept?view=azure-bot-service-4.0&tabs=csharp#activity-handling), as a string.      |
| Activity.Name                        | string  | Name of the event.                                                                                                                              |
| Activity.From.Id                     | string  | Channel-specific unique ID for the sender.                                                                                                      |
| Activity.From.Name                   | string  | Channel-specific user-friendly name of the sender. For the [Telephony channel](), this will include the phone number of the caller.             |

## Use literal values

You can type a literal value into any variable input field instead of selecting a variable from the menu.

:::image type="content" source="media/authoring-variables/set-variable-to-literal.png" alt-text="Screenshot showing the use of literal values for action inputs.":::

:::image type="content" source="media/authoring-variables/set-redirect-variable-to-literal.png" alt-text="Screenshot of the authoring canvas showing literal input on an input variable in a redirect node.":::

## Variables pane

To open the variables pane, in the topic's menu bar, select **Variables**.

:::image type="content" source="media/authoring-variables/open-variable-button.png" alt-text="Screenshot of the variables button.":::

For each of the variables in the topic, select whether you want the values to be passed, received, or both between topics.

:::image type="content" source="media/authoring-variables/variables-pane.png" alt-text="Screenshot of the variables pane.":::

## Variable properties pane

To open the variable properties pane, select a variable in the [variables pane](#variables-pane).

You can also open the variable properties pane by selecting a variable in any node.

:::image type="content" source="media/authoring-variables/select-a-variable.png" alt-text="Screenshot of selecting a variable to open the variable properties pane.":::

In the variable properties pane you can rename a variable, see where a variable is used, or convert a variable to a [global variable](authoring-variables-bot.md).

:::image type="content" source="media/authoring-variables/variable-properties.png" alt-text="Screenshot of the properties pane.":::

## Use variables in action nodes

<!-- FIXME: does this still work this way? flows currently 404  -->

When you use a variable in an action node, if its base type matches a parameter type that's specified for a flow or Bot Framework skill, you can pass it to that parameter. The output from action nodes generates new variables.  

:::image type="content" source="media/authoring-variables/User_a_variable_in_Skills(draft).PNG" alt-text="Screenshot of using an entity in an action node.":::

## Passing variables between topics

When you redirect to other topics, you can pass values into variables in the destination topic or get variables back from it. Passing variables between topics is especially useful when you already have information that the topic needs. Your users will appreciate not having to answer the question again. It's also helpful when you refactor and separate your topics into reusable components and you want to pass variables across the topics.

> [!NOTE]
> Variables of type `Custom Entity`, `Date Time`, and `Duration` can't be passed between topics.  

### Receive values from other topics

When a topic defines a variable (for example, by a question node), the bot asks the user the question to fill in the variable’s value. If the bot has already acquired the value, there's no reason to ask the question again. In these cases, you can define the variable as **Receive values from other topics**. When another topic redirects to this one, it can pass a variable (or [literal values](#use-literal-values)) into this variable and skip the question. The experience for the user talking to the bot is seamless.

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

## Related links

- [Reuse variables across topics](authoring-variables-bot.md)
- [Customize the look and feel of the bot](customize-default-canvas.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
