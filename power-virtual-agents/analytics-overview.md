---
title: "Fundamentals - Analyze chatbot usage (contains video)"
description: "Analyze customer satisfaction, topic usage, and bot performance in Microsoft Copilot Studio."
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

# Key concepts – Analytics in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Microsoft Copilot Studio has a comprehensive set of analytics that show you the key performance indicators for your bot.

> [!NOTE]
> Conversation transcripts in Dataverse are unavailable for download on the Microsoft Copilot Studio app in Teams. To review and export transcripts in Dataverse, you'll need to sign up for the [Microsoft Copilot Studio web app](requirements-licensing-subscriptions.md). Session chat transcripts can be downloaded via the Microsoft Copilot Studio app. For more details, refer to [Download bot session transcripts](analytics-sessions.md#download-bot-session-transcripts).

Multiple charts show you trends and usage for your bot's topics. These charts use AI to highlight the topics that have the greatest impact on your bot's performance.

>
> [!VIDEO https://www.microsoft.com/videoplayer/embed/RE4mNOu]
>

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


As a bot maker, your job isn't done when you publish your bot for use. You'll want to know how well your bot is performing its intended duties. The comprehensive analytics in Microsoft Copilot Studio keep your bot's key performance indicators front and center. Multiple charts show trends and usage for your bot's topics. These charts use AI to highlight the topics that have the greatest effect on your bot's performance.

### Analytics in Microsoft Copilot Studio

In Microsoft Copilot Studio, in the navigation menu, select **Analytics**.

The analytics section is divided into a number of pages to give you multiple ways to understand bot performance.

The following terms are used in this section.

- A _conversation_ is an ongoing interaction between a specific user, or group of users, on a channel and your bot. Conversations can pause and resume later, or be transferred to a live agent. The conversation may be one-way, either from the end user to the bot, or from the bot to the end user, but is more commonly a back-and-forth interaction between the end user and the bot.
- _Analytics sessions_ track user engagement for your bot. Analytics sessions try to capture how well your bot handles user tasks.
- _Billed sessions_ are used to measure resource consumption. Billed sessions are independent of analytics sessions.

> [!NOTE]
> Transcripts are available for download about 20 minutes after an analytic session _ends_, as conversation transcripts in Dataverse via the Power Apps portal and as session chat transcripts via the Microsoft Copilot Studio app. It can take up to an hour after the analytic session _ends_  before the appearing in the analytics dashboard.

> [!Note]
> In the classic version of Microsoft Copilot Studio, conversation transcripts in Dataverse are available approximately 6 hours after the analytic session _starts_.

> [!NOTE]
> Bot analytics in Microsoft Copilot Studio US Government Cloud plans will be released at a later date. In the meantime, you can use a [custom analytics solution to create a Power BI dashboard](https://powervirtualagents.microsoft.com/blog/custom-analytics-solution-for-power-virtual-agents/) to get analytics in these plans.

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
| [Work with conversation transcripts](analytics-sessions-transcripts.md)                         | Export conversation transcripts from Dataverse and create custom reports.                                  |

[!INCLUDE[footer-include](includes/footer-banner.md)]
