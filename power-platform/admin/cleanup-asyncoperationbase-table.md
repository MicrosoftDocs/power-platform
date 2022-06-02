---
title: "Clean up records from AsyncOperationBase and WorkflowLogBase tables"
description: "Learn how to clean up records from AsyncOperationBase and WorkflowLogBase tables."
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/17/2022
author: viveke
ms.subservice: admin
ms.author: vielango
ms.reviewer: jimholtz 
contributors:
  - cpdSeattle
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
---
# Clean up records from AsyncOperationBase and WorkflowLogBase tables

The AsyncOperationBase table is used to store system jobs. System jobs represent asynchronous extensions, such as asynchronous registered workflows and plugins, and other background operations such as bulk deletion, bulk import, and rollup operations. After an event occurs and any synchronous extensions have been processed, the platform serializes the context for any asynchronous extensions and saves it to the database as an AsyncOperation entity. 

When an async workflow is triggered in your Dataverse organization, a record will be created in the AsyncOperationBase table to track the processing of the async job.Additional records will also be created in the WorkflowLogBase table to maintain logs for the workflow execution. [Business process flows](/power-automate/business-process-flows-overview) (BPF) also store BPF stage transition and action logs for the BPF in the WorkflowLogBase table. 

If your organization has heavy use of workflows or business process flows, these tables will grow over time and eventually become large enough to introduce performance issues as well as consume excessive storage in your organization database.

> [!NOTE]
> The use of entity-related terminology depends on the protocol or class library used. See [Terminology use depending on protocol or technology](/power-apps/developer/data-platform/understand-terminology).

## Bulk deletion jobs

All environments are configured with an out-of-the-box bulk deletion job to delete successfully completed workflow system jobs older than 30 days. Customers can configure additional Bulk bulk deletion to delete AsyncOperationBase records. It is recommended that the customer configures a job that deletes any completed system job (regardless of type or result) older than 30 days so that completed jobs do not accumulate in the AsyncOperationBase table. 

You can leverage the bulk deletion system jobs to delete unneeded records from both AsyncOperationBase and WorkflowLogBase tables. To view the bulk deletion system jobs:

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Environments** in the left navigation pane, select your environment, and then select **Settings** on the top menu bar.
3. Select **Data management** > **Bulk deletion**.

:::image type="content" source="media/recurring-bulk-deletion-system-jobs.png" alt-text="Recurring bulk deletion system jobs":::

From the **Bulk Record Deletion** grid, you can use the view selector to view the completed, in-progress, pending, and recurring bulk deletion system jobs. The **Recurring Bulk Deletion System Jobs** view shows the job definitions for the bulk deletion system jobs that are included out-of-the-box. 

If you open one of these recurring bulk deletion system job records, you can see the query the job uses to identify which records to delete as well as the schedule the job runs on. For these out-of-the-box system jobs, you cannot modify the query used by the system job, but you can modify the schedule the job runs on. If you update the view selector to show jobs that have already been scheduled, in-progress or executed, you can cancel, resume, or postpone the job. You can find these options in the **Actions** menu when you open the record. 

:::image type="content" source="media/bulk-deletion-operation-actions.png" alt-text="Bulk deletion operation Action menu":::

## Create your own bulk deletion jobs

If the out-of-the-box system bulk deletion jobs do not meet your organization’s needs, you can create your own bulk deletion job. From the **Bulk Record Deletion** grid, select **New** on the command bar. This will open the Bulk Deletion wizard that allows you to define a query for the records you want deleted. The wizard also provides the ability to preview the set of records the query will pick up for deletion to allow you to test that you have constructed your query correctly. 

:::image type="content" source="media/bulk-deletion-new-operation.png" alt-text="Create a new bulk deletion operation.":::

To clean up workflow records from the AsyncOperationBase table, you will need to select the **System Jobs** entity and select **[new]** in **Use Saved View** to create your own query. You can only delete completed workflows. Workflows waiting to run or currently in progress cannot and should not be cleaned up by your system job. 

Add the following conditions to your query: 

- **System Job Type Equals Workflow** — target workflow records 
- **Status Equals Completed** — only completed workflows are valid to complete 
- [Optional] filter on the **StatusCodes** (succeeded/failed/canceled) that are valid for completed StateCode 
- [Optional] filter on **Completed On** field to only delete older workflows 
- [Optional] Any additional filters you wish to apply 

:::image type="content" source="media/bulk-deletion-define-search-criteria.png" alt-text="Define search criteria.":::

On the next page of the wizard you can set the frequency your bulk deletion job will run at. You can create a one-time bulk deletion job or define a schedule to allow your job to run at set intervals. 

:::image type="content" source="media/bulk-deletion-job-duration.png" alt-text="Set duration of bulk deletion job.":::

## How to run synchronous bulk deletion jobs 

For bulk deletion of workflow system job records, you also have the option of performing a synchronous bulk deletion of the records by selecting **Immediately**. This delete is performed with direct SQL execution rather than passing each record through the delete event pipeline which results in a large performance gain. This is a great option if you want to quickly clean up the extra workflow records and not have your bulk deletion job wait in the async queue for processing. 

The **Immediately** option will be enabled if the following criteria are met: 

1. The bulk deletion job is for entity **System Jobs**.
2. The search criteria has the condition **System Job Type Equals Workflow**.
3. The user creating the bulk deletion job has global depth for the delete privilege on the AsyncOperation entity. The System Administrator security role is one of the roles that has this privilege. 

Synchronous bulk deletion will only delete AsyncOperation records in the completed state. A maximum of one million records each invocation. You will need to perform the delete multiple times if you have more than one million records you want to clean up. 

## Best practices for designing workflows 

Once you have deleted the unneeded records in your workflow tables, there are a few steps you can take in your workflow design to prevent the tables from growing as fast in the future. 

For asynchronous workflows, we recommend enabling **Automatically delete completed workflow jobs (to save disk space)** in the workflow editor. This will allow the system to delete workflow logs for successful executions to save space. Logs from failed workflow executions will always be saved for troubleshooting. 

:::image type="content" source="media/bulk-deletion-automatically-delete.png" alt-text="Set Workflow Job Retention to automatically delete completed workflow jobs.":::

For synchronous workflows, we recommend enabling **Keep logs for workflow jobs that encountered errors** in the workflow editor. This will allow logs from failed workflow executions to be saved for troubleshooting. Logs from successful workflow executions will always be deleted to save space. 

:::image type="content" source="media/bulk-deletion-keep-logs.png" alt-text="Set Workflow Log Retention to keep logs for workflow jobs that encountered errors.":::

## AsyncOperationBase file capacity usage 

Historically, the entire async operation context used to be serialized directly in the Async Operation table (as **data** property), leading to very quick growth in size in case of asynchronous plugin registrations on large entities (such as attachment). Since early 2021, the data portion of async operations is moved to file capacity. As a result, async operation data size is partially counted in database capacity and partially in file capacity. This helps reduce the cost (since file capacity is charged at a lower rate than database capacity) and improves overall performance of their organization (since queries against the Async Operation table are more performant). 

For more information on Dataverse storage model and reporting, see [New Microsoft Dataverse storage capacity](capacity-storage.md). 

### See also
[Reduce database storage](free-storage-space.md#reduce-database-storage) <br />
[Microsoft Dataverse real-time workflows](/power-apps/maker/data-platform/overview-realtime-workflows) <br />
[Classic Dataverse background workflows](/power-automate/workflow-processes) <br />
[Asynchronous service](/power-apps/developer/data-platform/asynchronous-service)