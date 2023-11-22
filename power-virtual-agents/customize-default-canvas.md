---
title: "Customize the Web Chat canvas"
description: "Change the name, icon, and color of your bot with CSS and JavaScript styling."
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "customization, ce06102020"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Customize the look and feel of the bot's default canvas

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Your bot's look and feel is defined by its canvas. To customize your bot, you must customize its canvas. You can customize the canvas in two ways, depending on the complexity of the customizations:

- [Customize the default canvas](#customize-the-default-canvas-simple) with JavaScript styling in the HTML code of the website where you deploy your bot.  
    This approach is useful if you want to make small customizations without investing in code development.

- [Use a custom canvas](#customize-and-host-your-chat-canvas-advanced) that's based on the [Bot Framework Web Chat canvas](https://github.com/microsoft/BotFramework-WebChat).  
    This approach requires extensive developer knowledge. It's useful for organizations that want a completely custom experience.

> [!IMPORTANT]
> You may install and use the sample code included in this article only for use with Microsoft Copilot Studio. The sample code is licensed "as is" and is excluded from any service level agreements or support services. You bear the risk of using it.  
>
> Microsoft gives no express warranties, guarantees, or conditions and excludes all implied warranties, including merchantability, fitness for a particular purpose, and non-infringement.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


# [Web app](#tab/web)

After you create and [publish a bot](publication-fundamentals-publish-channels.md), your customers can [use the bot's Web Chat canvas to interact with it](publication-connect-bot-to-web-channels.md).

You can also combine the customized canvas with [configuring your bot to automatically start the conversation](configure-bot-greeting.md).

Lastly, you can [change the name and bot icon](#change-the-bot-name-and-icon) (when the bot is [shared in Microsoft Teams](publication-add-bot-to-microsoft-teams.md)) directly from the portal.

### Change the bot name and icon

> [!IMPORTANT]
> If your bot is connected to [Omnichannel for Customer Service](configuration-hand-off-omnichannel.md), the bot's name is defined by the **Display name** property in the Azure portal registration.

You can change the bot's name and icon. This will affect the icon in all channels where you publish your bot.

1. In the navigation menu, under **Settings**, select **Details**.

1. Change the bot's name and icon. [Review the recommendations on Microsoft Teams icon formats](/microsoftteams/platform/resources/schema/manifest-schema#icons)

1. Select **Save** to commit your changes.

    :::image type="content" source="media/customize-default-canvas/custom-canvas-name-icon.png" alt-text="The bot details pane lets you change the name and icon.":::

> [!IMPORTANT]
> After updating your bot's icon, it may take up to 24 hours for the new icon to appear everywhere.

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

    ```html
    <!doctype html>
    <html lang="en">
      <head>
        <title>Contoso Sample Web Chat</title>
        <!--
          This styling is for the Web Chat demonstration purposes.
          It is recommended that style is moved to a separate file for organization in larger projects.
        
          Please visit https://github.com/microsoft/BotFramework-WebChat for details about Web Chat.
        -->
        <style>
          html,
          body {
            height: 100%;
          }
    
          body {
            margin: 0;
          }
    
          h1 {
            color: whitesmoke;
            font-family: Segoe UI;
            font-size: 16px;
            line-height: 20px;
            margin: 0;
            padding: 0 20px;
          }
    
          #banner {
            align-items: center;
            background-color: black;
            display: flex;
            height: 50px;
          }
    
          #webchat {
            height: calc(100% - 50px);
            overflow: hidden;
            position: fixed;
            top: 50px;
            width: 100%;
          }
        </style>
      </head>
      <body>
        <div>
          <div id="banner">
            <h1>Contoso Bot Name</h1>
          </div>
          <div id="webchat" role="main"></div>
        </div>
    
        <!--
          In this sample, the latest version of Web Chat is being used.
          In production environment, the version number should be pinned and version bump should be done frequently.
    
          Please visit https://github.com/microsoft/BotFramework-WebChat/tree/main/CHANGELOG.md for changelog.
        -->
        <script crossorigin="anonymous" src="https://cdn.botframework.com/botframework-webchat/latest/webchat.js"></script>
    
        <script>
          (async function () {
            // Specifies style options to customize the Web Chat canvas.
            // Please visit https://microsoft.github.io/BotFramework-WebChat for customization samples.
            const styleOptions = {
              // Hide upload button.
              hideUploadButton: true
            };
    
            // Specifies the token endpoint URL.
            // To get this value, visit Copilot Studio > Settings > Channels > Mobile app page.
            const tokenEndpointURL = new URL('<BOT TOKEN ENDPOINT>');
    
            // Specifies the language the copilot and Web Chat should display in:
            // - (Recommended) To match the page language, set it to document.documentElement.lang
            // - To use current user language, set it to navigator.language with a fallback language
            // - To use another language, set it to supported Unicode locale
    
            // Setting page language is highly recommended.
            // When page language is set, browsers will use native font for the respective language.
    
            const locale = document.documentElement.lang || 'en'; // Uses language specified in <html> element and fallback to English (United States).
            // const locale = navigator.language || 'ja-JP'; // Uses user preferred language and fallback to Japanese.
            // const locale = 'zh-HAnt'; // Always use Chinese (Traditional).
    
            const apiVersion = tokenEndpointURL.searchParams.get('api-version');
    
            const [directLineURL, token] = await Promise.all([
              fetch(new URL(`/powervirtualagents/regionalchannelsettings?api-version=${apiVersion}`, tokenEndpointURL))
                .then(response => {
                  if (!response.ok) {
                    throw new Error('Failed to retrieve regional channel settings.');
                  }
    
                  return response.json();
                })
                .then(({ channelUrlsById: { directline } }) => directline),
              fetch(tokenEndpointURL)
                .then(response => {
                  if (!response.ok) {
                    throw new Error('Failed to retrieve Direct Line token.');
                  }
    
                  return response.json();
                })
                .then(({ token }) => token)
            ]);

            // The "token" variable is the credentials for accessing the current conversation.
            // To maintain conversation across page navigation, save and reuse the token.

            // The token could have access to sensitive information about the user.
            // It must be treated like user password.

            const directLine = WebChat.createDirectLine({ domain: new URL('v3/directline', directLineURL), token });

            // Sends "startConversation" event when the connection is established.

            const subscription = directLine.connectionStatus$.subscribe({
              next(value) {
                if (value === 2) {
                  directLine
                    .postActivity({
                      localTimezone: Intl.DateTimeFormat().resolvedOptions().timeZone,
                      locale,
                      name: 'startConversation',
                      type: 'event'
                    })
                    .subscribe();
    
                  // Only send the event once, unsubscribe after the event is sent.
                  subscription.unsubscribe();
                }
              }
            });
    
            WebChat.renderWebChat({ directLine, locale, styleOptions }, document.getElementById('webchat'));
          })();
        </script>
      </body>
    </html>
    ```

1. In the _index.html_ file you created, enter your token endpoint at the line `const tokenEndpointURL = "<YOUR TOKEN ENDPOINT>";`.

1. Open _index.html_ using a modern browser (for example, Microsoft Edge) to open the bot in the custom canvas.

1. Test the bot to ensure you are receiving responses from your bot and that it's working correctly.  

    If you encounter problems, make sure you've published your bot, and that your token endpoint has been inserted in the correct place. It should be after the equals sign (=) at the line `const tokenEndpointURL = "<YOUR TOKEN ENDPOINT>"`, and surrounded by double quotation marks (").

### Customize the bot icon, background color, and name

Once you get the customized canvas working with your bot, you can make changes to it.

You can use the JavaScript `styleOptions` options to configure a number of pre-defined styles.

See [Web Chat customization](/azure/bot-service/bot-builder-webchat-customization?view=azure-bot-service-4.0&preserve-view=true) for links to the defaultStyleOptions.js file and more information on what you can customize and how it will look.

#### Change the bot icon

1. Update the _index.html_ file with the following sample code:

    ```js
    const styleOptions = {
      accent: '#00809d',
      botAvatarBackgroundColor: '#FFFFFF',
      botAvatarImage: 'https://learn.microsoft.com/azure/bot-service/v4sdk/media/logo_bot.svg',
      botAvatarInitials: 'BT',
      userAvatarImage: 'https://avatars.githubusercontent.com/u/661465'
    };  
    ```

1. Replace the bot and user avatar images with your company images.  
    If you don't have an image URL, you can use a Base64-encoded image string instead.

#### Change the background color

1. Update the _index.html_ file with following sample code:

    ```js
    const styleOptions = {
      backgroundColor: 'lightgray'
    };  
    ```

1. Change `backgroundColor` to any color you wish. You can use standard CSS color names, RGB values, or HEX.

#### Change the bot name

1. Update the `<h1>` text in the _index.html_ file with the following:

    ```HTML
    <body>
      <div id="banner">
        <h1><img src="contosobot-teams.png"> Contoso Bot Name</h1>
      </div>
    ```

1. Change the text to whatever you want to call the bot. You can also insert an image, although you may need to style it to ensure it fits within the heading section.

### Customize and host your chat canvas (advanced)

You can connect your Microsoft Copilot Studio bot with a custom canvas that is hosted as a standalone web app. This option is best if you need to embed a customized iFrame across multiple web pages.

> [!NOTE]
> Hosting a custom canvas requires software development. Our guidance here is intended for experienced IT professionals, such as IT admins or developers who have a good understanding of developer tools, utilities, and IDEs.

#### Pick a sample to customize

We recommend starting with one of these samples custom-built to work with Microsoft Copilot Studio:

- [Full bundle](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/BuildYourOwnCanvasSamples/1.starter-full-bundle) is a custom canvas capable of showing all rich content from Microsoft Copilot Studio. For example:

  :::image type="content" source="media/customize-default-canvas/custom-canvas-full-bundle.png" alt-text="Full bundle custom canvas." border="false":::

- [Location and file uploading](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/BuildYourOwnCanvasSamples/2.location-and-file-uploading) is a custom canvas capable of getting a user's location and sending it to a bot using Microsoft Copilot Studio. For example:

  :::image type="content" source="media/customize-default-canvas/custom-canvas-location-file-upload.png" alt-text="Location and file uploading custom canvas." border="false":::

Or you can pick from [other sample Web Chat canvases](https://github.com/microsoft/BotFramework-WebChat/#samples-list) provided by Bot Framework.

#### Customize canvas using `styleSetOptions`

As with customizing the default canvas, you can use `styleSetOptions` to customize the custom canvas. All customizable properties are listed in [defaultStyleOptions.js](https://github.com/microsoft/BotFramework-WebChat/blob/main/packages/api/src/defaultStyleOptions.ts). For more information on what you can customize and how it will look, see [Web Chat customization](/azure/bot-service/bot-builder-webchat-customization?view=azure-bot-service-4.0&preserve-view=true).

### Deploy your customized canvas

In order to host your custom canvas, deploy all files to a web app.

# [Teams](#tab/teams)

You can customize how the bot looks when added as an app in Microsoft Teams. You can change the icon and the bot name at any time, and add a long and short description when you publish the bot.

> [!IMPORTANT]
> Updates to the bot's icon and color may take up to 24 hours to show on bots that are already published and shared.

### Change the bot avatar icon and name

1. In the navigation menu, under **Settings**, select **Details**.

    :::image type="content" source="media/customize-default-canvas/custom-canvas-name-icon-teams.png" alt-text="The Details tab is found in the Manage section in the navigation menu.":::

1. Make changes to the **Bot name** and bot avatar icon.  
    The avatar icon needs to be an image type and can be any size - it will be automatically resized and positioned so it is in the middle of the colored square.
    We recommend you use a 32x32 pixel or 64x64 pixel .png file with transparency, so that way the color will come through the icon.

    > [!NOTE]
    > Setting the bot avatar icon will not show up for bots that are approved by an admin. Bots approved by an admin will use the Teams app icon as the bot avatar. Learn more on [sharing the bot with organization](publication-add-bot-to-microsoft-teams.md#show-the-bot-in-microsoft-teams-app-store).

1. When you're finished, select **Save** on the top menu bar.

    :::image type="content" source="media/customize-default-canvas/custom-canvas-save-teams.png" alt-text="Save is at the top of the window.":::

1. Select **Reset** to revert your changes to the previously saved version.

### Change the bot color and description

When [preparing a bot ready for sharing with other users in your team](publication-add-bot-to-microsoft-teams.md#install-a-bot-as-an-app-in-microsoft-teams), you can also change the bot's icon, color, and short and long descriptions. You can also enter more [information about who built the bot](publication-terms-of-use-teams.md).

---

## Related topics

- [Bot Framework Web Chat](https://github.com/microsoft/BotFramework-WebChat)
- [Generating a Direct Line token](/azure/bot-service/rest-api/bot-framework-rest-direct-line-3-0-authentication?preserve-view=true&view=azure-bot-service-4.0#generate-token)


[!INCLUDE[footer-include](includes/footer-banner.md)]
