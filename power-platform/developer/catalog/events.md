---
title: "Catalog for Power Platform Events reference"
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

# Catalog for Power Platform Events reference

The following messages represent events that occur within catalog for Power Platform. Subscribe to these [business events](/power-apps/developer/data-platform/business-events) to enable automation based on the events that occur within the catalog for Power Platform.

## mspcat_OnCatalogApprovalRequested

Event raised when a catalog approval request is received.

### mspcat_OnCatalogApprovalRequested parameters


|Name|Type|Description|
|---------|---------|---------|
|ApprovalRequest|entity|mspcat_certificationrequest TODO|


## mspcat_OnCatalogApprovalUpdated

Catalog Approval Updated Event raised when a catalog approval request is completed.

###  mspcat_OnCatalogApprovalUpdated parameters

|Name|Type|Description|
|---------|---------|---------|
|StatusMessage|string|TODO|
|IsCompleted|bool|TODO|
|ApprovalRequest|entity|mspcat_certificationrequest TODO|
|IsApproved|bool|TODO|

## mspcat_OnCatalogInstallRequested

Catalog Install Requested Event, raised when a Catalog Item is being installed.

### mspcat_OnCatalogInstallRequested parameters

|Name|Type|Description|
|---------|---------|---------|
|InstallHistory|entity|mspcat_installhistory TODO|
|CatalogItem|entity|mspcat_applications TODO|

## mspcat_OnCatalogInstallUpdated

Catalog Install Updated Event, Raised on each status event received by the system.

### mspcat_OnCatalogInstallUpdated parameters

|Name|Type|Description|
|---------|---------|---------|
|CatalogItem|entity|mspcat_applications TODO|
|StatusMessage|string|TODO|
|IsCompleted|bool|TODO|
|InstallHistory|entity|mspcat_installhistory TODO|
|IsSuccess|bool|TODO|