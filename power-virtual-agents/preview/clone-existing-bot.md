---
title: Create a preview bot from the content of an existing bot (preview)
description: Create a preview bot by cloning the content of an existing bot in Microsoft Power Virtual Agents preview.
ms.date: 12/07/2022

ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: gapretty
ms.service: power-virtual-agents
ms.collection: virtual-agent
ms.custom: bap-template
---

# Create a preview bot from the content of an existing bot (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

Use familiar content to explore preview features of Power Virtual Agents by cloning an existing non-preview bot.

## Eligibility

Bots that use any of the following features aren't eligible to be cloned:

- Languages other than English
- Hand-off to Omnichannel for Customer Service
- Knowledge Management extensions

If your non-preview bot isn't eligible for cloning, [create a preview bot](quickstart.md) to explore Power Virtual Agents preview features.

## Limitations

When you clone the content of a non-preview bot, any topic that was authored using Bot Framework Composer is created as an empty topic, with none of the content or nodes in the original topic. You'll need to add content to those topics after your preview bot has been created. However, the cloned topic will have the same input and output variables as the original.

## Clone a bot

1. Open your non-preview bot in Power Virtual Agents.

1. On the bot **Overview** page, select **Try the preview**.

   :::image type="content" source="media/clone-existing-bot/preview-tile.png" alt-text="Screenshot of tile with invitation to try the new Power Virtual Agents preview.":::

   A window opens with a description of preview features.

1. Select **Continue**.

   > [!IMPORTANT]
   > If your [bot isn't eligible for cloning](#eligibility), Power Virtual Agents prompts you to create a preview bot instead.

1. Select **Copy and convert this bot**.

1. (Optional) Give your preview bot a new **Bot name**.

1. Select **Create**.

    :::image type="content" source="media/clone-existing-bot/modal-step2.png" alt-text="Screenshot of the Chatbots (preview) tile where an existing bot can be copied and converted for use in the Power Virtual Agents preview.":::

    > [!TIP]
    > There are some limitations on the types of content that can be copied from an existing bot. Power Virtual Agents notifies you before it creates your preview bot if any limitations apply to your existing bot.

1. Wait for Power Virtual Agents to create your preview bot. When it's ready, select **Go to your bot**.

    :::image type="content" source="media/clone-existing-bot/modal-complete.png" alt-text="Screenshot of the completion screen.":::

## Next steps

[Create and edit topics in your Power Virtual Agents bot](authoring-create-edit-topics.md).
