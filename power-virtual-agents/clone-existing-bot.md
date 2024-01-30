---
title: Create a copilot from an existing classic copilot
description: Create a copilot by cloning an existing, classic copilot in Microsoft Copilot Studio.
ms.date: 1/8/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: gapretty
manager: leeclontz
ms.service: power-virtual-agents

ms.custom: bap-template
---

# Create a copilot from an existing classic copilot

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can clone an existing, classic copilot into an updated copilot to explore the latest features of Microsoft Copilot Studio.

## Eligibility

Copilots that use any of these features aren't eligible to be cloned:

- Languages other than English
- Hand-off to Omnichannel for Customer Service
- Knowledge Management extensions

## Limitations

When you clone the contents of a classic copilot, any topic authored using Bot Framework Composer is created as an empty topic with none of the content or nodes in the original topic. You need to add content to those topics after your copilot is created. However, the cloned topic has the same input and output variables as the original.

## Clone a copilot

1. Open your classic copilot in Copilot Studio.

1. On the **Overview** page, select **Copy this bot**.

   :::image type="content" source="media/clone-existing-bot/copy-this-bot-tile.png" alt-text="Screenshot of tile with the Copy this bot button.":::

   A **Chatbots** window opens, giving you the option to **Copy and convert this bot** or **Try out the new studio experience**.

1. Select **Copy and convert this bot** and give your copy a name or use the default name.

   :::image type="content" source="media/clone-existing-bot/copy-bot-create-tile.png" alt-text="Screenshot of tile with two options to either copy the bot or to create a new bot in Copilot Studio.":::

1. Select **Create**.

   > [!IMPORTANT]
   > If your [bot isn't eligible for cloning](#eligibility), Copilot Studio prompts you to create a new bot instead.

1. Wait for Microsoft Copilot Studio to create your new copilot copy. When it's ready, select **Go to your bot**. You see your new copy copilot opened in Copilot Studio.

    :::image type="content" source="media/clone-existing-bot/modal-complete.png" alt-text="Screenshot of the completion screen.":::

## Related topics

[Create and edit topics in your Microsoft Copilot Studio copilot](authoring-create-edit-topics.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]
