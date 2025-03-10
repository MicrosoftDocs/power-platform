---
title: Dataverse background operations. 
description: Learn how to execute requests as background operations in Microsoft Dataverse using Custom APIs for efficient asynchronous processing.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 03/10/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---


# Dataverse background operations

In Microsoft Dataverse, executing requests as background operations significantly enhance the efficiency of asynchronous processing. By using custom APIs, you define custom messages and implement business logic through plug-ins, allowing for background processing that eliminates the need for a persistent connection during execution. This guide explains the workflow, use cases, and considerations for implementing background operations in Dataverse, ensuring scalable and reliable performance for long-running tasks.

:::image type="content" source="media/dataverse-background-operations-/Background-job.png" alt-text="Screenshot of background job." lightbox="media/dataverse-background-operations-/Background-job.png":::



## Workflow

To execute a request as a background operation in Microsoft Dataverse,
the operation must be defined as a Custom API.

Custom APIs allow to define the custom messages and implement business logic
through plug-ins. By configuring the operation as a Custom API, you use background processing to handle requests asynchronously, and
eliminating the need to maintain a persistent connection during execution.

- Asynchronous Processing: Background operations enable Dataverse to
process requests without making the client wait for completion, and enhancing efficiency for long-running tasks.

- Notification Methods: Upon completion of a background operation, you
  can receive notifications by:
  - Including a callback URL with your request.
  - Subscribing to the OnBackgroundOperationComplete event.

If an error occurs during the execution of a background operation,
Dataverse employs a retry mechanism. Specifically, the system
attempts to retry the failed request up to three times, utilizing an
[exponential backoff
strategy](https://en.wikipedia.org/wiki/Exponential_backoff).

### Makers:

- A background operation is triggered using Microsoft Dataverse in Power
  Automate.

- The operation can be scheduled via Recurrence triggers.

- The Perform a background operation action (Premium) is used in
  Dataverse to handle the operation asynchronously.

- OnBackgroundOperationComplete event action can be called from
  Power Automate to receive the completion or from API.

When utilizing Dataverse background operations to execute requests
asynchronously, it's important to note that the two-minute execution
time-out still applies to any plug-ins invoked during the process.

## Use Cases

Dataverse's background operations enable asynchronous processing of
tasks, allowing for efficient handling of long-running or
resource-intensive processes without impacting user experience.

### Bulk data processing:

 *Scenario*: A marketing firm needs to process large datasets to
 analyze customer behavior and segment audiences.

- Implement background operations to handle data aggregation and
 analysis tasks, allowing marketers to access insights without waiting
 for processing to complete.

### Scheduled data cleanup:

 *Scenario*: An organization wants to maintain data hygiene by regularly
 archiving or deleting outdated records from Dataverse.

- Implement background operations to identify and manage obsolete data,
 ensuring the system remains efficient and storage costs are
 controlled.

## Considerations

### Scalability and performance

Background jobs can scale with increasing workloads without compromising
performance or reliability.

### Reliability

Error Handling: Anticipate potential failures by incorporating
comprehensive error-handling mechanisms. Implement retry policies with
exponential backoff to manage transient faults effectively.

## Related Resources

- [Power Platform- well architected](/power-platform/well-architected/reliability/background-jobs)

- [Power Apps data platform](/power-apps/developer/data-platform/background-operations?tabs=sdk)
