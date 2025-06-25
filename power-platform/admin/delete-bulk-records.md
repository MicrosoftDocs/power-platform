---
title: Delete bulk records 
description: Learn what steps you need to take to remove a large amount of specific, targeted data with bulk deletion.
author: bhgoswam 
ms.component: pa-admin
ms.topic: how-to
ms.date: 06/24/2025
ms.subservice: admin
ms.custom: NewPPAC
ms.author: bhgoswam
ms.reviewer: ellenwehrle
contributor: yingchin
search.audienceType: 
  - admin
---
# Remove a large amount of specific, targeted data with bulk deletion

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

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

You can access bulk delete settings in the Microsoft Power Platform admin center. To update the settings, ensure you have the System Administrator permission. To verify your security role, see [View your user profile](/powerapps/user/view-your-user-profile). If you lack the necessary permissions, contact your system administrator.
  
## Delete bulk data

To delete bulk data, take these steps:

### [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**, then in the **Manage** pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.
1. Expand **Data management**, then select **Bulk deletion**.
1. Select **New** to run the **Bulk Deletion Wizard** to create a bulk deletion job with the records you want to delete.

### [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environments**.
1. On the **Environments** page, select an environment.
1. In the command bar, select **Settings**.  
1. Expand **Data management**, then select **Bulk deletion**.
1. Select **New** to run the **Bulk Deletion Wizard** to create a bulk deletion job with the records you want to delete.

---

To learn how to implement bulk delete in code, go to [Delete data in bulk](/powerapps/developer/common-data-service/delete-data-bulk).

## Restore deleted records in Power Apps

As a system administrator, you can retrieve deleted records within a specified time frame that you configure.

You can learn more about how to restore deleted records using the recycle bin in [Turn on recycle bin](restore-deleted-table-records.md).

If the recycle bin isn't available, learn more in [Back up and restore environments](backup-restore-environments.md).

### Restore all records deleted by a bulk delete job

To restore deleted records, take these steps:

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

6. You can view all the bulk record deletion jobs.
7. Select one or more bulk delete jobs you want to restore, then select **Restore** on the command bar.
8. Select **OK** to confirm the action to restore.

## Restore individual records

To restore deleted records, take these steps:

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

6. You can view all the bulk record deletion jobs.
7. Select the bulk deletion job you want to restore the record from.
8. The record view form opens. Select the link **Restore individual records using System Job** at the end of the form.
9. The **Deleted Records** tab of the job is shown. Select one or more records you want to restore, then select **Restore** on the command bar.
10. Select **OK** to confirm the action to restore.  

### Related content

- [Add or remove sample data](add-remove-sample-data.md)
- [Enhance security by encrypting your column-level sensitive data](data-encryption.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
