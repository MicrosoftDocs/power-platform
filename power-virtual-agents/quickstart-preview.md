---
title: Microsoft Copilot Studio preview quickstart
description: Discover the new features introduced in the Microsoft Copilot Studio preview.
ms.date: 03/24/2023

ms.topic: how-to
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.service: power-virtual-agents
ms.collection: virtual-agent
ms.custom: bap-template
---

# Quickstart

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

This quickstart walks you through making a bot that uses new features and improvements introduced in the Microsoft Copilot Studio preview. You'll create a bot that helps users make a reservation at a fictional restaurant.

## Prerequisites

- [Create and edit topics](authoring-create-edit-topics.md)

## Create your bot

Microsoft Copilot Studio has an app-level home page that isn't specific to any bot. On this page, you can create a bot and view a list of bots you've worked on recently. You can also find learning resources, such as videos, documentation, and learning paths.

1. In the navigation menu, select **Home**, and then select **Create a bot**.

    :::image type="content" source="media/quickstart/new-bot1.png" alt-text="Screenshot of the Microsoft Copilot Studio app-level home page, with the Create buttons highlighted.":::
   
2. A whole page wizard will start with a couple steps to get your bot created very quickly. A default bot name is there. Instead of the default name, name the bot `Reservation Bot` and select **Create**. 

    :::image type="content" source="media/quickstart/new-bot2.png" alt-text="Screenshot of creating a chatbot.":::
   
A new bot will be created and you will land on the bot's overview page.

## Customize the conversation start topic

1. In the navigation menu, select **Topics**.

1. Select the **System** tab to view the system topics. Select the **Conversation Start** topic to open it.

    This topic is triggered when a user starts a new conversation. It allows the bot to send a welcome message to the user.

1. To remove the existing **Message** node, select its _node menu_ (**&vellip;**), and then select **Delete**.

### Add a welcome message and variations

1. To add a new **Message** node, select the _add node_ (**+**) menu after the **On Conversation Start** node, and then select **Send a message**.

1. Type `Good day!` in the message field.

1. In the **Message** node, select **+ Add**, and then select **Message variation**.

1. Add a couple of [message variations](authoring-send-message.md#use-message-variations):
    - `Hi there!`
    - `Hi!`

### Add an image

1. To add an image to the message, select **+ Add**, and then select **Image**.

1. Enter a title and the URL of an image. The URL must start with `https://`.

### Add a message giving the restaurant's hours

1. Add a second **Message** node and then add a text message:

    ```text
    We're open 9am to 5pm Monday through Friday, and 10am through 8pm on the weekends. Please note, reservations can only be made for the next 7 days.
    ```

1. Change the _text or speech_ mode to **Speech**.

    The speech mode allows you to add a message for voice-enabled channels and use [SSML tags](authoring-send-message.md#use-ssml-to-customize-speech-responses) to customize speech responses.

    :::image type="content" source="media/quickstart/message-speech-mode.png" alt-text="Screenshot of the speech mode toggle.":::

1. Add an SSML-annotated speech message:

    ```SSML
    We're open 9am to 5pm Monday through Friday, and 10am through 8pm on the weekends. <emphasis level="strong">Please note</emphasis><break strength="medium" />, reservations can only be made for the next 7 days.
    ```

    When the bot speaks the message in a voice-enabled channel, it will emphasize "Please note" and pause for a moment before continuing.

### Add a quick reply

1. Add a third **Message** node and then add a text message: `If you'd like, I can help you make a reservation.`

1. Select **+ Add**, and then select **Quick reply** to add a [quick reply](authoring-send-message.md#use-quick-replies) with the message `make a reservation`.

    A quick reply gives the user the option to select "make a reservation" instead of having to type it out.

    :::image type="content" source="media/quickstart/quick-reply.png" alt-text="Screenshot of the reservation quick reply.":::

1. Select **Save**.

## Add a reservation topic

1. In the navigation menu, select **Topics**, then **New topic**, then **From blank**.

1. Add the following trigger phrases:
    - `Reserve a table`
    - `Make a reservation`

### Get the reservation date and time

1. Add a **Question** node and enter the message:

    ```text
    What is the desired time and date of your reservation?
    ```

1. For **Identify**, choose **Date and time**. This [entity](advanced-entities-slot-filling.md) enables your bot to extract a date and time from the user's response.

1. For **Save response as**, rename the variable to `reservationDateTime`.

1. In the **Question Properties** pane, select **Question behavior** to view more settings for the question.

1. Under **Reprompt** and **Retry prompt**, select **Customize**. Set the retry prompt, the question the bot uses to try again when the user types an invalid response.

    ```text
    Sorry, that doesn't look like a valid reservation date. Please enter your desired reservation date, such as `11-10-2022` or `tomorrow`.
    ```

    :::image type="content" source="media/quickstart/retry-message.png" alt-text="Screenshot of the question retry message property.":::

### Validate the reservation date

We only want to accept reservations for the next seven days, so let's add a validation rule and message to the question.

1. Under **Additional entity validation** and **Condition**, enter the following Power Fx formula:

    ```power-fx
    And(Topic.reservationDateTime >= Today(), Topic.reservationDateTime < Today()+7)
    ```

1. Select **Insert** to save the formula.

1. Under the **Condition not met prompt**, select **Customize** and enter this message:

    ```text
    Sorry. Please enter a date in between now and the next seven days.
    ```

    :::image type="content" source="media/quickstart/validation-rule.png" alt-text="Screenshot of the question validation properties.":::

### Get and validate the number of diners

We only want to accept reservations for up to six people, so let's add a validation rule and message for that.

1. Add another **Question** node and enter the message `For how many people?`

1. For **Identify**, choose **Number**. This [entity](advanced-entities-slot-filling.md) enables your bot to extract a number from the user's response.

1. For **Save response as**, change the variable name to `reservationNumber`.

1. Under **Additional entity validation** and **Condition**, enter the following Power Fx formula:

    ```power-fx
    And(Topic.reservationNumber > 0, Topic.reservationNumber <= 6)
    ```

1. Under the **Condition not met prompt**, select **Customize** and enter this message:

    ```text
    Sorry, reservations can only be made for a maximum of 6 guests. Please call us to make a reservation for a larger party.
    ```

### Finish the conversation

1. Add a **Message** node. You can use the **Insert variable** control or enter the full message by using braces around the variable names.

    ```text
    We look forward to seeing your party of {Topic.reservationNumber} on {Topic.reservationDateTime}.
    ```

    When the bot responds with this message, the values of the variables replace the variable references.

1. To redirect to the **End of conversation** system topic, select **+ Add**, then **Topic management**, then **Go to another topic**, and then select **End of Conversation**.

1. Name the topic **Reservation** and select **Save**.

## Next steps

1. [Publish your bot](publication-fundamentals-publish-channels.md).

1. Test your bot using the [demo website](publication-connect-bot-to-web-channels.md).

