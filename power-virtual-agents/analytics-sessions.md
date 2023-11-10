---
title: "Download chatbot sessions"
description: "Download sessions from the last 30 days for your bot conversations."
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.custom: analysis, ceX
ms.service: power-virtual-agents
ms.collection: virtual-agent
---

# Analyze session information in Microsoft Copilot Studio

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

By default, you can download up to seven days of bot chat transcript sessions from the past 30 days directly from the Microsoft Copilot Studio portal.

You can also download and view conversation transcripts in the Power Apps portal.

See [Work with conversation transcripts](analytics-sessions-transcripts.md) for more details and tips.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


### Download bot session transcripts

1. In the Microsoft Copilot Studio navigation menu, select **Analytics**.

1. Select the **Sessions** tab.

    If your bot has many sessions, they're displayed in multiple rows. Each row contains up to 2,500 sessions.

1. Select a row to download.

    :::image type="content" source="media/analytics-sessions/analytics-sessions-billing.png" alt-text="Screenshot of the Sessions page in Microsoft Copilot Studio analytics, with a session highlighted.":::

The download starts immediately. The file is saved to your browser's default download location.

### Work with session transcripts

The session transcript is a comma-separated values (CSV) file that contains the following information:

- **SessionID**: The session's unique identifier
- **StartDateTime**: The time the session started (by default, sessions are sorted by this column in descending order)
- **InitialUserMessage**: The first message the user typed
- **TopicName**: The name of the last authored topic that was triggered in the session
- **ChatTranscript**: The transcript of the session in the format **User says: ; Bot says: ;**  
    For example:

    ```text
    User says: store hours; Bot says: Which store are you asking about?; User says: Bellevue; Bot says: Bellevue store is open from 10am to 7pm every day.;
    ```

    **Bot says** doesn't include the options presented to the user.

- **SessionOutcome**: The outcome of the session (Resolved, Escalated, Abandoned, Unengaged)
- **TopicId**: The unique identifier of the last authored topic triggered in the session

1. In the navigation menu, select **Analytics**. Go to the **Sessions** tab.

    If your bot had a high number of sessions, they'll be broken down into multiple rows. Each row contains 2500 sessions.

1. Select each row to download the session transcripts for the specified time frame.

    :::image type="content" source="media/analytics-sessions/analytics-sessions-billing.png" alt-text="Sessions page." border="false":::

The downloaded file contains the following information:

- SessionID: A unique identifier per session.
- StartDateTime: Time at which the session started. Entries are sorted by this column in descending order.
- InitialUserMessage: First message typed by the user.
- TopicName: Name of the last authored topic that was triggered in this session.
- ChatTranscript: Transcript of the session in the following format, `User says: <message-text>; Bot says: <message-text>;`.
  - Conversation turns are separated by semicolons
  - _Bot says_ doesn't include the options presented to the user.

    Example:

    ```text
    User says: store hours; Bot says: Which store are you asking about?; User says: Bellevue; Bot says: Bellevue store is open from 10am to 7pm every day.;
    ```

- SessionOutcome: Outcome of the session (Resolved, Escalated, Abandoned, Unengaged).

- TopicId: A unique identifier of the last authored topic triggered in this session.

> [!NOTE]
> The download will start when you select the time period. It will be downloaded into your default browser download's location.
