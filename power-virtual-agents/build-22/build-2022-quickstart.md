---
ROBOTS: NOINDEX,NOFOLLOW
title: "Technology preview quick start"
description: "Discover the new features introduced in the technology preview at Build."
ms.date: 05/10/2022
ms.topic: article
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.collection: virtual-agent
---

# Quick start

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

This quick start walks you through making a bot that uses new features and improvements introduced in the technology preview at Build. We'll create a simple bot that helps users make a reservation at a fictional restaurant.

>
> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4XQgu]
>

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Create a bot

Power Virtual Agents now has an app-level home page that is not specific to any bot. You can create a new bot and view a list of bots you've previously created on this page.

:::image type="content" source="media/build-2022-quickstart/new-bot1.png" alt-text="Screenshot of the app-level home page.":::

> [!TIP]
> To navigate back to the home page from a bot, select **Power Virtual Agents** in the top menu bar.
>
> :::image type="content" source="media/build-2022-quickstart/go-home.png" alt-text="Screenshot of Power Virtual Agents top menu bar.":::

<!--Note from Sweeny: Since we are creating a reservation bot for a restaurant here, please add a lead in before the steps for more clarity. -->

1. In the side navigation, select **Create**, or select **Home** and select **Create a bot**.

1. Name the bot `Reservation Bot` and select **Create**.

:::image type="content" source="media/build-2022-quickstart/new-bot2.png" alt-text="Screenshot of the create a chatbot dialog.":::

> [!IMPORTANT]
> Bots can only be created in English in the technology preview.

## Customize the greeting topic

1. In the side navigation, select **Topics**an then select the **Greeting** topic.

1. Click on the **Delete** button in the elipsis menu and delete the existing **Message** node.

1. To add a new **Message** node, click on the **Send a message** option in the next node menu.  Type the following greetings as [message variations](authoring-create-edit-topics.md#message-variations):
    - `Good day!`
    - `Hi there!`
    - `Hi!`

1. Click on the **+Add** button and paste the Image URL in the **Image** box to [Add an image card](advanced-cards.md#image-card), . The image of the restaurant will help the user visually confirm that they're looking at the correct location.

    :::image type="content" source="media/build-2022-quickstart/image-card.png" alt-text="Screenshot of speech mode toggle.":::

1. Click on the next node, to add a second **Message** node, and type the message `We're open 9 am to 5 pm Monday through Friday, and 10 am through 8 pm on the weekends. Please note that reservations can only be made for the next 7 days.`

1. Change the edit mode to **Speech**.

   The speech mode allows you to add a specific message for voice-enabled channels and enable the use of [SSML tags](advanced-custom-speech-ssml.md).

    :::image type="content" source="media/build-2022-quickstart/message-speech-mode.png" alt-text="Screenshot of speech mode toggle.":::

1. Add the message `We're open 9am to 5pm Monday through Friday, and 10am through 8pm on the weekends. <emphasis level="strong">Please note</emphasis><break strength="medium" />, reservations can only be made for the next 7 days.`

   When the bot speaks the message over a phone call, it will emphasize on "Please note" and pause for a moment before continuing.

1. Add a third **Message** node and type the message `If you'd like, I can help you make a reservation.` to provide a call to action for the user.

1. Add a [quick reply](authoring-create-edit-topics.md#quick-replies) with the message `make a reservation`.

   A quick reply gives the user the option to select "make a reservation" instead of having to type it out.

   :::image type="content" source="media/build-2022-quickstart/quick-reply.png" alt-text="Screenshot of the reservation quick reply.":::

1. Click **Save**.

1. Click on the **Test** button to trigger the greeting.

## Add a reservation topic

1. In the side navigation, click on the **Topics** option and then **New topic**.

1. Rename the topic to Reservation

1. Add the following trigger phrases:
    - `Reserve a table`
    - `Make a reservation`

1. Add a **Question** node and enter the message `What is the desired time and date of your reservation?`

1. For **Identify**, choose **Date and time**. This [entity](advanced-entities-slot-filling.md) enables your bot to extract a date and time from the user's response.

1. For **Save response as**, [create a new variable](authoring-variables.md) named `reservationDateTime`.

1. [Add a **ConditionItem** node](authoring-create-edit-topics.md#add-a-condition) and [change it to a formula](advanced-power-fx.md#use-power-fx-as-a-condition).

1. Enter the [Power Fx formula](advanced-power-fx.md) `Topic.reservationDateTime < Today() || DateDiff(Today(), Topic.reservationDateTime) > 7`. This formula will evaluate to true if the date the user provided is in the past or more than 7 days away.

    :::image type="content" source="media/build-2022-quickstart/condition-formula.png" alt-text="Screenshot of Power Fx formula in a condition node.":::

1. Under the **ConditionItem** node, add a **Message** node. This message will remind the user that reservations can only be made in the next 7 days. Enter the message `Sorry, I can only make reservations for the next 7 days.`

1. Under the **All Other Conditions** node, add a **Message** node. This message will confirm the user's reservation.
    1. Enter `Your reservation has been made for`
    1. Select **Insert variable** and choose **reservationDateTime** from the list
    1. Enter `. We look forward to seeing you!`

    > [!TIP]
    > You can also enter the full message by using braces around the variable `Your reservation has been made for {Topic.reservationDateTime}. We look forward to seeing you!`.

    :::image type="content" source="media/build-2022-quickstart/variable-reference.png" alt-text="Screenshot of variable in message node.":::

    When the bot responds with this message, the variable reference will be replaced with the value of the variable.

    :::image type="content" source="media/build-2022-quickstart/variable-replaced.png" alt-text="Screenshot of the variable's value shown in a message.":::

1. Add a **Redirect** node where the two condition branches meet and choose the **End of conversation** topic.
The **End of conversation** topic is a pre-built topic designed to check if the user is satisfied and asks them to rate their experience.

1. Name the topic `Reservation` and select **Save**.

1. Click on the **Test** button to open the test canvas.

1. Interact with the bot by clicking on the **Make a reservation** quick reply. The bot will reply based on the conditions added till it redirects to the end of the conversation topic and asks you to rate your experience.

## Next steps

1. To allows users to call your bot, you need to [enable and configure the Telephony channel](publication-connect-bot-to-telephony.md).

1. Optionally, [customize your bot's voice font](advanced-speech-settings.md).

1. [Publish your bot](publication-fundamentals-publish-channels.md).

1. Test your bot using the [demo website](publication-connect-bot-to-web-channels.md), or call the phone number configured in Telephony.
