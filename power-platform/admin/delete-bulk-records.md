---
title: "Delete bulk records  | MicrosoftDocs"
description: Delete bulk records 
author: sericks007

ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/05/2024
ms.subservice: admin
ms.author: sericks
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

## Restore bulk delete records
  To restore bulk deleted records, turn on the recycle bin in your environment.

### Turn on the recycle bin
  1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin or Microsoft Power Platform admin).
  2. Select **Environments** and open the environment you want.
  3.  Select **Settings** > **Product** > **Features**.
  4.  Scroll down to view the **Recycle Bin** settings.
    - Turn **On** the **Recycle Bin** setting.
    - Specify the time interval, to be able to restore table records. You can restore table records up to *30* days after the record was deleted.
 5. Select **Save**.
 6. Allow 30 minutes for the system to configure the recycle bin.

   > [!Note]
   > Only records deleted after the recycle bin feature has been turned on can be restored.

## Restore the deleted records in Power Apps
   Acting on the deleted records in the Power Apps user experience is only available for System Administrators in the preview phase.
   
### Power Platform admin center
To restore deleted records from the admin center:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a user with the system administrator security role.
1. Select **Environments** and open the environment you want to view and restore deleted records.
1. Go to **Settings** > **Data management** > **Bulk Record Deletion**.
1. You can view all the deleted records from all tables.
1. Select one or more records you wish to restore, and then select **Restore** on the command bar.
1. Select **OK** to confirm the action to restore.
   
### See also  
 [Manage your data](add-remove-sample-data.md)   
 [Data Encryption](data-encryption.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]
