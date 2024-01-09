---
title: Create a copilot from the content of an existing copilot
description: Create a pcopilot by cloning the content of an existing copilot in Microsoft Copilot Studio.
ms.date: 1/8/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: gapretty
manager: leeclontz
ms.service: power-virtual-agents
ms.collection: virtual-agent
ms.custom: bap-template
---

# Create a copilot from the content of an existing copilot

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Use familiar content to explore features of Microsoft Copilot Studio by cloning an existing copilot.

## Eligibility

Copilots that use any of these features aren't eligible to be cloned:

- Languages other than English
- Hand-off to Omnichannel for Customer Service
- Knowledge Management extensions

## Limitations

When you clone the content of a copilot, any topic that's authored using Bot Framework Composer is created as an empty topic with none of the content or nodes in the original topic. You need to add content to those topics after your copilot is created. However, the cloned topic has the same input and output variables as the original.

## Clone a copilot

1. Open your copilot in Copilot Studio.

1. On the **Overview** page, select **Try the preview**.

   :::image type="content" source="media/clone-existing-bot/preview-tile.png" alt-text="Screenshot of tile with invitation to try the new Microsoft Copilot Studio preview.":::

   A window opens with a description of preview features.

1. Select **Continue**.

   > [!IMPORTANT]
   > If your [bot isn't eligible for cloning](#eligibility), Microsoft Copilot Studio prompts you to create a preview bot instead.

1. Select **Copy and convert this bot**.

1. (Optional) Give your preview bot a new **Bot name**.

1. Select **Create**.

    :::image type="content" source="media/clone-existing-bot/modal-step2.png" alt-text="Screenshot of the Chatbots (preview) tile where an existing bot can be copied and converted for use in the Microsoft Copilot Studio preview.":::

    > [!TIP]
    > There are some limitations on the types of content that can be copied from an existing bot. Microsoft Copilot Studio notifies you before it creates your preview bot if any limitations apply to your existing bot.

1. Wait for Microsoft Copilot Studio to create your preview bot. When it's ready, select **Go to your bot**.

    :::image type="content" source="media/clone-existing-bot/modal-complete.png" alt-text="Screenshot of the completion screen.":::

## Related topics

[Create and edit topics in your Microsoft Copilot Studio bot](authoring-create-edit-topics.md).

[!INCLUDE[footer-include](includes/footer-banner.md)]

