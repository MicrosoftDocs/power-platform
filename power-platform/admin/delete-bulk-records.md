---
title: Delete bulk records 
description: Delete bulk records.
author: bhgoswam 
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/23/2025
ms.subservice: admin
ms.author: bhgoswam
search.audienceType: 
  - admin
---
# Remove a large amount of specific, targeted data with bulk deletion 

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

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

- Follow the steps in [View your user information](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

  
## Delete bulk data 
  
1. Select an environment and go to **Settings** > **Data management** > **Bulk deletion**.
  
2. Select **New** to run the **Bulk Deletion Wizard** to create a bulk deletion job with the records you want to delete.  
  
For information about how to implement bulk delete in code, go to [Delete data in bulk](/powerapps/developer/common-data-service/delete-data-bulk). 

## Restore the deleted records in Power Apps

Restoring the deleted records in the Power Apps user experience is only available for system administrators.

Learn more about how to restore deleted records using the recycle bin in [Turn on recycle bin](restore-deleted-table-records.md).
   
If the recycle bin is not available, learn more in [Back up and restore environments](backup-restore-environments.md).

### Restore all records deleted by a bulk delete job

To restore deleted records, complete the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.
1. Select **Environments** and select the environment for which you want to view and restore deleted records.
1. Select **Settings** > **Data management** > **Bulk deletion**.
1. You can view all the bulk record deletion jobs.
1. Select one or more bulk delete jobs you want to restore, and then select **Restore** on the command bar.
1. Select **OK** to confirm the action to restore.

## Restore individual records
To restore deleted records, complete the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a system administrator.
2. Select **Environments** and select the environment for which you want to view and restore deleted records.
3. Select **Settings** > **Data management** > **Bulk deletion**.
4. You can view all the bulk record deletion jobs.
5. Select the bulk deletion job you want to restore the record from.
6. The record view form opens. At the end of the form is a link. Select **Restore individual records using System Job.**
7. The above link will navigate you to the deleted records tab of the job. Select one or more records you want to restore, and then select **Restore** on the command bar.
8. Select **OK** to confirm the action to restore.

### Related content
- [Add or remove sample data](add-remove-sample-data.md)   
- [Enhance security by encrypting your column-level sensitive data](data-encryption.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
