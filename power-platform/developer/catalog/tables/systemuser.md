---
title: "User (SystemUser) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the User (SystemUser) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# User (SystemUser) table/entity reference

Person with access to the Microsoft CRM system and who owns objects in the Microsoft CRM database.

> [!NOTE]
> The Power Platform Catalog Manager User (SystemUser) table extends the [Microsoft Dataverse User (SystemUser) table](/power-apps/developer/data-platform/reference/entities/systemuser).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [lk_mspcat_applicationreference_createdby](#BKMK_lk_mspcat_applicationreference_createdby)
- [lk_mspcat_applicationreference_createdonbehalfby](#BKMK_lk_mspcat_applicationreference_createdonbehalfby)
- [lk_mspcat_applicationreference_modifiedby](#BKMK_lk_mspcat_applicationreference_modifiedby)
- [lk_mspcat_applicationreference_modifiedonbehalfby](#BKMK_lk_mspcat_applicationreference_modifiedonbehalfby)
- [lk_mspcat_applications_createdby](#BKMK_lk_mspcat_applications_createdby)
- [lk_mspcat_applications_createdonbehalfby](#BKMK_lk_mspcat_applications_createdonbehalfby)
- [lk_mspcat_applications_modifiedby](#BKMK_lk_mspcat_applications_modifiedby)
- [lk_mspcat_applications_modifiedonbehalfby](#BKMK_lk_mspcat_applications_modifiedonbehalfby)
- [lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdby](#BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdby)
- [lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdonbehalfby](#BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdonbehalfby)
- [lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedby](#BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedby)
- [lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedonbehalfby](#BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedonbehalfby)
- [lk_mspcat_catalogdescription_createdby](#BKMK_lk_mspcat_catalogdescription_createdby)
- [lk_mspcat_catalogdescription_createdonbehalfby](#BKMK_lk_mspcat_catalogdescription_createdonbehalfby)
- [lk_mspcat_catalogdescription_modifiedby](#BKMK_lk_mspcat_catalogdescription_modifiedby)
- [lk_mspcat_catalogdescription_modifiedonbehalfby](#BKMK_lk_mspcat_catalogdescription_modifiedonbehalfby)
- [lk_mspcat_catalogitemfile_createdby](#BKMK_lk_mspcat_catalogitemfile_createdby)
- [lk_mspcat_catalogitemfile_createdonbehalfby](#BKMK_lk_mspcat_catalogitemfile_createdonbehalfby)
- [lk_mspcat_catalogitemfile_modifiedby](#BKMK_lk_mspcat_catalogitemfile_modifiedby)
- [lk_mspcat_catalogitemfile_modifiedonbehalfby](#BKMK_lk_mspcat_catalogitemfile_modifiedonbehalfby)
- [lk_mspcat_certificationrejectionappliedpolicy_createdby](#BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdby)
- [lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby](#BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby)
- [lk_mspcat_certificationrejectionappliedpolicy_modifiedby](#BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedby)
- [lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby](#BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby)
- [lk_mspcat_certificationrequest_createdby](#BKMK_lk_mspcat_certificationrequest_createdby)
- [lk_mspcat_certificationrequest_createdonbehalfby](#BKMK_lk_mspcat_certificationrequest_createdonbehalfby)
- [lk_mspcat_certificationrequest_modifiedby](#BKMK_lk_mspcat_certificationrequest_modifiedby)
- [lk_mspcat_certificationrequest_modifiedonbehalfby](#BKMK_lk_mspcat_certificationrequest_modifiedonbehalfby)
- [lk_mspcat_configurationforpowerapps_createdby](#BKMK_lk_mspcat_configurationforpowerapps_createdby)
- [lk_mspcat_configurationforpowerapps_createdonbehalfby](#BKMK_lk_mspcat_configurationforpowerapps_createdonbehalfby)
- [lk_mspcat_configurationforpowerapps_modifiedby](#BKMK_lk_mspcat_configurationforpowerapps_modifiedby)
- [lk_mspcat_configurationforpowerapps_modifiedonbehalfby](#BKMK_lk_mspcat_configurationforpowerapps_modifiedonbehalfby)
- [lk_mspcat_crmgeo_createdby](#BKMK_lk_mspcat_crmgeo_createdby)
- [lk_mspcat_crmgeo_createdonbehalfby](#BKMK_lk_mspcat_crmgeo_createdonbehalfby)
- [lk_mspcat_crmgeo_modifiedby](#BKMK_lk_mspcat_crmgeo_modifiedby)
- [lk_mspcat_crmgeo_modifiedonbehalfby](#BKMK_lk_mspcat_crmgeo_modifiedonbehalfby)
- [lk_mspcat_crmgeodeploymentstatus_createdby](#BKMK_lk_mspcat_crmgeodeploymentstatus_createdby)
- [lk_mspcat_crmgeodeploymentstatus_createdonbehalfby](#BKMK_lk_mspcat_crmgeodeploymentstatus_createdonbehalfby)
- [lk_mspcat_crmgeodeploymentstatus_modifiedby](#BKMK_lk_mspcat_crmgeodeploymentstatus_modifiedby)
- [lk_mspcat_crmgeodeploymentstatus_modifiedonbehalfby](#BKMK_lk_mspcat_crmgeodeploymentstatus_modifiedonbehalfby)
- [lk_mspcat_installhistory_createdby](#BKMK_lk_mspcat_installhistory_createdby)
- [lk_mspcat_installhistory_createdonbehalfby](#BKMK_lk_mspcat_installhistory_createdonbehalfby)
- [lk_mspcat_installhistory_modifiedby](#BKMK_lk_mspcat_installhistory_modifiedby)
- [lk_mspcat_installhistory_modifiedonbehalfby](#BKMK_lk_mspcat_installhistory_modifiedonbehalfby)
- [lk_mspcat_packagedsolutioncomponents_createdby](#BKMK_lk_mspcat_packagedsolutioncomponents_createdby)
- [lk_mspcat_packagedsolutioncomponents_createdonbehalfby](#BKMK_lk_mspcat_packagedsolutioncomponents_createdonbehalfby)
- [lk_mspcat_packagedsolutioncomponents_modifiedby](#BKMK_lk_mspcat_packagedsolutioncomponents_modifiedby)
- [lk_mspcat_packagedsolutioncomponents_modifiedonbehalfby](#BKMK_lk_mspcat_packagedsolutioncomponents_modifiedonbehalfby)
- [lk_mspcat_packagelocales_createdby](#BKMK_lk_mspcat_packagelocales_createdby)
- [lk_mspcat_packagelocales_createdonbehalfby](#BKMK_lk_mspcat_packagelocales_createdonbehalfby)
- [lk_mspcat_packagelocales_modifiedby](#BKMK_lk_mspcat_packagelocales_modifiedby)
- [lk_mspcat_packagelocales_modifiedonbehalfby](#BKMK_lk_mspcat_packagelocales_modifiedonbehalfby)
- [lk_mspcat_packages_createdby](#BKMK_lk_mspcat_packages_createdby)
- [lk_mspcat_packages_createdonbehalfby](#BKMK_lk_mspcat_packages_createdonbehalfby)
- [lk_mspcat_packages_modifiedby](#BKMK_lk_mspcat_packages_modifiedby)
- [lk_mspcat_packages_modifiedonbehalfby](#BKMK_lk_mspcat_packages_modifiedonbehalfby)
- [lk_mspcat_packagesolutions_createdby](#BKMK_lk_mspcat_packagesolutions_createdby)
- [lk_mspcat_packagesolutions_createdonbehalfby](#BKMK_lk_mspcat_packagesolutions_createdonbehalfby)
- [lk_mspcat_packagesolutions_modifiedby](#BKMK_lk_mspcat_packagesolutions_modifiedby)
- [lk_mspcat_packagesolutions_modifiedonbehalfby](#BKMK_lk_mspcat_packagesolutions_modifiedonbehalfby)
- [lk_mspcat_powerappsscanstatus_createdby](#BKMK_lk_mspcat_powerappsscanstatus_createdby)
- [lk_mspcat_powerappsscanstatus_createdonbehalfby](#BKMK_lk_mspcat_powerappsscanstatus_createdonbehalfby)
- [lk_mspcat_powerappsscanstatus_modifiedby](#BKMK_lk_mspcat_powerappsscanstatus_modifiedby)
- [lk_mspcat_powerappsscanstatus_modifiedonbehalfby](#BKMK_lk_mspcat_powerappsscanstatus_modifiedonbehalfby)
- [lk_mspcat_publisher_createdby](#BKMK_lk_mspcat_publisher_createdby)
- [lk_mspcat_publisher_createdonbehalfby](#BKMK_lk_mspcat_publisher_createdonbehalfby)
- [lk_mspcat_publisher_modifiedby](#BKMK_lk_mspcat_publisher_modifiedby)
- [lk_mspcat_publisher_modifiedonbehalfby](#BKMK_lk_mspcat_publisher_modifiedonbehalfby)
- [lk_mspcat_publisheridentity_createdby](#BKMK_lk_mspcat_publisheridentity_createdby)
- [lk_mspcat_publisheridentity_createdonbehalfby](#BKMK_lk_mspcat_publisheridentity_createdonbehalfby)
- [lk_mspcat_publisheridentity_modifiedby](#BKMK_lk_mspcat_publisheridentity_modifiedby)
- [lk_mspcat_publisheridentity_modifiedonbehalfby](#BKMK_lk_mspcat_publisheridentity_modifiedonbehalfby)
- [lk_mspcat_publisherusers_createdby](#BKMK_lk_mspcat_publisherusers_createdby)
- [lk_mspcat_publisherusers_createdonbehalfby](#BKMK_lk_mspcat_publisherusers_createdonbehalfby)
- [lk_mspcat_publisherusers_modifiedby](#BKMK_lk_mspcat_publisherusers_modifiedby)
- [lk_mspcat_publisherusers_modifiedonbehalfby](#BKMK_lk_mspcat_publisherusers_modifiedonbehalfby)
- [lk_mspcat_rulesetforpowerappschecker_createdby](#BKMK_lk_mspcat_rulesetforpowerappschecker_createdby)
- [lk_mspcat_rulesetforpowerappschecker_createdonbehalfby](#BKMK_lk_mspcat_rulesetforpowerappschecker_createdonbehalfby)
- [lk_mspcat_rulesetforpowerappschecker_modifiedby](#BKMK_lk_mspcat_rulesetforpowerappschecker_modifiedby)
- [lk_mspcat_rulesetforpowerappschecker_modifiedonbehalfby](#BKMK_lk_mspcat_rulesetforpowerappschecker_modifiedonbehalfby)
- [lk_mspcat_sspolicy_createdby](#BKMK_lk_mspcat_sspolicy_createdby)
- [lk_mspcat_sspolicy_createdonbehalfby](#BKMK_lk_mspcat_sspolicy_createdonbehalfby)
- [lk_mspcat_sspolicy_modifiedby](#BKMK_lk_mspcat_sspolicy_modifiedby)
- [lk_mspcat_sspolicy_modifiedonbehalfby](#BKMK_lk_mspcat_sspolicy_modifiedonbehalfby)
- [lk_mspcat_sspolicytemplate_createdby](#BKMK_lk_mspcat_sspolicytemplate_createdby)
- [lk_mspcat_sspolicytemplate_createdonbehalfby](#BKMK_lk_mspcat_sspolicytemplate_createdonbehalfby)
- [lk_mspcat_sspolicytemplate_modifiedby](#BKMK_lk_mspcat_sspolicytemplate_modifiedby)
- [lk_mspcat_sspolicytemplate_modifiedonbehalfby](#BKMK_lk_mspcat_sspolicytemplate_modifiedonbehalfby)
- [lk_mspcat_staticanalysispolicy_createdby](#BKMK_lk_mspcat_staticanalysispolicy_createdby)
- [lk_mspcat_staticanalysispolicy_createdonbehalfby](#BKMK_lk_mspcat_staticanalysispolicy_createdonbehalfby)
- [lk_mspcat_staticanalysispolicy_modifiedby](#BKMK_lk_mspcat_staticanalysispolicy_modifiedby)
- [lk_mspcat_staticanalysispolicy_modifiedonbehalfby](#BKMK_lk_mspcat_staticanalysispolicy_modifiedonbehalfby)
- [lk_mspcat_templates_createdby](#BKMK_lk_mspcat_templates_createdby)
- [lk_mspcat_templates_createdonbehalfby](#BKMK_lk_mspcat_templates_createdonbehalfby)
- [lk_mspcat_templates_modifiedby](#BKMK_lk_mspcat_templates_modifiedby)
- [lk_mspcat_templates_modifiedonbehalfby](#BKMK_lk_mspcat_templates_modifiedonbehalfby)
- [mspcat_installactivity_systemuser_createdby](#BKMK_mspcat_installactivity_systemuser_createdby)
- [mspcat_installactivity_systemuser_createdonbehalfby](#BKMK_mspcat_installactivity_systemuser_createdonbehalfby)
- [mspcat_installactivity_systemuser_modifiedby](#BKMK_mspcat_installactivity_systemuser_modifiedby)
- [mspcat_installactivity_systemuser_modifiedonbehalfby](#BKMK_mspcat_installactivity_systemuser_modifiedonbehalfby)
- [mspcat_installactivity_systemuser_owninguser](#BKMK_mspcat_installactivity_systemuser_owninguser)
- [mspcat_mspcat_installhistory_RequestingUser_syst](#BKMK_mspcat_mspcat_installhistory_RequestingUser_syst)
- [mspcat_mspcat_publisherusers_User_systemuser](#BKMK_mspcat_mspcat_publisherusers_User_systemuser)
- [user_mspcat_applicationreference](#BKMK_user_mspcat_applicationreference)
- [user_mspcat_applications](#BKMK_user_mspcat_applications)
- [user_mspcat_catalogitemfile](#BKMK_user_mspcat_catalogitemfile)
- [user_mspcat_certificationrejectionappliedpolicy](#BKMK_user_mspcat_certificationrejectionappliedpolicy)
- [user_mspcat_certificationrequest](#BKMK_user_mspcat_certificationrequest)
- [user_mspcat_crmgeodeploymentstatus](#BKMK_user_mspcat_crmgeodeploymentstatus)
- [user_mspcat_installhistory](#BKMK_user_mspcat_installhistory)
- [user_mspcat_packagedsolutioncomponents](#BKMK_user_mspcat_packagedsolutioncomponents)
- [user_mspcat_packagelocales](#BKMK_user_mspcat_packagelocales)
- [user_mspcat_packages](#BKMK_user_mspcat_packages)
- [user_mspcat_packagesolutions](#BKMK_user_mspcat_packagesolutions)
- [user_mspcat_powerappsscanstatus](#BKMK_user_mspcat_powerappsscanstatus)
- [user_mspcat_publisher](#BKMK_user_mspcat_publisher)
- [user_mspcat_publisheridentity](#BKMK_user_mspcat_publisheridentity)
- [user_mspcat_publisherusers](#BKMK_user_mspcat_publisherusers)
- [user_mspcat_templates](#BKMK_user_mspcat_templates)

### <a name="BKMK_lk_mspcat_applicationreference_createdby"></a> lk_mspcat_applicationreference_createdby

Many-To-One Relationship: [mspcat_applicationreference lk_mspcat_applicationreference_createdby](mspcat_applicationreference.md#BKMK_lk_mspcat_applicationreference_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applicationreference`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_applicationreference_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_applicationreference_createdonbehalfby"></a> lk_mspcat_applicationreference_createdonbehalfby

Many-To-One Relationship: [mspcat_applicationreference lk_mspcat_applicationreference_createdonbehalfby](mspcat_applicationreference.md#BKMK_lk_mspcat_applicationreference_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applicationreference`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_applicationreference_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_applicationreference_modifiedby"></a> lk_mspcat_applicationreference_modifiedby

Many-To-One Relationship: [mspcat_applicationreference lk_mspcat_applicationreference_modifiedby](mspcat_applicationreference.md#BKMK_lk_mspcat_applicationreference_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applicationreference`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_applicationreference_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_applicationreference_modifiedonbehalfby"></a> lk_mspcat_applicationreference_modifiedonbehalfby

Many-To-One Relationship: [mspcat_applicationreference lk_mspcat_applicationreference_modifiedonbehalfby](mspcat_applicationreference.md#BKMK_lk_mspcat_applicationreference_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applicationreference`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_applicationreference_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_applications_createdby"></a> lk_mspcat_applications_createdby

Many-To-One Relationship: [mspcat_applications lk_mspcat_applications_createdby](mspcat_applications.md#BKMK_lk_mspcat_applications_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_applications_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_applications_createdonbehalfby"></a> lk_mspcat_applications_createdonbehalfby

Many-To-One Relationship: [mspcat_applications lk_mspcat_applications_createdonbehalfby](mspcat_applications.md#BKMK_lk_mspcat_applications_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_applications_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_applications_modifiedby"></a> lk_mspcat_applications_modifiedby

Many-To-One Relationship: [mspcat_applications lk_mspcat_applications_modifiedby](mspcat_applications.md#BKMK_lk_mspcat_applications_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_applications_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_applications_modifiedonbehalfby"></a> lk_mspcat_applications_modifiedonbehalfby

Many-To-One Relationship: [mspcat_applications lk_mspcat_applications_modifiedonbehalfby](mspcat_applications.md#BKMK_lk_mspcat_applications_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_applications_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdby"></a> lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdby

Many-To-One Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdby](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdonbehalfby"></a> lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdonbehalfby

Many-To-One Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdonbehalfby](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedby"></a> lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedby

Many-To-One Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedby](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedonbehalfby"></a> lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedonbehalfby

Many-To-One Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedonbehalfby](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_catalogdescription_createdby"></a> lk_mspcat_catalogdescription_createdby

Many-To-One Relationship: [mspcat_catalogdescription lk_mspcat_catalogdescription_createdby](mspcat_catalogdescription.md#BKMK_lk_mspcat_catalogdescription_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogdescription`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_catalogdescription_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_catalogdescription_createdonbehalfby"></a> lk_mspcat_catalogdescription_createdonbehalfby

Many-To-One Relationship: [mspcat_catalogdescription lk_mspcat_catalogdescription_createdonbehalfby](mspcat_catalogdescription.md#BKMK_lk_mspcat_catalogdescription_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogdescription`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_catalogdescription_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_catalogdescription_modifiedby"></a> lk_mspcat_catalogdescription_modifiedby

Many-To-One Relationship: [mspcat_catalogdescription lk_mspcat_catalogdescription_modifiedby](mspcat_catalogdescription.md#BKMK_lk_mspcat_catalogdescription_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogdescription`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_catalogdescription_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_catalogdescription_modifiedonbehalfby"></a> lk_mspcat_catalogdescription_modifiedonbehalfby

Many-To-One Relationship: [mspcat_catalogdescription lk_mspcat_catalogdescription_modifiedonbehalfby](mspcat_catalogdescription.md#BKMK_lk_mspcat_catalogdescription_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogdescription`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_catalogdescription_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_catalogitemfile_createdby"></a> lk_mspcat_catalogitemfile_createdby

Many-To-One Relationship: [mspcat_catalogitemfile lk_mspcat_catalogitemfile_createdby](mspcat_catalogitemfile.md#BKMK_lk_mspcat_catalogitemfile_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogitemfile`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_catalogitemfile_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_catalogitemfile_createdonbehalfby"></a> lk_mspcat_catalogitemfile_createdonbehalfby

Many-To-One Relationship: [mspcat_catalogitemfile lk_mspcat_catalogitemfile_createdonbehalfby](mspcat_catalogitemfile.md#BKMK_lk_mspcat_catalogitemfile_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogitemfile`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_catalogitemfile_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_catalogitemfile_modifiedby"></a> lk_mspcat_catalogitemfile_modifiedby

Many-To-One Relationship: [mspcat_catalogitemfile lk_mspcat_catalogitemfile_modifiedby](mspcat_catalogitemfile.md#BKMK_lk_mspcat_catalogitemfile_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogitemfile`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_catalogitemfile_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_catalogitemfile_modifiedonbehalfby"></a> lk_mspcat_catalogitemfile_modifiedonbehalfby

Many-To-One Relationship: [mspcat_catalogitemfile lk_mspcat_catalogitemfile_modifiedonbehalfby](mspcat_catalogitemfile.md#BKMK_lk_mspcat_catalogitemfile_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogitemfile`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_catalogitemfile_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdby"></a> lk_mspcat_certificationrejectionappliedpolicy_createdby

Many-To-One Relationship: [mspcat_certificationrejectionappliedpolicy lk_mspcat_certificationrejectionappliedpolicy_createdby](mspcat_certificationrejectionappliedpolicy.md#BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_certificationrejectionappliedpolicy_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby"></a> lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby

Many-To-One Relationship: [mspcat_certificationrejectionappliedpolicy lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby](mspcat_certificationrejectionappliedpolicy.md#BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedby"></a> lk_mspcat_certificationrejectionappliedpolicy_modifiedby

Many-To-One Relationship: [mspcat_certificationrejectionappliedpolicy lk_mspcat_certificationrejectionappliedpolicy_modifiedby](mspcat_certificationrejectionappliedpolicy.md#BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_certificationrejectionappliedpolicy_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby"></a> lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby

Many-To-One Relationship: [mspcat_certificationrejectionappliedpolicy lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby](mspcat_certificationrejectionappliedpolicy.md#BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_certificationrequest_createdby"></a> lk_mspcat_certificationrequest_createdby

Many-To-One Relationship: [mspcat_certificationrequest lk_mspcat_certificationrequest_createdby](mspcat_certificationrequest.md#BKMK_lk_mspcat_certificationrequest_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_certificationrequest_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_certificationrequest_createdonbehalfby"></a> lk_mspcat_certificationrequest_createdonbehalfby

Many-To-One Relationship: [mspcat_certificationrequest lk_mspcat_certificationrequest_createdonbehalfby](mspcat_certificationrequest.md#BKMK_lk_mspcat_certificationrequest_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_certificationrequest_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_certificationrequest_modifiedby"></a> lk_mspcat_certificationrequest_modifiedby

Many-To-One Relationship: [mspcat_certificationrequest lk_mspcat_certificationrequest_modifiedby](mspcat_certificationrequest.md#BKMK_lk_mspcat_certificationrequest_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_certificationrequest_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_certificationrequest_modifiedonbehalfby"></a> lk_mspcat_certificationrequest_modifiedonbehalfby

Many-To-One Relationship: [mspcat_certificationrequest lk_mspcat_certificationrequest_modifiedonbehalfby](mspcat_certificationrequest.md#BKMK_lk_mspcat_certificationrequest_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_certificationrequest_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_configurationforpowerapps_createdby"></a> lk_mspcat_configurationforpowerapps_createdby

Many-To-One Relationship: [mspcat_configurationforpowerapps lk_mspcat_configurationforpowerapps_createdby](mspcat_configurationforpowerapps.md#BKMK_lk_mspcat_configurationforpowerapps_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_configurationforpowerapps`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_configurationforpowerapps_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_configurationforpowerapps_createdonbehalfby"></a> lk_mspcat_configurationforpowerapps_createdonbehalfby

Many-To-One Relationship: [mspcat_configurationforpowerapps lk_mspcat_configurationforpowerapps_createdonbehalfby](mspcat_configurationforpowerapps.md#BKMK_lk_mspcat_configurationforpowerapps_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_configurationforpowerapps`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_configurationforpowerapps_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_configurationforpowerapps_modifiedby"></a> lk_mspcat_configurationforpowerapps_modifiedby

Many-To-One Relationship: [mspcat_configurationforpowerapps lk_mspcat_configurationforpowerapps_modifiedby](mspcat_configurationforpowerapps.md#BKMK_lk_mspcat_configurationforpowerapps_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_configurationforpowerapps`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_configurationforpowerapps_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_configurationforpowerapps_modifiedonbehalfby"></a> lk_mspcat_configurationforpowerapps_modifiedonbehalfby

Many-To-One Relationship: [mspcat_configurationforpowerapps lk_mspcat_configurationforpowerapps_modifiedonbehalfby](mspcat_configurationforpowerapps.md#BKMK_lk_mspcat_configurationforpowerapps_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_configurationforpowerapps`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_configurationforpowerapps_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_crmgeo_createdby"></a> lk_mspcat_crmgeo_createdby

Many-To-One Relationship: [mspcat_crmgeo lk_mspcat_crmgeo_createdby](mspcat_crmgeo.md#BKMK_lk_mspcat_crmgeo_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeo`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_crmgeo_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_crmgeo_createdonbehalfby"></a> lk_mspcat_crmgeo_createdonbehalfby

Many-To-One Relationship: [mspcat_crmgeo lk_mspcat_crmgeo_createdonbehalfby](mspcat_crmgeo.md#BKMK_lk_mspcat_crmgeo_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeo`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_crmgeo_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_crmgeo_modifiedby"></a> lk_mspcat_crmgeo_modifiedby

Many-To-One Relationship: [mspcat_crmgeo lk_mspcat_crmgeo_modifiedby](mspcat_crmgeo.md#BKMK_lk_mspcat_crmgeo_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeo`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_crmgeo_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_crmgeo_modifiedonbehalfby"></a> lk_mspcat_crmgeo_modifiedonbehalfby

Many-To-One Relationship: [mspcat_crmgeo lk_mspcat_crmgeo_modifiedonbehalfby](mspcat_crmgeo.md#BKMK_lk_mspcat_crmgeo_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeo`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_crmgeo_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_crmgeodeploymentstatus_createdby"></a> lk_mspcat_crmgeodeploymentstatus_createdby

Many-To-One Relationship: [mspcat_crmgeodeploymentstatus lk_mspcat_crmgeodeploymentstatus_createdby](mspcat_crmgeodeploymentstatus.md#BKMK_lk_mspcat_crmgeodeploymentstatus_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_crmgeodeploymentstatus_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_crmgeodeploymentstatus_createdonbehalfby"></a> lk_mspcat_crmgeodeploymentstatus_createdonbehalfby

Many-To-One Relationship: [mspcat_crmgeodeploymentstatus lk_mspcat_crmgeodeploymentstatus_createdonbehalfby](mspcat_crmgeodeploymentstatus.md#BKMK_lk_mspcat_crmgeodeploymentstatus_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_crmgeodeploymentstatus_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_crmgeodeploymentstatus_modifiedby"></a> lk_mspcat_crmgeodeploymentstatus_modifiedby

Many-To-One Relationship: [mspcat_crmgeodeploymentstatus lk_mspcat_crmgeodeploymentstatus_modifiedby](mspcat_crmgeodeploymentstatus.md#BKMK_lk_mspcat_crmgeodeploymentstatus_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_crmgeodeploymentstatus_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_crmgeodeploymentstatus_modifiedonbehalfby"></a> lk_mspcat_crmgeodeploymentstatus_modifiedonbehalfby

Many-To-One Relationship: [mspcat_crmgeodeploymentstatus lk_mspcat_crmgeodeploymentstatus_modifiedonbehalfby](mspcat_crmgeodeploymentstatus.md#BKMK_lk_mspcat_crmgeodeploymentstatus_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_crmgeodeploymentstatus_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_installhistory_createdby"></a> lk_mspcat_installhistory_createdby

Many-To-One Relationship: [mspcat_installhistory lk_mspcat_installhistory_createdby](mspcat_installhistory.md#BKMK_lk_mspcat_installhistory_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_installhistory_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_installhistory_createdonbehalfby"></a> lk_mspcat_installhistory_createdonbehalfby

Many-To-One Relationship: [mspcat_installhistory lk_mspcat_installhistory_createdonbehalfby](mspcat_installhistory.md#BKMK_lk_mspcat_installhistory_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_installhistory_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_installhistory_modifiedby"></a> lk_mspcat_installhistory_modifiedby

Many-To-One Relationship: [mspcat_installhistory lk_mspcat_installhistory_modifiedby](mspcat_installhistory.md#BKMK_lk_mspcat_installhistory_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_installhistory_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_installhistory_modifiedonbehalfby"></a> lk_mspcat_installhistory_modifiedonbehalfby

Many-To-One Relationship: [mspcat_installhistory lk_mspcat_installhistory_modifiedonbehalfby](mspcat_installhistory.md#BKMK_lk_mspcat_installhistory_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_installhistory_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagedsolutioncomponents_createdby"></a> lk_mspcat_packagedsolutioncomponents_createdby

Many-To-One Relationship: [mspcat_packagedsolutioncomponents lk_mspcat_packagedsolutioncomponents_createdby](mspcat_packagedsolutioncomponents.md#BKMK_lk_mspcat_packagedsolutioncomponents_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagedsolutioncomponents`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagedsolutioncomponents_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagedsolutioncomponents_createdonbehalfby"></a> lk_mspcat_packagedsolutioncomponents_createdonbehalfby

Many-To-One Relationship: [mspcat_packagedsolutioncomponents lk_mspcat_packagedsolutioncomponents_createdonbehalfby](mspcat_packagedsolutioncomponents.md#BKMK_lk_mspcat_packagedsolutioncomponents_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagedsolutioncomponents`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagedsolutioncomponents_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagedsolutioncomponents_modifiedby"></a> lk_mspcat_packagedsolutioncomponents_modifiedby

Many-To-One Relationship: [mspcat_packagedsolutioncomponents lk_mspcat_packagedsolutioncomponents_modifiedby](mspcat_packagedsolutioncomponents.md#BKMK_lk_mspcat_packagedsolutioncomponents_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagedsolutioncomponents`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagedsolutioncomponents_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagedsolutioncomponents_modifiedonbehalfby"></a> lk_mspcat_packagedsolutioncomponents_modifiedonbehalfby

Many-To-One Relationship: [mspcat_packagedsolutioncomponents lk_mspcat_packagedsolutioncomponents_modifiedonbehalfby](mspcat_packagedsolutioncomponents.md#BKMK_lk_mspcat_packagedsolutioncomponents_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagedsolutioncomponents`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagedsolutioncomponents_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagelocales_createdby"></a> lk_mspcat_packagelocales_createdby

Many-To-One Relationship: [mspcat_packagelocales lk_mspcat_packagelocales_createdby](mspcat_packagelocales.md#BKMK_lk_mspcat_packagelocales_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagelocales`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagelocales_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagelocales_createdonbehalfby"></a> lk_mspcat_packagelocales_createdonbehalfby

Many-To-One Relationship: [mspcat_packagelocales lk_mspcat_packagelocales_createdonbehalfby](mspcat_packagelocales.md#BKMK_lk_mspcat_packagelocales_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagelocales`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagelocales_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagelocales_modifiedby"></a> lk_mspcat_packagelocales_modifiedby

Many-To-One Relationship: [mspcat_packagelocales lk_mspcat_packagelocales_modifiedby](mspcat_packagelocales.md#BKMK_lk_mspcat_packagelocales_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagelocales`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagelocales_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagelocales_modifiedonbehalfby"></a> lk_mspcat_packagelocales_modifiedonbehalfby

Many-To-One Relationship: [mspcat_packagelocales lk_mspcat_packagelocales_modifiedonbehalfby](mspcat_packagelocales.md#BKMK_lk_mspcat_packagelocales_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagelocales`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagelocales_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packages_createdby"></a> lk_mspcat_packages_createdby

Many-To-One Relationship: [mspcat_packages lk_mspcat_packages_createdby](mspcat_packages.md#BKMK_lk_mspcat_packages_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packages`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packages_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packages_createdonbehalfby"></a> lk_mspcat_packages_createdonbehalfby

Many-To-One Relationship: [mspcat_packages lk_mspcat_packages_createdonbehalfby](mspcat_packages.md#BKMK_lk_mspcat_packages_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packages`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packages_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packages_modifiedby"></a> lk_mspcat_packages_modifiedby

Many-To-One Relationship: [mspcat_packages lk_mspcat_packages_modifiedby](mspcat_packages.md#BKMK_lk_mspcat_packages_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packages`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packages_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packages_modifiedonbehalfby"></a> lk_mspcat_packages_modifiedonbehalfby

Many-To-One Relationship: [mspcat_packages lk_mspcat_packages_modifiedonbehalfby](mspcat_packages.md#BKMK_lk_mspcat_packages_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packages`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packages_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagesolutions_createdby"></a> lk_mspcat_packagesolutions_createdby

Many-To-One Relationship: [mspcat_packagesolutions lk_mspcat_packagesolutions_createdby](mspcat_packagesolutions.md#BKMK_lk_mspcat_packagesolutions_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagesolutions`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagesolutions_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagesolutions_createdonbehalfby"></a> lk_mspcat_packagesolutions_createdonbehalfby

Many-To-One Relationship: [mspcat_packagesolutions lk_mspcat_packagesolutions_createdonbehalfby](mspcat_packagesolutions.md#BKMK_lk_mspcat_packagesolutions_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagesolutions`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagesolutions_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagesolutions_modifiedby"></a> lk_mspcat_packagesolutions_modifiedby

Many-To-One Relationship: [mspcat_packagesolutions lk_mspcat_packagesolutions_modifiedby](mspcat_packagesolutions.md#BKMK_lk_mspcat_packagesolutions_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagesolutions`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagesolutions_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_packagesolutions_modifiedonbehalfby"></a> lk_mspcat_packagesolutions_modifiedonbehalfby

Many-To-One Relationship: [mspcat_packagesolutions lk_mspcat_packagesolutions_modifiedonbehalfby](mspcat_packagesolutions.md#BKMK_lk_mspcat_packagesolutions_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagesolutions`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_packagesolutions_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_powerappsscanstatus_createdby"></a> lk_mspcat_powerappsscanstatus_createdby

Many-To-One Relationship: [mspcat_powerappsscanstatus lk_mspcat_powerappsscanstatus_createdby](mspcat_powerappsscanstatus.md#BKMK_lk_mspcat_powerappsscanstatus_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_powerappsscanstatus`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_powerappsscanstatus_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_powerappsscanstatus_createdonbehalfby"></a> lk_mspcat_powerappsscanstatus_createdonbehalfby

Many-To-One Relationship: [mspcat_powerappsscanstatus lk_mspcat_powerappsscanstatus_createdonbehalfby](mspcat_powerappsscanstatus.md#BKMK_lk_mspcat_powerappsscanstatus_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_powerappsscanstatus`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_powerappsscanstatus_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_powerappsscanstatus_modifiedby"></a> lk_mspcat_powerappsscanstatus_modifiedby

Many-To-One Relationship: [mspcat_powerappsscanstatus lk_mspcat_powerappsscanstatus_modifiedby](mspcat_powerappsscanstatus.md#BKMK_lk_mspcat_powerappsscanstatus_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_powerappsscanstatus`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_powerappsscanstatus_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_powerappsscanstatus_modifiedonbehalfby"></a> lk_mspcat_powerappsscanstatus_modifiedonbehalfby

Many-To-One Relationship: [mspcat_powerappsscanstatus lk_mspcat_powerappsscanstatus_modifiedonbehalfby](mspcat_powerappsscanstatus.md#BKMK_lk_mspcat_powerappsscanstatus_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_powerappsscanstatus`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_powerappsscanstatus_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisher_createdby"></a> lk_mspcat_publisher_createdby

Many-To-One Relationship: [mspcat_publisher lk_mspcat_publisher_createdby](mspcat_publisher.md#BKMK_lk_mspcat_publisher_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisher`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisher_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisher_createdonbehalfby"></a> lk_mspcat_publisher_createdonbehalfby

Many-To-One Relationship: [mspcat_publisher lk_mspcat_publisher_createdonbehalfby](mspcat_publisher.md#BKMK_lk_mspcat_publisher_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisher`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisher_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisher_modifiedby"></a> lk_mspcat_publisher_modifiedby

Many-To-One Relationship: [mspcat_publisher lk_mspcat_publisher_modifiedby](mspcat_publisher.md#BKMK_lk_mspcat_publisher_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisher`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisher_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisher_modifiedonbehalfby"></a> lk_mspcat_publisher_modifiedonbehalfby

Many-To-One Relationship: [mspcat_publisher lk_mspcat_publisher_modifiedonbehalfby](mspcat_publisher.md#BKMK_lk_mspcat_publisher_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisher`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisher_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisheridentity_createdby"></a> lk_mspcat_publisheridentity_createdby

Many-To-One Relationship: [mspcat_publisheridentity lk_mspcat_publisheridentity_createdby](mspcat_publisheridentity.md#BKMK_lk_mspcat_publisheridentity_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisheridentity`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisheridentity_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisheridentity_createdonbehalfby"></a> lk_mspcat_publisheridentity_createdonbehalfby

Many-To-One Relationship: [mspcat_publisheridentity lk_mspcat_publisheridentity_createdonbehalfby](mspcat_publisheridentity.md#BKMK_lk_mspcat_publisheridentity_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisheridentity`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisheridentity_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisheridentity_modifiedby"></a> lk_mspcat_publisheridentity_modifiedby

Many-To-One Relationship: [mspcat_publisheridentity lk_mspcat_publisheridentity_modifiedby](mspcat_publisheridentity.md#BKMK_lk_mspcat_publisheridentity_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisheridentity`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisheridentity_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisheridentity_modifiedonbehalfby"></a> lk_mspcat_publisheridentity_modifiedonbehalfby

Many-To-One Relationship: [mspcat_publisheridentity lk_mspcat_publisheridentity_modifiedonbehalfby](mspcat_publisheridentity.md#BKMK_lk_mspcat_publisheridentity_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisheridentity`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisheridentity_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisherusers_createdby"></a> lk_mspcat_publisherusers_createdby

Many-To-One Relationship: [mspcat_publisherusers lk_mspcat_publisherusers_createdby](mspcat_publisherusers.md#BKMK_lk_mspcat_publisherusers_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisherusers`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisherusers_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisherusers_createdonbehalfby"></a> lk_mspcat_publisherusers_createdonbehalfby

Many-To-One Relationship: [mspcat_publisherusers lk_mspcat_publisherusers_createdonbehalfby](mspcat_publisherusers.md#BKMK_lk_mspcat_publisherusers_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisherusers`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisherusers_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisherusers_modifiedby"></a> lk_mspcat_publisherusers_modifiedby

Many-To-One Relationship: [mspcat_publisherusers lk_mspcat_publisherusers_modifiedby](mspcat_publisherusers.md#BKMK_lk_mspcat_publisherusers_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisherusers`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisherusers_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_publisherusers_modifiedonbehalfby"></a> lk_mspcat_publisherusers_modifiedonbehalfby

Many-To-One Relationship: [mspcat_publisherusers lk_mspcat_publisherusers_modifiedonbehalfby](mspcat_publisherusers.md#BKMK_lk_mspcat_publisherusers_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisherusers`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_publisherusers_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_rulesetforpowerappschecker_createdby"></a> lk_mspcat_rulesetforpowerappschecker_createdby

Many-To-One Relationship: [mspcat_rulesetforpowerappschecker lk_mspcat_rulesetforpowerappschecker_createdby](mspcat_rulesetforpowerappschecker.md#BKMK_lk_mspcat_rulesetforpowerappschecker_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_rulesetforpowerappschecker`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_rulesetforpowerappschecker_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_rulesetforpowerappschecker_createdonbehalfby"></a> lk_mspcat_rulesetforpowerappschecker_createdonbehalfby

Many-To-One Relationship: [mspcat_rulesetforpowerappschecker lk_mspcat_rulesetforpowerappschecker_createdonbehalfby](mspcat_rulesetforpowerappschecker.md#BKMK_lk_mspcat_rulesetforpowerappschecker_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_rulesetforpowerappschecker`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_rulesetforpowerappschecker_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_rulesetforpowerappschecker_modifiedby"></a> lk_mspcat_rulesetforpowerappschecker_modifiedby

Many-To-One Relationship: [mspcat_rulesetforpowerappschecker lk_mspcat_rulesetforpowerappschecker_modifiedby](mspcat_rulesetforpowerappschecker.md#BKMK_lk_mspcat_rulesetforpowerappschecker_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_rulesetforpowerappschecker`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_rulesetforpowerappschecker_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_rulesetforpowerappschecker_modifiedonbehalfby"></a> lk_mspcat_rulesetforpowerappschecker_modifiedonbehalfby

Many-To-One Relationship: [mspcat_rulesetforpowerappschecker lk_mspcat_rulesetforpowerappschecker_modifiedonbehalfby](mspcat_rulesetforpowerappschecker.md#BKMK_lk_mspcat_rulesetforpowerappschecker_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_rulesetforpowerappschecker`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_rulesetforpowerappschecker_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_sspolicy_createdby"></a> lk_mspcat_sspolicy_createdby

Many-To-One Relationship: [mspcat_sspolicy lk_mspcat_sspolicy_createdby](mspcat_sspolicy.md#BKMK_lk_mspcat_sspolicy_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_sspolicy`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_sspolicy_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_sspolicy_createdonbehalfby"></a> lk_mspcat_sspolicy_createdonbehalfby

Many-To-One Relationship: [mspcat_sspolicy lk_mspcat_sspolicy_createdonbehalfby](mspcat_sspolicy.md#BKMK_lk_mspcat_sspolicy_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_sspolicy`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_sspolicy_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_sspolicy_modifiedby"></a> lk_mspcat_sspolicy_modifiedby

Many-To-One Relationship: [mspcat_sspolicy lk_mspcat_sspolicy_modifiedby](mspcat_sspolicy.md#BKMK_lk_mspcat_sspolicy_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_sspolicy`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_sspolicy_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_sspolicy_modifiedonbehalfby"></a> lk_mspcat_sspolicy_modifiedonbehalfby

Many-To-One Relationship: [mspcat_sspolicy lk_mspcat_sspolicy_modifiedonbehalfby](mspcat_sspolicy.md#BKMK_lk_mspcat_sspolicy_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_sspolicy`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_sspolicy_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_sspolicytemplate_createdby"></a> lk_mspcat_sspolicytemplate_createdby

Many-To-One Relationship: [mspcat_sspolicytemplate lk_mspcat_sspolicytemplate_createdby](mspcat_sspolicytemplate.md#BKMK_lk_mspcat_sspolicytemplate_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_sspolicytemplate`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_sspolicytemplate_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_sspolicytemplate_createdonbehalfby"></a> lk_mspcat_sspolicytemplate_createdonbehalfby

Many-To-One Relationship: [mspcat_sspolicytemplate lk_mspcat_sspolicytemplate_createdonbehalfby](mspcat_sspolicytemplate.md#BKMK_lk_mspcat_sspolicytemplate_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_sspolicytemplate`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_sspolicytemplate_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_sspolicytemplate_modifiedby"></a> lk_mspcat_sspolicytemplate_modifiedby

Many-To-One Relationship: [mspcat_sspolicytemplate lk_mspcat_sspolicytemplate_modifiedby](mspcat_sspolicytemplate.md#BKMK_lk_mspcat_sspolicytemplate_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_sspolicytemplate`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_sspolicytemplate_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_sspolicytemplate_modifiedonbehalfby"></a> lk_mspcat_sspolicytemplate_modifiedonbehalfby

Many-To-One Relationship: [mspcat_sspolicytemplate lk_mspcat_sspolicytemplate_modifiedonbehalfby](mspcat_sspolicytemplate.md#BKMK_lk_mspcat_sspolicytemplate_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_sspolicytemplate`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_sspolicytemplate_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_staticanalysispolicy_createdby"></a> lk_mspcat_staticanalysispolicy_createdby

Many-To-One Relationship: [mspcat_staticanalysispolicy lk_mspcat_staticanalysispolicy_createdby](mspcat_staticanalysispolicy.md#BKMK_lk_mspcat_staticanalysispolicy_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_staticanalysispolicy`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_staticanalysispolicy_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_staticanalysispolicy_createdonbehalfby"></a> lk_mspcat_staticanalysispolicy_createdonbehalfby

Many-To-One Relationship: [mspcat_staticanalysispolicy lk_mspcat_staticanalysispolicy_createdonbehalfby](mspcat_staticanalysispolicy.md#BKMK_lk_mspcat_staticanalysispolicy_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_staticanalysispolicy`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_staticanalysispolicy_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_staticanalysispolicy_modifiedby"></a> lk_mspcat_staticanalysispolicy_modifiedby

Many-To-One Relationship: [mspcat_staticanalysispolicy lk_mspcat_staticanalysispolicy_modifiedby](mspcat_staticanalysispolicy.md#BKMK_lk_mspcat_staticanalysispolicy_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_staticanalysispolicy`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_staticanalysispolicy_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_staticanalysispolicy_modifiedonbehalfby"></a> lk_mspcat_staticanalysispolicy_modifiedonbehalfby

Many-To-One Relationship: [mspcat_staticanalysispolicy lk_mspcat_staticanalysispolicy_modifiedonbehalfby](mspcat_staticanalysispolicy.md#BKMK_lk_mspcat_staticanalysispolicy_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_staticanalysispolicy`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_staticanalysispolicy_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_templates_createdby"></a> lk_mspcat_templates_createdby

Many-To-One Relationship: [mspcat_templates lk_mspcat_templates_createdby](mspcat_templates.md#BKMK_lk_mspcat_templates_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_templates`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_templates_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_templates_createdonbehalfby"></a> lk_mspcat_templates_createdonbehalfby

Many-To-One Relationship: [mspcat_templates lk_mspcat_templates_createdonbehalfby](mspcat_templates.md#BKMK_lk_mspcat_templates_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_templates`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_templates_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_templates_modifiedby"></a> lk_mspcat_templates_modifiedby

Many-To-One Relationship: [mspcat_templates lk_mspcat_templates_modifiedby](mspcat_templates.md#BKMK_lk_mspcat_templates_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_templates`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_templates_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_lk_mspcat_templates_modifiedonbehalfby"></a> lk_mspcat_templates_modifiedonbehalfby

Many-To-One Relationship: [mspcat_templates lk_mspcat_templates_modifiedonbehalfby](mspcat_templates.md#BKMK_lk_mspcat_templates_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_templates`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_templates_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installactivity_systemuser_createdby"></a> mspcat_installactivity_systemuser_createdby

Many-To-One Relationship: [mspcat_installactivity mspcat_installactivity_systemuser_createdby](mspcat_installactivity.md#BKMK_mspcat_installactivity_systemuser_createdby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`createdby`|
|ReferencedEntityNavigationPropertyName|`mspcat_installactivity_systemuser_createdby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installactivity_systemuser_createdonbehalfby"></a> mspcat_installactivity_systemuser_createdonbehalfby

Many-To-One Relationship: [mspcat_installactivity mspcat_installactivity_systemuser_createdonbehalfby](mspcat_installactivity.md#BKMK_mspcat_installactivity_systemuser_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencedEntityNavigationPropertyName|`mspcat_installactivity_systemuser_createdonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installactivity_systemuser_modifiedby"></a> mspcat_installactivity_systemuser_modifiedby

Many-To-One Relationship: [mspcat_installactivity mspcat_installactivity_systemuser_modifiedby](mspcat_installactivity.md#BKMK_mspcat_installactivity_systemuser_modifiedby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`modifiedby`|
|ReferencedEntityNavigationPropertyName|`mspcat_installactivity_systemuser_modifiedby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installactivity_systemuser_modifiedonbehalfby"></a> mspcat_installactivity_systemuser_modifiedonbehalfby

Many-To-One Relationship: [mspcat_installactivity mspcat_installactivity_systemuser_modifiedonbehalfby](mspcat_installactivity.md#BKMK_mspcat_installactivity_systemuser_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencedEntityNavigationPropertyName|`mspcat_installactivity_systemuser_modifiedonbehalfby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installactivity_systemuser_owninguser"></a> mspcat_installactivity_systemuser_owninguser

Many-To-One Relationship: [mspcat_installactivity mspcat_installactivity_systemuser_owninguser](mspcat_installactivity.md#BKMK_mspcat_installactivity_systemuser_owninguser)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`mspcat_installactivity_systemuser_owninguser`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_installhistory_RequestingUser_syst"></a> mspcat_mspcat_installhistory_RequestingUser_syst

Many-To-One Relationship: [mspcat_installhistory mspcat_mspcat_installhistory_RequestingUser_syst](mspcat_installhistory.md#BKMK_mspcat_mspcat_installhistory_RequestingUser_syst)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`mspcat_requestinguser`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_installhistory_RequestingUser_syst`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_publisherusers_User_systemuser"></a> mspcat_mspcat_publisherusers_User_systemuser

Many-To-One Relationship: [mspcat_publisherusers mspcat_mspcat_publisherusers_User_systemuser](mspcat_publisherusers.md#BKMK_mspcat_mspcat_publisherusers_User_systemuser)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisherusers`|
|ReferencingAttribute|`mspcat_user`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_publisherusers_User_systemuser`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_applicationreference"></a> user_mspcat_applicationreference

Many-To-One Relationship: [mspcat_applicationreference user_mspcat_applicationreference](mspcat_applicationreference.md#BKMK_user_mspcat_applicationreference)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applicationreference`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_applicationreference`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_applications"></a> user_mspcat_applications

Many-To-One Relationship: [mspcat_applications user_mspcat_applications](mspcat_applications.md#BKMK_user_mspcat_applications)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_applications`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_catalogitemfile"></a> user_mspcat_catalogitemfile

Many-To-One Relationship: [mspcat_catalogitemfile user_mspcat_catalogitemfile](mspcat_catalogitemfile.md#BKMK_user_mspcat_catalogitemfile)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogitemfile`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_catalogitemfile`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_certificationrejectionappliedpolicy"></a> user_mspcat_certificationrejectionappliedpolicy

Many-To-One Relationship: [mspcat_certificationrejectionappliedpolicy user_mspcat_certificationrejectionappliedpolicy](mspcat_certificationrejectionappliedpolicy.md#BKMK_user_mspcat_certificationrejectionappliedpolicy)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_certificationrejectionappliedpolicy`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_certificationrequest"></a> user_mspcat_certificationrequest

Many-To-One Relationship: [mspcat_certificationrequest user_mspcat_certificationrequest](mspcat_certificationrequest.md#BKMK_user_mspcat_certificationrequest)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_certificationrequest`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_crmgeodeploymentstatus"></a> user_mspcat_crmgeodeploymentstatus

Many-To-One Relationship: [mspcat_crmgeodeploymentstatus user_mspcat_crmgeodeploymentstatus](mspcat_crmgeodeploymentstatus.md#BKMK_user_mspcat_crmgeodeploymentstatus)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_crmgeodeploymentstatus`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_installhistory"></a> user_mspcat_installhistory

Many-To-One Relationship: [mspcat_installhistory user_mspcat_installhistory](mspcat_installhistory.md#BKMK_user_mspcat_installhistory)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_installhistory`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_packagedsolutioncomponents"></a> user_mspcat_packagedsolutioncomponents

Many-To-One Relationship: [mspcat_packagedsolutioncomponents user_mspcat_packagedsolutioncomponents](mspcat_packagedsolutioncomponents.md#BKMK_user_mspcat_packagedsolutioncomponents)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagedsolutioncomponents`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_packagedsolutioncomponents`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_packagelocales"></a> user_mspcat_packagelocales

Many-To-One Relationship: [mspcat_packagelocales user_mspcat_packagelocales](mspcat_packagelocales.md#BKMK_user_mspcat_packagelocales)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagelocales`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_packagelocales`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_packages"></a> user_mspcat_packages

Many-To-One Relationship: [mspcat_packages user_mspcat_packages](mspcat_packages.md#BKMK_user_mspcat_packages)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packages`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_packages`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_packagesolutions"></a> user_mspcat_packagesolutions

Many-To-One Relationship: [mspcat_packagesolutions user_mspcat_packagesolutions](mspcat_packagesolutions.md#BKMK_user_mspcat_packagesolutions)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagesolutions`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_packagesolutions`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_powerappsscanstatus"></a> user_mspcat_powerappsscanstatus

Many-To-One Relationship: [mspcat_powerappsscanstatus user_mspcat_powerappsscanstatus](mspcat_powerappsscanstatus.md#BKMK_user_mspcat_powerappsscanstatus)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_powerappsscanstatus`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_powerappsscanstatus`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_publisher"></a> user_mspcat_publisher

Many-To-One Relationship: [mspcat_publisher user_mspcat_publisher](mspcat_publisher.md#BKMK_user_mspcat_publisher)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisher`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_publisher`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_publisheridentity"></a> user_mspcat_publisheridentity

Many-To-One Relationship: [mspcat_publisheridentity user_mspcat_publisheridentity](mspcat_publisheridentity.md#BKMK_user_mspcat_publisheridentity)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisheridentity`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_publisheridentity`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_publisherusers"></a> user_mspcat_publisherusers

Many-To-One Relationship: [mspcat_publisherusers user_mspcat_publisherusers](mspcat_publisherusers.md#BKMK_user_mspcat_publisherusers)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisherusers`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_publisherusers`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_user_mspcat_templates"></a> user_mspcat_templates

Many-To-One Relationship: [mspcat_templates user_mspcat_templates](mspcat_templates.md#BKMK_user_mspcat_templates)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_templates`|
|ReferencingAttribute|`owninguser`|
|ReferencedEntityNavigationPropertyName|`user_mspcat_templates`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.systemuser?displayProperty=fullName>
