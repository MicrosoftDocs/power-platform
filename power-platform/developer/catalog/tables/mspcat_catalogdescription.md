---
title: "Catalog Configuration (mspcat_CatalogDescription) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Catalog Configuration (mspcat_CatalogDescription) table/entity with Power Platform Catalog Manager."
ms.date: 11/05/2024
ms.service: power-platform
ms.topic: generated-reference
author: isaacwinoto
ms.author: isaacwinoto
search.audienceType: 
  - developer
---

# Catalog Configuration (mspcat_CatalogDescription) table/entity reference

Contains descriptive data for the Catalog

## Messages

The following table lists the messages for the Catalog Configuration (mspcat_CatalogDescription) table.
Messages represent operations that can be performed on the table. They may also be events.

| Name <br />Is Event? |Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `Create`<br />Event: True |`POST` /mspcat_catalogdescriptions<br />See [Create](/powerapps/developer/data-platform/webapi/create-entity-web-api) |[Create records](/power-apps/developer/data-platform/org-service/entity-operations-create#basic-create)|
| `CreateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.CreateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.CreateMultipleRequest>|
| `Delete`<br />Event: True |`DELETE` /mspcat_catalogdescriptions(*mspcat_catalogdescriptionid*)<br />See [Delete](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-delete) |[Delete records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-delete)|
| `IsValidStateTransition`<br />Event: False |<xref:Microsoft.Dynamics.CRM.IsValidStateTransition?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.IsValidStateTransitionRequest>|
| `Restore`<br />Event: True |<xref:Microsoft.Dynamics.CRM.Restore?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retrieve`<br />Event: True |`GET` /mspcat_catalogdescriptions(*mspcat_catalogdescriptionid*)<br />See [Retrieve](/powerapps/developer/data-platform/webapi/retrieve-entity-using-web-api) |[Retrieve records](/power-apps/developer/data-platform/org-service/entity-operations-retrieve)|
| `RetrieveMultiple`<br />Event: True |`GET` /mspcat_catalogdescriptions<br />See [Query data](/power-apps/developer/data-platform/webapi/query-data-web-api) |[Query data](/power-apps/developer/data-platform/org-service/entity-operations-query-data)|
| `SetState`<br />Event: True |`PATCH` /mspcat_catalogdescriptions(*mspcat_catalogdescriptionid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `statecode` and `statuscode` properties. |<xref:Microsoft.Crm.Sdk.Messages.SetStateRequest>|
| `Update`<br />Event: True |`PATCH` /mspcat_catalogdescriptions(*mspcat_catalogdescriptionid*)<br />See [Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) |[Update records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-update)|
| `UpdateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.UpdateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpdateMultipleRequest>|
| `Upsert`<br />Event: False |`PATCH` /mspcat_catalogdescriptions(*mspcat_catalogdescriptionid*)<br />See [Upsert a table row](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#upsert-a-table-row) |<xref:Microsoft.Xrm.Sdk.Messages.UpsertRequest>|
| `UpsertMultiple`<br />Event: False |<xref:Microsoft.Dynamics.CRM.UpsertMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpsertMultipleRequest>|


## Events

The following table lists the events for the Catalog Configuration (mspcat_CatalogDescription) table.
Events are messages that exist so that you can subscribe to them. Unless you added the event, you shouldn't invoke the message, only subscribe to it.

|Name|Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `BulkRetain`|<xref:Microsoft.Dynamics.CRM.BulkRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `PurgeRetainedContent`|<xref:Microsoft.Dynamics.CRM.PurgeRetainedContent?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retain`|<xref:Microsoft.Dynamics.CRM.Retain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `RollbackRetain`|<xref:Microsoft.Dynamics.CRM.RollbackRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `ValidateRetentionConfig`|<xref:Microsoft.Dynamics.CRM.ValidateRetentionConfig?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|

## Properties

The following table lists selected properties for the Catalog Configuration (mspcat_CatalogDescription) table.

|Property|Value|
| --- | --- |
| **DisplayName** | **Catalog Configuration** |
| **DisplayCollectionName** | **Catalog Configurations** |
| **SchemaName** | `mspcat_CatalogDescription` |
| **CollectionSchemaName** | `mspcat_CatalogDescriptions` |
| **EntitySetName** | `mspcat_catalogdescriptions`|
| **LogicalName** | `mspcat_catalogdescription` |
| **LogicalCollectionName** | `mspcat_catalogdescriptions` |
| **PrimaryIdAttribute** | `mspcat_catalogdescriptionid` |
| **PrimaryNameAttribute** |`mspcat_catalogname` |
| **TableType** | `Standard` |
| **OwnershipType** | `OrganizationOwned` |

## Writable columns/attributes

These columns/attributes return true for either **IsValidForCreate** or **IsValidForUpdate** (usually both). Listed by **SchemaName**.

- [ImportSequenceNumber](#BKMK_ImportSequenceNumber)
- [mspcat_AllowUnmanagedSolutions](#BKMK_mspcat_AllowUnmanagedSolutions)
- [mspcat_CatalogDescriptionId](#BKMK_mspcat_CatalogDescriptionId)
- [mspcat_CatalogEnabled](#BKMK_mspcat_CatalogEnabled)
- [mspcat_catalogimagefile](#BKMK_mspcat_catalogimagefile)
- [mspcat_CatalogName](#BKMK_mspcat_CatalogName)
- [mspcat_Description](#BKMK_mspcat_Description)
- [mspcat_EnableGlobalAutoApproval](#BKMK_mspcat_EnableGlobalAutoApproval)
- [mspcat_HelpLink](#BKMK_mspcat_HelpLink)
- [mspcat_Icon](#BKMK_mspcat_Icon)
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

### <a name="BKMK_mspcat_AllowUnmanagedSolutions"></a> mspcat_AllowUnmanagedSolutions

|Property|Value|
|---|---|
|Description|**Allows unmanaged solutions in packages**|
|DisplayName|**Allow Unmanaged Solutions**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_allowunmanagedsolutions`|
|RequiredLevel|ApplicationRequired|
|Type|Boolean|
|GlobalChoiceName|`mspcat_catalogdescription_mspcat_allowunmanagedsolutions`|
|DefaultValue|False|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_CatalogDescriptionId"></a> mspcat_CatalogDescriptionId

|Property|Value|
|---|---|
|Description|**Unique identifier for entity instances**|
|DisplayName|**Catalog Description**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_catalogdescriptionid`|
|RequiredLevel|SystemRequired|
|Type|Uniqueidentifier|

### <a name="BKMK_mspcat_CatalogEnabled"></a> mspcat_CatalogEnabled

|Property|Value|
|---|---|
|Description|**Enable or disable all operations for the Catalog**|
|DisplayName|**Enabled**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_catalogenabled`|
|RequiredLevel|ApplicationRequired|
|Type|Boolean|
|GlobalChoiceName|`mspcat_catalogdescription_mspcat_catalogenabled`|
|DefaultValue|True|
|True Label|Enabled|
|False Label|Disabled|

### <a name="BKMK_mspcat_catalogimagefile"></a> mspcat_catalogimagefile

|Property|Value|
|---|---|
|Description|**Image used to represent this catalog**|
|DisplayName|**Catalog Image**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_catalogimagefile`|
|RequiredLevel|None|
|Type|Image|
|CanStoreFullImage|True|
|IsPrimaryImage|False|
|MaxHeight|144|
|MaxSizeInKB|10240|
|MaxWidth|144|

### <a name="BKMK_mspcat_CatalogName"></a> mspcat_CatalogName

|Property|Value|
|---|---|
|Description|**Display name of the catalog**|
|DisplayName|**Catalog Name**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_catalogname`|
|RequiredLevel|ApplicationRequired|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_mspcat_Description"></a> mspcat_Description

|Property|Value|
|---|---|
|Description|**Describes the purpose of this catalog**|
|DisplayName|**Description**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_description`|
|RequiredLevel|Recommended|
|Type|String|
|Format|TextArea|
|FormatName|TextArea|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|4000|

### <a name="BKMK_mspcat_EnableGlobalAutoApproval"></a> mspcat_EnableGlobalAutoApproval

|Property|Value|
|---|---|
|Description|**When enabled, this will automatically approve all submissions into the system that reach the submitted stage without review. WarningWhen enabled there will be no opportunity to reject a submission.**|
|DisplayName|**Enable Global Auto Approval**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_enableglobalautoapproval`|
|RequiredLevel|ApplicationRequired|
|Type|Boolean|
|GlobalChoiceName|`mspcat_catalogdescription_mspcat_enableglobalautoapproval`|
|DefaultValue|False|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_HelpLink"></a> mspcat_HelpLink

|Property|Value|
|---|---|
|Description|**Link to help users with submission information**|
|DisplayName|**Help Link**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_helplink`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|255|

### <a name="BKMK_mspcat_Icon"></a> mspcat_Icon

|Property|Value|
|---|---|
|Description|**Image used to represent the catalog**|
|DisplayName|**Icon**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_icon`|
|RequiredLevel|None|
|Type|Image|
|CanStoreFullImage|True|
|IsPrimaryImage|True|
|MaxHeight|144|
|MaxSizeInKB|10240|
|MaxWidth|144|

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
|Description|**Status of the Catalog Description**|
|DisplayName|**Status**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statecode`|
|RequiredLevel|SystemRequired|
|Type|State|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_catalogdescription_statecode`|

#### statecode Choices/Options

|Value|Details|
|---|---|
|0|Label: **Active**<br />DefaultStatus: 1<br />InvariantName: `Active`|
|1|Label: **Inactive**<br />DefaultStatus: 2<br />InvariantName: `Inactive`|

### <a name="BKMK_statuscode"></a> statuscode

|Property|Value|
|---|---|
|Description|**Reason for the status of the Catalog Description**|
|DisplayName|**Status Reason**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statuscode`|
|RequiredLevel|None|
|Type|Status|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_catalogdescription_statuscode`|

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
- [mspcat_catalogimagefile_Timestamp](#BKMK_mspcat_catalogimagefile_Timestamp)
- [mspcat_catalogimagefile_URL](#BKMK_mspcat_catalogimagefile_URL)
- [mspcat_catalogimagefileId](#BKMK_mspcat_catalogimagefileId)
- [mspcat_Icon_Timestamp](#BKMK_mspcat_Icon_Timestamp)
- [mspcat_Icon_URL](#BKMK_mspcat_Icon_URL)
- [mspcat_IconId](#BKMK_mspcat_IconId)
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

### <a name="BKMK_mspcat_catalogimagefile_Timestamp"></a> mspcat_catalogimagefile_Timestamp

|Property|Value|
|---|---|
|Description||
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_catalogimagefile_timestamp`|
|RequiredLevel|None|
|Type|BigInt|
|MaxValue|9223372036854775807|
|MinValue|-9223372036854775808|

### <a name="BKMK_mspcat_catalogimagefile_URL"></a> mspcat_catalogimagefile_URL

|Property|Value|
|---|---|
|Description||
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_catalogimagefile_url`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Disabled|
|IsLocalizable|False|
|MaxLength|200|

### <a name="BKMK_mspcat_catalogimagefileId"></a> mspcat_catalogimagefileId

|Property|Value|
|---|---|
|Description||
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_catalogimagefileid`|
|RequiredLevel|None|
|Type|Uniqueidentifier|

### <a name="BKMK_mspcat_Icon_Timestamp"></a> mspcat_Icon_Timestamp

|Property|Value|
|---|---|
|Description||
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_icon_timestamp`|
|RequiredLevel|None|
|Type|BigInt|
|MaxValue|9223372036854775807|
|MinValue|-9223372036854775808|

### <a name="BKMK_mspcat_Icon_URL"></a> mspcat_Icon_URL

|Property|Value|
|---|---|
|Description||
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_icon_url`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Disabled|
|IsLocalizable|False|
|MaxLength|200|

### <a name="BKMK_mspcat_IconId"></a> mspcat_IconId

|Property|Value|
|---|---|
|Description||
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_iconid`|
|RequiredLevel|None|
|Type|Uniqueidentifier|

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



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   

