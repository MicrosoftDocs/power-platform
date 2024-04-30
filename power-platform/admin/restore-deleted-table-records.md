---
title: Restore deleted Microsoft Dataverse table records (preview)
description: "Learn how to use the Power Platform admin center to view restore deleted Microsoft Dataverse table records."
author: Mattp123
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/30/2024
ms.subservice: admin
ms.author: adkuppa
search.audienceType: 
  - admin
---
# Restore deleted Microsoft Dataverse table records (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Microsoft Dataverse provides a low code mechanism to manage enterprise as well as consumer data, allowing customers to perform CRUD (create, update, delete) operations on this data in a seamless manner. As part of the regular business processes, users often delete records or transactions either manually or systematically, either planned or by accident, via system processes, single or multiple selection, and bulk deletion. Retrieving deleted data is hard and often not always recoverable, and it requires Microsoft Customer Support engagement. To address this limitation, the recycle bin is available to recover table record data from any type of delete scenario within a specified configurable time frame.

> [!IMPORTANT]
> - This is a preview feature.
> - [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> - This feature is currently being deployed and might not yet be available in your region.

## Prerequisites

To use this feature it must be enabled in the environment where you want to restore Dataverse table records.

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
   :::image type="content" source="media/restore-deleted-table-record.png" alt-text="Restore deleted table records":::

1. Select **Ok** to confirm the action to restore.

## Known issue

### Some Records aren't restored

- Records deleted via plug-ins aren't restored. 
- Records deleted via the cascade behavior process can be restored. 
- To restore other records deleted via the delete plugins, you need restore plug-ins to be registered on the restore API to restore the deleted records. <!-- What are "delete plugins", do you mean a plugin that performs a delete action on a record? What are "restore plugins" and "restore API"? -->