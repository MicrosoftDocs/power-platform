---
# FIXME: set metadata
title: ""
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

<!-- FIXME: confirm UI labels? -->

# Add cards to bot responses

<!-- FIXME: blurb about cards -->

## Basic Card

<!-- FIXME: blurb about when to use basic cards -->

<!-- FIXME: update with real screenshot -->
:::image type="content" source="media/advanced-cards/add-basic-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

<!-- FIXME: can cards be added to other nodes? -->
1. On the authoring canvas, select the plus (**+**) icon. Then select **Show a message** to add a new **Message** node.

1. Select the **Message** node. Then select **Add** and choose **Basic Card**.

    <!-- FIXME: what fields are required? -->
1. In the properties pane, populate the fields.
    <!-- FIXME: do the fields need more explanation for each? -->

1. Check the preview on the authoring canvas to view your changes in real-time.

## Image Card

<!-- FIXME: blurb about when to use image cards -->

<!-- FIXME: update with real screenshot -->
:::image type="content" source="media/advanced-cards/add-image-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. On the authoring canvas, select the plus (**+**) icon. Then select **Show a message** to add a new **Message** node.

1. Select the **Message** node. Then select **Add** and choose **Image**.

1. For **Image URL**, enter the URL for your image.

    <!-- FIXME: is alt text here set the browser defined image alt text? Or does this set something in the bot itself? -->
1. Optionally, for **Alt text**, specify the alt text you wish to show.

1. Check the preview on the authoring canvas to view your changes in real-time.

## Video Card

<!-- FIXME: blurb about when to use video cards -->

<!-- FIXME: update with real screenshot -->
:::image type="content" source="media/advanced-cards/add-video-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. On the authoring canvas, select the plus (**+**) icon. Then select **Show a message** to add a new **Message** node.

1. Select the **Message** node. Then select **Add** and choose **Video**.

1. For **Video URL**, enter the URL for the your video.

1. Optionally specifiy additional properties:

    - **Video thumbnail URL**: specify the URL of the image you wish to show on the card.
      <!-- FIXME: what image is shown if this field isn't set? -->

    <!-- FIXME: is alt text here set the browser defined image alt text? Or does this set something in the bot itself? -->
    - **Alt text**: specify the alt text you wish to show.

1. Check the preview on the authoring canvas to view your changes in real-time.

## Adaptive Card

<!-- FIXME: blurb about when to use adaptive cards -->

You can use the [Adaptive Cards Designer](https://adaptivecards.io/designer/) to create a card design in a drag-and-drop interface.

> [!IMPORTANT]
> Power Virtual Agents only supports Adaptive Cards schema version 1.3 or lower.

<!-- FIXME: update with real screenshot -->
:::image type="content" source="media/advanced-cards/add-adaptive-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. On the authoring canvas, select the plus (**+**) icon. Then select **Show a message** to add a new **Message** node.

1. Select the **Message** node. Then select **Add** and choose **Adaptive Card**.

1. For **Edit JSON**, enter the JSON for your Adaptive Card. You can open an expanded view of the JSON editor by clicking the **Expand** button.
   <!-- FIXME: what does the expand button look like? -->

1. Check the preview on the authoring canvas to view your changes in real-time.

## Adding multiple cards
<!-- FIXME: how does the card carousel work? -->