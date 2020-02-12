---
title: "View Power Virtual Agents billed sessions"
description: "See Power Virtual Agents billed sessions for the last 30 or 7 days"
ms.date: 2/20/2020
ms.service:
  - "dynamics-365-ai"
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.cusom: analysis
ms.collection: virtual-agent
---

# View billed sessions for Power Virtual Agents

You can find the number of billed sessions for your bot under **Analytics** -> **Billing**.

> ![Billed session view](media/analytics-billed-sessions.png)

# Definition of a billed session

A billed session is an interaction between the customer and the bot and represents one unit of consumption. The billed session begins when an user topic is triggered (user topics are different from system topics and you can distinguish between them in the Topics list). The session ends for one of the following reasons: 
- the customer ends the chat sessions. When the bot doesn't receive a new message for more than 30 minutes, we consider it closed.
- The session is longer than 60 minutes. After the user chats with the bot for longer than 60 minutes, the first message that will go over 60 minutes will start a new session. Depending on the use cases for your bot, this is more or less likely to happen.
- The session has more than 100 turns (one turn is defined as one exchange between the user and the bot). The 101st turn will trigger a new session start. Depending on the use cases for your bot, this is more or less likely to happen.

  > [!Note]
  > Note that sessions using the [embedded test chat](authoring-test-bot.md) while you test the bot, won't count towards the billed sessions.

# Frequently asked questions
## What is the difference between sessions, engaged sessions and billed sessions?
Billed sessions is a unit we use to measure Power Virtual Capacity and is something you can purchase through our SKUs. Total sessions and engaged sessions are metrics used to determine how efficient your bot is in addressing your user's questions. You can find the exact definitions of what a session and engagement rate is [here](analytics-summary.md). 

## Where can I see the total number of billed sessions for my organization?
Currently you can only see billed sessions for a single bot. We've an organization level reporting on our roadmap.

## If I am on trial subscripition but have some billed sessions, does it mean I have to pay?
If you see billed sessions for your bot, it does not mean you will be charged. If you signed up for our [trial offer](sign-up-individual.md) you have a number of billed session included with the trial.
