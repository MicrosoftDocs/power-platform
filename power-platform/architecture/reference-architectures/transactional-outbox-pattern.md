---
title: Implement the Transactional Outbox pattern with Dataverse
description: Learn how to implement the Transactional Outbox pattern with Dataverse and Azure Service Bus to ensure reliable message delivery and maintain consistency across integrated systems.
#customer intent: As an integration architect, I want to implement reliable message delivery from Dataverse so that downstream systems receive and process data changes consistently.
author: carcla
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 10/08/2026
ms.author: v-caclaesson
ms.reviewer: jhaskett-msft
---

# Implement the Transactional Outbox pattern with Dataverse

Enterprise solutions need to reliably deliver messages when data changes occur in Dataverse. This reference architecture shows how to implement the Transactional Outbox pattern with Dataverse to reduce the risk of message loss and help keep integrated systems synchronized.

> [!TIP]
> This article provides an example scenario and a generalized example architecture to illustrate how to implement reliable event delivery from Dataverse. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/transactional-outbox-pattern/transactional-outbox-pattern.svg" alt-text="Architecture diagram showing how Dataverse implements the Transactional Outbox pattern by storing outbox records in the same transaction as business data changes and publishing messages to Azure Service Bus for downstream processing." border="true" lightbox="media/transactional-outbox-pattern/transactional-outbox-pattern.svg":::

## Workflow

The following steps describe the workflow that's shown in the example architecture diagram:

1. A data operation in Dataverse occurs, such as the creation or update of a Contact record. This operation creates a database transaction.
1. A Dataverse synchronous plug-in triggers in response to this event and creates a record in an outbox table within Dataverse as part of the same transaction.
1. If the plug-in executes successfully, the transaction commits both the outbox record and the original record (for example, Contact) changes.
1. If the plug-in execution fails, the original data event rolls back, and Dataverse doesn't commit any record modifications.
1. An asynchronous plug-in triggers in response to the creation of a record in the outbox table in Dataverse and writes a message to an Azure Service Bus queue or topic.
1. A message consumer listens for messages to process and push to a target system.

## Components

[**Dataverse**](/power-apps/maker/data-platform/data-platform-intro) is the source transactional system of record where the data event occurs and the outbox table lives. It asynchronously sends messages to the message broker by using a plug-in.

[**Azure Service Bus**](/azure/service-bus-messaging/service-bus-messaging-overview) is the reliable enterprise broker that receives messages from Dataverse for processing from receiving systems.

- **Queues** are ideal when there's a single receiver of a message.
- **Topics** are best when many subscribers might process the same message or need filter criteria to selectively process messages.

[**Azure Monitor**](/azure/azure-monitor/fundamentals/overview) is a comprehensive monitoring solution for collecting, analyzing, and responding to monitoring data from cloud and on-premises solutions. Use built-in metrics for Azure Service Bus to monitor the number of messages in a queue or topic, or dead letter queue.

[**Azure Application Insights**](/azure/azure-monitor/app/app-insights-overview) is used for application performance monitoring and can be enabled for Dataverse plug-ins to send trace logs to an Application Insights workspace.

Alternative options:

- [**Azure Logic Apps**](/azure/logic-apps/logic-apps-overview): A viable low-code alternative to deliver messages from the outbox table to the message broker if you want more precise control over when to trigger the orchestration and delivery of the message (for example, micro-batching).
- [**Azure Functions**](/azure/azure-functions/functions-overview): A code-first alternative that gives you the most flexibility and scale to handle higher volumes and intermittent failure retries.

## Scenario details

Enterprise solutions often need to exchange critical data with other systems through messages. To ensure consistency across systems, handle the data operation and message delivery as a single atomic operation. However, most transactional systems and message brokers rarely support distributed transactions, or they introduce tight coupling that you want to avoid. Without a distributed transaction, there's no reliability guarantee because a failure might occur when sending the message to the broker after a transaction is committed.

The Transactional Outbox pattern solves this challenge by creating a message in the same local database transaction that updates the business data. A separate process can then deliver the message from the outbox table to the message broker. Intermittent process failures aren't a problem. The outbox table stores the message so it isn't lost, and the process retries until it succeeds.

Dataverse is a capable and extensible low-code data platform with transactional data storage that can implement this pattern for critical outbound integration scenarios.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Reliability

This pattern significantly increases reliability, guarantees at-least-once delivery, and eventual consistency by ensuring transactional consistency. By relying on a message broker, it protects downstream systems from being overwhelmed by controlling the flow of data between source and target systems and protects against availability issues of downstream systems.

When message ordering is required, enable Azure Service Bus sessions on the queue or subscription. The producer should assign a consistent SessionId, such as the Dataverse record or aggregate ID, to related messages so they're processed in order within that session. Design consumers for idempotent processing, as this pattern provides at-least-once delivery and duplicate messages might occur. Where detecting missing or out-of-sequence events is important, messages can include an application-level sequence number. Ordering guarantees apply within a session rather than globally, and the solution should define how retries and dead-lettered messages affect subsequent processing for that session.

### Security

By using Azure services, Dataverse can authenticate to the message broker (Azure Service Bus) through Azure managed identities via the Power Platform managed identity feature. This approach eliminates the risk of storing sensitive credentials and downtime caused when rotating secrets.

### Performance Efficiency

Using a message broker such as Azure Service Bus helps level the load to ensure downstream applications don't become overwhelmed during high-volume periods.

Consider using an Azure function over an asynchronous Dataverse plug-in to send messages to Azure Service Bus if volumes become very high. This approach provides the most scale and flexibility to process a large volume of records in batch and handle transient errors.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Chris Piasecki](https://www.linkedin.com/in/chris-piasecki)**, Solution Architect

## Related resources

- [TechTalk: Integration patterns for Dataverse](/dynamics365/guidance/techtalks/integrate-finance-operations-dataverse)
- [Implement the Transactional Outbox pattern by using Azure Cosmos DB](/azure/architecture/databases/guide/transactional-out-box-cosmos)
- [What is Azure Service Bus?](/azure/service-bus-messaging/service-bus-messaging-overview)
- [Use plug-ins to extend business processes](/power-apps/developer/data-platform/plug-ins)
- [Power Platform managed identity overview](/power-platform/admin/managed-identity-overview)
- [Dataverse plug-in execution logs](/power-platform/admin/telemetry-events-dataverse#dataverse-plug-in-execution-logs)
