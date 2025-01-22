---
title: Delete bulk records 
description: Delete bulk records.
author: bhgoswam 
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/22/2025
ms.subservice: admin
ms.author: bhgoswam
search.audienceType: 
  - admin
---
# Remove a large amount of specific, targeted data with bulk deletion 

The *bulk deletion* feature helps you to maintain data quality and manage the consumption of system storage by deleting data that you no longer need.  
  
 For example, you can delete the following data in bulk:  
  
- Stale data.  
- Data that is irrelevant to the business.   
- Unneeded test or sample data.  
- Data that is incorrectly imported from other systems.  
  
With bulk deletion you can perform the following operations:  
  
- Delete data across multiple tables.   
- Delete records for a specified table.   
- Receive email notifications when a bulk deletion finishes.   
- Delete data periodically.   
- Schedule the start time of a recurring bulk delete.   
- Retrieve the information about the failures that occurred during a bulk deletion.  

These settings can be found in the Microsoft Power Platform admin center by going to **Environments** > [select an environment] > **Settings** > **Data management** > **Bulk deletion**.

Make sure you have the System Administrator permission to update the setting.

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

  
## Delete bulk data 
  
1. Select an environment and go to **Settings** > **Data management** > **Bulk deletion**.
  
2. Select **New** to run the **Bulk Deletion Wizard** to create a bulk deletion job with the records you want to delete.  
  
For information about how to implement bulk delete in code, see [Delete data in bulk](/powerapps/developer/common-data-service/delete-data-bulk). 

## Restore the deleted records in Power Apps

   Restoring the deleted records in the Power Apps user experience is only available for System Administrators.

   To restore deleted records using recycle bin, [turn on recycle bin](/restore-deleted-table-records).
   
   If Recycle bin is not available, see [Restore backup environments](backup-restore-environments.md).

### Restore all records deleted by a bulk delete job.

To restore deleted records from the admin center:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a user with the system administrator security role.
1. Select **Environments** and open the environment you want to view and restore deleted records.
1. Go to **Settings** > **Data management** > **Bulk Record Deletion**.
1. You can view all the bulk record deletion jobs.
1. Select one or more bulk delete jobs you wish to restore, and then select **Restore** on the command bar.
1. Select **OK** to confirm the action to restore.
   
:::image type="content" source="media/restorerecords.png" alt-text="Screenshot for restore records":::

## Restore individual record
To restore deleted record from admin center
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a user with the system administrator security role.
2. Select **Environments** and open the environment you want to view and restore deleted records.
3. Go to **Settings** > **Data management** > **Bulk Record Deletion**.
4. You can view all the bulk record deletion jobs.
5. Click on the bulk deletion job you wish to restore the record from.
6. The record view form will open. At the end of the form, you will find a link. Click on **Restore individual records using System Job.**
7. The above link will navigate you to the deleted records tab of the job. Select one or more records you wish to restore, and then select **Restore** on the command bar.
8. Select **OK** to confirm the action to restore.

:::image type="content" source="media/restoreindividual.png" alt-text="Screenshot for restore individual record":::

### See also  
 [Manage your data](add-remove-sample-data.md)   
 [Data Encryption](data-encryption.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
