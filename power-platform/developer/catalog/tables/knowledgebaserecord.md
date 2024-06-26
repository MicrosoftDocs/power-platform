---
title: "Knowledge Base Record (KnowledgeBaseRecord) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Knowledge Base Record (KnowledgeBaseRecord) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Knowledge Base Record (KnowledgeBaseRecord) table/entity reference

Metadata of knowledge base (KB) articles associated with Microsoft Dynamics 365 entities.

> [!NOTE]
> The Power Platform Catalog Manager Knowledge Base Record (KnowledgeBaseRecord) table extends the [Microsoft Dataverse Knowledge Base Record (KnowledgeBaseRecord) table](/power-apps/developer/data-platform/reference/entities/knowledgebaserecord).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

### <a name="BKMK_knowledgebaserecord_mspcat_InstallActivities"></a> knowledgebaserecord_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity knowledgebaserecord_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_knowledgebaserecord_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`knowledgebaserecord_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.knowledgebaserecord?displayProperty=fullName>
