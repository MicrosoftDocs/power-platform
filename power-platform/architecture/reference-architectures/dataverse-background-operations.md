---
title: Leverage Dataverse background operations
description: Learn how to execute requests as background operations in Microsoft Dataverse using custom APIs for efficient asynchronous processing.
#customer intent: As a Power Platform user, I want to define custom messages and implement business logic through plug-ins so that I can use background processing in Dataverse.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/06/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
ms.contributors:
  - pmohapatra
search.audienceType:
  - admin
  - flowmaker
---

# Leverage Dataverse background operations

In Microsoft Dataverse, executing requests as background operations enhances asynchronous processing efficiency. Using custom APIs, you define custom messages and implement business logic through plug-ins, allowing for background processing that eliminates the need for a persistent connection during execution.

> [!TIP]
> The article provides an example scenario and visual representation of how to implement background operations in Dataverse. This solution is a generalized example scenario architecture, which can be used for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/dataverse-background-operations/Background-job.png" alt-text="Architecture diagram illustrating the workflow for executing background operations in Microsoft Dataverse." lightbox="media/dataverse-background-operations/Background-job.png":::

## Workflow

To run a request as a background operation in Microsoft Dataverse, define the operation as a custom API. Custom APIs allow you to define custom messages and implement business logic through plug-ins. By configuring the operation as a custom API, you use background processing to handle requests asynchronously and eliminate the need to maintain a persistent connection during execution.

Background operations in Dataverse employ:

- **Asynchronous processing:** Background operations let Dataverse process requests without making the client wait for completion, enhancing efficiency for long-running tasks.

- **Notification methods:** On completion of a background operation, you receive notifications by:
  - Including a callback URL with your request.
  - Subscribing to the `OnBackgroundOperationComplete` event.
  
- **Error handling:** If an error occurs during the execution of a background operation, Dataverse employs a retry mechanism. The system retries the failed request up to three times, using an [exponential backoff strategy](https://en.wikipedia.org/wiki/Exponential_backoff).

### Makers

To implement background operations in Dataverse, follow these steps:

1. Trigger a background operation using Microsoft Dataverse in Power Automate.
1. Schedule the operation via recurrence triggers.
1. Use the Perform a Background Operation action (Premium) in Dataverse to handle the operation asynchronously.
1. Call the `OnBackgroundOperationComplete` event action from Power Automate or the API to receive the completion.

When using Dataverse background operations to execute requests asynchronously, the two-minute execution time-out applies to any plug-ins invoked during the process.

## Use cases

Dataverse's background operations enable asynchronous processing of tasks, allowing for efficient handling of long-running or resource-intensive processes without impacting user experience.

### Bulk data processing

*Scenario*: A marketing firm needs to process large datasets to analyze customer behavior and segment audiences.

- Implement background operations to handle data aggregation and analysis tasks, allowing marketers to access insights without waiting for processing to complete.

### Scheduled data cleanup

*Scenario*: An organization wants to maintain data hygiene by regularly archiving or deleting outdated records from Dataverse.

- Implement background operations to identify and manage obsolete data, ensuring the system remains efficient and storage costs are controlled.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Scalability and performance

Background jobs can scale with increasing workloads without compromising performance or reliability.

### Reliability

Anticipate potential failures by incorporating comprehensive error-handling mechanisms. Implement retry policies with exponential backoff to manage transient faults effectively.

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Pujarini Mohapatra](https://www.linkedin.com/in/biswapm/)**, Principal Engineering Manager

## Related resources

- [Power Platform Well-Architected](/power-platform/well-architected/reliability/background-jobs)
- [Power Apps background operations (preview)](/power-apps/developer/data-platform/background-operations?tabs=sdk)