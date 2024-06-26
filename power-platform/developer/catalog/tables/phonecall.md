---
title: "Phone Call (PhoneCall) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Phone Call (PhoneCall) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Phone Call (PhoneCall) table/entity reference

Activity to track a telephone call.

> [!NOTE]
> The Power Platform Catalog Manager Phone Call (PhoneCall) table extends the [Microsoft Dataverse Phone Call (PhoneCall) table](/power-apps/developer/data-platform/reference/entities/phonecall).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/phonecall#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_PhoneCalls](#BKMK_mspcat_applications_PhoneCalls)
- [mspcat_certificationrequest_PhoneCalls](#BKMK_mspcat_certificationrequest_PhoneCalls)
- [mspcat_installhistory_PhoneCalls](#BKMK_mspcat_installhistory_PhoneCalls)
- [mspcat_packagelocales_PhoneCalls](#BKMK_mspcat_packagelocales_PhoneCalls)
- [mspcat_packages_PhoneCalls](#BKMK_mspcat_packages_PhoneCalls)
- [mspcat_publisher_PhoneCalls](#BKMK_mspcat_publisher_PhoneCalls)
- [mspcat_templates_PhoneCalls](#BKMK_mspcat_templates_PhoneCalls)

### <a name="BKMK_mspcat_applications_PhoneCalls"></a> mspcat_applications_PhoneCalls

One-To-Many Relationship: [mspcat_applications mspcat_applications_PhoneCalls](mspcat_applications.md#BKMK_mspcat_applications_PhoneCalls)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications_phonecall`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_certificationrequest_PhoneCalls"></a> mspcat_certificationrequest_PhoneCalls

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_PhoneCalls](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_PhoneCalls)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest_phonecall`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_installhistory_PhoneCalls"></a> mspcat_installhistory_PhoneCalls

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_PhoneCalls](mspcat_installhistory.md#BKMK_mspcat_installhistory_PhoneCalls)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory_phonecall`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packagelocales_PhoneCalls"></a> mspcat_packagelocales_PhoneCalls

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_PhoneCalls](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_PhoneCalls)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales_phonecall`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packages_PhoneCalls"></a> mspcat_packages_PhoneCalls

One-To-Many Relationship: [mspcat_packages mspcat_packages_PhoneCalls](mspcat_packages.md#BKMK_mspcat_packages_PhoneCalls)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages_phonecall`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_publisher_PhoneCalls"></a> mspcat_publisher_PhoneCalls

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_PhoneCalls](mspcat_publisher.md#BKMK_mspcat_publisher_PhoneCalls)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher_phonecall`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_templates_PhoneCalls"></a> mspcat_templates_PhoneCalls

One-To-Many Relationship: [mspcat_templates mspcat_templates_PhoneCalls](mspcat_templates.md#BKMK_mspcat_templates_PhoneCalls)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates_phonecall`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.phonecall?displayProperty=fullName>
