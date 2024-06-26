---
title: "Appointment table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Appointment table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Appointment table/entity reference

Commitment representing a time interval with start/end times and duration.

> [!NOTE]
> The Power Platform Catalog Manager Appointment table extends the [Microsoft Dataverse Appointment table](/power-apps/developer/data-platform/reference/entities/appointment).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/appointment#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_Appointments](#BKMK_mspcat_applications_Appointments)
- [mspcat_certificationrequest_Appointments](#BKMK_mspcat_certificationrequest_Appointments)
- [mspcat_installhistory_Appointments](#BKMK_mspcat_installhistory_Appointments)
- [mspcat_packagelocales_Appointments](#BKMK_mspcat_packagelocales_Appointments)
- [mspcat_packages_Appointments](#BKMK_mspcat_packages_Appointments)
- [mspcat_publisher_Appointments](#BKMK_mspcat_publisher_Appointments)
- [mspcat_templates_Appointments](#BKMK_mspcat_templates_Appointments)

### <a name="BKMK_mspcat_applications_Appointments"></a> mspcat_applications_Appointments

One-To-Many Relationship: [mspcat_applications mspcat_applications_Appointments](mspcat_applications.md#BKMK_mspcat_applications_Appointments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications_appointment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_certificationrequest_Appointments"></a> mspcat_certificationrequest_Appointments

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_Appointments](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_Appointments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest_appointment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_installhistory_Appointments"></a> mspcat_installhistory_Appointments

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_Appointments](mspcat_installhistory.md#BKMK_mspcat_installhistory_Appointments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory_appointment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packagelocales_Appointments"></a> mspcat_packagelocales_Appointments

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_Appointments](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_Appointments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales_appointment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packages_Appointments"></a> mspcat_packages_Appointments

One-To-Many Relationship: [mspcat_packages mspcat_packages_Appointments](mspcat_packages.md#BKMK_mspcat_packages_Appointments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages_appointment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_publisher_Appointments"></a> mspcat_publisher_Appointments

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_Appointments](mspcat_publisher.md#BKMK_mspcat_publisher_Appointments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher_appointment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_templates_Appointments"></a> mspcat_templates_Appointments

One-To-Many Relationship: [mspcat_templates mspcat_templates_Appointments](mspcat_templates.md#BKMK_mspcat_templates_Appointments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates_appointment`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.appointment?displayProperty=fullName>
