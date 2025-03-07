---
title: Dataverse background operations. 
description: Learn how to execute requests as background operations in Microsoft Dataverse using Custom APIs for efficient asynchronous processing.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: example-scenario
ms.date: 03/07/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---


# Dataverse background operations

<img src="media/dataverse-background-operations-/image1.tmp"
style="width:6.26806in;height:3.85903in" />

## Workflow

To execute a request as a background operation in Microsoft Dataverse,
the operation must be defined as a Custom API.

Custom APIs allow to define custom messages and implement business logic
through plug-ins. By configuring operation as a Custom API, you can
leverage background processing to handle requests asynchronously,
eliminating the need to maintain a **persistent connection** during
execution.

- Asynchronous Processing: Background operations enable Dataverse to
  process requests without requiring the client to wait for completion,
  enhancing efficiency for long-running tasks.

<!-- -->

- Notification Methods: Upon completion of a background operation, you
  can receive notifications by

<!-- -->

- Including a callback URL with your request.

- Subscribing to the OnBackgroundOperationComplete event.

In the event of an error during the execution of a background operation,
Dataverse employs a retry mechanism. Specifically, the system will
attempt to retry the failed request up to three times, utilizing an
[exponential backoff
strategy](https://en.wikipedia.org/wiki/Exponential_backoff).

**Makers:**

- A background operation is triggered using Microsoft Dataverse in Power
  Automate.

- The operation can be scheduled via Recurrence triggers.

- The Perform a Background Operation action (Premium) is used in
  Dataverse to handle the operation asynchronously.

- OnBackgroundOperationComplete event action can be either called from
  Power Automate to receive the completion or from API.

When utilizing Dataverse Background Operations to execute requests
asynchronously, it's important to note that the two-minute execution
timeout still applies to any plug-ins invoked during the process.

## Use Cases

Dataverse's background operations enable asynchronous processing of
tasks, allowing for efficient handling of long-running or
resource-intensive processes without impacting user experience.

**Bulk Data Processing**:

> *Scenario* - A marketing firm needs to process large datasets to
> analyze customer behaviour and segment audiences.
>
> Implement background operations to handle data aggregation and
> analysis tasks, allowing marketers to access insights without waiting
> for processing to complete.

**Scheduled Data Cleanup:**

> Scenario: An organization wants to maintain data hygiene by regularly
> archiving or deleting outdated records from Dataverse.
>
> Implement background operations to identify and manage obsolete data,
> ensuring the system remains efficient and storage costs are
> controlled.

## Considerations

### Scalability and Performance

Background jobs can scale with increasing workloads without compromising
performance or reliability.

### Reliability

Error Handling: Anticipate potential failures by incorporating
comprehensive error-handling mechanisms. Implement retry policies with
exponential backoff to manage transient faults effectively.

## Related Resources

> <https://learn.microsoft.com/en-us/power-platform/well-architected/reliability/background-jobs>
>
> <https://learn.microsoft.com/en-us/power-apps/developer/data-platform/background-operations?tabs=sdk>
