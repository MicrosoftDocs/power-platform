---
title: "Catalog item submission document reference"
description: "Find details about the structure of the JSON data that must be included when submitting an item to the catalog in Power Platform"
author: derekkwanpm
ms.author: derekkwan
ms.subservice: developer
ms.date: 05/24/2024
ms.reviewer: jdaly
ms.topic: reference
search.audienceType: 
  - developer
contributors:
 - JimDaly
---
# Catalog item submission document reference (preview)

You must include data in JSON format when you submit an item to the catalog. This article describes the valid properties for that document.


|Property|Type|Description|
|---------|---------|---------|
|`modelVersion`|string|**Optional** Version number of the submission document. Default is 1.0.0.0.|
|`sourcePortal`|int|**Optional** Identifies the source of this request. Defaults to `526430005` which is the PAC CLI. Full list of portals can be retried by asking the catalog for the current allowed list.|
|`submissionId`|guid|**Optional** Guid to identify the submission. This is a foreign key to allow for linking the request to other systems.|
|`operation`|string|**Required** Type of operation that is expected to be used, this is for future expansion and is not currently respected. Valid values are: - `CreateOrUpdate` (Default)<br /> - `Create`<br /> - `Update`<br /> - `Disabled`<br />|
|`businessJustification`|string|**Optional** Describes the purpose of the submission to the approver.|
|`catalogItemDefinition`|[CatalogItemDefinition](#catalogitemdefinition)|**Required** Defines the catalog item being submitted.|

## CatalogItemDefinition

|Property|Type|Description|
|---------|---------|---------|
|`id`|string|**Required** |
|`displayName`|string|**Required for create only** |
|`description`|string|**Optional** |
|`offer`|[OfferDetails](#offerdetails)|**Required** |
|`packageFile`|[CatalogFileAsset](#catalogfileasset)|**Required** |

## OfferDetails

|Property|Type|Description|
|---------|---------|---------|
|`businessCategories`|int[]|**Optional** List of choice option values respected by the target catalog. Identifies the business catagories to associate with this catalog item|
|`type`|string|**Required** Type of catalog item. Valid values:<br />- `Application`<br />- `Component_Collection`|
|`supportsApplicationTypes`|string[]|**Optional** List of the supported application types. Valid values:<br />- `CanvasApps`<br />- `ModelApps`<br />- `PowerPortals`<br />- `PowerAutomate`|
|`deploymentType`|string|**Required** Indicates the type of deployment to deploy this catalog item.Valid values:<br />- `Normal` represents a **managed item**.<br />- `Template` A copy of your unmanaged solution that other makers can edit however they choose. <br /> [Learn more about catalog item types](/power-apps/maker/data-platform/catalog-overview#catalog-basics)|
|`searchKeywords`|string[]|**Optional** Words that people might use to find this catalog item.|
|`small48x48Image`|[CatalogFileAsset](#catalogfileasset)|**Optional** Image for gallery view.|
|`large216x216Image`|[CatalogFileAsset](#catalogfileasset)|**Optional** Image for detail view|
|`useCaseDocument`|[CatalogFileAsset](#catalogfileasset)|**Optional** Use case description and explanation to approvers.|
|`videos`|[CatalogFileAsset](#catalogfileasset)[]|**Optional** Detail view displays links to these video/gif files.|
|`documents`|[CatalogFileAsset](#catalogfileasset)[]|**Optional** Detail view displays links to these files.|
|`screenshots`|[CatalogFileAsset](#catalogfileasset)[]|**Optional** Detail view displays these images.|
|`helpLink`|uri|**Optional** Link to documentation.|
|`privacyPolicyLink`|uri|**Optional** Link to privacy document|
|`legalTermsLink`|uri|**Optional** Link to privacy document|
|`legalTerms`|string|**Optional** Link to the Terms and Conditions document|
|`sourceCodeRepositoryLink`|uri|**Optional** Link to the source code repository|
|`engineeringName`|[PersonContactInformation](#personcontactinformation)|**Required** Contact information for engineer or group that developed this catalog item.|
|`supportName`|[PersonContactInformation](#personcontactinformation)|**Optional** Contact information for support or group that supports this catalog item.|

## CatalogFileAsset

|Property|Type|Description|
|---------|---------|---------|
|`name`|string|**Required** Name of the file.|
|`filesaslink`|uri|**Required** |

## Publisher

|Property|Type|Description|
|---------|---------|---------|
|`TBD`|string|**Required** |

## PersonContactInformation

|Property|Type|Description|
|---------|---------|---------|
|`TBD`|string|**Required** |
