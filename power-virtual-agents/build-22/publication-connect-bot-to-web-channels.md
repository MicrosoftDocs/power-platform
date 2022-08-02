---
ROBOTS: NOINDEX,NOFOLLOW
title: Publish your bot on your own or a demo website (contains video)
description: Customize a prebuilt demo website to try out your bot, or publish your bot to your own website for customers to use.
keywords: "Publish, channel, connector, sample code, developer, extensibility, PVA"
ms.date: 05/31/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "publication, authoring, ceX"
ms.collection: virtual-agent
---

# Customize the demo website or publish your bot on your website

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

A prebuilt demo website is automatically created for you when you publish your bot. Your teammates and stakeholders can use the demo website to try out the bot while you're building it. You might want to customize the demo site to guide your teammates' testing efforts. Publish the bot to your live website when it's ready for customers to use.

## When should you use the demo website and when should you use your own website?

You should use the demo website only to try out your bot, or to share it with teammates and stakeholders who want to try it out. It's not intended for production use. You shouldn't give the URL to customers. Publish the bot on your live website for customers to use.

## Customize the demo website

You can edit the demo website's welcome message and trigger phrases as often as you like. The welcome message can explain the purpose of the testing and prompt your teammates for what to ask the bot.

1. In the left side panel, select **Manage**, and then select **Channels**.

1. Select the **Demo website** tile.

1. Under **Welcome message**, enter the message you want your teammates to see.

1. Under **Conversation starters**, enter a list of trigger phrases.

    Trigger phrases are what initiate specific topics, so you could enter trigger phrases for topics that you want your teammates to test.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-share-demo-website.png" alt-text="Screenshot of the demo website customization options.":::

Copy the demo website URL and share it with your teammates.

## Add your bot to your website

When your bot is ready for customers, you can add it to your website as an iFrame code snippet. Your live website can be external or internal, like a SharePoint site. You can also add the bot to your Power Platform admin center.

1. In the left side panel, select **Manage**, and then select **Channels**.

1. Select **Custom website**, and then either:

    - Select **Copy** to copy the embed code to the clipboard.
    - Select **Share to email** to open a compose window in your default email app, with the code snippet included.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-custom-website.png" alt-text="Add bot to custom website." border="false":::

1. Provide the snippet to your web developer to add the bot to your website.

[!INCLUDE[footer-include](includes/footer-banner.md)]
