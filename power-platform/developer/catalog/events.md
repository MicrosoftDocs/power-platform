---
title: "Catalog in Power Platform Events reference"
description: "Subscribe to events that notify you when changes occur in the catalog in Power Platform"
author: isaacwinoto
ms.author: isaacwinoto
ms.subservice: developer
ms.date: 11/05/2024
ms.reviewer: jdaly
ms.topic: reference
search.audienceType: 
  - developer
contributors:
 - JimDaly
 - singhguru2001us
---

# Catalog in Power Platform Events reference

The following messages represent events that occur within catalog in Power Platform. Subscribe to these [business events](/power-apps/developer/data-platform/business-events) to enable automation based on the events that occur within the catalog in Power Platform.

## mspcat_OnCatalogApprovalRequested

Event raised when a catalog approval request is received.

### mspcat_OnCatalogApprovalRequested parameters

|Name|Type|Description|
|---------|---------|---------|
|`ApprovalRequest`|[mspcat_certificationrequest record](tables/mspcat_certificationrequest.md)|Approval Request Entity Reference|


## mspcat_OnCatalogApprovalUpdated

Event raised on each update made to the approval record including completion.

###  mspcat_OnCatalogApprovalUpdated parameters

|Name|Type|Description|
|---------|---------|---------|
|`StatusMessage`|string|Status Message from the install process|
|`IsCompleted`|bool|True when the operation is complete|
|`ApprovalRequest`|[mspcat_certificationrequest record](tables/mspcat_certificationrequest.md)|Completed Approval Request|
|`IsApproved`|bool|True when approved|

## mspcat_OnCatalogInstallRequested

Event raised when a Catalog Item is being installed.

### mspcat_OnCatalogInstallRequested parameters

|Name|Type|Description|
|---------|---------|---------|
|`InstallHistory`|[mspcat_installhistory record](tables/mspcat_installhistory.md)|Install History entity reference that is the subject of this notification |
|`CatalogItem`|[mspcat_applications record](tables/mspcat_applications.md)|Catalog Item|

## mspcat_OnCatalogInstallUpdated

Event raised on each status event received by the system.

### mspcat_OnCatalogInstallUpdated parameters

|Name|Type|Description|
|---------|---------|---------|
|`CatalogItem`|[mspcat_applications record](tables/mspcat_applications.md)|Catalog Item|
|`StatusMessage`|string|Status Message from the install process|
|`IsCompleted`|bool|True of the operation is complete|
|`InstallHistory`|[mspcat_installhistory record](tables/mspcat_installhistory.md)|Install History entity reference that is the subject of this notification|
|`IsSuccess`|bool|True when request was completed successfully|