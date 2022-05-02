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
- [Enhanced variable management]()
- [Power FX support]()
- [Rich Response Authoring​]()
- [Speech authoring]()
- [Telephony channel]()
- [Bot response variations](authoring-create-edit-topics.md#message-variations)

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

<!-- FIXME: add screenshots once scenario is approved -->

This quick start walks you through making a bot that uses new features and improvements introduced in the Technology Preview.

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
1. [Add a **Set a Variable Value** node]().

    <!-- FIXME: link doc once written -->
1. For **Set variable** [create a new variable]() named `dateDiff`.

    <!-- FIXME: link doc once written -->
1. For **To value** enter the [Power Fx formula]() `DateDiff(Topic.reservationDateTime, Date(2022,5,27))`.

    <!-- FIXME: link doc once written -->
1. [Add a **ConditionItem** node](), then...
    - For the first box, select the **dateDiff** variable.
    - For the second box, choose **is equal to**.
    - For the third box, use a [Power Fx formula]() to enter a [number value]() of `0`.

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

<a id="where-to-find"></a>

## For desktop Composer users

There are a number of differences and similarities in how bots are designed in Bot Framework Composer and in the Power Virtual Agents technology preview.
The following table list some key concepts in Composer and describes where to find information about similar concepts in Power Virtual Agents.

| Composer concept | Power Virtual Agents concept | Description |
|:-|:-|:-|
| Dialogs and triggers | [Topics][] | Use topics to organize conversation flow or paths. A topic has a set of _trigger phrases_ that indicate when the bot should start the topic and a set of _nodes_ that describe the conversation path for the topic. |
| Intents | [Trigger phrases][] | Add trigger phrases to a topic for phrases, keywords, and questions that a user is likely to type that are related to a specific issue. Natural language understanding is used to parse what a customer types and find the most appropriate topic. |
| Actions and prompts | [Nodes][] | Use nodes on the authoring canvas to create the conversation path for each topic, such as messages, questions, and conditional branches. |
| Bot response variation | [Response variations][] and [question variations][] | Use response and question variations to add variety to your bot's messages and questions. |
| Suggested actions | [Quick replies][] | Use quick replies to provide default reply options to the user. |
| Entities | [Entities][] | Define and use entities to extract semantic information from a user's utterance. |
| State, storage, and properties | [Variables][] | Use variables to track state. |
| Formulas and expressions | [Power FX][] | Use Power FX to create expressions. |

[Entities]: #where-to-find
[Nodes]: #where-to-find
[Power FX]: #where-to-find
[question variations]: #where-to-find
[Quick replies]: #where-to-find
[Response variations]: #where-to-find
[Topics]: #where-to-find
[Trigger phrases]: #where-to-find
[Variables]: #where-to-find
