---
title: "System Job (AsyncOperation) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the System Job (AsyncOperation) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# System Job (AsyncOperation) table/entity reference

Process whose execution can proceed independently or in the background.

> [!NOTE]
> The Power Platform Catalog Manager System Job (AsyncOperation) table extends the [Microsoft Dataverse System Job (AsyncOperation) table](/power-apps/developer/data-platform/reference/entities/asyncoperation).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/asyncoperation#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applicationreference|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applicationreference_AsyncOperations](#BKMK_mspcat_applicationreference_AsyncOperations)
- [mspcat_applications_AsyncOperations](#BKMK_mspcat_applications_AsyncOperations)
- [mspcat_bpf_06d86bf860814221be8c81204be2199d_AsyncOperations](#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_AsyncOperations)
- [mspcat_catalogdescription_AsyncOperations](#BKMK_mspcat_catalogdescription_AsyncOperations)
- [mspcat_catalogitemfile_AsyncOperations](#BKMK_mspcat_catalogitemfile_AsyncOperations)
- [mspcat_certificationrejectionappliedpolicy_AsyncOperations](#BKMK_mspcat_certificationrejectionappliedpolicy_AsyncOperations)
- [mspcat_certificationrequest_AsyncOperations](#BKMK_mspcat_certificationrequest_AsyncOperations)
- [mspcat_configurationforpowerapps_AsyncOperations](#BKMK_mspcat_configurationforpowerapps_AsyncOperations)
- [mspcat_crmgeo_AsyncOperations](#BKMK_mspcat_crmgeo_AsyncOperations)
- [mspcat_crmgeodeploymentstatus_AsyncOperations](#BKMK_mspcat_crmgeodeploymentstatus_AsyncOperations)
- [mspcat_installactivity_AsyncOperations](#BKMK_mspcat_installactivity_AsyncOperations)
- [mspcat_installhistory_AsyncOperations](#BKMK_mspcat_installhistory_AsyncOperations)
- [mspcat_packagedsolutioncomponents_AsyncOperations](#BKMK_mspcat_packagedsolutioncomponents_AsyncOperations)
- [mspcat_packagelocales_AsyncOperations](#BKMK_mspcat_packagelocales_AsyncOperations)
- [mspcat_packages_AsyncOperations](#BKMK_mspcat_packages_AsyncOperations)
- [mspcat_packagesolutions_AsyncOperations](#BKMK_mspcat_packagesolutions_AsyncOperations)
- [mspcat_powerappsscanstatus_AsyncOperations](#BKMK_mspcat_powerappsscanstatus_AsyncOperations)
- [mspcat_publisher_AsyncOperations](#BKMK_mspcat_publisher_AsyncOperations)
- [mspcat_publisheridentity_AsyncOperations](#BKMK_mspcat_publisheridentity_AsyncOperations)
- [mspcat_publisherusers_AsyncOperations](#BKMK_mspcat_publisherusers_AsyncOperations)
- [mspcat_rulesetforpowerappschecker_AsyncOperations](#BKMK_mspcat_rulesetforpowerappschecker_AsyncOperations)
- [mspcat_sspolicy_AsyncOperations](#BKMK_mspcat_sspolicy_AsyncOperations)
- [mspcat_sspolicytemplate_AsyncOperations](#BKMK_mspcat_sspolicytemplate_AsyncOperations)
- [mspcat_staticanalysispolicy_AsyncOperations](#BKMK_mspcat_staticanalysispolicy_AsyncOperations)
- [mspcat_templates_AsyncOperations](#BKMK_mspcat_templates_AsyncOperations)

### <a name="BKMK_mspcat_applicationreference_AsyncOperations"></a> mspcat_applicationreference_AsyncOperations

One-To-Many Relationship: [mspcat_applicationreference mspcat_applicationreference_AsyncOperations](mspcat_applicationreference.md#BKMK_mspcat_applicationreference_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applicationreference`|
|ReferencedAttribute|`mspcat_applicationreferenceid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applicationreference`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_applications_AsyncOperations"></a> mspcat_applications_AsyncOperations

One-To-Many Relationship: [mspcat_applications mspcat_applications_AsyncOperations](mspcat_applications.md#BKMK_mspcat_applications_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_AsyncOperations"></a> mspcat_bpf_06d86bf860814221be8c81204be2199d_AsyncOperations

One-To-Many Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d mspcat_bpf_06d86bf860814221be8c81204be2199d_AsyncOperations](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencedAttribute|`businessprocessflowinstanceid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogdescription_AsyncOperations"></a> mspcat_catalogdescription_AsyncOperations

One-To-Many Relationship: [mspcat_catalogdescription mspcat_catalogdescription_AsyncOperations](mspcat_catalogdescription.md#BKMK_mspcat_catalogdescription_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogdescription`|
|ReferencedAttribute|`mspcat_catalogdescriptionid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_catalogdescription`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogitemfile_AsyncOperations"></a> mspcat_catalogitemfile_AsyncOperations

One-To-Many Relationship: [mspcat_catalogitemfile mspcat_catalogitemfile_AsyncOperations](mspcat_catalogitemfile.md#BKMK_mspcat_catalogitemfile_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogitemfile`|
|ReferencedAttribute|`mspcat_catalogitemfileid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_catalogitemfile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_AsyncOperations"></a> mspcat_certificationrejectionappliedpolicy_AsyncOperations

One-To-Many Relationship: [mspcat_certificationrejectionappliedpolicy mspcat_certificationrejectionappliedpolicy_AsyncOperations](mspcat_certificationrejectionappliedpolicy.md#BKMK_mspcat_certificationrejectionappliedpolicy_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencedAttribute|`mspcat_certificationrejectionappliedpolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrejectionappliedpolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_AsyncOperations"></a> mspcat_certificationrequest_AsyncOperations

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_AsyncOperations](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_configurationforpowerapps_AsyncOperations"></a> mspcat_configurationforpowerapps_AsyncOperations

One-To-Many Relationship: [mspcat_configurationforpowerapps mspcat_configurationforpowerapps_AsyncOperations](mspcat_configurationforpowerapps.md#BKMK_mspcat_configurationforpowerapps_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_configurationforpowerapps`|
|ReferencedAttribute|`mspcat_configurationforpowerappsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_configurationforpowerapps`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeo_AsyncOperations"></a> mspcat_crmgeo_AsyncOperations

One-To-Many Relationship: [mspcat_crmgeo mspcat_crmgeo_AsyncOperations](mspcat_crmgeo.md#BKMK_mspcat_crmgeo_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeo`|
|ReferencedAttribute|`mspcat_crmgeoid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_crmgeo`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeodeploymentstatus_AsyncOperations"></a> mspcat_crmgeodeploymentstatus_AsyncOperations

One-To-Many Relationship: [mspcat_crmgeodeploymentstatus mspcat_crmgeodeploymentstatus_AsyncOperations](mspcat_crmgeodeploymentstatus.md#BKMK_mspcat_crmgeodeploymentstatus_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencedAttribute|`mspcat_crmgeodeploymentstatusid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_crmgeodeploymentstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installactivity_AsyncOperations"></a> mspcat_installactivity_AsyncOperations

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_AsyncOperations](mspcat_installactivity.md#BKMK_mspcat_installactivity_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installhistory_AsyncOperations"></a> mspcat_installhistory_AsyncOperations

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_AsyncOperations](mspcat_installhistory.md#BKMK_mspcat_installhistory_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagedsolutioncomponents_AsyncOperations"></a> mspcat_packagedsolutioncomponents_AsyncOperations

One-To-Many Relationship: [mspcat_packagedsolutioncomponents mspcat_packagedsolutioncomponents_AsyncOperations](mspcat_packagedsolutioncomponents.md#BKMK_mspcat_packagedsolutioncomponents_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagedsolutioncomponents`|
|ReferencedAttribute|`mspcat_packagedsolutioncomponentsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagedsolutioncomponents`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagelocales_AsyncOperations"></a> mspcat_packagelocales_AsyncOperations

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_AsyncOperations](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_AsyncOperations"></a> mspcat_packages_AsyncOperations

One-To-Many Relationship: [mspcat_packages mspcat_packages_AsyncOperations](mspcat_packages.md#BKMK_mspcat_packages_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagesolutions_AsyncOperations"></a> mspcat_packagesolutions_AsyncOperations

One-To-Many Relationship: [mspcat_packagesolutions mspcat_packagesolutions_AsyncOperations](mspcat_packagesolutions.md#BKMK_mspcat_packagesolutions_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagesolutions`|
|ReferencedAttribute|`mspcat_packagesolutionsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagesolutions`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_powerappsscanstatus_AsyncOperations"></a> mspcat_powerappsscanstatus_AsyncOperations

One-To-Many Relationship: [mspcat_powerappsscanstatus mspcat_powerappsscanstatus_AsyncOperations](mspcat_powerappsscanstatus.md#BKMK_mspcat_powerappsscanstatus_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_powerappsscanstatus`|
|ReferencedAttribute|`mspcat_powerappsscanstatusid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_powerappsscanstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisher_AsyncOperations"></a> mspcat_publisher_AsyncOperations

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_AsyncOperations](mspcat_publisher.md#BKMK_mspcat_publisher_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisheridentity_AsyncOperations"></a> mspcat_publisheridentity_AsyncOperations

One-To-Many Relationship: [mspcat_publisheridentity mspcat_publisheridentity_AsyncOperations](mspcat_publisheridentity.md#BKMK_mspcat_publisheridentity_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisheridentity`|
|ReferencedAttribute|`mspcat_publisheridentityid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisheridentity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisherusers_AsyncOperations"></a> mspcat_publisherusers_AsyncOperations

One-To-Many Relationship: [mspcat_publisherusers mspcat_publisherusers_AsyncOperations](mspcat_publisherusers.md#BKMK_mspcat_publisherusers_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisherusers`|
|ReferencedAttribute|`mspcat_publisherusersid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisherusers`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_rulesetforpowerappschecker_AsyncOperations"></a> mspcat_rulesetforpowerappschecker_AsyncOperations

One-To-Many Relationship: [mspcat_rulesetforpowerappschecker mspcat_rulesetforpowerappschecker_AsyncOperations](mspcat_rulesetforpowerappschecker.md#BKMK_mspcat_rulesetforpowerappschecker_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_rulesetforpowerappschecker`|
|ReferencedAttribute|`mspcat_rulesetforpowerappscheckerid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_rulesetforpowerappschecker`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicy_AsyncOperations"></a> mspcat_sspolicy_AsyncOperations

One-To-Many Relationship: [mspcat_sspolicy mspcat_sspolicy_AsyncOperations](mspcat_sspolicy.md#BKMK_mspcat_sspolicy_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicy`|
|ReferencedAttribute|`mspcat_sspolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_sspolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicytemplate_AsyncOperations"></a> mspcat_sspolicytemplate_AsyncOperations

One-To-Many Relationship: [mspcat_sspolicytemplate mspcat_sspolicytemplate_AsyncOperations](mspcat_sspolicytemplate.md#BKMK_mspcat_sspolicytemplate_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicytemplate`|
|ReferencedAttribute|`mspcat_sspolicytemplateid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_sspolicytemplate`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_staticanalysispolicy_AsyncOperations"></a> mspcat_staticanalysispolicy_AsyncOperations

One-To-Many Relationship: [mspcat_staticanalysispolicy mspcat_staticanalysispolicy_AsyncOperations](mspcat_staticanalysispolicy.md#BKMK_mspcat_staticanalysispolicy_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_staticanalysispolicy`|
|ReferencedAttribute|`mspcat_staticanalysispolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_staticanalysispolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_AsyncOperations"></a> mspcat_templates_AsyncOperations

One-To-Many Relationship: [mspcat_templates mspcat_templates_AsyncOperations](mspcat_templates.md#BKMK_mspcat_templates_AsyncOperations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.asyncoperation?displayProperty=fullName>
