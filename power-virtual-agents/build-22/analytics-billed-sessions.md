---
ROBOTS: NOINDEX,NOFOLLOW
title: View billed sessions
description: See Power Virtual Agents billed sessions.
keywords: "PVA"
ms.date: 06/02/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "analysis, licensing, ceX"
ms.collection: virtual-agent
---

# View billed sessions for Power Virtual Agents

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

The purchase of a Power Virtual Agents license includes a specific number of billed sessions. Power Virtual Agents pools this capacity across the entire tenant.

The consumption of the capacity isn't reported at the tenant level. You can view consumption for individual bots, however.

## View your bot's billed sessions

1. In Power Virtual Agents, in the left side panel, select **Analytics**.

1. Select the **Billing** tab.

By default, the page displays billed sessions for the last seven days. To change the time period shown, select a period start date and (optionally) period end date in the calendar controls.

## Definition of a billed session

A billed session is an interaction between a customer and a bot. It represents one unit of consumption.

The billed session begins when a user topic or premium functionality (as indicated in [Common scenarios](#common-scenarios)) is triggered. For more information, see [Use system and sample topics](authoring-create-edit-topics.md#use-system-and-sample-topics).

A billed session ends for one of the following reasons:

- The user ends the chat session.  
    When the bot doesn't receive a new message for more than 30 minutes, the session is considered closed.

- The session is longer than 60 minutes.  
    The first message that occurs after 60 minutes starts a new session.

- The session has more than 100 turns. A turn is defined as one exchange between a user and the bot.  
 The one-hundred-and-first turn starts a new session.

## Common scenarios

The following table helps illustrate which sessions are going to be billed and which sessions are free or included in select Microsoft 365 subscriptions. These scenarios are examples only, and not all scenarios are covered.

| Scenario | Is session billed? | Topic type | Channel | Power Automate flow  | Bot Framework extensibility | Bot stored in |
| --- | --- | --- | --- | --- | --- | --- |
| User logs vacation days (in Dataverse for Teams) in a conversation with the bot in Microsoft Teams.| Included with select Microsoft 365 subscriptions | Any topic type | Teams | Yes (only standard connectors) | Not used | Dataverse for Teams |
| Bot greets user on a website, customer escalates to human agent directly or doesn't interact with the bot. | Free - not a billed session | System  | Any channel | Not used | Not used | Any environment type |
| Greeting topic redirects to Bot composer or a skill topic for advanced operations. | Billed session | Any topic type | Any channel | Either used or not used | Yes | Any environment type |
| Greeting topic pulls information about the user using Power Automate flow to present a customized experience. | Billed session | Any topic type | Any channel | Yes (any connector) | Either used or not used | Any environment type |
| User interacts with the bot on your website to ask about store hours, check order status, and so on. | Billed session | Non-system | Any channel | Either used or not used | Either used or not used | Dataverse |

> [!NOTE]
> Sessions that use the [embedded test chat](authoring-test-bot.md) don't count toward billed sessions.
> The Billed Session report doesn't distinguish between the sessions included in the Power Virtual Agents for Microsoft Teams plan and those that aren't included. You might see an inflated number of billed sessions in the report.

## Frequently asked questions

### What's the difference between total sessions, engaged sessions, and billed sessions?

The number of **billed sessions** is used to measure capacity, and is allocated when you purchase a license.

**Total sessions** and **engaged sessions** are metrics used to determine how efficiently a bot addresses a user's questions.

For more information, see [Summarize your bot's performance and usage](analytics-summary.md).

### Where can I see the total number of billed sessions for my organization?

Currently, you can only see billed sessions for an individual bot.

### If I'm on a trial subscription but have some billed sessions, do I have to pay?

If you see billed sessions, it doesn't mean you'll be charged. The trial offer provides you with some billed sessions.

[!INCLUDE[footer-include](includes/footer-banner.md)]
