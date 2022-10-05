---
ROBOTS: NOINDEX,NOFOLLOW
title: Customize speech responses with SSML
description: Use Speech Synthesis Markup Language (SSML) in speech-specific responses to control how your bot speaks a message.
keywords: PVA, speech, ssml, voice
ms.date: 05/31/2022
ms.topic: article
author: emgrol
ms.author: v-eolshefski
manager: shellyha
ms.collection: virtual-agent
---

# Customize speech responses with SSML

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

Speech Synthesis Markup Language (SSML) is an XML-based markup language that specifies how text is converted into synthesized speech. It's one of the many ways Power Virtual Agents makes your bot's responses sound like natural speech. You can use SSML in bots that are connected to the [Telephony channel](publication-connect-bot-to-telephony.md).

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)
- [Connect your bot to the Telephony channel](publication-connect-bot-to-telephony.md)

## Create a speech message

1. Go to the authoring canvas of the topic you want to add a speech response to.

1. Select the plus (**+**) icon, and then select **Send a message** to add a message node.

1. Select **Text**, and then select **Speech** to change the response mode from text to speech.

    :::image type="content" source="media/advanced-custom-speech-ssml/select-speech-mode-message.png" alt-text="Screenshot of a message node, with the Speech mode selection highlighted.":::

    The following message will show after you switch from text to speech.

    :::image type="content" source="media/advanced-custom-speech-ssml/variation-message.png" alt-text="Screenshot of the notice that appears when Speech mode is selected in a message node.":::

1. Select **+ Add**, and then select **Message variation**.

1. Enter what you want the bot to say. Add as many [message variations](authoring-create-edit-topics.md#message-variations) as needed.

Now that you've created a speech message, you can add SSML to your message variations.

## Use SSML to customize speech responses

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
