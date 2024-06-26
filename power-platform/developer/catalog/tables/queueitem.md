---
title: "Queue Item (QueueItem) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Queue Item (QueueItem) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Queue Item (QueueItem) table/entity reference

A specific item in a queue, such as a case record or an activity record.

> [!NOTE]
> The Power Platform Catalog Manager Queue Item (QueueItem) table extends the [Microsoft Dataverse Queue Item (QueueItem) table](/power-apps/developer/data-platform/reference/entities/queueitem).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

- [ObjectId](#BKMK_ObjectId)
- [ObjectTypeCode](#BKMK_ObjectTypeCode)

### <a name="BKMK_ObjectId"></a> ObjectId

Changes from [ObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/queueitem#BKMK_ObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_certificationrequest|


### <a name="BKMK_ObjectTypeCode"></a> ObjectTypeCode

Changes from [ObjectTypeCode (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/queueitem#BKMK_ObjectTypeCode)

#### ObjectTypeCode Choices/Options

|Value|Label|
|---|---|
|10448|**Approval Request**|
|10451|**Install Activity**|

## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_certificationrequest_QueueItems](#BKMK_mspcat_certificationrequest_QueueItems)
- [mspcat_installactivity_QueueItems](#BKMK_mspcat_installactivity_QueueItems)

### <a name="BKMK_mspcat_certificationrequest_QueueItems"></a> mspcat_certificationrequest_QueueItems

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_QueueItems](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_QueueItems)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installactivity_QueueItems"></a> mspcat_installactivity_QueueItems

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_QueueItems](mspcat_installactivity.md#BKMK_mspcat_installactivity_QueueItems)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.queueitem?displayProperty=fullName>
