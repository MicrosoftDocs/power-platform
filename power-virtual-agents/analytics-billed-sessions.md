---
title: View billed sessions (preview)
description: View your billed sessions in Microsoft Copilot Studio preview.
keywords: "PVA"
ms.date: 03/24/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: analysis, licensing, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# View billed sessions

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

A _billed session_ is an interaction between a customer and a bot. It represents one unit of consumption. The purchase of a Microsoft Copilot Studio license includes a specific number of billed sessions. Microsoft Copilot Studio pools this capacity across the entire tenant. How much of your capacity you've consumed isn't reported at the tenant level. However, you can view consumption for individual bots.

> [!NOTE]
> 
> This article is for billed sessions in the legacy Power Virtual Agents license. This legacy license is no longer avilable for purchase starting on January 1, 2024.

A billed session begins when a user topic or premium functionality is triggered. A billed session ends when one of the following conditions is met:

- The user ends the chat session.  
    When the bot doesn't receive a new message for more than 30 minutes, the session is considered closed.

- The session is longer than 60 minutes.  
    The first message that occurs after 60 minutes starts a new session.

- The session has more than 100 _turns_.  
    A turn is defined as one exchange between a user and the bot. The one-hundred-and-first turn starts a new session.

Sessions that use the [embedded test chat](authoring-test-bot.md) don't count toward billed sessions.

## View your bot's billed sessions

1. In Microsoft Copilot Studio, in the navigation menu, select **Analytics**.

1. Select the **Billing** tab.

By default, the page displays billed sessions for the last seven days. To change the time period shown, select a period start date and (optionally) a period end date in the calendar controls.

The Billed Session report doesn't distinguish between sessions that are included in the Microsoft Copilot Studio for Microsoft Teams plan and sessions that aren't included. The report might show an inflated number of billed sessions.

## Common scenarios

The following table helps illustrate when sessions are billed and when sessions are free or included in select Microsoft 365 subscriptions. These scenarios are examples only, and not all scenarios are covered.

| Scenario | Is session billed? | Topic type | Channel | Power Automate flow  | Bot Framework extensibility | Bot stored in |
| --- | --- | --- | --- | --- | --- | --- |
| User logs vacation days in a conversation with the bot in Microsoft Teams.| Included with select Microsoft 365 subscriptions | Any topic type | Teams | Yes (only standard connectors) | Not used | Dataverse for Teams |
| Bot greets user on your website, user escalates to a human agent directly or doesn't interact with the bot. | No | System  | Any channel | Not used | Not used | Any environment type |
| Greeting topic redirects to Bot Framework Composer or a skill topic for advanced operations. | Yes | Any topic type | Any channel | Either used or not used | Yes | Any environment type |
| Greeting topic gets information about the user using a Power Automate flow to present a customized experience. | Yes | Any topic type | Any channel | Yes (any connector) | Either used or not used | Any environment type |
| User interacts with the bot on your website to ask about store hours, check order status, and so on. | Yes | Non-system | Any channel | Either used or not used | Either used or not used | Dataverse |

## Frequently asked questions

### What's the difference between total sessions, engaged sessions, and billed sessions?

- _Billed sessions_ are used to measure usage against the capacity that is allocated when you purchase a license. For more information, see the [Microsoft Power Platform Licensing Guide](https://go.microsoft.com/fwlink/?linkid=2085130).
- _Total sessions_ and _engaged sessions_ are metrics of _analytics sessions_, used to determine how efficient a bot is in addressing a user's questions.
- _Billed sessions_ and _analytics sessions_ are distinct and independent.

For more information, see [Summarize your bot's performance and usage](analytics-summary.md).

### Where can I see the total number of billed sessions for my organization?

You can only view billed sessions for individual bots.

### If I'm on a trial subscription but have some billed sessions, do I have to pay?

Not necessarily. The trial offer provides you with some billed sessions.

[!INCLUDE[footer-include](includes/footer-banner.md)]
