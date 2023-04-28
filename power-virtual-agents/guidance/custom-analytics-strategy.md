---
title: "Custom Analytics strategy for Power Virtual Agents"
description: "Set of best practices on custom analytics for Power Virtual Agents"
author: athinesh
ms.date: 1/20/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.collection: virtual-agent
---

# Custom analytics strategy

Power Virtual Agents provides comprehensive [out-of-the-box analytics](/power-virtual-agents/preview/analytics-overview) that allow customers to understand a bot's usage and key performance indicators.

Customers can view reports related to:

- Performance and usage.
- Customer satisfaction.
- Session information.
- Topic usage.
- Billed sessions.

There are however situations where you want to take what is provided by default in Power Virtual Agents further, such as:

- A requirement to share analytics with non-makers/users.
- A requirement to report against conversation transcripts data for a period longer than the default last 30 days.
- A requirement for a report not covered in the out-of-the-box analytics.

## Power Virtual Agents analytics sample template report

To create custom analytics, our recommended approach is to start with the [Power Virtual Agents analytics sample template report](https://aka.ms/PVAAnalytics).
The sample template report is a set of open-source assets, distributed through GitHub, greatly accelerating the time it takes to create a report that renders in Power BI.

> [!WARNING]
> Before implementing it, it is critical that you understand that the solution is not part of the core Power Virtual Agents offering and will require configuration. The sample report is not supported by Microsoft, but you can raise issues in the GitHub repository.

The components used in the sample template report are detailed later in this article.

### Dataverse

#### Conversation transcripts data

The analytics shown in the Power Virtual Agents portal come from a data service residing within Power Virtual Agents. Usage data is also written to the associated Dataverse environment, in the [conversation transcripts](/power-virtual-agents/analytics-sessions-transcripts) table.

#### Retention periods

By default, both sources have a data retention of 30 days, but customers can [change the retention period for conversation transcripts in Dataverse](/power-virtual-agents/analytics-sessions#change-the-default-period-of-session-transcript-retention).

#### Power Virtual Agents Dataverse tables

The important tables used for custom analytics are as follows in Dataverse:

- [**Chatbot**](/power-apps/developer/data-platform/reference/entities/bot) (`Bot`) – details of each bot in an environment. Generally a small amount of data.
- [**Chatbot Subcomponent**](/power-apps/developer/data-platform/reference/entities/botcomponent) (`BotComponent`) – Topics, entities, and dialogs associated with the bot in your environment. Generally a small amount of data.
- [**Conversation Transcripts**](/power-apps/developer/data-platform/reference/entities/conversationtranscript) (`ConversationTranscript`) – the detailed conversation for all the chatbots in your environment. Data size is related to amount of bot usage and can be large.

### Azure Synapse Link for Dataverse (Azure Data Lake Storage Gen2)

When bots generate large volumes of conversation transcripts (roughly more than 10k sessions/month, representing more than 80 MB of transcript data), the recommended approach is to export bot data to an Azure Data Lake Storage Gen2 using the [Azure Synapse Link for Dataverse](/power-apps/maker/data-platform/export-to-data-lake) feature. This approach has the benefit of offloading data from Dataverse database storage in a cheaper data lake storage. It also retains large volumes conversation transcripts for long periods.

The export creates an incremental sync of configured Dataverse tables in the Azure data lake, using the Common Data Model format.

There's some work on top of the base template:

- [Create an Azure Data Lake Storage Gen2 and connect it to Dataverse](/power-apps/maker/data-platform/azure-synapse-link-synapse).
- During configuration, select the ConversationTranscript table (Chatbot and Chatbot Subcomponent don't support incremental).
- [Follow the guidance](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/CustomAnalytics/DataFlowVersion) for setting up Power BI dataflows  to process the incoming data.

> [!WARNING]
> By default, Azure Synapse Link for Dataverse mirrors the configured table data from Dataverse to the Azure data lake. So, any record that gets deleted in Dataverse (for example by the recurring bulk delete job that deletes conversation transcripts older than 30 days by default) also get removed from the Azure data lake. To work around this, you can create copies / snapshots of  your data in the Azure data lake, or you can configure the synchronization to use the [append-only](/power-apps/maker/data-platform/azure-synapse-link-advanced-configuration#in-place-updates-vs-append-only-writes) mode.

### Power BI

The custom analytics solution template includes a Power BI report that processes the raw transcript data (using Power Query) into to a report matching the Powe Virtual Agents default analytics.
In addition, users have access to:

- Data for all chatbots in an environment
- Data as far back as the feed provides (in Dataverse or in the Azure Data Lake Storage Gen2)
- Raw data tables extracted from the Conversation Transcript table data – which can be used to create custom reports.
- A transcript viewer, allowing users to see the actual conversations that occurred.

> [!WARNING]
> This a complex report that performs significant transformations on the base data. Customers with Conversation Transcript tables greater than 80MB should look to use the Azure Synapse Link for Datavrse and Power BI dataflows version of the report.
