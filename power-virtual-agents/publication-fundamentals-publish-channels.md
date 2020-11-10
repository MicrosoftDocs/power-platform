---
title: "Fundamentals - Publish a chatbot to various channels"
description: "Publish your bot to the web, Microsoft Teams, Facebook, or even use an existing Azure Bot Service framework."
keywords: "Publish; demo; demo website; channels, PVA"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "publication, fundamentals, ceX"
ms.collection: virtual-agent
---

# Key Concepts - Publish your bot

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](publication-fundamentals-publish-channels.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/publication-fundamentals-publish-channels-teams.md)

With Power Virtual Agents, you can publish bots to engage with your customers on multiple platforms or channels. These include live websites, mobile apps, and messaging platforms like Microsoft Teams and Facebook. 

After you've published at least once, you can connect your bot to additional channels. 

Each time you want to update your bot, you publish it again from within the Power Virtual Agents app itself. This will update the bot across all the channels where you've inserted or connected your bot.

>   
> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4mGa9]
>

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]


## Publish the latest bot content

You need to publish the bot at least once before your customers can interact with it or you can share it with your teammates. 

After the first publish, you can do subsequent publishes whenever you would like your customers to engage with the latest bot content.

**Publish the latest bot content:**

1. Go to the **Publish** tab on the side navigation pane. 

2. Select **Publish** to make the latest bot content available to your customers.

    ![Publish latest bot content](media/channel-publish-latest-content.png)

The publishing process will check for errors in the latest bot content.

![Validate latest bot content for publish](media/channel-publish-validation.png)

Publication should take less than a few minutes and, when successful, you can view the bot in action and share it with your team by selecting the **demo website** link. This is useful to gather feedback from stakeholders involved in the bot. The link will open a new tab and display a prebuilt demo website where you and your team can interact with the bot.

![Go to demo website](media/channel-go-to-demo-website.png)

Go to the [Configure the demo website and add the bot to your live website](publication-connect-bot-to-web-channels.md) topic for details on updating the welcome message and help text on the demo website.

> [!TIP]
> **What's the difference between the test chat and the demo website?** <br/>
> The demo website lets you share a URL with other members of your team, or other stakeholders who want to try out the bot. It's not intended for production uses (for example, you shouldn't use it directly with customers). <br/>
> The test chat is intended for bot authors to test how conversation nodes flow and if there are errors when they are creating and testing their bot.

## Configure channels

After publishing your bot at least once, you can add channels to make the bot reachable by your customers. You can see what channels we currently support by selecting **Manage** and going to the **Channels** tab in the side navigation pane.

![Channel settings](media/channel-channels-menu.png)

Each channel requires different steps and configurations, which can be found in the following topics:

- [Configure the demo website and add the bot to your live website](publication-connect-bot-to-web-channels.md)
- [Add bot to Microsoft Teams](publication-add-bot-to-microsoft-teams.md)
- [Add bot to Facebook](publication-add-bot-to-facebook.md)
- [Add bot to mobile and custom apps (web-based or native)](publication-connect-bot-to-custom-application.md)
- [Add bot to Azure Bot Service channels](publication-connect-bot-to-azure-bot-service-channels.md)



## Channel experience reference table
Different channels have different end-user experiences. The following table shows a high-level overview of the experiences for each channel. You can take the channel experiences into account when optimizing your bot content for specific channels.

 Experience | Website | Microsoft Teams(1) | Facebook
 ---|---|---|---
 [Customer satisfaction survey](authoring-create-edit-topics.md#insert-nodes) | Adaptive card | Text-only | Text-only
 [Multiple-choice options](authoring-create-edit-topics.md#insert-nodes) | Supported | [Supported up to 6](/microsoftteams/platform/concepts/cards/cards-reference#hero-card) | [Supported up to 13](https://developers.facebook.com/docs/messenger-platform/send-messages/quick-replies/)
 [Markdown](https://daringfireball.net/projects/markdown/) | Supported | Supported | [Partially supported](https://www.facebook.com/help/147348452522644?helpref=related)
 [Welcome message](authoring-create-edit-topics.md#insert-nodes) | Supported | Supported | Not supported

(1): [Dynamics Omnichannel for Customer Service](https://docs.microsoft.com/dynamics365/omnichannel/omnichannel-customer-service-guide) has the same experience as Microsoft Teams when integrated with a Power Virtual Agents bot .  

 ## In this section


- [Configure the demo website and add the bot to your live website](publication-connect-bot-to-web-channels.md) | Publish your bot on your live website, or use a demo website to share internally.
- [Add bot to Microsoft Teams](publication-add-bot-to-microsoft-teams.md) | Use Teams to distribute your bot.
- [Add bot to Facebook](publication-add-bot-to-facebook.md) | Add your bot to Facebook Messenger.
- [Add bot to mobile and custom apps (web-based or native)](publication-connect-bot-to-custom-application.md) | Add your bot to mobile or custom native apps (developer coding required).
- [Add bot to Azure Bot Service channels](publication-connect-bot-to-azure-bot-service-channels.md) | Add your bot to Azure Bot Service channels (developer coding required).
