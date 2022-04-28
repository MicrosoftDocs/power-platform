---
title: "Technology preview for Build 2022"
description: ""
keywords: ""
ms.date: 04/04/2022
ms.topic: overview
author: v-alarioza
ms.author: v-alarioza
manager: shellyha
ms.custom: fundamentals, ceX, intro-internal
ms.collection: virtual-agent
searchScope:
  - "Power Virtual Agents"
---

# Technology preview for Build 2022

<!-- FIXME: blurb about PVA at Build -->

## New features

<!-- FIXME: merge PRs and link relevant docs -->
- Redesigned authoring canvas
- Enhanced variable management
- Power FX support
- Rich Response Authoring​
- Speech authoring
- Telephony channel
- Bot response variations

## Limitations of technology preview

The following features are not supported in the technology preview:

- Authoring bots in the Power Virtual Agents app in Microsoft Teams
- Creating bots in other languages other than English
- Customization of system fallback topic
- Analytics
- Entities
- Skills
- Agent transfers
- Publishing bots on Teams channel
- Bots setup with application lifecycle management (ALM)
    <!-- FIXME: button missing, confirm it wasn't moved -->
- Extending bots in Composer

## Quick start

<!-- FIXME: intro + summary of capabilities -->

We'll create a bot to handle reservations for a restaurant.

- Customer can call (telephony) or use live chat
- Bot response variations for greetings
- Use emphasis on announcement that restaurant will not be open on 5/25 for a private event
- Use Power Fx and variables to compare dates for making a reservation

1. Navigate to the Power Virtual Agents home page and select **Create a bot**.

1. Name the bot `Reservation Bot` and select **Create**.

1. On the Topics list, select the **Greeting** topic.

1. Delete all existing **Message** nodes.

    <!-- FIXME: link doc once written -->
1. Add a **Message** node. Then add the following greetings as [message variations]():
    - `Good day!`
    - `Hi there!`
    - `Hi!`

1. Add a second **Message** node and add the message `We're open 9am to 5pm Monday through Friday. If you'd like, I can help you make a reservation.`

    <!-- FIXME: link doc once written -->
1. Add a third **Message** node. Then add the following message which uses an [emphasis SSML tag](): `<emphasis level="strong">However please note,</emphasis><break strength="medium" /> we will be closed on May 27th.`

1. Select **Save**.

1. Go back to the Topics list and select **New topic**.

1. Add the following trigger phrases:
    - `make a reservation`
    - `reserve a time`

1. Add a **Question** node and enter the message `What is the desired time and date of your reservation?`

1. For **Identify** choose **Date and time**.

    <!-- FIXME: link doc once written -->
1. For **Save response as** [create a new variable]() named `reservationDateTime`.

1. Add a **Set a Variable Value** node.

    <!-- FIXME: link doc once written -->
1. For **Set variable** [create a new variable]() named `dateDiff`.

    <!-- FIXME: link doc once written -->
1. For **To value** enter the [Power Fx formula]() `DateDiff(Topic.reservationDateTime, Date(2022,5,27))`.

1. Add a **ConditionItem** node and select the **dateDiff** variable.

    <!-- FIXME: link doc once written -->
1. In the second box, choose **is equal to**. In the third box, use a [Power Fx formula]() to enter a [number value]() of `0`.

1. Under the **ConditionItem** node add a **Message** node. Then enter the message `Sorry, but we're closed on May 27th. Please make a reservation on another day.`

1. Under the **All Other Conditions** node, add a **Message** node and enter the message `Your reservation has been made for `. Then add the variable **reservationDateTime**.

1. Add an **Redirect** node where the two condition branches meet and choose the **End of conversation** topic.

1. Name the topic `Make a reservation` and select **Save**.

    <!-- FIXME: link doc once written -->
1. [Enable and configure the Telephony channel]().

    <!-- FIXME: link doc once written -->
1. [Customize your bot's voice font]().

1. [Publish your bot](publication-fundamentals-publish-channels.md).

1. Test your bot by calling the number or in web chat.