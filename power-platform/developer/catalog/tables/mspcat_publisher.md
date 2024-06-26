---
title: "Catalog Publisher (mspcat_publisher) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Catalog Publisher (mspcat_publisher) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Catalog Publisher (mspcat_publisher) table/entity reference

This the publisher Entity for holding TPS Publisher data.

## Messages

The following table lists the messages for the Catalog Publisher (mspcat_publisher) table.
Messages represent operations that can be performed on the table. They may also be events.

| Name <br />Is Event? |Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `Assign`<br />Event: True |`PATCH` /mspcat_publishers(*mspcat_publisherid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `ownerid` property. |<xref:Microsoft.Crm.Sdk.Messages.AssignRequest>|
| `Create`<br />Event: True |`POST` /mspcat_publishers<br />See [Create](/powerapps/developer/data-platform/webapi/create-entity-web-api) |[Create records](/power-apps/developer/data-platform/org-service/entity-operations-create#basic-create)|
| `CreateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.CreateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.CreateMultipleRequest>|
| `Delete`<br />Event: True |`DELETE` /mspcat_publishers(*mspcat_publisherid*)<br />See [Delete](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-delete) |[Delete records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-delete)|
| `GrantAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.GrantAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.GrantAccessRequest>|
| `IsValidStateTransition`<br />Event: False |<xref:Microsoft.Dynamics.CRM.IsValidStateTransition?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.IsValidStateTransitionRequest>|
| `ModifyAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.ModifyAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.ModifyAccessRequest>|
| `Restore`<br />Event: True |<xref:Microsoft.Dynamics.CRM.Restore?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retrieve`<br />Event: True |`GET` /mspcat_publishers(*mspcat_publisherid*)<br />See [Retrieve](/powerapps/developer/data-platform/webapi/retrieve-entity-using-web-api) |[Retrieve records](/power-apps/developer/data-platform/org-service/entity-operations-retrieve)|
| `RetrieveMultiple`<br />Event: True |`GET` /mspcat_publishers<br />See [Query data](/power-apps/developer/data-platform/webapi/query-data-web-api) |[Query data](/power-apps/developer/data-platform/org-service/entity-operations-query-data)|
| `RetrievePrincipalAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrievePrincipalAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrievePrincipalAccessRequest>|
| `RetrieveSharedPrincipalsAndAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrieveSharedPrincipalsAndAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrieveSharedPrincipalsAndAccessRequest>|
| `RevokeAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RevokeAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RevokeAccessRequest>|
| `SetState`<br />Event: True |`PATCH` /mspcat_publishers(*mspcat_publisherid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `statecode` and `statuscode` properties. |<xref:Microsoft.Crm.Sdk.Messages.SetStateRequest>|
| `Update`<br />Event: True |`PATCH` /mspcat_publishers(*mspcat_publisherid*)<br />See [Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) |[Update records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-update)|
| `UpdateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.UpdateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpdateMultipleRequest>|
| `Upsert`<br />Event: False |`PATCH` /mspcat_publishers(*mspcat_publisherid*)<br />See [Upsert a table row](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#upsert-a-table-row) |<xref:Microsoft.Xrm.Sdk.Messages.UpsertRequest>|
| `UpsertMultiple`<br />Event: False |<xref:Microsoft.Dynamics.CRM.UpsertMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpsertMultipleRequest>|


## Events

The following table lists the events for the Catalog Publisher (mspcat_publisher) table.
Events are messages that exist so that you can subscribe to them. Unless you added the event, you shouldn't invoke the message, only subscribe to it.

|Name|Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `BulkRetain`|<xref:Microsoft.Dynamics.CRM.BulkRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `PurgeRetainedContent`|<xref:Microsoft.Dynamics.CRM.PurgeRetainedContent?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retain`|<xref:Microsoft.Dynamics.CRM.Retain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `RollbackRetain`|<xref:Microsoft.Dynamics.CRM.RollbackRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `ValidateRetentionConfig`|<xref:Microsoft.Dynamics.CRM.ValidateRetentionConfig?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|

## Properties

The following table lists selected properties for the Catalog Publisher (mspcat_publisher) table.

|Property|Value|
| --- | --- |
| **DisplayName** | **Catalog Publisher** |
| **DisplayCollectionName** | **Catalog Publishers** |
| **SchemaName** | `mspcat_publisher` |
| **CollectionSchemaName** | `mspcat_publishers` |
| **EntitySetName** | `mspcat_publishers`|
| **LogicalName** | `mspcat_publisher` |
| **LogicalCollectionName** | `mspcat_publishers` |
| **PrimaryIdAttribute** | `mspcat_publisherid` |
| **PrimaryNameAttribute** |`mspcat_name` |
| **TableType** | `Standard` |
| **OwnershipType** | `UserOwned` |

## Writable columns/attributes

These columns/attributes return true for either **IsValidForCreate** or **IsValidForUpdate** (usually both). Listed by **SchemaName**.

- [ImportSequenceNumber](#BKMK_ImportSequenceNumber)
- [mspcat_allowautoapproval](#BKMK_mspcat_allowautoapproval)
- [mspcat_AzurePublisherId](#BKMK_mspcat_AzurePublisherId)
- [mspcat_Description](#BKMK_mspcat_Description)
- [mspcat_LastSyncDate](#BKMK_mspcat_LastSyncDate)
- [mspcat_name](#BKMK_mspcat_name)
- [mspcat_publisherId](#BKMK_mspcat_publisherId)
- [mspcat_PublisherType](#BKMK_mspcat_PublisherType)
- [mspcat_PushedDate](#BKMK_mspcat_PushedDate)
- [mspcat_SubscriptionId](#BKMK_mspcat_SubscriptionId)
- [mspcat_TPSPublisherID](#BKMK_mspcat_TPSPublisherID)
- [OverriddenCreatedOn](#BKMK_OverriddenCreatedOn)
- [OwnerId](#BKMK_OwnerId)
- [OwnerIdType](#BKMK_OwnerIdType)
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

### <a name="BKMK_mspcat_allowautoapproval"></a> mspcat_allowautoapproval

|Property|Value|
|---|---|
|Description|**Both the publisher and the app must allow auto-approvals in order for the app's approval requests to look for auto-approval policies.**|
|DisplayName|**Allow Auto-Approval**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_allowautoapproval`|
|RequiredLevel|None|
|Type|Boolean|
|GlobalChoiceName|`mspcat_publisher_mspcat_allowautoapproval`|
|DefaultValue|False|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_AzurePublisherId"></a> mspcat_AzurePublisherId

|Property|Value|
|---|---|
|Description||
|DisplayName|**Azure Publisher Id**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_azurepublisherid`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_mspcat_Description"></a> mspcat_Description

|Property|Value|
|---|---|
|Description||
|DisplayName|**Description**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_description`|
|RequiredLevel|None|
|Type|Memo|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|2000|

### <a name="BKMK_mspcat_LastSyncDate"></a> mspcat_LastSyncDate

|Property|Value|
|---|---|
|Description|**Date last synced with TPS\PES**|
|DisplayName|**Last Sync Date**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_lastsyncdate`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|True|
|DateTimeBehavior|UserLocal|
|Format|DateAndTime|
|ImeMode|Auto|
|SourceTypeMask|0|

### <a name="BKMK_mspcat_name"></a> mspcat_name

|Property|Value|
|---|---|
|Description|**The name of the publisher.**|
|DisplayName|**Name**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_name`|
|RequiredLevel|ApplicationRequired|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|250|

### <a name="BKMK_mspcat_publisherId"></a> mspcat_publisherId

|Property|Value|
|---|---|
|Description|**Unique identifier for entity instances**|
|DisplayName|**Publisher**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_publisherid`|
|RequiredLevel|SystemRequired|
|Type|Uniqueidentifier|

### <a name="BKMK_mspcat_PublisherType"></a> mspcat_PublisherType

|Property|Value|
|---|---|
|Description||
|DisplayName|**Publisher Type**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_publishertype`|
|RequiredLevel|ApplicationRequired|
|Type|Picklist|
|DefaultFormValue|1|
|GlobalChoiceName|`mspcat_mspcat_publisher_mspcat_publishertype`|

#### mspcat_PublisherType Choices/Options

|Value|Label|
|---|---|
|0|**FirstParty**|
|1|**ThirdParty**|
|526430002|**Tenant**|
|526430003|**Partner**|

### <a name="BKMK_mspcat_PushedDate"></a> mspcat_PushedDate

|Property|Value|
|---|---|
|Description|**Date the record was pushed to TPS\PES**|
|DisplayName|**Pushed Date**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_pusheddate`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|True|
|DateTimeBehavior|UserLocal|
|Format|DateAndTime|
|ImeMode|Auto|
|SourceTypeMask|0|

### <a name="BKMK_mspcat_SubscriptionId"></a> mspcat_SubscriptionId

|Property|Value|
|---|---|
|Description|**Azure Subscription ID where Items should be Posted**|
|DisplayName|**Subscription Id**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_subscriptionid`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_mspcat_TPSPublisherID"></a> mspcat_TPSPublisherID

|Property|Value|
|---|---|
|Description|**This is the GUID of the ID used by the integration systems**|
|DisplayName|**Publisher ID**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_tpspublisherid`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|40|

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

### <a name="BKMK_OwnerId"></a> OwnerId

|Property|Value|
|---|---|
|Description|**Owner Id**|
|DisplayName|**Owner**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`ownerid`|
|RequiredLevel|SystemRequired|
|Type|Owner|
|Targets|systemuser, team|

### <a name="BKMK_OwnerIdType"></a> OwnerIdType

|Property|Value|
|---|---|
|Description|**Owner Id Type**|
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`owneridtype`|
|RequiredLevel|SystemRequired|
|Type|EntityName|

### <a name="BKMK_statecode"></a> statecode

|Property|Value|
|---|---|
|Description|**Status of the Publisher**|
|DisplayName|**Status**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statecode`|
|RequiredLevel|SystemRequired|
|Type|State|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_publisher_statecode`|

#### statecode Choices/Options

|Value|Details|
|---|---|
|0|Label: **Active**<br />DefaultStatus: 526430002<br />InvariantName: `Active`|
|1|Label: **Inactive**<br />DefaultStatus: 526430001<br />InvariantName: `Inactive`|

### <a name="BKMK_statuscode"></a> statuscode

|Property|Value|
|---|---|
|Description|**Reason for the status of the Publisher**|
|DisplayName|**Status Reason**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statuscode`|
|RequiredLevel|None|
|Type|Status|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_publisher_statuscode`|

#### statuscode Choices/Options

|Value|Details|
|---|---|
|1|Label: **Active**<br />State:0<br />TransitionData: None|
|2|Label: **Inactive**<br />State:1<br />TransitionData: None|
|526430000|Label: **Published**<br />State:0<br />TransitionData: None|
|526430001|Label: **TPS Disabled**<br />State:1<br />TransitionData: None|
|526430002|Label: **Pending Approval**<br />State:0<br />TransitionData: None|

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
- [OwnerIdName](#BKMK_OwnerIdName)
- [OwnerIdYomiName](#BKMK_OwnerIdYomiName)
- [OwningBusinessUnit](#BKMK_OwningBusinessUnit)
- [OwningTeam](#BKMK_OwningTeam)
- [OwningUser](#BKMK_OwningUser)
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

### <a name="BKMK_OwnerIdName"></a> OwnerIdName

|Property|Value|
|---|---|
|Description|**Name of the owner**|
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`owneridname`|
|RequiredLevel|SystemRequired|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_OwnerIdYomiName"></a> OwnerIdYomiName

|Property|Value|
|---|---|
|Description|**Yomi name of the owner**|
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`owneridyominame`|
|RequiredLevel|SystemRequired|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_OwningBusinessUnit"></a> OwningBusinessUnit

|Property|Value|
|---|---|
|Description|**Unique identifier for the business unit that owns the record**|
|DisplayName|**Owning Business Unit**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`owningbusinessunit`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|businessunit|

### <a name="BKMK_OwningTeam"></a> OwningTeam

|Property|Value|
|---|---|
|Description|**Unique identifier for the team that owns the record.**|
|DisplayName|**Owning Team**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`owningteam`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|team|

### <a name="BKMK_OwningUser"></a> OwningUser

|Property|Value|
|---|---|
|Description|**Unique identifier for the user that owns the record.**|
|DisplayName|**Owning User**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`owninguser`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|systemuser|

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

## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [business_unit_mspcat_publisher](#BKMK_business_unit_mspcat_publisher)
- [lk_mspcat_publisher_createdby](#BKMK_lk_mspcat_publisher_createdby)
- [lk_mspcat_publisher_createdonbehalfby](#BKMK_lk_mspcat_publisher_createdonbehalfby)
- [lk_mspcat_publisher_modifiedby](#BKMK_lk_mspcat_publisher_modifiedby)
- [lk_mspcat_publisher_modifiedonbehalfby](#BKMK_lk_mspcat_publisher_modifiedonbehalfby)
- [owner_mspcat_publisher](#BKMK_owner_mspcat_publisher)
- [team_mspcat_publisher](#BKMK_team_mspcat_publisher)
- [user_mspcat_publisher](#BKMK_user_mspcat_publisher)

### <a name="BKMK_business_unit_mspcat_publisher"></a> business_unit_mspcat_publisher

One-To-Many Relationship: [businessunit business_unit_mspcat_publisher](businessunit.md#BKMK_business_unit_mspcat_publisher)

|Property|Value|
|---|---|
|ReferencedEntity|`businessunit`|
|ReferencedAttribute|`businessunitid`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencingEntityNavigationPropertyName|`owningbusinessunit`|
|IsHierarchical||
|CascadeConfiguration|Archive: `Restrict`<br />Assign: `NoCascade`<br />Delete: `Restrict`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_publisher_createdby"></a> lk_mspcat_publisher_createdby

One-To-Many Relationship: [systemuser lk_mspcat_publisher_createdby](systemuser.md#BKMK_lk_mspcat_publisher_createdby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`createdby`|
|ReferencingEntityNavigationPropertyName|`createdby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_publisher_createdonbehalfby"></a> lk_mspcat_publisher_createdonbehalfby

One-To-Many Relationship: [systemuser lk_mspcat_publisher_createdonbehalfby](systemuser.md#BKMK_lk_mspcat_publisher_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencingEntityNavigationPropertyName|`createdonbehalfby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_publisher_modifiedby"></a> lk_mspcat_publisher_modifiedby

One-To-Many Relationship: [systemuser lk_mspcat_publisher_modifiedby](systemuser.md#BKMK_lk_mspcat_publisher_modifiedby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`modifiedby`|
|ReferencingEntityNavigationPropertyName|`modifiedby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_publisher_modifiedonbehalfby"></a> lk_mspcat_publisher_modifiedonbehalfby

One-To-Many Relationship: [systemuser lk_mspcat_publisher_modifiedonbehalfby](systemuser.md#BKMK_lk_mspcat_publisher_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencingEntityNavigationPropertyName|`modifiedonbehalfby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_owner_mspcat_publisher"></a> owner_mspcat_publisher

One-To-Many Relationship: [owner owner_mspcat_publisher](owner.md#BKMK_owner_mspcat_publisher)

|Property|Value|
|---|---|
|ReferencedEntity|`owner`|
|ReferencedAttribute|`ownerid`|
|ReferencingAttribute|`ownerid`|
|ReferencingEntityNavigationPropertyName|`ownerid`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_team_mspcat_publisher"></a> team_mspcat_publisher

One-To-Many Relationship: [team team_mspcat_publisher](team.md#BKMK_team_mspcat_publisher)

|Property|Value|
|---|---|
|ReferencedEntity|`team`|
|ReferencedAttribute|`teamid`|
|ReferencingAttribute|`owningteam`|
|ReferencingEntityNavigationPropertyName|`owningteam`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_user_mspcat_publisher"></a> user_mspcat_publisher

One-To-Many Relationship: [systemuser user_mspcat_publisher](systemuser.md#BKMK_user_mspcat_publisher)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`owninguser`|
|ReferencingEntityNavigationPropertyName|`owninguser`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|


## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [mspcat_mspcat_installhistory_Publisher_mspcat_pu](#BKMK_mspcat_mspcat_installhistory_Publisher_mspcat_pu)
- [mspcat_mspcat_publisher_mspcat_applications_PublisherId](#BKMK_mspcat_mspcat_publisher_mspcat_applications_PublisherId)
- [mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher](#BKMK_mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher)
- [mspcat_mspcat_publisher_mspcat_publisheridentity_Publisher](#BKMK_mspcat_mspcat_publisher_mspcat_publisheridentity_Publisher)
- [mspcat_mspcat_publisherusers_Publisher_mspcat_pu](#BKMK_mspcat_mspcat_publisherusers_Publisher_mspcat_pu)
- [mspcat_publisher_ActivityPointers](#BKMK_mspcat_publisher_ActivityPointers)
- [mspcat_publisher_adx_inviteredemptions](#BKMK_mspcat_publisher_adx_inviteredemptions)
- [mspcat_publisher_adx_portalcomments](#BKMK_mspcat_publisher_adx_portalcomments)
- [mspcat_publisher_Annotations](#BKMK_mspcat_publisher_Annotations)
- [mspcat_publisher_Appointments](#BKMK_mspcat_publisher_Appointments)
- [mspcat_publisher_AsyncOperations](#BKMK_mspcat_publisher_AsyncOperations)
- [mspcat_publisher_BulkDeleteFailures](#BKMK_mspcat_publisher_BulkDeleteFailures)
- [mspcat_publisher_chats](#BKMK_mspcat_publisher_chats)
- [mspcat_publisher_connections1](#BKMK_mspcat_publisher_connections1)
- [mspcat_publisher_connections2](#BKMK_mspcat_publisher_connections2)
- [mspcat_publisher_DuplicateBaseRecord](#BKMK_mspcat_publisher_DuplicateBaseRecord)
- [mspcat_publisher_DuplicateMatchingRecord](#BKMK_mspcat_publisher_DuplicateMatchingRecord)
- [mspcat_publisher_Emails](#BKMK_mspcat_publisher_Emails)
- [mspcat_publisher_Faxes](#BKMK_mspcat_publisher_Faxes)
- [mspcat_publisher_Letters](#BKMK_mspcat_publisher_Letters)
- [mspcat_publisher_MailboxTrackingFolders](#BKMK_mspcat_publisher_MailboxTrackingFolders)
- [mspcat_publisher_mspcat_InstallActivities](#BKMK_mspcat_publisher_mspcat_InstallActivities)
- [mspcat_publisher_PhoneCalls](#BKMK_mspcat_publisher_PhoneCalls)
- [mspcat_publisher_PrincipalObjectAttributeAccesses](#BKMK_mspcat_publisher_PrincipalObjectAttributeAccesses)
- [mspcat_publisher_ProcessSession](#BKMK_mspcat_publisher_ProcessSession)
- [mspcat_publisher_RecurringAppointmentMasters](#BKMK_mspcat_publisher_RecurringAppointmentMasters)
- [mspcat_publisher_SocialActivities](#BKMK_mspcat_publisher_SocialActivities)
- [mspcat_publisher_SyncErrors](#BKMK_mspcat_publisher_SyncErrors)
- [mspcat_publisher_Tasks](#BKMK_mspcat_publisher_Tasks)

### <a name="BKMK_mspcat_mspcat_installhistory_Publisher_mspcat_pu"></a> mspcat_mspcat_installhistory_Publisher_mspcat_pu

Many-To-One Relationship: [mspcat_installhistory mspcat_mspcat_installhistory_Publisher_mspcat_pu](mspcat_installhistory.md#BKMK_mspcat_mspcat_installhistory_Publisher_mspcat_pu)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`mspcat_publisher`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_installhistory_Publisher_mspcat_pu`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_publisher_mspcat_applications_PublisherId"></a> mspcat_mspcat_publisher_mspcat_applications_PublisherId

Many-To-One Relationship: [mspcat_applications mspcat_mspcat_publisher_mspcat_applications_PublisherId](mspcat_applications.md#BKMK_mspcat_mspcat_publisher_mspcat_applications_PublisherId)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`mspcat_publisherid`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_publisher_mspcat_applications_PublisherId`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher"></a> mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher

Many-To-One Relationship: [mspcat_certificationrequest mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher](mspcat_certificationrequest.md#BKMK_mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`mspcat_publisher`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_publisher_mspcat_publisheridentity_Publisher"></a> mspcat_mspcat_publisher_mspcat_publisheridentity_Publisher

Many-To-One Relationship: [mspcat_publisheridentity mspcat_mspcat_publisher_mspcat_publisheridentity_Publisher](mspcat_publisheridentity.md#BKMK_mspcat_mspcat_publisher_mspcat_publisheridentity_Publisher)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisheridentity`|
|ReferencingAttribute|`mspcat_publisher`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_publisher_mspcat_publisheridentity_Publisher`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_publisherusers_Publisher_mspcat_pu"></a> mspcat_mspcat_publisherusers_Publisher_mspcat_pu

Many-To-One Relationship: [mspcat_publisherusers mspcat_mspcat_publisherusers_Publisher_mspcat_pu](mspcat_publisherusers.md#BKMK_mspcat_mspcat_publisherusers_Publisher_mspcat_pu)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_publisherusers`|
|ReferencingAttribute|`mspcat_publisher`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_publisherusers_Publisher_mspcat_pu`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_ActivityPointers"></a> mspcat_publisher_ActivityPointers

Many-To-One Relationship: [activitypointer mspcat_publisher_ActivityPointers](activitypointer.md#BKMK_mspcat_publisher_ActivityPointers)

|Property|Value|
|---|---|
|ReferencingEntity|`activitypointer`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_ActivityPointers`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_adx_inviteredemptions"></a> mspcat_publisher_adx_inviteredemptions

Many-To-One Relationship: [adx_inviteredemption mspcat_publisher_adx_inviteredemptions](adx_inviteredemption.md#BKMK_mspcat_publisher_adx_inviteredemptions)

|Property|Value|
|---|---|
|ReferencingEntity|`adx_inviteredemption`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_adx_inviteredemptions`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_adx_portalcomments"></a> mspcat_publisher_adx_portalcomments

Many-To-One Relationship: [adx_portalcomment mspcat_publisher_adx_portalcomments](adx_portalcomment.md#BKMK_mspcat_publisher_adx_portalcomments)

|Property|Value|
|---|---|
|ReferencingEntity|`adx_portalcomment`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_adx_portalcomments`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_Annotations"></a> mspcat_publisher_Annotations

Many-To-One Relationship: [annotation mspcat_publisher_Annotations](annotation.md#BKMK_mspcat_publisher_Annotations)

|Property|Value|
|---|---|
|ReferencingEntity|`annotation`|
|ReferencingAttribute|`objectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_Annotations`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_Appointments"></a> mspcat_publisher_Appointments

Many-To-One Relationship: [appointment mspcat_publisher_Appointments](appointment.md#BKMK_mspcat_publisher_Appointments)

|Property|Value|
|---|---|
|ReferencingEntity|`appointment`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_Appointments`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_AsyncOperations"></a> mspcat_publisher_AsyncOperations

Many-To-One Relationship: [asyncoperation mspcat_publisher_AsyncOperations](asyncoperation.md#BKMK_mspcat_publisher_AsyncOperations)

|Property|Value|
|---|---|
|ReferencingEntity|`asyncoperation`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_AsyncOperations`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_BulkDeleteFailures"></a> mspcat_publisher_BulkDeleteFailures

Many-To-One Relationship: [bulkdeletefailure mspcat_publisher_BulkDeleteFailures](bulkdeletefailure.md#BKMK_mspcat_publisher_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencingEntity|`bulkdeletefailure`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_BulkDeleteFailures`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_chats"></a> mspcat_publisher_chats

Many-To-One Relationship: [chat mspcat_publisher_chats](chat.md#BKMK_mspcat_publisher_chats)

|Property|Value|
|---|---|
|ReferencingEntity|`chat`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_chats`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_connections1"></a> mspcat_publisher_connections1

Many-To-One Relationship: [connection mspcat_publisher_connections1](connection.md#BKMK_mspcat_publisher_connections1)

|Property|Value|
|---|---|
|ReferencingEntity|`connection`|
|ReferencingAttribute|`record1id`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_connections1`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 100<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_connections2"></a> mspcat_publisher_connections2

Many-To-One Relationship: [connection mspcat_publisher_connections2](connection.md#BKMK_mspcat_publisher_connections2)

|Property|Value|
|---|---|
|ReferencingEntity|`connection`|
|ReferencingAttribute|`record2id`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_connections2`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_DuplicateBaseRecord"></a> mspcat_publisher_DuplicateBaseRecord

Many-To-One Relationship: [duplicaterecord mspcat_publisher_DuplicateBaseRecord](duplicaterecord.md#BKMK_mspcat_publisher_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencingEntity|`duplicaterecord`|
|ReferencingAttribute|`baserecordid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_DuplicateBaseRecord`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_DuplicateMatchingRecord"></a> mspcat_publisher_DuplicateMatchingRecord

Many-To-One Relationship: [duplicaterecord mspcat_publisher_DuplicateMatchingRecord](duplicaterecord.md#BKMK_mspcat_publisher_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencingEntity|`duplicaterecord`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_DuplicateMatchingRecord`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_Emails"></a> mspcat_publisher_Emails

Many-To-One Relationship: [email mspcat_publisher_Emails](email.md#BKMK_mspcat_publisher_Emails)

|Property|Value|
|---|---|
|ReferencingEntity|`email`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_Emails`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_Faxes"></a> mspcat_publisher_Faxes

Many-To-One Relationship: [fax mspcat_publisher_Faxes](fax.md#BKMK_mspcat_publisher_Faxes)

|Property|Value|
|---|---|
|ReferencingEntity|`fax`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_Faxes`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_Letters"></a> mspcat_publisher_Letters

Many-To-One Relationship: [letter mspcat_publisher_Letters](letter.md#BKMK_mspcat_publisher_Letters)

|Property|Value|
|---|---|
|ReferencingEntity|`letter`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_Letters`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_MailboxTrackingFolders"></a> mspcat_publisher_MailboxTrackingFolders

Many-To-One Relationship: [mailboxtrackingfolder mspcat_publisher_MailboxTrackingFolders](mailboxtrackingfolder.md#BKMK_mspcat_publisher_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencingEntity|`mailboxtrackingfolder`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_MailboxTrackingFolders`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_mspcat_InstallActivities"></a> mspcat_publisher_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity mspcat_publisher_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_mspcat_publisher_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_PhoneCalls"></a> mspcat_publisher_PhoneCalls

Many-To-One Relationship: [phonecall mspcat_publisher_PhoneCalls](phonecall.md#BKMK_mspcat_publisher_PhoneCalls)

|Property|Value|
|---|---|
|ReferencingEntity|`phonecall`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_PhoneCalls`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_PrincipalObjectAttributeAccesses"></a> mspcat_publisher_PrincipalObjectAttributeAccesses

Many-To-One Relationship: [principalobjectattributeaccess mspcat_publisher_PrincipalObjectAttributeAccesses](principalobjectattributeaccess.md#BKMK_mspcat_publisher_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencingEntity|`principalobjectattributeaccess`|
|ReferencingAttribute|`objectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_PrincipalObjectAttributeAccesses`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_ProcessSession"></a> mspcat_publisher_ProcessSession

Many-To-One Relationship: [processsession mspcat_publisher_ProcessSession](processsession.md#BKMK_mspcat_publisher_ProcessSession)

|Property|Value|
|---|---|
|ReferencingEntity|`processsession`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_ProcessSession`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_RecurringAppointmentMasters"></a> mspcat_publisher_RecurringAppointmentMasters

Many-To-One Relationship: [recurringappointmentmaster mspcat_publisher_RecurringAppointmentMasters](recurringappointmentmaster.md#BKMK_mspcat_publisher_RecurringAppointmentMasters)

|Property|Value|
|---|---|
|ReferencingEntity|`recurringappointmentmaster`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_RecurringAppointmentMasters`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_SocialActivities"></a> mspcat_publisher_SocialActivities

Many-To-One Relationship: [socialactivity mspcat_publisher_SocialActivities](socialactivity.md#BKMK_mspcat_publisher_SocialActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`socialactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_SocialActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_SyncErrors"></a> mspcat_publisher_SyncErrors

Many-To-One Relationship: [syncerror mspcat_publisher_SyncErrors](syncerror.md#BKMK_mspcat_publisher_SyncErrors)

|Property|Value|
|---|---|
|ReferencingEntity|`syncerror`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_SyncErrors`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_publisher_Tasks"></a> mspcat_publisher_Tasks

Many-To-One Relationship: [task mspcat_publisher_Tasks](task.md#BKMK_mspcat_publisher_Tasks)

|Property|Value|
|---|---|
|ReferencingEntity|`task`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_publisher_Tasks`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   

