---
title: "Shortcut (mspp_shortcut) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Shortcut (mspp_shortcut) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Shortcut (mspp_shortcut) table/entity reference



> [!NOTE]
> The Power Platform Catalog Manager Shortcut (mspp_shortcut) table extends the [Microsoft Dataverse Shortcut (mspp_shortcut) table](/power-apps/developer/data-platform/reference/entities/mspp_shortcut).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

### <a name="BKMK_mspp_shortcut_mspcat_InstallActivities"></a> mspp_shortcut_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity mspp_shortcut_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_mspp_shortcut_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspp_shortcut_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.mspp_shortcut?displayProperty=fullName>
