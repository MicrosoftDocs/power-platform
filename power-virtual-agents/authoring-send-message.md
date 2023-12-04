---
title: Send a message (preview)
description: Use the Message node to send a message from the bot to a user in Microsoft Copilot Studio preview.
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.reviewer: gapretty
manager: leeclontz
ms.custom: authoring, topics, message, question, bap-template
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Send a message

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

The **Message** node sends a message from the bot to the user. Messages are usually simple text messages, but can also include richer components, such as images, videos, quick replies, and cards.

> [!TIP]
> All capabilities of the **Message** node are also available to the **Question** node.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Send a text message

1. Select **Add node** (**+**), and then select **Send a message**.

1. In the text box, enter the message you want the bot to send.

1. Optionally, use the tools in the node's menu bar to add basic formatting, [variables](authoring-variables.md), and [message variations](#use-message-variations).

    :::image type="content" source="media/authoring-send-message/message-node.png" alt-text="Screenshot of a text Message node in the Microsoft Copilot Studio authoring canvas.":::

## Use message variations

When you add message variations, the bot randomly picks one of them to use each time the node is triggered.

### Add a message variation

1. In the node's menu bar, select **Add**, and then select **Message variation**.

1. Enter what you want the bot to say.

1. Repeat the above steps to add as many variations as you like.

    :::image type="content" source="media/authoring-send-message/add-variation.png" alt-text="Screenshot of a message with three variations, with the Add button highlighted.":::

### Remove a message variation

1. Select a **Message** node with a variation.

1. Select the trashcan icon (**Remove variation**).

    :::image type="content" source="media/authoring-send-message/remove-variation.png" alt-text="Screenshot of the Remove variation button.":::

## Add an image

1. [Add a **Message** node](#send-a-text-message).

1. In the node's menu bar, select **Add**, and then select **Image**.

1. Under **Image**, enter the URL of your image.

1. Optionally, enter a **Title** for the image.

    :::image type="content" source="media/authoring-send-message/add-image-card.png" alt-text="Screenshot of a Message node with an image card.":::

## Add a video

1. [Add a **Message** node](#send-a-text-message).

1. In the node's menu bar, select **Add**, and then select **Video**.

1. Under **Media**, enter the URL of your video. The URL can either be a direct link to a publicly accessible MP4 file or a YouTube URL.

1. Optionally, enter a **Title**, **Subtitle**, **Image** (the URL of a publicly accessible image file), or **Text** to be shown alongside the video on the card. You can also add one or more buttons, which have the same properties as [quick replies](#use-quick-replies).

    :::image type="content" source="media/authoring-send-message/add-video-card.png" alt-text="Screenshot of a Message node with a video card.":::

## Add a basic card

A basic card is a general-purpose card that you can use to add text, images, and interactive elements to bot responses.

1. [Add a **Message** node](#send-a-text-message).

1. In the node's menu bar, select **Add**, and then select **Basic card**.

1. In the properties pane, fill in the properties for the content of your card. You can also add one or more buttons, which have the same properties as [quick replies](#use-quick-replies).

    :::image type="content" source="media/authoring-send-message/add-basic-card.png" alt-text="Screenshot of a Message node with a basic card.":::

## Add an Adaptive Card

[Adaptive Cards](https://adaptivecards.io) are platform-agnostic cards that you can tailor to your needs. You can design Adaptive Cards using the [Adaptive Cards Designer](https://adaptivecards.io/designer/) or author the JSON directly.

> [!IMPORTANT]
> Microsoft Copilot Studio supports AdaptiveCard schema version 1.3 or lower.

1. [Add a **Message** node](#send-a-text-message).

1. In the node's menu bar, select **Add**, and then select **Adaptive card**.

1. Under **Edit JSON**, enter the JSON for your card.

    To open a larger view of the JSON editor, select the **Expand** icon.

    :::image type="content" source="media/authoring-send-message/add-adaptive-card.png" alt-text="Screenshot of a Message node with an Adaptive Card, with the Expand icon highlighted.":::

## View multiple cards in the same node and remove a card

If you add two or more cards to a node, two display options appear in the node menu of a selected card:

- **Carousel** displays one card at a time.
- **List** displays all cards in a vertical list.

:::image type="content" source="media/authoring-send-message/card-display.png" alt-text="Screenshot of image cards in carousel view and list view.":::

To remove a card from a node, select the trashcan icon (**Remove**) at the upper-right corner of the item.

:::image type="content" source="media/authoring-send-message/delete-card.png" alt-text="Screenshot of an image card with the Remove icon highlighted.":::

## Use quick replies

> [!IMPORTANT]
> Not all channels support quick replies, in which case the user may not be able to interact them.
>
> Additionally, some channels have a limit on the number of quick replies that can be shown at once.

Add quick replies to a message to provide suggested responses or actions for the user. If the user selects a quick reply, it sends a message back to the bot. The quick reply text is shown in the chat history as if the user had typed the message. The quick reply buttons are removed from the chat history when the bot or user sends another activity.

Users can choose to use a quick reply or ignore it. To require the user to choose an option from a list, use a multiple-choice **Question** node instead.

### Add a quick reply

1. [Add a **Message** node](#send-a-text-message).

1. In the node's menu bar, select **Add**, and then select **Quick reply**.

1. In the **Quick replies** box, enter the text for one or more quick replies and press Enter.

    :::image type="content" source="media/authoring-send-message/quick-reply.png" alt-text="Screenshot of quick replies added to a Message node.":::

### Change quick reply type

You can change the properties of quick replies to carry out other types of actions.

1. Select the **Quick replies** box or an individual quick reply to open the **Quick Replies properties** pane.

    :::image type="content" source="media/authoring-send-message/quick-reply-properties.png" alt-text="Screenshot of the Quick Replies properties pane.":::

1. Select a value for **Type**:

    - **Send a message** (default): Send a message to the bot and show it in the chat history.
    - **Open URL**: Open a URL. The URL must start with `https://`.
    - **Make a call**: Call a phone number. Your entry must be in the format `tel:1234567890`.
    - **Send a hidden message to the bot**: Send a message to the bot, but hide it from the chat history.

The properties that are shown change based on the type of quick reply you've selected. More options can be found under **Advanced options**.

## Add a speech message override

On voice-enabled channels such as Omnichannel for Customer Service, the message text is used for both text display and voice. However, you can override the text message with a different one for speech.

1. Select a **Message** node. In the upper-right corner, select **Text**, and then select **Speech**.

    :::image type="content" source="media/authoring-send-message/select-speech-mode-message.png" alt-text="Screenshot of a Message node, with the Speech mode selection highlighted.":::

1. [Add a message variation](#add-a-message-variation).

1. Enter what you want the bot to say. Add as many variations for the speech response as needed.

1. Optionally, [add SSML to your message variations](#use-ssml-to-customize-speech-responses) to control how the bot speaks the message.

### Use SSML to customize speech responses

Speech Synthesis Markup Language (SSML) is an XML-based markup language that specifies how text is converted into synthesized speech. It's one of the many ways Microsoft Copilot Studio makes your bot's responses sound like natural speech.

In the message, select **SSML tags**, and then select the tags you want to add. You can add multiple tags to a single speech variation.

:::image type="content" source="media/authoring-send-message/ssml-tag-options.png" alt-text="Screenshot of SSML tags in a speech message.":::

The following table describes what each tag does.

| SSML tag | Description                                                 |
| -------- | ----------------------------------------------------------- |
| Audio    | Add prerecorded audio.                                      |
| Break    | Insert pauses or breaks between words.                      |
| Emphasis | Add levels of stress to words or phrases.                   |
| Prosody  | Specify changes to pitch, contour, range, rate, and volume. |

:::image type="content" source="media/authoring-send-message/ssml-tagged-speech.png" alt-text="Screenshot of a speech message with SSML tags added.":::

> [!TIP]
> You can manually enter SSML tags that don't appear in the helper menu. To learn more about other tags you can use, see [Improve synthesis with Speech Synthesis Markup Language](/azure/cognitive-services/speech-service/speech-synthesis-markup).


[!INCLUDE[footer-include](includes/footer-banner.md)]
