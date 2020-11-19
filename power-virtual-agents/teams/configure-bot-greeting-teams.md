---
title: "Automatically start a chatbot conversation in Microsoft Teams"
description: "Change the default greeting that a chatbot in the Power Virtual Agents app in Microsoft Teams uses."
keywords: "PVA"
ms.date: 9/22/2020
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: digantak
manager: shellyha
ms.custom: "customization, ce06102020, teams"
ms.collection: virtualagent
---

# Configure how the bot starts the conversation

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
> - [Power Virtual Agents web app](../configure-bot-greeting.md)
> - [Power Virtual Agents app in Microsoft Teams](configure-bot-greeting-teams.md)



By default, chatbots created with the Power Virtual Agents app in Microsoft Teams will automatically start the conversation when someone opens a chat with the bot.

You can change what the bot says by updating the greeting topic.


For example, you could have your bot say, "Hi, I'm Botty, a virtual agent" as soon as the bot loads.

You can also combine the customized greeting with [customization to the look and feel of the bot](customize-default-canvas-teams.md).

>[!IMPORTANT]
>Having the bot start the conversation will show up in your [analytics](analytics-overview-teams.md) and will increase your session count.
>If the user of your bot doesn't engage with the bot (for example, they load the page but don't ask the bot anything), the session will be [marked as an unengaged session](analytics-summary-teams.md#engagement-over-time-chart). 
>This might impact your analytics.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations-teams.md)]



## Change the bot's default greeting

1. Select **Topics** on the side navigation pane.

2. Under **System Topics**, select the **Go to authoring canvas** icon on the **Greeting** topic row.

    :::image type="content" source="media/custom-greeting-topic-teams.png" alt-text="Screenshot of the Topics page, with the Greeting topic highlighted":::

3. Edit the text inside the **Message** nodes. You can also [add or delete additional nodes](authoring-create-edit-topics-teams.md#insert-nodes).

4. Select **Save** when you're finished editing the message.


    :::image type="content" source="media/custom-greeting-message-teams.png" alt-text="Screenshot of the system greeting topic showing the message nodes that can be edited":::

5. [**Publish** your bot](publication-add-bot-to-microsoft-teams-teams.md) and test it.





