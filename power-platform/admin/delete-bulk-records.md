---
title: Delete bulk records 
description: Learn what steps you need to take to remove a large amount of specific, targeted data with bulk deletion.
author: bhgoswam 
ms.component: pa-admin
ms.topic: how-to
ms.date: 03/27/2026
ms.subservice: admin
ms.custom: NewPPAC
ms.author: bhgoswam
ms.reviewer: ellenwehrle
contributor: yingchin
search.audienceType: 
  - admin
---
# Remove a large amount of specific, targeted data with bulk deletion

The *bulk deletion* feature helps you delete data you no longer need so you can maintain data quality and manage the consumption of system storage.  
  
For example, you can delete the following data in bulk:  
  
- Stale data.  
- Data that is irrelevant to the business.
- Unneeded test or sample data.  
- Data that is incorrectly imported from other systems.  
  
With bulk deletion, you can perform the following operations:  
  
- Delete data across multiple tables.
- Delete records for a specified table.
- Receive email notifications when a bulk deletion finishes.
- Delete data periodically.
- Schedule the start time of a recurring bulk delete.
- Retrieve the information about the failures that occurred during a bulk deletion.  

You can access bulk delete settings in the Microsoft Power Platform admin center. To update the settings, ensure you have System Administrator permissions. To verify your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you lack the necessary permissions, contact your system administrator.
  
## Delete bulk data

To delete bulk data, take these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Data management**, then select **Bulk deletion**.
1. Select **New** to run the **Bulk Deletion Wizard** to create a bulk deletion job with the records you want to delete.

### Permanent deletion

The Bulk Deletion Wizard includes a **Permanent deletion** checkbox. When selected, records deleted by the bulk delete job are permanently removed and can't be recovered. If [deleted record keeping](restore-deleted-table-records.md) is turned on for your environment, this option skips the step of moving data to deleted records tables, which results in faster job execution.

Permanent deletion is useful when you need to:

- Remove data that is no longer needed in the system, such as logs and activities that are irrelevant after a certain period.
- Run bulk delete jobs faster, since skipping the step of moving data to deleted tables significantly improves job performance.

> [!CAUTION]
> Use the **Permanent deletion** option judiciously. Data deleted with this option is permanently lost and can't be restored. Ensure the data targeted by the bulk delete job is no longer needed before you select this checkbox.

To learn how to implement bulk delete in code, go to [Delete data in bulk](/powerapps/developer/common-data-service/delete-data-bulk).

## Restore deleted records in Power Apps

As a system administrator, you can retrieve deleted records within a specified time frame that you configure.

You can learn more about how to restore deleted records using the deleted records feature in [Restore deleted Microsoft Dataverse table records](restore-deleted-table-records.md).

If the deleted records feature isn't turned on, you can learn to [Back up and restore environments](backup-restore-environments.md).

### Restore all records deleted by a bulk delete job

To restore deleted records, take these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Data management**, then select **Bulk deletion**.

6. You can view all the bulk record deletion jobs.
7. Select one or more bulk delete jobs you want to restore, then select **Restore** on the command bar.
8. Select **OK** to confirm the action to restore.

## Restore individual records

To restore deleted records, take these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Data management**, then select **Bulk deletion**.

6. You can view all the bulk record deletion jobs.
7. Select the bulk deletion job you want to restore the record from.
8. The record view form opens. Select the link **Restore individual records using System Job** at the end of the form.
9. The **Deleted Records** tab of the job is shown. Select one or more records you want to restore, then select **Restore** on the command bar.
10. Select **OK** to confirm the action to restore.  

## Error handling

Errors encountered during a bulk delete job are visible under a **Run details** tab.

If a job failed to run, open the latest completed job, and select the **Run details** tab to view all the errors that were encountered during the job.

The top section clearly displays the following details:

- Job status
- Start time
- End time
- Number of records deleted
- Number of records failed
- Number of errors, if any

A **Failed** status indicates that the job didn't start. Open the job to review failure reasons.

## Solution-aware bulk deletion jobs

Bulk delete jobs are solution-aware, so you can add them to an unmanaged solution to make them portable across environments. This helps admins follow application lifecycle management (ALM) best practices and reduces the risk of misconfigurations.

To add a bulk deletion job to a solution, go to the Power Apps maker portal, create or open a solution, and then follow these steps:

1. Select **Add existing** > **More** > **Other** > **Data Life Cycle Config**.
2. Select one or more bulk deletion jobs to add to the solution.

The **Data Life Cycle Config** is used to include both archival and deletion policies in a solution.

Exporting and importing solutions containing bulk deletion jobs works the same as with other solution components. For example, develop and test a bulk deletion job in a sandbox environment, validate it in preproduction, then import the solution into production.

> [!NOTE]
> - Only admins can create and import solutions containing bulk deletion jobs.
> - Only bulk deletion jobs created in Power Platform environments can be solution-aware.
> - Only job definitions are portable. Deleted data isn't included. 
> - Imported bulk deletion jobs run immediately on import. Plan imports carefully.

### Related content

- [Add or remove sample data](add-remove-sample-data.md)
- [Enhance security by encrypting your column-level sensitive data](data-encryption.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
