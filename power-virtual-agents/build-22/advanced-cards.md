---
ROBOTS: NOINDEX,NOFOLLOW
title: Add multimedia cards to messages
description: Add rich multimedia responses to question and message nodes in Power Virtual Agents bots.
keywords: "PVA"
ms.date: 05/31/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: gapretty
manager: shellyha
ms.custom: authoring, topics, variables, ceX
ms.collection: virtual-agent
---

# Add multimedia cards to bot responses

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

Cards add rich multimedia responses to question and message nodes in your bot conversations. With cards, you can go beyond basic text replies by adding images, videos, and interactive elements.

Several types of cards provide different experiences to users. You can preview all types on the authoring canvas in real time.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)
- [Use variables](authoring-variables.md)

## Basic card

:::image type="content" source="media/advanced-cards/add-basic-card.png" alt-text="Screenshot of a message node with a basic card.":::

A basic card is a general-purpose card that you can use in various situations to add text, images, and interactive elements to bot responses.

1. On the authoring canvas, select the plus (**+**) icon. Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Basic card**.

1. In the properties pane, fill in the information you want to display in the response.

## Image card

:::image type="content" source="media/advanced-cards/add-image-card.png" alt-text="Screenshot of a message node with an image card.":::

An image card is a specialized card that shows an image to a user.

1. On the authoring canvas, select the plus (**+**) icon. Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Image**.

1. Optionally, enter a **Title** for the image.

1. Under **Image URL**, enter the URL of your image.

## Video card

:::image type="content" source="media/advanced-cards/add-video-card.png" alt-text="Screenshot of a message node with a video card.":::

A video card is a specialized card that shows a video to a user.

1. On the authoring canvas, select the plus (**+**) icon. Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Video**.

1. Optionally, enter a **Title**, **Subtitle**, and **Text** for the video.

1. Under **Video URL**, enter the URL of your video.

## Adaptive card

:::image type="content" source="media/advanced-cards/add-adaptive-card.png" alt-text="Screenshot of a message node with an adaptive card.":::

An adaptive card is a fully customizable card that you can tailor to your needs. You can author adaptive cards by hand in JSON. If you prefer a drag-and-drop interface, you can use the [Adaptive Cards Designer](https://adaptivecards.io/designer/).

> [!IMPORTANT]
> Power Virtual Agents supports AdaptiveCard schema version 1.3 or lower.

1. On the authoring canvas, select the plus (**+**) icon. Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Adaptive card**.

1. Under **Edit JSON**, enter the JSON for your card.

    To open a larger view of the JSON editor, select the **Expand** icon.

    :::image type="content" source="media/advanced-cards/adaptive-card-expand.png" alt-text="Screenshot of an adaptive card with the Expand icon highlighted.":::

## Manage multiple cards in the same node

If you add more than one card to a node, two display options will appear in the node's menu when a card is selected:

- **Carousel** displays one card at a time.
- **List** displays all cards in a vertical list.

:::image type="content" source="media/advanced-cards/card-display.png" alt-text="Screenshot of image cards in carousel view and list view.":::

To remove a card from a node, select the **Delete** icon at the upper-right corner of the card.

:::image type="content" source="media/advanced-cards/delete-card.png" alt-text="Screenshot of an image card with the Delete icon highlighted.":::
