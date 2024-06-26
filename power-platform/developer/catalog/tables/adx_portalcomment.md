---
title: "Portal Comment (adx_portalcomment) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Portal Comment (adx_portalcomment) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Portal Comment (adx_portalcomment) table/entity reference

An activity which is used to share information between the user and the customer on the portal.

> [!NOTE]
> The Power Platform Catalog Manager Portal Comment (adx_portalcomment) table extends the [Microsoft Dataverse Portal Comment (adx_portalcomment) table](/power-apps/developer/data-platform/reference/entities/adx_portalcomment).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/adx_portalcomment#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_adx_portalcomments](#BKMK_mspcat_applications_adx_portalcomments)
- [mspcat_certificationrequest_adx_portalcomments](#BKMK_mspcat_certificationrequest_adx_portalcomments)
- [mspcat_installhistory_adx_portalcomments](#BKMK_mspcat_installhistory_adx_portalcomments)
- [mspcat_packagelocales_adx_portalcomments](#BKMK_mspcat_packagelocales_adx_portalcomments)
- [mspcat_packages_adx_portalcomments](#BKMK_mspcat_packages_adx_portalcomments)
- [mspcat_publisher_adx_portalcomments](#BKMK_mspcat_publisher_adx_portalcomments)
- [mspcat_templates_adx_portalcomments](#BKMK_mspcat_templates_adx_portalcomments)

### <a name="BKMK_mspcat_applications_adx_portalcomments"></a> mspcat_applications_adx_portalcomments

One-To-Many Relationship: [mspcat_applications mspcat_applications_adx_portalcomments](mspcat_applications.md#BKMK_mspcat_applications_adx_portalcomments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications_adx_portalcomment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_certificationrequest_adx_portalcomments"></a> mspcat_certificationrequest_adx_portalcomments

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_adx_portalcomments](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_adx_portalcomments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest_adx_portalcomment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_installhistory_adx_portalcomments"></a> mspcat_installhistory_adx_portalcomments

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_adx_portalcomments](mspcat_installhistory.md#BKMK_mspcat_installhistory_adx_portalcomments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory_adx_portalcomment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packagelocales_adx_portalcomments"></a> mspcat_packagelocales_adx_portalcomments

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_adx_portalcomments](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_adx_portalcomments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales_adx_portalcomment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packages_adx_portalcomments"></a> mspcat_packages_adx_portalcomments

One-To-Many Relationship: [mspcat_packages mspcat_packages_adx_portalcomments](mspcat_packages.md#BKMK_mspcat_packages_adx_portalcomments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages_adx_portalcomment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_publisher_adx_portalcomments"></a> mspcat_publisher_adx_portalcomments

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_adx_portalcomments](mspcat_publisher.md#BKMK_mspcat_publisher_adx_portalcomments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher_adx_portalcomment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_templates_adx_portalcomments"></a> mspcat_templates_adx_portalcomments

One-To-Many Relationship: [mspcat_templates mspcat_templates_adx_portalcomments](mspcat_templates.md#BKMK_mspcat_templates_adx_portalcomments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates_adx_portalcomment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.adx_portalcomment?displayProperty=fullName>
