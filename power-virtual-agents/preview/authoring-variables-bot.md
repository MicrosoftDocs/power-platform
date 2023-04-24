---
title: Reuse variables across topics (preview)
description: Use global variables to store and retrieve information across topics in the same bot and user session in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 12/15/2022
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.custom: authoring, ce06122020, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Reuse variables across topics (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

[Variables](authoring-variables.md) store your customers' responses to questions from your bot. For example, you can save a customer's name in a variable called `UserName`. The bot can then address the customer by name as the conversation continues.

By default, a variable's value can only be used in the topic where the variable is created. However, it's possible to reuse the same value across topics. For example, a Welcome topic asks for the customer's name and email address. In the Appointment Booking topic, you want the bot to remember what the customer entered and not ask again.

One way to reuse a variable is to [pass the variable between topics](../authoring-variables.md#passing-variables-between-topics). The other way is to make the variable global in scope, and that's what this article covers. **Global variables** are called that because they're available in all topics across the entire bot.


## Create a global variable

You create a global variable by changing the scope of a topic variable.

1. [Create a variable](authoring-variables.md#create-a-variable) or [use the **Variables** pane](authoring-variables.md#variables-pane) to open an existing variable.

1. On the **Variable properties** pane, select **Global (any topic can access)**.

    The variable name is given the prefix `Global.` to differentiate it from topic-level variables. For example, the variable `UserName` is displayed as `Global.UserName`.

    :::image type="content" source="media/authoring-variables-bot/bot-variable-set.png" alt-text="Screenshot showing the Variable Properties pane, with the Global setting highlighted.":::

1. Save the topic.

    A global variable's name must be unique across all topics. If there's a conflict, you'll need to rename the variable before saving your topic.

## Use global variables

When you're composing a bot message in a Message node or a Question node, select the **{x}** icon to view the variables that are available to the topic. Global variables appear in the **Custom** tab along with any topic variables. Variables are listed in alphabetical order.

:::image type="content" source="media/authoring-variables-bot/bot-variable-select.png" alt-text="Screenshot showing selection of a global variable.":::

## Find all topics using a global variable

You can find where a global variable is defined and what other topics are using it. This can be useful if you're working on a new bot, or if you have multiple variables and [complex topic branching](authoring-using-conditions.md).

1. Select a global variable in the authoring canvas, or open the [**Variables** pane](../authoring-variables.md#using-the-variables-pane) and select a global variable.

1. On the **Variable properties** pane, in the **Reference** section, select any of the topics where the variable is used to go directly to that topic and node.

    :::image type="content" source="media/authoring-variables-bot/bot-variable-used-by.png" alt-text="Screenshot showing the list of topics used by a variable in the Variable properties pane.":::

## Lifecycle of global variables

By default, the value of a global variable persists until [the session](analytics-billed-sessions.md) ends. The **Clear Variable Values** node resets the values of global variables and is used in the [Reset Conversation system topic](authoring-system-topics.md#reset-conversation). That topic can be triggered either by redirection or when the user types a trigger phrase such as "Start over." In that case, all global variables are reset.

## Set a global variable's value from external sources

If you want to make sure the bot starts a conversation with some context, you can initialize a global variable with an external source. Let's say that your site requires users to sign in. Since your bot already knows a user's name, it can greet customers by name before they start typing their first question.

1. Select a global variable.

1. On the **Variable properties** pane, select **External sources can set values**.

### Set global variables in an embedded bot

If you're [embedding your bot in a simple web page](publication-connect-bot-to-web-channels.md#add-your-bot-to-your-website), you can append variables and their definitions to the bot's URL. Or, if you'd like a little more control, you can use a `<script>` code block to call and use variables programmatically.

The variable name in the query string of the URL must match the name of the global variable without the `Global.` prefix. For example, a global variable `Global.UserName` would be referred to as `UserName` in the query.

The examples that follow provide a simple declaration for the variables. In a production scenario, you might pass in as the query parameter or variable definition another variable that has already stored the user's name (for example, if you have the user name from a sign-in script).

Append the variables and their definitions to the bot's URL as [query string parameters](https://en.wikipedia.org/wiki/Query_string) in the format `botURL?variableName1=variableDefinition1&variableName2=variableDefinition2`.

For example:

- You have a global variable named `Global.UserName`.
- Your bot's URL is _https://web.powerva.microsoft.com/webchat/bots/12345_.
- To pass in the user's name when starting a bot conversation on your website, attach the `UserName=` query string as: _https://web.powerva.microsoft.com/webchat/bots/12345?UserName=Renata_.

The parameter name is case-insensitive. `username=Renata` will also work in this example.

### Add global variables to a custom canvas

You can also add the variable to a [custom canvas](customize-default-canvas.md).

1. In the `<script>` section on the page where you have your bot, define the variables as follows, substituting `variableName1` for the variable name without the `Global.` prefix and `variableDefinition1` for the definition. Separate multiple variables with commas (`,`).

    ```html
       const store = WebChat.createStore({}, ({ dispatch }) => next => action => {
         if (action.type === 'DIRECT_LINE/CONNECT_FULFILLED') {
           dispatch({
              type: "WEB_CHAT/SEND_EVENT",
              payload: {
                name: "pvaSetContext",
                value: {
                   "variableName1": "variableDefinition1",
                   "variableName2": "variableDefinition2"
                }
              },
            });
          }
            return next(action);
        });
    ```

1. In your `<script>` section, call the `store` when you embed your bot, as in the following example where `store` is called just above where `styleOptions` is called (you'll need to replace the `BOT_ID` with your bot's ID):

    ```html
    const BOT_ID = "12345-5678";
    const theURL = "https://powerva.microsoft.com/api/botmanagement/v1/directline/directlinetoken?botId=" + BOT_ID;

    fetch(theURL)
        .then(response => response.json())
        .then(conversationInfo => {
            window.WebChat.renderWebChat(
                {
                    directLine: window.WebChat.createDirectLine({
                        token: conversationInfo.token,
                    }),
                    store,
                    styleOptions
                },
                document.getElementById('webchat')
            );
        })
        .catch(err => console.error("An error occurred: " + err));
    ```

### See also

- [Use variables](authoring-variables.md)
- [Customize the look and feel of the bot](customize-default-canvas.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
