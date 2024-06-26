---
title: "Team table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Team table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Team table/entity reference

Collection of system users that routinely collaborate. Teams can be used to simplify record sharing and provide team members with common access to organization data when team members belong to different Business Units.

> [!NOTE]
> The Power Platform Catalog Manager Team table extends the [Microsoft Dataverse Team table](/power-apps/developer/data-platform/reference/entities/team).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [mspcat_installactivity_team_owningteam](#BKMK_mspcat_installactivity_team_owningteam)
- [mspcat_mspcat_publisherusers_team_team](#BKMK_mspcat_mspcat_publisherusers_team_team)
- [team_mspcat_applicationreference](#BKMK_team_mspcat_applicationreference)
- [team_mspcat_applications](#BKMK_team_mspcat_applications)
- [team_mspcat_catalogitemfile](#BKMK_team_mspcat_catalogitemfile)
- [team_mspcat_certificationrejectionappliedpolicy](#BKMK_team_mspcat_certificationrejectionappliedpolicy)
- [team_mspcat_certificationrequest](#BKMK_team_mspcat_certificationrequest)
- [team_mspcat_crmgeodeploymentstatus](#BKMK_team_mspcat_crmgeodeploymentstatus)
- [team_mspcat_installhistory](#BKMK_team_mspcat_installhistory)
- [team_mspcat_packagedsolutioncomponents](#BKMK_team_mspcat_packagedsolutioncomponents)
- [team_mspcat_packagelocales](#BKMK_team_mspcat_packagelocales)
- [team_mspcat_packages](#BKMK_team_mspcat_packages)
- [team_mspcat_packagesolutions](#BKMK_team_mspcat_packagesolutions)
- [team_mspcat_powerappsscanstatus](#BKMK_team_mspcat_powerappsscanstatus)
- [team_mspcat_publisher](#BKMK_team_mspcat_publisher)
- [team_mspcat_publisheridentity](#BKMK_team_mspcat_publisheridentity)
- [team_mspcat_publisherusers](#BKMK_team_mspcat_publisherusers)
- [team_mspcat_templates](#BKMK_team_mspcat_templates)

### <a name="BKMK_mspcat_installactivity_team_owningteam"></a> mspcat_installactivity_team_owningteam

Many-To-One Relationship: [mspcat_installactivity mspcat_installactivity_team_owningteam](mspcat_installactivity.md#BKMK_mspcat_installactivity_team_owningteam)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`mspcat_installactivity_team_owningteam`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_publisherusers_team_team"></a> mspcat_mspcat_publisherusers_team_team

Many-To-One Relationship: [mspcat_publisherusers mspcat_mspcat_publisherusers_team_team](mspcat_publisherusers.md#BKMK_mspcat_mspcat_publisherusers_team_team)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisherusers`|
|ReferencingAttribute|`mspcat_team`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_publisherusers_team_team`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_applicationreference"></a> team_mspcat_applicationreference

Many-To-One Relationship: [mspcat_applicationreference team_mspcat_applicationreference](mspcat_applicationreference.md#BKMK_team_mspcat_applicationreference)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applicationreference`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_applicationreference`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_applications"></a> team_mspcat_applications

Many-To-One Relationship: [mspcat_applications team_mspcat_applications](mspcat_applications.md#BKMK_team_mspcat_applications)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_applications`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_catalogitemfile"></a> team_mspcat_catalogitemfile

Many-To-One Relationship: [mspcat_catalogitemfile team_mspcat_catalogitemfile](mspcat_catalogitemfile.md#BKMK_team_mspcat_catalogitemfile)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogitemfile`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_catalogitemfile`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_certificationrejectionappliedpolicy"></a> team_mspcat_certificationrejectionappliedpolicy

Many-To-One Relationship: [mspcat_certificationrejectionappliedpolicy team_mspcat_certificationrejectionappliedpolicy](mspcat_certificationrejectionappliedpolicy.md#BKMK_team_mspcat_certificationrejectionappliedpolicy)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_certificationrejectionappliedpolicy`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_certificationrequest"></a> team_mspcat_certificationrequest

Many-To-One Relationship: [mspcat_certificationrequest team_mspcat_certificationrequest](mspcat_certificationrequest.md#BKMK_team_mspcat_certificationrequest)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_certificationrequest`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_crmgeodeploymentstatus"></a> team_mspcat_crmgeodeploymentstatus

Many-To-One Relationship: [mspcat_crmgeodeploymentstatus team_mspcat_crmgeodeploymentstatus](mspcat_crmgeodeploymentstatus.md#BKMK_team_mspcat_crmgeodeploymentstatus)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_crmgeodeploymentstatus`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_installhistory"></a> team_mspcat_installhistory

Many-To-One Relationship: [mspcat_installhistory team_mspcat_installhistory](mspcat_installhistory.md#BKMK_team_mspcat_installhistory)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_installhistory`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_packagedsolutioncomponents"></a> team_mspcat_packagedsolutioncomponents

Many-To-One Relationship: [mspcat_packagedsolutioncomponents team_mspcat_packagedsolutioncomponents](mspcat_packagedsolutioncomponents.md#BKMK_team_mspcat_packagedsolutioncomponents)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagedsolutioncomponents`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_packagedsolutioncomponents`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_packagelocales"></a> team_mspcat_packagelocales

Many-To-One Relationship: [mspcat_packagelocales team_mspcat_packagelocales](mspcat_packagelocales.md#BKMK_team_mspcat_packagelocales)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagelocales`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_packagelocales`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_packages"></a> team_mspcat_packages

Many-To-One Relationship: [mspcat_packages team_mspcat_packages](mspcat_packages.md#BKMK_team_mspcat_packages)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packages`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_packages`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_packagesolutions"></a> team_mspcat_packagesolutions

Many-To-One Relationship: [mspcat_packagesolutions team_mspcat_packagesolutions](mspcat_packagesolutions.md#BKMK_team_mspcat_packagesolutions)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagesolutions`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_packagesolutions`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_powerappsscanstatus"></a> team_mspcat_powerappsscanstatus

Many-To-One Relationship: [mspcat_powerappsscanstatus team_mspcat_powerappsscanstatus](mspcat_powerappsscanstatus.md#BKMK_team_mspcat_powerappsscanstatus)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_powerappsscanstatus`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_powerappsscanstatus`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_publisher"></a> team_mspcat_publisher

Many-To-One Relationship: [mspcat_publisher team_mspcat_publisher](mspcat_publisher.md#BKMK_team_mspcat_publisher)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisher`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_publisher`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_publisheridentity"></a> team_mspcat_publisheridentity

Many-To-One Relationship: [mspcat_publisheridentity team_mspcat_publisheridentity](mspcat_publisheridentity.md#BKMK_team_mspcat_publisheridentity)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisheridentity`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_publisheridentity`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_publisherusers"></a> team_mspcat_publisherusers

Many-To-One Relationship: [mspcat_publisherusers team_mspcat_publisherusers](mspcat_publisherusers.md#BKMK_team_mspcat_publisherusers)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisherusers`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_publisherusers`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_team_mspcat_templates"></a> team_mspcat_templates

Many-To-One Relationship: [mspcat_templates team_mspcat_templates](mspcat_templates.md#BKMK_team_mspcat_templates)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_templates`|
|ReferencingAttribute|`owningteam`|
|ReferencedEntityNavigationPropertyName|`team_mspcat_templates`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.team?displayProperty=fullName>
