---
title: "Power Virtual Agents preview quickstart (preview)"
description: "Discover the new features introduced in the Power Virtual Agents preview."
ms.date: 10/10/2022
ms.topic: article
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.collection: virtual-agent
---

# Quickstart (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

This quickstart walks you through making a bot that uses new features and improvements introduced in the Power Virtual Agents preview. You'll create a bot that helps users make a reservation at a fictional restaurant.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Create a bot

Power Virtual Agents now has an app-level home page that isn't specific to any bot. On this page you can create a new bot, view a list of recent bots that you've accessed, and access learning resources, such as videos, documentation, and learning paths.

:::image type="content" source="media/quickstart/new-bot1.png" alt-text="Screenshot of the app-level home page.":::

1. In the side navigation, select **Create** (**+**); or, select **Home**, then **+ Create a bot**.

1. Select **Try the unified canvas (preview)** to create a preview bot.

1. An opt-in confirmation will be shown the first time you attempt to create or view a preview bot. Select **Continue** to continue, or select **No thanks** if you change your mind.

    :::image type="content" source="media/quickstart/preview-opt-in.png" alt-text="Screenshot of the preview opt-in message.":::

1. Name the bot `Reservation Bot` and select **Create**.

    :::image type="content" source="media/quickstart/new-bot2.png" alt-text="Screenshot of the create a chatbot dialog.":::

    > [!IMPORTANT]
    > In the Power Virtual Agents preview, bots can only be created in English.

## Customize the conversation start topic

1. In the side navigation, select **Topics**.
1. Select the **System** tab to view the system topics.
1. Select the **Conversation Start** topic to open it. This topic is triggered when a user joins a new conversation and allows the bot to send a welcome message to the user.
1. To remove the existing **Message** node, select its _node menu_ (**&vellip;**), then **Delete**.
1. To add a new **Message** node, select the _add node_ (**+**) menu after the the **On Coversation Start** node, then **Send a message**.
    1. Add `Good day!` in the message field.
    1. In the **Message** node, select **+ Add**, then **Message variation** to add a couple [message variations](authoring-send-message.md#use-message-variations):
        - `Hi there!`
        - `Hi!`

    1. To add an image to the message, select **+ Add**, then **Image**. You'll need to provide a title and the image URL. The image URL must start with `https://`.

<!-- TODO: What are the real limitations of images? Do we have a publicly accessible image URL they can use so we can provide a sample URL that works?-->

1. Add a second **Message** node.
    1. Add a text message.

        ```text
        We're open 9am to 5pm Monday through Friday, and 10am through 8pm on the weekends. Please note, reservations can only be made for the next 7 days.
        ```

    1. Change the _text or speech_ mode to **Speech** and add a speech variation.

        The speech mode allows you to add a specific message for voice-enabled channels and enable the use of [SSML tags](authoring-send-message.md#use-ssml-to-customize-speech-responses).

        :::image type="content" source="media/quickstart/message-speech-mode.png" alt-text="Screenshot of speech mode toggle.":::

    1. Add the annotated message to speak:

        ```SSML
        We're open 9am to 5pm Monday through Friday, and 10am through 8pm on the weekends. <emphasis level="strong">Please note</emphasis><break strength="medium" />, reservations can only be made for the next 7 days.
        ```

   When the bot speaks the message over a phone call, it will emphasize "Please note" and pause for a moment before continuing.

1. Add a third **Message** node.
   1. Add the message `If you'd like, I can help you make a reservation.` to provide a call to action for the user.
   1. Select **+ Add**, then **Quick reply** to add a [quick reply](authoring-send-message.md#use-quick-replies) with the message `make a reservation`.

      A quick reply gives the user the option to select "make a reservation" instead of having to type it out.

      :::image type="content" source="media/quickstart/quick-reply.png" alt-text="Screenshot of the reservation quick reply.":::

1. Select **Save**.

## Add a reservation topic

1. In the side navigation, select **Topics** and then **New topic**.

1. Add the following trigger phrases:
    - `Reserve a table`
    - `Make a reservation`

1. Add a **Question** node and enter the message:

    ```text
    What is the desired time and date of your reservation?
    ```

    1. For **Identify**, choose **Date and time**. This [entity](advanced-entities-slot-filling.md) enables your bot to extract a date and time from the user's response.

    1. For **Save response as**, rename the variable to `reservationDateTime`.

    1. On the **Question Properties** pane that appears on the right hand of the canvas, select **Question behavior** to see additional settings for the question.

    1. Under **Reprompt** and **Retry prompt**, select **Customize**. Set the retry prompt&mdash;the question used when a user provides an invalid response and the bot tries again.

        ```text
        Sorry, that doesn't look like a valid reservation date. Please enter your desired reservation date, such as `11-10-2022` or `tomorrow`.
        ```

    1. [Add a **ConditionItem** node](authoring-using-conditions.md) and [change it to a formula](advanced-power-fx.md#use-power-fx-as-a-condition).

    1. In the message box that is now shown, enter the message `Sorry, that doesn't look like a valid reservation date. Please enter your desired reservation date. e.g. '11-10-2022' or 'tomorrow'`.

        :::image type="content" source="media/quickstart/retry-message.png" alt-text="Screenshot of the question retry message property.":::

1. We only want to accept reservations for within the next 7 days, so we can add a validation rule and message to the question. Under the **Additional entity validation** section and the **Condition** property, click into the **Enter in a formula** input box and click the **Fx** button that appears. In the formula editor that appears, enter `Topic.reservationDateTime >= Today()` and click **Insert**.

1. Under the **Condition not met prompt** select the **Customize** check box and enter the message `Sorry. It looks like the date you entered was in the past. Please enter a future date.`.

   :::image type="content" source="media/quickstart/validation-rule.png" alt-text="Screenshot of the question validation properties.":::

1. Add another **Question** node and enter the message `For how many people?`

1. For **Identify**, choose **Number**. This [entity](advanced-entities-slot-filling.md) enables your bot to extract a number from the user's response.

1. For **Save response as**, [create a new variable](authoring-variables.md) named `reservationNumber`.

1. Reservations can only be made for a maximum of 6 people, so we need to let the user know if they have exceeded this number. [Add a **Condition** node](authoring-create-edit-topics.md#add-a-condition), select **Select a variable** and then choose the `reservationNumber` variable.

1. Change the operator dropdown to **is greater than or equal to** and then replace the **Enter or select a value** placeholder with `7`. 

   :::image type="content" source="media/quickstart/validation-rule-number.png" alt-text="Screenshot of the condition node to check if the reservation exceeds the maximum number of people.":::

1. Under the **Condition** node, add a **Message** node. Enter the message `Sorry, reservations can only be made for a maximum of 6 guests. Please call us to make a reservation for a larger party.`

1. Under the **All Other Conditions** node, add a **Message** node.
    1. Enter `We look forward to seeing you and your party of `
    2. Select **Insert variable** and choose **reservationNumber** from the list
    3. Enter `. We look forward to seeing you!`

    > [!TIP]
    > You can also enter the full message by using braces around the variable `We look forward to seeing you and your party of {Topic.reservationNumber}. We look forward to seeing you!`.

    :::image type="content" source="media/quickstart/variable-reference.png" alt-text="Screenshot of variable in message node.":::

    When the bot responds with this message, the variable reference will be replaced with the value of the variable.

1. Add a **Redirect** node where the two condition branches meet and choose the **End of conversation** topic.
The **End of conversation** topic is a system topic designed to check if the user is satisfied and asks them to rate their experience.

1. Name the topic **Reservation** and select **Save**.

## Next steps

1. [Publish your bot](publication-fundamentals-publish-channels.md).

2. Test your bot using the [demo website](publication-connect-bot-to-web-channels.md). 
