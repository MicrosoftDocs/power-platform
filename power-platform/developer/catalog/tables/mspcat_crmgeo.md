---
title: "Power Platform Geo (mspcat_crmgeo) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Power Platform Geo (mspcat_crmgeo) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Power Platform Geo (mspcat_crmgeo) table/entity reference

This lists the Power Platform GEO's that are available to be assigned

## Messages

The following table lists the messages for the Power Platform Geo (mspcat_crmgeo) table.
Messages represent operations that can be performed on the table. They may also be events.

| Name <br />Is Event? |Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `Create`<br />Event: True |`POST` /mspcat_crmgeos<br />See [Create](/powerapps/developer/data-platform/webapi/create-entity-web-api) |[Create records](/power-apps/developer/data-platform/org-service/entity-operations-create#basic-create)|
| `CreateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.CreateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.CreateMultipleRequest>|
| `Delete`<br />Event: True |`DELETE` /mspcat_crmgeos(*mspcat_crmgeoid*)<br />See [Delete](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-delete) |[Delete records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-delete)|
| `IsValidStateTransition`<br />Event: False |<xref:Microsoft.Dynamics.CRM.IsValidStateTransition?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.IsValidStateTransitionRequest>|
| `Restore`<br />Event: True |<xref:Microsoft.Dynamics.CRM.Restore?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retrieve`<br />Event: True |`GET` /mspcat_crmgeos(*mspcat_crmgeoid*)<br />See [Retrieve](/powerapps/developer/data-platform/webapi/retrieve-entity-using-web-api) |[Retrieve records](/power-apps/developer/data-platform/org-service/entity-operations-retrieve)|
| `RetrieveMultiple`<br />Event: True |`GET` /mspcat_crmgeos<br />See [Query data](/power-apps/developer/data-platform/webapi/query-data-web-api) |[Query data](/power-apps/developer/data-platform/org-service/entity-operations-query-data)|
| `SetState`<br />Event: True |`PATCH` /mspcat_crmgeos(*mspcat_crmgeoid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `statecode` and `statuscode` properties. |<xref:Microsoft.Crm.Sdk.Messages.SetStateRequest>|
| `Update`<br />Event: True |`PATCH` /mspcat_crmgeos(*mspcat_crmgeoid*)<br />See [Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) |[Update records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-update)|
| `UpdateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.UpdateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpdateMultipleRequest>|
| `Upsert`<br />Event: False |`PATCH` /mspcat_crmgeos(*mspcat_crmgeoid*)<br />See [Upsert a table row](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#upsert-a-table-row) |<xref:Microsoft.Xrm.Sdk.Messages.UpsertRequest>|
| `UpsertMultiple`<br />Event: False |<xref:Microsoft.Dynamics.CRM.UpsertMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpsertMultipleRequest>|


## Events

The following table lists the events for the Power Platform Geo (mspcat_crmgeo) table.
Events are messages that exist so that you can subscribe to them. Unless you added the event, you shouldn't invoke the message, only subscribe to it.

|Name|Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `BulkRetain`|<xref:Microsoft.Dynamics.CRM.BulkRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `PurgeRetainedContent`|<xref:Microsoft.Dynamics.CRM.PurgeRetainedContent?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retain`|<xref:Microsoft.Dynamics.CRM.Retain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `RollbackRetain`|<xref:Microsoft.Dynamics.CRM.RollbackRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `ValidateRetentionConfig`|<xref:Microsoft.Dynamics.CRM.ValidateRetentionConfig?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|

## Properties

The following table lists selected properties for the Power Platform Geo (mspcat_crmgeo) table.

|Property|Value|
| --- | --- |
| **DisplayName** | **Power Platform Geo** |
| **DisplayCollectionName** | **Power Platform Geos** |
| **SchemaName** | `mspcat_crmgeo` |
| **CollectionSchemaName** | `mspcat_crmgeos` |
| **EntitySetName** | `mspcat_crmgeos`|
| **LogicalName** | `mspcat_crmgeo` |
| **LogicalCollectionName** | `mspcat_crmgeos` |
| **PrimaryIdAttribute** | `mspcat_crmgeoid` |
| **PrimaryNameAttribute** |`mspcat_geoname` |
| **TableType** | `Standard` |
| **OwnershipType** | `OrganizationOwned` |

## Writable columns/attributes

These columns/attributes return true for either **IsValidForCreate** or **IsValidForUpdate** (usually both). Listed by **SchemaName**.

- [ImportSequenceNumber](#BKMK_ImportSequenceNumber)
- [mspcat_crmgeoId](#BKMK_mspcat_crmgeoId)
- [mspcat_geoname](#BKMK_mspcat_geoname)
- [mspcat_geosubdomain](#BKMK_mspcat_geosubdomain)
- [mspcat_Location](#BKMK_mspcat_Location)
- [mspcat_TPSAccessUrl](#BKMK_mspcat_TPSAccessUrl)
- [OverriddenCreatedOn](#BKMK_OverriddenCreatedOn)
- [statecode](#BKMK_statecode)
- [statuscode](#BKMK_statuscode)
- [TimeZoneRuleVersionNumber](#BKMK_TimeZoneRuleVersionNumber)
- [UTCConversionTimeZoneCode](#BKMK_UTCConversionTimeZoneCode)

### <a name="BKMK_ImportSequenceNumber"></a> ImportSequenceNumber

|Property|Value|
|---|---|
|Description|**Sequence number of the import that created this record.**|
|DisplayName|**Import Sequence Number**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`importsequencenumber`|
|RequiredLevel|None|
|Type|Integer|
|MaxValue|2147483647|
|MinValue|-2147483648|

### <a name="BKMK_mspcat_crmgeoId"></a> mspcat_crmgeoId

|Property|Value|
|---|---|
|Description|**Unique identifier for entity instances**|
|DisplayName|**Power Platform GEO**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_crmgeoid`|
|RequiredLevel|SystemRequired|
|Type|Uniqueidentifier|

### <a name="BKMK_mspcat_geoname"></a> mspcat_geoname

|Property|Value|
|---|---|
|Description|**The name of the custom entity.**|
|DisplayName|**GEO Name**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_geoname`|
|RequiredLevel|ApplicationRequired|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|200|

### <a name="BKMK_mspcat_geosubdomain"></a> mspcat_geosubdomain

|Property|Value|
|---|---|
|Description|**Sub domain that services the Geo**|
|DisplayName|**GEO Subdomain**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_geosubdomain`|
|RequiredLevel|ApplicationRequired|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|500|

### <a name="BKMK_mspcat_Location"></a> mspcat_Location

|Property|Value|
|---|---|
|Description|**Location serviced by this GEO**|
|DisplayName|**Location**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_location`|
|RequiredLevel|Recommended|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|200|

### <a name="BKMK_mspcat_TPSAccessUrl"></a> mspcat_TPSAccessUrl

|Property|Value|
|---|---|
|Description|**This is the access URL for the TPS instance that services this GEO**|
|DisplayName|**TPS Access Url**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_tpsaccessurl`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|500|

### <a name="BKMK_OverriddenCreatedOn"></a> OverriddenCreatedOn

|Property|Value|
|---|---|
|Description|**Date and time that the record was migrated.**|
|DisplayName|**Record Created On**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`overriddencreatedon`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|False|
|DateTimeBehavior|UserLocal|
|Format|DateOnly|
|ImeMode|Inactive|
|SourceTypeMask|0|

### <a name="BKMK_statecode"></a> statecode

|Property|Value|
|---|---|
|Description|**Status of the CRM GEO**|
|DisplayName|**Status**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statecode`|
|RequiredLevel|SystemRequired|
|Type|State|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_crmgeo_statecode`|

#### statecode Choices/Options

|Value|Details|
|---|---|
|0|Label: **Active**<br />DefaultStatus: 1<br />InvariantName: `Active`|
|1|Label: **Inactive**<br />DefaultStatus: 2<br />InvariantName: `Inactive`|

### <a name="BKMK_statuscode"></a> statuscode

|Property|Value|
|---|---|
|Description|**Reason for the status of the CRM GEO**|
|DisplayName|**Status Reason**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statuscode`|
|RequiredLevel|None|
|Type|Status|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_crmgeo_statuscode`|

#### statuscode Choices/Options

|Value|Details|
|---|---|
|1|Label: **Active**<br />State:0<br />TransitionData: None|
|2|Label: **Inactive**<br />State:1<br />TransitionData: None|

### <a name="BKMK_TimeZoneRuleVersionNumber"></a> TimeZoneRuleVersionNumber

|Property|Value|
|---|---|
|Description|**For internal use only.**|
|DisplayName|**Time Zone Rule Version Number**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`timezoneruleversionnumber`|
|RequiredLevel|None|
|Type|Integer|
|MaxValue|2147483647|
|MinValue|-1|

### <a name="BKMK_UTCConversionTimeZoneCode"></a> UTCConversionTimeZoneCode

|Property|Value|
|---|---|
|Description|**Time zone code that was in use when the record was created.**|
|DisplayName|**UTC Conversion Time Zone Code**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`utcconversiontimezonecode`|
|RequiredLevel|None|
|Type|Integer|
|MaxValue|2147483647|
|MinValue|-1|


## Read-only columns/attributes

These columns/attributes return false for both **IsValidForCreate** and **IsValidForUpdate**. Listed by **SchemaName**.

- [CreatedBy](#BKMK_CreatedBy)
- [CreatedOn](#BKMK_CreatedOn)
- [CreatedOnBehalfBy](#BKMK_CreatedOnBehalfBy)
- [ModifiedBy](#BKMK_ModifiedBy)
- [ModifiedOn](#BKMK_ModifiedOn)
- [ModifiedOnBehalfBy](#BKMK_ModifiedOnBehalfBy)
- [OrganizationId](#BKMK_OrganizationId)
- [VersionNumber](#BKMK_VersionNumber)

### <a name="BKMK_CreatedBy"></a> CreatedBy

|Property|Value|
|---|---|
|Description|**Unique identifier of the user who created the record.**|
|DisplayName|**Created By**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`createdby`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|systemuser|

### <a name="BKMK_CreatedOn"></a> CreatedOn

|Property|Value|
|---|---|
|Description|**Date and time when the record was created.**|
|DisplayName|**Created On**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`createdon`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|False|
|DateTimeBehavior|UserLocal|
|Format|DateAndTime|
|ImeMode|Inactive|
|SourceTypeMask|0|

### <a name="BKMK_CreatedOnBehalfBy"></a> CreatedOnBehalfBy

|Property|Value|
|---|---|
|Description|**Unique identifier of the delegate user who created the record.**|
|DisplayName|**Created By (Delegate)**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`createdonbehalfby`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|systemuser|

### <a name="BKMK_ModifiedBy"></a> ModifiedBy

|Property|Value|
|---|---|
|Description|**Unique identifier of the user who modified the record.**|
|DisplayName|**Modified By**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`modifiedby`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|systemuser|

### <a name="BKMK_ModifiedOn"></a> ModifiedOn

|Property|Value|
|---|---|
|Description|**Date and time when the record was modified.**|
|DisplayName|**Modified On**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`modifiedon`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|False|
|DateTimeBehavior|UserLocal|
|Format|DateAndTime|
|ImeMode|Inactive|
|SourceTypeMask|0|

### <a name="BKMK_ModifiedOnBehalfBy"></a> ModifiedOnBehalfBy

|Property|Value|
|---|---|
|Description|**Unique identifier of the delegate user who modified the record.**|
|DisplayName|**Modified By (Delegate)**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`modifiedonbehalfby`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|systemuser|

### <a name="BKMK_OrganizationId"></a> OrganizationId

|Property|Value|
|---|---|
|Description|**Unique identifier for the organization**|
|DisplayName|**Organization Id**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`organizationid`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|organization|

### <a name="BKMK_VersionNumber"></a> VersionNumber

|Property|Value|
|---|---|
|Description|**Version Number**|
|DisplayName|**Version Number**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`versionnumber`|
|RequiredLevel|None|
|Type|BigInt|
|MaxValue|9223372036854775807|
|MinValue|-9223372036854775808|

## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [mspcat_mspcat_crmgeo_mspcat_crmgeodeploymentstatus_CRMGEO](#BKMK_mspcat_mspcat_crmgeo_mspcat_crmgeodeploymentstatus_CRMGEO)
- [mspcat_publisheridentity_ApplyToGeo_msd](#BKMK_mspcat_publisheridentity_ApplyToGeo_msd)

### <a name="BKMK_mspcat_mspcat_crmgeo_mspcat_crmgeodeploymentstatus_CRMGEO"></a> mspcat_mspcat_crmgeo_mspcat_crmgeodeploymentstatus_CRMGEO

Many-To-One Relationship: [mspcat_crmgeodeploymentstatus mspcat_mspcat_crmgeo_mspcat_crmgeodeploymentstatus_CRMGEO](mspcat_crmgeodeploymentstatus.md#BKMK_mspcat_mspcat_crmgeo_mspcat_crmgeodeploymentstatus_CRMGEO)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencingAttribute|`mspcat_crmgeo`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_crmgeo_mspcat_crmgeodeploymentstatus_CRMGEO`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisheridentity_ApplyToGeo_msd"></a> mspcat_publisheridentity_ApplyToGeo_msd

Many-To-One Relationship: [mspcat_publisheridentity mspcat_publisheridentity_ApplyToGeo_msd](mspcat_publisheridentity.md#BKMK_mspcat_publisheridentity_ApplyToGeo_msd)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisheridentity`|
|ReferencingAttribute|`mspcat_applytogeo`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisheridentity_ApplyToGeo_msd`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|


## Many-to-Many relationships

These relationships are many-to-many. Listed by **SchemaName**.

- [mspcat_certreq_targeted_geos](#BKMK_mspcat_certreq_targeted_geos)
- [mspcat_mspcat_app_autoapproved_geo](#BKMK_mspcat_mspcat_app_autoapproved_geo)
- [mspcat_mspcat_crmgeo_mspcat_applications](#BKMK_mspcat_mspcat_crmgeo_mspcat_applications)

### <a name="BKMK_mspcat_certreq_targeted_geos"></a> mspcat_certreq_targeted_geos

See [mspcat_certificationrequest mspcat_certreq_targeted_geos Many-To-Many Relationship](mspcat_certificationrequest.md#BKMK_mspcat_certreq_targeted_geos)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_certreq_targeted_geos_reln`|
|IsCustomizable|True|
|SchemaName|`mspcat_certreq_targeted_geos`|
|IntersectAttribute|`mspcat_crmgeoid`|
|NavigationPropertyName|`mspcat_certreq_targeted_geos`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_app_autoapproved_geo"></a> mspcat_mspcat_app_autoapproved_geo

See [mspcat_applications mspcat_mspcat_app_autoapproved_geo Many-To-Many Relationship](mspcat_applications.md#BKMK_mspcat_mspcat_app_autoapproved_geo)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_mspcat_app_autoapproved_geo_reln`|
|IsCustomizable|True|
|SchemaName|`mspcat_mspcat_app_autoapproved_geo`|
|IntersectAttribute|`mspcat_crmgeoid`|
|NavigationPropertyName|`mspcat_mspcat_app_autoapproved_geo`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseLabel`<br />Group: `Details`<br />Label: Auto-approved GEOs<br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_crmgeo_mspcat_applications"></a> mspcat_mspcat_crmgeo_mspcat_applications

See [mspcat_applications mspcat_mspcat_crmgeo_mspcat_applications Many-To-Many Relationship](mspcat_applications.md#BKMK_mspcat_mspcat_crmgeo_mspcat_applications)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_mspcat_crmgeo_mspcat_applications`|
|IsCustomizable|True|
|SchemaName|`mspcat_mspcat_crmgeo_mspcat_applications`|
|IntersectAttribute|`mspcat_crmgeoid`|
|NavigationPropertyName|`mspcat_mspcat_crmgeo_mspcat_applications`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   

