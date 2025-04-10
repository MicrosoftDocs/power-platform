---
title: Use Dataverse background operations
description: Learn how Dataverse background operations enhance the efficiency of your solutions by using asynchronous processing and eliminating persistent connections.
author: manuelap-msft
ms.subservice: architecture-center
ms.topic: conceptual
ms.date: 04/10/2025
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

Define Microsoft Dataverse requests as custom APIs to run them in the background. Custom APIs allow you to define custom messages and implement business logic through plug-ins. Background operations eliminate the need for a persistent connection during execution and allow you to take advantage of asynchronous processing. This article provides example scenarios and a generalized example architecture to illustrate how to use background operations in Dataverse. The architecture example can be modified for many different scenarios and industries.

## Example architecture diagram

:::image type="content" source="media/dataverse-background-operations/Background-job.png" alt-text="Architecture diagram illustrating the workflow for executing background operations in Microsoft Dataverse." lightbox="media/dataverse-background-operations/Background-job.png":::

Dataverse background operations allow asynchronous processing of tasks, a more efficient way to handle long-running or resource-intensive processes without affecting the user experience.

## Components

<!-- EDITOR'S NOTE: List the components of the architecture. -->

## Example scenario

<!-- EDITOR'S NOTE: List the steps in the example scenario as in previous articles in the docset. -->
The following steps describe the workflow that's shown in the example architecture diagram:

1. Trigger a background operation using Microsoft Dataverse in Power Automate.
1. Schedule the operation via recurrence triggers.
1. Use the Perform a Background Operation action (Premium) in Dataverse to handle the operation asynchronously.
1. Call the `OnBackgroundOperationComplete` event action from Power Automate or the API to receive the completion.

When you use Dataverse background operations to execute requests asynchronously, keep in mind that the two-minute execution time-out applies to any plug-ins that you invoke during the process.

### Use cases

Dataverse background operations are particularly useful for scenarios that require long-running processes or operations that can be executed without user interaction. Use cases include analysis of large datasets, scheduled data cleanup, and batch processing of records.

## Considerations

[!INCLUDE [pp-arch-ppwa-link](../../includes/pp-arch-ppwa-link.md)]

### Scalability and performance

Background jobs can scale with increasing workloads without compromising performance or reliability.

### Reliability

Anticipate potential failures by incorporating comprehensive error-handling mechanisms. Manage transient faults using retry policies with exponential backoff. Learn more in [Implement retries with exponential backoff](https://learn.microsoft.com/en-us/dotnet/architecture/microservices/implement-resilient-applications/implement-retries-exponential-backoff).

## Related content

- [Power Platform Well-Architected recommendations for developing background jobs](/power-platform/well-architected/reliability/background-jobs)
- [Background operations (preview)](/power-apps/developer/data-platform/background-operations?tabs=sdk)
