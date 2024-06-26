---
title: "Activity Party (ActivityParty) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Activity Party (ActivityParty) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Activity Party (ActivityParty) table/entity reference

Person or group associated with an activity. An activity can have multiple activity parties.

> [!NOTE]
> The Power Platform Catalog Manager Activity Party (ActivityParty) table extends the [Microsoft Dataverse Activity Party (ActivityParty) table](/power-apps/developer/data-platform/reference/entities/activityparty).




## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

### <a name="BKMK_mspcat_InstallActivity_activity_parties"></a> mspcat_InstallActivity_activity_parties

One-To-Many Relationship: [mspcat_installactivity mspcat_InstallActivity_activity_parties](mspcat_installactivity.md#BKMK_mspcat_InstallActivity_activity_parties)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`activityid`|
|ReferencingEntityNavigationPropertyName|`activityid_mspcat_installactivity_activityparty`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.activityparty?displayProperty=fullName>
