---
title: "AsyncOperationBase table storage  | MicrosoftDocs"
description: Information about managing AsyncOperationBase table storage.
author: ceian
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/29/2024
ms.subservice: admin
ms.author: ceian
ms.reviewer: 
contributors:
- shilpr
- sarmathi
search.audienceType: 
  - admin
---

# AsyncOperationBase table

The **AsyncOperationBase** table is used to store System Jobs. System Jobs represent asynchronous extensions such as:
- **Asynchronous** registered **workflows** and **plugins**
- **Background operations**
  - **bulk deletion jobs**, **bulk import**, and **rollup** operations 

 For a list of Async `Operation Types` see [OperationType Choices/Options](power-apps/developer/data-platform/reference/entities/asyncoperation#operationtype-choicesoptions). 
  
Once an event takes place and all immediate extensions are executed, the system then converts the context data for any async extensions into a structured format and stores this in an **AsyncOperation** record.

An example **asynchronous** registered **workflow** could be a process that automatically sends an email to a customer once their order is placed, and follows up with another email when the order is shipped. In such an **asynchronous** registered **workflow**, the platform saves the context of the asynchronous workflow as a record in the **AsyncOperationBase** table and a Process Log [WorkflowLog](/power-apps/developer/data-platform/reference/entities/workflowlog) is recorded in the `WorkflowLogBase` table to maintain logs for the workflow execution. 

These records would include information such as:
- **ID** of the workflow
- **ID** of the plugin triggering the workflow
- **Status** of the workflow execution

This table includes all default activity columns such as name, description, type, operation type, and many more.

For a full list of the columns in this table, see [System Job (AsyncOperation) table/entity reference](/power-apps/developer/data-platform/reference/entities/asyncoperation).

From 2021, the data portion of async operations moved from being stored in Dataverse **Database** capacity to being stored in Dataverse **File** capacity, resulting in async operation data size being partially attributed to Dataverse **Database** capacity and partially to Dataverse **File** capacity. By moving to Dataverse **File** capacity, cost was reduced as Dataverse **File** capacity is charged at a lower rate than Dataverse **Database** capacity. Additionally, Dataverse **File** improves overall performance as queries against the Async Operation table are more performant.

## Causes of Growth
**AsyncOperationBase** table growth directly depends on the number of customizations that the customer's environment relies on. The more asynchronous **workflows** and **plugins** results in more records being stored in the **AsyncOperationBase** table to track execution of these operations. 

If, your organization has heavy use of **workflows** or **plug-ins**, expect the **AsyncOperationBase** table to be one of the largest consumers of data capacity.

If, the size of **AsyncOperationBase** continues to grow over time, verify that the automatic deletion option on asynchronous registrations is set (see how to set this option for workflows and plugins in the [appendix](/power-platform/admin/manage-storage-asyncoperation-base-table#appendix)). This results in all successfully completed jobs to get deleted as soon as they complete keeping size of the table in check. 

Some common factors that contribute to the growth of the **AsyncOperationBase** table in Dynamics 365 include: 
- **Heavy use of workflows or business process flows**: If an organization has heavy use of workflows or [business process flows](/power-automate/business-process-flows-overview) (BPF), the **AsyncOperationBase** table will grow over time and eventually become large enough to cause performance issues. 
- **Asynchronous plug-in registrations on large entities**: If there are asynchronous plug-in registrations on large entities, such as attachments, the data portion of async operations can grow quickly, leading to a large **AsyncOperationBase** table. 
- **Size of the data portion of async operations**: The size of the data portion of async operations can also contribute to the growth of the **AsyncOperationBase** table.

## Table Clean Up

>[!Note]
> Due to the need to test these deletion actions first in a sandbox, to alleviate operational capacity pressure it may make more sense for you to increase the amount of storage space you have with your [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)] instead of reducing the amount of storage space used.  

> [!WARNING]
> To reduce the capacity consumption of **AsyncOperationBase** table involves deleting custom metadata related to async jobs. **Important**: When AsyncOperation entities are deleted the corresponding **files records are also deleted**. 
>
> Following deletion, these records **will not be available anymore**. **Proceed with caution when performing bulk delete operations**.
>
> **Before** proceeding with deleting any data in this table:
>
> **Review your customizations** on your workflows and [plugins running on delete operations](/power-platform/admin/manage-storage-asyncoperation-base-table#set-option-to-delete-successfully-completed-asynchronous-plugin-jobs)
>
> **Review cascade delete behaviors** to make sure that no data gets unintendedly deleted in the process. 
>
> First **test these actions in a sandbox environment** before proceeding with the final delete operation. 

All environments are configured with out-of-box [**Bulk Delete Jobs**](/power-platform/admin/cleanup-asyncoperationbase-table?branch=ceian-manage-storage-database-table-docs#bulk-deletion-jobs) to delete successfully completed workflow System Jobs older than **30 days**. If acceptable to your business, to reduce additional capacity associated with **AsyncOperationBase** table, you can consider configuring worflow system jobs older than **7 days** to be deleted using [**Bulk Delete Jobs**](/power-platform/admin/cleanup-asyncoperationbase-table?branch=ceian-manage-storage-database-table-docs#bulk-deletion-jobs).

## Diagnostic queries (understand the state of the asyncoperation table data)  
Use [Diagnostic queries]([/power-apps/developer/data-platform/asynchronous-service?tabs=sql#diagnostic-queries) to help diagnose problems jobs related to  **AsyncOperationBase**.

•	[Jobs by state, status, and type](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#jobs-by-state-status-and-type)

•	[Top system jobs that are in suspended state by count](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#top-system-jobs-that-are-in-suspended-state-by-count)

•	[Workflows by count](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#workflows-by-count)

•	[Jobs waiting for system resources to become available](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#jobs-waiting-for-system-resources-to-become-available)


Use the following queries tp diagnose problems rleated to  **AsyncOperationBase** File storage.

•	[AsyncOperation file storage datablobid count](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#asyncoperation-file-storage-datablobid-count)

•	[AsyncOperations not in blob storage](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#asyncoperations-not-in-blob-storage)

•	[Find names of jobs using file storage](hpower-apps/developer/data-platform/asynchronous-service?tabs=sql#find-names-of-jobs-using-file-storage)

•	[AsyncOperation file size and record count](/power-apps/developer/data-platform/asynchronous-service?tabs=sql#asyncoperation-file-size-and-record-count)

## System Job Status

:::image type="content" source="media/storage-data-system-jobs.png" alt-text="System Job Status view" lightbox="media/storage-data-system-jobs.png":::

- **Completed** - The job no longer executes any step, and providing 3 possible Status Reasons:   
  - **Succeeded** - The job did what was expected
  - **Failed** - There was a failure while processing the job 
  - **Canceled** - The job won't be executed 
- **Running** - The job is being processed/executed or an action is taking place and there are 3 possible status reason values: 
  - **In Progress** - The job is currently executing 
  - **Pausing** - A Pause operation was triggered 
  - **Cancelling** - Administrator triggered the cancel option
- **Pending:** - When the system job has not met the conditions to be automatically triggered, or there was a failure evaluating the conditions. There are two status reasons on the pending scenario:  
  - **Waiting** 
  - **Waiting for Resources**   

**Jobs that are running or pending should not be automatically cleaned**, instead a manual action to cancel should be triggered. 
 
Customers can configure other [**Bulk Delete Jobs**](/power-platform/admin/cleanup-asyncoperationbase-table?branch=ceian-manage-storage-database-table-docs#bulk-deletion-jobs) to delete **AsyncOperationBase** records. 


## Setup [**Bulk Delete Jobs**](/power-platform/admin/cleanup-asyncoperationbase-table#bulk-deletion-jobs)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Environments** in the left navigation pane, select your environment, select **Settings** on the top menu bar.
3. Select **Data management** > **Bulk deletion**.

:::image type="content" source="media/storage-bulk-delete-create-new-bulk-delete.png" alt-text="The Recurring Bulk Deletion System Jobs view." lightbox="media/storage-bulk-delete-create-new-bulk-delete.png" :::
 
4. To bulk delete **AsyncOperationBase** records specify the following criteria on `System Jobs`.

| Group  | Setting   | Criteria | Selected Values |
   |---------|---------|---------|
   |**AND**     | **Status** | Equals | **`Completed`**    |
   |**AND**    | **Completed On** | Older Than X Days  | **`7`**
   |**AND**     | **System Job Type** | Does Not Equal   | **`Bulk Email` `Import File Parse` `Workflow`** |

:::image type="content" source="media/bulk-deletion-async-operation-base-search-criteria-1.png" alt-text="The Recurring Bulk Deletion System Jobs view." lightbox="media/bulk-deletion-async-operation-base-search-criteria-1.png" :::

5. To bulk delete **AsyncOperationBase** records specify the following criteria on `System Jobs`.

| Group  | Setting   | Criteria | Selected Values |
   |---------|---------|---------|
   |**AND**     | **Status Reason** | Equals | **`Succeeded`**    |
   |**AND**    | **Status** | Equals  | **`Completed`**
   |**AND**     | **System Job Type** |Equals   | **`Workflow`** |

   :::image type="content" source="media/bulk-deletion-async-operation-base-search-criteria-2.png" alt-text="The Recurring Bulk Deletion System Jobs view." lightbox="media/bulk-deletion-async-operation-base-search-criteria-2.png" :::

6. Preview the records that will be deleted from the specified search criteria to nake sure that no data gets unintendedly deleted in the process. 

 :::image type="content" source="media/bulk-deletion-job-preview.png" alt-text="Preview Bulk Deletion Identified records." lightbox="media/bulk-deletion-job-preview.png" :::

[**Bulk Delete Jobs**](/power-platform/admin/cleanup-asyncoperationbase-table?branch=ceian-manage-storage-database-table-docs#bulk-deletion-jobs) can be configured to run **on schedule** and be **recurring** to:
- Delete records once **every week**.

:::image type="content" source="media/bulk-deletion-schedule-1.png" alt-text="Bulk Deletion Schedule" lightbox="media/bulk-deletion-schedule-1.png":::

Always start with a narrow condition that limits deleted records (**older than 3 years**), then move to progressively wider delete criteria (**older than 3 months**) and then to wider delete criteria (**older than 7 days**). 

- Delete records **older** than **1 year**.
- Delete records **older** than **30 days**.
- Delete records **older** than **7 days**.


:::image type="content" source="media/bulk-deletion-schedule-2.png" alt-text="Bulk Deletion Criteria" lightbox="media/bulk-deletion-schedule-2.png":::
 
For more information on how to configure bulk delete jobs for **AsyncOperationBase** table, see [Cleaning up records from the AsyncOperationBase / WorkflowLogBase table](https://cloudblogs.microsoft.com/dynamics365/it/2018/06/21/cleaning-up-records-from-the-asyncoperationbase-workflowlogbase-table).

## Appendix
### **Set option to delete successfully completed asynchronous workflow jobs**

:::image type="content" source="media/storage-data-WorkflowJobRetentionSetting.png" alt-text="Set Workflow Job Retention to automatically delete completed workflow jobs." lightbox="media/storage-data-WorkflowJobRetentionSetting.png":::
 
### **Set option to delete successfully completed asynchronous plugin jobs**
1. [Install Microsoft Power Platform CLI](/power-platform/developer/cli/introduction?tabs=windows#install-microsoft-power-platform-cli)
2. [Download and launch Plugin Registration Tool](/power-apps/developer/data-platform/download-tools-nuget#download-and-launch-tools-using-power-platform-cli)
3. For custom **Plugins**, select **Register New Step**, in Event Pipeline Stage of Execution select **Post Operation**, Execution Mode **Asynchronous**, select **Delete AsyncOperation if Status Code = Successful**

:::image type="content" source="media/plugin-registration-tool-delete-asyncoperation-option.png" alt-text="Set Delete AsyncOperation if Status Code = Successful" lightbox="media/plugin-registration-tool-delete-asyncoperation-option.png":::
 
### See also

[Activities data model and storage](/power-apps/developer/data-platform/activities-data-model-storage)

[Dataverse storage capacity](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
