---
title: "Automatically start a chatbot conversation"
description: "Configure your bot to start a conversation automatically, as soon as it's loaded"
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: digantak
manager: leeclontz
ms.custom: "customization, ce06102020"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Automatically start a chatbot conversation

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can configure your bot to start a conversation conversation with a user. You can also combine the customized greeting with [customization to the look and feel of the bot](customize-default-canvas.md).

> [!IMPORTANT]
> Having the bot start the conversation will show up in your [analytics](analytics-overview.md) and will increase your session count.
>
> If the user of your bot doesn't engage with the bot (for example, they load the page but don't ask the bot anything), the session will be [marked as an unengaged session](analytics-summary.md#engagement-over-time-chart). This might impact your analytics.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


# [Web app](#tab/web)

By default, chatbots created with Microsoft Copilot Studio and [published to a website](publication-connect-bot-to-web-channels.md) will load without a greeting, and will passively wait for the user to start the conversation.

However, you can use custom CSS and JavaScript code to automatically have the bot start the conversation when the bot loads. For example, you could have your bot say, "Hi, I'm Botty, a virtual agent" as soon as the bot loads.

First, you'll need to deploy a custom canvas that includes arguments that trigger the greeting. By default, the custom canvas calls the default system greeting topic. You can, however, create a new topic to be used as the greeting, although you will need to divert the default system greeting topic to a new topic.


> [!IMPORTANT]
> You may install and use the sample code included in this documentation only for use with the Microsoft Copilot Studio product. The sample code is licensed "as is" and is excluded from any service level agreements or support services. You bear the risk of using it.  
>
> Microsoft gives no express warranties, guarantees, or conditions and excludes all implied warranties, including merchantability, fitness for a particular purpose, and non-infringement.

### Retrieve token endpoint

To customize your canvas, whether it's the default canvas or a custom one you connect to, you need to retrieve your bot details.

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Mobile app**.

    :::image type="content" source="media/customize-default-canvas/channel-mobile-app.png" alt-text="Screenshot of the mobile app channel tile.":::

1. Next to **Token Endpoint**, select **Copy**.

    :::image type="content" source="media/customize-default-canvas/token-endpoint.png" alt-text="Screenshot of the endpoint token id.":::

### Customize the default canvas (simple)

Configure how the chat canvas looks with some simple CSS and JavaScript styling options.

First, you need to configure where you're deploying your bot canvas.

1. [Create and publish a bot](fundamentals-get-started.md).

1. Copy and paste the HTML code below and save it as _index.html_.  
    You can also copy and paste the code below into the [w3schools.com HTML try it editor](https://www.w3schools.com/html/tryit.asp?filename=tryhtml_default). You'll still need to add your token endpoint.  

    ```HTML
    <!DOCTYPE html>
    <html>
    <head>
        <title>Contoso Sample Web Chat</title> 
        <!-- This styling is for the Web Chat demonstration purposes. It is recommended that style is moved to a separate file for organization in larger projects -->
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

            #heading {
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
            <div id="heading">
                <!-- Change the h1 text to change the bot name -->    
                <h1>Contoso Bot Name</h1>
            </div>
            <div id="webchat" role="main"></div>
        </div>    

      <script src="https://cdn.botframework.com/botframework-webchat/latest/webchat.js"></script>

      <script>
            const styleOptions = {

               // Add styleOptions to customize Web Chat canvas
               hideUploadButton: true
            };
       
            // Add your BOT token endpoint below
            var theURL = "<BOT TOKEN ENDPOINT>";
          
            var environmentEndPoint = theURL.slice(0,theURL.indexOf('/powervirtualagents'));
            var apiVersion = theURL.slice(theURL.indexOf('api-version')).split('=')[1];
            var regionalChannelSettingsURL = `${environmentEndPoint}/powervirtualagents/regionalchannelsettings?api-version=${apiVersion}`; 
            
            var directline;
                fetch(regionalChannelSettingsURL)
                    .then((response) => {
                        return response.json();
                        })
                    .then((data) => {
                        directline = data.channelUrlsById.directline;
                        })
                    .catch(err => console.error("An error occurred: " + err));
        
          fetch(theURL)
                .then(response => response.json())
                .then(conversationInfo => {
                    window.WebChat.renderWebChat(
                        {
                            directLine: window.WebChat.createDirectLine({
                                domain: `${directline}v3/directline`,
                                token: conversationInfo.token,
                            }),
                            styleOptions
                        },
                        document.getElementById('webchat')
                    );
                })
                .catch(err => console.error("An error occurred: " + err));

        </script>
      </body>
    </html>
    ```

1. In the _index.html_ file you created, enter your token endpoint at the line `var theURL = "<YOUR TOKEN ENDPOINT>";`.

1. Open _index.html_ using a modern browser (for example, Microsoft Edge) to open the bot in the custom canvas.

1. Test the bot to ensure you are receiving responses from your bot and that it's working correctly.  

    If you encounter problems, make sure you've published your bot, and that your token endpoint has been inserted in the correct place. It should be after the equals sign (=) at the line `var theURL = "<YOUR TOKEN ENDPOINT>"`, and surrounded by double quotation marks (").

### Change the bot's default greeting

The code in the _index.html_ file causes a topic to be called automatically when the bot is loaded. By default, it calls the system greeting topic. You can also create a new topic and divert the default system greeting topic to that new topic.

In both instances, you [make changes to the topic you want to call as you would normally](authoring-create-edit-topics.md).

If you modify or create a new greeting topic, it's a best practice to include some sort of identification that the user is talking to a bot (or "virtual agent"), so they don't think they're talking to a human.

We recommend you modify the system greeting topic so that you don't have to edit the _index.html_ code.

### Modify the system greeting topic (recommended)

1. In the navigation menu, select **Topics**, then select the **Greeting** topic row.

    :::image type="content" source="media/configure-bot-greeting/select-greeting-topic.png" alt-text="Screenshot of the Topics page, with the Greeting topic highlighted.":::

1. Edit the text inside the **Message** nodes. You can also [add or delete additional nodes](authoring-create-edit-topics.md#insert-nodes).

1. Select **Save**.

1. [**Publish** your bot](publication-fundamentals-publish-channels.md).

You can now test your bot by going to the webpage where you deployed your bot's custom canvas. You'll see the bot start the conversation by automatically showing the greeting topic.

### Create a new user topic

> [!WARNING]
> Using a user topic to start a conversation will increase your [billed sessions](analytics-billed-sessions.md). A billed session is an interaction between a customer and a bot and represents one unit of consumption. The billed session begins when a user topic is triggered. For more information, see the topic [Analyze billed session information](analytics-billed-sessions.md).

1. In the navigation menu, select **Topics**.

1. Select **New topic**, and give it a name.

1. Add the text inside the **Message** node.

1. Select **Save** when you've finished editing the message.

1. In the navigation menu, select **Topics**, then select the **Greeting** topic row.

1. [Delete the message nodes](authoring-create-edit-topics.md#insert-nodes) on the **Greeting** topic.

1. To automatically divert the bot to a user topic, select **Add node** (**+**) to add a node, and then [Go to another topic](authoring-create-edit-topics.md#redirect-to-another-topic).

1. In the flyout menu, select the user topic you created above.

1. Select **Save** when you've finished editing the message.

1. [**Publish** your bot](publication-fundamentals-publish-channels.md).

You can now test your bot by going to the webpage where you deployed your bot's custom canvas. You'll see the bot start the conversation by automatically showing the new topic.


# [Teams](#tab/teams)

By default, chatbots created with the Microsoft Copilot Studio app in Microsoft Teams will automatically start the conversation when installed for the first time.

You can change what the bot says by updating the greeting topic. For example, you could have your bot say, "Hi, I'm Botty, a virtual agent" as soon as the bot loads.

### Change the bot's default greeting

1. In the navigation menu, select **Topics**, then select the **Greeting** topic row.

    :::image type="content" source="media/configure-bot-greeting/select-greeting-topic-teams.png" alt-text="Screenshot of the Topics page, with the Greeting topic highlighted.":::

1. Edit the text inside the **Message** nodes. You can also [add or delete additional nodes](authoring-create-edit-topics.md#insert-nodes).

1. Select **Save** when you're finished editing the message.

1. [**Publish** your bot](publication-add-bot-to-microsoft-teams.md) and test it.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
