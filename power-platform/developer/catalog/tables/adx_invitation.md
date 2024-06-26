---
title: "Invitation (adx_invitation) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Invitation (adx_invitation) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Invitation (adx_invitation) table/entity reference

Send invitations to existing contacts or email addresses and assign them to web roles upon redemption.

> [!NOTE]
> The Power Platform Catalog Manager Invitation (adx_invitation) table extends the [Microsoft Dataverse Invitation (adx_invitation) table](/power-apps/developer/data-platform/reference/entities/adx_invitation).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

### <a name="BKMK_adx_invitation_mspcat_InstallActivities"></a> adx_invitation_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity adx_invitation_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_adx_invitation_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`adx_invitation_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.adx_invitation?displayProperty=fullName>
