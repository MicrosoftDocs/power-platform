---
title: "Email table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Email table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Email table/entity reference

Activity that is delivered using email protocols.

> [!NOTE]
> The Power Platform Catalog Manager Email table extends the [Microsoft Dataverse Email table](/power-apps/developer/data-platform/reference/entities/email).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/email#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_Emails](#BKMK_mspcat_applications_Emails)
- [mspcat_certificationrequest_Emails](#BKMK_mspcat_certificationrequest_Emails)
- [mspcat_installhistory_Emails](#BKMK_mspcat_installhistory_Emails)
- [mspcat_packagelocales_Emails](#BKMK_mspcat_packagelocales_Emails)
- [mspcat_packages_Emails](#BKMK_mspcat_packages_Emails)
- [mspcat_publisher_Emails](#BKMK_mspcat_publisher_Emails)
- [mspcat_templates_Emails](#BKMK_mspcat_templates_Emails)

### <a name="BKMK_mspcat_applications_Emails"></a> mspcat_applications_Emails

One-To-Many Relationship: [mspcat_applications mspcat_applications_Emails](mspcat_applications.md#BKMK_mspcat_applications_Emails)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications_email`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_certificationrequest_Emails"></a> mspcat_certificationrequest_Emails

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_Emails](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_Emails)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest_email`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_installhistory_Emails"></a> mspcat_installhistory_Emails

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_Emails](mspcat_installhistory.md#BKMK_mspcat_installhistory_Emails)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory_email`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packagelocales_Emails"></a> mspcat_packagelocales_Emails

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_Emails](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_Emails)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales_email`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packages_Emails"></a> mspcat_packages_Emails

One-To-Many Relationship: [mspcat_packages mspcat_packages_Emails](mspcat_packages.md#BKMK_mspcat_packages_Emails)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages_email`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_publisher_Emails"></a> mspcat_publisher_Emails

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_Emails](mspcat_publisher.md#BKMK_mspcat_publisher_Emails)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher_email`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_templates_Emails"></a> mspcat_templates_Emails

One-To-Many Relationship: [mspcat_templates mspcat_templates_Emails](mspcat_templates.md#BKMK_mspcat_templates_Emails)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates_email`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.email?displayProperty=fullName>
