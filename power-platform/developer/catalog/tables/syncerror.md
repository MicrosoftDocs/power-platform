---
title: "Sync Error (SyncError) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Sync Error (SyncError) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Sync Error (SyncError) table/entity reference

Failure reason and other detailed information for a record that failed to sync.

> [!NOTE]
> The Power Platform Catalog Manager Sync Error (SyncError) table extends the [Microsoft Dataverse Sync Error (SyncError) table](/power-apps/developer/data-platform/reference/entities/syncerror).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/syncerror#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applicationreference|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applicationreference_SyncErrors](#BKMK_mspcat_applicationreference_SyncErrors)
- [mspcat_applications_SyncErrors](#BKMK_mspcat_applications_SyncErrors)
- [mspcat_bpf_06d86bf860814221be8c81204be2199d_SyncErrors](#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_SyncErrors)
- [mspcat_catalogdescription_SyncErrors](#BKMK_mspcat_catalogdescription_SyncErrors)
- [mspcat_catalogitemfile_SyncErrors](#BKMK_mspcat_catalogitemfile_SyncErrors)
- [mspcat_certificationrejectionappliedpolicy_SyncErrors](#BKMK_mspcat_certificationrejectionappliedpolicy_SyncErrors)
- [mspcat_certificationrequest_SyncErrors](#BKMK_mspcat_certificationrequest_SyncErrors)
- [mspcat_configurationforpowerapps_SyncErrors](#BKMK_mspcat_configurationforpowerapps_SyncErrors)
- [mspcat_crmgeo_SyncErrors](#BKMK_mspcat_crmgeo_SyncErrors)
- [mspcat_crmgeodeploymentstatus_SyncErrors](#BKMK_mspcat_crmgeodeploymentstatus_SyncErrors)
- [mspcat_installactivity_SyncErrors](#BKMK_mspcat_installactivity_SyncErrors)
- [mspcat_installhistory_SyncErrors](#BKMK_mspcat_installhistory_SyncErrors)
- [mspcat_packagedsolutioncomponents_SyncErrors](#BKMK_mspcat_packagedsolutioncomponents_SyncErrors)
- [mspcat_packagelocales_SyncErrors](#BKMK_mspcat_packagelocales_SyncErrors)
- [mspcat_packages_SyncErrors](#BKMK_mspcat_packages_SyncErrors)
- [mspcat_packagesolutions_SyncErrors](#BKMK_mspcat_packagesolutions_SyncErrors)
- [mspcat_powerappsscanstatus_SyncErrors](#BKMK_mspcat_powerappsscanstatus_SyncErrors)
- [mspcat_publisher_SyncErrors](#BKMK_mspcat_publisher_SyncErrors)
- [mspcat_publisheridentity_SyncErrors](#BKMK_mspcat_publisheridentity_SyncErrors)
- [mspcat_publisherusers_SyncErrors](#BKMK_mspcat_publisherusers_SyncErrors)
- [mspcat_rulesetforpowerappschecker_SyncErrors](#BKMK_mspcat_rulesetforpowerappschecker_SyncErrors)
- [mspcat_sspolicy_SyncErrors](#BKMK_mspcat_sspolicy_SyncErrors)
- [mspcat_sspolicytemplate_SyncErrors](#BKMK_mspcat_sspolicytemplate_SyncErrors)
- [mspcat_staticanalysispolicy_SyncErrors](#BKMK_mspcat_staticanalysispolicy_SyncErrors)
- [mspcat_templates_SyncErrors](#BKMK_mspcat_templates_SyncErrors)

### <a name="BKMK_mspcat_applicationreference_SyncErrors"></a> mspcat_applicationreference_SyncErrors

One-To-Many Relationship: [mspcat_applicationreference mspcat_applicationreference_SyncErrors](mspcat_applicationreference.md#BKMK_mspcat_applicationreference_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applicationreference`|
|ReferencedAttribute|`mspcat_applicationreferenceid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applicationreference`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_applications_SyncErrors"></a> mspcat_applications_SyncErrors

One-To-Many Relationship: [mspcat_applications mspcat_applications_SyncErrors](mspcat_applications.md#BKMK_mspcat_applications_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_SyncErrors"></a> mspcat_bpf_06d86bf860814221be8c81204be2199d_SyncErrors

One-To-Many Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d mspcat_bpf_06d86bf860814221be8c81204be2199d_SyncErrors](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencedAttribute|`businessprocessflowinstanceid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogdescription_SyncErrors"></a> mspcat_catalogdescription_SyncErrors

One-To-Many Relationship: [mspcat_catalogdescription mspcat_catalogdescription_SyncErrors](mspcat_catalogdescription.md#BKMK_mspcat_catalogdescription_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogdescription`|
|ReferencedAttribute|`mspcat_catalogdescriptionid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_catalogdescription`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogitemfile_SyncErrors"></a> mspcat_catalogitemfile_SyncErrors

One-To-Many Relationship: [mspcat_catalogitemfile mspcat_catalogitemfile_SyncErrors](mspcat_catalogitemfile.md#BKMK_mspcat_catalogitemfile_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogitemfile`|
|ReferencedAttribute|`mspcat_catalogitemfileid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_catalogitemfile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_SyncErrors"></a> mspcat_certificationrejectionappliedpolicy_SyncErrors

One-To-Many Relationship: [mspcat_certificationrejectionappliedpolicy mspcat_certificationrejectionappliedpolicy_SyncErrors](mspcat_certificationrejectionappliedpolicy.md#BKMK_mspcat_certificationrejectionappliedpolicy_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencedAttribute|`mspcat_certificationrejectionappliedpolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrejectionappliedpolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_SyncErrors"></a> mspcat_certificationrequest_SyncErrors

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_SyncErrors](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_configurationforpowerapps_SyncErrors"></a> mspcat_configurationforpowerapps_SyncErrors

One-To-Many Relationship: [mspcat_configurationforpowerapps mspcat_configurationforpowerapps_SyncErrors](mspcat_configurationforpowerapps.md#BKMK_mspcat_configurationforpowerapps_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_configurationforpowerapps`|
|ReferencedAttribute|`mspcat_configurationforpowerappsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_configurationforpowerapps`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeo_SyncErrors"></a> mspcat_crmgeo_SyncErrors

One-To-Many Relationship: [mspcat_crmgeo mspcat_crmgeo_SyncErrors](mspcat_crmgeo.md#BKMK_mspcat_crmgeo_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeo`|
|ReferencedAttribute|`mspcat_crmgeoid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_crmgeo`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeodeploymentstatus_SyncErrors"></a> mspcat_crmgeodeploymentstatus_SyncErrors

One-To-Many Relationship: [mspcat_crmgeodeploymentstatus mspcat_crmgeodeploymentstatus_SyncErrors](mspcat_crmgeodeploymentstatus.md#BKMK_mspcat_crmgeodeploymentstatus_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencedAttribute|`mspcat_crmgeodeploymentstatusid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_crmgeodeploymentstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installactivity_SyncErrors"></a> mspcat_installactivity_SyncErrors

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_SyncErrors](mspcat_installactivity.md#BKMK_mspcat_installactivity_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installhistory_SyncErrors"></a> mspcat_installhistory_SyncErrors

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_SyncErrors](mspcat_installhistory.md#BKMK_mspcat_installhistory_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagedsolutioncomponents_SyncErrors"></a> mspcat_packagedsolutioncomponents_SyncErrors

One-To-Many Relationship: [mspcat_packagedsolutioncomponents mspcat_packagedsolutioncomponents_SyncErrors](mspcat_packagedsolutioncomponents.md#BKMK_mspcat_packagedsolutioncomponents_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagedsolutioncomponents`|
|ReferencedAttribute|`mspcat_packagedsolutioncomponentsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagedsolutioncomponents`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagelocales_SyncErrors"></a> mspcat_packagelocales_SyncErrors

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_SyncErrors](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_SyncErrors"></a> mspcat_packages_SyncErrors

One-To-Many Relationship: [mspcat_packages mspcat_packages_SyncErrors](mspcat_packages.md#BKMK_mspcat_packages_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagesolutions_SyncErrors"></a> mspcat_packagesolutions_SyncErrors

One-To-Many Relationship: [mspcat_packagesolutions mspcat_packagesolutions_SyncErrors](mspcat_packagesolutions.md#BKMK_mspcat_packagesolutions_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagesolutions`|
|ReferencedAttribute|`mspcat_packagesolutionsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagesolutions`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_powerappsscanstatus_SyncErrors"></a> mspcat_powerappsscanstatus_SyncErrors

One-To-Many Relationship: [mspcat_powerappsscanstatus mspcat_powerappsscanstatus_SyncErrors](mspcat_powerappsscanstatus.md#BKMK_mspcat_powerappsscanstatus_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_powerappsscanstatus`|
|ReferencedAttribute|`mspcat_powerappsscanstatusid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_powerappsscanstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisher_SyncErrors"></a> mspcat_publisher_SyncErrors

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_SyncErrors](mspcat_publisher.md#BKMK_mspcat_publisher_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisheridentity_SyncErrors"></a> mspcat_publisheridentity_SyncErrors

One-To-Many Relationship: [mspcat_publisheridentity mspcat_publisheridentity_SyncErrors](mspcat_publisheridentity.md#BKMK_mspcat_publisheridentity_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisheridentity`|
|ReferencedAttribute|`mspcat_publisheridentityid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisheridentity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisherusers_SyncErrors"></a> mspcat_publisherusers_SyncErrors

One-To-Many Relationship: [mspcat_publisherusers mspcat_publisherusers_SyncErrors](mspcat_publisherusers.md#BKMK_mspcat_publisherusers_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisherusers`|
|ReferencedAttribute|`mspcat_publisherusersid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisherusers`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_rulesetforpowerappschecker_SyncErrors"></a> mspcat_rulesetforpowerappschecker_SyncErrors

One-To-Many Relationship: [mspcat_rulesetforpowerappschecker mspcat_rulesetforpowerappschecker_SyncErrors](mspcat_rulesetforpowerappschecker.md#BKMK_mspcat_rulesetforpowerappschecker_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_rulesetforpowerappschecker`|
|ReferencedAttribute|`mspcat_rulesetforpowerappscheckerid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_rulesetforpowerappschecker`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicy_SyncErrors"></a> mspcat_sspolicy_SyncErrors

One-To-Many Relationship: [mspcat_sspolicy mspcat_sspolicy_SyncErrors](mspcat_sspolicy.md#BKMK_mspcat_sspolicy_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicy`|
|ReferencedAttribute|`mspcat_sspolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_sspolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicytemplate_SyncErrors"></a> mspcat_sspolicytemplate_SyncErrors

One-To-Many Relationship: [mspcat_sspolicytemplate mspcat_sspolicytemplate_SyncErrors](mspcat_sspolicytemplate.md#BKMK_mspcat_sspolicytemplate_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicytemplate`|
|ReferencedAttribute|`mspcat_sspolicytemplateid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_sspolicytemplate`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_staticanalysispolicy_SyncErrors"></a> mspcat_staticanalysispolicy_SyncErrors

One-To-Many Relationship: [mspcat_staticanalysispolicy mspcat_staticanalysispolicy_SyncErrors](mspcat_staticanalysispolicy.md#BKMK_mspcat_staticanalysispolicy_SyncErrors)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_staticanalysispolicy`|
|ReferencedAttribute|`mspcat_staticanalysispolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_staticanalysispolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_SyncErrors"></a> mspcat_templates_SyncErrors

One-To-Many Relationship: [mspcat_templates mspcat_templates_SyncErrors](mspcat_templates.md#BKMK_mspcat_templates_SyncErrors)

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
<xref:Microsoft.Dynamics.CRM.syncerror?displayProperty=fullName>
