---
# FIXME: set metadata
title: "Add multimedia cards to messages"
description: ""
keywords: "PVA"
ms.date: 04/05/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: gapretty
manager: shellyha
ms.custom: authoring, topics, variables, ceX
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

<!-- FIXME: scenario for each card? -->

# Add cards to bot responses

<!-- FIXME: blurb about cards -->
<!-- FIXME: cards be added to message and question nodes -->

## Basic Card

<!-- FIXME: blurb about when to use basic cards -->

:::image type="content" source="media/advanced-cards/add-basic-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. On the authoring canvas, select the plus (**+**) icon. Then select **Show a message** to add a new **Message** node.

1. Select the **Message** node. Then select **Add** and choose **Basic Card**.

1. In the properties pane, populate the fields.

1. Check the preview on the authoring canvas to view your changes in real-time.

## Image Card

<!-- FIXME: blurb about when to use image cards -->

:::image type="content" source="media/advanced-cards/add-image-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. On the authoring canvas, select the plus (**+**) icon. Then select **Show a message** to add a new **Message** node.

1. Select the **Message** node. Then select **Add** and choose **Image**.

1. Optionally, enter a **Title** for your card.

1. For **Image URL**, enter the URL for your image.

1. Check the preview on the authoring canvas to view your changes in real-time.

## Video Card

<!-- FIXME: blurb about when to use video cards -->

:::image type="content" source="media/advanced-cards/add-video-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. On the authoring canvas, select the plus (**+**) icon. Then select **Show a message** to add a new **Message** node.

1. Select the **Message** node. Then select **Add** and choose **Video**.

1. For **Video URL**, enter the URL for the your video.

1. Optionally specify additional properties.

1. Check the preview on the authoring canvas to view your changes in real-time.

## Adaptive Card

<!-- FIXME: blurb about when to use adaptive cards -->

You can use the [Adaptive Cards Designer](https://adaptivecards.io/designer/) to create a card design in a drag-and-drop interface.

> [!IMPORTANT]
> Power Virtual Agents only supports Adaptive Cards schema version 1.3 or lower.

:::image type="content" source="media/advanced-cards/add-adaptive-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. On the authoring canvas, select the plus (**+**) icon. Then select **Show a message** to add a new **Message** node.

1. Select the **Message** node. Then select **Add** and choose **Adaptive Card**.

1. For **Edit JSON**, enter the JSON for your Adaptive Card. You can open an expanded view of the JSON editor by clicking the **Expand** button.

1. Check the preview on the authoring canvas to view your changes in real-time.

## Manage multiple cards in the same node

If you add more than one card to a node, two display options will appear in the node's menu when a card is selected:

- **Carousel** displays one card at a time.
- **List** displays all cards in a vertical list.

:::image type="content" source="media/advanced-cards/card-display.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

You can remove cards from a node by selecting the **Delete** button in the corner of the card.

:::image type="content" source="media/advanced-cards/delete-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::
