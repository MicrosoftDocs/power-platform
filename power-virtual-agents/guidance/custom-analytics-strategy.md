---
title: "Custom Analytics strategy for Power Virtual Agents"
description: "Set of best practices on custom analytics for Power Virtual Agents"
author: athinesh

ms.date: 1/20/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.collection: virtual-agent
---

# Custom Analytics Strategy
Power Virtual Agents provides comprehensive out-of-the-box analytics in the PVA portal that will allow customers to understand a bot’s usage. 
Customers can view reports related to:
- Performance and usage
- Customer satisfaction
- Session information
- Topic usage
- Billed sessions
There are scenarios where a customer will want to take what is provided by default in PVA further. Generally,  these break down as:
- A requirement to share analytics with non-PVA makers/users
- A requirement to store/archive bot data (longer than the default 30 days)
- A requirement for a report not covered in the OOB analytics

If this is the case, our recommended approach is that customers implement the PVA custom analytics solution. 
This is a set of open-source assets, distributed through GitHub, greatly accelerating the time it takes to create a report that renders in Power BI.

Important! Before implementing this with a customer – it is critical that they understand the solution is not part of the core PVA offering and will require configuration and support by themselves. 

Below we will walk through the components in the report and how they work together.

## Dataverse
The analytics shown in the PVA portal come from a data service residing within PVA itself. At the same time, usage data is also written to a customer’s Dataverse instance. Both sources have a data retention of 30 days (the customer can change this for Dataverse all-up – although there is a different approach – see below).
The important tables used for custom analytics are as follows:
- Bot – details of each bot in an environment. Generally a small amount of data.
- BotComponent – these are topics in the bot in your environment. Generally a small amount of data.
- ConversationTranscript – the details of the activity for all the bots in your environment. Data size is related to amount of bot usage and can be quite large. 
More detailed description of this table can be found here – work withconversation transcripts.

## Azure Synapse Link (Azure Data Lake Storage V2) 
For customers with larger PVA bots (roughly  10k sessions/month, greater than 80MB of transcript data), the recommended approach is to export bot data to Azure Data Lake Storage v2 using Azure Synapse Link. 
This has additional benefits of creating an archive of bot data, allowing reports on data greater than 30 days. The export will create an incremental sync of configured tables in Azure using the Common Data Model format. 
There is some work on top of the base template to do this: 
- Create a Data Lake and connect it to Dataverse
- Browse to the ConversationTranscript (only, the other tables do not support incremental)table in Dataverse and select “Azure Synapse Link” to set up incremental export.
- Follow the guidance for setting up Power BI DataFlows to process the incoming data.

## Power BI 
The Custom Analytics solution includes a Power BI report that processes the raw transcript data (using PowerQuery) into to a report matching the PVA Portal analytics. 
In addition, users have access to: 
- Data for all bots in an environment
- Data as far back as the feed provides (assuming Azure Synapse Link archival is configured, otherwise 30 days)
- Raw data tables extracted from the ConversationTranscript  data – which can be used to create custom reports.
- A transcript viewer, allowing users to see the actual conversations that occurred.

Important! This a complex report that performs significant transformations on the base data. Customers with ConversationTranscript tables greater than 80MB should look to use the Azure Synapse Link/DataFlows version of the report. 

## Capacity Modeling 
While the Software-as-a-Service model used in Power Virtual Agents mitigates many of the normal application scalability/capacity concerns, there are some areas where project teams should be mindful of planning to ensure smooth running. 

## Quotas 
PVA does employ a quota limiting numbers of requests per minute (currently 800 rpm). Customers who believe they will go above this limit should get in touch with their Microsoft Account team. 

## Power Automate 
Customers calling Power Automate from PVA benefit from an enhanced daily quota of calls (currently 30,000). Customers who believe they will go above this limit should get in touch with their Microsoft Account team. 

## Demand spikes 
Customers expecting very large spikes in seasonal demand should consult with the Microsoft Account team ahead of the spike to see if any local mitigation may  be needed. 
