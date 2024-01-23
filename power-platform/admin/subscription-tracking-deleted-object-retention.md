---
title: "Manage PrincipalObjectAccess storage  | MicrosoftDocs"
description: Information about managing Subscription Tracking Deleted Ojbect storage.
author: ceian
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/19/2024
ms.subservice: admin
ms.author: ceian
ms.reviewer: 
contributors:
- shilpr
- sarmathi
search.audienceType: 
  - admin
---
# Subscription Tracking Deleted Object Table
The **SubscriptionTrackingDeletedObject** table is linked to the **DeletionService** that handles two types of cleanup: organization-wide and record-specific. For the latter, when records are initially deleted from entity tables, and are also added to the **dbo.SubscriptionTrackingDeletedObject** table. This table supplies the DeletionService with ObjectIDs of removed items for later asynchronous cleanup.




# FAQ


## What changed related to Retention of Subscription Tracking Deleted Object Table enteries?
In January 2024, the default retention for enteries added to the **dbo.SubscriptionTrackingDeletedObject**  table was reduced from 90 days to 7 days.

### See also
[Dataverse storage capacity](capacity-storage.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]