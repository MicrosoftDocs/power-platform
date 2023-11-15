---
title: "Use chatbot variables to carry content across topics"
description: "Bot variables can be used to store and retrieve information across multiple topics within the same bot and user session"
keywords: "PVA"
ms.date: 03/24/2023
ms.topic: article
author: KendalBond007
ms.author: iawilt
manager: leeclontz
ms.custom: authoring, ce06122020
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Reuse variables across topics

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

[Variables](authoring-variables.md) store your customers' responses to questions from your bot. For example, you can save a customer's name in a variable called `UserName`. The bot can then address the customer by name as the conversation continues.

By default, a variable's value can only be used in the topic where the variable is created. However, it's possible to reuse the same value across topics. For example, a Welcome topic asks for the customer's name and email address. In the Appointment Booking topic, you want the bot to remember what the customer entered and not ask again.

One way to reuse a variable is to [pass the variable between topics](authoring-variables.md#passing-variables-between-topics). The other way is to make the variable global in scope, and that's what this article covers. **Global variables** are called that because they're available in all topics across the entire bot.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


# [Web app](#tab/webApp)

Bot variables apply during a single user session. You specify which variables should be treated as bot variables to distinguish them from topic-level variables.

### Create a global variable

You create a global variable by changing the scope of a topic variable.

1. [Create a variable](authoring-variables.md#create-a-variable) or [use the **Variables** pane](authoring-variables.md#variables-pane) to open an existing variable.

1. On the **Variable properties** pane, select **Global (any topic can access)**.

    The variable name is given the prefix `Global.` to differentiate it from topic-level variables. For example, the variable `UserName` is displayed as `Global.UserName`.

    :::image type="content" source="media/authoring-variables-bot/bot-variable-set.png" alt-text="Screenshot showing the Variable Properties pane, with the Global setting highlighted.":::

1. Save the topic.

    A global variable's name must be unique across all topics. If there's a conflict, you'll need to rename the variable before saving your topic.

### Use global variables

When you're composing a bot message in a Message node or a Question node, select the **{x}** icon to view the variables that are available to the topic. Global variables appear in the **Custom** tab along with any topic variables. Variables are listed in alphabetical order.

:::image type="content" source="media/authoring-variables-bot/bot-variable-select.png" alt-text="Screenshot showing selection of a global variable.":::

### Find all topics using a global variable

You can find where a global variable is defined and what other topics are using it. This can be useful if you're working on a new bot, or if you have multiple variables and [complex topic branching](authoring-using-conditions.md).

1. Select a global variable in the authoring canvas, or open the [**Variables** pane](authoring-variables.md#using-the-variables-pane) and select a global variable.

1. On the **Variable properties** pane, in the **Reference** section, select any of the topics where the variable is used to go directly to that topic and node.

    :::image type="content" source="media/authoring-variables-bot/bot-variable-used-by.png" alt-text="Screenshot showing the list of topics used by a variable in the Variable properties pane.":::

### Lifecycle of global variables

By default, the value of a global variable persists until [the session](analytics-billed-sessions.md) ends. The **Clear Variable Values** node resets the values of global variables and is used in the [Reset Conversation system topic](authoring-system-topics.md#reset-conversation). That topic can be triggered either by redirection or when the user types a trigger phrase such as "Start over." In that case, all global variables are reset.

### Set a global variable's value from external sources

If you want to make sure the bot starts a conversation with some context, you can initialize a global variable with an external source. Let's say that your site requires users to sign in. Since your bot already knows a user's name, it can greet customers by name before they start typing their first question.

1. Select a global variable.

1. On the **Variable properties** pane, select **External sources can set values**.

#### Set global variables in an embedded bot

If you're [embedding your bot in a simple web page](publication-connect-bot-to-web-channels.md#add-your-bot-to-your-website), you can append variables and their definitions to the bot's URL. Or, if you'd like a little more control, you can use a `<script>` code block to call and use variables programmatically.

The variable name in the query string of the URL must match the name of the global variable without the `Global.` prefix. For example, a global variable `Global.UserName` would be referred to as `UserName` in the query.

The examples that follow provide a simple declaration for the variables. In a production scenario, you might pass in as the query parameter or variable definition another variable that has already stored the user's name (for example, if you have the user name from a sign-in script).

Append the variables and their definitions to the bot's URL as [query string parameters](https://en.wikipedia.org/wiki/Query_string) in the format `botURL?variableName1=variableDefinition1&variableName2=variableDefinition2`.

For example:

- You have a global variable named `Global.UserName`.
- Your bot's URL is _https://web.powerva.microsoft.com/webchat/bots/12345_.
- To pass in the user's name when starting a bot conversation on your website, attach the `UserName=` query string as: _https://web.powerva.microsoft.com/webchat/bots/12345?UserName=Renata_.

The parameter name is case-insensitive. `username=Renata` will also work in this example.

#### Add global variables to a custom canvas

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


# [Classic](#tab/classic)

Bot variables apply during a single user session. You specify which variables should be treated as bot variables to distinguish them from topic-level variables.

### Set bot variables

After you set a bot variable, it will be available to all topics.

When you select the `{x}` button in a message node or question node when you're composing a bot message, you'll see that the bot variable is available. Variables are sorted in alphabetical order, so you'll find that all bot variables are grouped together in the variable menu because they all begin with `bot.`.

:::image type="content" source="media/authoring-variables-bot/bot-variable-message.png" alt-text="Screenshot showing selection of the x variable icon to display a list of variables." border="false":::

When you use a condition node, a flow action node, or a skill node, you'll also see bot variables available there.

### Reuse a variable across topics by setting it as a bot variable

1. Select any variable in the authoring canvas.

1. On the **Variable properties** pane, under **Usage**, select **Bot (any topic can access)**.

1. The variable name will be given a prefix string `bot.`, to differentiate it from the topic-level variables. For example, the variable `UserName` is now shown as `bot.UserName`.

:::image type="content" source="media/authoring-variables-bot/bot-variable-set.png" alt-text="Screenshot showing the Variable Properties pane, with the Usage section highlighted":::

> [!NOTE]
> A bot variable's name must be unique across all topics. In the case of a conflict, you'll need to rename the variable before saving your change.

### Manage bot variables

After you've created a bot variable, you can see where it's first defined and what other topics are using it. This can be useful if you're working on a new bot, or if you have multiple variables and [complex topic branching](authoring-create-edit-topics.md#add-a-condition).

### Go to the source of a bot variable's definition

1. Select any variable in the authoring canvas.

1. On the **Variable properties** pane, select **Go to source**.

:::image type="content" source="media/authoring-variables-bot/bot-variable-source.png" alt-text="Screenshot showing the Variable Properties pane, with the Go to Source button highlighted":::

This will take you to the node in the topic where the bot variable was created.

### Find all topics using a bot variable

1. Select any bot variable in the authoring canvas.

1. On the **Variable properties** pane, in the **Used by** section, select any of the topics where the variable is used to go straight to that topic and node.

:::image type="content" source="media/authoring-variables-bot/bot-variable-used-by.png" alt-text="Screenshot showing the list of topics used by a variable in the Variable Properties pane.":::

### Bot variable initialization

If a bot variable is triggered before it has been initialized (or "filled in"), the bot will automatically trigger the part of the topic where the bot variable is first defined&mdash;even when it's in a different topic&mdash;before returning to the original topic. This allows the bot to have all the variables filled in without interrupting the conversation.  

For example, the customer starts the conversation on the "Appointment booking" topic, in which a bot variable `bot.UserName` is used. However, the `bot.UserName` variable is first defined in the "Welcome" topic.

When the conversation comes to the point in the "Appointment booking" topic where `bot.UserName` is referenced, the bot will seamlessly pivot to the question node where `bot.UserName` is first defined.

After the customer answers the question, the bot will resume the "Appointment booking" topic.

### Bot variable behavior when implementing Actions via Power Automate flows or skills

Sometimes, you might use a flow or skill to initialize or fill in a variable in a chatbot.

When a user interacts with the chatbot, however, the variable might be filled in at an earlier point in the conversation, or you may have [already set the variables externally](authoring-variables-bot.md#set-a-bot-variables-value-from-external-sources).

In this situation, the flow or skill will still run and fill in the variable, overwriting whatever was previously stored in the variable.

### Bot variables lifecycle and resetting its value

Bot variables are accessible from any topic, and the bot variable's assigned value persists throughout [the session](analytics-billed-sessions.md).

The value is only cleared when the bot user is redirected to [the **Start over** system topic](authoring-system-topics.md), or when the user triggers this topic directly (for example, by typing *Start over*). In this case, all bot variables will be reset and won't have any values.

### Set a bot variable's value from external sources

You can set a bot variable to be initialized with an external source. This lets the bot start the conversation with some context.

For example, a customer brings up a bot chat from your web site, and the site already knows the customer's name. You let the bot know the user's name before starting the conversation, and the bot can have a more intelligent conversation with the customer without having to ask for their name again.

### Set bot variable from external source

1. Select any variable in the authoring canvas.

1. On the **Variable properties** pane, in the **Usage** section, select the checkbox **External sources can set values**.

:::image type="content" source="media/authoring-variables-bot/bot-variable-external.png" alt-text="Screenshot of the Usage section on the Variable Properties pane, with the Bot option and External sources can set values checkbox both selected":::

1. You can append the variables and their definitions if you're simply [embedding your bot in a simple webpage](publication-connect-bot-to-web-channels.md#custom-website), or you can use a `<script>` code block to call and use variables programatically.

    > [!NOTE]
    > The variable name in the query string must match that of the bot variable, without the `bot.` prefix. For example, a bot variable `bot.UserName` must be rendered as `UserName=`.

In the examples described here, a simple declaration is made for the variables. In a production scenario, you might pass in as the query parameter or variable definition another variable that has already stored the user's name (for example, if you have the user name from a sign-in script).

### To add the variable to an embedded bot

1. Append the variables and their definitions to the bot's URL as [query string parameters](https://en.wikipedia.org/wiki/Query_string) (in the format of `botURL?variableName1=variableDefinition1&variableName2=variableDefinition2`), for example:

    - You have a bot variable named `bot.UserName`.
    - Your bot's URL is *https://web.powerva.microsoft.com/webchat/bots/12345*.
    - To pass in the user name when starting a bot conversation on a website, you can attach the `UserName=` query string as: *https://web.powerva.microsoft.com/webchat/bots/12345?UserName=Renata*.

1. The parameter name is case-insensitive. This means `username=Renata` will also work in this example.

### To add the variable to a [custom canvas](customize-default-canvas.md)

1. In the `<script>` section on the page where you have your bot, define the variables as follows, substituting `variableName1` for the variable name without the `bot.` prefix and `variableDefinition1` for the definition. Separate multiple variables with commas `,`.

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

1. Within your `<script>` section, call the `store` when you embed your bot, as in the following example where `store` is called just above where `styleOptions` is called (you'll need to replace the `BOT_ID` with your ID):

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

### Delete bot variables

When removing a bot variable used in other topics, the references to that variable in the topics will be marked as `Unknown`.

You'll receive a warning about deleting the bot variable before you can confirm the operation.

:::image type="content" source="media/authoring-variables-bot/bot-variable-delete.png" alt-text="The bot variable delete message indicates that references to that variable will be labeled as unknown." border="false":::
  
Nodes that contain references to the deleted bot variable will tell you they contain an unknown variable.

:::image type="content" source="media/authoring-variables-bot/bot-variable-unknown-node.png" alt-text="Screenshot of a node with references to an unknown variable, which are marked as red within the message node's text, and indicated with a warning that says Bot message contains unknown variable":::

Topics with nodes that contain references to deleted bot variables might stop working. Ensure that you remove or correct all the topics that were using the deleted variable before publishing.

### Authentication-related bot variables

Depending on the bot's authentication setup, you will have a set of bot variables associated with the authentication provider available to you. For details about which set of variables are available and how to use them, see the [Add end-user authentication to a Microsoft Copilot Studio bot](advanced-end-user-authentication.md) documentation topic.


# [Teams](#tab/teams)

### Find all topics using a bot variable in Teams
 
1. Select any bot variable in the authoring canvas.

1. On the **Variable properties** pane, in the **Used by** section, select any of the topics where the variable is used to go straight to that topic and node.

    :::image type="content" source="media/authoring-variables-bot/bot-variable-used-by-teams.png" alt-text="Screenshot showing the list of topics used by a variable in the Variable Properties pane." border="false":::

### Delete bot variables

When removing a bot variable used in other topics, the references to that variable in the topics will be marked as `Unknown`.

You'll receive a warning about deleting the bot variable before you can confirm the operation.

:::image type="content" source="media/authoring-variables-bot/bot-variable-delete-teams.png" alt-text="The bot variable delete message indicates that references to that variable will be labeled as unknown." border="false":::
  
Nodes that contain references to the deleted bot variable will tell you they contain an unknown variable.

:::image type="content" source="media/authoring-variables-bot/bot-variable-unknown-node-teams.png" alt-text="Screenshot of a node with references to an unknown variable, which are marked as red within the message node's text, and indicated with a warning that says Bot message contains unknown variable." border="false":::

Topics with nodes that contain references to deleted bot variables might stop working. Ensure that you remove or correct all the topics that were using the deleted variable before publishing.

### Advanced use of bot variables

For more details on complex and advanced scenarios using bot variables, including authentication, external sources, and initialization flows, [see the Microsoft Copilot Studio web app version of this topic](authoring-variables-bot.md).

---

## Related topics

- [Use variables](authoring-variables.md)
- [Customize the look and feel of the bot](customize-default-canvas.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
