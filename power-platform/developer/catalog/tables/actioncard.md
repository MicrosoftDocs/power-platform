---
title: "Action Card (ActionCard) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Action Card (ActionCard) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Action Card (ActionCard) table/entity reference

Action card entity to show action cards.

> [!NOTE]
> The Power Platform Catalog Manager Action Card (ActionCard) table extends the [Microsoft Dataverse Action Card (ActionCard) table](/power-apps/developer/data-platform/reference/entities/actioncard).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/actioncard#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_installactivity|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

### <a name="BKMK_mspcat_installactivity_ActionCards"></a> mspcat_installactivity_ActionCards

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_ActionCards](mspcat_installactivity.md#BKMK_mspcat_installactivity_ActionCards)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.actioncard?displayProperty=fullName>
