---
title: "Bulk Delete Failure (BulkDeleteFailure) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Bulk Delete Failure (BulkDeleteFailure) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Bulk Delete Failure (BulkDeleteFailure) table/entity reference

Record that was not deleted during a bulk deletion job.

> [!NOTE]
> The Power Platform Catalog Manager Bulk Delete Failure (BulkDeleteFailure) table extends the [Microsoft Dataverse Bulk Delete Failure (BulkDeleteFailure) table](/power-apps/developer/data-platform/reference/entities/bulkdeletefailure).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/bulkdeletefailure#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applicationreference|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applicationreference_BulkDeleteFailures](#BKMK_mspcat_applicationreference_BulkDeleteFailures)
- [mspcat_applications_BulkDeleteFailures](#BKMK_mspcat_applications_BulkDeleteFailures)
- [mspcat_bpf_06d86bf860814221be8c81204be2199d_BulkDeleteFailures](#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_BulkDeleteFailures)
- [mspcat_catalogdescription_BulkDeleteFailures](#BKMK_mspcat_catalogdescription_BulkDeleteFailures)
- [mspcat_catalogitemfile_BulkDeleteFailures](#BKMK_mspcat_catalogitemfile_BulkDeleteFailures)
- [mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures](#BKMK_mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures)
- [mspcat_certificationrequest_BulkDeleteFailures](#BKMK_mspcat_certificationrequest_BulkDeleteFailures)
- [mspcat_configurationforpowerapps_BulkDeleteFailures](#BKMK_mspcat_configurationforpowerapps_BulkDeleteFailures)
- [mspcat_crmgeo_BulkDeleteFailures](#BKMK_mspcat_crmgeo_BulkDeleteFailures)
- [mspcat_crmgeodeploymentstatus_BulkDeleteFailures](#BKMK_mspcat_crmgeodeploymentstatus_BulkDeleteFailures)
- [mspcat_installactivity_BulkDeleteFailures](#BKMK_mspcat_installactivity_BulkDeleteFailures)
- [mspcat_installhistory_BulkDeleteFailures](#BKMK_mspcat_installhistory_BulkDeleteFailures)
- [mspcat_packagedsolutioncomponents_BulkDeleteFailures](#BKMK_mspcat_packagedsolutioncomponents_BulkDeleteFailures)
- [mspcat_packagelocales_BulkDeleteFailures](#BKMK_mspcat_packagelocales_BulkDeleteFailures)
- [mspcat_packages_BulkDeleteFailures](#BKMK_mspcat_packages_BulkDeleteFailures)
- [mspcat_packagesolutions_BulkDeleteFailures](#BKMK_mspcat_packagesolutions_BulkDeleteFailures)
- [mspcat_powerappsscanstatus_BulkDeleteFailures](#BKMK_mspcat_powerappsscanstatus_BulkDeleteFailures)
- [mspcat_publisher_BulkDeleteFailures](#BKMK_mspcat_publisher_BulkDeleteFailures)
- [mspcat_publisheridentity_BulkDeleteFailures](#BKMK_mspcat_publisheridentity_BulkDeleteFailures)
- [mspcat_publisherusers_BulkDeleteFailures](#BKMK_mspcat_publisherusers_BulkDeleteFailures)
- [mspcat_rulesetforpowerappschecker_BulkDeleteFailures](#BKMK_mspcat_rulesetforpowerappschecker_BulkDeleteFailures)
- [mspcat_sspolicy_BulkDeleteFailures](#BKMK_mspcat_sspolicy_BulkDeleteFailures)
- [mspcat_sspolicytemplate_BulkDeleteFailures](#BKMK_mspcat_sspolicytemplate_BulkDeleteFailures)
- [mspcat_staticanalysispolicy_BulkDeleteFailures](#BKMK_mspcat_staticanalysispolicy_BulkDeleteFailures)
- [mspcat_templates_BulkDeleteFailures](#BKMK_mspcat_templates_BulkDeleteFailures)

### <a name="BKMK_mspcat_applicationreference_BulkDeleteFailures"></a> mspcat_applicationreference_BulkDeleteFailures

One-To-Many Relationship: [mspcat_applicationreference mspcat_applicationreference_BulkDeleteFailures](mspcat_applicationreference.md#BKMK_mspcat_applicationreference_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applicationreference`|
|ReferencedAttribute|`mspcat_applicationreferenceid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applicationreference`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_applications_BulkDeleteFailures"></a> mspcat_applications_BulkDeleteFailures

One-To-Many Relationship: [mspcat_applications mspcat_applications_BulkDeleteFailures](mspcat_applications.md#BKMK_mspcat_applications_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_BulkDeleteFailures"></a> mspcat_bpf_06d86bf860814221be8c81204be2199d_BulkDeleteFailures

One-To-Many Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d mspcat_bpf_06d86bf860814221be8c81204be2199d_BulkDeleteFailures](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencedAttribute|`businessprocessflowinstanceid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogdescription_BulkDeleteFailures"></a> mspcat_catalogdescription_BulkDeleteFailures

One-To-Many Relationship: [mspcat_catalogdescription mspcat_catalogdescription_BulkDeleteFailures](mspcat_catalogdescription.md#BKMK_mspcat_catalogdescription_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogdescription`|
|ReferencedAttribute|`mspcat_catalogdescriptionid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_catalogdescription`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogitemfile_BulkDeleteFailures"></a> mspcat_catalogitemfile_BulkDeleteFailures

One-To-Many Relationship: [mspcat_catalogitemfile mspcat_catalogitemfile_BulkDeleteFailures](mspcat_catalogitemfile.md#BKMK_mspcat_catalogitemfile_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogitemfile`|
|ReferencedAttribute|`mspcat_catalogitemfileid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_catalogitemfile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures"></a> mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures

One-To-Many Relationship: [mspcat_certificationrejectionappliedpolicy mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures](mspcat_certificationrejectionappliedpolicy.md#BKMK_mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencedAttribute|`mspcat_certificationrejectionappliedpolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrejectionappliedpolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_BulkDeleteFailures"></a> mspcat_certificationrequest_BulkDeleteFailures

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_BulkDeleteFailures](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_configurationforpowerapps_BulkDeleteFailures"></a> mspcat_configurationforpowerapps_BulkDeleteFailures

One-To-Many Relationship: [mspcat_configurationforpowerapps mspcat_configurationforpowerapps_BulkDeleteFailures](mspcat_configurationforpowerapps.md#BKMK_mspcat_configurationforpowerapps_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_configurationforpowerapps`|
|ReferencedAttribute|`mspcat_configurationforpowerappsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_configurationforpowerapps`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeo_BulkDeleteFailures"></a> mspcat_crmgeo_BulkDeleteFailures

One-To-Many Relationship: [mspcat_crmgeo mspcat_crmgeo_BulkDeleteFailures](mspcat_crmgeo.md#BKMK_mspcat_crmgeo_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeo`|
|ReferencedAttribute|`mspcat_crmgeoid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_crmgeo`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeodeploymentstatus_BulkDeleteFailures"></a> mspcat_crmgeodeploymentstatus_BulkDeleteFailures

One-To-Many Relationship: [mspcat_crmgeodeploymentstatus mspcat_crmgeodeploymentstatus_BulkDeleteFailures](mspcat_crmgeodeploymentstatus.md#BKMK_mspcat_crmgeodeploymentstatus_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencedAttribute|`mspcat_crmgeodeploymentstatusid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_crmgeodeploymentstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installactivity_BulkDeleteFailures"></a> mspcat_installactivity_BulkDeleteFailures

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_BulkDeleteFailures](mspcat_installactivity.md#BKMK_mspcat_installactivity_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installhistory_BulkDeleteFailures"></a> mspcat_installhistory_BulkDeleteFailures

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_BulkDeleteFailures](mspcat_installhistory.md#BKMK_mspcat_installhistory_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagedsolutioncomponents_BulkDeleteFailures"></a> mspcat_packagedsolutioncomponents_BulkDeleteFailures

One-To-Many Relationship: [mspcat_packagedsolutioncomponents mspcat_packagedsolutioncomponents_BulkDeleteFailures](mspcat_packagedsolutioncomponents.md#BKMK_mspcat_packagedsolutioncomponents_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagedsolutioncomponents`|
|ReferencedAttribute|`mspcat_packagedsolutioncomponentsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagedsolutioncomponents`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagelocales_BulkDeleteFailures"></a> mspcat_packagelocales_BulkDeleteFailures

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_BulkDeleteFailures](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_BulkDeleteFailures"></a> mspcat_packages_BulkDeleteFailures

One-To-Many Relationship: [mspcat_packages mspcat_packages_BulkDeleteFailures](mspcat_packages.md#BKMK_mspcat_packages_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagesolutions_BulkDeleteFailures"></a> mspcat_packagesolutions_BulkDeleteFailures

One-To-Many Relationship: [mspcat_packagesolutions mspcat_packagesolutions_BulkDeleteFailures](mspcat_packagesolutions.md#BKMK_mspcat_packagesolutions_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagesolutions`|
|ReferencedAttribute|`mspcat_packagesolutionsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagesolutions`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_powerappsscanstatus_BulkDeleteFailures"></a> mspcat_powerappsscanstatus_BulkDeleteFailures

One-To-Many Relationship: [mspcat_powerappsscanstatus mspcat_powerappsscanstatus_BulkDeleteFailures](mspcat_powerappsscanstatus.md#BKMK_mspcat_powerappsscanstatus_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_powerappsscanstatus`|
|ReferencedAttribute|`mspcat_powerappsscanstatusid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_powerappsscanstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisher_BulkDeleteFailures"></a> mspcat_publisher_BulkDeleteFailures

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_BulkDeleteFailures](mspcat_publisher.md#BKMK_mspcat_publisher_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisheridentity_BulkDeleteFailures"></a> mspcat_publisheridentity_BulkDeleteFailures

One-To-Many Relationship: [mspcat_publisheridentity mspcat_publisheridentity_BulkDeleteFailures](mspcat_publisheridentity.md#BKMK_mspcat_publisheridentity_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisheridentity`|
|ReferencedAttribute|`mspcat_publisheridentityid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisheridentity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisherusers_BulkDeleteFailures"></a> mspcat_publisherusers_BulkDeleteFailures

One-To-Many Relationship: [mspcat_publisherusers mspcat_publisherusers_BulkDeleteFailures](mspcat_publisherusers.md#BKMK_mspcat_publisherusers_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisherusers`|
|ReferencedAttribute|`mspcat_publisherusersid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisherusers`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_rulesetforpowerappschecker_BulkDeleteFailures"></a> mspcat_rulesetforpowerappschecker_BulkDeleteFailures

One-To-Many Relationship: [mspcat_rulesetforpowerappschecker mspcat_rulesetforpowerappschecker_BulkDeleteFailures](mspcat_rulesetforpowerappschecker.md#BKMK_mspcat_rulesetforpowerappschecker_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_rulesetforpowerappschecker`|
|ReferencedAttribute|`mspcat_rulesetforpowerappscheckerid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_rulesetforpowerappschecker`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicy_BulkDeleteFailures"></a> mspcat_sspolicy_BulkDeleteFailures

One-To-Many Relationship: [mspcat_sspolicy mspcat_sspolicy_BulkDeleteFailures](mspcat_sspolicy.md#BKMK_mspcat_sspolicy_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicy`|
|ReferencedAttribute|`mspcat_sspolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_sspolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicytemplate_BulkDeleteFailures"></a> mspcat_sspolicytemplate_BulkDeleteFailures

One-To-Many Relationship: [mspcat_sspolicytemplate mspcat_sspolicytemplate_BulkDeleteFailures](mspcat_sspolicytemplate.md#BKMK_mspcat_sspolicytemplate_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicytemplate`|
|ReferencedAttribute|`mspcat_sspolicytemplateid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_sspolicytemplate`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_staticanalysispolicy_BulkDeleteFailures"></a> mspcat_staticanalysispolicy_BulkDeleteFailures

One-To-Many Relationship: [mspcat_staticanalysispolicy mspcat_staticanalysispolicy_BulkDeleteFailures](mspcat_staticanalysispolicy.md#BKMK_mspcat_staticanalysispolicy_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_staticanalysispolicy`|
|ReferencedAttribute|`mspcat_staticanalysispolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_staticanalysispolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_BulkDeleteFailures"></a> mspcat_templates_BulkDeleteFailures

One-To-Many Relationship: [mspcat_templates mspcat_templates_BulkDeleteFailures](mspcat_templates.md#BKMK_mspcat_templates_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.bulkdeletefailure?displayProperty=fullName>
