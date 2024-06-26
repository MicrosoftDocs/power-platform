---
title: "Recurring Appointment (RecurringAppointmentMaster) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Recurring Appointment (RecurringAppointmentMaster) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Recurring Appointment (RecurringAppointmentMaster) table/entity reference

The Master appointment of a recurring appointment series.

> [!NOTE]
> The Power Platform Catalog Manager Recurring Appointment (RecurringAppointmentMaster) table extends the [Microsoft Dataverse Recurring Appointment (RecurringAppointmentMaster) table](/power-apps/developer/data-platform/reference/entities/recurringappointmentmaster).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_RegardingObjectId"></a> RegardingObjectId

Changes from [RegardingObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/recurringappointmentmaster#BKMK_RegardingObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_applications|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_applications_RecurringAppointmentMasters](#BKMK_mspcat_applications_RecurringAppointmentMasters)
- [mspcat_certificationrequest_RecurringAppointmentMasters](#BKMK_mspcat_certificationrequest_RecurringAppointmentMasters)
- [mspcat_installhistory_RecurringAppointmentMasters](#BKMK_mspcat_installhistory_RecurringAppointmentMasters)
- [mspcat_packagelocales_RecurringAppointmentMasters](#BKMK_mspcat_packagelocales_RecurringAppointmentMasters)
- [mspcat_packages_RecurringAppointmentMasters](#BKMK_mspcat_packages_RecurringAppointmentMasters)
- [mspcat_publisher_RecurringAppointmentMasters](#BKMK_mspcat_publisher_RecurringAppointmentMasters)
- [mspcat_templates_RecurringAppointmentMasters](#BKMK_mspcat_templates_RecurringAppointmentMasters)

### <a name="BKMK_mspcat_applications_RecurringAppointmentMasters"></a> mspcat_applications_RecurringAppointmentMasters

One-To-Many Relationship: [mspcat_applications mspcat_applications_RecurringAppointmentMasters](mspcat_applications.md#BKMK_mspcat_applications_RecurringAppointmentMasters)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_applications_recurringappointmentmaster`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_certificationrequest_RecurringAppointmentMasters"></a> mspcat_certificationrequest_RecurringAppointmentMasters

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_RecurringAppointmentMasters](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_RecurringAppointmentMasters)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_certificationrequest_recurringappointmentmaster`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_installhistory_RecurringAppointmentMasters"></a> mspcat_installhistory_RecurringAppointmentMasters

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_RecurringAppointmentMasters](mspcat_installhistory.md#BKMK_mspcat_installhistory_RecurringAppointmentMasters)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_installhistory_recurringappointmentmaster`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packagelocales_RecurringAppointmentMasters"></a> mspcat_packagelocales_RecurringAppointmentMasters

One-To-Many Relationship: [mspcat_packagelocales mspcat_packagelocales_RecurringAppointmentMasters](mspcat_packagelocales.md#BKMK_mspcat_packagelocales_RecurringAppointmentMasters)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packagelocales`|
|ReferencedAttribute|`mspcat_packagelocalesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packagelocales_recurringappointmentmaster`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_packages_RecurringAppointmentMasters"></a> mspcat_packages_RecurringAppointmentMasters

One-To-Many Relationship: [mspcat_packages mspcat_packages_RecurringAppointmentMasters](mspcat_packages.md#BKMK_mspcat_packages_RecurringAppointmentMasters)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_packages_recurringappointmentmaster`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_publisher_RecurringAppointmentMasters"></a> mspcat_publisher_RecurringAppointmentMasters

One-To-Many Relationship: [mspcat_publisher mspcat_publisher_RecurringAppointmentMasters](mspcat_publisher.md#BKMK_mspcat_publisher_RecurringAppointmentMasters)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_publisher_recurringappointmentmaster`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_mspcat_templates_RecurringAppointmentMasters"></a> mspcat_templates_RecurringAppointmentMasters

One-To-Many Relationship: [mspcat_templates mspcat_templates_RecurringAppointmentMasters](mspcat_templates.md#BKMK_mspcat_templates_RecurringAppointmentMasters)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_templates`|
|ReferencedAttribute|`mspcat_templatesid`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencingEntityNavigationPropertyName|`regardingobjectid_mspcat_templates_recurringappointmentmaster`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.recurringappointmentmaster?displayProperty=fullName>
