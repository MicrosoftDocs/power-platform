---
title: "Business Unit (BusinessUnit) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Business Unit (BusinessUnit) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Business Unit (BusinessUnit) table/entity reference

Business, division, or department in the Microsoft Dynamics 365 database.

> [!NOTE]
> The Power Platform Catalog Manager Business Unit (BusinessUnit) table extends the [Microsoft Dataverse Business Unit (BusinessUnit) table](/power-apps/developer/data-platform/reference/entities/businessunit).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [business_unit_mspcat_applicationreference](#BKMK_business_unit_mspcat_applicationreference)
- [business_unit_mspcat_applications](#BKMK_business_unit_mspcat_applications)
- [business_unit_mspcat_catalogitemfile](#BKMK_business_unit_mspcat_catalogitemfile)
- [business_unit_mspcat_certificationrejectionappliedpolicy](#BKMK_business_unit_mspcat_certificationrejectionappliedpolicy)
- [business_unit_mspcat_certificationrequest](#BKMK_business_unit_mspcat_certificationrequest)
- [business_unit_mspcat_crmgeodeploymentstatus](#BKMK_business_unit_mspcat_crmgeodeploymentstatus)
- [business_unit_mspcat_installhistory](#BKMK_business_unit_mspcat_installhistory)
- [business_unit_mspcat_packagedsolutioncomponents](#BKMK_business_unit_mspcat_packagedsolutioncomponents)
- [business_unit_mspcat_packagelocales](#BKMK_business_unit_mspcat_packagelocales)
- [business_unit_mspcat_packages](#BKMK_business_unit_mspcat_packages)
- [business_unit_mspcat_packagesolutions](#BKMK_business_unit_mspcat_packagesolutions)
- [business_unit_mspcat_powerappsscanstatus](#BKMK_business_unit_mspcat_powerappsscanstatus)
- [business_unit_mspcat_publisher](#BKMK_business_unit_mspcat_publisher)
- [business_unit_mspcat_publisheridentity](#BKMK_business_unit_mspcat_publisheridentity)
- [business_unit_mspcat_publisherusers](#BKMK_business_unit_mspcat_publisherusers)
- [business_unit_mspcat_templates](#BKMK_business_unit_mspcat_templates)
- [mspcat_installactivity_businessunit_owningbusinessunit](#BKMK_mspcat_installactivity_businessunit_owningbusinessunit)

### <a name="BKMK_business_unit_mspcat_applicationreference"></a> business_unit_mspcat_applicationreference

Many-To-One Relationship: [mspcat_applicationreference business_unit_mspcat_applicationreference](mspcat_applicationreference.md#BKMK_business_unit_mspcat_applicationreference)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applicationreference`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_applicationreference`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_applications"></a> business_unit_mspcat_applications

Many-To-One Relationship: [mspcat_applications business_unit_mspcat_applications](mspcat_applications.md#BKMK_business_unit_mspcat_applications)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_applications`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_catalogitemfile"></a> business_unit_mspcat_catalogitemfile

Many-To-One Relationship: [mspcat_catalogitemfile business_unit_mspcat_catalogitemfile](mspcat_catalogitemfile.md#BKMK_business_unit_mspcat_catalogitemfile)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogitemfile`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_catalogitemfile`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_certificationrejectionappliedpolicy"></a> business_unit_mspcat_certificationrejectionappliedpolicy

Many-To-One Relationship: [mspcat_certificationrejectionappliedpolicy business_unit_mspcat_certificationrejectionappliedpolicy](mspcat_certificationrejectionappliedpolicy.md#BKMK_business_unit_mspcat_certificationrejectionappliedpolicy)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_certificationrejectionappliedpolicy`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_certificationrequest"></a> business_unit_mspcat_certificationrequest

Many-To-One Relationship: [mspcat_certificationrequest business_unit_mspcat_certificationrequest](mspcat_certificationrequest.md#BKMK_business_unit_mspcat_certificationrequest)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_certificationrequest`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_crmgeodeploymentstatus"></a> business_unit_mspcat_crmgeodeploymentstatus

Many-To-One Relationship: [mspcat_crmgeodeploymentstatus business_unit_mspcat_crmgeodeploymentstatus](mspcat_crmgeodeploymentstatus.md#BKMK_business_unit_mspcat_crmgeodeploymentstatus)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_crmgeodeploymentstatus`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_installhistory"></a> business_unit_mspcat_installhistory

Many-To-One Relationship: [mspcat_installhistory business_unit_mspcat_installhistory](mspcat_installhistory.md#BKMK_business_unit_mspcat_installhistory)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_installhistory`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_packagedsolutioncomponents"></a> business_unit_mspcat_packagedsolutioncomponents

Many-To-One Relationship: [mspcat_packagedsolutioncomponents business_unit_mspcat_packagedsolutioncomponents](mspcat_packagedsolutioncomponents.md#BKMK_business_unit_mspcat_packagedsolutioncomponents)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagedsolutioncomponents`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_packagedsolutioncomponents`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_packagelocales"></a> business_unit_mspcat_packagelocales

Many-To-One Relationship: [mspcat_packagelocales business_unit_mspcat_packagelocales](mspcat_packagelocales.md#BKMK_business_unit_mspcat_packagelocales)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagelocales`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_packagelocales`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_packages"></a> business_unit_mspcat_packages

Many-To-One Relationship: [mspcat_packages business_unit_mspcat_packages](mspcat_packages.md#BKMK_business_unit_mspcat_packages)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packages`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_packages`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_packagesolutions"></a> business_unit_mspcat_packagesolutions

Many-To-One Relationship: [mspcat_packagesolutions business_unit_mspcat_packagesolutions](mspcat_packagesolutions.md#BKMK_business_unit_mspcat_packagesolutions)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagesolutions`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_packagesolutions`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_powerappsscanstatus"></a> business_unit_mspcat_powerappsscanstatus

Many-To-One Relationship: [mspcat_powerappsscanstatus business_unit_mspcat_powerappsscanstatus](mspcat_powerappsscanstatus.md#BKMK_business_unit_mspcat_powerappsscanstatus)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_powerappsscanstatus`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_powerappsscanstatus`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_publisher"></a> business_unit_mspcat_publisher

Many-To-One Relationship: [mspcat_publisher business_unit_mspcat_publisher](mspcat_publisher.md#BKMK_business_unit_mspcat_publisher)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisher`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_publisher`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_publisheridentity"></a> business_unit_mspcat_publisheridentity

Many-To-One Relationship: [mspcat_publisheridentity business_unit_mspcat_publisheridentity](mspcat_publisheridentity.md#BKMK_business_unit_mspcat_publisheridentity)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisheridentity`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_publisheridentity`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_publisherusers"></a> business_unit_mspcat_publisherusers

Many-To-One Relationship: [mspcat_publisherusers business_unit_mspcat_publisherusers](mspcat_publisherusers.md#BKMK_business_unit_mspcat_publisherusers)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisherusers`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_publisherusers`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_business_unit_mspcat_templates"></a> business_unit_mspcat_templates

Many-To-One Relationship: [mspcat_templates business_unit_mspcat_templates](mspcat_templates.md#BKMK_business_unit_mspcat_templates)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_templates`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`business_unit_mspcat_templates`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installactivity_businessunit_owningbusinessunit"></a> mspcat_installactivity_businessunit_owningbusinessunit

Many-To-One Relationship: [mspcat_installactivity mspcat_installactivity_businessunit_owningbusinessunit](mspcat_installactivity.md#BKMK_mspcat_installactivity_businessunit_owningbusinessunit)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencedEntityNavigationPropertyName|`mspcat_installactivity_businessunit_owningbusinessunit`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.businessunit?displayProperty=fullName>
