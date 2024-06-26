---
title: "Teams chat (chat) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Teams chat (chat) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Teams chat (chat) table/entity reference

For internal use only. Entity which stores association data of Dynamics 365 records with Microsoft Teams chat

> [!NOTE]
> The Power Platform Catalog Manager Teams chat (chat) table extends the [Microsoft Dataverse Teams chat (chat) table](/power-apps/developer/data-platform/reference/entities/chat).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/chat#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_chats](#BKMK_mspcat_applications_chats)
- [mspcat_certificationrequest_chats](#BKMK_mspcat_certificationrequest_chats)
- [mspcat_installhistory_chats](#BKMK_mspcat_installhistory_chats)
- [mspcat_packagelocales_chats](#BKMK_mspcat_packagelocales_chats)
- [mspcat_packages_chats](#BKMK_mspcat_packages_chats)
- [mspcat_publisher_chats](#BKMK_mspcat_publisher_chats)
- [mspcat_templates_chats](#BKMK_mspcat_templates_chats)

### <a name="BKMK_mspcat_applications_chats"></a> mspcat_applications_chats

One-To-Many Relationship: [mspcat_applications mspcat_applications_chats](mspcat_applications.md#BKMK_mspcat_applications_chats)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications_chat`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_certificationrequest_chats"></a> mspcat_certificationrequest_chats

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_chats](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_chats)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest_chat`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_installhistory_chats"></a> mspcat_installhistory_chats

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_chats](mspcat_installhistory.md#BKMK_mspcat_installhistory_chats)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory_chat`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packagelocales_chats"></a> mspcat_packagelocales_chats

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_chats](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_chats)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales_chat`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packages_chats"></a> mspcat_packages_chats

One-To-Many Relationship: [mspcat_packages mspcat_packages_chats](mspcat_packages.md#BKMK_mspcat_packages_chats)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages_chat`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_publisher_chats"></a> mspcat_publisher_chats

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_chats](mspcat_publisher.md#BKMK_mspcat_publisher_chats)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher_chat`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_templates_chats"></a> mspcat_templates_chats

One-To-Many Relationship: [mspcat_templates mspcat_templates_chats](mspcat_templates.md#BKMK_mspcat_templates_chats)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates_chat`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.chat?displayProperty=fullName>
