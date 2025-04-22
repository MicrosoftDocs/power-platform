---
title: Use Dataverse background operations
description: Learn how Dataverse background operations enhance the efficiency of your solutions by using asynchronous processing and eliminating persistent connections.
#customer intent: As a Power Platform user, I want to define custom messages and implement business logic through plug-ins so that I can use background processing in Dataverse.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 04/17/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
ms.contributors:
  - pmohapatra
search.audienceType:
  - admin
  - flowmaker
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:04/10/2025
---

# Use Dataverse background operations

Define Microsoft Dataverse requests as custom APIs to run them in the background. Custom APIs allow you to define custom messages and implement business logic through plug-ins. Background operations eliminate the need for a persistent connection during execution and allow you to take advantage of asynchronous processing. 

> [!TIP]
> This article provides example scenarios and a generalized example architecture to illustrate how to use background operations in Dataverse. The architecture example can be modified for many different scenarios and industries.

## Architecture diagram

:::image type="content" source="media/dataverse-background-operations/Background-job.png" alt-text="Architecture diagram illustrating the workflow for executing background operations in Microsoft Dataverse." lightbox="media/dataverse-background-operations/Background-job.png":::

## Workflow

To run a request as a background operation in Microsoft Dataverse, define the operation as a custom API. Custom APIs allow you to define custom messages and implement business logic through plug-ins. By configuring the operation as a custom API, you use background processing to handle requests asynchronously and eliminate the need to maintain a persistent connection during execution.

Background operations in Dataverse employ:

- **Asynchronous processing:** Background operations let Dataverse process requests without making the client wait for completion, enhancing efficiency for long-running tasks.

- **Notification methods:** On completion of a background operation, you receive notifications by:
  - Including a callback URL with your request.
  - Subscribing to the `OnBackgroundOperationComplete` event.
  
- **Error handling:** If an error occurs during the execution of a background operation, Dataverse employs a retry mechanism. The system retries the failed request up to three times, using an [exponential backoff strategy](/power-platform/well-architected/reliability/handle-transient-faults).

### Makers

The following steps describe the workflow that's shown in the example architecture diagram:

1. Trigger a background operation using Microsoft Dataverse in Power Automate.
1. Schedule the operation via recurrence triggers.
1. Use the Perform a Background Operation action (Premium) in Dataverse to handle the operation asynchronously.
1. Call the `OnBackgroundOperationComplete` event action from Power Automate or the API to receive the completion.

When using Dataverse background operations to execute requests asynchronously, the two-minute execution time-out applies to any plug-ins invoked during the process.

## Components

**[Background operations](/power-apps/developer/data-platform/background-operations?tabs=sdk)**: Background operations are used to send requests that Dataverse processes asynchronously.

**[Custom APIs](/power-apps/developer/data-platform/custom-api)**: Custom API are used as business events to enable creating new integration capabilities such as exposing a new type of trigger event in the Microsoft Dataverse connector. Custom APIs perform bulk data processing and bulk delete actions.

**[Power Platform environment](/power-platform/admin/environments-overview)**: Contains the Power Platform resources.

**[Power Apps](/power-apps/)**: Power Apps is used to implement the user experience of the solution. A canvas app can trigger a cloud flow that performs a background operation.

## Scenario details

Dataverse background operations allow asynchronous processing of tasks, a more efficient way to handle long-running or resource-intensive processes without affecting the user experience.

### Potential use case

Dataverse background operations are particularly useful for scenarios that require long-running processes or operations that can be executed without user interaction. Use cases include analysis of large datasets, scheduled data cleanup, and batch processing of records.

#### Bulk data processing

**The scenario**: A marketing firm needs to process large datasets to analyze customer behavior and segment audiences. You implement background operations to handle data aggregation and analysis tasks, allowing marketers to access insights without waiting for processing to complete.

#### Scheduled data cleanup

**The scenario**: Your organization wants to maintain data hygiene by regularly archiving or deleting outdated records from Dataverse. You implement background operations to identify and manage obsolete data, ensuring the system remains efficient and storage costs are controlled.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Performance Efficiency

Background jobs can scale with increasing workloads without compromising performance or reliability.

### Reliability

Anticipate potential failures by incorporating comprehensive error-handling mechanisms. Manage transient faults using retry policies with exponential backoff. Learn more in [Implement retries with exponential backoff](/dotnet/architecture/microservices/implement-resilient-applications/implement-retries-exponential-backoff).

## Contributors

_Microsoft maintains this article. The following contributors wrote this article._

Principal authors:

- **[Pujarini Mohapatra](https://www.linkedin.com/in/biswapm/)**, Principal Engineering Manager

## Related resources

- [Power Platform Well-Architected recommendations for developing background jobs](/power-platform/well-architected/reliability/background-jobs)
- [Background operations (preview)](/power-apps/developer/data-platform/background-operations?tabs=sdk)
- [Create and use custom APIs](/power-apps/developer/data-platform/custom-api)
