---
ROBOTS: NOINDEX,NOFOLLOW
title: Send a message
description: Use the Message node to send a message from the bot to a user.
keywords: "PVA"
ms.date: 09/05/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: gapretty
manager: shellyha
ms.custom: authoring, topics, message, question
ms.collection: virtual-agent
---

# Send a message

The **Message** node is used when you want to send a message from the bot to the user. Messages are usually simple text message, but can also include richer components, such as images, videos, quick replies and cards.

> [!TIP]
> All the capabilities of the Message node are also available on the [Question node](authoring-question-node.md), to allow you to author the message used to prompt the user for information.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Sending a text message

1. To specify a response from the bot, select **+** to add a node, and then select **Send a message** to add a new **Message** node.

1. Enter what you want the bot to say in the text box.

    You can apply some basic formatting, such as bold, italics, and numbering. You can also [use variables](authoring-variables.md) that you defined elsewhere in your bot conversation.

You can, optionally, add additional variations for your message text. When you do this, the bot will respond randomly with one of the variations each time the message is sent.

1. Select **Add** and then select **Message variation** to add a text box for a message variation.

    :::image type="content" source="media/authoring-message-node/message-node-variation.png" alt-text="Select the synonyms icon." border="false":::

## Add a Basic card to a message

:::image type="content" source="media/authoring-message-node/add-basic-card.png" alt-text="Screenshot of a message node with a basic card.":::

A basic card is a general-purpose card that you can use in various situations to add text, images, and interactive elements to bot responses.

1. On the authoring canvas, select the plus (**+**) icon. Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Basic card**.

1. In the properties pane, fill in one or more of the available properties for the content of your card. 

You can also, optionally, add one or more buttons, which have the same properties as Quick Replies (see [add Quick Replies](#adding-quick-replies)).

## Add an Image

:::image type="content" source="media/authoring-message-node/add-image-card.png" alt-text="Screenshot of a message node with an image card.":::

You can add an image to a message, which will be shown on a card.

1. On the authoring canvas, select the plus (**+**) icon. Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Image**.

1. Under **Image URL**, enter the URL of your image.

1. Optionally, enter a **Title** for the image.

## Add a video

:::image type="content" source="media/authoring-message-node/add-video-card.png" alt-text="Screenshot of a message node with a video card.":::

You can add a video to a message, which will be shown on a card.

1. On the authoring canvas, select the plus (**+**) icon. Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Video**.

1. In the **Media** property, enter the URL of your video, which can either be a direct link to a publicly accessible MP4 file, or a YouTube URL.

2. Optionally enter a **Title**, **Subtitle**, **Image** (URL for a publicly accessible image file) or **Text** to be shown alongside the video on the card. You can also, optionally, add one or more buttons, which have the same properties as Quick Replies (see [use adding Quick Replies to a message](#adding-quick-replies)).

## Add an Adaptive card

:::image type="content" source="media/authoring-message-node/add-adaptive-card.png" alt-text="Screenshot of a message node with an adaptive card.":::

[Adaptive Cards](https://adaptivecards.io) are platform-agnostic cards, authored in JSON, you can tailor to your needs. You can design Adaptive Cards using the [Adaptive Cards Designer](https://adaptivecards.io/designer/), or you can manually create the JSON, adhering to the Adaptive Card schema.

> [!IMPORTANT]
> Power Virtual Agents supports AdaptiveCard schema version 1.3 or lower.

1. On the authoring canvas, select the plus (**+**) icon. Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Adaptive card**.

1. Under **Edit JSON**, enter the JSON for your card.

    To open a larger view of the JSON editor, select the **Expand** icon.

    :::image type="content" source="media/authoring-message-node/adaptive-card-expand.png" alt-text="Screenshot of an adaptive card with the Expand icon highlighted.":::

## Manage multiple images, videos or cards in the same node

If you add more than one card to a node, two display options will appear in the node's menu when a card is selected:

- **Carousel** displays one card at a time.
- **List** displays all cards in a vertical list.

:::image type="content" source="media/authoring-message-node/card-display.png" alt-text="Screenshot of image cards in carousel view and list view.":::

To remove an images / video / card from a node, select the **Delete** icon at the upper-right corner of the item.

:::image type="content" source="media/authoring-message-node/delete-card.png" alt-text="Screenshot of an image card with the Delete icon highlighted.":::

## Adding Quick replies

Quick replies can be added to a message to provide suggested responses or actions for a user, which they can choose to use, or ignore. To enforce a choice from a finite list, use a multiple choice [question node](authoring-question-node.md).

To add a quick reply, 

1. Select **Add**, then **Quick reply**. 
 
1. In the **Quick replies** box that appears on the node, enter the text for the quick reply and hit enter.

:::image type="content" source="media/authoring-message-node/add-quick-reply.png" alt-text="Add quick replies to a question node" border="false":::

By default, when used by a user, quick replies will send a message back to the bot, with the quick reply text shown in the chat history as if the user had typed the message themselves. 

The quick reply buttons are removed from the chat history when the bot or user sends another activity.

Quick replies can also be configured to carry out one of the following actions when used.

- Open a URL
- Make a call
- Send a hidden message to the bot

To change the behavior of a quick reply.

1. After adding at least one quick reply, select the **Quick replies** list on the node.

1. In the right hand properties pane, you can see further details for each quick reply. 

1. Change the **Type** dropdown to choose the action for the quick reply. When you change the **Type**, the mandatory and optional properties (some less used properites will be found under **Advanced options**) for that type of quick reply will be shown, which you can fill in to complete the configuration of your quick reply.

> [!TIP]
> Some user clients do not support quick replies, in which case the client may not render them. Some user clients have an upper limit on the number of quick replies that they allow.

## Add a speech message override

By default, on channels which are speech enabled, such as Omnichannel, the message text entered in the message node will be used for both text display and voice. However, you can provide a speech override for a message.

1. On the message you wish to set a speech override for, select **Text**, and then select **Speech** to view the speech response.

    :::image type="content" source="media/advanced-custom-speech-ssml/select-speech-mode-message.png" alt-text="Screenshot of a message node, with the Speech mode selection highlighted.":::

    The following message will show after you switch from text to speech.

    :::image type="content" source="media/advanced-custom-speech-ssml/variation-message.png" alt-text="Screenshot of the notice that appears when Speech mode is selected in a message node.":::

2. Select **+ Add**, and then select **Message variation**.

3. Enter what you want the bot to say. Add as many variations for the speech response as needed.

You can, optionally, add SSML to your message variations for a speech response, to control how the message is spoken.

### Use SSML to customize speech responses

In the message, select **SSML tags**, and then select the tags you want to add.

:::image type="content" source="media/advanced-custom-speech-ssml/ssml-tag-options.png" alt-text="Screenshot of SSML tags in a speech message.":::

The table below describes what each tag does:

| SSML tag | Description |
|---|---|
| Audio | Add prerecorded audio. |
| Break | Insert pauses or breaks between words. |
| Emphasis | Add levels of stress to words or phrases. |
| Prosody | Specify changes to pitch, contour, range, rate, and volume. |
|||

:::image type="content" source="media/advanced-custom-speech-ssml/ssml-tagged-speech.png" alt-text="Screenshot of a speech message with SSML tags added.":::

You can add multiple tags to a single speech variation. You can also add SSML tags that don't appear in the helper menu. [Learn more about SSML](/azure/cognitive-services/speech-service/speech-synthesis-markup).
