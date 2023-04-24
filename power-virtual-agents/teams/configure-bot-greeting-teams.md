---
title: "Automatically start a chatbot conversation in Microsoft Teams"
description: "Change the default greeting that a chatbot in the Power Virtual Agents app in Microsoft Teams uses."
keywords: "PVA, Teams"
ms.date: 01/25/2022

ms.topic: article
author: iaanw
ms.author: iawilt
ms.reviewer: digantak
ms.custom: "customization, ce06102020, teams"
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Configure how the bot starts the conversation

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](../configure-bot-greeting.md)
> - [Power Virtual Agents app in Microsoft Teams](configure-bot-greeting-teams.md)

By default, chatbots created with the Power Virtual Agents app in Microsoft Teams will automatically start the conversation when installed for the first time.

You can change what the bot says by updating the greeting topic.

For example, you could have your bot say, "Hi, I'm Botty, a virtual agent" as soon as the bot loads.

You can also combine the customized greeting with [customization to the look and feel of the bot](customize-default-canvas-teams.md).

> [!IMPORTANT]
> When your bot starts the conversation, it will show up in your [analytics](analytics-overview-teams.md) and will increase your session count.
>
> If the user of your bot doesn't engage with the bot (for example, they load the page but don't ask the bot anything), the session will be [marked as an unengaged session](analytics-summary-teams.md#engagement-over-time-chart).
>
> This might impact your analytics.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents-teams.md).

## Change the bot's default greeting

1. In the navigation menu, select **Topics**, then select the **Greeting** topic row.

    :::image type="content" source="../media/configure-bot-greeting/select-greeting-topic-teams.png" alt-text="Screenshot of the Topics page, with the Greeting topic highlighted.":::

1. Edit the text inside the **Message** nodes. You can also [add or delete additional nodes](authoring-create-edit-topics-teams.md#insert-nodes).

1. Select **Save** when you're finished editing the message.

1. [**Publish** your bot](publication-add-bot-to-microsoft-teams-teams.md) and test it.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
