---
title: "Clean up records from System Job (AsyncOperationBase) and Process Log (WorkflowLogBase) tables"
description: "Learn how to clean up records from System Job (AsyncOperationBase) and Process Log (WorkflowLogBase) tables."
ms.component: pa-admin
ms.topic: how-to
ms.date: 07/18/2024
author: swylezol
ms.subservice: admin
ms.custom: NewPPAC
ms.author: swylezol
ms.reviewer: sericks 
contributors:
  - dhsinms 
  - MicroSri
search.audienceType: 
  - admin
---
# Clean up records from System Job (AsyncOperationBase) and Process Log (WorkflowLogBase) tables

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The [System Job (AsyncOperation) table](/power-apps/developer/data-platform/reference/entities/asyncoperation) stores system jobs. The name of the actual database table is `AsyncOperationBase`. System jobs represent asynchronous operations, including registered workflows, plug-ins, and background operations such as bulk deletion, bulk import, and rollup operations. After the system triggers an event and executes all synchronous extensions, the platform serializes the context for any asynchronous extensions and stores it in the database as an AsyncOperation record.

When an asynchronous workflow is triggered in your Dataverse organization, a record is created in the AsyncOperation table to track the processing of the async job. More records also are created in the [Process Log (WorkflowLog) table](/power-apps/developer/data-platform/reference/entities/workflowlog) to maintain logs for the workflow execution. The name of the actual database table is `WorkflowLogBase`. [Business process flows](/power-automate/business-process-flows-overview) (BPF) also store BPF stage transition and action logs for the BPF in the WorkflowLog table.

If your organization relies heavily on workflows or business process flows, the associated tables can grow significantly over time, potentially leading to performance degradation and excessive database storage consumption.

## Bulk deletion jobs

All environments are configured with an out-of-the-box bulk deletion job to delete successfully completed workflow system jobs older than 30 days. Customers can configure other bulk deletion jobs to delete AsyncOperation records. We recommend that you configure a job that deletes any completed system job (regardless of type or result) older than 30 days so that completed jobs don't accumulate in the AsyncOperation table.

All environments include a built-in bulk deletion job that removes successfully completed workflow system jobs older than 30 days. Customers can create additional bulk deletion jobs to delete AsyncOperation records. We recommend configuring a job that deletes any completed system job—regardless of type or result—older than 30 days to prevent unnecessary buildup in the AsyncOperation table.

You can use the bulk deletion system jobs to delete unneeded records from both AsyncOperation and WorkflowLog tables. To view the bulk deletion system jobs:

### [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**. 
1. Expand **Data management**, then select **Bulk deletion**.
   
### [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Data management**, then select **Bulk deletion**.
---

From the **Bulk Deletion** grid, use the view selector to show the completed, in-progress, pending, and recurring bulk deletion system jobs. 

The **Recurring Bulk Deletion System Jobs** view shows the out-of-the-box job definitions for the recurring bulk deletion system jobs.

When you open one of these system job records, you can see the query uses to identify which records to delete and the schedule the job runs on. For these out-of-the-box system jobs, you can't modify the query used by the system job, but you can modify the schedule the job runs on. 

If you switch the view to display jobs that are scheduled, in progress, or completed, you can cancel, resume, or postpone the job using the options available in the **Actions** menu when viewing the record.

## Create your own bulk deletion jobs

If the out-of-the-box system bulk deletion jobs don't meet your organization's needs, you can create your own bulk deletion job.

From the **Bulk Deletion** grid, select **New** on the command bar. This opens the Bulk Deletion wizard that allows you to define a query for the records you want deleted. The wizard also lets you preview the set of records the query picks up for deletion to allow you to test that you constructed your query correctly.

To clean up workflow records from the AsyncOperation table, in the **Look for** entity dropdown, select the **System Jobs** table; in the **Use saved view** dropdown, select **[new]** to create your own query. You can only delete completed workflows. Workflows waiting to run or currently in progress can't (and shouldn't be) deleted by your system job.

Add the following conditions to your query:

- **System Job Type** Equals **Workflow** — target workflow records.
- **Status** Equals **Completed** — only completed workflows are valid to complete.
- [Optional] Filter on the **Status Reason** Equals **Succeeded/Failed/Canceled** - valid for completed status.
- [Optional] Filter on **Completed On** field to only delete older workflows.
- [Optional] Any more filters you want to apply.

Next you set the frequency of the bulk deletion job to run at. You can create a one-time bulk deletion job or define a schedule to allow your job to run at set intervals.

## Priority-based, bulk delete jobs for asyncoperation

To unblock customers that have significant asyncoperation size, we introduced a **priority-based bulk delete** feature for asyncoperation cleanup. This feature is available by default for all organizations. Here are some key points to note:

- Bulk delete priority applies only to newly created, nonrecurring bulk delete jobs for entity asyncoperation.
- To maximize effectiveness of this feature and get optimal job performance, create jobs with varying filter conditions, such as jobs with different date ranges, system job types, status codes, or any other criteria.
- Organizations can create up to five priority jobs. After those jobs are created, new jobs are created with default preference.
- Regardless of the number of nonasyncoperation entity jobs in the queue, one asyncoperation job can always be created with priority.
- There's no change with respect to creation steps for bulk, delete jobs.

## Best practices for designing workflows

After removing unnecessary records from your workflow tables, consider refining your workflow design to help slow future table growth

For asynchronous workflows, we recommend enabling **Automatically delete completed workflow jobs (to save disk space)** in the workflow editor. This setting allows the system to automatically delete logs for successful completed jobs, conserving storage space. Logs from failed workflow executions are always retained for troubleshooting purpose.

:::image type="content" source="media/bulk-deletion-automatically-delete.png" alt-text="Set Workflow Job Retention to automatically delete completed workflow jobs.":::

For synchronous workflows, we recommend enabling **Keep logs for workflow jobs that encountered errors** in the workflow editor. This setting ensures that logs from failed executions are retained for troubleshooting, while logs from successful run are automatically deleted to save space.

:::image type="content" source="media/bulk-deletion-keep-logs.png" alt-text="Set Workflow Log Retention to keep logs for workflow jobs that encountered errors.":::

## AsyncOperation file capacity usage

Historically, the entire async operation context used to be serialized directly in the AsyncOperation table [Data property](/power-apps/developer/data-platform/reference/entities/asyncoperation#BKMK_Data), leading to quick growth in size if there are asynchronous plug-in registrations on large records (such as attachment). Since early 2021, the data portion of async operations is moved to file store. As a result, async operation data size is partially counted in database capacity and partially in file capacity. This shift helps reduce the costs—since file capacity is charged at a lower rate than database capacity—and improves overall performance by enabling more efficient queries against the AsyncOperation table.

> [!NOTE]
> Files related to AsyncOperation records can't be deleted directly. In order to reclaim file capacity, please review retention and cleanup policies of AsyncOperation records described in this article. When AsyncOperation records are deleted, their corresponding files get deleted as well.

For more information on Dataverse storage model and reporting, see [New Microsoft Dataverse storage capacity](capacity-storage.md).

### See also

[Reduce database storage](free-storage-space.md#reduce-database-storage) <br />
[Remove a large amount of specific, targeted data with bulk deletion](delete-bulk-records.md) <br />
[Microsoft Dataverse real-time workflows](/power-apps/maker/data-platform/overview-realtime-workflows) <br />
[Classic Dataverse background workflows](/power-automate/workflow-processes) <br />
[Automatically delete completed background workflow jobs](/power-automate/best-practices-workflow-processes#automatically-delete-completed-background-workflow-jobs) <br />
[Asynchronous service](/power-apps/developer/data-platform/asynchronous-service)
