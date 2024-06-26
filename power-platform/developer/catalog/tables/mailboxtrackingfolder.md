---
title: "Mailbox Auto Tracking Folder (MailboxTrackingFolder) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Mailbox Auto Tracking Folder (MailboxTrackingFolder) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Mailbox Auto Tracking Folder (MailboxTrackingFolder) table/entity reference

Stores data about what folders for a mailbox are auto tracked

> [!NOTE]
> The Power Platform Catalog Manager Mailbox Auto Tracking Folder (MailboxTrackingFolder) table extends the [Microsoft Dataverse Mailbox Auto Tracking Folder (MailboxTrackingFolder) table](/power-apps/developer/data-platform/reference/entities/mailboxtrackingfolder).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/mailboxtrackingfolder#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applicationreference|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applicationreference_MailboxTrackingFolders](#BKMK_mspcat_applicationreference_MailboxTrackingFolders)
- [mspcat_applications_MailboxTrackingFolders](#BKMK_mspcat_applications_MailboxTrackingFolders)
- [mspcat_bpf_06d86bf860814221be8c81204be2199d_MailboxTrackingFolders](#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_MailboxTrackingFolders)
- [mspcat_catalogdescription_MailboxTrackingFolders](#BKMK_mspcat_catalogdescription_MailboxTrackingFolders)
- [mspcat_catalogitemfile_MailboxTrackingFolders](#BKMK_mspcat_catalogitemfile_MailboxTrackingFolders)
- [mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders](#BKMK_mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders)
- [mspcat_certificationrequest_MailboxTrackingFolders](#BKMK_mspcat_certificationrequest_MailboxTrackingFolders)
- [mspcat_configurationforpowerapps_MailboxTrackingFolders](#BKMK_mspcat_configurationforpowerapps_MailboxTrackingFolders)
- [mspcat_crmgeo_MailboxTrackingFolders](#BKMK_mspcat_crmgeo_MailboxTrackingFolders)
- [mspcat_crmgeodeploymentstatus_MailboxTrackingFolders](#BKMK_mspcat_crmgeodeploymentstatus_MailboxTrackingFolders)
- [mspcat_installactivity_MailboxTrackingFolders](#BKMK_mspcat_installactivity_MailboxTrackingFolders)
- [mspcat_installhistory_MailboxTrackingFolders](#BKMK_mspcat_installhistory_MailboxTrackingFolders)
- [mspcat_packagedsolutioncomponents_MailboxTrackingFolders](#BKMK_mspcat_packagedsolutioncomponents_MailboxTrackingFolders)
- [mspcat_packagelocales_MailboxTrackingFolders](#BKMK_mspcat_packagelocales_MailboxTrackingFolders)
- [mspcat_packages_MailboxTrackingFolders](#BKMK_mspcat_packages_MailboxTrackingFolders)
- [mspcat_packagesolutions_MailboxTrackingFolders](#BKMK_mspcat_packagesolutions_MailboxTrackingFolders)
- [mspcat_powerappsscanstatus_MailboxTrackingFolders](#BKMK_mspcat_powerappsscanstatus_MailboxTrackingFolders)
- [mspcat_publisher_MailboxTrackingFolders](#BKMK_mspcat_publisher_MailboxTrackingFolders)
- [mspcat_publisheridentity_MailboxTrackingFolders](#BKMK_mspcat_publisheridentity_MailboxTrackingFolders)
- [mspcat_publisherusers_MailboxTrackingFolders](#BKMK_mspcat_publisherusers_MailboxTrackingFolders)
- [mspcat_rulesetforpowerappschecker_MailboxTrackingFolders](#BKMK_mspcat_rulesetforpowerappschecker_MailboxTrackingFolders)
- [mspcat_sspolicy_MailboxTrackingFolders](#BKMK_mspcat_sspolicy_MailboxTrackingFolders)
- [mspcat_sspolicytemplate_MailboxTrackingFolders](#BKMK_mspcat_sspolicytemplate_MailboxTrackingFolders)
- [mspcat_staticanalysispolicy_MailboxTrackingFolders](#BKMK_mspcat_staticanalysispolicy_MailboxTrackingFolders)
- [mspcat_templates_MailboxTrackingFolders](#BKMK_mspcat_templates_MailboxTrackingFolders)

### <a name="BKMK_mspcat_applicationreference_MailboxTrackingFolders"></a> mspcat_applicationreference_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_applicationreference mspcat_applicationreference_MailboxTrackingFolders](mspcat_applicationreference.md#BKMK_mspcat_applicationreference_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applicationreference`|
|ReferencedAttribute|`mspcat_applicationreferenceid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applicationreference`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_applications_MailboxTrackingFolders"></a> mspcat_applications_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_applications mspcat_applications_MailboxTrackingFolders](mspcat_applications.md#BKMK_mspcat_applications_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_MailboxTrackingFolders"></a> mspcat_bpf_06d86bf860814221be8c81204be2199d_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d mspcat_bpf_06d86bf860814221be8c81204be2199d_MailboxTrackingFolders](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencedAttribute|`businessprocessflowinstanceid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogdescription_MailboxTrackingFolders"></a> mspcat_catalogdescription_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_catalogdescription mspcat_catalogdescription_MailboxTrackingFolders](mspcat_catalogdescription.md#BKMK_mspcat_catalogdescription_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogdescription`|
|ReferencedAttribute|`mspcat_catalogdescriptionid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_catalogdescription`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_catalogitemfile_MailboxTrackingFolders"></a> mspcat_catalogitemfile_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_catalogitemfile mspcat_catalogitemfile_MailboxTrackingFolders](mspcat_catalogitemfile.md#BKMK_mspcat_catalogitemfile_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogitemfile`|
|ReferencedAttribute|`mspcat_catalogitemfileid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_catalogitemfile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders"></a> mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_certificationrejectionappliedpolicy mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders](mspcat_certificationrejectionappliedpolicy.md#BKMK_mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencedAttribute|`mspcat_certificationrejectionappliedpolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrejectionappliedpolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_MailboxTrackingFolders"></a> mspcat_certificationrequest_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_MailboxTrackingFolders](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_configurationforpowerapps_MailboxTrackingFolders"></a> mspcat_configurationforpowerapps_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_configurationforpowerapps mspcat_configurationforpowerapps_MailboxTrackingFolders](mspcat_configurationforpowerapps.md#BKMK_mspcat_configurationforpowerapps_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_configurationforpowerapps`|
|ReferencedAttribute|`mspcat_configurationforpowerappsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_configurationforpowerapps`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeo_MailboxTrackingFolders"></a> mspcat_crmgeo_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_crmgeo mspcat_crmgeo_MailboxTrackingFolders](mspcat_crmgeo.md#BKMK_mspcat_crmgeo_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeo`|
|ReferencedAttribute|`mspcat_crmgeoid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_crmgeo`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeodeploymentstatus_MailboxTrackingFolders"></a> mspcat_crmgeodeploymentstatus_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_crmgeodeploymentstatus mspcat_crmgeodeploymentstatus_MailboxTrackingFolders](mspcat_crmgeodeploymentstatus.md#BKMK_mspcat_crmgeodeploymentstatus_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencedAttribute|`mspcat_crmgeodeploymentstatusid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_crmgeodeploymentstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installactivity_MailboxTrackingFolders"></a> mspcat_installactivity_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_MailboxTrackingFolders](mspcat_installactivity.md#BKMK_mspcat_installactivity_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installhistory_MailboxTrackingFolders"></a> mspcat_installhistory_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_MailboxTrackingFolders](mspcat_installhistory.md#BKMK_mspcat_installhistory_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagedsolutioncomponents_MailboxTrackingFolders"></a> mspcat_packagedsolutioncomponents_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_packagedsolutioncomponents mspcat_packagedsolutioncomponents_MailboxTrackingFolders](mspcat_packagedsolutioncomponents.md#BKMK_mspcat_packagedsolutioncomponents_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagedsolutioncomponents`|
|ReferencedAttribute|`mspcat_packagedsolutioncomponentsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagedsolutioncomponents`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagelocales_MailboxTrackingFolders"></a> mspcat_packagelocales_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_MailboxTrackingFolders](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_MailboxTrackingFolders"></a> mspcat_packages_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_packages mspcat_packages_MailboxTrackingFolders](mspcat_packages.md#BKMK_mspcat_packages_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packagesolutions_MailboxTrackingFolders"></a> mspcat_packagesolutions_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_packagesolutions mspcat_packagesolutions_MailboxTrackingFolders](mspcat_packagesolutions.md#BKMK_mspcat_packagesolutions_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagesolutions`|
|ReferencedAttribute|`mspcat_packagesolutionsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagesolutions`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_powerappsscanstatus_MailboxTrackingFolders"></a> mspcat_powerappsscanstatus_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_powerappsscanstatus mspcat_powerappsscanstatus_MailboxTrackingFolders](mspcat_powerappsscanstatus.md#BKMK_mspcat_powerappsscanstatus_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_powerappsscanstatus`|
|ReferencedAttribute|`mspcat_powerappsscanstatusid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_powerappsscanstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisher_MailboxTrackingFolders"></a> mspcat_publisher_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_MailboxTrackingFolders](mspcat_publisher.md#BKMK_mspcat_publisher_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisheridentity_MailboxTrackingFolders"></a> mspcat_publisheridentity_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_publisheridentity mspcat_publisheridentity_MailboxTrackingFolders](mspcat_publisheridentity.md#BKMK_mspcat_publisheridentity_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisheridentity`|
|ReferencedAttribute|`mspcat_publisheridentityid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisheridentity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_publisherusers_MailboxTrackingFolders"></a> mspcat_publisherusers_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_publisherusers mspcat_publisherusers_MailboxTrackingFolders](mspcat_publisherusers.md#BKMK_mspcat_publisherusers_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisherusers`|
|ReferencedAttribute|`mspcat_publisherusersid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisherusers`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_rulesetforpowerappschecker_MailboxTrackingFolders"></a> mspcat_rulesetforpowerappschecker_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_rulesetforpowerappschecker mspcat_rulesetforpowerappschecker_MailboxTrackingFolders](mspcat_rulesetforpowerappschecker.md#BKMK_mspcat_rulesetforpowerappschecker_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_rulesetforpowerappschecker`|
|ReferencedAttribute|`mspcat_rulesetforpowerappscheckerid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_rulesetforpowerappschecker`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicy_MailboxTrackingFolders"></a> mspcat_sspolicy_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_sspolicy mspcat_sspolicy_MailboxTrackingFolders](mspcat_sspolicy.md#BKMK_mspcat_sspolicy_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicy`|
|ReferencedAttribute|`mspcat_sspolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_sspolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_sspolicytemplate_MailboxTrackingFolders"></a> mspcat_sspolicytemplate_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_sspolicytemplate mspcat_sspolicytemplate_MailboxTrackingFolders](mspcat_sspolicytemplate.md#BKMK_mspcat_sspolicytemplate_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicytemplate`|
|ReferencedAttribute|`mspcat_sspolicytemplateid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_sspolicytemplate`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_staticanalysispolicy_MailboxTrackingFolders"></a> mspcat_staticanalysispolicy_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_staticanalysispolicy mspcat_staticanalysispolicy_MailboxTrackingFolders](mspcat_staticanalysispolicy.md#BKMK_mspcat_staticanalysispolicy_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_staticanalysispolicy`|
|ReferencedAttribute|`mspcat_staticanalysispolicyid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_staticanalysispolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_MailboxTrackingFolders"></a> mspcat_templates_MailboxTrackingFolders

One-To-Many Relationship: [mspcat_templates mspcat_templates_MailboxTrackingFolders](mspcat_templates.md#BKMK_mspcat_templates_MailboxTrackingFolders)

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
<xref:Microsoft.Dynamics.CRM.mailboxtrackingfolder?displayProperty=fullName>
