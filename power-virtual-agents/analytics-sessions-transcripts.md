---
title: "Understand conversation transcripts"
description: "Review the fields associated with chat conversation transcripts, and see how to pull the data into Power BI."
keywords: "PVA"
ms.date: 4/23/2021
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.cusom: analysis, ceX
ms.collection: virtual-agent
---


# Work with conversation transcripts

When you [export Power Virtual Agents chatbot conversation transcripts from Microsoft Dataverse](analytics-sessions.md), you will be presented with many fields. 

Each of these fields includes information relevant to the chatbot conversation. 

This topic lists the most important fields found in Power Virtual Agents conversation transcripts, and also provides guidance on bringing analytics information into Power BI with dataflows.


## Conversation transcripts fields

The following are the most relevant to chatbots created with Power Virtual Agents:

| Field | Description|Example
|-|-|-|
| *Content* | The entire transcript in JSON format.| See the [Content field](#content-field) section.
| *ConversationStartTime* | The start time of the conversation (not the time the transcript record was written to the data store). | `2021-04-19T20:39:09Z`
| *Conversationtranscript*| Unique identifier for the data row in the Dataverse table.| `28eccb77-xxxx-4a63-985f-ffaaadd6f391`
| *Metadata*| JSON that includes the `Bot Id`, `Tenant Id`, and `Bot Name`.| `{"BotId": "198eca5f-xxxx-4ae6-8c08-835d884a8688", "AADTenantId": "72f988bf-xxxx-41af-91ab-2d7cd011db47", "BotName": "Test Bot"}`
| *Name*| The name of the custom row that is created from the `conversationid`, followed by `botid`. | `8YYe8iif49ZKkycZLe7HUO-o_198eca5f-xxxx-4ae6-8c08-835d884a8688`
| *bot\_conversationtranscript* | The bot's ID.| `198eca5f-xxxx-4ae6-8c08-835d884a8688`
| *Created on*| Date and time when the transcript record was created.|`2021-04-20T02:40:13Z`

### Content field

The *Content* field is a raw log of all the activities users have with the bot. Common activity types include *message* and *event*:

-   *Message* activities represent content shown within a conversation. *Message* activities may contain text, speech, interactive cards, and binary or unknown attachments.

-   *Event* activities communicate programmatic information from a client or channel to a bot.

For more information on activity types, see the [Bot Framework Activity schema](https://github.com/Microsoft/botframework-sdk/blob/master/specs/botframework-activity/botframework-activity.md).

The following are some of the key fields you will find within the *Content* JSON:

| **Key** | **Description** |
|-------------------------|-------------------------|
| `ID` | Unique GUID to identify the activity object. |
| `valueType` | Indicator of the type of value stored in the activity. This indicator dictates what information is being provided by this activity.</br>See [Common activity value types](#common-activity-value-types). |
| `timestamp` | Timestamp of when the activity was generated in Epoch format (number of seconds since midnight UTC Jan 1, 1970). |
| `type` | The type of activity (for example, `message`, `event`, `trace`). |
| `replyToId` | The ID of the activity that the current activity is responding to. |
| `from` | Contains fields `id` and `role`:</br><ul><li>`id` - the ID of the invoker</li><li>`role` - holds 0 or 1</li><ul><li>0 - activity is coming from bot</li><li>1 - activity is coming from the user interacting with the bot</li></ul></ul>Notes: </br>The `id` can be used to calculate the number of active users that are interacting with the bot if the canvas is passing in a unique ID of the user. If the canvas doesn't pass an ID, a unique ID per conversation is passed. </br>The ID is hashed before being written to the transcript for security and privacy considerations.</br> |
| `channelId` | ID of where the activity is coming from (for example, `directline`, `msteams`, `facebook`). |
| `textFormat` | Format of the text (for example, `plain`, `markdown`). |
| `attachments` | Holds dynamic rich data associated with the activity</br>(for example, `AdaptiveCards`, `HeroCards`, `Carousel data`) |
| `text` | The text for `message` activities. |
| `value` | Fields specific to the activity based on the value type, this field is where most of the useful information exists. |
| `channeldata` | <ul><li>Contains channel data:<ul><li>for messages:<ul><li>`DialogTraceDetail`</li><li>`DialogErrorDetail`</li><li>`VariableDetail`<ul><li>Contains the value assigned to a variable.</li></ul></li><li>`CurrentMessageDetail`</li></ul></li><li>for events:<ul><li>`cci_trace_id`</li><li>`traceHistory`</li><li>`enableDiagnostics`</li><li>`clientTimestamp`</li><li>`clientActivityId`</li></ul></li></ul> |
| `name` | Name of the event activity (for example, `SetPVAContext`) |


#### Common activity value types 

| **Activity value type** | **Description**|
|-|-|
| `ConversationInfo` | Contains whether the conversation is from the Power Virtual Agents app's test pane (`isDesignMode`) and the locale of the conversation.|
| `CSATSurveyRequest` | User is presented with a customer satisfaction (CSAT) survey. |
| `CSATSurveyResponse`| User responds to a CSAT survey. |
| `DialogRedirect`| User is redirected to another topic.|
| `ImpliedSuccess`| User has reached a question node in the topic, where one of the conditions points to the "Confirmed Success" CSAT system topic or calls the "End of Conversation" system topic. |
| `IntentRecognition` | A topic was triggered by the user. |
| `PRRSurveyRequest`| The user was asked if the topic answered their question from the "End of Conversation" topic. |
| `PRRSurveyResponse` | The user's response to whether the topic answered their question from the "End of Conversation" topic. |
| `SessionInfo` | Contains the type (`unengaged` or `engaged`), outcome (`Escalated`, `Resolved`, `Abandon`), and the turn count of the session. |
| `VariableAssignment`| A value has been assigned to a variable.|

To convert the ID of the dialog being redirected to, a user can [use the bot's content](gdpr-export.md#export-the-bot-content).

## Building custom reports from conversation transcripts

There are a few approaches one can take to build custom reports form conversation transcripts based on the number of messages that need to be processed.

### Lightweight approach

[Connect Power BI to Dataverse with a Power BI dataflow](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/CustomAnalytics). Other infrastructure isn't required and, with every refresh, all records will be retrieved from Dataverse.

:::image type="content" source="media/analytics-sessions-transcripts/transcripts-simple.png" alt-text="Diagram showing flow of data from Dataverse to the Power BI model.":::

| Pros | Cons |
|-------------------------|-------------------------|
| Easiest implementation. | Refresh time may increase as transcripts increase. </br>High cost for storage within Dataverse.|


### Standard Azure Data Lake Store approach

Export Dataverse data to Azure Data Lake Store.

This method requires an Azure Storage account, but no other Azure infrastructure.

Use a Power Platform dataflow for data preparation on the transcripts and extract the data into a structured form.

Power BI refreshes data from the Dataflow and all compute infrastructure is managed by Power Platform and Power BI. During every refresh, records for a certain day will be retrieved from Dataverse.

:::image type="content" source="media/analytics-sessions-transcripts/transcripts-adl.png" alt-text="Diagram showing the data flowing from Dataverse into Azure Data Lake and then being processed by Power Platform and Power BI.":::

| Pros | Cons |
|-------------------------|-------------------------|
| Low storage cost in Azure Data Lake Store. </br>Moderately simple implementation. </br>No Azure Compute required. | Refresh time may increase as transcripts each day increase. |


### Azure Data Lake Store (ADLS) + Synapse approach

If data size in the Standard Azure Data Lake Store approach causes slow refreshes or other operational problems, you can use [Azure Synapse Analytics](https://azure.microsoft.com/services/synapse-analytics/) and integrate it [into Power BI](https://powerbi.microsoft.com/en-us/blog/announcing-azure-synapse-analytics-public-preview/).

:::image type="content" source="media/analytics-sessions-transcripts/transcripts-asynapse.png" alt-text="Diagram of data flowing from Dataverse into Azure Data Lake and being processed by Azure Synapse and Power Platform.":::

| Pros | Cons |
|-------------------------|-------------------------|
| Refresh time is constant. </br>Moderately simple implementation. </br>Low storage cost in Azure Data Lake Store. | Compute cost for Azure Synapse. |


## Tips for getting the most out of your conversation transcripts

[Variables can be used to store data relevant to your bot content](authoring-variables.md) or bot user. Parsing out the variable and its value from the conversation transcript lets you filter or slice the data by the variable

In many places the conversation transcripts refer to content by its ID. For example, the ID of the topic that is being redirected to by the current topic is only referenced by its ID. To get the name of the topic, look up the name of the topic [from the bot content](gdpr-export.md#export-the-bot-content).



[!INCLUDE[footer-include](includes/footer-banner.md)]
