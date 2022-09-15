---
title: "Create a preview bot from the content of an existing bot"
description: "Create a new preview bot by cloning the content from an existing Power Virtual Agents bot."
ms.date: 09/14/2022
ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: gapretty
manager: shellyha
ms.collection: virtual-agent
---

# Create a preview bot from the content of an existing bot

This article describes how to clone the content from an existing non-preview bot to create a new preview bot. This process lets you use a bot with familiar content to explore preview features on the unified canvas.

## Eligibility

Some bots are not currently eligible to have their content cloned into a new preview bot. Bots that use any of the following features are not eligible:

- Languages other than English
- Hand-off to Omnichannel for Customer Service
- Knowledge Management extensions

Whether or not your bot is eligible, you can [create a new preview bot](build-2022-quickstart.md) to explore preview features on the unified canvas.

## Limitations

When creating a preview bot and cloning content from an existing bot, any topic authored using Bot Framework Composer will be created as an empty topic, meaning none of the content or nodes within the topic are copied. However with the topic will retain the same input and output variables.
  
Once your preview bot has been created, you will need to update those topics and add content to them.

## Clone a bot

<!--FIXME: 09/12, feature not yet visible in dogfood-->

1. Open your existing non-preview bot in Power Virtual Agents.
1. On the bot **Overview** page, select **Try the preview**.

   :::image type="content" source="media/clone-existing-bot/preview-tile.png" alt-text="Screenshot of tile with invitation to try the new Power Virtual Agents preview.":::

1. On the **Create a chatbot** page, select **Try the unified canvas (preview)**.

   1. Power Virtual Agents will open a dialog and describe features of the preview.
   1. On the **Chatbots (preview)** page, select **Continue**.
   1. On the **Create a chatbot (preview)** page, if your [bot is eligible](#eligibility), you can copy and convert your existing bot content, or you can create a new preview bot.

      - Make sure **Copy and convert this bot** is selected.
      - Optionally edit the name for your new preview bot.
      - Select **Create**.

      :::image type="content" source="media/clone-existing-bot/modal-step2.png" alt-text="Screenshot of tiles inviting users to try the new Power Virtual Agents preview.":::

      > [!TIP]
      > There are some limitations with the type of content that can be copied from an existing bot. If there are any limitations that will affect your bot, you will be informed of these, before Power Virtual Agents creates your new bot.

1. Wait until Power Virtual Agents creates your new bot.

    :::image type="content" source="media/clone-existing-bot/modal-in-progress.png" alt-text="Screenshot of the in progress screen whilst your new bot is being created.":::

1. When your new bot is ready, select **Go to your bot** to open your new bot.

    :::image type="content" source="media/clone-existing-bot/modal-complete.png" alt-text="Screenshot of the completion screen.":::

## Next steps

[Create and edit topics in your Power Virtual Agents bot](authoring-create-edit-topics.md)
