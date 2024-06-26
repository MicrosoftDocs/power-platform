---
title: "Fax table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Fax table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Fax table/entity reference

Activity that tracks call outcome and number of pages for a fax and optionally stores an electronic copy of the document.

> [!NOTE]
> The Power Platform Catalog Manager Fax table extends the [Microsoft Dataverse Fax table](/power-apps/developer/data-platform/reference/entities/fax).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/fax#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_Faxes](#BKMK_mspcat_applications_Faxes)
- [mspcat_certificationrequest_Faxes](#BKMK_mspcat_certificationrequest_Faxes)
- [mspcat_installhistory_Faxes](#BKMK_mspcat_installhistory_Faxes)
- [mspcat_packagelocales_Faxes](#BKMK_mspcat_packagelocales_Faxes)
- [mspcat_packages_Faxes](#BKMK_mspcat_packages_Faxes)
- [mspcat_publisher_Faxes](#BKMK_mspcat_publisher_Faxes)
- [mspcat_templates_Faxes](#BKMK_mspcat_templates_Faxes)

### <a name="BKMK_mspcat_applications_Faxes"></a> mspcat_applications_Faxes

One-To-Many Relationship: [mspcat_applications mspcat_applications_Faxes](mspcat_applications.md#BKMK_mspcat_applications_Faxes)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications_fax`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_certificationrequest_Faxes"></a> mspcat_certificationrequest_Faxes

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_Faxes](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_Faxes)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest_fax`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_installhistory_Faxes"></a> mspcat_installhistory_Faxes

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_Faxes](mspcat_installhistory.md#BKMK_mspcat_installhistory_Faxes)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory_fax`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packagelocales_Faxes"></a> mspcat_packagelocales_Faxes

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_Faxes](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_Faxes)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales_fax`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packages_Faxes"></a> mspcat_packages_Faxes

One-To-Many Relationship: [mspcat_packages mspcat_packages_Faxes](mspcat_packages.md#BKMK_mspcat_packages_Faxes)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages_fax`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_publisher_Faxes"></a> mspcat_publisher_Faxes

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_Faxes](mspcat_publisher.md#BKMK_mspcat_publisher_Faxes)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher_fax`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_templates_Faxes"></a> mspcat_templates_Faxes

One-To-Many Relationship: [mspcat_templates mspcat_templates_Faxes](mspcat_templates.md#BKMK_mspcat_templates_Faxes)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates_fax`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.fax?displayProperty=fullName>
