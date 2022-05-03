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

<!-- FIXME: add screenshots once scenario is approved -->

This quickstart walks you through making a bot that uses new features and improvements introduced in the technology preview at Build.

<!-- FIXME: work in cards into this scenario -->

1. Navigate to the Power Virtual Agents home page and select **Create a bot**.

1. Name the bot `Reservation Bot` and select **Create**.

1. In the side navigation, select **Topics**. Then select the **Greeting** topic.

1. Delete all existing **Message** nodes.

1. Add a **Message** node. Then add the following greetings as [message variations](authoring-create-edit-topics.md#message-variations):
    - `Good day!`
    - `Hi there!`
    - `Hi!`

1. Add a second **Message** node and add the message `We're open 9am to 5pm Monday through Friday. If you'd like, I can help you make a reservation.`

    <!-- FIXME: link doc once written -->
1. Add a third **Message** node. Then add the following message which uses [SSML tags](): `<emphasis level="strong">Please note</emphasis><break strength="medium" /> we will be closed on May 27th.`

1. Select **Save**.

1. Go back to the topics list and select **New topic**.

1. Add the following trigger phrases:
    - `make a reservation`
    - `reserve a time`

1. Add a **Question** node and enter the message `What is the desired time and date of your reservation?`

1. For **Identify** choose **Date and time**.

    <!-- FIXME: link doc once written -->
1. For **Save response as** [create a new variable]() named `reservationDateTime`.

    <!-- FIXME: link doc once written -->
1. [Add a **ConditionItem** node]() and [change it to a formula]().

    <!-- FIXME: link doc once written -->
1. Enter the [Power Fx formula]() `DateDiff(Topic.reservationDateTime, Date(2022,5,27)) == 0`.

1. Under the **ConditionItem** node add a **Message** node. Then enter the message `Sorry, but we're closed on May 27th. Please make a reservation on another day.`

1. Under the **All Other Conditions** node, add a **Message** node and enter the message `Your reservation has been made for `. Then add the variable **reservationDateTime**.

1. Add an **Redirect** node where the two condition branches meet and choose the **End of conversation** topic.

1. Name the topic `Make a reservation` and select **Save**.

    <!-- FIXME: link doc once written -->
1. [Enable and configure the Telephony channel]().

    <!-- FIXME: link doc once written -->
1. [Customize your bot's voice font]().

1. [Publish your bot](publication-fundamentals-publish-channels.md).

1. Test your bot using the [**Test bot** pane](authoring-test-bot.md), or by calling the phone number configured in Telephony.
