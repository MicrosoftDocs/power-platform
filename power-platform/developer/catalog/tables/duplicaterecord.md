---
title: "Duplicate Record (DuplicateRecord) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Duplicate Record (DuplicateRecord) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Duplicate Record (DuplicateRecord) table/entity reference

Potential duplicate record.

> [!NOTE]
> The Power Platform Catalog Manager Duplicate Record (DuplicateRecord) table extends the [Microsoft Dataverse Duplicate Record (DuplicateRecord) table](/power-apps/developer/data-platform/reference/entities/duplicaterecord).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

- [BaseRecordId](#BKMK_BaseRecordId)
- [DuplicateRecordId](#BKMK_DuplicateRecordId)

### <a name="BKMK_BaseRecordId"></a> BaseRecordId

Changes from [BaseRecordId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/duplicaterecord#BKMK_BaseRecordId)

|Property|Value|
|---|---|
|Targets|mspcat_applicationreference|


### <a name="BKMK_DuplicateRecordId"></a> DuplicateRecordId

Changes from [DuplicateRecordId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/duplicaterecord#BKMK_DuplicateRecordId)

|Property|Value|
|---|---|
|Targets|mspcat_applicationreference|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applicationreference_DuplicateBaseRecord](#BKMK_mspcat_applicationreference_DuplicateBaseRecord)
- [mspcat_applicationreference_DuplicateMatchingRecord](#BKMK_mspcat_applicationreference_DuplicateMatchingRecord)
- [mspcat_applications_DuplicateBaseRecord](#BKMK_mspcat_applications_DuplicateBaseRecord)
- [mspcat_applications_DuplicateMatchingRecord](#BKMK_mspcat_applications_DuplicateMatchingRecord)
- [mspcat_catalogdescription_DuplicateBaseRecord](#BKMK_mspcat_catalogdescription_DuplicateBaseRecord)
- [mspcat_catalogdescription_DuplicateMatchingRecord](#BKMK_mspcat_catalogdescription_DuplicateMatchingRecord)
- [mspcat_catalogitemfile_DuplicateBaseRecord](#BKMK_mspcat_catalogitemfile_DuplicateBaseRecord)
- [mspcat_catalogitemfile_DuplicateMatchingRecord](#BKMK_mspcat_catalogitemfile_DuplicateMatchingRecord)
- [mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord](#BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord)
- [mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord](#BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord)
- [mspcat_certificationrequest_DuplicateBaseRecord](#BKMK_mspcat_certificationrequest_DuplicateBaseRecord)
- [mspcat_certificationrequest_DuplicateMatchingRecord](#BKMK_mspcat_certificationrequest_DuplicateMatchingRecord)
- [mspcat_crmgeo_DuplicateBaseRecord](#BKMK_mspcat_crmgeo_DuplicateBaseRecord)
- [mspcat_crmgeo_DuplicateMatchingRecord](#BKMK_mspcat_crmgeo_DuplicateMatchingRecord)
- [mspcat_installactivity_DuplicateBaseRecord](#BKMK_mspcat_installactivity_DuplicateBaseRecord)
- [mspcat_installactivity_DuplicateMatchingRecord](#BKMK_mspcat_installactivity_DuplicateMatchingRecord)
- [mspcat_packagelocales_DuplicateBaseRecord](#BKMK_mspcat_packagelocales_DuplicateBaseRecord)
- [mspcat_packagelocales_DuplicateMatchingRecord](#BKMK_mspcat_packagelocales_DuplicateMatchingRecord)
- [mspcat_packages_DuplicateBaseRecord](#BKMK_mspcat_packages_DuplicateBaseRecord)
- [mspcat_packages_DuplicateMatchingRecord](#BKMK_mspcat_packages_DuplicateMatchingRecord)
- [mspcat_publisher_DuplicateBaseRecord](#BKMK_mspcat_publisher_DuplicateBaseRecord)
- [mspcat_publisher_DuplicateMatchingRecord](#BKMK_mspcat_publisher_DuplicateMatchingRecord)
- [mspcat_sspolicy_DuplicateBaseRecord](#BKMK_mspcat_sspolicy_DuplicateBaseRecord)
- [mspcat_sspolicy_DuplicateMatchingRecord](#BKMK_mspcat_sspolicy_DuplicateMatchingRecord)
- [mspcat_sspolicytemplate_DuplicateBaseRecord](#BKMK_mspcat_sspolicytemplate_DuplicateBaseRecord)
- [mspcat_sspolicytemplate_DuplicateMatchingRecord](#BKMK_mspcat_sspolicytemplate_DuplicateMatchingRecord)
- [mspcat_staticanalysispolicy_DuplicateBaseRecord](#BKMK_mspcat_staticanalysispolicy_DuplicateBaseRecord)
- [mspcat_staticanalysispolicy_DuplicateMatchingRecord](#BKMK_mspcat_staticanalysispolicy_DuplicateMatchingRecord)
- [mspcat_templates_DuplicateBaseRecord](#BKMK_mspcat_templates_DuplicateBaseRecord)
- [mspcat_templates_DuplicateMatchingRecord](#BKMK_mspcat_templates_DuplicateMatchingRecord)

### <a name="BKMK_mspcat_applicationreference_DuplicateBaseRecord"></a> mspcat_applicationreference_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_applicationreference mspcat_applicationreference_DuplicateBaseRecord](mspcat_applicationreference.md#BKMK_mspcat_applicationreference_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applicationreference`|
|ReferencedAttribute|`mspcat_applicationreferenceid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_applicationreference`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_applicationreference_DuplicateMatchingRecord"></a> mspcat_applicationreference_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_applicationreference mspcat_applicationreference_DuplicateMatchingRecord](mspcat_applicationreference.md#BKMK_mspcat_applicationreference_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applicationreference`|
|ReferencedAttribute|`mspcat_applicationreferenceid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_applicationreference`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_applications_DuplicateBaseRecord"></a> mspcat_applications_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_applications mspcat_applications_DuplicateBaseRecord](mspcat_applications.md#BKMK_mspcat_applications_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_applications_DuplicateMatchingRecord"></a> mspcat_applications_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_applications mspcat_applications_DuplicateMatchingRecord](mspcat_applications.md#BKMK_mspcat_applications_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogdescription_DuplicateBaseRecord"></a> mspcat_catalogdescription_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_catalogdescription mspcat_catalogdescription_DuplicateBaseRecord](mspcat_catalogdescription.md#BKMK_mspcat_catalogdescription_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogdescription`|
|ReferencedAttribute|`mspcat_catalogdescriptionid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_catalogdescription`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogdescription_DuplicateMatchingRecord"></a> mspcat_catalogdescription_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_catalogdescription mspcat_catalogdescription_DuplicateMatchingRecord](mspcat_catalogdescription.md#BKMK_mspcat_catalogdescription_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogdescription`|
|ReferencedAttribute|`mspcat_catalogdescriptionid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_catalogdescription`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogitemfile_DuplicateBaseRecord"></a> mspcat_catalogitemfile_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_catalogitemfile mspcat_catalogitemfile_DuplicateBaseRecord](mspcat_catalogitemfile.md#BKMK_mspcat_catalogitemfile_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogitemfile`|
|ReferencedAttribute|`mspcat_catalogitemfileid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_catalogitemfile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogitemfile_DuplicateMatchingRecord"></a> mspcat_catalogitemfile_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_catalogitemfile mspcat_catalogitemfile_DuplicateMatchingRecord](mspcat_catalogitemfile.md#BKMK_mspcat_catalogitemfile_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogitemfile`|
|ReferencedAttribute|`mspcat_catalogitemfileid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_catalogitemfile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord"></a> mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_certificationrejectionappliedpolicy mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord](mspcat_certificationrejectionappliedpolicy.md#BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencedAttribute|`mspcat_certificationrejectionappliedpolicyid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_certificationrejectionappliedpolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord"></a> mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_certificationrejectionappliedpolicy mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord](mspcat_certificationrejectionappliedpolicy.md#BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencedAttribute|`mspcat_certificationrejectionappliedpolicyid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_certificationrejectionappliedpolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_DuplicateBaseRecord"></a> mspcat_certificationrequest_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_DuplicateBaseRecord](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_DuplicateMatchingRecord"></a> mspcat_certificationrequest_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_DuplicateMatchingRecord](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeo_DuplicateBaseRecord"></a> mspcat_crmgeo_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_crmgeo mspcat_crmgeo_DuplicateBaseRecord](mspcat_crmgeo.md#BKMK_mspcat_crmgeo_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeo`|
|ReferencedAttribute|`mspcat_crmgeoid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_crmgeo`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeo_DuplicateMatchingRecord"></a> mspcat_crmgeo_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_crmgeo mspcat_crmgeo_DuplicateMatchingRecord](mspcat_crmgeo.md#BKMK_mspcat_crmgeo_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeo`|
|ReferencedAttribute|`mspcat_crmgeoid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_crmgeo`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installactivity_DuplicateBaseRecord"></a> mspcat_installactivity_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_DuplicateBaseRecord](mspcat_installactivity.md#BKMK_mspcat_installactivity_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installactivity_DuplicateMatchingRecord"></a> mspcat_installactivity_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_DuplicateMatchingRecord](mspcat_installactivity.md#BKMK_mspcat_installactivity_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagelocales_DuplicateBaseRecord"></a> mspcat_packagelocales_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_DuplicateBaseRecord](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagelocales_DuplicateMatchingRecord"></a> mspcat_packagelocales_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_DuplicateMatchingRecord](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_DuplicateBaseRecord"></a> mspcat_packages_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_packages mspcat_packages_DuplicateBaseRecord](mspcat_packages.md#BKMK_mspcat_packages_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_DuplicateMatchingRecord"></a> mspcat_packages_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_packages mspcat_packages_DuplicateMatchingRecord](mspcat_packages.md#BKMK_mspcat_packages_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisher_DuplicateBaseRecord"></a> mspcat_publisher_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_DuplicateBaseRecord](mspcat_publisher.md#BKMK_mspcat_publisher_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisher_DuplicateMatchingRecord"></a> mspcat_publisher_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_DuplicateMatchingRecord](mspcat_publisher.md#BKMK_mspcat_publisher_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicy_DuplicateBaseRecord"></a> mspcat_sspolicy_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_sspolicy mspcat_sspolicy_DuplicateBaseRecord](mspcat_sspolicy.md#BKMK_mspcat_sspolicy_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicy`|
|ReferencedAttribute|`mspcat_sspolicyid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_sspolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicy_DuplicateMatchingRecord"></a> mspcat_sspolicy_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_sspolicy mspcat_sspolicy_DuplicateMatchingRecord](mspcat_sspolicy.md#BKMK_mspcat_sspolicy_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicy`|
|ReferencedAttribute|`mspcat_sspolicyid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_sspolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicytemplate_DuplicateBaseRecord"></a> mspcat_sspolicytemplate_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_sspolicytemplate mspcat_sspolicytemplate_DuplicateBaseRecord](mspcat_sspolicytemplate.md#BKMK_mspcat_sspolicytemplate_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicytemplate`|
|ReferencedAttribute|`mspcat_sspolicytemplateid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_sspolicytemplate`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicytemplate_DuplicateMatchingRecord"></a> mspcat_sspolicytemplate_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_sspolicytemplate mspcat_sspolicytemplate_DuplicateMatchingRecord](mspcat_sspolicytemplate.md#BKMK_mspcat_sspolicytemplate_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicytemplate`|
|ReferencedAttribute|`mspcat_sspolicytemplateid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_sspolicytemplate`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_staticanalysispolicy_DuplicateBaseRecord"></a> mspcat_staticanalysispolicy_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_staticanalysispolicy mspcat_staticanalysispolicy_DuplicateBaseRecord](mspcat_staticanalysispolicy.md#BKMK_mspcat_staticanalysispolicy_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_staticanalysispolicy`|
|ReferencedAttribute|`mspcat_staticanalysispolicyid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_staticanalysispolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_staticanalysispolicy_DuplicateMatchingRecord"></a> mspcat_staticanalysispolicy_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_staticanalysispolicy mspcat_staticanalysispolicy_DuplicateMatchingRecord](mspcat_staticanalysispolicy.md#BKMK_mspcat_staticanalysispolicy_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_staticanalysispolicy`|
|ReferencedAttribute|`mspcat_staticanalysispolicyid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_staticanalysispolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_DuplicateBaseRecord"></a> mspcat_templates_DuplicateBaseRecord

One-To-Many Relationship: [mspcat_templates mspcat_templates_DuplicateBaseRecord](mspcat_templates.md#BKMK_mspcat_templates_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`baserecordid`|
|ReferencingEntityNavigationPropertyName|`baserecordid_mspcat_templates`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_DuplicateMatchingRecord"></a> mspcat_templates_DuplicateMatchingRecord

One-To-Many Relationship: [mspcat_templates mspcat_templates_DuplicateMatchingRecord](mspcat_templates.md#BKMK_mspcat_templates_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencingEntityNavigationPropertyName|`duplicaterecordid_mspcat_templates`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.duplicaterecord?displayProperty=fullName>
