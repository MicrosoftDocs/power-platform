---
title: "Invite Redemption (adx_inviteredemption) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Invite Redemption (adx_inviteredemption) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Invite Redemption (adx_inviteredemption) table/entity reference

Holds information about the redemption of an invite.

> [!NOTE]
> The Power Platform Catalog Manager Invite Redemption (adx_inviteredemption) table extends the [Microsoft Dataverse Invite Redemption (adx_inviteredemption) table](/power-apps/developer/data-platform/reference/entities/adx_inviteredemption).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/adx_inviteredemption#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_adx_inviteredemptions](#BKMK_mspcat_applications_adx_inviteredemptions)
- [mspcat_certificationrequest_adx_inviteredemptions](#BKMK_mspcat_certificationrequest_adx_inviteredemptions)
- [mspcat_installhistory_adx_inviteredemptions](#BKMK_mspcat_installhistory_adx_inviteredemptions)
- [mspcat_packagelocales_adx_inviteredemptions](#BKMK_mspcat_packagelocales_adx_inviteredemptions)
- [mspcat_packages_adx_inviteredemptions](#BKMK_mspcat_packages_adx_inviteredemptions)
- [mspcat_publisher_adx_inviteredemptions](#BKMK_mspcat_publisher_adx_inviteredemptions)
- [mspcat_templates_adx_inviteredemptions](#BKMK_mspcat_templates_adx_inviteredemptions)

### <a name="BKMK_mspcat_applications_adx_inviteredemptions"></a> mspcat_applications_adx_inviteredemptions

One-To-Many Relationship: [mspcat_applications mspcat_applications_adx_inviteredemptions](mspcat_applications.md#BKMK_mspcat_applications_adx_inviteredemptions)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications_adx_inviteredemption`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_certificationrequest_adx_inviteredemptions"></a> mspcat_certificationrequest_adx_inviteredemptions

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_adx_inviteredemptions](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_adx_inviteredemptions)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest_adx_inviteredemption`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_installhistory_adx_inviteredemptions"></a> mspcat_installhistory_adx_inviteredemptions

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_adx_inviteredemptions](mspcat_installhistory.md#BKMK_mspcat_installhistory_adx_inviteredemptions)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory_adx_inviteredemption`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packagelocales_adx_inviteredemptions"></a> mspcat_packagelocales_adx_inviteredemptions

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_adx_inviteredemptions](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_adx_inviteredemptions)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales_adx_inviteredemption`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packages_adx_inviteredemptions"></a> mspcat_packages_adx_inviteredemptions

One-To-Many Relationship: [mspcat_packages mspcat_packages_adx_inviteredemptions](mspcat_packages.md#BKMK_mspcat_packages_adx_inviteredemptions)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages_adx_inviteredemption`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_publisher_adx_inviteredemptions"></a> mspcat_publisher_adx_inviteredemptions

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_adx_inviteredemptions](mspcat_publisher.md#BKMK_mspcat_publisher_adx_inviteredemptions)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher_adx_inviteredemption`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_templates_adx_inviteredemptions"></a> mspcat_templates_adx_inviteredemptions

One-To-Many Relationship: [mspcat_templates mspcat_templates_adx_inviteredemptions](mspcat_templates.md#BKMK_mspcat_templates_adx_inviteredemptions)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates_adx_inviteredemption`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.adx_inviteredemption?displayProperty=fullName>
