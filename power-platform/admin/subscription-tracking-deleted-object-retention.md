---
title: "Subscription Tracking Deleted Object Table | MicrosoftDocs"
description: Information about changes to retention enteries for Subscription Tracking Deleted Object Table.
author: ceian
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/19/2024
ms.subservice: admin
ms.author: ceian
ms.reviewer: sericks007
contributors:
- shilpr
- sarmathi
search.audienceType: 
  - admin
---

# Subscription Tracking Deleted Object Table

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The **SubscriptionTrackingDeletedObject** table is linked to the **DeletionService** that handles two types of cleanup: organization-wide and records. When records are initially deleted from entity tables, they're added to the **dbo.SubscriptionTrackingDeletedObject** table. This table supplies the **DeletionService** with **ObjectIDs** of removed items for asynchronous cleanup.

## FAQ

### What retention changes are in Subscription Tracking Deleted Object Table entries?
In January 2024, the default retention for entries added to the **dbo.SubscriptionTrackingDeletedObject** table was reduced from 90 days to 7 days.

#### See also
[Dataverse storage capacity](capacity-storage.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
