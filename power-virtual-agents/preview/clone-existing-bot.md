---
ROBOTS: NOINDEX,NOFOLLOW
title: "Create a preview bot by cloning an existing bots content"
description: "Create a new preview bot, cloning the content from an existing Power Virtual Agents bot."
ms.date: 09/07/2022
ms.topic: article
author: gapretty
ms.author: gapretty
manager: mahesha
ms.collection: virtual-agent
---

# Create a preview bot by cloning an existing bots content

This article walks you through creating a new preview bot by cloning the content from an existing non-preview bot.

## Eligibility

Some bots are not currently eligible to have their content cloned into a new preview bot.

- Non English bots
- Bots that are connected to Omnichannel for Customer Service
- Bots that take advantage of Knowledge Management extensions

You can still [create a new preview bot](build-2022-quickstart.md) to try the preview if you're bot is not eligible.

## Clone a bot

1. Navigate to the bot **overview** page for an existing (non-preview) bot and locate the tile that invites you to try the new preview.

   :::image type="content" source="media/clone-existing-bot/preview-tile.png" alt-text="Screenshot of tiles inviting users to try the new Power Virtual Agents preview.":::

1. Click **Try the preview**, which will present you with a modal window with an overview of the preview and then choose **Continue**.

1. On the next page within the wizard, if your [bot is eligible](#eligibility), you will be presented with a choice of copying and converting your existing bot's content, or creating a new preview bot. Providing you're happy to continue with your existing bot's content, leave the selection as **Copy and convert this bot**, optionally amend your new preview bot's name, and then choose **Create**.

   :::image type="content" source="media/clone-existing-bot/modal-step2.png" alt-text="Screenshot of tiles inviting users to try the new Power Virtual Agents preview.":::

    > [TIP]
    > There are some limitations with the type of content that can be copied from an existing bot. If there are any limitations that will affect your bot, you will be informed of these on the next screen, before continuing to create your new bot.

1. Your new preview bot will now be created.

    :::image type="content" source="media/clone-existing-bot/modal-in-progress.png" alt-text="Screenshot of the in progress screen whilst your new bot is being created.":::

1. Once created, you can choose **Go to your bot** to navigate to your new bot.

    :::image type="content" source="media/clone-existing-bot/modal-in-progress.png" alt-text="Screenshot of the completion screen.":::

## Limitations

The following limitations currently exist when creating a preview bot and cloning content from an existing bot.

- Any topics authored using Bot Framework Composer will be created as stub topics in your new bot. Any input or output variables will be configured on the new topic, but the content and nodes within the topic will not. You will need to update those topics and add content to them, once your preview bot has been created.