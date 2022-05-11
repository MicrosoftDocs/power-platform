---
title: "Technology preview quickstart"
description: "Discover the new features introduced in the technology preview at Build."
ms.date: 05/10/2022
ms.topic: article
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.collection: virtual-agent
---

# Quick start

This quickstart walks you through making a bot that uses new features and improvements introduced in the technology preview at Build. We'll be creating a simple bot that helps users make a reservation at a fictional restaurant.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Create a bot

Power Virtual Agents now has an app-level home page that is not specific to any bot. On this page you can create a new bot and view a list of bots that you've previously created.

:::image type="content" source="media/build-2022-quickstart/new-bot1.png" alt-text="Screenshot of the app-level home page.":::

> [!TIP]
> To navigate back to the home page from a bot, select **Power Virtual Agents** in the top menu bar.
>
> :::image type="content" source="media/build-2022-quickstart/go-home.png" alt-text="Screenshot of Power Virtual Agents top menu bar.":::

1. In the side navigation select **Create**, or select **Home** and select **Create a bot**.

1. Name the bot `Reservation Bot` and select **Create**.

:::image type="content" source="media/build-2022-quickstart/new-bot2.png" alt-text="Screenshot of the create a chatbot dialog.":::

> [!IMPORTANT]
> Bots can only be created in English in the technology preview.

## Customize greeting topic

1. In the side navigation, select **Topics**. Then select the **Greeting** topic.

1. Delete all existing **Message** nodes.

1. Add a **Message** node. Then add the following greetings as [message variations](authoring-create-edit-topics.md#message-variations):
    - `Good day!`
    - `Hi there!`
    - `Hi!`

1. [Add an image card](advanced-cards.md#image-card) and provide an image of the restaurant. Providing an image helps the user visually confirm that they're booking at the correct location.

1. Add a second **Message** node and add the message `We're open 9am to 5pm Monday through Friday. Please note we will be closed on May 27th.`

1. Change the edit mode to **Speech**.

   The speech mode allows you to add a specific message for voice-enabled channels and enable the use of [SSML tags](advanced-custom-speech-ssml.md).

    :::image type="content" source="media/build-2022-quickstart/message-speech-mode.png" alt-text="Screenshot of speech mode toggle.":::

1. Add the message `We're open 9am to 5pm Monday through Friday. <emphasis level="strong">Please note</emphasis><break strength="medium" /> we will be closed on May 27th.`

   When the message is spoken by the bot over a phone call, it will put emphasis on "Please note" and pause for a moment before continuing.

1. Add a third **Message** node and add the message `If you'd like, I can help you make a reservation.` to provide a call to action for the user.

1. Add a [quick reply](authoring-create-edit-topics.md#quick-replies) with the message `make a reservation`.

   Adding a quick reply gives the user the option to select "make a reservation" instead of having to type it out.

   :::image type="content" source="media/build-2022-quickstart/quick-reply.png" alt-text="Screenshot of the reservation quick reply.":::

1. Select **Save**.

## Add a reservation topic

1. In the side navigation, select **Topics** and then **New topic**.

1. Add the following trigger phrases:
    - `make a reservation`
    - `reserve a time`

1. Add a **Question** node and enter the message `What is the desired time and date of your reservation?`

1. For **Identify** choose **Date and time**. This [entity](advanced-entities-slot-filling.md) enables your bot to extract a date and time from the user's response.

1. For **Save response as** [create a new variable](authoring-variables.md) named `reservationDateTime`.

1. [Add a **ConditionItem** node](authoring-create-edit-topics.md#add-a-condition) and [change it to a formula](advanced-power-fx.md#use-power-fx-as-a-condition).

1. Enter the [Power Fx formula](advanced-power-fx.md) `DateDiff(Topic.reservationDateTime, Date(2022,5,27)) = 0`. This formula will evaluate to true if the date the user provided is May 5th 2022.

    :::image type="content" source="media/build-2022-quickstart/condition-formula.png" alt-text="Screenshot of Power Fx formula in a condition node.":::

1. Under the **ConditionItem** node add a **Message** node. This node will remind the user that the restaurant is closed on May 5th. Enter the message `Sorry, but we're closed on May 27th. Please make a reservation on another day.`

1. Under the **All Other Conditions** node, add a **Message** node. This node will provide a confirmation of the user's reservation. Enter the message `Your reservation has been made for {Topic.reservationDateTime}. We look forward to seeing you!`.

    :::image type="content" source="media/build-2022-quickstart/variable-reference.png" alt-text="Screenshot of variable in message node.":::

   When the bot responds with this message, the variable reference `{Topic.reservationDateTime}` will be replaced with with the value of the variable.

    :::image type="content" source="media/build-2022-quickstart/variable-replaced.png" alt-text="Screenshot of the variable's value shown in a message.":::

1. Add an **Redirect** node where the two condition branches meet and choose the **End of conversation** topic.

1. Name the topic `Make a reservation` and select **Save**.

## Next steps

1. To allows users to call your bot, you need to [enable and configure the Telephony channel](publication-connect-bot-to-telephony.md).

1. Optionally, [customize your bot's voice font](advanced-speech-settings.md).

1. [Publish your bot](publication-fundamentals-publish-channels.md).

1. Test your bot using the [demo website](publication-connect-bot-to-web-channels.md), or by calling the phone number configured in Telephony.
