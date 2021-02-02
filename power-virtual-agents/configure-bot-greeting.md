---
title: "Automatically start a chatbot conversation"
description: "Configure your bot to start a conversation automatically, as soon as it's loaded"
keywords: "PVA"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: digantak
manager: shellyha
ms.custom: "customization, ce06102020"
ms.collection: virtualagent
---

# Configure your bot to start the conversation automatically

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](configure-bot-greeting.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/configure-bot-greeting-teams.md)

By default, chatbots created with Power Virtual Agents and [published to a website](publication-connect-bot-to-web-channels.md) will load without a greeting, and will passively wait for the user to start the conversation.

However, you can use custom CSS and JavaScript code to automatically have the bot start the conversation when the bot loads.

For example, you could have your bot say, "Hi, I'm Botty, a virtual agent" as soon as the bot loads.

First, you'll need to deploy a custom canvas that includes arguments that trigger the greeting. By default, the custom canvas calls the default system greeting topic. You can, however, create a new topic to be used as the greeting, although you will need to divert the default system greeting topic to a new topic.

You can also combine the customized greeting with [customization to the look and feel of the bot](customize-default-canvas.md).

>[!IMPORTANT]
>Having the bot start the conversation will show up in your [analytics](analytics-overview.md) and will increase your session count.
>If the user of your bot doesn't engage with the bot (for example, they load the page but don't ask the bot anything), the session will be [marked as an unengaged session](analytics-summary.md#engagement-over-time-chart). 
>This might impact your analytics.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

>[!IMPORTANT]
>You may install and use the sample code included in this documentation only for use with the Microsoft Power Virtual Agents product. The sample code is licensed "as is" and is excluded from any service level agreements or support services. You bear the risk of using it. 
>Microsoft gives no express warranties, guarantees, or conditions and excludes all implied warranties, including merchantability, fitness for a particular purpose, and non-infringement.


## Retrieve bot ID details

To customize the greeting, you need to know your Bot ID. 

You can get the Bot ID by [going to the Mobile app under Channels](publication-connect-bot-to-custom-application.md#retrieve-your-power-virtual-agents-bot-parameters). 


## Deploy a custom canvas for your bot

You'll need to deploy a custom canvas that includes arguments that cause the [default system greeting topic](authoring-create-edit-topics.md#use-system-and-sample-topics) to be displayed when the bot loads.

1. [Create and publish a bot](fundamentals-get-started.md).

2. Copy and paste the HTML code below and save it as *index.html*.  
    You can also copy and paste the code below into the [w3schools.com HTML try it editor](https://www.w3schools.com/html/tryit.asp?filename=tryhtml_default). You will still need to add your Bot ID.  

    ```HTML
      <!DOCTYPE html>
        <html>
        <head>
            <title>Contoso Sample Web Chat</title> 
            <!-- This styling is for the canvas demonstration purposes. It is recommended 
        that style is moved to separate file for organization in larger projects -->
            <style>
                html, body {
                    height: 100%;
                }
                body {
                    margin: 0;
                }
                h1 {
                    font-size: 16px;
                    font-family: Segoe UI;
                    line-height: 20px;
                    color: whitesmoke;
                    display: table-cell;
                    padding: 13px 0px 0px 20px;
                }
                .heading {
                    background-color: black;
                    height: 50px;
                }
                .main {
                    margin: 18px;
                    border-radius: 4px;
                }

                div[role="form"]{
                    background-color: black;
                }        
                #webchat {
                    position: fixed;
                    height: calc(100% - 50px);
                    width: 100%;
                    top: 50px;
                    overflow: hidden;
                }
              </style>
        </head>
        <body>
            <div>
                <div class="heading">

                    <!-- Change the h1 text to change the bot name -->    
                    <h1>Contoso Bot Name</h1>

                </div>
                <div id="webchat" role="main"></div>
            </div>    
          <script src="https://cdn.botframework.com/botframework-webchat/latest/webchat.js"></script>
          <script>
                const styleOptions = {
                   // Add styleOptions to customize web chat canvas
                   hideUploadButton: true
                };

                // Add your BOT ID below
                var BOT_ID = "<ENTER YOUR BOT ID>"; 

                var theURL = "https://powerva.microsoft.com/api/botmanagement/v1/directline/directlinetoken?botId=" + BOT_ID;

                const store = window.WebChat.createStore(
                   {},
                   ({ dispatch }) => next => action => {
                       if (action.type === "DIRECT_LINE/CONNECT_FULFILLED") {
                          dispatch({
                              meta: {
                                   method: "keyboard",
                               },
                               payload: {
                                   activity: {
                                         channelData: {
                                              postBack: true,
                                         },
                                          //Web Chat will show the 'Greeting' System Topic message which has a trigger-phrase 'hello'
                                          name: 'startConversation',
                                          type: "event"
                                     },
                                },
                                type: "DIRECT_LINE/POST_ACTIVITY",
                           });
                     }
                     return next(action);
                  }
               );
               fetch(theURL)
                    .then(response => response.json())
                    .then(conversationInfo => {
                        window.WebChat.renderWebChat(
                            {
                                directLine: window.WebChat.createDirectLine({
                                    token: conversationInfo.token,
                                }),
                                store: store,
                                styleOptions: styleOptions
                            },
                            document.getElementById('webchat')
                        );
                    })
                    .catch(err => console.error("An error occurred: " + err));
            </script>
          </body>
        </html>
    ```

4. In the *index.html* file you created, enter your Bot ID at the line `var BOT_ID = "<ENTER YOUR BOT ID>"`.

5. Open *index.html* using a modern browser (for example, Microsoft Edge) to open the bot in the custom canvas.

6. Test the bot to ensure you are receiving responses from your bot and that it's working correctly.  
    If you encounter problems, make sure you've published your bot, and that your Bot ID has been inserted in the correct place. It should be after the equals sign (=) at the line `var BOT_ID`, and surrounded by double quotation marks (").

## Change the bot's default greeting

The code in the *index.html* file causes a topic to be called automatically when the bot is loaded. By default, it calls the system greeting topic. You can also create a new topic and divert the default system greeting topic to that new topic.



In both instances, you [make changes to the topic you want to call as you would normally](authoring-create-edit-topics.md).

We recommend you modify the system greeting topic so that you don't have to edit the *index.html* code.

### Modify the system greeting topic (recommended)

1. Select **Topics** on the side navigation pane.

2. Under **System Topics**, select the **Go to authoring canvas** icon on the **Greeting** topic row.

    ![Screenshot of the Topics page, with the Greeting topic highlighted](media/custom-greeting-topic.png "Screenshot of the Topics page, with the Greeting topic highlighted")

3. Edit the text inside the **Message** nodes. You can also [add or delete additional nodes](authoring-create-edit-topics.md#insert-nodes).

4. Select **Save** when you're finished editing the message.

    ![Screenshot of the system greeting topic showing the message nodes that can be edited](media/custom-greeting-message.png "Screenshot of the system greeting topic showing the message nodes that can be edited")

5. [**Publish** your bot](publication-fundamentals-publish-channels.md).

    ![Publish latest bot content](media/channel-publish-latest-content.png "Publish latest bot content")

You can now test your bot by going to the webpage where you deployed your bot's custom canvas. You'll see the bot start the conversation by automatically showing the greeting topic.


### Create a new user topic

>[!WARNING]
>Using a user topic to start a conversation will increase your [billed sessions](analytics-billed-sessions.md#definition-of-a-billed-session). A billed session is an interaction between a customer and a bot and represents one unit of consumption. The billed session begins when a user topic is triggered. For more information, see the topic [Analyze billed session information](analytics-billed-sessions.md).


1. Select **Topics** on the side navigation pane.

1. Select **New topic**, and give it a name. 

1. Select **Go to authoring canvas**.

1. Add the text inside the **Message** node. 

1. Select **Save** when you've finished editing the message.

1. Select **Topics** again on the side navigation pane. 

1. Under **System Topics**, select the **Go to authoring canvas** icon on the **Greeting** topic row.

1. [Delete the message nodes](authoring-create-edit-topics.md#insert-nodes) on the **Greeting** topic.

1. To automatically divert the bot to a user topic, select **+** to add a node, and then [Go to another topic](authoring-create-edit-topics.md#go-to-another-topic).

1. In the flyout menu, select the user topic you created above.

1. Select **Save** when you've finished editing the message.

1. [**Publish** your bot](publication-fundamentals-publish-channels.md).

You can now test your bot by going to the webpage where you deployed your bot's custom canvas. You'll see the bot start the conversation by automatically showing the new topic.



