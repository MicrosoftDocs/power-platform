---
title: ActivityPointerBase table storage
description: Learn about managing ActivityPointerBase table storage.
author: ceian
ms.component: pa-admin
ms.topic: concept-article
ms.date: 08/01/2024
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
The **ActivityPointerBase** table is used to store information about activities in Microsoft Dynamics 365 customer engagement apps and Power Apps. It stores the following information:

- **Activity details**: The table includes all default, activity columns such as subject, description, owner, regarding, and status. For a full list of the columns in this table, go to [activitypointer EntityType](/power-apps/developer/data-platform/webapi/reference/activitypointer).

- **Description**: The description column contains the description for each activity in the system. It's the same column used to store the email body for an email activity. Because an email body can include a large amount of text, large emails can contribute to the growth in data capacity consumed by this table. The storage of this column is moving to blob storage. Learn more in [Transition period](/power-apps/developer/data-platform/email-activity-entities#transition-period).

- **Activity type**: Each activity pointer row has an activity type defining the type of the activity (email, appointment, or custom activity). These fields can be used to define how many rows in **ActivityPointerBase** are from each activity type. 

The activities view and timeline wall are common places where the activity pointer data is displayed. Deleting data in the **ActivityPointerBase** table results in data not being displayed in these views. For example, check out the following images.

:::image type="content" source="media/manage-storage-activitypointerbase-activity-type.png" alt-text="Activity example for the ActivityPointerBase table." lightbox="media/manage-storage-activitypointerbase-activity-type.png" :::

:::image type="content" source="media/manage-storage-activitypointerbase-activity-timeline.png" alt-text="Activity timeline example for the ActivityPointerBase table." lightbox="media/manage-storage-activitypointerbase-activity-timeline.png" :::

## Causes of growth
The main cause of growth of the **ActivityPointerBase** table is the regular usage of activities in the system. The **ActivityPointerBase** table concentrates all types of activities, so the table storage associated with the **ActivityPointerBase** table increases in size when activities in the use of the system grow in frequency. For example when more emails, appointments, and custom activities occur, the table increases in size.

## Table clean-up

To ease operational capacity pressure, it might make more sense for you to increase the amount of storage space you have with your [!INCLUDE[pn_Online_Subscription](../includes/pn-online-subscription.md)], instead of reducing the amount of storage space used. This is especially true since you need to test deletion actions in a sandbox environment first.  

> [!WARNING]
> Deleting data in the **ActivityPointerBase** table results in data not being displayed in email, appointments, and custom activity views.
>
> Be sure to **test these actions in a sandbox environment** before proceeding. 

If you want to retain the data, but remove it from the relational storage, go to [Dataverse long term data retention](/power-apps/maker/data-platform/data-retention-overview).

To clean up the **ActivityPointerBase** table, customers can search for and delete any activities that aren't relevant to their business. 

Set up a [bulk delete](delete-bulk-records.md) job to keep the size down in the future. 

Additionally, customers can find email messages with a search, and then delete them to reduce the size of the table.

If any of the activity views in Dynamics 365 contain a description field, this causes the index of the table to grow. Customers should consider removing the description field from the view.

### Related information

- [Activities data model and storage](/power-apps/developer/data-platform/activities-data-model-storage)
- [Dataverse storage capacity](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
