---
ROBOTS: NOINDEX,NOFOLLOW
title: Download bot session transcripts
description: Download bot sessions from the last 30 days for further analysis.
keywords: "PVA"
ms.date: 06/01/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: analysis, ceX
ms.collection: virtual-agent
---

# Download your bot session transcripts

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

You can download bot session or conversation transcripts from the past 30 days in both Power Virtual Agents and Power Apps. If you want to change the retention period for transcripts from the default 30 days, you can do that, too.

> [!NOTE]
> If you no longer have access to your environment, you'll need to [create a support request](https://admin.powerplatform.microsoft.com/support) in the Power Platform admin center.

## Download session transcripts in Power Virtual Agents

1. In the left side panel, select **Analytics**. Select the **Sessions** tab.

    If your bot has many sessions, they're broken down into multiple rows. Each row contains 2,500 sessions.

1. Select a row to download the session transcripts for the specified time frame.

    :::image type="content" source="media/analytics-sessions/analytics-sessions-billing.png" alt-text="Screenshot of the Analytics > Sessions page, with a session highlighted.":::

The download starts when you select the time period. The file is saved to your browser's default download location.

The session transcript is a CSV (comma-separated values) file that contains the following information:

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

## Download conversation transcripts in Power Apps

1. In the left side panel, select **Dataverse**, and then select **Tables**.

1. Select **All**. In the search box at the upper-right, type **Conversation**.

1. Select the **ConversationTranscript** table.

    :::image type="content" source="media/analytics-sessions/powerapps-tables-view.png" alt-text="Screenshot of the Power Apps window with the ConversationTranscript table highlighted.":::

1. Select **Export**, and then select **Export data**.

    :::image type="content" source="media/analytics-sessions/powerapps-tables-export.png" alt-text="Screenshot of the ConversationTranscript table Export data option.":::

    Allow a couple of minutes for Power Apps to prepare the data for export.

1. Select **Download exported data**.

    :::image type="content" source="media/analytics-sessions/powerapps-table-download.png" alt-text="Screenshot of the Download exported data link in Power Apps.":::

The file is saved as a zipped archive to your browser's default download location.

The conversation transcript is a CSV (comma-separated values) file. Learn about [working with conversation transcripts exported from Power Apps](analytics-sessions-transcripts.md).

## Change the default retention period

The default bulk delete job automatically removes conversation transcripts that are older than 30 days. To keep the transcripts longer, cancel the existing job and create a new one that runs on a different schedule. You'll need to do this in Power Apps.

First, sign in to [https://www.powerapps.com](https://www.powerapps.com).

### Cancel the existing bulk delete job

1. At the upper-right, select the **Settings** cog icon, and then select **Advanced settings**.

    :::image type="content" source="media/analytics-sessions/sessions-advanced.png" alt-text="Screenshot of the Power Apps Settings menu with Advanced settings highlighted.":::

    The Dynamics 365 portal opens in a new tab.

    :::image type="content" source="media/analytics-sessions/sessions-d365.png" alt-text="Screenshot of the Dynamics 365 portal.":::

1. Select the caret next to **Settings**, and then under **System** select **Data Management**.

    :::image type="content" source="media/analytics-sessions/sessions-d365-settings.png" alt-text="Screenshot of the Settings menu, with Data Management highlighted.":::

1. Select **Bulk Record Deletion**.

    :::image type="content" source="media/analytics-sessions/sessions-bulk-delete.png" alt-text="Screenshot of the Data Management page, with the Bulk Record Deletion option highlighted.":::

1. In the **View** list, select **Recurring Bulk Deletion System Jobs**.

    :::image type="content" source="media/analytics-sessions/sessions-recurring.png" alt-text="Screenshot of the list of recurring bulk deletion jobs.":::

1. Select the **Bulk Delete Conversation Transcript Records Older Than 1 Month** job.

    :::image type="content" source="media/analytics-sessions/sessions-pre-configured.png" alt-text="Screenshot of a list of bulk delete jobs, with the first one highlighted.":::

1. In the **More Actions** list, select **Cancel**.

    :::image type="content" source="media/analytics-sessions/sessions-actions-cancel.png" alt-text="Screenshot of the More actions list, with Cancel highlighted.":::

### Create a new bulk delete job

1. Select **New** and then select **Next** to start the Bulk Deletion Wizard.

1. Set the following search criteria:

    - In the **Look for** list, select **ConversationTranscripts**.
    - Select **ConversationStartTime**, select **Older Than X Months**, and type **12**.  
    This setting keeps the transcripts for 12 months. Choose a different comparison and value if you like.
    - Select **SchemaType**, leave **equals**, and type **powervirtualagents**.

    :::image type="content" source="media/analytics-sessions/sessions-schema.png" alt-text="Screenshot of the bulk delete job search criteria settings.":::

1. Select **Next**.

1. Enter a name for the job, select **Run this job after every**, and enter **1**.  
    Choose a different schedule if you don't want the job to run every day.

    :::image type="content" source="media/analytics-sessions/sessions-run-job.png" alt-text="Screenshot of the bulk delete job name and run settings.":::

1. Select **Next**, and then select **Submit**.

    :::image type="content" source="media/analytics-sessions/sessions-submit.png" alt-text="Screenshot of the completed bulk delete job wizard.":::

[!INCLUDE[footer-include](includes/footer-banner.md)]
