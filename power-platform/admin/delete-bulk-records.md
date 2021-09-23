---
title: "Delete bulk records  | MicrosoftDocs"
description: Delete bulk records 
author: jimholtz
manager: kvivek
ms.service: power-platform
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/13/2019
ms.subservice: admin
ms.author: jimholtz
search.audienceType: 
  - admin
search.app:
  - D365CE
  - PowerApps
  - Powerplatform
  - Flow
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

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the setting.

- Follow the steps in [View your user profile](/powerapps/user/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

  
## Delete bulk data 
  
1. Select an environment and go to **Settings** > **Data management** > **Bulk deletion**.
  
2. Select **New** to run the **Bulk Deletion Wizard** to create a bulk deletion job with the records you want to delete.  
  
For information about how to implement bulk delete in code, see [Delete data in bulk](/powerapps/developer/common-data-service/delete-data-bulk). 
  
### See also  
 [Manage your data](add-remove-sample-data.md)   
 [Data Encryption](data-encryption.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]