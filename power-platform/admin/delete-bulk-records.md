---
title: "Delete bulk records for Dynamics 365 apps | MicrosoftDocs"
ms.custom: 
ms.date: 08/13/2019
ms.reviewer: 
ms.service: power-platform
ms.component: pa-admin
ms.topic: quickstart
ms.suite: 
ms.tgt_pltfrm: 
applies_to: 
  - Dynamics 365 for Customer Engagement  (online)
  - Dynamics 365 for Customer Engagement  Version 9.x
author: jimholtz
ms.assetid: 6c1edaef-d2d0-4e94-bb3d-819b208966c1
caps.latest.revision: 15
ms.author: jimholtz
manager: kvivek
search.audienceType: 
  - admin
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
---
# Remove a large amount of specific, targeted data with bulk deletion 

The *bulk deletion* feature helps you to maintain data quality and manage the consumption of system storage in [!INCLUDE[pn_microsoftcrm](../includes/pn-dynamics-crm.md)] apps by deleting data that you no longer need.  
  
 For example, you can delete the following data in bulk:  
  
- Stale data.  
- Data that is irrelevant to the business.   
- Unneeded test or sample data.  
- Data that is incorrectly imported from other systems.  
  
With bulk deletion you can perform the following operations:  
  
- Delete data across multiple entities.   
- Delete records for a specified entity.   
- Receive email notifications when a bulk deletion finishes.   
- Delete data periodically.   
- Schedule the start time of a recurring bulk delete.   
- Retrieve the information about the failures that occurred during a bulk deletion.  

These settings can be found in the Power Platform Admin center by going to **Environments** > [select an environment] > **Settings** > **Data management** > **Bulk deletion**.

Make sure you have the System Administrator or System Customizer security role or equivalent permissions to update the setting.

- Follow the steps in [View your user profile](https://docs.microsoft.com/dynamics365/customer-engagement/basics/view-your-user-profile).
- Don’t have the correct permissions? Contact your system administrator.

  
## Delete bulk data 
  
1. Select an environment and go to **Settings** > **Data management** > **Bulk deletion**.
  
2. Select **New** to run the **Bulk Deletion Wizard** to create a bulk deletion job with the records you want to delete.  
  
For information about how to implement bulk delete in code, see [Delete data in bulk](https://docs.microsoft.com/dynamics365/customer-engagement/developer/delete-data-bulk). 
  
### See also  
 [Manage your data](https://docs.microsoft.com/dynamics365/customer-engagement/admin/manage-your-data)   
 [Data Encryption](https://docs.microsoft.com/dynamics365/customer-engagement/admin/data-encryption)
