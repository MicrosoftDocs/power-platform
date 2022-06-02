---
ROBOTS: NOINDEX,NOFOLLOW
title: Work with Power Apps bot conversation transcripts
description: Work with bot conversation transcripts exported from Power Apps and learn how to pull the data into Power BI.
keywords: "PVA"
ms.date: 06/01/2022
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: analysis, ceX
ms.collection: virtual-agent
---

# Work with Power Apps bot conversation transcripts

[!INCLUDE [Build 2022](includes/build-22-disclaimer.md)]

You can export bot session or conversation transcripts from both Power Virtual Agents and Power Apps. The information that each app exports is slightly different. We discussed the file that's exported from Power Virtual Agents here: [Download session transcripts in Power Virtual Agents](analytics-sessions.md#download-session-transcripts-in-power-virtual-agents). This article covers [conversation transcripts that you export from Power Apps](analytics-sessions.md#download-conversation-transcripts-in-power-apps). We'll also provide guidance on bringing that information into Power BI with dataflows.

## Important fields in conversation transcripts

The following are the most important fields you'll find in your conversation transcripts:

| Field | Description | Example |
| --- | --- | --- |
| Content | The entire transcript in JSON format. | Refer to the [Content field](#content-field) section. |
| ConversationStartTime | The time the conversation started (not the time the transcript record was written to the data store). | `2021-04-19T20:39:09Z` |
| ConversationTranscript | The unique identifier of the row in the Dataverse table. | `28eccb77-xxxx-4a63-985f-ffaaadd6f391` |
| Metadata | JSON that includes the `Bot Id`, `Tenant Id`, and `Bot Name`. | `{"BotId": "198eca5f-xxxx-4ae6-8c08-835d884a8688", "AADTenantId": "72f988bf-xxxx-41af-91ab-2d7cd011db47", "BotName": "Test Bot"}` |
| Name | The name of the custom row that's created from the `conversationid` followed by `botid`. | `8YYe8iif49ZKkycZLe7HUO-o_198eca5f-xxxx-4ae6-8c08-835d884a8688` |
| Bot\_ConversationTranscript | The bot's ID. | `198eca5f-xxxx-4ae6-8c08-835d884a8688` |
| Created on | The date and time the transcript record was created. | `2021-04-20T02:40:13Z` |

### Content field

The Content field is a raw log of all the activities that users have with the bot. Common activity types include message and event:

- Message activities represent the content that's shown in a conversation. Message activities may contain text, speech, interactive cards, and binary or unknown attachments.
- Event activities communicate programmatic information from a client or channel to the bot.

For more information on activity types, see [Bot Framework Activity schema](https://github.com/Microsoft/botframework-sdk/blob/master/specs/botframework-activity/botframework-activity.md).

Some of the key fields you'll find in the Content JSON include:

| Key | Description |
| --- | --- |
| `ID` | The unique GUID of the activity object. |
| `valueType` | The type of value that's stored in the activity; it dictates what information the activity is providing. [Common activity value types](#common-activity-value-types). |
| `timestamp` | The timestamp of when the activity was generated, in Epoch format (the number of seconds since midnight UTC January 1, 1970). |
| `type` | The type of activity; for example, `message`, `event`, `trace`. |
| `replyToId` | The ID of the activity that the current activity is responding to. |
| `from` | Contains fields `id` and `role`:</br><ul><li>`id` - the ID of the invoker</li><li>`role` - holds 0 or 1</li><ul><li>0 - the activity is coming from the bot</li><li>1 - the activity is coming from the user interacting with the bot</li></ul></ul>Notes:</br>The `id` can be used to calculate the number of active users that are interacting with the bot if the canvas is passing in a unique ID of the user. If the canvas doesn't pass an ID, a unique ID per conversation is passed. </br>For security and privacy, the ID is hashed before it's written to the transcript. </br> |
| `channelId` | The ID of where the activity is coming from; for example, `directline`, `msteams`, `facebook`. |
| `textFormat`  | The format of the text; for example, `plain`, `markdown`. |
| `attachments` | Holds dynamic rich data associated with the activity; for example, `AdaptiveCards`, `HeroCards`, `Carousel data`. |
| `text` | The text for `message` activities. |
| `value` | Fields specific to the activity based on the value type; this field is where most of the useful information exists. |
| `channeldata` | <ul><li>Contains channel data:<ul><li>for messages:<ul><li>`DialogTraceDetail`</li><li>`DialogErrorDetail`</li><li>`VariableDetail` (contains the value assigned to a variable)</li></li><li>`CurrentMessageDetail`</li></ul></li><li>for events:<ul><li>`cci_trace_id`</li><li>`traceHistory`</li><li>`enableDiagnostics`</li><li>`clientTimestamp`</li><li>`clientActivityId`</li></ul></li></ul> |
| `name` | The name of the event activity; for example, `SetPVAContext`. |

#### Common activity value types

| **Activity value type** | **Description** |
| --- | --- |
| `ConversationInfo`  | Whether the conversation is from the Power Virtual Agents test pane (`isDesignMode`) and the locale of the conversation. |
| `CSATSurveyRequest`| The user is presented with a customer satisfaction (CSAT) survey. |
| `CSATSurveyResponse` | The user responds to a CSAT survey. |
| `DialogRedirect` | The user is redirected to another topic. |
| `ImpliedSuccess` | The user has reached a question node in the topic, where one of the conditions points to the "Confirmed Success" CSAT system topic or calls the "End of Conversation" system topic. |
| `IntentRecognition` | A topic was triggered by the user. |
| `PRRSurveyRequest` | The user was asked if the topic answered their question from the "End of Conversation" topic. |
| `PRRSurveyResponse` | The user's response to whether the topic answered their question from the "End of Conversation" topic. |
| `SessionInfo` | The type (`unengaged` or `engaged`), outcome (`Escalated`, `Resolved`, `Abandon`), and the turn count of the session. |
| `VariableAssignment` | A value has been assigned to a variable. |

You can use the bot's content to convert the ID of the dialog being redirected to.
<!-- Can you provide more information and instructions about how to do this and why you might want to? -->

## Build custom reports from conversation transcripts

A useful way to approach building custom reports from conversation transcripts is to look at the number of messages that need to be processed.

### Lightweight approach

[Connect Power BI to Dataverse with a Power BI dataflow](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/CustomAnalytics). Other infrastructure isn't required and all records are retrieved from Dataverse with every refresh.

:::image type="content" source="media/analytics-sessions-transcripts/transcripts-simple.png" alt-text="Diagram showing the flow of data from Dataverse to the Power BI model.":::

| Pros | Cons |
| --- | --- |
| Easiest implementation. | Refresh time may increase as transcripts increase. </br>High cost for storage in Dataverse. |

### Standard Azure Data Lake Storage approach

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

## Tips for getting the most out of your conversation transcripts

[Variables can be used to store data relevant to your bot content](authoring-variables.md) or bot user. Parsing the variable and its value from the conversation transcript lets you filter or slice the data by the variable.

In many places, the conversation transcripts refer to content by its ID. For example, the ID of the topic that's being redirected to by the current topic is only referred to by its ID. To get the name of the topic, look up its name in the bot content.

[!INCLUDE[footer-include](includes/footer-banner.md)]
