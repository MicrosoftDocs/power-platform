---
title: "SLA KPI Instance (SLAKPIInstance) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the SLA KPI Instance (SLAKPIInstance) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# SLA KPI Instance (SLAKPIInstance) table/entity reference

Service level agreement (SLA) key performance indicator (KPI) instance that is tracked for an individual case

> [!NOTE]
> The Power Platform Catalog Manager SLA KPI Instance (SLAKPIInstance) table extends the [Microsoft Dataverse SLA KPI Instance (SLAKPIInstance) table](/power-apps/developer/data-platform/reference/entities/slakpiinstance).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_Regarding"></a> Regarding

Changes from [Regarding (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/slakpiinstance#BKMK_Regarding)

|Property|Value|
|---|---|
|Targets|mspcat_certificationrequest|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

### <a name="BKMK_mspcat_certificationrequest_SLAKPIInstances"></a> mspcat_certificationrequest_SLAKPIInstances

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_SLAKPIInstances](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_SLAKPIInstances)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regarding`|
|ReferencingEntityNavigationPropertyName|`regarding_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.slakpiinstance?displayProperty=fullName>
