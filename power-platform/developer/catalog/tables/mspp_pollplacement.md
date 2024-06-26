---
title: "Poll Placement (mspp_pollplacement) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Poll Placement (mspp_pollplacement) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Poll Placement (mspp_pollplacement) table/entity reference



> [!NOTE]
> The Power Platform Catalog Manager Poll Placement (mspp_pollplacement) table extends the [Microsoft Dataverse Poll Placement (mspp_pollplacement) table](/power-apps/developer/data-platform/reference/entities/mspp_pollplacement).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

### <a name="BKMK_mspp_pollplacement_mspcat_InstallActivities"></a> mspp_pollplacement_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity mspp_pollplacement_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_mspp_pollplacement_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspp_pollplacement_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.mspp_pollplacement?displayProperty=fullName>
