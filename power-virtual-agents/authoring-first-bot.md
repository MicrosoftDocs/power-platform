---
title: "Create conversational chatbots"
description: "You can easily create new bots using the bot-builder wizard in Power Virtual Agents."
keywords: "PVA"
ms.date: 10/22/2021

ms.topic: article
author: iaanw
ms.author: iawilt
ms.custom: onboarding, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

# Create and delete Power Virtual Agents bots

[!INCLUDE[public preview disclaimer](includes/public-preview-disclaimer-prod.md)]

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

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).

## Create a bot

> [!NOTE]
> If this is your first time creating a bot in Power Virtual Agents, please see [Create your first bot](fundamentals-get-started.md)

1. Go to the [Power Virtual Agents home page](https://web.powerva.microsoft.com/).

1. In the navigation menu select **Create**. You can also select **Home** then select **Create a bot**.

1. Choose the type of bot you want to create:

    - Use **Build for production** to create production bots that are intended to be deployed to your customers.

    - Use **Try the unified canvas (preview)** to test out the new authoring features in preview. These preview bots are supported in English only and aren't recommended for deploying for customer use.

    > [!IMPORTANT]
    > If you choose to create a preview bot, please refer to the [preview documentation](preview/overview.md).

1. For **Name your bot**, enter a name for your bot.

1. For **What language will your bot speak**, select the language you want your bot to speak.

1. Select **Create**.

## Delete a bot

You can delete bots to remove them from your environment.

1. Go to the [Power Virtual Agents home page](https://web.powerva.microsoft.com/).

1. In the navigation menu, select **Chatbots**. Select the bot you want to delete, then select **Delete**.

    :::image type="content" source="media/authoring-first-bot/delete-bot.png" alt-text="General settings." border="false":::

1. You'll be asked to confirm the deletion of the bot by typing the bot's name. Once you confirm, all bot content will be deleted after a few minutes.

If your license has expired, you can delete your bot(s) by selecting **Permanently delete your bots**.

## Known issues with creating a bot

When you are creating your bot, you might encounter the following issues.

### Insufficient permissions for the selected environment

In this case, you see this error: "You do not have permissions to any environments. Please get access from an administrator."

You will need to [create a new environment](environments-first-run-experience.md). Use that environment to create your bot.

[!INCLUDE[footer-include](includes/footer-banner.md)]
