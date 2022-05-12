---
title: Customize speech responses with SSML
description: Define speech specific messages with SSML (Speech Synthesis Markup Language) to control how the message is spoken by the speech service
keywords: PVA, speech, ssml, voice
ms.date: 05/12/2022
ms.topic: article
author: emgrol
ms.author: v-eolshefski
manager: shellyha
ms.collection: virtual-agent
---

# Customize speech responses with SSML

SSML (Speech Synthesis Markup Language) lets you customize your bot's speech responses, and is one of the many ways Power Virtual Agents makes your bots sound natural. SSML is an XML-based markup language that allows bot makers to specify how input text is converted into synthesized speech. It can be used in bots that are connected to the [Telephony channel](publication-connect-bot-to-telephony.md).

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)
- [Telephony](publication-connect-bot-to-telephony.md)

## Create a speech message

Before customizing speech responses with SSML, you need to create a speech message in a topic.

1. Go to the authoring canvas of the topic you want to add a speech response to.

1. Add a node by selecting plus (**+**) icon on the line or branch between or after nodes. Then select **Send a message**.

    :::image type="content" source="media/advanced-custom-speech-ssml/node-send-message.png" alt-text="Send a message on the authoring canvas.":::

1. Select the **Speech** mode in the **Message** to change the response from text to speech.

    :::image type="content" source="media/advanced-custom-speech-ssml/select-speech-mode-message.png" alt-text="Select Speech mode for the message.":::

    The following message will show after you switch from text to speech.

    :::image type="content" source="media/advanced-custom-speech-ssml/variation-message.png" alt-text="Add speech response variation.":::

1. Select **+ Add** then **Message variation** to add speech response variations. Enter what you want the bot to say and add as many [message variations](authoring-create-edit-topics.md#message-variations) as needed.

You've created a speech message and can now add SSML to your message variations.

## Use SSML to customize speech responses

You can use SSML tags to customize your speech responses.

Select **SSML tags** from the Message. Then select the tags you want to add.

:::image type="content" source="media/advanced-custom-speech-ssml/ssml-tag-options.png" alt-text="SSML helper options.":::

The table below describes what each tag does:

| SSML tag | Description |
|---|---|
| Audio | Add prerecorded audio. |
| Break | Insert pauses or breaks between words. |
| Emphasis | Increase the level of stress with which the contained text is spoken. |
| Prosody | Specify changes to pitch, contour, range, rate, and volume. |
|||

You can add multiple tags to a single speech variation, as well as other SSML tags not shown above. For more information about SSML, see [Improve synthesis with SSML](/azure/cognitive-services/speech-service/speech-synthesis-markup).
