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

When you purchase a license you gain capacity for the specified number of billed sessions. Power Virtual Agents pools this capacity across the entire tenant. 

The capacity isn't reported at the tenant level, but can be seen for each individual bot. 

**Find the number of billed sessions for your bot:**

1. In Power Virtual Agents, select **Analytics** on the side navigation pane.

1. Go to the **Billing** tab.

    ![Billed session view](media/analytics-billed-sessions.png)

You can change the date range to filter the **Total billed sessions over time** chart to a period you specify. You can also instantly see the total billed sessions, as well as the trend percentage, beside the chart of sessions.

## Definition of a billed session

A billed session is an interaction between the customer and the bot and represents one unit of consumption. 

The billed session begins when a user topic is triggered (see the [Use system and sample topics section](authoring-create-edit-topics.md#use-system-and-sample-topics) for more information).

The session ends for one of the following reasons: 

- The user ends the chat sessions.  
    When the bot doesn't receive a new message for more than 30 minutes, it's considered closed.

- The session is longer than 60 minutes.  
    The first message that occurs after 60 minutes will start a new session.

- The session has more than 100 turns (one turn is defined as one exchange between the user and the bot).  
    The 101st turn will start a new session. 

> [!Note]
> Sessions that use the [embedded test chat](authoring-test-bot.md) won't count towards the billed sessions.


## Frequently asked questions

### What is the difference between sessions, engaged sessions, and billed sessions?
The number of **billed sessions** is a unit used to measure capacity, and is defined when you purchase a license. 

**Total sessions** and **engaged sessions** are metrics used to determine how efficient your bot is in addressing your user's questions. 

See the [Analyze bot performance and usage in Power Virtual Agents](analytics-summary.md) topic for more details on session and engagement rates.

### Where can I see the total number of billed sessions for my organization?

Currently you can only see billed sessions for a single bot.

### If I am on a trial subscription but have some billed sessions, does it mean I have to pay?

If you see billed sessions for your bot, it doesn't mean you'll be charged. For example, signing up for the [trial offer](sign-up-individual.md) will provide you with a number of billed sessions included in the trial.
