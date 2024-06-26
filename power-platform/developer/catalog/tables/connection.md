---
title: "Connection table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Connection table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Connection table/entity reference

Relationship between two entities.

> [!NOTE]
> The Power Platform Catalog Manager Connection table extends the [Microsoft Dataverse Connection table](/power-apps/developer/data-platform/reference/entities/connection).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

- [Record1Id](#BKMK_Record1Id)
- [Record1ObjectTypeCode](#BKMK_Record1ObjectTypeCode)
- [Record2Id](#BKMK_Record2Id)
- [Record2ObjectTypeCode](#BKMK_Record2ObjectTypeCode)

### <a name="BKMK_Record1Id"></a> Record1Id

Changes from [Record1Id (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/connection#BKMK_Record1Id)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


### <a name="BKMK_Record1ObjectTypeCode"></a> Record1ObjectTypeCode

Changes from [Record1ObjectTypeCode (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/connection#BKMK_Record1ObjectTypeCode)

#### Record1ObjectTypeCode Choices/Options

|Value|Label|
|---|---|
|10442|**Package Locales**|
|10443|**Catalog Item**|
|10448|**Approval Request**|
|10450|**Power Platform Geo**|
|10451|**Install Activity**|
|10452|**Package**|
|10455|**Catalog Publisher**|
|10462|**Templates**|

### <a name="BKMK_Record2Id"></a> Record2Id

Changes from [Record2Id (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/connection#BKMK_Record2Id)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


### <a name="BKMK_Record2ObjectTypeCode"></a> Record2ObjectTypeCode

Changes from [Record2ObjectTypeCode (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/connection#BKMK_Record2ObjectTypeCode)

#### Record2ObjectTypeCode Choices/Options

|Value|Label|
|---|---|
|10442|**Package Locales**|
|10443|**Catalog Item**|
|10448|**Approval Request**|
|10450|**Power Platform Geo**|
|10451|**Install Activity**|
|10452|**Package**|
|10455|**Catalog Publisher**|
|10462|**Templates**|

## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_connections1](#BKMK_mspcat_applications_connections1)
- [mspcat_applications_connections2](#BKMK_mspcat_applications_connections2)
- [mspcat_certificationrequest_connections1](#BKMK_mspcat_certificationrequest_connections1)
- [mspcat_certificationrequest_connections2](#BKMK_mspcat_certificationrequest_connections2)
- [mspcat_crmgeo_connections1](#BKMK_mspcat_crmgeo_connections1)
- [mspcat_crmgeo_connections2](#BKMK_mspcat_crmgeo_connections2)
- [mspcat_installactivity_connections1](#BKMK_mspcat_installactivity_connections1)
- [mspcat_installactivity_connections2](#BKMK_mspcat_installactivity_connections2)
- [mspcat_packagelocales_connections1](#BKMK_mspcat_packagelocales_connections1)
- [mspcat_packagelocales_connections2](#BKMK_mspcat_packagelocales_connections2)
- [mspcat_packages_connections1](#BKMK_mspcat_packages_connections1)
- [mspcat_packages_connections2](#BKMK_mspcat_packages_connections2)
- [mspcat_publisher_connections1](#BKMK_mspcat_publisher_connections1)
- [mspcat_publisher_connections2](#BKMK_mspcat_publisher_connections2)
- [mspcat_templates_connections1](#BKMK_mspcat_templates_connections1)
- [mspcat_templates_connections2](#BKMK_mspcat_templates_connections2)

### <a name="BKMK_mspcat_applications_connections1"></a> mspcat_applications_connections1

One-To-Many Relationship: [mspcat_applications mspcat_applications_connections1](mspcat_applications.md#BKMK_mspcat_applications_connections1)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`record1id`|
|ReferencingEntityNavigationPropertyName|`record1id_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_applications_connections2"></a> mspcat_applications_connections2

One-To-Many Relationship: [mspcat_applications mspcat_applications_connections2](mspcat_applications.md#BKMK_mspcat_applications_connections2)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`record2id`|
|ReferencingEntityNavigationPropertyName|`record2id_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_connections1"></a> mspcat_certificationrequest_connections1

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_connections1](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_connections1)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`record1id`|
|ReferencingEntityNavigationPropertyName|`record1id_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_connections2"></a> mspcat_certificationrequest_connections2

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_connections2](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_connections2)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`record2id`|
|ReferencingEntityNavigationPropertyName|`record2id_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeo_connections1"></a> mspcat_crmgeo_connections1

One-To-Many Relationship: [mspcat_crmgeo mspcat_crmgeo_connections1](mspcat_crmgeo.md#BKMK_mspcat_crmgeo_connections1)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeo`|
|ReferencedAttribute|`mspcat_crmgeoid`|
|ReferencingAttribute|`record1id`|
|ReferencingEntityNavigationPropertyName|`record1id_mspcat_crmgeo`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeo_connections2"></a> mspcat_crmgeo_connections2

One-To-Many Relationship: [mspcat_crmgeo mspcat_crmgeo_connections2](mspcat_crmgeo.md#BKMK_mspcat_crmgeo_connections2)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeo`|
|ReferencedAttribute|`mspcat_crmgeoid`|
|ReferencingAttribute|`record2id`|
|ReferencingEntityNavigationPropertyName|`record2id_mspcat_crmgeo`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installactivity_connections1"></a> mspcat_installactivity_connections1

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_connections1](mspcat_installactivity.md#BKMK_mspcat_installactivity_connections1)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`record1id`|
|ReferencingEntityNavigationPropertyName|`record1id_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installactivity_connections2"></a> mspcat_installactivity_connections2

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_connections2](mspcat_installactivity.md#BKMK_mspcat_installactivity_connections2)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`record2id`|
|ReferencingEntityNavigationPropertyName|`record2id_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagelocales_connections1"></a> mspcat_packagelocales_connections1

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_connections1](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_connections1)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`record1id`|
|ReferencingEntityNavigationPropertyName|`record1id_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagelocales_connections2"></a> mspcat_packagelocales_connections2

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_connections2](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_connections2)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`record2id`|
|ReferencingEntityNavigationPropertyName|`record2id_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_connections1"></a> mspcat_packages_connections1

One-To-Many Relationship: [mspcat_packages mspcat_packages_connections1](mspcat_packages.md#BKMK_mspcat_packages_connections1)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`record1id`|
|ReferencingEntityNavigationPropertyName|`record1id_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_connections2"></a> mspcat_packages_connections2

One-To-Many Relationship: [mspcat_packages mspcat_packages_connections2](mspcat_packages.md#BKMK_mspcat_packages_connections2)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`record2id`|
|ReferencingEntityNavigationPropertyName|`record2id_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisher_connections1"></a> mspcat_publisher_connections1

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_connections1](mspcat_publisher.md#BKMK_mspcat_publisher_connections1)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`record1id`|
|ReferencingEntityNavigationPropertyName|`record1id_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisher_connections2"></a> mspcat_publisher_connections2

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_connections2](mspcat_publisher.md#BKMK_mspcat_publisher_connections2)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`record2id`|
|ReferencingEntityNavigationPropertyName|`record2id_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_connections1"></a> mspcat_templates_connections1

One-To-Many Relationship: [mspcat_templates mspcat_templates_connections1](mspcat_templates.md#BKMK_mspcat_templates_connections1)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`record1id`|
|ReferencingEntityNavigationPropertyName|`record1id_mspcat_templates`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_connections2"></a> mspcat_templates_connections2

One-To-Many Relationship: [mspcat_templates mspcat_templates_connections2](mspcat_templates.md#BKMK_mspcat_templates_connections2)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`record2id`|
|ReferencingEntityNavigationPropertyName|`record2id_mspcat_templates`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.connection?displayProperty=fullName>
