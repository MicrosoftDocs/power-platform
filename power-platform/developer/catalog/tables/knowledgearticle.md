---
title: "Knowledge Article (KnowledgeArticle) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Knowledge Article (KnowledgeArticle) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Knowledge Article (KnowledgeArticle) table/entity reference

Organizational knowledge for internal and external use.

> [!NOTE]
> The Power Platform Catalog Manager Knowledge Article (KnowledgeArticle) table extends the [Microsoft Dataverse Knowledge Article (KnowledgeArticle) table](/power-apps/developer/data-platform/reference/entities/knowledgearticle).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

### <a name="BKMK_knowledgearticle_mspcat_InstallActivities"></a> knowledgearticle_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity knowledgearticle_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_knowledgearticle_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`knowledgearticle_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: `CRMActivity.RetrieveByObject`<br />ViewId: `00000000-0000-0000-00aa-000010001903`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.knowledgearticle?displayProperty=fullName>
