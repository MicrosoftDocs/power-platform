---
title: "Fundamentals - Publish a chatbot to various channels in Microsoft Teams"
description: "Publish your bot to Microsoft Teams."
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

# Key Concepts - Publish your bot in Teams

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../publication-fundamentals-publish-channels.md)
> - [Power Virtual Agents app in Microsoft Teams](publication-fundamentals-publish-channels-teams.md)



Once you're satisfied with your bot's content and quality, you can publish your bot to allow users to engage with your bot. You must publish your bot at least once for the user to chat with the bot in Microsoft Teams.

Each time you want to update your bot's content, you publish it again from within the Power Virtual Agents app in Microsoft Teams. This will update the bot's content with the latest changes you have made.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations-teams.md)]


## Publish the latest bot content

You need to publish the bot at least once before you can share it with your teammates. 

After the first publish, you can do subsequent publishes whenever you would like your customers to see the latest bot content.

**Publish the latest bot content:**

1. Go to the **Publish** tab on the side navigation pane. 

2. Select **Publish** to make the latest bot content available to your customers.

    :::image type="content" source="media/channel-publish-latest-content-teams.png" alt-text="Publish latest bot content.":::

The publishing process will check for errors in the latest bot content.

When publication is successful, you can [make the bot available to users in Microsoft Teams](publication-add-bot-to-microsoft-teams-teams.md) via installation link or show in diferent sections of Microsoft Teams app store. You can always do it later by selecting **Make bot available to others** from the Publish page.

You can also install the bot fot your own use in Microsoft Teams by selecting **Open the bot**.

> [!TIP]
>To prevent disrupting users who are having an existing conversation with the bot, they will not receive the latest published content until a new conversation has started. A new conversation starts after it has been idle for more than 30 minutes.  
>You may want to try out the latest published content in Microsoft Teams right away.  
>You can do so by typing *start over* in an existing conversation.  
>This will restart the conversation with the latest content you have published.


 ## In this section


- [Add bot to Microsoft Teams](publication-add-bot-to-microsoft-teams-teams.md) | Make your bot available to users in Microsoft Teams
- [Create a privacy statement and terms of use](publication-terms-of-use-teams.md) | Create and link to a privacy statement and terms of use for bots you create.

## Known limitations
- Customer satisfaction survey is a text-only version in Microsoft Teams instead of an adaptive card.
- Microsoft Teams can only render up to six suggested actions for user in one question node.
- A user can't send or upload attachments to the chat. If they try to send an attachment, the bot will reply with *Looks like you tried to send an attachment. Currently, I can only process text. Please try sending your message again without the attachment.* 
  - This applies to all channels, even if the channel or end-user-facing experience supports attachments (for example, if you're using the Direct Line API or Microsoft Teams).  
  - Attachments can be supported if the message is sent to a skill, where the skill bot supports the processing of attachments.  
  - See the [Use Microsoft Bot Framework skills topic](advanced-use-skills-teams.md) for more details on skills.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
