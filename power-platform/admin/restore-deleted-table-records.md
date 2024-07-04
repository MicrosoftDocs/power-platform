---
title: Restore deleted Microsoft Dataverse table records (preview)
description: "Learn how to use the Power Platform admin center to view restore deleted Microsoft Dataverse table records."
author: Mattp123
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/28/2024
ms.subservice: admin
ms.author: adkuppa
search.audienceType: 
  - admin
contributors:
- adkuppa
---
# Restore deleted Microsoft Dataverse table records (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

As part of the regular business processes with Microsoft Dataverse, users often delete records or transactions either manually or systematically, either planned or by accident, via system processes, single selection, multiple selections, and bulk deletion. Retrieving deleted data is hard and often records aren't always recoverable. To address this limitation, the recycle bin is available to recover table record data from any type of delete scenario within a specified configurable time frame.

Developers should read [Restore deleted records with code (preview)](/power-apps/developer/data-platform/restore-deleted-records) to learn how to interact with this feature using code.

> [!IMPORTANT]
>
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> - This feature is currently being deployed and might not yet be available in your region.
> - During preview, any storage used by the recycle bin will not count against your organization's storage capacity.

## Prerequisites

To use this feature, it must be enabled in the environment where you want to restore Dataverse table records.

### Enable restore table records

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as an admin (Dynamics 365 admin, Global admin, or Microsoft Power Platform admin).
1. Select **Environments** and open the environment you want.
1. Select **Settings** > **Product** > **Features**.
1. Scroll down to view the **Recycle Bin** settings.

   - Turn **On** the **Recycle Bin** setting.
   - Specify the time interval, to be able to restore table records. You can restore table records up to *30* days after the record was deleted.

## View and restore the deleted records in Power Apps 

Viewing and acting on the deleted records in the Power Apps user experience is only enabled for System Administrators in the preview phase. 

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com) as a user with the system administrator security role. 
1. Select **Environments** and open the environment you want to view and restore deleted records.
1. Go to **Settings** > **Data management** > **View Deleted Records**.
1. You can view all the deleted records from all tables in a new tab. 
1. Select one or more records you wish to restore, and then select **Restore** on the command bar.
   :::image type="content" source="media/restore-deleted-table-record.png" alt-text="Restore deleted table records" lightbox="media/restore-deleted-table-record.png":::

1. Select **Ok** to confirm the action to restore.

## Known issues
### Some records aren't restored

Some organizations add custom business logic that deletes records related to a record that is deleted. To restore related records deleted by custom business logic, you need to apply the opposite logic on the `Restore` operation to recover the records when you restore the original record that was deleted.

Records deleted via the table relationship cascade behavior process can be restored. For more information about cascade behavior, go to [Configure table relationship cascading behavior](/power-apps/developer/data-platform/configure-entity-relationship-cascading-behavior).

### Deleted records aren't shown after turning on the recycle bin

Deleted records might not appear when the recycle bin feature is turned on. Verify that the **Enable RecycleBin for Organization** system job is turned on. Go to the Power Platform admin center, select the environment where this issue is happening, and select **Settings** > **Audit and logs** > **System jobs**. On the **System Jobs** page, search for **Enable RecycleBin**. Confirm that the **Status Reason** is **Succeeded**. 

If the **Status Reason** isn't **Succeeded**, or despite the success state appearing correct, and you're not seeing the **Restore** option for deleted records, contact a [Microsoft support representative and create a support request](get-help-support.md).

### Records deleted through cascading behaviors aren't present in Deleted Records view

Records that were deleted through automated, cascading behaviors can't be restored independently. These records need to be restored in the order in which they were deleted. The original record that was deleted must be restored before any related records that were deleted through automated cascading behaviors. 

For more information about cascading behavior, go to [Configure table relationship cascading behavior](/power-apps/developer/data-platform/configure-entity-relationship-cascading-behavior).

### See also

[Restore deleted records with code (preview)](/power-apps/developer/data-platform/restore-deleted-records)

