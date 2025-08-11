---
title: Delete completed system jobs and process log to comply with retention policy
description: Learn how to clean up records from System Job (AsyncOperationBase) and Process Log (WorkflowLogBase) tables.
ms.component: pa-admin
ms.topic: how-to
ms.date: 08/11/2025
author: paulliew
ms.subservice: admin
ms.author: paulliew
ms.reviewer: sericks 
contributors:
  - swylezol
  - Paulliew
  - dhsinms 
  - MicroSri
  - sericks
search.audienceType: 
  - admin
ms.custom:
  - NewPPAC
  - sfi-image-nochange

---

# Delete completed system jobs and process log to comply with retention policy

Managing completed system jobs and the process log is crucial for maintaining data privacy compliance and ensuring optimal system performance in Dataverse. 

The System Job [AsyncOperation](/power-apps/developer/data-platform/reference/entities/asyncoperation) table stores system jobs. The actual database table name is AsyncOperationBase. System jobs represent asynchronous operations, including registered workflows, plug-ins, and background operations such as bulk deletion, bulk import, and roll-up operations.

When an asynchronous workflow starts in your Dataverse organization, a record is created in the AsyncOperation table to track its progress. Additional records are created in the Process Log (WorkflowLog) table to keep logs of the workflow execution. The actual database table name for these logs is WorkflowLogBase. Business process flows also store logs for stage transitions and actions in the WorkflowLog table.

Every time a system job completes, its outcome is logged as a system job in a AsyncOperation record. Completed system jobs are records that capture the results of these various automated operations in Dataverse.  Over time, these records accumulate and, if unmanaged, can impact system storage and performance.

If your organization relies heavily on workflows or business process flows, the associated tables can grow significantly over time, potentially leading to performance degradation and excessive database storage consumption.

## Types of completed system jobs and their statuses
### System jobs
- Delete plug-in trace log records
- Delete completed system jobs
- Delete completed process sessions for Sync workflows

Completed system jobs are categorized into three main types based on their completion status:

- **Succeeded**: Jobs that have been completed successfully without errors. 
- **Failed**: Jobs that have encountered errors and have not completed as intended.
- **Canceled**: Jobs that were stopped before completion, either by user intervention or by system constraints.

## Deletion service to automatically delete completed system jobs
By default, the system provides a deletion service to automatically delete system jobs that either completed successfully, failed, or were cancelled. This default is set in the OrganizationSettingsEditor tool. 

To check this setting:

1. Install the [OrganizationSettingsEditor tool](environment-database-settings.md#install-the-organizationsettingseditor-tool).
2. Add and edit the [EnableSystemJobCleanup](environment-database-settings.md#override-database-settings).
3. Set the **EnableSystemJobCleanup** to 'true' (if this is not already set to **true**).

## Set retention policy
There are three parameters to allow different retention periods to be set.

- **SucceededSystemJobPersistenceInDays** for succeeded jobs.
    - Add and edit [SucceededSystemJobPersistenceInDays](environment-database-settings.md#override-database-settings).
    - The default is 30 days.
    - Update this with your own day period.
   
- **FailedSystemJobPersistenceInDays** for failed jobs.
    -  Add and edit [FailedSystemJobPersistenceInDays](environment-database-settings.md#override-database-settings).
    -  The default is 60 days.
    -  Update this with your own day period.
   
- **CancelledSystemJobPersistenceInDays** for cancelled jobs.
    -  Add and edit [CancelledSystemJobPersistenceInDays](environment-database-settings.md#override-database-settings).
    -  The default is 60 days.
    -  Update this with your own day period.
   
> [!NOTE]
> This deletion service deletes the system jobs. Deleted system jobs no longer show up in the **All System jobs** or the **All Bulk Deletion System jobs** lists.
> There is a recurring job called **Delete completed system jobs**. This job is suspended when the deletion service is on.

## Bulk deletion jobs

> [!Important]
> This job is in a **suspended** state when the deletion service is used. 

All environments are configured with an out-of-the-box bulk deletion job to delete successfully completed workflow system jobs older than 30 days. Customers can configure other bulk deletion jobs to delete AsyncOperation records. We recommend setting up a job to delete completed system jobs—regardless of type or outcome—that are older than 30 days. This job helps prevent the AsyncOperation table from accumulating excess records. 

All environments include a built-in bulk deletion job that removes successfully completed workflow system jobs older than 30 days. Customers can create more bulk deletion jobs to delete AsyncOperation records. We recommend configuring a job that deletes any completed system job—regardless of type or result—older than 30 days to prevent unnecessary buildup in the AsyncOperation table.

You can use the bulk deletion system jobs to delete unneeded records from both AsyncOperation and WorkflowLog tables. 

### View the bulk deletion system jobs
The bulk record deletion jobs show the history of system jobs that were run and the results. 
> [!NOTE]
> This Deletion service deletes the system jobs in the backend and deleted bulk deletion system jobs will no longer show up **All System jobs** or the **All Bulk Deletion System jobs** lists.

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

You can also access the **Bulk record deletion** from the Power Platform Environment Settings app.
From the left nav, **Data Management**/**Bulk record deletion**.

---

From the **Bulk Deletion** grid, use the view selector to show the completed, in-progress, pending, and recurring bulk deletion system jobs. 

The **Recurring Bulk Deletion System Jobs** view shows the out-of-the-box job definitions for the recurring bulk deletion system jobs.

When you open one of these system job records, you can see the query uses to identify which records to delete and the schedule the job runs on. For these out-of-the-box system jobs, you can't modify the query used by the system job, but you can modify the schedule the job runs on. 

If you switch the view to display jobs that are scheduled, in progress, or completed, you can cancel, resume, or postpone the job using the options available in the **Actions** menu when viewing the record.

## Create your own bulk deletion jobs

If the [Deletion service](deletion-service-to-automatically-delete-completed-system-jobs) or the out-of-the-box system bulk deletion jobs don't meet your organization's needs, you can create your own bulk deletion job.

First turn the Deletion Service off by:
1. Add and edit the [EnableSystemJobCleanup](https://learn.microsoft.com/power-platform/admin/environment-database-settings#override-database-settings).
1. Set the **EnableSystemJobCleanup** to 'false'.

From the **Bulk Deletion** grid, select **New** on the command bar to define a query for the records you want to delete. Use the preview feature to review the records the query returns and verify that it captures the intended data set.

To clean up workflow records from the AsyncOperation table, in the **Look for** entity dropdown, select the **System Jobs** table; in the **Use saved view** dropdown, select **[new]** to create your own query. You can only delete completed workflows. Workflows waiting to run or currently in progress can't (and shouldn't be) deleted by your system job.

Add the following conditions to your query:

- **System Job Type** Equals **Workflow** (*Optional*)- target workflow records.
- **Status** Equals **Completed** - only completed workflows are valid to complete.
- [Optional] Filter on the **Status Reason** Equals **Succeeded/Failed/Canceled** - valid for completed status.
- [Optional] Filter on **Completed On** field to only delete older workflows.
- [Optional] Any more filters you want to apply.

Next you set the frequency of the bulk deletion job to run at. You can create a one-time bulk deletion job or define a schedule to allow your job to run at set intervals.

## Priority-based, bulk delete jobs for asyncoperation

To unblock customers that have significant asyncoperation size, we introduced a **priority-based bulk delete** feature for asyncoperation cleanup. This feature is available by default for all organizations. Here are some key points to note:

- Bulk delete priority applies only to newly created, nonrecurring bulk delete jobs for the AsyncOperation entity.
- To maximize this feature's effectiveness and optimize job performance, create jobs with varying filter conditions—such as different date ranges, system job types, status codes, or other criteria.
- Organizations can define up to five priority jobs. Any more jobs are created with default priority.
- Regardless of the number of jobs for other entities in the queue, one AsyncOperation job can always be created with priority.
- There's no change with respect to creation steps for bulk, delete jobs.

## Plug-in trace logs
[Plug-in](https://learn.microsoft.com/power-apps/developer/data-platform/tutorial-write-plug-in) can be used for asynchronous operation, an example is to create a task upon an account creation. When you are testing the plug-in, you can set [PluginTraceLogSetting](https://learn.microsoft.com/power-apps/developer/data-platform/logging-tracing#enable-trace-logging) to all or exceptions. You can view the plug-in trace logs in Power Platform Environment Settings. 
To automate the cleanup of Plug-in Trace logs, Dataverse provides a recurring job that deletes records older than 1 day.
-	This job runs every day, ensuring that the system does not retain unnecessary Plug-in Trace logs indefinitely.
-	The deletion process helps free up storage space and keeps the system performing efficiently.

Although you can delete Plug-in trace logs daily, it's recommended not to enable this option in your Production environment as it may affect system performance and storage. Instead, ensure that the [PluginTraceLogSetting](https://learn.microsoft.com/power-apps/developer/data-platform/logging-tracing#enable-trace-logging) is set to off for the Production environment. This best practice ensures that the plugin trace log table will not grow uncontrollably and causes the database to reach its capacity limit.

## Process sessions for Sync Workflows
Process session (dialog session) is created when a user run or execute a dialog process. It contains the logs about the run such as the user who ran it, time the process started, and the actions performed.
To automate the cleanup of Process sessions, Dataverse provides a recurring job that deletes records older than 1 day. 
- This job runs every day, ensuring that the system does not retain unnecessary process sessions indefinitely.
- The deletion process helps free up storage space and keeps the system performing efficiently.

## Best practices for designing workflows

After removing unnecessary records from your workflow tables, consider refining your workflow design to help slow future table growth

For asynchronous workflows, we recommend enabling **Automatically delete completed workflow jobs (to save disk space)** in the workflow editor. This setting allows the system to automatically delete logs for successful completed jobs, conserving storage space. Logs from failed workflow executions are always retained for troubleshooting purpose.

:::image type="content" source="media/bulk-deletion-automatically-delete.png" alt-text="Set Workflow Job Retention to automatically delete completed workflow jobs.":::

For synchronous workflows, we recommend enabling **Keep logs for workflow jobs that encountered errors** in the workflow editor. This setting ensures that logs from failed executions are retained for troubleshooting, while logs from successful run are automatically deleted to save space.

:::image type="content" source="media/bulk-deletion-keep-logs.png" alt-text="Set Workflow Log Retention to keep logs for workflow jobs that encountered errors.":::

## AsyncOperation file capacity usage

Historically, the entire async operation context used to be serialized directly in the AsyncOperation table [Data property](/power-apps/developer/data-platform/reference/entities/asyncoperation#BKMK_Data), leading to quick growth in size if there are asynchronous plug-in registrations on large records (such as attachment). Since early 2021, the data portion of async operations is moved to file store. As a result, async operation data size is partially counted in database capacity and partially in file capacity. This shift helps reduce the costs—since file capacity is charged at a lower rate than database capacity—and improves overall performance by enabling more efficient queries against the AsyncOperation table.

> [!NOTE]
> Files related to AsyncOperation records can't be deleted directly. To reclaim file capacity, review the retention and cleanup policies for AsyncOperation records described in this article. When AsyncOperation records are deleted, their corresponding files get deleted as well.

For more information on Dataverse storage model and reporting, see [New Microsoft Dataverse storage capacity](capacity-storage.md).

### See also

[Reduce database storage](free-storage-space.md#reduce-database-storage) <br />
[Remove a large amount of specific, targeted data with bulk deletion](delete-bulk-records.md) <br />
[Microsoft Dataverse real-time workflows](/power-apps/maker/data-platform/overview-realtime-workflows) <br />
[Classic Dataverse background workflows](/power-automate/workflow-processes) <br />
[Automatically delete completed background workflow jobs](/power-automate/best-practices-workflow-processes#automatically-delete-completed-background-workflow-jobs) <br />
[Asynchronous service](/power-apps/developer/data-platform/asynchronous-service)
