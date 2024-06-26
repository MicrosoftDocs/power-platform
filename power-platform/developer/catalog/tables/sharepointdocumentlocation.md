---
title: "Document Location (SharePointDocumentLocation) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Document Location (SharePointDocumentLocation) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Document Location (SharePointDocumentLocation) table/entity reference

Document libraries or folders on a SharePoint server from where documents can be managed in Microsoft Dynamics 365.

> [!NOTE]
> The Power Platform Catalog Manager Document Location (SharePointDocumentLocation) table extends the [Microsoft Dataverse Document Location (SharePointDocumentLocation) table](/power-apps/developer/data-platform/reference/entities/sharepointdocumentlocation).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/sharepointdocumentlocation#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_certificationrequest|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

### <a name="BKMK_mspcat_certificationrequest_SharePointDocumentLocations"></a> mspcat_certificationrequest_SharePointDocumentLocations

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_SharePointDocumentLocations](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_SharePointDocumentLocations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `Cascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.sharepointdocumentlocation?displayProperty=fullName>
