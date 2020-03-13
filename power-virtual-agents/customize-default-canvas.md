---
title: "Customize the Power Virtual Agents web chat canvas"
description: "Edit the custom web chat canvas to change the name, icon, and color of your bot with CSS and JavaScript styling."
keywords: ""
ms.date: 3/13/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "customization"
ms.collection: virtualagent
---

# Customize the look and feel of the bot's default Web Chat canvas



After you create and [publish a bot](publication-fundamentals-publish-channels.md), your customers can [use the bot’s Web Chat canvas to interact with it](publication-connect-bot-to-web-channels.md).


The default look and feel of the bot is defined by the Web Chat canvas. You can customize the chat canvas in two ways, depending on the complexity of the customizations:


1. You can apply JavaScript-based styling in the HTML code for the website where you deploy your bot.  
    This is useful if you want to make small customizations without investing in code development.

2. You can use a [custom Web Chat canvas](extend-custom-canvas-connect.md), based on the [Azure Bot Framework Web Chat canvas](https://github.com/microsoft/BotFramework-WebChat).  
    This requires extensive developer knowledge and is useful for organizations that want to customize the experience completely.

The first option is described in this article.


## Configure the Web Chat with your bot

To configure how the Web Chat canvas looks, you'll need to have a published bot. You then apply some CSS and JavaScript styling to the page where you insert your bot to change bot's icon, color, and name.

First, you need to configure the page where you are hosting your bot.

1.	[Create and publish a bot](fundamentals-get-started.md).

2.	After a bot is created, get the BotID by [going to the Mobile app under Channels](publication-connect-bot-to-custom-application.md#retrieve-your-power-virtual-agent-bot-parameters). 

3.	Copy-paste the HTML code below and save it as *index.html*.
    You can also cut and paste the code below into the [w3schools.com HTML try it editor](https://www.w3schools.com/html/tryit.asp?filename=tryhtml_default) to see how it works (remember to add your BotID).  

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

            };

            // Add your BOT ID below 
            var BOT_ID = "<ENTER YOUR BOT ID>"; 
            var theURL = "https://powerva.microsoft.com/api/botmanagement/v1/directline/directlinetoken?botId=" + BOT_ID;
        
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


4.	In the *index.html* file you just created, enter your **BotId** at the line `var BOT_ID = "<ENTER YOUR BOT ID>"`.

5.	Open *index.html* using a modern browser (for example, Edge) to open the bot in the custom Web Chat canvas.

6.	Test the bot to ensure you are receiving responses from your bot and that it's working correctly.  
    If you encounter problems, make sure you've published your bot, and that the **BotId** has been inserted in the correct place. It should be after the equals sign (=) at the line `var BOT_ID`, and surrounded by double quotation marks (")._

### Customize the bot icon, backgroundcolor, and name


Once you get the customized Web Chat canvas working with your bot, you can customize it. 

You can use the JavaScript `styleOptions` options to configure a number of pre-defined styles. 

The [defaultStyleOptions.js file](https://github.com/Microsoft/BotFramework-WebChat/blob/master/packages/component/src/Styles/defaultStyleOptions.js) is available on our GitHub repo and contains the full list of all settings that you can modify. See [Web Chat customization](/azure/bot-service/bot-builder-webchat-customization?view=azure-bot-service-4.0) for more information on what you can customize and how it will look.


**To change the bot icon**

1. Update the *index.html* file with the following sample code

    ```js

    const styleOptions = {
           
                botAvatarImage: 'https://docs.microsoft.com/en-us/azure/bot-service/v4sdk/media/logo_bot.svg',
                userAvatarImage: 'https://avatars.githubusercontent.com/u/661465'
            };  

    ```


2.  Replace the bot and user avatar images with your company images.  
    If you don’t have an image URL, you can use a Base64-encoded image string instead. 


**To change the background color**

1. Update the *index.html* file with following sample code. 

    ```js
    const styleOptions = {
           
                backgroundColor: 'lightgray'

            };  

    ```

2. Change `backgroundColor` to any color you wish. You can use standard CSS color names, RGB values, or HEX.

**To change the bot name**

1. Update the `<h1>` text in the *index.html* file with the following.

```HTML
<body>
    <div id="chatwindow">
        <div id="heading">
                         <!-- Change the h1 text to change the bot name -->
            <h1><img src="images/robot-create-illustration.svg"> Contoso Bot Name</h1>
        </div>

```




