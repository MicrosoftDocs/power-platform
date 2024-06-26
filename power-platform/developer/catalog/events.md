---
title: "Catalog for Power Platform Events reference (preview)"
description: "Subscribe to events that notify you when changes occur in the catalog for Power Platform"
author: derekkwanpm
ms.author: derekkwan
ms.subservice: developer
ms.date: 07/01/2024
ms.reviewer: jdaly
ms.topic: reference
search.audienceType: 
  - developer
contributors:
 - JimDaly
---

# Catalog for Power Platform Events reference (preview)

The following messages represent events that occur within catalog for Power Platform. Subscribe to these [business events](/power-apps/developer/data-platform/business-events) to enable automation based on the events that occur within the catalog for Power Platform.

## mspcat_OnCatalogApprovalRequested

Event raised when a catalog approval request is received.

### mspcat_OnCatalogApprovalRequested parameters

|Name|Type|Description|
|---------|---------|---------|
|`ApprovalRequest`|[mspcat_certificationrequest record](tables/mspcat_certificationrequest.md)|Approval Request Entity Reference|


## mspcat_OnCatalogApprovalUpdated

Catalog Approval Updated Event raised when a catalog approval request is completed.

###  mspcat_OnCatalogApprovalUpdated parameters

|Name|Type|Description|
|---------|---------|---------|
|`StatusMessage`|string|Status Message from the install process|
|`IsCompleted`|bool|True of the operation is complete|
|`ApprovalRequest`|[mspcat_certificationrequest record](tables/mspcat_certificationrequest.md)|Approval Request that has been completed|
|`IsApproved`|bool|True if is approved|

## mspcat_OnCatalogInstallRequested

Catalog Install Requested Event, raised when a Catalog Item is being installed.

### mspcat_OnCatalogInstallRequested parameters

|Name|Type|Description|
|---------|---------|---------|
|`InstallHistory`|[mspcat_installhistory record](tables/mspcat_installhistory.md)|Install History entity reference that is the subject of this notification |
|`CatalogItem`|[mspcat_applications record](tables/mspcat_applications.md)|Catalog Item|

## mspcat_OnCatalogInstallUpdated

Catalog Install Updated Event, Raised on each status event received by the system.

### mspcat_OnCatalogInstallUpdated parameters

|Name|Type|Description|
|---------|---------|---------|
|`CatalogItem`|[mspcat_applications record](tables/mspcat_applications.md)|Catalog Item|
|`StatusMessage`|string|Status Message from the install process|
|`IsCompleted`|bool|True of the operation is complete|
|`InstallHistory`|[mspcat_installhistory record](tables/mspcat_installhistory.md)|Install History entity reference that is the subject of this notification|
|`IsSuccess`|bool|Will be set to true if the request was completed successfully|