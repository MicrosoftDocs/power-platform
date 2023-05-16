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

You can download transcripts of customer interactions with your bot in both Power Apps and Power Virtual Agents. The information that each app exports is slightly different. This article covers downloading conversation transcripts in Power Apps and using them to create reports in Power BI. [Download bot session transcripts in Power Virtual Agents](analytics-sessions.md).

By default, Power Apps downloads conversation transcripts from the last 30 days. [You can change the retention period](#change-the-default-retention-period).

> [!NOTE]
> If you no longer have access to your environment, you'll need to [create a support request](https://admin.powerplatform.microsoft.com/support) in the Power Platform admin center.

## Prerequisites

- [Learn more about what you can do with Power Virtual Agents](fundamentals-what-is-power-virtual-agents.md).


# [Preview](#tab/preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

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
| Name | The name of the custom row that's created from `ConversationId` followed by `BotId` | `8YYe8iif49ZKkycZLe7HUO-o_198eca5f-xxxx-4ae6-8c08-835d884a8688` |
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
| `ConversationInfo`  | Whether the conversation is from the Power Virtual Agents test pane (`isDesignMode`) and the locale of the conversation |
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


# [Web app](#tab/web)

### Conversation transcripts fields

The following are the most relevant to chatbots created with Power Virtual Agents:

| Field                         | Description                                                                                            | Example                                                                                                                           |
| ----------------------------- | ------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------- |
| _Content_                     | The entire transcript in JSON format.                                                                  | See the [Content field](#content-field) section.                                                                                  |
| _ConversationStartTime_       | The start time of the conversation (not the time the transcript record was written to the data store). | `2021-04-19T20:39:09Z`                                                                                                            |
| _Conversationtranscript_      | Unique identifier for the data row in the Dataverse table.                                             | `28eccb77-xxxx-4a63-985f-ffaaadd6f391`                                                                                            |
| _Metadata_                    | JSON that includes the `Bot Id`, `Tenant Id`, and `Bot Name`.                                          | `{"BotId": "198eca5f-xxxx-4ae6-8c08-835d884a8688", "AADTenantId": "72f988bf-xxxx-41af-91ab-2d7cd011db47", "BotName": "Test Bot"}` |
| _Name_                        | The name of the custom row that is created from the `conversationid`, followed by `botid`.             | `8YYe8iif49ZKkycZLe7HUO-o_198eca5f-xxxx-4ae6-8c08-835d884a8688`                                                                   |
| _bot\_conversationtranscript_ | The bot's ID.                                                                                          | `198eca5f-xxxx-4ae6-8c08-835d884a8688`                                                                                            |
| _Created on_                  | Date and time when the transcript record was created.                                                  | `2021-04-20T02:40:13Z`                                                                                                            |

### Content field

The _Content_ field is a raw log of all the activities users have with the bot. Common activity types include _message_ and _event_:

- _Message_ activities represent content shown within a conversation. _Message_ activities may contain text, speech, interactive cards, and binary or unknown attachments.
- _Event_ activities communicate programmatic information from a client or channel to a bot.

For more information on activity types, see the [Bot Framework Activity schema](https://github.com/Microsoft/botframework-sdk/blob/master/specs/botframework-activity/botframework-activity.md).

The following are some of the key fields you will find within the _Content_ JSON:

| **Key**       | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ID`          | Unique GUID to identify the activity object.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| `valueType`   | Indicator of the type of value stored in the activity. This indicator dictates what information is being provided by this activity.</br>See [Common activity value types](#common-activity-value-types).                                                                                                                                                                                                                                                                                                                                                                                     |
| `timestamp`   | Timestamp of when the activity was generated in Epoch format (number of seconds since midnight UTC Jan 1, 1970).                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `type`        | The type of activity (for example, `message`, `event`, `trace`).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `replyToId`   | The ID of the activity that the current activity is responding to.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `from`        | Contains fields `id` and `role`:</br><ul><li>`id` - the ID of the invoker</li><li>`role` - holds 0 or 1</li><ul><li>0 - activity is coming from bot</li><li>1 - activity is coming from the user interacting with the bot</li></ul></ul>Notes: </br>The `id` can be used to calculate the number of active users that are interacting with the bot if the canvas is passing in a unique ID of the user. If the canvas doesn't pass an ID, a unique ID per conversation is passed. </br>The ID is hashed before being written to the transcript for security and privacy considerations.</br> |
| `channelId`   | ID of where the activity is coming from (for example, `directline`, `msteams`, `facebook`).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| `textFormat`  | Format of the text (for example, `plain`, `markdown`).                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| `attachments` | Holds dynamic rich data associated with the activity</br>(for example, `AdaptiveCards`, `HeroCards`, `Carousel data`)                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `text`        | The text for `message` activities.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| `value`       | Fields specific to the activity based on the value type, this field is where most of the useful information exists.                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `channeldata` | <ul><li>Contains channel data:<ul><li>for messages:<ul><li>`DialogTraceDetail`</li><li>`DialogErrorDetail`</li><li>`VariableDetail`<ul><li>Contains the value assigned to a variable.</li></ul></li><li>`CurrentMessageDetail`</li></ul></li><li>for events:<ul><li>`cci_trace_id`</li><li>`traceHistory`</li><li>`enableDiagnostics`</li><li>`clientTimestamp`</li><li>`clientActivityId`</li></ul></li></ul>                                                                                                                                                                               |
| `name`        | Name of the event activity (for example, `SetPVAContext`)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

#### Common activity value types

| **Activity value type** | **Description**                                                                                                                                                                 |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `ConversationInfo`      | Contains whether the conversation is from the Power Virtual Agents app's test pane (`isDesignMode`) and the locale of the conversation.                                         |
| `CSATSurveyRequest`     | User is presented with a customer satisfaction (CSAT) survey.                                                                                                                   |
| `CSATSurveyResponse`    | User responds to a CSAT survey.                                                                                                                                                 |
| `DialogRedirect`        | User is redirected to another topic.                                                                                                                                            |
| `ImpliedSuccess`        | User has reached a question node in the topic, where one of the conditions points to the "Confirmed Success" CSAT system topic or calls the "End of Conversation" system topic. |
| `IntentRecognition`     | A topic was triggered by the user.                                                                                                                                              |
| `PRRSurveyRequest`      | The user was asked if the topic answered their question from the "End of Conversation" topic.                                                                                   |
| `PRRSurveyResponse`     | The user's response to whether the topic answered their question from the "End of Conversation" topic.                                                                          |
| `SessionInfo`           | Contains the type (`unengaged` or `engaged`), outcome (`Escalated`, `Resolved`, `Abandon`), and the turn count of the session.                                                  |
| `VariableAssignment`    | A value has been assigned to a variable.                                                                                                                                        |

To convert the ID of the dialog being redirected to, a user can [use the bot's content](gdpr-export.md#bot-content-as-tenant-admin).

### Building custom reports from conversation transcripts

There are a few approaches one can take to build custom reports form conversation transcripts based on the number of messages that need to be processed.

### Lightweight approach

[Connect Power BI to Dataverse with a Power BI dataflow](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/CustomAnalytics). Other infrastructure isn't required and, with every refresh, all records will be retrieved from Dataverse.

:::image type="content" source="media/analytics-sessions-transcripts/transcripts-simple.png" alt-text="Diagram showing flow of data from Dataverse to the Power BI model.":::

| Pros                    | Cons                                                                                            |
| ----------------------- | ----------------------------------------------------------------------------------------------- |
| Easiest implementation. | Refresh time may increase as transcripts increase. </br>High cost for storage within Dataverse. |

### Standard Azure Data Lake Store approach

Export Dataverse data to Azure Data Lake Store.

This method requires an Azure Storage account, but no other Azure infrastructure.

Use a Power Platform dataflow for data preparation on the transcripts and extract the data into a structured form.

Power BI refreshes data from the Dataflow and all compute infrastructure is managed by Power Platform and Power BI. During every refresh, records for a certain day will be retrieved from Dataverse.

:::image type="content" source="media/analytics-sessions-transcripts/transcripts-adl.png" alt-text="Diagram showing the data flowing from Dataverse into Azure Data Lake and then being processed by Power Platform and Power BI.":::

| Pros                                                                                                              | Cons                                                        |
| ----------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| Low storage cost in Azure Data Lake Store. </br>Moderately simple implementation. </br>No Azure Compute required. | Refresh time may increase as transcripts each day increase. |

### Azure Data Lake Store (ADLS) + Synapse approach

If data size in the Standard Azure Data Lake Store approach causes slow refreshes or other operational problems, you can use [Azure Synapse Analytics](https://azure.microsoft.com/services/synapse-analytics/) and integrate it [into Power BI](https://powerbi.microsoft.com/blog/announcing-azure-synapse-analytics-public-preview/).

:::image type="content" source="media/analytics-sessions-transcripts/transcripts-asynapse.png" alt-text="Diagram of data flowing from Dataverse into Azure Data Lake and being processed by Azure Synapse and Power Platform.":::

| Pros                                                                                                             | Cons                            |
| ---------------------------------------------------------------------------------------------------------------- | ------------------------------- |
| Refresh time is constant. </br>Moderately simple implementation. </br>Low storage cost in Azure Data Lake Store. | Compute cost for Azure Synapse. |

### Tips for getting the most out of your conversation transcripts

[Variables can be used to store data relevant to your bot content](authoring-variables.md) or bot user. Parsing out the variable and its value from the conversation transcript lets you filter or slice the data by the variable

In many places the conversation transcripts refer to content by its ID. For example, the ID of the topic that is being redirected to by the current topic is only referenced by its ID. To get the name of the topic, look up the name of the topic [from the bot content](gdpr-export.md#bot-content-as-tenant-admin).

---

[!INCLUDE[footer-include](includes/footer-banner.md)]
