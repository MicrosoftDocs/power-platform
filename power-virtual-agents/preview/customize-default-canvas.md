---
title: Customize your bot (preview)
description: Change the name, icon, and color of your bot with CSS and JavaScript styling in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 10/10/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "customization, ce06102020"
ms.collection: virtual-agent
---

# Customize the look and feel of your bot (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Your bot's look and feel is defined by the bot's canvas. You can customize the canvas in two ways, depending on the complexity of the customizations:

- [Customize the default canvas](#customize-the-default-canvas-simple) with JavaScript-based styling in the HTML code of the website where you deploy your bot.  
    This approach is useful if you want to make small customizations without investing in code development.

- [Use a custom canvas](#customize-and-host-your-chat-canvas-advanced) that's based on the [Bot Framework Web Chat canvas](https://github.com/microsoft/BotFramework-WebChat).  
    This approach requires extensive developer knowledge. It's useful for organizations that want a completely custom experience.

> [!IMPORTANT]
> You may install and use the sample code included in this article only for use with Microsoft Power Virtual Agents. The sample code is licensed "as is" and is excluded from any service level agreements or support services. You bear the risk of using it.  
>
> Microsoft gives no express warranties, guarantees, or conditions and excludes all implied warranties, including merchantability, fitness for a particular purpose, and non-infringement.

## Change your bot's name

If all you want to change is your bot's name, you can do that easily in your bot's settings in Power Virtual Agents.

1. In the navigation menu, select **Settings**, and then select **General**.

1. Type a new name for your bot, and then select **Save**.

    :::image type="content" source="media/customize-default-canvas/custom-canvas-name-icon.png" alt-text="Screenshot of a bot's general settings page, with the bot name highlighted.":::

## Retrieve token endpoint

To customize your canvas, whether it's the default canvas or a custom one you connect to, you need to retrieve your bot details.

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Mobile app**.

    :::image type="content" source="media/customize-default-canvas/channel-mobile-app.png" alt-text="Screenshot of the mobile app channel tile.":::

1. Next to **Token Endpoint**, select **Copy**.

    :::image type="content" source="media/customize-default-canvas/token-endpoint.png" alt-text="Screenshot of the endpoint token id.":::

## Customize the default canvas (simple)

Configure how the chat canvas looks with some simple CSS and JavaScript styling options.

First, you need to configure where you're deploying your bot canvas.

1. [Publish your bot](publication-connect-bot-to-web-channels.md).

1. Copy and paste the HTML code below and save it as _index.html_.  
    You can also copy and paste the code below into the [w3schools.com HTML try it editor](https://www.w3schools.com/html/tryit.asp?filename=tryhtml_default). You'll still need to add your token endpoint.  

    ```HTML
    <!DOCTYPE html>
    <html>
    <head>
        <title>Contoso Sample Web Chat</title> 
        <!-- This styling is for the Web Chat demonstration purposes. It is recommended that style is moved to separate file for organization in larger projects -->
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

            
            var theURL = "<YOUR TOKEN ENDPOINT>";
          
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

### Customize the bot icon, background color, and name

Use the JavaScript constant `styleOptions` to change pre-defined styles that define your bot's look and feel.

See [Web Chat customization](/azure/bot-service/bot-builder-webchat-customization?view=azure-bot-service-4.0&preserve-view=true) for links to the defaultStyleOptions.js file and more information on what you can customize and how it will look.

#### Change the bot icon

1. Add the following sample code to the *index.html* file:

    ```js
    const styleOptions = {
                botAvatarInitials: 'BT',
                accent: '#00809d',
                botAvatarBackgroundColor: "#FFFFFF",
                botAvatarImage: 'https://docs.microsoft.com/en-us/azure/bot-service/v4sdk/media/logo_bot.svg',
                userAvatarImage: 'https://avatars.githubusercontent.com/u/661465'
            };  
    ```

1. Replace the bot and user avatar images in the code with your company images.  
    If you don't have an image URL, you can use a Base64-encoded image string instead.

#### Change the background color

1. Update the *index.html* file with following sample code:

    ```js
    const styleOptions = {
           
                backgroundColor: 'lightgray'

            };  
    ```

1. Change `backgroundColor` to any color using standard CSS color names, RGB values, or HEX values.

#### Change the bot's name

1. Update the `<h1>` text in the *index.html* file with the following code:

    ```HTML
    <body>
        <div id="heading">
             <!-- Change the h1 text to change the bot name -->
             <h1><img src="contosobot-teams.png"> Contoso Bot Name</h1>
        </div>

    ```

1. Change the text to whatever you want to call your bot. You can also insert an image, although you may need to style it to make sure it fits in the heading section.

## Customize and host your chat canvas (advanced)

The other way to change your bot's look and feel is to connect it to a custom canvas that's hosted as a web app. This approach is best if you need to embed a customized iFrame across multiple web pages.

> [!NOTE]
> Hosting a custom canvas requires software development. Our guidance here is intended for experienced IT professionals, such as IT admins or developers who have a good understanding of developer tools, utilities, and IDEs.

### Pick a sample to customize

We recommend starting with one of these samples custom-built to work with Power Virtual Agents:

- [Full bundle](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/BuildYourOwnCanvasSamples/1.starter-full-bundle) is a custom canvas capable of showing all rich content from Power Virtual Agents. For example:

  :::image type="content" source="media/customize-default-canvas/custom-canvas-full-bundle.png" alt-text="Full bundle custom canvas." border="false":::

- [Location and file uploading](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/BuildYourOwnCanvasSamples/2.location-and-file-uploading) is a custom canvas capable of getting a user's location and sending it to a bot using Power Virtual Agents. For example:

  :::image type="content" source="media/customize-default-canvas/custom-canvas-location-file-upload.png" alt-text="Location and file uploading custom canvas." border="false":::

Or you can pick from [other sample web chat canvases](https://github.com/microsoft/BotFramework-WebChat/#samples-list) provided by Bot Framework.

### Customize the canvas using `stylesetOptions`

As with customizing the default canvas, you can use `styleSetOptions` to customize the custom canvas. All customizable properties are listed in [defaultStyleOptions.js](https://github.com/microsoft/BotFramework-WebChat/blob/main/packages/api/src/defaultStyleOptions.ts). For more information on what you can customize and how it will look, see [Web Chat customization](/azure/bot-service/bot-builder-webchat-customization?view=azure-bot-service-4.0&preserve-view=true).

### Deploy your customized canvas

Deploy all files to a web app.

## See also

- [Bot Framework web chat](https://github.com/microsoft/BotFramework-WebChat)
- [Generating a direct line token](/azure/bot-service/rest-api/bot-framework-rest-direct-line-3-0-authentication?preserve-view=true&view=azure-bot-service-4.0#generate-token)

[!INCLUDE[footer-include](includes/footer-banner.md)]
