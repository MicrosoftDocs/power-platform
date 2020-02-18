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
ms.cusom: "analysis, licensing"
ms.collection: virtual-agent
---

# View billed sessions for Power Virtual Agents

When you purchase a license, you gain capacity for the specified number of billed sessions. The capacity is pooled across the tenant and any user who has access to Power Virtual Agents can build bots that use this capacity. 

The capacity is currently not reported at the tenant level, but is available for each bot within the analytics section of Power Virtual Agents.

**Find the number of billed sessions for your bot:**

1. In Power Virtual Agents, select **Analytics** from the side navigation pane.

1. Go to the **Billing** tab.

    ![Billed session view](media/analytics-billed-sessions.png)

You can change the date range to filter the **Total billed sessions over time** chart to a specific period. You can also see the total billed sessions, as well as the trend percentage, next to the chart of sessions.

## Definition of a billed session

A billed session is an interaction between a customer and a bot, and represents one unit of consumption. 

The billed session begins when a user topic is triggered. More information: [Use system and sample topics section](authoring-create-edit-topics.md#use-system-and-sample-topics)

The session ends for one of the following reasons: 

- The user ends the chat sessions.  
    When the bot doesn't receive a new message for more than 30 minutes, a session is considered closed.

- The session is longer than 60 minutes.  
    The first message that occurs after 60 minutes starts a new session.

- The session has more than 100 turns. One turn is defined as one exchange between a user and the bot.  
    The 101st turn starts a new session. 

> [!Note]
> Sessions that use the [embedded test chat](authoring-test-bot.md) don't count towards the billed sessions.


## Frequently asked questions

### What is the difference between sessions, engaged sessions, and billed sessions?
The number of **billed sessions** is a unit to measure capacity, and is defined when you purchase a license. 

**Total sessions** and **engaged sessions** are metrics used to determine how efficient a bot is in addressing a user's questions. 

More information: [Analyze bot performance and usage in Power Virtual Agents](analytics-summary.md)

### Where can I see the total number of billed sessions for my organization?

Currently you can only see billed sessions for a single bot.

### If I am on a trial subscription but have some billed sessions, do I still have to pay?

If you see billed sessions for your bot, it does not mean you will be charged. If you signed up for a [trial offer](sign-up-individual.md), you receive a number of billed sessions included with the trial.
