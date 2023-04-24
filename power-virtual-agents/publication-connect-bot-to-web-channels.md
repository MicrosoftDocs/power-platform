---
title: "Configure a chatbot for a live or demo website (contains video)"
description: "You can use a prebuilt demo website to try out your bot, or you can publish it directly to your own webpage using an IFrame code snippet."
keywords: "Publish, channel, connector, sample code, developer, extensibility, PVA"
ms.date: 02/22/2022

ms.topic: article
author: iaanw
ms.author: iawilt
ms.custom: "publication, authoring, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Configure the demo website and add the bot to your live website

[!INCLUDE[public preview disclaimer](includes/public-preview-disclaimer-prod.md)]

When publishing the bot to the web, you can publish to a prebuilt demo website (which you can use to share the bot with your teammates and stakeholders) and to your own live website.
  
>  
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mGa9]
>  

> [!TIP]
> **When should I use the demo website and when should I use my own website?**  
> You should use the demo website only to try out the bot and share it with your teammates or other stakeholders who want to try out the bot. It's not intended for production uses, for example, you shouldn't use it directly with customers.  
> You should publish and use the bot on your live website for production scenarios, such as a help bot on your help webpage for customers to interact with.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Demo website

You can edit the welcome message and suggested trigger phrases for the demo website. A welcome message helps prompt your teammates for what they should ask the bot about.

> [!TIP]
> You can change the welcome message to explain the intent or purpose of the testing, and you can change it as often as you like. So you could create a welcome message asking to test out conversations related to store hours and then, after making updates to the bot, change the welcome message to ask testers to try conversations related to gift cards.

### Update the demo website

1. In the navigation menu under **Settings**, select **Channels**.

1. Select the **Demo website** tile.

1. Enter the welcome message you'd like to see alongside the bot in the **Welcome message** text field.

1. Enter a list of suggested trigger phrases in the **Conversation starters** text field. Trigger phrases are what initiate specific topics, so you could customize your trigger phrases to specific topics that you want your teammates to try out.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-share-demo-website.png" alt-text="Share demo website.":::

To share the demo website link, copy the demo website URL and share it with your teammates directly.

## Custom website

You can add your bot to a live website as an IFrame. Your live website can be a customer-facing external website or an internal site, like a SharePoint site.

You can also add the bot to your Power Platform admin center.

### Add bot to your website

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Custom website** and then select **Copy** to copy it directly to the clipboard, or **Share to email** to open a new email message with the snippet included, in your default email app.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-custom-website.png" alt-text="Add bot to custom website." border="false":::

1. Provide the snippet to your web developer to add the bot to your website.

[!INCLUDE[footer-include](includes/footer-banner.md)]
