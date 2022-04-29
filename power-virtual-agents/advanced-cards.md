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

# Add cards to bot responses

Cards add rich multimedia responses to **Question** and **Message** nodes. With cards, you can go beyond basic text replies by adding images, videos, and interactive elements.

There are several types of cards that provide different experiences to users. All types allow you to preview them on the authoring canvas in real-time.

## Prerequisites

- [!INCLUDE [Medical and emergency usage](includes/pva-usage-limitations.md)]
- [Create and edit topics](authoring-create-edit-topics.md)
- [Use variables](authoring-variables.md)

## Basic Card

:::image type="content" source="media/advanced-cards/add-basic-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

**Basic cards** can be used in a variety of situations to add text, images, and interactive elements to bot responses. In this example, we'll use a basic card to show the user an image of the product and a button to make a purchase.

1. Create a new topic and add the trigger phrase `buy an apple`.

1. Add a new **Message** node and enter the response `We currently have this apple in stock.`

1. In the node menu, select **Add** and then select **Basic card**.

1. In the **Basic Card** pane, set the following properties:
    - **Title**: `apple`
    - **Image**: `www.example.com/apple.jpg`

1. Under **Buttons**, select **Add new** and then set the following properties:
    - **Title**: `Purchase`
    - **Type**: Choose **Open a URL**
    - **Image**: `www.example.com/purchase-apple.html`

:::image type="content" source="media/advanced-cards/basic-card-example.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

## Image Card

<!-- FIXME: scenario, show picture of city -->

:::image type="content" source="media/advanced-cards/add-image-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

Use **Image cards** to quickly show an image to a user. In this example, we'll show the user images of a city they want to travel to.

1. Create a new topic and add the trigger phrase `show me san francisco`.

1. Add a new **Message** node and enter the response `Here are some photos of San Francisco.`

1. In the node menu, select **Add** and then select **Image card**. Do this two more times so that you have a total of three image cards.

1. Select each card, and in the **Image Card** pane, set the following properties:
    - Card 1:
        - **Title**: `Golden Gate Bridge`
        - **Image**: `www.example.com/golden-gate-bridge.jpg`
    - Card 2:
        - **Title**: `Cable Cars`
        - **Image**: `www.example.com/cable-cards.jpg`
    - Card 3
        - **Title**: `Painted Ladies`
        - **Image**: `www.example.com/painted-ladies.jpg`

:::image type="content" source="media/advanced-cards/image-card-example.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

## Video Card

<!-- FIXME: scenario, show training video -->

:::image type="content" source="media/advanced-cards/add-video-card.png" alt-text="Four lesson topics and a number of system topics are in the Topics list.":::

1. On the authoring canvas, select the plus (**+**) icon. Then select **Show a message** to add a new **Message** node.

1. Select the **Message** node. Then select **Add** and choose **Video**.

1. For **Video URL**, enter the URL for the your video.

1. Optionally specify additional properties.

1. Check the preview on the authoring canvas to view your changes in real-time.

## Adaptive Card

<!-- FIXME: scenario, reservation tool -->

Use the [Adaptive Cards Designer](https://adaptivecards.io/designer/) to create a card design in a drag-and-drop interface.

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
