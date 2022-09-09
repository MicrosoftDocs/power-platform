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

This article walks you through creating a new preview bot by cloning the content from an existing non-preview bot.

## Eligibility

Some bots are not currently eligible to have their content cloned into a new preview bot.

- Non English bots
- Bots that are connected to Omnichannel for Customer Service
- Bots that take advantage of Knowledge Management extensions

You can still [create a new preview bot](build-2022-quickstart.md) to try the preview if you're bot is not eligible.

## Clone a bot

<!--09/09 Feature not yet available-->

1. Open your existing (non-preview) bot in PVA.
1. Go to the **Overview** page for an existing bot and select **Try the preview**.

   :::image type="content" source="media/clone-existing-bot/preview-tile.png" alt-text="Screenshot of tiles inviting users to try the new Power Virtual Agents preview.":::

1. On the **Create a chatbot** page, select **Try the unified canvas (preview)**. PVA will open a dialog.
   1. The **Chatbots (preview)** page describes features of the preview. Select **Continue**.

   1. On the **Create a chatbot (preview)** page, if your [bot is eligible](#eligibility), you can copy and convert your existing bot content, or you can create a new preview bot. To continue, make sure **Copy and convert this bot** is selected, optionally edit the name for your new preview bot, and then select **Create**.

      :::image type="content" source="media/clone-existing-bot/modal-step2.png" alt-text="Screenshot of tiles inviting users to try the new Power Virtual Agents preview.":::

       > [!TIP]
       > There are some limitations with the type of content that can be copied from an existing bot. If there are any limitations that will affect your bot, you will be informed of these on the next screen, before continuing to create your new bot.

1. PVA will create your new bot.

    :::image type="content" source="media/clone-existing-bot/modal-in-progress.png" alt-text="Screenshot of the in progress screen whilst your new bot is being created.":::

1. Once it's created, select **Go to your bot** to navigate to your new bot.

    :::image type="content" source="media/clone-existing-bot/modal-complete.png" alt-text="Screenshot of the completion screen.":::

## Limitations

The following limitations currently exist when creating a preview bot and cloning content from an existing bot.

- Any topics authored using Bot Framework Composer will be created as stub topics in your new bot. Any input or output variables will be configured on the new topic, but the content and nodes within the topic will not. You will need to update those topics and add content to them, once your preview bot has been created.
