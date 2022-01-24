---
title: "Configure a chatbot for a live or demo website (contains video)"
description: "You can use a prebuilt demo website to try out your bot, or you can publish it directly to your own webpage using an IFrame code snippet."
keywords: "Publish, channel, connector, sample code, developer, extensibility, PVA"
ms.date: 5/17/2021
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "publication, authoring, ceX"
ms.collection: virtual-agent
---

# Configure the demo website and add the bot to your live website or Power Apps portal

When publishing the bot to the web, you can publish to a prebuilt demo website (which you can use to share the bot with your teammates and stakeholders) and to your own live website.
  
>  
> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4mGa9]
>  

> [!TIP]
> **When should I use the demo website and when should I use my own website?** <br/>
> You should use the demo website only to try out the bot and share it with your teammates or other stakeholders who want to try out the bot. It's not intended for production uses, for example, you shouldn't use it directly with customers. <br/>
> You should publish and use the bot on your live website for production scenarios, such as a help bot on your help webpage for customers to interact with.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]


## Demo website
You can edit the welcome message and suggested trigger phrases for the demo website. A welcome message helps prompt your teammates for what they should ask the bot about. 

> [!TIP]
> You can change the welcome message to explain the intent or purpose of the testing, and you can change it as often as you like. So you could create a welcome message asking to test out conversations related to store hours and then, after making updates to the bot, change the welcome message to ask testers to try conversations related to gift cards.

**Update the demo website:**

1. Select **Manage** on the side navigation pane and then go to the **Channels** tab.

2. Select the **Demo website** tile.

3. Enter the welcome message you'd like to see alongside the bot in the **Welcome message** text field.

4. Enter a list of suggested trigger phrases in the **Conversation starters** text field. Trigger phrases are what initiate specific topics, so you could customize your trigger phrases to specific topics that you want your teammates to try out.

    :::image type="content" source="media/channel-share-demo-website.png" alt-text="Share demo website.":::

To share the demo website link, copy the demo website URL and share it with your teammates directly. 

## Custom website

You can add your bot to a live website as an IFrame. Your live website can be a customer-facing external website or an internal site, like a SharePoint or Yammer site.

You can also add the bot to your Power Platform admin center.

**Add bot to your website:**

1. Select **Manage** on the side navigation pane, and then go to the **Channels** tab.

2. Select **Custom website** and then select **Copy** to copy it directly to the clipboard, or **Share to email** to open a new email message with the snippet included, in your default email app.

    :::image type="content" source="media/channel-custom-website.png" alt-text="Add bot to custom website." border="false":::

3. Provide the snippet to your web developer to add the bot to your website.

## Power Apps portals

[What are Power App portals?](https://docs.microsoft.com/en-us/powerapps/maker/portals/overview) You can  now add your bot to a Power Apps portal directly within the portal designer using the Chatbot component. This no-code experience in Power Apps portals allow you to add a Power Virtual Agents chatbot to answer questions posted by a visitor on your portals page. The chatbot (bot) can be configured with different topics and trigger phrases to automatically respond to questions posted by a visitor in a chat conversation. 

**Prerequisites**

Create a Power Apps portal. You can learn more about [Creating a starter portal](https://docs.microsoft.com/en-us/powerapps/maker/portals/create-portal) and view samples.

Before you can add a Power Virtual Agents bot to a Power Apps portals page, you must create a bot first. If you don't already have an available bot or one that fits your needs, you'll have the option in portals to go to Power Virtual Agents to create one. To learn how to create a bot, go to [Create and delete Power Virtual Agents bots](https://docs.microsoft.com/en-us/power-virtual-agents/authoring-first-bot).

 **Important**
This feature requires the following versions for starter portal package and portal host:
•	Portal host version [9.3.4.x](https://docs.microsoft.com/en-us/powerapps/maker/portals/versions/version-9.3.4.x) or later.
•	Starter portal package version [9.2.2103.x](https://docs.microsoft.com/en-us/powerapps/maker/portals/versions/package-version-9.2.2103) or later. More information: [additional considerations](https://docs.microsoft.com/en-us/powerapps/maker/portals/add-chatbot#additional-considerations)


**Add a bot to your Power Apps portal**

You can add a bot to your Power Apps portal in a few quick steps without any code. Power Apps portals allow you to add a Power Virtual Agents chatbot on your portal page by adding a chatbot component.

Once you have a Power Apps portal and a chatbot created, you can add this component to a portals page with the following steps:

1. Go to Power Apps.

2. Select Apps from the left pane.

3. Select your portal.

4. Select Edit from the overflow menu to open the portals Studio.

5. Select Components from the left pane.

6. Select Chatbot component.

<<<< insert image of component menu >>>>

Here, you can choose with chatbot to point to. If you don't have a bot already created, or want to create a new bot to use in portals, select **Power Virtual Agents**. Or pick an existing chatbot from the list of bots in the dropdown. After you create your bot, select Sync configuration inside portals Studio to reflect the bot changes.


7. Select whether the bot appears on all pages in your portal, or on specific pages.

<<<<< insert image of chatbot property pane >>>>>

If you select **Specific pages**, use **Manage bots in pages** to control the pages that can use this bot.

You can add more bots from your environment across different pages in a portal. For example, a bot that answers questions related to the workplace can be added to an HR page. Or a bot that answers basic payroll queries can be added to a Finance page. However, you can't have one page use more than one bot.

The chatbot will automatically style to match the Portal theme. If the Portal theme is changed, the chatbot will pick up matching syles for the header and background colors. 

**Advanced Configuration**

For further customization of chatbot styles, you can do advanced customization as explained [in detail here](https://docs.microsoft.com/en-us/powerapps/maker/portals/add-chatbot#advanced-configuration). Since the chatbot component is rendered using a web template called Power Virtual Agents, the template can be updated with custom style options.

[!INCLUDE[footer-include](includes/footer-banner.md)]
