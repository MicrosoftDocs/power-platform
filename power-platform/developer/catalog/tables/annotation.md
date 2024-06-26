---
title: "Note (Annotation) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Note (Annotation) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Note (Annotation) table/entity reference

Note that is attached to one or more objects, including other notes.

> [!NOTE]
> The Power Platform Catalog Manager Note (Annotation) table extends the [Microsoft Dataverse Note (Annotation) table](/power-apps/developer/data-platform/reference/entities/annotation).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_ObjectId"></a> ObjectId

Changes from [ObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/annotation#BKMK_ObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_Annotations](#BKMK_mspcat_applications_Annotations)
- [mspcat_certificationrequest_Annotations](#BKMK_mspcat_certificationrequest_Annotations)
- [mspcat_crmgeo_Annotations](#BKMK_mspcat_crmgeo_Annotations)
- [mspcat_crmgeodeploymentstatus_Annotations](#BKMK_mspcat_crmgeodeploymentstatus_Annotations)
- [mspcat_installactivity_Annotations](#BKMK_mspcat_installactivity_Annotations)
- [mspcat_packagelocales_Annotations](#BKMK_mspcat_packagelocales_Annotations)
- [mspcat_packages_Annotations](#BKMK_mspcat_packages_Annotations)
- [mspcat_publisher_Annotations](#BKMK_mspcat_publisher_Annotations)
- [mspcat_publisheridentity_Annotations](#BKMK_mspcat_publisheridentity_Annotations)
- [mspcat_sspolicy_Annotations](#BKMK_mspcat_sspolicy_Annotations)
- [mspcat_templates_Annotations](#BKMK_mspcat_templates_Annotations)

### <a name="BKMK_mspcat_applications_Annotations"></a> mspcat_applications_Annotations

One-To-Many Relationship: [mspcat_applications mspcat_applications_Annotations](mspcat_applications.md#BKMK_mspcat_applications_Annotations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_applications`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_certificationrequest_Annotations"></a> mspcat_certificationrequest_Annotations

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_Annotations](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_Annotations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_crmgeo_Annotations"></a> mspcat_crmgeo_Annotations

One-To-Many Relationship: [mspcat_crmgeo mspcat_crmgeo_Annotations](mspcat_crmgeo.md#BKMK_mspcat_crmgeo_Annotations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeo`|
|ReferencedAttribute|`mspcat_crmgeoid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_crmgeo`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_crmgeodeploymentstatus_Annotations"></a> mspcat_crmgeodeploymentstatus_Annotations

One-To-Many Relationship: [mspcat_crmgeodeploymentstatus mspcat_crmgeodeploymentstatus_Annotations](mspcat_crmgeodeploymentstatus.md#BKMK_mspcat_crmgeodeploymentstatus_Annotations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencedAttribute|`mspcat_crmgeodeploymentstatusid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_crmgeodeploymentstatus`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_installactivity_Annotations"></a> mspcat_installactivity_Annotations

One-To-Many Relationship: [mspcat_installactivity mspcat_installactivity_Annotations](mspcat_installactivity.md#BKMK_mspcat_installactivity_Annotations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installactivity`|
|ReferencedAttribute|`activityid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_installactivity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packagelocales_Annotations"></a> mspcat_packagelocales_Annotations

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_Annotations](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_Annotations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_packagelocales`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packages_Annotations"></a> mspcat_packages_Annotations

One-To-Many Relationship: [mspcat_packages mspcat_packages_Annotations](mspcat_packages.md#BKMK_mspcat_packages_Annotations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_publisher_Annotations"></a> mspcat_publisher_Annotations

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_Annotations](mspcat_publisher.md#BKMK_mspcat_publisher_Annotations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_publisheridentity_Annotations"></a> mspcat_publisheridentity_Annotations

One-To-Many Relationship: [mspcat_publisheridentity mspcat_publisheridentity_Annotations](mspcat_publisheridentity.md#BKMK_mspcat_publisheridentity_Annotations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisheridentity`|
|ReferencedAttribute|`mspcat_publisheridentityid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_publisheridentity`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_sspolicy_Annotations"></a> mspcat_sspolicy_Annotations

One-To-Many Relationship: [mspcat_sspolicy mspcat_sspolicy_Annotations](mspcat_sspolicy.md#BKMK_mspcat_sspolicy_Annotations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicy`|
|ReferencedAttribute|`mspcat_sspolicyid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_sspolicy`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_templates_Annotations"></a> mspcat_templates_Annotations

One-To-Many Relationship: [mspcat_templates mspcat_templates_Annotations](mspcat_templates.md#BKMK_mspcat_templates_Annotations)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_templates`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.annotation?displayProperty=fullName>
