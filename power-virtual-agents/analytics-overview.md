---
title: "Fundamentals - Analyze chatbot usage (contains video)"
description: "Analyze customer satisfaction, topic usage, and bot performance in Power Virtual Agents."
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: overview
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: analysis, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Key concepts – Analytics in Power Virtual Agents

Power Virtual Agents has a comprehensive set of analytics that show you the key performance indicators for your bot.

> [!NOTE]
> Sessions transcripts are unavailable for download on the Power Virtual Agents app in Teams. To review and export session information, you'll need to sign up for the [Power Virtual Agents web app](requirements-licensing-subscriptions.md).

Multiple charts show you trends and usage for your bot's topics. These charts use AI to highlight the topics that have the greatest impact on your bot's performance.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mNOu]
>

> [!NOTE]
> Bot analytics in Power Virtual Agents US Government Cloud plans will be released at a later date. You can use a [custom analytics solution to create a custom Power BI dashboard](https://powervirtualagents.microsoft.com/blog/custom-analytics-solution-for-power-virtual-agents/) to get bot analytics for these plans.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).


# [Preview](#tab/preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

As a bot maker, your job isn't done when you publish your bot for use. You'll want to know how well your bot is performing its intended duties. The comprehensive analytics in Power Virtual Agents keep your bot's key performance indicators front and center. Multiple charts show you trends and usage for your bot's topics. These charts use AI to highlight the topics that have the greatest effect on your bot's performance.

> [!NOTE]
> Bot analytics in Power Virtual Agents US Government Cloud plans will be released at a later date. In the meantime, you can use a [custom analytics solution to create a Power BI dashboard](https://powervirtualagents.microsoft.com/blog/custom-analytics-solution-for-power-virtual-agents/) to get analytics in these plans.

### Analytics in Power Virtual Agents

In Power Virtual Agents, in the navigation menu, select **Analytics**.

Conversation transcripts are available immediately. Analytics are updated every hour.

# [Web app](#tab/web)

### Analytics in Power Virtual Agents

The analytics section is divided into a number of pages to give you multiple ways to understand bot performance.

The following terms are used in this section.

- A _conversation_ is an ongoing interaction between a specific user, or group of users, on a channel and your bot. Conversations can pause and resume later, or be transferred to a live agent. The conversation may be one-way, either from the end user to the bot, or from the bot to the end user, but is more commonly a back-and-forth interaction between the end user and the bot.
- _Analytics sessions_ track user engagement for your bot. Analytics sessions try to capture how well your bot handles user tasks.
- _Billed sessions_ are used to measure resource consumption. Billed sessions are independent of analytics sessions.

> [!NOTE]
> Although transcripts are available immediately, the analytics dashboards are updated every hour, so there will be some delay before you see all data.

### View analytics

There are two options for viewing analytics, depending upon whether you're using the Web app or the Teams app.

In the *Web app*, from the navigation menu, select **Analytics**.

:::image type="content" source="media/analytics-overview/analytics-open.png" alt-text="Opening the Analytics dashboard." border="false":::

In *Microsoft Teams*, from the navigation menu, select **Analytics**.

:::image type="content" source="media/analytics-overview/analytics-open-teams.png" alt-text="Opening the Analytics dashboard in Teams":::

---

## Related topics

| Topic                                                              | Description                                                                                                |
|--------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| [Analyze bot performance and usage](analytics-summary.md)          | Review overall analytics for your bots.                                                                    |
| [Analyze customer satisfaction](analytics-csat.md)                 | Identify overall trends in customer satisfaction, and where satisfaction is falling behind.                |
| [Analyze topic usage](analytics-topic-details.md)                  | See how individual topics are doing and how well they're working at resolving issues.                      |
| [Analyze session information](analytics-sessions.md)               | Review and monitor how sessions are doing, including analytics from the topics triggered during a session. |
| [Analyze billed session information](analytics-billed-sessions.md) | Understand how sessions are being billed, based on their usage.                                            |


[!INCLUDE[footer-include](includes/footer-banner.md)]
