---
title: Develop background jobs recommendation for Power Platform workloads
description: Learn how to develop background jobs that run automatically without the need for user interaction, to improve availability and reduce interactive response time.
author: manuelap-msft
ms.author: mapichle
ms.reviewer: jhaskett-msft
ms.date: 08/15/2025
ms.subservice: well-architected
ms.topic: concept-article
---

# Recommendations for developing background jobs

**Applies to this Power Platform Well-Architected Reliability checklist recommendation:**

| [RE:05](checklist.md) | **Strengthen the resiliency of your workload by implementing error handling and transient fault handling. Build capabilities into the solution to handle component failures and transient errors.** |
| --- | --- |

This guide describes the recommendations for developing background jobs. Background jobs run automatically without the need for user interaction. Many applications require background jobs that run independent of the user interface (UI).

Some examples of background jobs include batch jobs, intensive processing tasks, and long-running processes, such as workflows. The application starts the job and processes interactive requests from users.

For example, an application might need to generate a summary and extract sentiment and key points from documents that users upload. A background job can be performed to run the AI actions and save the summary and key points to the database. The user doesn't have to wait for the process to complete. As another example, a user might submit an expense claim, which initiates a background workflow that processes the expense claim and submits it for approval. The user can continue to file another expense claim or leave the application while the background job runs. After the background job finishes, it sends an email to the user to confirm the expense claim has been submitted for approval.

Background jobs help minimize the load on the application UI, which improves availability and reduces interactive response time.

## Key design strategies

To choose which task to designate as a background job, consider whether the task runs without user interaction and whether the UI needs to wait for the task to complete. Tasks that require the user or the UI to wait while they run are typically not appropriate background jobs.

### Types of background jobs

Some examples of background jobs are:

- Resource-intensive jobs that take a long time to complete, such as running a series of transactions.

- Batch jobs, such as nightly data updates or scheduled processing.

- Long-running workflows, such as order fulfillment or provisioning services and systems.

- Workflows that require asynchronous collaboration, such as approvals.

- Sensitive-data processing that transfers the task to a more secure location for processing. For example, you might not want to process sensitive data within a web app. Instead, you might use a pattern such as the [Gatekeeper pattern](/azure/architecture/patterns/gatekeeper) to transfer the data to an isolated background process that has access to protected storage.

### Triggers

Initiate background jobs with:

- [Event-driven triggers](#event-driven-triggers): An event, either a user action in the application or an event that occurs against a data source, triggers the task.

- [Schedule-driven triggers](#schedule-driven-triggers): A schedule that's based on a timer invokes the task. The job can be scheduled on a recurring basis or for a single run.

#### Event-driven triggers

An action triggers an event-driven invocation that starts the background task. Examples of event-driven triggers include:

- The UI or a different job triggers the background job and passes data from the performed action to the background job. For example, a user submits an expense claim via a form, and the form details are passed to the background job for processing.

- The UI or a different job saves or updates a value that's in storage. The background job monitors the storage and detects changes, such as new values being added or existing values being modified, and triggers the background job based on that change.

- The UI or a different job makes a request to an endpoint, such as an HTTPS URI or an API that's exposed as a web service. As part of the request, the UI or job transfers the data that the background task requires. The endpoint or web service invokes the background task, which uses the data as its input.

Other examples of event-driven triggers include a form being submitted in an application, a new row being added to the data store, a trigger phrase in an agent starting a topic that calls a flow, the value of a field changing in the data store, an email with a specific subject or from a specific sender arriving in the inbox, and a file being uploaded to a file storage location.

Use trigger conditions to streamline your workflows and reduce the number of unnecessary runs. Trigger conditions set up multiple conditions that must be met before a workflow is triggered.

>[!NOTE]
>Make sure to use trigger conditions to prevent endless loops if, as part of the workflow, you change the data source that starts the workflow. For example, the application might change fields in a Microsoft Dataverse table row, and the workflow perform additional queries based on those changed fields, further modifying the same row. Use trigger conditions to start the workflow only when fields that are changed by the application are updated, but not any other fields.

#### Schedule-driven triggers

A timer triggers a schedule-driven invocation that starts the background task. Examples of schedule-driven triggers include:

- A background job runs on a daily or weekly basis and performs a set of actions.

- A separate process or application starts a timer that invokes the background task after a time delay or at a specific time.

Other examples of tasks that are suited to schedule-driven invocation include batch-processing routines (such as updating related products lists for customers based on their recent behavior), routine data-processing tasks (such as generating accumulated results), data analysis for daily reports, data retention cleanup, and data consistency checks.

### Return results

Background jobs run asynchronously in a separate process from the UI or the process that invoked the background job. Ideally, background jobs are *fire and forget* operations. Their runtime progress doesn't influence the UI or the calling process, which means that the calling process doesn't wait for the tasks to complete. The UI and the calling process can't detect when the task ends.

If you require a background task to communicate with the calling task to indicate progress or completion, you must implement a mechanism such as:

- Write a status indicator value to storage that's accessible to the UI or the caller task, which can monitor or check this value. Other data that the background task returns to the caller can be placed in the same storage.

- Expose an API or endpoint from the background task that the UI or caller can access to obtain status information. The response can include the data that the background task returns to the caller.

- Configure the background task to respond with the status or the data that it processed back to the UI.

### Coordination

Background tasks can be complex and require multiple tasks to run. In these scenarios, it's common to divide the task into smaller discrete steps or subtasks that multiple consumers can run. Multistep jobs are more efficient and more flexible because individual steps are often reusable in multiple jobs. It's also easy to add, remove, or modify the order of the steps.

It can be a challenge to coordinate multiple tasks and steps, but there are three common patterns to guide your solution:

- **Decompose a task into multiple reusable steps**. An application might be required to perform various tasks of different complexity on the information that it processes. A straightforward but inflexible approach to implementing such an application is to perform this processing as a monolithic module. But this approach is likely to reduce the opportunities for refactoring the code, optimizing it, or reusing it if the application requires parts of the same processing elsewhere.

- **Manage the orchestration of the steps for a task**. An application might perform tasks that comprise many steps, some of which might invoke remote services or access remote resources. Sometimes the individual steps are independent of each other, but they're orchestrated by the application logic that implements the task.

- **Manage the recovery for task steps that fail**. If one or more of the steps fail, an application might need to undo the work that a series of steps performs, which together defines an eventually consistent operation.

### Resiliency considerations

Create resilient background tasks to provide reliable services for the application. When you plan and design background tasks, consider the following points:

- Background tasks need to gracefully handle restarts without corrupting data or introducing inconsistency into the application. For long-running or multistep tasks, consider using *checkpoints*. Use checkpoints to save the state of jobs in persistent storage or as messages in a queue and configure retry logic in case of unexpected failures of an action.

- When you use queues to communicate with background tasks, the queues can act as a buffer to store requests that are sent to the tasks while the application is under higher than usual load. The tasks can catch up with the UI during less busy periods, and restarts don't block the UI.

### Scaling and performance considerations

Background tasks must offer sufficient performance to ensure that they don't block the application or delay operation when the system is under load. Typically, performance improves when you scale the compute instances that host the background tasks. When you plan and design background tasks, consider the following points related to scalability and performance:

- Background jobs might affect the user experience if the results of the background tasks are presented to the user. For example, background jobs might require the user to wait for a notification, refresh the page, or manually check the status of the task. These behaviors can increase the complexity of the user interaction and negatively affect the user experience. Consider alternatives to responding data back to the UI, such as sending a notification via email or Microsoft Teams, or including the ability to check for status updates in your UI. In our example of submitting expense forms, rather than responding the status back to the UI, you could have a page in the application that lists all submitted expense forms with their status and the ability to trigger a refresh.

- Background jobs can create challenges for data synchronization and process coordination, especially if the background tasks depend on each other or on other data sources. For example, background jobs might handle data consistency problems, race conditions, deadlocks, or timeouts.

- To prevent the loss of performance under load, you might implement logic so that a single point of the processing chain doesn't cause a bottleneck. Consider other limitations, such as the maximum throughput of workflow actions, storage, and other services that the application and the background tasks rely on.

> :::image type="icon" source="../_images/trade-off.svg"::: **Tradeoff**: Background jobs introduce more components and dependencies to the system, which can increase the complexity and maintenance costs of the solution. For example, background jobs might require a separate monitoring service and retry mechanism.

## Example

[Use Dataverse background operations](/power-platform/architecture/reference-architectures/dataverse-background-operations) provides example scenarios and a generalized example architecture to illustrate how to use background operations in Dataverse.

## Power Platform facilitation

The following sections describe the services that you can use to host, run, configure, and manage background jobs.

### Power Automate

[Power Automate cloud flows](/power-automate/flow-types) are workflows that run in the cloud. They can be automated flows that are triggered by an event, such as the arrival of an email from a specific person. They can be instant flows that you start with a click of a button, like a reminder to your team that you send from your mobile device. They can be scheduled flows that run at a certain time, such as a daily data upload to SharePoint or a database. You can also automate repetitive tasks from your desktop or mobile device.

Get familiar with the [limits of automated, scheduled, and instant flows](/power-automate/limits-and-config) with regards to throughput, request, concurrency, looping, and debatching. Make sure that you take these limits into consideration as you design your workflow.

Reduce the risk by [planning for error handling](/power-automate/guidance/planning/reducing-risk).

Here are some examples of where you can use Power Automate flows to run background jobs:

- [Canvas apps](/power-apps/maker/canvas-apps/working-with-flows)
- [Agents](/microsoft-copilot-studio/advanced-flow)
- [Custom pages](/power-apps/maker/model-driven-apps/commanding-designer-use-custom-pages-as-dialogs)
- [Command bar actions](/power-apps/maker/model-driven-apps/command-designer-overview#key-differences-between-classic-and-modern-commands)

### Microsoft Dataverse

[Microsoft Dataverse calculated columns and rollups](/power-apps/developer/data-platform/calculated-rollup-attributes):

- [Formula columns](/power-apps/maker/data-platform/formula-columns?tabs=type-or-paste) are columns that display a calculated value in a Microsoft Dataverse table.

- Calculated columns automate manual calculations used in your business process. For example, a salesperson might want to know the weighted revenue for an opportunity, which is based on the estimated revenue from an opportunity multiplied by the probability. Or, they want to automatically apply a discount if an order is greater than a certain amount. A calculated column can contain values such as the result of simple math operations, or conditional operations such as greater than or if-else.

- Rollup columns help users obtain insights into data by monitoring key business metrics. A rollup column contains an aggregate value that's computed over the rows that are related to a specified row. This includes regular tables and activity tables such as emails and appointments. In more complex scenarios, you can aggregate data over the hierarchy of rows. As an administrator or customizer, you can define rollup columns by using the customization tools in Power Apps, without needing to write code.

[Background operations](/power-apps/developer/data-platform/background-operations?tabs=sdk) can send requests that Dataverse processes asynchronously. Background operations are useful when you don't want to maintain a connection while a request runs.

[Plug-ins](/power-apps/developer/data-platform/plug-ins) are custom event handlers that execute in response to a specific event raised during processing of a Microsoft Dataverse data operation.

Microsoft Dataverse also offers a powerful solution for achieving more efficient data architecture and reducing client-side workload through [low-code plug-ins](/power-apps/maker/data-platform/low-code-plug-ins?tabs=automated). These plug-ins are reusable, real-time workflows that execute a specific set of commands within Dataverse, running server-side and triggered by personalized event handlers.

## Reliability checklist

Refer to the complete set of recommendations.

> [!div class="nextstepaction"]
> [Reliability checklist](checklist.md)
