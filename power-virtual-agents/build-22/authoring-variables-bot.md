---
ROBOTS: NOINDEX,NOFOLLOW
title: "Use chatbot variables to carry content across topics"
description: "Global variables can be used to store and retrieve information across multiple topics within the same bot and user session"
keywords: "PVA"
ms.date: 5/10/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: authoring, ce06122020
ms.collection: virtual-agent
---

# Reuse variables across topics

[Variables](authoring-variables.md) let you save responses from your customers. For example, you can save a customer's name in a variable called `UserName`. The bot can then address the customer by name as the conversation continues.

By default, a variable's value can only be used in the topic where this variable gets created. However, you might want the bot to use the same value across topics. This means the bot can remember the necessary context when a conversation spans multiple topics.

For example, in a "Welcome" topic, the bot asks for the customer's name and email. Then when the conversation goes to another topic, such as an "Appointment booking" topic, you want the bot to remember this customer's name and email address.

These variables are called **global variables**, because they apply across the entire bot.

Global variables apply during a single user session. Specify the global variables to distinguish them from topic-level variables.

## Create a global variable

1. Create a [new variable](authoring-variables.md#create-a-variable) or [use the variables pane](authoring-variables.md#variables-pane) to open an existing variable.

1. On the **Variable properties** pane, under **Usage**, select **Bot (any topic can access)**.

1. The variable name will be given a prefix string `global.`, to differentiate it from the topic-level variables. For example, the variable `UserName` is now shown as `global.UserName`.

:::image type="content" source="media/authoring-variables-bot/bot-variable-set.png" alt-text="Screenshot showing the Variable Properties pane, with the Usage section highlighted":::

> [!NOTE]
> A global variable's name must be unique across all topics. In the case of a conflict, you'll need to rename the variable before saving your change.

## Use global variables

After you set a global variable, it will be available to all topics.

When you're composing a bot message in a message node or question node, select the `{x}` button to see the global variable. Variables are sorted in alphabetical order, so you'll find that all global variables are grouped together in the variable menu because they all begin with `Global.`.

:::image type="content" source="media/authoring-variables-bot/bot-variable-message.png" alt-text="Screenshot showing selection of the x variable icon to display a list of variables." border="false":::

When you use a condition node, a flow action node, or a skill node, you'll also see global variables available there.

## Manage global variables

After you've created a global variable, you can see where it's first defined and what other topics are using it. This can be useful if you're working on a new bot, or if you have multiple variables and [complex topic branching](authoring-create-edit-topics.md#add-a-condition).

### Go to the source of a global variable's definition

1. Select any variable in the authoring canvas.

1. On the **Variable properties** pane, select **Go to source**.

:::image type="content" source="media/authoring-variables-bot/bot-variable-source.png" alt-text="Screenshot showing the Variable Properties pane, with the Go to Source button highlighted":::

This will take you to the node in the topic where the global variable was created.

### Find all topics using a global variable

1. Select any global variable in the authoring canvas.

1. On the **Variable properties** pane, in the **Used by** section, select any of the topics where the variable is used to go straight to that topic and node.

:::image type="content" source="media/authoring-variables-bot/bot-variable-used-by.png" alt-text="Screenshot showing the list of topics used by a variable in the Variable Properties pane.":::

## Global variable initialization

If a global variable is triggered before it has been initialized (or "filled in"), the bot will automatically trigger the part of the topic where the global variable is first defined&mdash;even when it's in a different topic&mdash;before returning to the original topic. This allows the bot to have all the variables filled in without interrupting the conversation.  

For example, the customer starts the conversation on the "Appointment booking" topic, in which a global variable `global.UserName` is used. However, the `global.UserName` variable is first defined in the "Welcome" topic.

When the conversation comes to the point in the "Appointment booking" topic where `global.UserName` is referenced, the bot will seamlessly pivot to the question node where `global.UserName` is first defined.

After the customer answers the question, the bot will resume the "Appointment booking" topic.

## Global variable behavior when implementing Actions via Power Automate flows or skills

Sometimes, you might use a flow or skill to initialize or fill in a variable in a chatbot.

When a user interacts with the chatbot, however, the variable might be filled in at an earlier point in the conversation, or you may have [already set the variables externally](#set-a-global-variables-value-from-external-sources).

In this situation, the flow or skill will still run and fill in the variable, overwriting whatever was previously stored in the variable.

## Global variables lifecycle and resetting its value

Global variables are accessible from any topic, and the global variable's assigned value persists throughout [the session](analytics-billed-sessions.md#definition-of-a-billed-session).

The value is only cleared when the bot user ends up at [the **Start over** system topic](authoring-create-edit-topics.md#use-system-and-sample-topics), either via redirection from the bot or when the user triggers it directly (for example, by typing *Start over*). In this case, all global variables are reset.

## Set a global variable's value from external sources

If you want to make sure the bot starts a conversation with some context, you can set a global variable to be initialized with an external source.

For example, if your site already knows a user's name, then when they bring up a bot chat, you can let the bot know the customer's name before they start typing their first question. This lets the bot have a more intelligent conversation with the customer without having to ask for their name again.

### Set global variable from external source

1. Select any variable in the authoring canvas.

1. On the **Variable properties** pane, in the **Usage** section, select the checkbox **External sources can set values**.

:::image type="content" source="media/authoring-variables-bot/bot-variable-external.png" alt-text="Screenshot of the Usage section on the Variable Properties pane, with the Bot option and External sources can set values checkbox both selected":::

1. If you're [embedding your bot in a simple webpage](publication-connect-bot-to-web-channels.md#custom-website), you can append the variables and their definitions. Or, if you'd like a little more control, you can use a `<script>` code block to call and use variables programatically.

    > [!NOTE]
    > The variable name in the query string must match that of the global variable, without the `global.` prefix. For example, a global variable `global.UserName` must be rendered as `UserName=`.

In the examples described here, a simple declaration is made for the variables. In a production scenario, you might pass in as the query parameter or variable definition another variable that has already stored the user's name (for example, if you have the user name from a sign-in script).

### To add the variable to an embedded bot

1. Append the variables and their definitions to the bot's URL as [query string parameters](https://en.wikipedia.org/wiki/Query_string) (in the format of `botURL?variableName1=variableDefinition1&variableName2=variableDefinition2`). For example:

    - You have a global variable named `global.UserName`.
    - Your bot's URL is _https://web.powerva.microsoft.com/webchat/bots/12345_.
    - To pass in the user name when starting a bot conversation on a website, you can attach the `UserName=` query string as: _https://web.powerva.microsoft.com/webchat/bots/12345?UserName=Renata_.

1. The parameter name is case-insensitive. This means `username=Renata` will also work in this example.

**To add the variable to a [custom canvas](customize-default-canvas.md)**

1. In the `<script>` section on the page where you have your bot, define the variables as follows, substituting `variableName1` for the variable name without the `global.` prefix and `variableDefinition1` for the definition. Separate multiple variables with commas `,`.

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

## Delete global variables

When removing a global variable used in other topics, the references to that variable in the topics will be marked as `Unknown`.

You'll receive a warning about deleting the global variable before you can confirm the operation.

:::image type="content" source="media/authoring-variables-bot/bot-variable-delete.png" alt-text="The global variable delete message indicates that references to that variable will be labeled as unknown." border="false":::
  
Nodes that contain references to the deleted global variable will tell you they contain an unknown variable.

:::image type="content" source="media/authoring-variables-bot/bot-variable-unknown-node.png" alt-text="Screenshot of a node with references to an unknown variable, which are marked as red within the message node's text, and indicated with a warning that says Bot message contains unknown variable":::

Topics with nodes that contain references to deleted global variables might stop working. Ensure that you remove or correct all the topics that were using the deleted variable before publishing.

## Authentication-related global variables

Depending on the bot's authentication setup, you'll have a set of global variables associated with the authentication provider available to you. For details about which set of variables are available and how to use them, see the [Add end-user authentication to a Power Virtual Agents bot](advanced-end-user-authentication.md) documentation topic.

## Related links

- [Use variables](authoring-variables.md)
- [Customize the look and feel of the bot](customize-default-canvas.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]
