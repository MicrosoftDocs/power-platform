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

# Add cards to bot responses

<!-- FIXME: blurb about cards -->

## Basic Card

:::image type="content" source="media/advanced-cards/add-basic-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. Use the 'Add' button on the 'Send a Message' node and choose 'Basic Card'.

1. Populate one or more of the available fields.

1. Confirm the live preview updates.

1. Save your topic and test in the chat canvas to confirm your card is shown correctly.

## Image Card

:::image type="content" source="media/advanced-cards/add-image-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. Use the 'Add' button on the 'Send a Message' node and choose 'Image'.

1. Enter the URL for the image (required) in the URL input box and, optionally, specify some alt text.

1. Check that the live preview of the image is shown on the node.

## Video Card

:::image type="content" source="media/advanced-cards/add-video-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. Use the 'Add' button on the 'Send a Message' node and choose 'Video'.

1. Enter the URL for the video in the Media input box - this can be a URL to an MP4 file or a YouTube video link.

1. Optionally enter a title / subtitle / text for your video card.
Check that the live preview of the video card is shown on the node.

## Adaptive Card

:::image type="content" source="media/advanced-cards/add-adaptive-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. Use the 'Add' button on the 'Send a Message' node and choose 'Adaptive Card'.

1. In another tab / window design an Adaptive Card at AdaptiveCards.io and then paste the JSON in to the canvas in the property pane. (Note: only version 1.3 or lower supported)

1. Try opening the expanded modal editing window when editing your JSON.

1. Confirm the live preview updates.

1. Save your topic and test in the chat canvas to confirm your card is shown correctly.

> [!IMPORTANT]
> The ability to insert a variable reference into a card will come in a future release.
