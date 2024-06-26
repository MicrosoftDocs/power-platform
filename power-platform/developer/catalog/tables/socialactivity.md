---
title: "Social Activity (SocialActivity) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Social Activity (SocialActivity) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Social Activity (SocialActivity) table/entity reference

For internal use only.

> [!NOTE]
> The Power Platform Catalog Manager Social Activity (SocialActivity) table extends the [Microsoft Dataverse Social Activity (SocialActivity) table](/power-apps/developer/data-platform/reference/entities/socialactivity).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/socialactivity#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_SocialActivities](#BKMK_mspcat_applications_SocialActivities)
- [mspcat_certificationrequest_SocialActivities](#BKMK_mspcat_certificationrequest_SocialActivities)
- [mspcat_installhistory_SocialActivities](#BKMK_mspcat_installhistory_SocialActivities)
- [mspcat_packagelocales_SocialActivities](#BKMK_mspcat_packagelocales_SocialActivities)
- [mspcat_packages_SocialActivities](#BKMK_mspcat_packages_SocialActivities)
- [mspcat_publisher_SocialActivities](#BKMK_mspcat_publisher_SocialActivities)
- [mspcat_templates_SocialActivities](#BKMK_mspcat_templates_SocialActivities)

### <a name="BKMK_mspcat_applications_SocialActivities"></a> mspcat_applications_SocialActivities

One-To-Many Relationship: [mspcat_applications mspcat_applications_SocialActivities](mspcat_applications.md#BKMK_mspcat_applications_SocialActivities)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications_socialactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_certificationrequest_SocialActivities"></a> mspcat_certificationrequest_SocialActivities

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_SocialActivities](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_SocialActivities)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest_socialactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_installhistory_SocialActivities"></a> mspcat_installhistory_SocialActivities

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_SocialActivities](mspcat_installhistory.md#BKMK_mspcat_installhistory_SocialActivities)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory_socialactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packagelocales_SocialActivities"></a> mspcat_packagelocales_SocialActivities

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_SocialActivities](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_SocialActivities)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales_socialactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packages_SocialActivities"></a> mspcat_packages_SocialActivities

One-To-Many Relationship: [mspcat_packages mspcat_packages_SocialActivities](mspcat_packages.md#BKMK_mspcat_packages_SocialActivities)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages_socialactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_publisher_SocialActivities"></a> mspcat_publisher_SocialActivities

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_SocialActivities](mspcat_publisher.md#BKMK_mspcat_publisher_SocialActivities)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher_socialactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_templates_SocialActivities"></a> mspcat_templates_SocialActivities

One-To-Many Relationship: [mspcat_templates mspcat_templates_SocialActivities](mspcat_templates.md#BKMK_mspcat_templates_SocialActivities)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates_socialactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.socialactivity?displayProperty=fullName>
