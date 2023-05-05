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

# Analyze session information in Power Virtual Agents

By default, you can download up to seven days of bot conversation transcript sessions from the past 30 days directly from the Power Virtual Agents portal.

You can also download and view chat transcripts in the Power Apps portal.

See [Work with conversation transcripts](analytics-sessions-transcripts.md) for more details and tips.

Lastly, you can manage the retention period for transcripts. This can be useful if you want to increase the date range from 30 days to something else.

> [!NOTE]
> If you no longer have access to your environment, you'll need to [create a support request](https://admin.powerplatform.microsoft.com/support) in the Microsoft Power Platform admin center.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).


# [Preview](#tab/preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

### Download bot session transcripts

1. In the Power Virtual Agents navigation menu, select **Analytics**.

1. Select the **Sessions** tab.

    If your bot has many sessions, they're displayed in multiple rows. Each row contains up to 2,500 sessions.

1. Select a row to download.

    :::image type="content" source="media/analytics-sessions/analytics-sessions-billing.png" alt-text="Screenshot of the Sessions page in Power Virtual Agents analytics, with a session highlighted.":::

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


# [Web app](#tab/web)

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
>
> Sessions may be grouped into multiple date ranges for download when the selected time window does not include the most recent day or when there are more than 2,500 sessions.

### View and export bot conversation transcripts from the Power Apps portal

You can also view and export bot conversation transcripts from the Power Apps portal.

First, you'll need to sign in to [https://www.powerapps.com](https://www.powerapps.com) with your credentials.

### View conversation transcripts

1. In the side pane select the **Tables** node. At the top, select **All**.

    :::image type="content" source="media/analytics-sessions/view-scripts1.png" alt-text="Screenshot showing All selected on the Tables node.":::

1. Type **Conversation** in the **Search** textbox on the top right. Select **ConversationTranscript** under **Tables**.

    :::image type="content" source="media/analytics-sessions/view-scripts2.png" alt-text="Screenshot showing Conversation Transcript selected.":::

1. A page for the **ConversationTranscript** table will open and show a list of data available to view.

    :::image type="content" source="media/analytics-sessions/view-scripts3.png" alt-text="Screenshot showing Active conversation transcripts expanded.":::

### Export conversation transcripts

1. In the side pane, select the **Tables** node. At the top, select **All**.

    :::image type="content" source="media/analytics-sessions/export-scripts1.png" alt-text="Select All on the Tables node.":::

1. Type **Conversation** in the **Search** textbox at the top right. Select **ConversationTranscript** under **Tables**.

    :::image type="content" source="media/analytics-sessions/export-scripts2.png" alt-text="Select the transcript for export.":::

1. Expand the **Export** menu item at the top of the screen and select **Export data**. It may take a few minutes for the data to be compiled for export.

    :::image type="content" source="media/analytics-sessions/export-scripts3.png" alt-text="Selecting Export data from the Export menu.":::

1. Select **Download exported data** to download the content.

    :::image type="content" source="media/analytics-sessions/export-scripts4.png" alt-text="Download exported data.":::

### Change the default period of session transcript retention

By default, a pre-configured bulk delete job will remove all conversation transcripts older than 30 days.

To keep the transcripts for longer, you need to disable the existing system job and create a new job.

First, you'll need to sign in to [https://www.powerapps.com](https://www.powerapps.com) with your credentials.

The following instructions describe how to set a job to delete transcripts that are older than 12 months.

1. At the top right, open the **Settings** menu cog icon and select **Advanced settings**.

    :::image type="content" source="media/analytics-sessions/sessions-advanced.png" alt-text="Select the cog icon to open the settings menu.":::

    This will take you to the Dynamics 365 portal.

    :::image type="content" source="media/analytics-sessions/sessions-d365.png" alt-text="The Dynamics 365 portal.":::

1. Open the **Settings** menu and select **Data Management**.

    :::image type="content" source="media/analytics-sessions/sessions-d365-settings.png" alt-text="The settings link at the top shows a number of objects, including Data Management.":::

1. Select **Bulk Record Deletion**.

    :::image type="content" source="media/analytics-sessions/sessions-bulk-delete.png" alt-text="An icon showing a table with a red x, indicating the deletion of a bulk record.":::

1. On the **Bulk Record Deletion** screen, expand the **View** dropdown and select **Recurring Bulk Deletion System Jobs**.

    :::image type="content" source="media/analytics-sessions/sessions-recurring.png" alt-text="The dropdown opens to show options.":::

1. Select the pre-configured bulk delete job called **Bulk Delete Conversation Transcript Records Older Than 1 Month**.

    :::image type="content" source="media/analytics-sessions/sessions-pre-configured.png" alt-text="A list of bulk delete jobs, with the first one highlighted.":::

1. In the **More Actions** dropdown, select **Cancel** to disable future bulk deletion using this job.

    :::image type="content" source="media/analytics-sessions/sessions-actions-cancel.png" alt-text="The more actions dropdown opens to show a menu list, including Cancel.":::

1. Create a new bulk record delete job by selecting **New** and set the following:

    - Set **ConversationStartTime** as **Older Than X Months** to **12**.  
    This will keep the transcripts for 12 months
    - Set **SchemaType** as **equals** to **powervirtualagents**.

        :::image type="content" source="media/analytics-sessions/sessions-schema.png" alt-text="A popup window showing options to configure the job.":::

1. Enter a name and change **Run this job after every** to **1**.

    :::image type="content" source="media/analytics-sessions/sessions-run-job.png" alt-text="A popup window showing options to name and run the job.":::

    The bulk delete job is created and will delete bot conversation transcripts that are older than 12 months.

    :::image type="content" source="media/analytics-sessions/sessions-job-ready.png" alt-text="The list of bulk delete jobs, now showing the new job just created.":::


# [Teams](#tab/teams)

1. In the navigation menu, select **Analytics** and go to the **Sessions** tab.

    If your bot had a high number of sessions, they'll be broken down into multiple rows. Each row contains 2500 sessions.

1. Select each row to download the session transcripts for the specified time frame.

    :::image type="content" source="media/analytics-sessions/analytics-sessions-billing-teams.png" alt-text="Screenshot of the sessions download page in the Power Virtual Agents app in Teams.":::

> [!NOTE]
> You need to have sufficient permissions to download sessions. If you're using the Power Virtual Agents app in Teams, you need to be the **Team Owner**.

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

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
