---
title: Restore deleted Microsoft Dataverse table records (preview)
description: "Learn how to use the Power Platform admin center to view restore deleted Microsoft Dataverse table records."
author: Mattp123
ms.component: pa-admin
ms.topic: conceptual
ms.date: 06/11/2024
ms.subservice: admin
ms.author: adkuppa
search.audienceType: 
  - admin
---
# Restore deleted Microsoft Dataverse table records (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

As part of the regular business processes with Microsoft Dataverse, users often delete records or transactions either manually or systematically, either planned or by accident, via system processes, single selection, multiple selections, and bulk deletion. Retrieving deleted data is hard and often records aren't always recoverable. To address this limitation, the recycle bin is available to recover table record data from any type of delete scenario within a specified configurable time frame.

Developers should read [Restore deleted records with code (preview)](/power-apps/developer/data-platform/restore-deleted-records) to learn how to interact with this feature using code.

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> - This feature is currently being deployed and might not yet be available in your region.
> - Any storage used by the Recycle bin (preview) will not count against your organization's storage capacity. 

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

### Restore action is sometimes not available even after the Recycle bin feature.

Restore button is not shown sometimes even after the Reccyle bin featured is turned on. Verify if the "Process Recyclebin Operation" is turned on by going to the Power Platform Admin center > select the environment where this issue is happening > Settings > Audit and logs > System jobs > search for "Enable RecycleBin" and confirm the status reason is "Succeeded". If the status reason is not "Succeeded" or despiste success state you are not seeing the Restore option, please create a Customer Support ticket.

### See also

[Restore deleted records with code (preview)](/power-apps/developer/data-platform/restore-deleted-records)

