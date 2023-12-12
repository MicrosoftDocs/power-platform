---
title: "Use custom analytics reports"
description: "Guidance for extending the use and scope of analytics data in Microsoft Copilot Studio by using a custom report template. Use your data with Dataverse, Azure data lake storage, and Power BI."
author: athinesh
ms.date: 5/11/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.reviewer: iawilt
ms.collection: virtual-agent
---

# Custom analytics strategy

[!INCLUDE[pva-rebrand](../includes/pva-rebrand.md)]


Microsoft Copilot Studio provides comprehensive [out-of-the-box analytics](/power-virtual-agents/preview/analytics-overview) that allow customers to understand a bot's usage and key performance indicators.


Customers can view reports related to:

- Performance and usage.
- Customer satisfaction.
- Session information.
- Topic usage.
- Billed sessions.

However, there are often scenarios where you need to create or use custom analytics.

For example, you might need to:

- Share analytics with stakeholders or users.
- Report on conversation transcripts data for a period longer than the default last 30 days.
- Design a report not covered by out-of-the-box analytics.


There are a few ways you can take the analytics data recorded by Microsoft Copilot Studio and use it in customized reports. 


## Microsoft Copilot Studio analytics sample template report

To create custom analytics, our recommended approach is to start with the [Microsoft Copilot Studio analytics sample template report](https://aka.ms/PVAAnalytics).
The sample template report is a set of open-source assets, distributed through GitHub, greatly accelerating the time it takes to create a report that renders in Power BI.

> [!WARNING]
>
> The solution is not part of the core Microsoft Copilot Studio offering and will require configuration. 
>   
> The sample report is not supported by Microsoft, but you can raise issues in the GitHub repository to get help from the community.

### Dataverse

#### Conversation transcripts data

The analytics shown in the Microsoft Copilot Studio portal come from a data service residing within Microsoft Copilot Studio. Usage data is also written to the associated Dataverse environment, in the [conversation transcripts](/power-virtual-agents/analytics-sessions-transcripts) table.

#### Retention periods

By default, both sources have a data retention of 30 days, but customers can [change the retention period for conversation transcripts in Dataverse](/power-virtual-agents/analytics-sessions#change-the-default-period-of-session-transcript-retention).

#### Microsoft Copilot Studio Dataverse tables

Microsoft Copilot Studio uses the following tables for custom analytics in Dataverse:

- [**Chatbot**](/power-apps/developer/data-platform/reference/entities/bot) (`Bot`). This table includes details of each bot in an environment. The details are often a small amount of data.
- [**Chatbot Subcomponent**](/power-apps/developer/data-platform/reference/entities/botcomponent) (`BotComponent`). This table lists the topics, entities, and dialogs associated with the bot in your environment. The details are often a small amount of data.
- [**Conversation Transcripts**](/power-apps/developer/data-platform/reference/entities/conversationtranscript) (`ConversationTranscript`). This table contains detailed conversation data for all the chatbots in your environment. The size of the data in this table is related to the use of the bot and can be large.

### Azure Synapse Link for Dataverse (Azure Data Lake Storage Gen2)

When bots generate large volumes of conversation transcripts (roughly more than 10,000 sessions a month, representing more than 80 MB of transcript data), the recommended approach is to export bot data to an Azure Data Lake Storage Gen2 using the [Azure Synapse Link for Dataverse feature](/power-apps/maker/data-platform/export-to-data-lake). This approach has the benefit of offloading data from Dataverse database storage in a cheaper data lake storage. It also retains large volumes of conversation transcripts for long periods.

The export creates an incremental sync of configured Dataverse tables in the Azure data lake, using the Common Data Model format.

There are more steps you need to take, including what is configured in the base template:

- [Create an Azure Data Lake Storage Gen2 and connect it to Dataverse](/power-apps/maker/data-platform/azure-synapse-link-synapse).
- During configuration, select the *ConversationTranscript* table (_Chatbot_ and _Chatbot Subcomponent_ don't support incremental sync).
- [Follow the guidance](https://github.com/microsoft/PowerVirtualAgentsSamples/tree/master/CustomAnalytics/DataFlowVersion) for setting up Power BI dataflows to process the incoming data.

> [!WARNING]
> By default, Azure Synapse Link for Dataverse mirrors the configured table data from Dataverse to the Azure data lake. Therefore, any record that gets deleted in Dataverse (for example, by the recurring bulk delete job that deletes conversation transcripts older than 30 days by default) will also be removed from the Azure data lake. To work around this, you can create copies or snapshots of your data in the Azure data lake, or you can configure the synchronization to use the [append-only mode](/power-apps/maker/data-platform/azure-synapse-link-advanced-configuration#in-place-updates-vs-append-only-writes).

### Power BI

The custom analytics solution template includes a Power BI report that processes the raw transcript data (using Power Query) into a report that matches the Microsoft Copilot Studio default analytics.


In addition, users of the report have access to:

- Data for all chatbots in an environment.
- Data as far back as the feed provides (in Dataverse or in the Azure Data Lake Storage Gen2).
- Raw data tables extracted from the Conversation Transcript table data – which can be used to create custom reports.
- A transcript viewer, allowing users to see the actual conversations that occurred.

> [!WARNING]
> This a complex report that performs significant transformations on the base data. Customers with Conversation Transcript tables greater than 80 MB should look to use the Azure Synapse Link for Dataverse and Power BI dataflows version of the report.
