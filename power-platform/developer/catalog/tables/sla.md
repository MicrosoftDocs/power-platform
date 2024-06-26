---
title: "SLA table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the SLA table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# SLA table/entity reference

Contains information about the tracked service-level KPIs for cases that belong to different customers.

> [!NOTE]
> The Power Platform Catalog Manager SLA table extends the [Microsoft Dataverse SLA table](/power-apps/developer/data-platform/reference/entities/sla).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_ObjectTypeCode"></a> ObjectTypeCode

Changes from [ObjectTypeCode (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/sla#BKMK_ObjectTypeCode)

#### ObjectTypeCode Choices/Options

|Value|Label|
|---|---|
|10438|**Approval Rejection Applied Policy**|
|10439|**Catalog Item File**|
|10440|**Install History**|
|10441|**Packaged Solution Components**|
|10442|**Package Locales**|
|10443|**Catalog Item**|
|10444|**Catalog Item Cross Reference**|
|10445|**GEO Deployment Status**|
|10446|**Certification Request Life Cycle**|
|10447|**Catalog Configuration**|
|10448|**Approval Request**|
|10449|**Configuration for PowerApps Checker**|
|10450|**Power Platform Geo**|
|10451|**Install Activity**|
|10452|**Package**|
|10453|**Packaged Solution**|
|10454|**Status of PowerApps Checker package scan**|
|10455|**Catalog Publisher**|
|10456|**Publisher Identity**|
|10457|**Publisher Users**|
|10458|**Rule set for PowerApps Checker**|
|10459|**Policy**|
|10460|**Policy Template**|
|10461|**Static Analysis Policy**|
|10462|**Templates**|

## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [manualsla_mspcat_certificationrequest](#BKMK_manualsla_mspcat_certificationrequest)
- [mspcat_installactivity_sla_slaid](#BKMK_mspcat_installactivity_sla_slaid)
- [mspcat_installactivity_sla_slainvokedid](#BKMK_mspcat_installactivity_sla_slainvokedid)
- [sla_mspcat_certificationrequest](#BKMK_sla_mspcat_certificationrequest)

### <a name="BKMK_manualsla_mspcat_certificationrequest"></a> manualsla_mspcat_certificationrequest

Many-To-One Relationship: [mspcat_certificationrequest manualsla_mspcat_certificationrequest](mspcat_certificationrequest.md#BKMK_manualsla_mspcat_certificationrequest)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`slaid`|
|ReferencedEntityNavigationPropertyName|`manualsla_mspcat_certificationrequest`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installactivity_sla_slaid"></a> mspcat_installactivity_sla_slaid

Many-To-One Relationship: [mspcat_installactivity mspcat_installactivity_sla_slaid](mspcat_installactivity.md#BKMK_mspcat_installactivity_sla_slaid)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`slaid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installactivity_sla_slaid`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10001<br />QueryApi: null<br />ViewId: `7f15e2bb-305a-468f-9af7-be865755a984`|

### <a name="BKMK_mspcat_installactivity_sla_slainvokedid"></a> mspcat_installactivity_sla_slainvokedid

Many-To-One Relationship: [mspcat_installactivity mspcat_installactivity_sla_slainvokedid](mspcat_installactivity.md#BKMK_mspcat_installactivity_sla_slainvokedid)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`slainvokedid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installactivity_sla_slainvokedid`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_sla_mspcat_certificationrequest"></a> sla_mspcat_certificationrequest

Many-To-One Relationship: [mspcat_certificationrequest sla_mspcat_certificationrequest](mspcat_certificationrequest.md#BKMK_sla_mspcat_certificationrequest)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`slainvokedid`|
|ReferencedEntityNavigationPropertyName|`sla_mspcat_certificationrequest`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.sla?displayProperty=fullName>
