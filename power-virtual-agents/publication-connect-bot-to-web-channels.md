---
title: "Configure a chatbot for a live or demo website (contains video)"
description: "You can use a prebuilt demo website to try out your bot, or you can publish it directly to your own webpage using an IFrame code snippet."
keywords: "Publish, channel, connector, sample code, developer, extensibility, PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: "publication, authoring, ceX"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Configure the demo website and add the bot to your live website

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

When publishing the bot to the web, you can publish to a prebuilt demo website (which you can use to share the bot with your teammates and stakeholders) and to your own live website.
  
>  
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mGa9]
>  

> [!TIP]
> **When should I use the demo website and when should I use my own website?**  
> You should use the demo website only to try out the bot and share it with your teammates or other stakeholders who want to try out the bot. It's not intended for production uses, for example, you shouldn't use it directly with customers.  
> You should publish and use the bot on your live website for production scenarios, such as a help bot on your help webpage for customers to interact with.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


# [Preview](#tab/preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

A prebuilt demo website is automatically created for you when you publish your bot. Your teammates and stakeholders can use the demo website to try out the bot while you're building it. You might want to customize the demo site to guide your teammates' testing efforts. Publish the bot to your live website when it's ready for customers to use.

### When should you use the demo website and when should you use your own website?

You should use the demo website only to try out your bot, or to share it with teammates and stakeholders who want to try it out. It's not intended for production use. You shouldn't give the URL to customers. Publish the bot on your live website for customers to use.

### Customize the demo website

Edit the demo website's welcome message and trigger phrases as often as you like. The welcome message can explain the purpose of the testing and prompt your teammates for what to ask the bot.

1. In the navigation menu, select **Settings**, and then select **Channels**.

1. Select the **Demo website** tile.

1. Under **Welcome message**, enter the message you want your teammates to see.

1. Under **Conversation starters**, enter a list of trigger phrases.

    Trigger phrases are what initiate specific topics, so you could enter trigger phrases for topics that you want your teammates to test.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-share-demo-website.png" alt-text="Screenshot of demo website customization options.":::

Copy the demo website URL and share it with your teammates.

### Add your bot to your website

When your bot is ready for customers, add it to your website as an IFrame code snippet. Your live website can be external or internal, like a SharePoint site. You can also add the bot to your Power Platform admin center.

1. In the navigation menu, select **Settings**, and then select **Channels**.

1. Select **Custom website**, and then either:

    - Select **Copy** to copy the embed code to the clipboard.
    - Select **Share to email** to open a compose window in your default email app, with the code snippet included.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-custom-website.png" alt-text="Screenshot of adding a bot to a custom website.":::

1. Provide the snippet to your web developer to add the bot to your website.


# [Web app](#tab/web)

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

### Custom website

You can add your bot to a live website as an IFrame. Your live website can be a customer-facing external website or an internal site, like a SharePoint site.

You can also add the bot to your Power Platform admin center.

### Add bot to your website

1. In the navigation menu under **Settings**, select **Channels**.

1. Select **Custom website** and then select **Copy** to copy it directly to the clipboard, or **Share to email** to open a new email message with the snippet included, in your default email app.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-custom-website.png" alt-text="Add bot to custom website." border="false":::

1. Provide the snippet to your web developer to add the bot to your website.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
