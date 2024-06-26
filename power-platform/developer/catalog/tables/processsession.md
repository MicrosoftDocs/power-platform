---
title: "Process Session (ProcessSession) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Process Session (ProcessSession) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Process Session (ProcessSession) table/entity reference

Information that is generated when a dialog is run. Every time that you run a dialog, a dialog session is created.

> [!NOTE]
> The Power Platform Catalog Manager Process Session (ProcessSession) table extends the [Microsoft Dataverse Process Session (ProcessSession) table](/power-apps/developer/data-platform/reference/entities/processsession).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/processsession#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applicationreference|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applicationreference_ProcessSession](#BKMK_mspcat_applicationreference_ProcessSession)
- [mspcat_applications_ProcessSession](#BKMK_mspcat_applications_ProcessSession)
- [mspcat_bpf_06d86bf860814221be8c81204be2199d_ProcessSession](#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_ProcessSession)
- [mspcat_catalogdescription_ProcessSession](#BKMK_mspcat_catalogdescription_ProcessSession)
- [mspcat_catalogitemfile_ProcessSession](#BKMK_mspcat_catalogitemfile_ProcessSession)
- [mspcat_certificationrejectionappliedpolicy_ProcessSession](#BKMK_mspcat_certificationrejectionappliedpolicy_ProcessSession)
- [mspcat_certificationrequest_ProcessSession](#BKMK_mspcat_certificationrequest_ProcessSession)
- [mspcat_configurationforpowerapps_ProcessSession](#BKMK_mspcat_configurationforpowerapps_ProcessSession)
- [mspcat_crmgeo_ProcessSession](#BKMK_mspcat_crmgeo_ProcessSession)
- [mspcat_crmgeodeploymentstatus_ProcessSession](#BKMK_mspcat_crmgeodeploymentstatus_ProcessSession)
- [mspcat_installactivity_ProcessSession](#BKMK_mspcat_installactivity_ProcessSession)
- [mspcat_installhistory_ProcessSession](#BKMK_mspcat_installhistory_ProcessSession)
- [mspcat_packagedsolutioncomponents_ProcessSession](#BKMK_mspcat_packagedsolutioncomponents_ProcessSession)
- [mspcat_packagelocales_ProcessSession](#BKMK_mspcat_packagelocales_ProcessSession)
- [mspcat_packages_ProcessSession](#BKMK_mspcat_packages_ProcessSession)
- [mspcat_packagesolutions_ProcessSession](#BKMK_mspcat_packagesolutions_ProcessSession)
- [mspcat_powerappsscanstatus_ProcessSession](#BKMK_mspcat_powerappsscanstatus_ProcessSession)
- [mspcat_publisher_ProcessSession](#BKMK_mspcat_publisher_ProcessSession)
- [mspcat_publisheridentity_ProcessSession](#BKMK_mspcat_publisheridentity_ProcessSession)
- [mspcat_publisherusers_ProcessSession](#BKMK_mspcat_publisherusers_ProcessSession)
- [mspcat_rulesetforpowerappschecker_ProcessSession](#BKMK_mspcat_rulesetforpowerappschecker_ProcessSession)
- [mspcat_sspolicy_ProcessSession](#BKMK_mspcat_sspolicy_ProcessSession)
- [mspcat_sspolicytemplate_ProcessSession](#BKMK_mspcat_sspolicytemplate_ProcessSession)
- [mspcat_staticanalysispolicy_ProcessSession](#BKMK_mspcat_staticanalysispolicy_ProcessSession)
- [mspcat_templates_ProcessSession](#BKMK_mspcat_templates_ProcessSession)

### <a name="BKMK_mspcat_applicationreference_ProcessSession"></a> mspcat_applicationreference_ProcessSession

One-To-Many Relationship: [mspcat_applicationreference mspcat_applicationreference_ProcessSession](mspcat_applicationreference.md#BKMK_mspcat_applicationreference_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applicationreference`|
|ReferencedAttribute|`mspcat_applicationreferenceid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applicationreference`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_applications_ProcessSession"></a> mspcat_applications_ProcessSession

One-To-Many Relationship: [mspcat_applications mspcat_applications_ProcessSession](mspcat_applications.md#BKMK_mspcat_applications_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_ProcessSession"></a> mspcat_bpf_06d86bf860814221be8c81204be2199d_ProcessSession

One-To-Many Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d mspcat_bpf_06d86bf860814221be8c81204be2199d_ProcessSession](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencedAttribute|`businessprocessflowinstanceid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogdescription_ProcessSession"></a> mspcat_catalogdescription_ProcessSession

One-To-Many Relationship: [mspcat_catalogdescription mspcat_catalogdescription_ProcessSession](mspcat_catalogdescription.md#BKMK_mspcat_catalogdescription_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogdescription`|
|ReferencedAttribute|`mspcat_catalogdescriptionid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_catalogdescription`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogitemfile_ProcessSession"></a> mspcat_catalogitemfile_ProcessSession

One-To-Many Relationship: [mspcat_catalogitemfile mspcat_catalogitemfile_ProcessSession](mspcat_catalogitemfile.md#BKMK_mspcat_catalogitemfile_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogitemfile`|
|ReferencedAttribute|`mspcat_catalogitemfileid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_catalogitemfile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_ProcessSession"></a> mspcat_certificationrejectionappliedpolicy_ProcessSession

One-To-Many Relationship: [mspcat_certificationrejectionappliedpolicy mspcat_certificationrejectionappliedpolicy_ProcessSession](mspcat_certificationrejectionappliedpolicy.md#BKMK_mspcat_certificationrejectionappliedpolicy_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencedAttribute|`mspcat_certificationrejectionappliedpolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrejectionappliedpolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_ProcessSession"></a> mspcat_certificationrequest_ProcessSession

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_ProcessSession](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_configurationforpowerapps_ProcessSession"></a> mspcat_configurationforpowerapps_ProcessSession

One-To-Many Relationship: [mspcat_configurationforpowerapps mspcat_configurationforpowerapps_ProcessSession](mspcat_configurationforpowerapps.md#BKMK_mspcat_configurationforpowerapps_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_configurationforpowerapps`|
|ReferencedAttribute|`mspcat_configurationforpowerappsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_configurationforpowerapps`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeo_ProcessSession"></a> mspcat_crmgeo_ProcessSession

One-To-Many Relationship: [mspcat_crmgeo mspcat_crmgeo_ProcessSession](mspcat_crmgeo.md#BKMK_mspcat_crmgeo_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeo`|
|ReferencedAttribute|`mspcat_crmgeoid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_crmgeo`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeodeploymentstatus_ProcessSession"></a> mspcat_crmgeodeploymentstatus_ProcessSession

One-To-Many Relationship: [mspcat_crmgeodeploymentstatus mspcat_crmgeodeploymentstatus_ProcessSession](mspcat_crmgeodeploymentstatus.md#BKMK_mspcat_crmgeodeploymentstatus_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencedAttribute|`mspcat_crmgeodeploymentstatusid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_crmgeodeploymentstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installactivity_ProcessSession"></a> mspcat_installactivity_ProcessSession

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_ProcessSession](mspcat_installactivity.md#BKMK_mspcat_installactivity_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installhistory_ProcessSession"></a> mspcat_installhistory_ProcessSession

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_ProcessSession](mspcat_installhistory.md#BKMK_mspcat_installhistory_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagedsolutioncomponents_ProcessSession"></a> mspcat_packagedsolutioncomponents_ProcessSession

One-To-Many Relationship: [mspcat_packagedsolutioncomponents mspcat_packagedsolutioncomponents_ProcessSession](mspcat_packagedsolutioncomponents.md#BKMK_mspcat_packagedsolutioncomponents_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagedsolutioncomponents`|
|ReferencedAttribute|`mspcat_packagedsolutioncomponentsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagedsolutioncomponents`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagelocales_ProcessSession"></a> mspcat_packagelocales_ProcessSession

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_ProcessSession](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_ProcessSession"></a> mspcat_packages_ProcessSession

One-To-Many Relationship: [mspcat_packages mspcat_packages_ProcessSession](mspcat_packages.md#BKMK_mspcat_packages_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagesolutions_ProcessSession"></a> mspcat_packagesolutions_ProcessSession

One-To-Many Relationship: [mspcat_packagesolutions mspcat_packagesolutions_ProcessSession](mspcat_packagesolutions.md#BKMK_mspcat_packagesolutions_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagesolutions`|
|ReferencedAttribute|`mspcat_packagesolutionsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagesolutions`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_powerappsscanstatus_ProcessSession"></a> mspcat_powerappsscanstatus_ProcessSession

One-To-Many Relationship: [mspcat_powerappsscanstatus mspcat_powerappsscanstatus_ProcessSession](mspcat_powerappsscanstatus.md#BKMK_mspcat_powerappsscanstatus_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_powerappsscanstatus`|
|ReferencedAttribute|`mspcat_powerappsscanstatusid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_powerappsscanstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisher_ProcessSession"></a> mspcat_publisher_ProcessSession

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_ProcessSession](mspcat_publisher.md#BKMK_mspcat_publisher_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisheridentity_ProcessSession"></a> mspcat_publisheridentity_ProcessSession

One-To-Many Relationship: [mspcat_publisheridentity mspcat_publisheridentity_ProcessSession](mspcat_publisheridentity.md#BKMK_mspcat_publisheridentity_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisheridentity`|
|ReferencedAttribute|`mspcat_publisheridentityid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisheridentity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisherusers_ProcessSession"></a> mspcat_publisherusers_ProcessSession

One-To-Many Relationship: [mspcat_publisherusers mspcat_publisherusers_ProcessSession](mspcat_publisherusers.md#BKMK_mspcat_publisherusers_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisherusers`|
|ReferencedAttribute|`mspcat_publisherusersid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisherusers`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_rulesetforpowerappschecker_ProcessSession"></a> mspcat_rulesetforpowerappschecker_ProcessSession

One-To-Many Relationship: [mspcat_rulesetforpowerappschecker mspcat_rulesetforpowerappschecker_ProcessSession](mspcat_rulesetforpowerappschecker.md#BKMK_mspcat_rulesetforpowerappschecker_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_rulesetforpowerappschecker`|
|ReferencedAttribute|`mspcat_rulesetforpowerappscheckerid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_rulesetforpowerappschecker`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicy_ProcessSession"></a> mspcat_sspolicy_ProcessSession

One-To-Many Relationship: [mspcat_sspolicy mspcat_sspolicy_ProcessSession](mspcat_sspolicy.md#BKMK_mspcat_sspolicy_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicy`|
|ReferencedAttribute|`mspcat_sspolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_sspolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicytemplate_ProcessSession"></a> mspcat_sspolicytemplate_ProcessSession

One-To-Many Relationship: [mspcat_sspolicytemplate mspcat_sspolicytemplate_ProcessSession](mspcat_sspolicytemplate.md#BKMK_mspcat_sspolicytemplate_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicytemplate`|
|ReferencedAttribute|`mspcat_sspolicytemplateid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_sspolicytemplate`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_staticanalysispolicy_ProcessSession"></a> mspcat_staticanalysispolicy_ProcessSession

One-To-Many Relationship: [mspcat_staticanalysispolicy mspcat_staticanalysispolicy_ProcessSession](mspcat_staticanalysispolicy.md#BKMK_mspcat_staticanalysispolicy_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_staticanalysispolicy`|
|ReferencedAttribute|`mspcat_staticanalysispolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_staticanalysispolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_ProcessSession"></a> mspcat_templates_ProcessSession

One-To-Many Relationship: [mspcat_templates mspcat_templates_ProcessSession](mspcat_templates.md#BKMK_mspcat_templates_ProcessSession)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.processsession?displayProperty=fullName>
