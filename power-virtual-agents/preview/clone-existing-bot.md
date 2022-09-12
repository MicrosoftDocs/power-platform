---
ROBOTS: NOINDEX,NOFOLLOW
title: "Create a preview bot from the content of an existing bot"
description: "Create a new preview bot, cloning the content from an existing Power Virtual Agents bot."
ms.date: 09/14/2022
ms.topic: article
author: garypretty
ms.author: gapretty
manager: mahesha
ms.collection: virtual-agent
---

# Create a preview bot from the content of an existing bot

This article describes how to clone the content from an existing non-preview bot to create a new preview bot.
This process lets you use a bot with familiar content to explore preview features on the unified canvas.

## Eligibility

Some bots are not currently eligible to have their content cloned into a new preview bot.
Bots with any of the following features are not eligible. <!--Need to make list more "parallel".-->

- Non-English bots
- Bots that are connected to Omnichannel for Customer Service <!--Is this a flow feature? A channel?-->
- Bots that use Knowledge Management extensions <!--What is this?-->

If your bot isn't eligible, you can use [a new preview bot](build-2022-quickstart.md) to explore preview features on the unified canvas.

## Clone a bot

<!--09/12, am Feature not yet visible in dogfood-->

1. Open your existing non-preview bot in PVA.
1. On the bot **Overview** page, select **Try the preview**.

   :::image type="content" source="media/clone-existing-bot/preview-tile.png" alt-text="Screenshot of tile with invitation to try the new Power Virtual Agents preview.":::

1. On the **Create a chatbot** page, select **Try the unified canvas (preview)**. PVA will open a dialog.

   1. The **Chatbots (preview)** page describes features of the preview. Select **Continue**.
   1. On the **Create a chatbot (preview)** page, if your [bot is eligible](#eligibility), you can copy and convert your existing bot content, or you can create a new preview bot.

      Make sure **Copy and convert this bot** is selected, optionally edit the name for your new preview bot, and then select **Create**.

      :::image type="content" source="media/clone-existing-bot/modal-step2.png" alt-text="Screenshot of tiles inviting users to try the new Power Virtual Agents preview.":::

      > [!TIP]
      > There are some limitations with the type of content that can be copied from an existing bot. If there are any limitations that will affect your bot, you will be informed of these on the next screen, before continuing to create your new bot.

1. PVA creates your new bot.

    :::image type="content" source="media/clone-existing-bot/modal-in-progress.png" alt-text="Screenshot of the in progress screen whilst your new bot is being created.":::

1. When your new bot is ready, select **Go to your bot** to open your new bot.

    :::image type="content" source="media/clone-existing-bot/modal-complete.png" alt-text="Screenshot of the completion screen.":::

## Limitations

The following limitations currently exist when creating a preview bot and cloning content from an existing bot.

- Any topics authored using Bot Framework Composer will be created as stub topics in your new bot. Any input or output variables will be configured on the new topic, but the content and nodes within the topic will not. You will need to update those topics and add content to them, once your preview bot has been created.
