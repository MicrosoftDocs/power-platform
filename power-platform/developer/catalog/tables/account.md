---
title: "Account table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Account table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Account table/entity reference

Business that represents a customer or potential customer. The company that is billed in business transactions.

> [!NOTE]
> The Power Platform Catalog Manager Account table extends the [Microsoft Dataverse Account table](/power-apps/developer/data-platform/reference/entities/account).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

### <a name="BKMK_account_mspcat_InstallActivities"></a> account_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity account_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_account_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`account_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: `CRMActivity.RollupRelatedByParty`<br />ViewId: `00000000-0000-0000-00aa-000010001903`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.account?displayProperty=fullName>
