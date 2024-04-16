---
title: ActivityPointerBase table storage
description: Learn about managing ActivityPointerBase table storage.
author: ceian
ms.component: pa-admin
ms.topic: conceptual
ms.date: 04/16/2024
ms.subservice: admin
ms.author: ceian
ms.reviewer: sericks
contributors:
- shilpr
- sarmathi
search.audienceType: 
  - admin
---

# ActivityPointerBase table
The **ActivityPointerBase** table is used to store information about activities in Microsoft Dynamics 365 Customer Engagement and Power Apps. Here's what is stored in the ActivityPointerBase table:

- **Activity details**: The table includes all default activity columns such as subject, description, owner, regarding, status, and many more. For a full list of the columns in this table, see [activitypointer EntityType](/en-us/power-apps/developer/data-platform/webapi/reference/activitypointer).

- **Description**: The description column contains the description for each activity in the system. It is the same column used to store the email body for an email activity. Because an email body can include a large amount of text, large emails can contribute to the growth in data capacity consumed by this table. The storage of this column is moving to blob storage. See [more details on email body transition](/power-apps/developer/data-platform/email-activity-entities#transition-period).

- **Activity type**: Each activitypointer row has an activityType defining the type of the activity (email, appointment, custom activity). These fields can be used to break down how many rows in **ActivityPointerBase** are from each activityType. 

The activities view and timeline wall are common places where the activitypointer data is displayed, deleting data in activitypointerbase results in data not being displayed in these views:

:::image type="content" source="media/manage-storage-activitypointerbase-activity-type.png" alt-text="Activity Example for ActivityPointerBase." lightbox="media/manage-storage-activitypointerbase-activity-type.png" :::

:::image type="content" source="media/manage-storage-activitypointerbase-activity-timeline.png" alt-text="Activity Timeline example for ActivityPointerBase." lightbox="media/manage-storage-activitypointerbase-activity-timeline.png" :::


## Causes of Growth
The main cause of growth of **ActivityPointerBase** table is the regular usage of activities in the system. The **ActivityPointerBase** table concentrates all types of activities so it is expected that table storage associated  with  **ActivityPointerBase** will increases in size when activities in the use in system grow in frequency (ex. more emails, appointments, custom activities).

## Table Clean Up

>[!Note]
> Due to the need to test these deletion actions first in a sandbox, to alleviate operational capacity pressure it may make more sense for you to increase the amount of storage space you have with your [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)] instead of reducing the amount of storage space used.  

> [!WARNING]
> 
> Deleting data in activitypointerbase will result in data not being displayed in email, appointment, custom activity views.
>
> First **test these actions in a sandbox environment** before proceeding. 

If you want to retain the data but remove it from the relational storage, explore [Dataverse long term data retention](/power-apps/maker/data-platform/data-retention-overview).

To clean up the **ActivityPointerBase** table, customers can search for and delete any activities that are not relevant to their business. 

Set up a [bulk delete](/power-platform/admin/delete-bulk-records) job to keep the size down in the future. 

Additionally, customers can find email messages with a search and delete them to reduce the size of the table.

If any of the activity views in Dynamics contain a description field, this causes the index of the table to grow, so customers should consider removing the description field from the view.

### See also

[Activities data model and storage](/power-apps/developer/data-platform/activities-data-model-storage)

[Dataverse storage capacity](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
