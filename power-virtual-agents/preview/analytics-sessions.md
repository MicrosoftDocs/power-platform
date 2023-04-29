---
title: Download bot session transcripts in Power Virtual Agents (preview)
description: Download transcripts of your bot sessions from the last 30 days for further analysis in Power Virtual Agents preview.
keywords: "PVA"
ms.date: 01/23/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.custom: analysis, ceX, bap-template
ms.collection: virtual-agent
ms.service: power-virtual-agents
---

# Download bot session transcripts in Power Virtual Agents (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

You can download transcripts of customer interactions with your bot in both Power Virtual Agents and Power Apps. The information that each app exports is slightly different. This article covers downloading session transcripts in Power Virtual Agents. [Download bot conversation transcripts in Power Apps](../analytics-sessions-transcripts.md).

By default, you can download up to seven days of bot conversation transcript sessions from the past 30 days directly from the Power Virtual Agents portal.

You can also download and view chat transcripts in the Power Apps portal.

See [Work with conversation transcripts](analytics-sessions-transcripts.md) for more details and tips.

Lastly, you can manage the retention period for transcripts. This can be useful if you want to increase the date range from 30 days to something else.

> [!NOTE]
> If you no longer have access to your environment, you'll need to [create a support request](https://admin.powerplatform.microsoft.com/support) in the Power Platform admin center.

## Download bot session transcripts

1. In the Power Virtual Agents navigation menu, select **Analytics**.

1. Select the **Sessions** tab.

    If your bot has many sessions, they're displayed in multiple rows. Each row contains up to 2,500 sessions.

1. Select a row to download.

    :::image type="content" source="media/analytics-sessions/analytics-sessions-billing.png" alt-text="Screenshot of the Sessions page in Power Virtual Agents analytics, with a session highlighted.":::

The download starts immediately. The file is saved to your browser's default download location.

## Work with session transcripts

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

[!INCLUDE[footer-include](includes/footer-banner.md)]
