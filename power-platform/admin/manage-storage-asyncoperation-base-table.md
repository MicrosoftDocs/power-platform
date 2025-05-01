---
title: AsyncOperationBase table storage 
description: Learn about managing AsyncOperationBase table storage.
author: ceian
ms.component: pa-admin
ms.topic: conceptual
ms.date: 05/14/2024
ms.subservice: admin
ms.author: ceian
ms.reviewer: sericks
contributors:
- shilpr
- sarmathi
search.audienceType: 
  - admin
---

# AsyncOperationBase table

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The **AsyncOperationBase** table is used to store system jobs. System jobs represent asynchronous extensions, such as:

- Asynchronous, registered workflows and plug-ins.
- Background operations, such as bulk, deletion jobs, bulk import, and rollup operations.

For a list of asynchronous *operation types*, see [OperationType Choices/Options](/power-apps/developer/data-platform/reference/entities/asyncoperation#operationtype-choicesoptions).
  
Once an event takes place and all immediate extensions are executed, the system then converts the context data for any asynchronous extensions into a structured format that is stored in an **AsyncOperation** record.

For example, an asynchronous, registered workflow could be a process that automatically sends an email to a customer once their order is placed. The workflow follows up with another email when the order is shipped. In such an asynchronous, registered workflow, the platform saves the context of the asynchronous workflow as a record in the **AsyncOperationBase** table. A process log [WorkflowLog](/power-apps/developer/data-platform/reference/entities/workflowlog) is recorded in the **WorkflowLogBase** table to maintain logs for the workflow execution.

These records would include information, such as:

- **ID** of the workflow

- **ID** of the plug-in triggering the workflow

- **Status** of the workflow execution

This table includes all default, activity columns such as name, description, type, operation type, and more.

For a full list of the columns in this table, see [System Job (AsyncOperation) table/entity reference](/power-apps/developer/data-platform/reference/entities/asyncoperation).

From 2021, the data portion of async operations moved from being stored in Dataverse *database* capacity to being stored in Dataverse *file* capacity. This results in async operations data size being partially attributed to Dataverse *database* capacity and partially to Dataverse *file* capacity. By moving to Dataverse *file* capacity, cost is reduced as Dataverse *file* capacity is charged at a lower rate than Dataverse *database* capacity. Additionally, Dataverse *file* capacity improves overall performance as queries against the **Async Operation** table are more performant.

## Causes of growth

The **AsyncOperationBase** table growth directly depends on the number of customizations that the customer's environment relies on. The more asynchronous workflows and plug-ins result in more records being stored in the **AsyncOperationBase** table to track execution of these operations.

If your organization has heavy use of workflows or plug-ins, expect the **AsyncOperationBase** table to be one of the largest consumers of data capacity.

If the size of **AsyncOperationBase** continues to grow over time, verify that the automatic deletion option on asynchronous registrations is set (see how to set this option for workflows and plug-ins in the [appendix](#appendix)). This results in all successfully completed jobs being deleted as soon as they're complete, and keeping size of the table in check.

Some common factors that contribute to the growth of the **AsyncOperationBase** table in Dynamics 365 include:

- **Heavy use of workflows or business process flows**: If an organization has heavy use of workflows or [business process flows](/power-automate/business-process-flows-overview), the **AsyncOperationBase** table grows over time and eventually becomes large enough to cause performance issues.

- **Asynchronous plug-in registrations on large entities**: If there are asynchronous plug-in registrations on large entities, such as attachments, the data portion of async operations can grow quickly, leading to a large **AsyncOperationBase** table.

- **Size of the data portion of async operations**: The size of the data portion of async operations can also contribute to the growth of the **AsyncOperationBase** table.

## Table cleanup

You need to test these deletion actions first in a sandbox environment. To alleviate operational capacity pressure, it may make more sense for you to increase the amount of storage space you have with your [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)], instead of reducing the amount of storage space used.

> [!WARNING]
> To reduce the capacity consumption of the **AsyncOperationBase** table, delete custom metadata related to async jobs. When AsyncOperation entities are deleted, the corresponding files records are also deleted.
>
> These records aren't available after deletion. Proceed with caution when performing bulk delete operations.
>
> Before you delete any data in this table:
>
> - **Review your customizations** on your workflows and [plug-ins running on delete operations](#set-option-to-delete-successfully-completed-asynchronous-plug-in-jobs).
>
> - **Review cascade delete behaviors** to make sure that no data gets unintendedly deleted in the process.
>
> - **Test these actions in a sandbox environment** before proceeding with the final delete operation.

All environments are configured with out-of-box [**bulk delete jobs**](/power-platform/admin/cleanup-asyncoperationbase-table?branch=ceian-manage-storage-database-table-docs#bulk-deletion-jobs) to delete successfully completed workflow system jobs that are older than **30 days**.

To reduce extra capacity associated with the **AsyncOperationBase** table, consider configuring workflow system jobs older than **7 days** to be deleted using [**bulk delete jobs**](/power-platform/admin/cleanup-asyncoperationbase-table?branch=ceian-manage-storage-database-table-docs#bulk-deletion-jobs).

## Diagnostic queries 

Use [Diagnostic queries](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#diagnostic-queries) to help diagnose problems jobs related to **AsyncOperationBase**.

-	[Jobs by state, status, and type](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#jobs-by-state-status-and-type)

-	[Top system jobs that are in suspended state by count](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#top-system-jobs-that-are-in-suspended-state-by-count)

-	[Workflows by count](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#workflows-by-count)

-	[Jobs waiting for system resources to become available](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#jobs-waiting-for-system-resources-to-become-available)

Use the following queries to diagnose problems related to **AsyncOperationBase** file storage.

-	[AsyncOperation file storage datablobid count](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#asyncoperation-file-storage-datablobid-count)

-	[AsyncOperations not in blob storage](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#asyncoperations-not-in-blob-storage)

-	[Find names of jobs using file storage](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#find-names-of-jobs-using-file-storage)

-	[AsyncOperation file size and record count](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#asyncoperation-file-size-and-record-count)

## System job status

To access the **System Jobs** page, use the following steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Environments** in the navigation pane > select your environment > select **Settings** on the command bar.
3. Select **Audit and logs** > **System jobs**.

System jobs have the following status:

- **Completed** - The job no longer executes any step, and providing three possible status reasons:
  
  - **Succeeded** - The job did what was expected.
  
  - **Failed** - There was a failure while processing the job.
  
  - **Canceled** - The job won't be executed.

- **Running** - The job is being processed or executed or an action is taking place and there are three possible status reason values:
  
  - **In Progress** - The job is currently executing.
  
  - **Pausing** - A pause operation was triggered.
  
  - **Cancelling** - Administrator triggered the cancel option.

- **Pending:** - When the system job hasn't met the conditions to be automatically triggered, or there was a failure evaluating the conditions. There are two status reasons on the pending scenario:  
  
  - **Waiting** - Indicates the system job is in a waiting status.
  
  - **Waiting for Resources** - Indicates the system job is waiting for a resource.

> [!NOTE]
> Jobs that are running or pending shouldn't be automatically cleaned. Instead, a manual action to cancel should be triggered.

Customers can configure other [**bulk delete jobs**](/power-platform/admin/cleanup-asyncoperationbase-table?branch=ceian-manage-storage-database-table-docs#bulk-deletion-jobs) to delete **AsyncOperationBase** records.

## Set up bulk delete jobs

To set up [bulk delete jobs](/power-platform/admin/cleanup-asyncoperationbase-table#bulk-deletion-jobs), see the following lists.

### Delete completed, system jobs that are older than seven days

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

2. Select **Environments** in the navigation pane > select your environment > select **Settings** on the command bar.

3. Select **Data management** > **Bulk deletion** > **New**.

4. The **Bulk Deletion Wizard** is displayed. Select **Next**.

5. The **Define Search Criteria** page is displayed. To bulk delete **AsyncOperationBase** records, complete the following steps:
      1. In the **Look for** field, select **System Jobs**.
      2. Enter the following criteria:

          | Group  | Setting   | Criteria | Selected values |
          |---------|---------|---------|------|
          | AND    | Status      | Equals             | Completed   |
          | AND    | Completed On | Older Than X Days  | 7<br><br>Always start with a narrow condition that limits deleted records (**older than 3 years**), then move to progressively wider delete criteria (**older than 3 months**) and then to wider delete criteria (**older than 7 days**). |
          | AND    | System Job Type | Does Not Equal   | Bulk Email <br>Import File Parse<br>Workflow |

6. Select **Preview Records** to view the records that will be deleted from the specified search criteria to make sure that no data gets unintendedly deleted in the process. Then select **Next**.

7. On the **Select Options** page, select the **Run this job after every** option, and then select **7** days. Then select **Next**.

8. On the **Review and Submit Bulk Deletion Details** page, select **Submit**. 
 
For more information on how to configure bulk delete jobs for **AsyncOperationBase** table, see [Cleaning up records from the AsyncOperationBase / WorkflowLogBase table](https://cloudblogs.microsoft.com/dynamics365/it/2018/06/21/cleaning-up-records-from-the-asyncoperationbase-workflowlogbase-table).

### Delete completed, system jobs that are for workflows

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

2. Select **Environments** in the navigation pane > select your environment > select **Settings** on the command bar.

3. Select **Data management** > **Bulk deletion** > **New**.

4. The **Bulk Deletion Wizard** is displayed. Select **Next**.

5. The **Define Search Criteria** page is displayed. To bulk delete **AsyncOperationBase** records, complete the following steps:
     1. In the **Look for field**, select **System Jobs**.
     2. Enter the following criteria:

         | Group  | Setting   | Criteria | Selected values |
         |---------|---------|---------|-----|
         |AND    | Status Reason | Equals | Succeeded    |
         |AND   | Status | Equals  | Completed
         |AND    | System Job Type |Equals   | Workflow |

6. Select **Preview Records** to view the records that will be deleted from the specified search criteria to make sure that no data gets unintendedly deleted in the process. Then select **Next**.

7. On the **Select Options** page, select the **Run this job after every** option, and then select **7** days. Then select **Next**.

8. On the **Review and Submit Bulk Deletion Details** page, select **Submit**.

## Appendix

To learn more about how to set workflow and plug-in jobs, refer to the following sections.

### Set option to delete successfully completed asynchronous workflow jobs

For asynchronous workflows, we recommend selecting the **Automatically delete completed workflow jobs (to save disk space)** option in the workflow editor. This allows the system to delete workflow logs for successful executions to save space.

:::image type="content" source="media/storage-data-WorkflowJobRetentionSetting.png" alt-text="Set Workflow Job Retention to automatically delete completed workflow jobs." lightbox="media/storage-data-WorkflowJobRetentionSetting.png":::
 
### Set option to delete successfully completed asynchronous plug-in jobs

1. [Install Microsoft Power Platform CLI](/power-platform/developer/cli/introduction?tabs=windows#install-microsoft-power-platform-cli)

2. [Download and launch Plug-in Registration Tool](/power-apps/developer/data-platform/download-tools-nuget#download-and-launch-tools-using-power-platform-cli)

3. For custom **Plug-ins**, select **Register New Step**. The **Register New Step** screen is displayed.

4. Complete the following steps:
    1. In **Event Pipeline Stage** area, select **Post Operation**.
    2. In the **Execution Mode** area, select **Asynchronous**.
    3. Select the **Delete AsyncOperation if Status Code = Successful** option.

:::image type="content" source="media/plugin-registration-tool-delete-asyncoperation-option.png" alt-text="Set Delete AsyncOperation if Status Code = Successful" lightbox="media/plugin-registration-tool-delete-asyncoperation-option.png":::

### See also

- [Activities data model and storage](/power-apps/developer/data-platform/activities-data-model-storage)

- [Dataverse storage capacity](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
