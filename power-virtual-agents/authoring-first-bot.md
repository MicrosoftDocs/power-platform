---
title: "Create conversational chatbots"
description: "You can easily create new bots using the bot-builder wizard in Power Virtual Agents."
keywords: "PVA"
ms.date: 10/22/2021

ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: onboarding, ceX
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

# Create and delete Power Virtual Agents bots

Select the version of Power Virtual Agents you're using here:

> [!div class="op_single_selector"]
>
> - [Power Virtual Agents web app](authoring-first-bot.md)
> - [Power Virtual Agents app in Microsoft Teams](teams/authoring-first-bot-teams.md)

To help get you started and tailor the bot to your specific needs, Power Virtual Agents lets you create a bot using built-in content building blocks containing topics, trigger phrases, and pre-authored bot conversations.

> [!WARNING]
> New bots are configured with "No authentication" and without [web channel security](configure-web-security.md), and can be accessed by anyone with a link to it. Ensure you have the right [authentication](configuration-end-user-authentication.md), [access](configuration-end-user-authentication.md), and [security](configure-web-security.md) configurations set for your particular usage.

> [!NOTE]
> You can only see bots in the version of Power Virtual Agents where you created them.  
>
> This means if you create a bot with the Power Virtual Agents app in Microsoft Teams, you will not see the bot in the web app of Power Virtual Agents at https://web.powerva.microsoft.com.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]

## Create a bot

> [!NOTE]
> If this is your first time creating a bot in Power Virtual Agents, please see [Create your first bot](fundamentals-get-started.md)

1. Select **Power Virtual Agents** in the top menu bar to go to the home page.

    :::image type="content" source="media/authoring-first-bot/go-home.png" alt-text="Screenshot of the Power Virtual Agents menu bar." border="false":::

1. In the side pane select **Create**, or select **Home** and select **Create a bot**.

1. Choose a name for your bot. This can be something generic to your company or specific to the scenario you are tailoring your bot to.

    :::image type="content" source="media/authoring-first-bot/create-new-bot-screen.png" alt-text="Screen shot of new bot dialog." border="false":::

1. Select **Create**.

## Delete a bot

You can delete bots to remove them from your environment.

1. Select **Power Virtual Agents** in the top menu bar to go to the home page.

    :::image type="content" source="media/authoring-first-bot/go-home.png" alt-text="Screenshot of the Power Virtual Agents menu." border="false":::

1. In the side pane, select **Chatbots**. Select the bot you want to delete, then select **Delete**.

    :::image type="content" source="media/authoring-first-bot/delete-bot.png" alt-text="General settings." border="false":::

1. You'll be asked to confirm the deletion of the bot by typing the bot's name. Once you confirm, all bot content will be deleted after a few minutes.

If your license has expired, you can delete your bot(s) by selecting **Permanently delete your bots**.

## Known issues with creating a bot

When you are creating your bot, you might encounter the following issues.

### Insufficient permissions for the selected environment

In this case, you see this error: "You do not have permissions to any environments. Please get access from an administrator."

You will need to [create a new environment](environments-first-run-experience.md). Use that environment to create your bot.

### The environment I created does not show up in the drop-down menu of Power Virtual Agents

Your environment might not show up in the drop-down menu due to one of the following:

- The environment doesn't have a database created. To resolve this, go to [admin.powerplatform.com](https://admin.powerplatform.com) to [create a database in your environment](/power-platform/admin/create-database).
- The environment is created in an unsupported region. Learn more about [supported data locations](data-location.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
