---
title: "Activity (ActivityPointer) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Activity (ActivityPointer) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Activity (ActivityPointer) table/entity reference

Task performed, or to be performed, by a user. An activity is any action for which an entry can be made on a calendar.

> [!NOTE]
> The Power Platform Catalog Manager Activity (ActivityPointer) table extends the [Microsoft Dataverse Activity (ActivityPointer) table](/power-apps/developer/data-platform/reference/entities/activitypointer).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/activitypointer#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_ActivityPointers](#BKMK_mspcat_applications_ActivityPointers)
- [mspcat_certificationrequest_ActivityPointers](#BKMK_mspcat_certificationrequest_ActivityPointers)
- [mspcat_installhistory_ActivityPointers](#BKMK_mspcat_installhistory_ActivityPointers)
- [mspcat_packagelocales_ActivityPointers](#BKMK_mspcat_packagelocales_ActivityPointers)
- [mspcat_packages_ActivityPointers](#BKMK_mspcat_packages_ActivityPointers)
- [mspcat_publisher_ActivityPointers](#BKMK_mspcat_publisher_ActivityPointers)
- [mspcat_templates_ActivityPointers](#BKMK_mspcat_templates_ActivityPointers)

### <a name="BKMK_mspcat_applications_ActivityPointers"></a> mspcat_applications_ActivityPointers

One-To-Many Relationship: [mspcat_applications mspcat_applications_ActivityPointers](mspcat_applications.md#BKMK_mspcat_applications_ActivityPointers)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_ActivityPointers"></a> mspcat_certificationrequest_ActivityPointers

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_ActivityPointers](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_ActivityPointers)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installhistory_ActivityPointers"></a> mspcat_installhistory_ActivityPointers

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_ActivityPointers](mspcat_installhistory.md#BKMK_mspcat_installhistory_ActivityPointers)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagelocales_ActivityPointers"></a> mspcat_packagelocales_ActivityPointers

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_ActivityPointers](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_ActivityPointers)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_ActivityPointers"></a> mspcat_packages_ActivityPointers

One-To-Many Relationship: [mspcat_packages mspcat_packages_ActivityPointers](mspcat_packages.md#BKMK_mspcat_packages_ActivityPointers)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisher_ActivityPointers"></a> mspcat_publisher_ActivityPointers

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_ActivityPointers](mspcat_publisher.md#BKMK_mspcat_publisher_ActivityPointers)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_ActivityPointers"></a> mspcat_templates_ActivityPointers

One-To-Many Relationship: [mspcat_templates mspcat_templates_ActivityPointers](mspcat_templates.md#BKMK_mspcat_templates_ActivityPointers)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|


## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

### <a name="BKMK_activity_pointer_mspcat_InstallActivity"></a> activity_pointer_mspcat_InstallActivity

Many-To-One Relationship: [mspcat_installactivity activity_pointer_mspcat_InstallActivity](mspcat_installactivity.md#BKMK_activity_pointer_mspcat_InstallActivity)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`activityid`|
|ReferencedEntityNavigationPropertyName|`activity_pointer_mspcat_InstallActivity`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.activitypointer?displayProperty=fullName>
