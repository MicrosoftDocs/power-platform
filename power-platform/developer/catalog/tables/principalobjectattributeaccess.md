---
title: "Field Sharing (PrincipalObjectAttributeAccess) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Field Sharing (PrincipalObjectAttributeAccess) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Field Sharing (PrincipalObjectAttributeAccess) table/entity reference

Defines CRM security principals (users and teams) access rights to secured field for an entity instance.

> [!NOTE]
> The Power Platform Catalog Manager Field Sharing (PrincipalObjectAttributeAccess) table extends the [Microsoft Dataverse Field Sharing (PrincipalObjectAttributeAccess) table](/power-apps/developer/data-platform/reference/entities/principalobjectattributeaccess).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_ObjectId"></a> ObjectId

Changes from [ObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/principalobjectattributeaccess#BKMK_ObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applicationreference|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applicationreference_PrincipalObjectAttributeAccesses](#BKMK_mspcat_applicationreference_PrincipalObjectAttributeAccesses)
- [mspcat_applications_PrincipalObjectAttributeAccesses](#BKMK_mspcat_applications_PrincipalObjectAttributeAccesses)
- [mspcat_bpf_06d86bf860814221be8c81204be2199d_PrincipalObjectAttributeAccesses](#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_PrincipalObjectAttributeAccesses)
- [mspcat_catalogdescription_PrincipalObjectAttributeAccesses](#BKMK_mspcat_catalogdescription_PrincipalObjectAttributeAccesses)
- [mspcat_catalogitemfile_PrincipalObjectAttributeAccesses](#BKMK_mspcat_catalogitemfile_PrincipalObjectAttributeAccesses)
- [mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses](#BKMK_mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses)
- [mspcat_certificationrequest_PrincipalObjectAttributeAccesses](#BKMK_mspcat_certificationrequest_PrincipalObjectAttributeAccesses)
- [mspcat_configurationforpowerapps_PrincipalObjectAttributeAccesses](#BKMK_mspcat_configurationforpowerapps_PrincipalObjectAttributeAccesses)
- [mspcat_crmgeo_PrincipalObjectAttributeAccesses](#BKMK_mspcat_crmgeo_PrincipalObjectAttributeAccesses)
- [mspcat_crmgeodeploymentstatus_PrincipalObjectAttributeAccesses](#BKMK_mspcat_crmgeodeploymentstatus_PrincipalObjectAttributeAccesses)
- [mspcat_installactivity_PrincipalObjectAttributeAccesses](#BKMK_mspcat_installactivity_PrincipalObjectAttributeAccesses)
- [mspcat_installhistory_PrincipalObjectAttributeAccesses](#BKMK_mspcat_installhistory_PrincipalObjectAttributeAccesses)
- [mspcat_packagedsolutioncomponents_PrincipalObjectAttributeAccesses](#BKMK_mspcat_packagedsolutioncomponents_PrincipalObjectAttributeAccesses)
- [mspcat_packagelocales_PrincipalObjectAttributeAccesses](#BKMK_mspcat_packagelocales_PrincipalObjectAttributeAccesses)
- [mspcat_packages_PrincipalObjectAttributeAccesses](#BKMK_mspcat_packages_PrincipalObjectAttributeAccesses)
- [mspcat_packagesolutions_PrincipalObjectAttributeAccesses](#BKMK_mspcat_packagesolutions_PrincipalObjectAttributeAccesses)
- [mspcat_powerappsscanstatus_PrincipalObjectAttributeAccesses](#BKMK_mspcat_powerappsscanstatus_PrincipalObjectAttributeAccesses)
- [mspcat_publisher_PrincipalObjectAttributeAccesses](#BKMK_mspcat_publisher_PrincipalObjectAttributeAccesses)
- [mspcat_publisheridentity_PrincipalObjectAttributeAccesses](#BKMK_mspcat_publisheridentity_PrincipalObjectAttributeAccesses)
- [mspcat_publisherusers_PrincipalObjectAttributeAccesses](#BKMK_mspcat_publisherusers_PrincipalObjectAttributeAccesses)
- [mspcat_rulesetforpowerappschecker_PrincipalObjectAttributeAccesses](#BKMK_mspcat_rulesetforpowerappschecker_PrincipalObjectAttributeAccesses)
- [mspcat_sspolicy_PrincipalObjectAttributeAccesses](#BKMK_mspcat_sspolicy_PrincipalObjectAttributeAccesses)
- [mspcat_sspolicytemplate_PrincipalObjectAttributeAccesses](#BKMK_mspcat_sspolicytemplate_PrincipalObjectAttributeAccesses)
- [mspcat_staticanalysispolicy_PrincipalObjectAttributeAccesses](#BKMK_mspcat_staticanalysispolicy_PrincipalObjectAttributeAccesses)
- [mspcat_templates_PrincipalObjectAttributeAccesses](#BKMK_mspcat_templates_PrincipalObjectAttributeAccesses)

### <a name="BKMK_mspcat_applicationreference_PrincipalObjectAttributeAccesses"></a> mspcat_applicationreference_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_applicationreference mspcat_applicationreference_PrincipalObjectAttributeAccesses](mspcat_applicationreference.md#BKMK_mspcat_applicationreference_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applicationreference`|
|ReferencedAttribute|`mspcat_applicationreferenceid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_applicationreference`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_applications_PrincipalObjectAttributeAccesses"></a> mspcat_applications_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_applications mspcat_applications_PrincipalObjectAttributeAccesses](mspcat_applications.md#BKMK_mspcat_applications_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_PrincipalObjectAttributeAccesses"></a> mspcat_bpf_06d86bf860814221be8c81204be2199d_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d mspcat_bpf_06d86bf860814221be8c81204be2199d_PrincipalObjectAttributeAccesses](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencedAttribute|`businessprocessflowinstanceid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogdescription_PrincipalObjectAttributeAccesses"></a> mspcat_catalogdescription_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_catalogdescription mspcat_catalogdescription_PrincipalObjectAttributeAccesses](mspcat_catalogdescription.md#BKMK_mspcat_catalogdescription_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogdescription`|
|ReferencedAttribute|`mspcat_catalogdescriptionid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_catalogdescription`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogitemfile_PrincipalObjectAttributeAccesses"></a> mspcat_catalogitemfile_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_catalogitemfile mspcat_catalogitemfile_PrincipalObjectAttributeAccesses](mspcat_catalogitemfile.md#BKMK_mspcat_catalogitemfile_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogitemfile`|
|ReferencedAttribute|`mspcat_catalogitemfileid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_catalogitemfile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses"></a> mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_certificationrejectionappliedpolicy mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses](mspcat_certificationrejectionappliedpolicy.md#BKMK_mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencedAttribute|`mspcat_certificationrejectionappliedpolicyid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_certificationrejectionappliedpolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_PrincipalObjectAttributeAccesses"></a> mspcat_certificationrequest_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_PrincipalObjectAttributeAccesses](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_configurationforpowerapps_PrincipalObjectAttributeAccesses"></a> mspcat_configurationforpowerapps_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_configurationforpowerapps mspcat_configurationforpowerapps_PrincipalObjectAttributeAccesses](mspcat_configurationforpowerapps.md#BKMK_mspcat_configurationforpowerapps_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_configurationforpowerapps`|
|ReferencedAttribute|`mspcat_configurationforpowerappsid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_configurationforpowerapps`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeo_PrincipalObjectAttributeAccesses"></a> mspcat_crmgeo_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_crmgeo mspcat_crmgeo_PrincipalObjectAttributeAccesses](mspcat_crmgeo.md#BKMK_mspcat_crmgeo_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeo`|
|ReferencedAttribute|`mspcat_crmgeoid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_crmgeo`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeodeploymentstatus_PrincipalObjectAttributeAccesses"></a> mspcat_crmgeodeploymentstatus_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_crmgeodeploymentstatus mspcat_crmgeodeploymentstatus_PrincipalObjectAttributeAccesses](mspcat_crmgeodeploymentstatus.md#BKMK_mspcat_crmgeodeploymentstatus_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencedAttribute|`mspcat_crmgeodeploymentstatusid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_crmgeodeploymentstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installactivity_PrincipalObjectAttributeAccesses"></a> mspcat_installactivity_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_PrincipalObjectAttributeAccesses](mspcat_installactivity.md#BKMK_mspcat_installactivity_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installhistory_PrincipalObjectAttributeAccesses"></a> mspcat_installhistory_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_PrincipalObjectAttributeAccesses](mspcat_installhistory.md#BKMK_mspcat_installhistory_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_installhistory`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagedsolutioncomponents_PrincipalObjectAttributeAccesses"></a> mspcat_packagedsolutioncomponents_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_packagedsolutioncomponents mspcat_packagedsolutioncomponents_PrincipalObjectAttributeAccesses](mspcat_packagedsolutioncomponents.md#BKMK_mspcat_packagedsolutioncomponents_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagedsolutioncomponents`|
|ReferencedAttribute|`mspcat_packagedsolutioncomponentsid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_packagedsolutioncomponents`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagelocales_PrincipalObjectAttributeAccesses"></a> mspcat_packagelocales_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_PrincipalObjectAttributeAccesses](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_PrincipalObjectAttributeAccesses"></a> mspcat_packages_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_packages mspcat_packages_PrincipalObjectAttributeAccesses](mspcat_packages.md#BKMK_mspcat_packages_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagesolutions_PrincipalObjectAttributeAccesses"></a> mspcat_packagesolutions_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_packagesolutions mspcat_packagesolutions_PrincipalObjectAttributeAccesses](mspcat_packagesolutions.md#BKMK_mspcat_packagesolutions_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagesolutions`|
|ReferencedAttribute|`mspcat_packagesolutionsid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_packagesolutions`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_powerappsscanstatus_PrincipalObjectAttributeAccesses"></a> mspcat_powerappsscanstatus_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_powerappsscanstatus mspcat_powerappsscanstatus_PrincipalObjectAttributeAccesses](mspcat_powerappsscanstatus.md#BKMK_mspcat_powerappsscanstatus_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_powerappsscanstatus`|
|ReferencedAttribute|`mspcat_powerappsscanstatusid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_powerappsscanstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisher_PrincipalObjectAttributeAccesses"></a> mspcat_publisher_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_PrincipalObjectAttributeAccesses](mspcat_publisher.md#BKMK_mspcat_publisher_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisheridentity_PrincipalObjectAttributeAccesses"></a> mspcat_publisheridentity_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_publisheridentity mspcat_publisheridentity_PrincipalObjectAttributeAccesses](mspcat_publisheridentity.md#BKMK_mspcat_publisheridentity_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisheridentity`|
|ReferencedAttribute|`mspcat_publisheridentityid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_publisheridentity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisherusers_PrincipalObjectAttributeAccesses"></a> mspcat_publisherusers_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_publisherusers mspcat_publisherusers_PrincipalObjectAttributeAccesses](mspcat_publisherusers.md#BKMK_mspcat_publisherusers_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisherusers`|
|ReferencedAttribute|`mspcat_publisherusersid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_publisherusers`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_rulesetforpowerappschecker_PrincipalObjectAttributeAccesses"></a> mspcat_rulesetforpowerappschecker_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_rulesetforpowerappschecker mspcat_rulesetforpowerappschecker_PrincipalObjectAttributeAccesses](mspcat_rulesetforpowerappschecker.md#BKMK_mspcat_rulesetforpowerappschecker_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_rulesetforpowerappschecker`|
|ReferencedAttribute|`mspcat_rulesetforpowerappscheckerid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_rulesetforpowerappschecker`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicy_PrincipalObjectAttributeAccesses"></a> mspcat_sspolicy_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_sspolicy mspcat_sspolicy_PrincipalObjectAttributeAccesses](mspcat_sspolicy.md#BKMK_mspcat_sspolicy_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicy`|
|ReferencedAttribute|`mspcat_sspolicyid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_sspolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicytemplate_PrincipalObjectAttributeAccesses"></a> mspcat_sspolicytemplate_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_sspolicytemplate mspcat_sspolicytemplate_PrincipalObjectAttributeAccesses](mspcat_sspolicytemplate.md#BKMK_mspcat_sspolicytemplate_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicytemplate`|
|ReferencedAttribute|`mspcat_sspolicytemplateid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_sspolicytemplate`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_staticanalysispolicy_PrincipalObjectAttributeAccesses"></a> mspcat_staticanalysispolicy_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_staticanalysispolicy mspcat_staticanalysispolicy_PrincipalObjectAttributeAccesses](mspcat_staticanalysispolicy.md#BKMK_mspcat_staticanalysispolicy_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_staticanalysispolicy`|
|ReferencedAttribute|`mspcat_staticanalysispolicyid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_staticanalysispolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_PrincipalObjectAttributeAccesses"></a> mspcat_templates_PrincipalObjectAttributeAccesses

One-To-Many Relationship: [mspcat_templates mspcat_templates_PrincipalObjectAttributeAccesses](mspcat_templates.md#BKMK_mspcat_templates_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_templates`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.principalobjectattributeaccess?displayProperty=fullName>
