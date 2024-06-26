---
title: "Owner table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Owner table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Owner table/entity reference

Group of undeleted system users and undeleted teams. Owners can be used to control access to specific objects.

> [!NOTE]
> The Power Platform Catalog Manager Owner table extends the [Microsoft Dataverse Owner table](/power-apps/developer/data-platform/reference/entities/owner).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [mspcat_installactivity_owner_ownerid](#BKMK_mspcat_installactivity_owner_ownerid)
- [owner_mspcat_applicationreference](#BKMK_owner_mspcat_applicationreference)
- [owner_mspcat_applications](#BKMK_owner_mspcat_applications)
- [owner_mspcat_catalogitemfile](#BKMK_owner_mspcat_catalogitemfile)
- [owner_mspcat_certificationrejectionappliedpolicy](#BKMK_owner_mspcat_certificationrejectionappliedpolicy)
- [owner_mspcat_certificationrequest](#BKMK_owner_mspcat_certificationrequest)
- [owner_mspcat_crmgeodeploymentstatus](#BKMK_owner_mspcat_crmgeodeploymentstatus)
- [owner_mspcat_installhistory](#BKMK_owner_mspcat_installhistory)
- [owner_mspcat_packagedsolutioncomponents](#BKMK_owner_mspcat_packagedsolutioncomponents)
- [owner_mspcat_packagelocales](#BKMK_owner_mspcat_packagelocales)
- [owner_mspcat_packages](#BKMK_owner_mspcat_packages)
- [owner_mspcat_packagesolutions](#BKMK_owner_mspcat_packagesolutions)
- [owner_mspcat_powerappsscanstatus](#BKMK_owner_mspcat_powerappsscanstatus)
- [owner_mspcat_publisher](#BKMK_owner_mspcat_publisher)
- [owner_mspcat_publisheridentity](#BKMK_owner_mspcat_publisheridentity)
- [owner_mspcat_publisherusers](#BKMK_owner_mspcat_publisherusers)
- [owner_mspcat_templates](#BKMK_owner_mspcat_templates)

### <a name="BKMK_mspcat_installactivity_owner_ownerid"></a> mspcat_installactivity_owner_ownerid

Many-To-One Relationship: [mspcat_installactivity mspcat_installactivity_owner_ownerid](mspcat_installactivity.md#BKMK_mspcat_installactivity_owner_ownerid)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installactivity_owner_ownerid`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_applicationreference"></a> owner_mspcat_applicationreference

Many-To-One Relationship: [mspcat_applicationreference owner_mspcat_applicationreference](mspcat_applicationreference.md#BKMK_owner_mspcat_applicationreference)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applicationreference`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_applicationreference`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_applications"></a> owner_mspcat_applications

Many-To-One Relationship: [mspcat_applications owner_mspcat_applications](mspcat_applications.md#BKMK_owner_mspcat_applications)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_applications`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_catalogitemfile"></a> owner_mspcat_catalogitemfile

Many-To-One Relationship: [mspcat_catalogitemfile owner_mspcat_catalogitemfile](mspcat_catalogitemfile.md#BKMK_owner_mspcat_catalogitemfile)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogitemfile`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_catalogitemfile`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_certificationrejectionappliedpolicy"></a> owner_mspcat_certificationrejectionappliedpolicy

Many-To-One Relationship: [mspcat_certificationrejectionappliedpolicy owner_mspcat_certificationrejectionappliedpolicy](mspcat_certificationrejectionappliedpolicy.md#BKMK_owner_mspcat_certificationrejectionappliedpolicy)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_certificationrejectionappliedpolicy`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_certificationrequest"></a> owner_mspcat_certificationrequest

Many-To-One Relationship: [mspcat_certificationrequest owner_mspcat_certificationrequest](mspcat_certificationrequest.md#BKMK_owner_mspcat_certificationrequest)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_certificationrequest`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_crmgeodeploymentstatus"></a> owner_mspcat_crmgeodeploymentstatus

Many-To-One Relationship: [mspcat_crmgeodeploymentstatus owner_mspcat_crmgeodeploymentstatus](mspcat_crmgeodeploymentstatus.md#BKMK_owner_mspcat_crmgeodeploymentstatus)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_crmgeodeploymentstatus`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_installhistory"></a> owner_mspcat_installhistory

Many-To-One Relationship: [mspcat_installhistory owner_mspcat_installhistory](mspcat_installhistory.md#BKMK_owner_mspcat_installhistory)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_installhistory`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_packagedsolutioncomponents"></a> owner_mspcat_packagedsolutioncomponents

Many-To-One Relationship: [mspcat_packagedsolutioncomponents owner_mspcat_packagedsolutioncomponents](mspcat_packagedsolutioncomponents.md#BKMK_owner_mspcat_packagedsolutioncomponents)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagedsolutioncomponents`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_packagedsolutioncomponents`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_packagelocales"></a> owner_mspcat_packagelocales

Many-To-One Relationship: [mspcat_packagelocales owner_mspcat_packagelocales](mspcat_packagelocales.md#BKMK_owner_mspcat_packagelocales)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagelocales`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_packagelocales`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_packages"></a> owner_mspcat_packages

Many-To-One Relationship: [mspcat_packages owner_mspcat_packages](mspcat_packages.md#BKMK_owner_mspcat_packages)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packages`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_packages`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_packagesolutions"></a> owner_mspcat_packagesolutions

Many-To-One Relationship: [mspcat_packagesolutions owner_mspcat_packagesolutions](mspcat_packagesolutions.md#BKMK_owner_mspcat_packagesolutions)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagesolutions`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_packagesolutions`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_powerappsscanstatus"></a> owner_mspcat_powerappsscanstatus

Many-To-One Relationship: [mspcat_powerappsscanstatus owner_mspcat_powerappsscanstatus](mspcat_powerappsscanstatus.md#BKMK_owner_mspcat_powerappsscanstatus)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_powerappsscanstatus`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_powerappsscanstatus`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_publisher"></a> owner_mspcat_publisher

Many-To-One Relationship: [mspcat_publisher owner_mspcat_publisher](mspcat_publisher.md#BKMK_owner_mspcat_publisher)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisher`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_publisher`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_publisheridentity"></a> owner_mspcat_publisheridentity

Many-To-One Relationship: [mspcat_publisheridentity owner_mspcat_publisheridentity](mspcat_publisheridentity.md#BKMK_owner_mspcat_publisheridentity)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisheridentity`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_publisheridentity`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_publisherusers"></a> owner_mspcat_publisherusers

Many-To-One Relationship: [mspcat_publisherusers owner_mspcat_publisherusers](mspcat_publisherusers.md#BKMK_owner_mspcat_publisherusers)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisherusers`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_publisherusers`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_owner_mspcat_templates"></a> owner_mspcat_templates

Many-To-One Relationship: [mspcat_templates owner_mspcat_templates](mspcat_templates.md#BKMK_owner_mspcat_templates)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_templates`|
|ReferencingAttribute|`ownerid`|
|ReferencedEntityNavigationPropertyName|`owner_mspcat_templates`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   

