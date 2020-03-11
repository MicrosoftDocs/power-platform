---
title: "Connect Power Virtual Agents to a custom canvas"
description: "Use an advanced custom canvas to change the display and functionality of your bot (development coding required)."
keywords: ""
ms.date: 1/13/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "extend, azure, byoc"
ms.collection: virtualagent
---

# Customize the look and feel of the bot's default web chat canvas


After you create and [publish a bot](publication-fundamentals-publish-channels.md), your customers can [use the bot’s Web Chat to interact with your bot](publication-connect-bot-to-web-channels.md).

The default look and feel of the bot is defined by the web chat canvas. You can customize the chat canvas in two ways, depending on the complexity of the customizations:

1. You can use a [custom web chat canvas](extend-custom-canvas-connect.md), based on the [Azure Bot Framework web chat canvas](https://github.com/microsoft/BotFramework-WebChat).  
    This requires extensive developer knowledge and is useful for large organizations who want to completely customize the experience.

2. You can apply javascript-based styling in the HTML code for the website where you deploy your bot.  
    This is useful for smaller organizations, or if your bot is hosted only on a website.


The second option is described in this article.


## Configure the Web Chat with your bot

1.	[Create and publish a bot](fundamentals-get-started.md).
2.	After a bot is created, get the BotID by [going to the Mobile app under Channels](publication-connect-bot-to-custom-application.md#retrieve-your-power-virtual-agent-bot-parameters). 
3.	Copy-paste the HTML code below in a notepad and save as a index.html file.
4.	Update the index.html file to enter your BotId under `var BOT_ID = "<ENTER YOUR BOT ID>"`.
5.	Open the index.html using a modern browser (for example, Edge) to open the Web Chat.
6.	Test the Web Chat, and you should receive responses from your bot.

Alternately, you can cut and paste the code below in the [w3schools.com HTML try it editor](https://www.w3schools.com/html/tryit.asp?filename=tryhtml_default) (remember to add your your BotID).  

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

           // Add styleOptions to customize web chat canvas

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

### Customize the bot icon, color, and name


Once you get the Web Chat working with your bot, you will be able to customize it. If you need to do some simple styling, you can set them via styleOptions. Style options are set of predefined styles that you can modify directly, and Web Chat will compute the whole stylesheet based on it. You can find the full list of all settings that you can easily modify in Web Chat on the defaultStyleOptions.js file. 

**To change the bot icon**

Now to change the bot icon, update the index.html file with the following sample code. If you don’t have an image URL, you can use add a Base64-encoded image string instead. Replace the bot and user avatar images with your company images. 

```js
…
const styleOptions = {
           
            botAvatarImage: 'https://docs.microsoft.com/en-us/azure/bot-service/v4sdk/media/logo_bot.svg',
            userAvatarImage: 'https://avatars.githubusercontent.com/u/661465'
        };  
…
```

**To change the background color**

To change the default white background color of your Web Chat, update the index.html file with following sample code. 

```js
…
const styleOptions = {
           
            backgroundColor: 'lightgray'

        };  
…
```

**To change the bot name**

Now change the bot name in your Web Chat, update the <h1> text in the index.html file with following.

```HTML
…

<body>
    <div id="chatwindow">
        <div id="heading">
                         <!-- Change the h1 text to change the bot name -->
            <h1><img src="images/robot-create-illustration.svg"> Contoso Bot Name</h1>
        </div>
…
```



## See also

-  [Azure Bot Framework web chat](https://github.com/microsoft/BotFramework-WebChat)
-  [Generating a direct line token](https://docs.microsoft.com/azure/bot-service/rest-api/bot-framework-rest-direct-line-3-0-authentication?view=azure-bot-service-4.0#generate-token)
