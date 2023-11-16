---
title: "Understand conversation transcripts"
description: "Review the fields associated with chat conversation transcripts, and see how to pull the data into Power BI."
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

# Work with conversation transcripts

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

You can view, export and download transcripts of customer interactions with your bot in both Power Apps and Microsoft Copilot Studio. The information that each app exports is slightly different. This article covers downloading conversation transcripts in Power Apps and using them to create reports in Power BI. [Download bot session transcripts in Microsoft Copilot Studio](analytics-sessions.md).

By default, Power Apps downloads conversation transcripts from the last 30 days. [You can change the retention period](#change-the-default-retention-period).

> [!NOTE]
> If you no longer have access to your environment, you'll need to [create a support request](https://admin.powerplatform.microsoft.com/support) in the Power Platform admin center.

## Prerequisites

- [Learn more about what you can do with Microsoft Copilot Studio](fundamentals-what-is-power-virtual-agents.md).


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

### Download bot conversation transcripts

1. In the Power Apps navigation menu, select **Dataverse**, and then select **Tables**.

1. Select **All**.

1. In the search box at the upper-right corner, type **conversation**.

1. Select the **ConversationTranscript** table.

    :::image type="content" source="media/analytics-sessions/powerapps-tables-view.png" alt-text="Screenshot of the Power Apps Tables page with the ConversationTranscript table highlighted.":::

1. Select **Export**, and then select **Export data**.

    :::image type="content" source="media/analytics-sessions/powerapps-tables-export.png" alt-text="Screenshot of the ConversationTranscript table Export data option.":::

1. Allow a couple of minutes for Power Apps to prepare the data for export. Select **Download exported data**.

The file is saved as a zipped archive to your browser's default download location.

### Work with conversation transcripts

The conversation transcript is a CSV (comma-separated values) file. The following table describes the most important fields in your conversation transcripts.

| Field | Description | Example |
| --- | --- | --- |
| Content | The entire transcript in JSON format | Refer to the [Content field](#content-field) section. |
| ConversationStartTime | The time the conversation started (not the time the transcript record was written to the data store) | `2021-04-19T20:39:09Z` |
| ConversationTranscript | The unique identifier of the row in the Dataverse table | `28eccb77-xxxx-4a63-985f-ffaaadd6f391` |
| Metadata | JSON that includes the bot ID, tenant ID, and bot name | `{"BotId": "198eca5f-xxxx-4ae6-8c08-835d884a8688", "AADTenantId": "72f988bf-xxxx-41af-91ab-2d7cd011db47", "BotName": "Test Bot"}` |
| Name | The name of the custom row that's created from `ConversationId` followed by `BotId` followed by a `batch number`. The batch number indicates the order when there are multiple analytic sessions for the conversation. Classic bots do not include the batch number. | `8YYe8iif49ZKkycZLe7HUO-o_198eca5f-xxxx-4ae6-8c08-835d884a8688_0` |
| Bot_ConversationTranscript | The bot ID | `198eca5f-xxxx-4ae6-8c08-835d884a8688` |
| Created on | The date and time the transcript record was created | `2021-04-20T02:40:13Z` |

### Content field

The Content field is a raw log of all the activities that users had with the bot. Common activity types include message and event:

- Message activities represent the content that's shown in a conversation. Message activities may contain text, speech, interactive cards, and binary or unknown attachments.
- Event activities communicate programmatic information from a client or channel to the bot.

For more information on activity types, see [Bot Framework Activity schema](https://github.com/Microsoft/botframework-sdk/blob/master/specs/botframework-activity/botframework-activity.md).

The following table describes some of the key fields in the Content JSON:

| Key | Description |
| --- | --- |
| `ID` | The unique GUID of the activity object |
| `valueType` | The type of value that's stored in the activity; dictates what information the activity is providing ([Common activity value types](#common-activity-value-types)) |
| `timestamp` | The timestamp of when the activity was generated, in Epoch format (the number of seconds since midnight UTC January 1, 1970) |
| `type` | The type of activity; for example, `message`, `event`, or `trace` |
| `replyToId` | The ID of the activity that the current activity is responding to |
| `from` | Contains fields `id` and `role`:</br><ul><li>`id` - the ID of the invoker</li><li>`role` - holds 0 or 1</li><ul><li>0 - the activity is coming from the bot</li><li>1 - the activity is coming from the user interacting with the bot</li></ul></ul>Notes:</br>The `id` can be used to calculate the number of active users that are interacting with the bot if the canvas is passing in a unique ID of the user. If the canvas doesn't pass an ID, a unique ID per conversation is passed. </br>For security and privacy, the ID is hashed before it's written to the transcript.</br> |
| `channelId` | The ID of where the activity is coming from; for example, `directline`, `msteams`, or `facebook` |
| `textFormat`  | The format of the text; for example, `plain` or `markdown` |
| `attachments` | Dynamic rich data associated with the activity; for example, `AdaptiveCards`, `HeroCards`, or `Carousel data` |
| `text` | The text for `message` activities |
| `value` | Fields specific to the activity based on the value type; this field is where most of the useful information exists |
| `channeldata` | <ul><li>Contains channel data:<ul><li>for messages:<ul><li>`DialogTraceDetail`</li><li>`DialogErrorDetail`</li><li>`VariableDetail` (contains the value assigned to a variable)</li></li><li>`CurrentMessageDetail`</li></ul></li><li>for events:<ul><li>`cci_trace_id`</li><li>`traceHistory`</li><li>`enableDiagnostics`</li><li>`clientTimestamp`</li><li>`clientActivityId`</li></ul></li></ul> |
| `name` | The name of the event activity; for example, `SetPVAContext` |

#### Common activity value types

| **Activity value type** | **Description** |
| --- | --- |
| `ConversationInfo`  | Whether the conversation is from the Microsoft Copilot Studio test pane (`isDesignMode`) and the locale of the conversation |
| `CSATSurveyRequest`| The user is presented with a customer satisfaction (CSAT) survey |
| `CSATSurveyResponse` | The user responds to a CSAT survey |
| `DialogRedirect` | The user is redirected to another topic |
| `ImpliedSuccess` | The user has reached a question node in the topic, where one of the conditions points to the "Confirmed Success" CSAT system topic or calls the "End of Conversation" system topic |
| `IntentRecognition` | A topic was triggered by the user |
| `PRRSurveyRequest` | The user was asked if the topic answered their question from the "End of Conversation" topic |
| `PRRSurveyResponse` | The user's response to whether the topic answered their question from the "End of Conversation" topic |
| `SessionInfo` | The type (`unengaged` or `engaged`), outcome (`Escalated`, `Resolved`, `Abandon`), and the turn count of the session |
| `VariableAssignment` | A value has been assigned to a variable |

### Build custom Power BI reports from conversation transcripts

A useful way to approach building custom reports from conversation transcripts is to look at the number of messages that need to be processed.

#### Lightweight approach

[Connect Power BI to Dataverse with a Power BI dataflow](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/CustomAnalytics). Other infrastructure isn't required and all records are retrieved from Dataverse with every refresh.

:::image type="content" source="media/analytics-sessions-transcripts/transcripts-simple.png" alt-text="Diagram showing the flow of data from Dataverse to the Power BI model.":::

| Pros | Cons |
| --- | --- |
| Easiest implementation. | Refresh time may increase as transcripts increase. </br>High cost for storage in Dataverse. |

#### Standard Azure Data Lake Storage approach

Export Dataverse data to Azure Data Lake Storage. This method requires an Azure Data Lake Storage account, but no other Azure infrastructure.

Use a Power Platform dataflow on the transcripts to prepare the data, and extract the data into a structured form.

Power BI refreshes data from the dataflow. Power Platform and Power BI manage all compute infrastructure. Records for a certain day are retrieved from Dataverse with every refresh.

:::image type="content" source="media/analytics-sessions-transcripts/transcripts-adl.png" alt-text="Diagram showing the data flowing from Dataverse into Azure Data Lake Storage and being processed by Power Platform and Power BI.":::

| Pros | Cons |
| --- | --- |
| Low storage cost in Azure Data Lake Storage. </br>Moderately simple implementation. </br>No Azure Compute required. | Refresh time may increase as transcripts increase each day. |

### Azure Data Lake Storage + Synapse approach

The data size in the Standard Azure Data Lake Storage approach can cause slow refreshes or other operational problems. In that case, you can use [Azure Synapse Analytics](https://azure.microsoft.com/services/synapse-analytics/) and integrate it [into Power BI](https://powerbi.microsoft.com/blog/announcing-azure-synapse-analytics-public-preview/).

:::image type="content" source="media/analytics-sessions-transcripts/transcripts-asynapse.png" alt-text="Diagram of data flowing from Dataverse into Azure Data Lake and being processed by Azure Synapse and Power Platform.":::

| Pros | Cons |
| --- | --- |
| Refresh time is constant. </br>Moderately simple implementation. </br>Low storage cost in Azure Data Lake Storage. | Compute cost for Azure Synapse. |

### Change the default retention period

A Power Apps bulk delete job automatically removes bot transcripts that are older than 30 days. To keep the transcripts longer, cancel the existing job and create a new one that runs on a different schedule.

### Cancel the existing bulk delete job

1. In Power Apps, in the upper-right corner, select the **Settings** cog icon, and then select **Advanced settings**.

    :::image type="content" source="media/analytics-sessions/sessions-advanced.png" alt-text="Screenshot of the Power Apps Settings menu with Advanced settings highlighted.":::

    The Dynamics 365 portal opens in a new tab.

1. Select the caret next to **Settings**, and then under **System**, select **Data Management**.

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

1. Select **New**, and then select **Next** to start the Bulk Deletion Wizard.

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

### Tips for getting the most out of your conversation transcripts

[Variables can be used to store data relevant to your bot content](authoring-variables.md) or bot user. Parsing the variable and its value from the conversation transcript lets you filter or slice the data by the variable.

In many places, the conversation transcripts refer to content by its ID. For example, the ID of the topic that's being redirected to by the current topic is only referred to by its ID. To get the name of the topic, look up its name in the bot content.

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
