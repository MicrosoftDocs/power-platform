---
title: "Contact table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Contact table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Contact table/entity reference

Person with whom a business unit has a relationship, such as customer, supplier, and colleague.

> [!NOTE]
> The Power Platform Catalog Manager Contact table extends the [Microsoft Dataverse Contact table](/power-apps/developer/data-platform/reference/entities/contact).


## Messages

The following table lists the messages for the Contact table.
Messages represent operations that can be performed on the table. They may also be events.

| Name <br />Is Event? |Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `adx_SendEmailConfirmationToContact`<br />Event: True |<xref:Microsoft.Dynamics.CRM.adx_SendEmailConfirmationToContact?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `adx_SendEmailTwoFactorCodeToContact`<br />Event: True |<xref:Microsoft.Dynamics.CRM.adx_SendEmailTwoFactorCodeToContact?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `adx_SendPasswordResetToContact`<br />Event: True |<xref:Microsoft.Dynamics.CRM.adx_SendPasswordResetToContact?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|



## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [contact_mspcat_InstallActivities](#BKMK_contact_mspcat_InstallActivities)
- [mspcat_contact_mspcat_applications_EngineeringContact](#BKMK_mspcat_contact_mspcat_applications_EngineeringContact)
- [mspcat_contact_mspcat_applications_SupportContact](#BKMK_mspcat_contact_mspcat_applications_SupportContact)

### <a name="BKMK_contact_mspcat_InstallActivities"></a> contact_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity contact_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_contact_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`contact_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: `CRMActivity.RollupRelatedByParty`<br />ViewId: `00000000-0000-0000-00aa-000010001903`|

### <a name="BKMK_mspcat_contact_mspcat_applications_EngineeringContact"></a> mspcat_contact_mspcat_applications_EngineeringContact

Many-To-One Relationship: [mspcat_applications mspcat_contact_mspcat_applications_EngineeringContact](mspcat_applications.md#BKMK_mspcat_contact_mspcat_applications_EngineeringContact)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`mspcat_engineeringcontact`|
|ReferencedEntityNavigationPropertyName|`mspcat_contact_mspcat_applications_EngineeringContact`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_contact_mspcat_applications_SupportContact"></a> mspcat_contact_mspcat_applications_SupportContact

Many-To-One Relationship: [mspcat_applications mspcat_contact_mspcat_applications_SupportContact](mspcat_applications.md#BKMK_mspcat_contact_mspcat_applications_SupportContact)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`mspcat_supportcontact`|
|ReferencedEntityNavigationPropertyName|`mspcat_contact_mspcat_applications_SupportContact`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|


## Many-to-Many relationships

These relationships are many-to-many. Listed by **SchemaName**.

### <a name="BKMK_mspcat_contact_mspcat_applications"></a> mspcat_contact_mspcat_applications

See [mspcat_applications mspcat_contact_mspcat_applications Many-To-Many Relationship](mspcat_applications.md#BKMK_mspcat_contact_mspcat_applications)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_contact_mspcat_applications`|
|IsCustomizable|True|
|SchemaName|`mspcat_contact_mspcat_applications`|
|IntersectAttribute|`contactid`|
|NavigationPropertyName|`mspcat_contact_mspcat_applications`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.contact?displayProperty=fullName>
