---
title: Send a message (Preview)
description: Use the Message node to send a message from the bot to a user in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 10/10/2022

ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: gapretty
manager: shellyha
ms.custom: authoring, topics, message, question
ms.collection: virtual-agent
---

# Send a message (Preview)

The Message node is used when you want to send a message from the bot to the user. Messages are usually simple text messages, but can also include richer components, such as images, videos, quick replies, and cards.

> [!TIP]
> All capabilities of the Message node are also available to the [Question node](authoring-ask-a-question.md).

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md).

## Send a text message

1. Select **Add node** (**+**), then select **Send a message** to add a new **Message** node.

1. Enter what you want the bot to say in the text box.

    :::image type="content" source="media/authoring-send-message/message-node.png" alt-text="Screenshot of the Message node.":::

1. Optionally, using the options in the node's menu bar, you can:

    - Apply basic formatting, such as bold, italics, and numbering.
    - [Use variables](authoring-variables.md) that you defined elsewhere in your bot conversation.
    - [Add message variations](#use-message-variations).

## Use message variations

When you add message variations, the bot will randomly pick one of the variations to use each time the node is triggered.

### Add a message variation

1. Select **Add**, then select **Message variation** to add a text box for a message variation.

    :::image type="content" source="media/authoring-send-message/add-variation.png" alt-text="Screenshot of the add Message Variation option.":::

1. Enter what you want the bot to say.

    :::image type="content" source="media/authoring-send-message/message-node-variation.png" alt-text="Screenshot of a message variation added to a message node.":::

1. Repeat above steps to add as many variations as you like.

### Remove a message variation

Select **Remove variation**.

:::image type="content" source="media/authoring-send-message/remove-variation.png" alt-text="Screenshot of the remove variation button.":::

## Add a Basic card to a message

:::image type="content" source="media/authoring-send-message/add-basic-card.png" alt-text="Screenshot of a message node with a basic card.":::

A basic card is a general-purpose card that you can use in various situations to add text, images, and interactive elements to bot responses.

1. On the authoring canvas, select **Add node** (**+**). Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Basic card**.

1. In the properties pane, fill in one or more of the available properties for the content of your card.

You can also, optionally, add one or more buttons, which have the same properties as [Quick Replies](#use-quick-replies).

## Add an Image

:::image type="content" source="media/authoring-send-message/add-image-card.png" alt-text="Screenshot of a message node with an image card.":::

You can add an image to a message, which will be shown on a card.

1. On the authoring canvas, select **Add node** (**+**). Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Image**.

1. Under **Image**, enter the URL of your image.

1. Optionally, enter a **Title** for the image.

## Add a video

:::image type="content" source="media/authoring-send-message/add-video-card.png" alt-text="Screenshot of a message node with a video card.":::

You can add a video to a message, which will be shown on a card.

1. On the authoring canvas, select **Add node** (**+**). Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Video**.

1. In the **Media** property, enter the URL of your video, which can either be a direct link to a publicly accessible MP4 file, or a YouTube URL.

1. Optionally enter a **Title**, **Subtitle**, **Image** (URL for a publicly accessible image file) or **Text** to be shown alongside the video on the card. You can also, optionally, add one or more buttons, which have the same properties as [Quick Replies](#use-quick-replies).

## Add an Adaptive card

:::image type="content" source="media/authoring-send-message/add-adaptive-card.png" alt-text="Screenshot of a message node with an adaptive card.":::

[Adaptive Cards](https://adaptivecards.io) are platform-agnostic cards that you can tailor to your needs. You can design Adaptive Cards using the [Adaptive Cards Designer](https://adaptivecards.io/designer/), or author the JSON by hand.

> [!IMPORTANT]
> Power Virtual Agents supports AdaptiveCard schema version 1.3 or lower.

1. On the authoring canvas, select **Add node** (**+**). Then select **Send a message** to add a message node.

1. Select **Add**, and then select **Adaptive card**.

1. Under **Edit JSON**, enter the JSON for your card.

    To open a larger view of the JSON editor, select the **Expand** icon.

    :::image type="content" source="media/authoring-send-message/adaptive-card-expand.png" alt-text="Screenshot of an adaptive card with the Expand icon highlighted.":::

## Manage multiple cards in the same node

If you add two or more cards to a node, two display options will appear in the node's menu when a card is selected:

- **Carousel** displays one card at a time.
- **List** displays all cards in a vertical list.

:::image type="content" source="media/authoring-send-message/card-display.png" alt-text="Screenshot of image cards in carousel view and list view.":::

To remove a card from a node, select the **Delete** icon at the upper-right corner of the item.

:::image type="content" source="media/authoring-send-message/delete-card.png" alt-text="Screenshot of an image card with the Delete icon highlighted.":::

## Use quick replies

> [!IMPORTANT]
> Not all channels support quick replies, in which case the user may not be able to interact them.
>
> Additionally, some channels have a limit on the number of quick replies that can be shown at once.

Quick replies can be added to a message to provide suggested responses or actions for a user, which they can choose to use, or ignore.

When a quick reply is selected by a user, it will send a message back to the bot. The quick reply text is shown in the chat history as if the user had typed the message themselves.

The quick reply buttons are removed from the chat history when the bot or user sends another activity.

Interacting with quick replies are optional. If you want to require a user to choose an option from a list, use a multiple choice [question node](authoring-ask-a-question.md) instead.

### Add a quick reply

1. Select **Add**, then **Quick reply**.

    :::image type="content" source="media/authoring-send-message/add-quick-reply.png" alt-text="Screenshot of the add a quick reply option.":::

1. In the **Quick replies** box that appears on the node, enter the text for the quick reply and hit enter.

    :::image type="content" source="media/authoring-send-message/quick-reply.png" alt-text="Screenshot of quick replies added to a message node.":::

### Change quick reply type

Quick replies can also be configured to carry out other types of actions. To change the action of a quick reply:

1. Select the quick reply box to open the **Quick Replies properties** pane.

    :::image type="content" source="media/authoring-send-message/open-quick-reply-properties.png" alt-text="Screenshot of Quick Reply box highlighted.":::

1. In the **Quick replies properties** pane, you can see further details for each quick reply.

    :::image type="content" source="media/authoring-send-message/quick-reply-properties.png" alt-text="Screenshot of quick reply properties pane.":::

1. Choose a value for **Type**:

    - **Send a message** (default): Send a message to the bot, and show it in the chat history.
    - **Open a URL**: Open a URL. The URL must start with `https://`.
    - **Make a call**: Call a phone number. Must be in the format `tel:1234567890`.
    - **Send a hidden message to the bot**: Send a message to the bot, but hide it from the chat history.

The properties shown will change based on the type of quick reply you have selected. Additional options can be found under **Advanced options**.

## Add a speech message override

By default on voice-enabled channels, such as Omnichannel, the message text entered in the message node will be used for both text display and voice. However, you can provide a speech override for a message.

1. On the message you wish to set a speech override for, select **Text**, and then select **Speech** to view the speech response.

    :::image type="content" source="media/authoring-send-message/select-speech-mode-message.png" alt-text="Screenshot of a message node, with the Speech mode selection highlighted.":::

    The following message will show after you switch from text to speech.

    :::image type="content" source="media/authoring-send-message/variation-message.png" alt-text="Screenshot of the notice that appears when Speech mode is selected in a message node.":::

1. Select **+ Add**, and then select **Message variation**.

1. Enter what you want the bot to say. Add as many variations for the speech response as needed.

1. Optionally, [add SSML to your message variations](#use-ssml-to-customize-speech-responses) for a speech response to control how the message is spoken.

### Use SSML to customize speech responses

:::image type="content" source="media/authoring-send-message/ssml-tagged-speech.png" alt-text="Screenshot of a speech message with SSML tags added.":::

Speech Synthesis Markup Language (SSML) is an XML-based markup language that specifies how text is converted into synthesized speech. It's one of the many ways Power Virtual Agents makes your bot's responses sound like natural speech.

In the message, select **SSML tags**, and then select the tags you want to add. You can add multiple tags to a single speech variation.

:::image type="content" source="media/authoring-send-message/ssml-tag-options.png" alt-text="Screenshot of SSML tags in a speech message.":::

The table below describes what each tag does:

| SSML tag | Description                                                 |
| -------- | ----------------------------------------------------------- |
| Audio    | Add prerecorded audio.                                      |
| Break    | Insert pauses or breaks between words.                      |
| Emphasis | Add levels of stress to words or phrases.                   |
| Prosody  | Specify changes to pitch, contour, range, rate, and volume. |

> [!TIP]
> You can also manually enter SSML tags that don't appear in the helper menu. To learn more about other available tags, see [Improve synthesis with Speech Synthesis Markup Language](/azure/cognitive-services/speech-service/speech-synthesis-markup).
