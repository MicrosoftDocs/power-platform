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

This table describes the properties for the submission document:


|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`modelVersion`|string|No|Version number of the submission document. Default is 1.0.0.0.|
|`sourcePortal`|int|No|Identifies the source of this request. Defaults to `526430005` which is the PAC CLI. Full list of portals can be retried by asking the catalog for the current allowed list.|
|`submissionId`|guid|No|Guid to identify the submission. This is a foreign key to allow for linking the request to other systems.|
|`operation`|string|Yes|Type of operation that is expected to be used, this is for future expansion and is not currently respected. Valid values:<br /> - `CreateOrUpdate` (Default)<br /> - `Create`<br /> - `Update`<br /> - `Disabled`<br />|
|`businessJustification`|string|No|Describes the purpose of the submission to the approver.|
|`catalogItemDefinition`|[CatalogItemDefinition](#catalogitemdefinition)|Yes|Defines the catalog item being submitted.|

## CatalogItemDefinition

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`id`|guid|Yes|The unique ID of the catalog item. Use this ID when updating or installing the catalog item.|
|`displayName`|string|Yes|Name shown to consumers in the catalog galleries.|
|`description`|string|No|Decription shown to consumers in the catalog galleries.|
|`offer`|[OfferDetails](#offerdetails)|Yes|The details of the catalog submission.|
|`packageFile`|[CatalogFileAsset](#catalogfileasset)|Yes|Describes where to get the catalog package file for the submission.|

## OfferDetails

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`businessCategories`|int[]|No|List of choice option values respected by the target catalog. Identifies the business catagories to associate with this catalog item|
|`type`|string|Yes|Type of catalog item. Valid values:<br />- `Application`<br />- `Component_Collection`|
|`supportsApplicationTypes`|string[]|No|List of the supported application types. Valid values:<br />- `CanvasApps`<br />- `ModelApps`<br />- `PowerPortals`<br />- `PowerAutomate`|
|`deploymentType`|string|Yes|Indicates the type of deployment to deploy this catalog item. Valid values:<br />- `Normal` represents a **managed item**.<br />- `Template` A copy of your unmanaged solution that other makers can edit however they choose. <br /> [Learn more about catalog item types](/power-apps/maker/data-platform/catalog-overview#catalog-basics)|
|`searchKeywords`|string[]|No|Words that people might use to find this catalog item.|
|`small48x48Image`|[CatalogFileAsset](#catalogfileasset)|No|Image for gallery view.|
|`large216x216Image`|[CatalogFileAsset](#catalogfileasset)|No|Image for detail view|
|`useCaseDocument`|[CatalogFileAsset](#catalogfileasset)|No|Use case description and explanation to approvers.|
|`videos`|[CatalogFileAsset](#catalogfileasset)[]|No|Detail view displays links to these video/gif files.|
|`documents`|[CatalogFileAsset](#catalogfileasset)[]|No|Detail view displays links to these files.|
|`screenshots`|[CatalogFileAsset](#catalogfileasset)[]|No|Detail view displays these images.|
|`helpLink`|uri|No|Link to documentation.|
|`privacyPolicyLink`|uri|No|Link to privacy document|
|`legalTermsLink`|uri|No|Link to privacy document|
|`legalTerms`|string|No|Link to the Terms and Conditions document|
|`sourceCodeRepositoryLink`|uri|No|Link to the source code repository|
|`engineeringName`|[PersonContactInformation](#personcontactinformation)|Yes|Contact information for engineer or group that developed this catalog item.|
|`supportName`|[PersonContactInformation](#personcontactinformation)|No|Contact information for support or group that supports this catalog item.|

## CatalogFileAsset

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`name`|string|Yes|Name of the file.|
|`filesaslink`|uri|Yes|Link to download the file. If the link requires authentication, provide a [shared access signature (SAS) URL](/azure/storage/common/storage-sas-overview). |

## Publisher

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`publisherId`|string|Yes||
|`publisherDisplayName`|string|Yes||
|`publisherUpnList`|[CatalogUPNOperation](#catalogupnoperation)|Yes||
|`publisherAADGroupOIDS`|string|Yes||


## CatalogUPNOperation

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`action`|string|Yes|The action to take with this UPN. Valid values: `Add` or `Remove`. |
|`upn`|string|Yes|UPN of the user|
|`userOid`|guid|Yes|Object Identifier for User|

## CatalogGroupOperation

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`action`|string|Yes|The action to take with this UPN. Valid values: `Add` or `Remove`.|
|`groupName`|string|Yes|Name of group.|
|`groupOid`|guid|Yes|Object identifier for group.|
|`groupType`|string|Yes|Type of Group being addressed. Valid Values are `Security` and `Modern`.|


## PersonContactInformation

|Property|Type|Required|Description|
|--------|----|--------|-----------|
|`TBD`|string|Yes||
