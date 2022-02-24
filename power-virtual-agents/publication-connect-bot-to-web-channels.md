---
title: "Configure a chatbot for a live or demo website (contains video)"
description: "You can use a prebuilt demo website to try out your bot, or you can publish it directly to your own webpage using an IFrame code snippet."
keywords: "Publish, channel, connector, sample code, developer, extensibility, PVA"
ms.date: 01/25/2022

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "publication, authoring, ceX"
ms.collection: virtual-agent
---

# Configure the demo website and add the bot to your live website

When publishing the bot to the web, you can publish to a prebuilt demo website (which you can use to share the bot with your teammates and stakeholders) and to your own live website.
  
>  
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mGa9]
>  

> [!TIP]
> **When should I use the demo website and when should I use my own website?**  
> You should use the demo website only to try out the bot and share it with your teammates or other stakeholders who want to try out the bot. It's not intended for production uses, for example, you shouldn't use it directly with customers.  
> You should publish and use the bot on your live website for production scenarios, such as a help bot on your help webpage for customers to interact with.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

## Demo website

You can edit the welcome message and suggested trigger phrases for the demo website. A welcome message helps prompt your teammates for what they should ask the bot about.

> [!TIP]
> You can change the welcome message to explain the intent or purpose of the testing, and you can change it as often as you like. So you could create a welcome message asking to test out conversations related to store hours and then, after making updates to the bot, change the welcome message to ask testers to try conversations related to gift cards.

### Update the demo website

1. On the side pane, go to **Manage** > **Channels**.

1. Select the **Demo website** tile.

1. Enter the welcome message you'd like to see alongside the bot in the **Welcome message** text field.

1. Enter a list of suggested trigger phrases in the **Conversation starters** text field. Trigger phrases are what initiate specific topics, so you could customize your trigger phrases to specific topics that you want your teammates to try out.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-share-demo-website.png" alt-text="Share demo website.":::

To share the demo website link, copy the demo website URL and share it with your teammates directly.

## Custom website

You can add your bot to a live website as an IFrame. Your live website can be a customer-facing external website or an internal site, like a SharePoint or Yammer site.

You can also add the bot to your Power Platform admin center.

### Add bot to your website

1. On the side pane, go to **Manage** > **Channels**.

1. Select **Custom website** and then select **Copy** to copy it directly to the clipboard, or **Share to email** to open a new email message with the snippet included, in your default email app.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-custom-website.png" alt-text="Add bot to custom website." border="false":::

1. Provide the snippet to your web developer to add the bot to your website.

## Power Apps portals

You can add your bot to a Power Apps portal either directly with the chatbot component, or with a URL snippet in an IFrame.

### Add bot to a Power Apps portal

You can add your bot to a Power Apps portal in a few quick steps without any code. Power Apps portals allow you to add a Power Virtual Agents chatbot on your portal page by adding a chatbot component with limited customization.

See the [Add chatbot to a page](/powerapps/maker/portals/add-chatbot) topic in the Power Apps documentation library for details.

### Add bot to Power Apps with an IFrame

You can also add your bot to Power Apps as an IFrame. Your live website can be a customer-facing external website or an internal site, like a SharePoint or Yammer site.

You can also add the bot to your Power Platform admin center.

1. In the Power Virtual Agents Portal side pane, go to **Manage** > **Channels**.

1. Select **Custom website** and then copy only the URL of the IFrame snippet: this URL is defined by `src="<URL>"`.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-custom-website-url.png" alt-text="Select only the src URL." border="false":::

1. Go to Power Apps Studio and add an [IFrame component](/powerapps/maker/portals/compose-page#add-iframe) into your app by selecting **Components** > **IFrame**.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-custom-website-portal-iframe.png" alt-text="Add IFrame to Power Apps." border="false":::

1. Paste in the URL you copied from the IFrame snippet into the **Link** field of the IFrame component. You can adjust the size of the chat window by adjusting the **Width** and **Height** field.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-custom-website-portal-pva-iframe.png" alt-text="Add bot IFrame to Power Apps." border="false":::

1. Interact with your bot by clicking on **Browse website**.

    :::image type="content" source="media/publication-connect-bot-to-web-channels/channel-custom-website-portal-browse-website.png" alt-text="Browse website with IFrame added." border="false":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
