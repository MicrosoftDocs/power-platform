---
title: "Package (mspcat_packages) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Package (mspcat_packages) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Package (mspcat_packages) table/entity reference

Deployment Assets for a Catalog Item.

## Messages

The following table lists the messages for the Package (mspcat_packages) table.
Messages represent operations that can be performed on the table. They may also be events.

| Name <br />Is Event? |Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `Assign`<br />Event: True |`PATCH` /mspcat_packageses(*mspcat_packagesid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `ownerid` property. |<xref:Microsoft.Crm.Sdk.Messages.AssignRequest>|
| `Create`<br />Event: True |`POST` /mspcat_packageses<br />See [Create](/powerapps/developer/data-platform/webapi/create-entity-web-api) |[Create records](/power-apps/developer/data-platform/org-service/entity-operations-create#basic-create)|
| `CreateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.CreateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.CreateMultipleRequest>|
| `Delete`<br />Event: True |`DELETE` /mspcat_packageses(*mspcat_packagesid*)<br />See [Delete](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-delete) |[Delete records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-delete)|
| `GrantAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.GrantAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.GrantAccessRequest>|
| `IsValidStateTransition`<br />Event: False |<xref:Microsoft.Dynamics.CRM.IsValidStateTransition?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.IsValidStateTransitionRequest>|
| `ModifyAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.ModifyAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.ModifyAccessRequest>|
| `Restore`<br />Event: True |<xref:Microsoft.Dynamics.CRM.Restore?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retrieve`<br />Event: True |`GET` /mspcat_packageses(*mspcat_packagesid*)<br />See [Retrieve](/powerapps/developer/data-platform/webapi/retrieve-entity-using-web-api) |[Retrieve records](/power-apps/developer/data-platform/org-service/entity-operations-retrieve)|
| `RetrieveMultiple`<br />Event: True |`GET` /mspcat_packageses<br />See [Query data](/power-apps/developer/data-platform/webapi/query-data-web-api) |[Query data](/power-apps/developer/data-platform/org-service/entity-operations-query-data)|
| `RetrievePrincipalAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrievePrincipalAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrievePrincipalAccessRequest>|
| `RetrieveSharedPrincipalsAndAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrieveSharedPrincipalsAndAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrieveSharedPrincipalsAndAccessRequest>|
| `RevokeAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RevokeAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RevokeAccessRequest>|
| `SetState`<br />Event: True |`PATCH` /mspcat_packageses(*mspcat_packagesid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `statecode` and `statuscode` properties. |<xref:Microsoft.Crm.Sdk.Messages.SetStateRequest>|
| `Update`<br />Event: True |`PATCH` /mspcat_packageses(*mspcat_packagesid*)<br />See [Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) |[Update records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-update)|
| `UpdateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.UpdateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpdateMultipleRequest>|
| `Upsert`<br />Event: False |`PATCH` /mspcat_packageses(*mspcat_packagesid*)<br />See [Upsert a table row](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#upsert-a-table-row) |<xref:Microsoft.Xrm.Sdk.Messages.UpsertRequest>|
| `UpsertMultiple`<br />Event: False |<xref:Microsoft.Dynamics.CRM.UpsertMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpsertMultipleRequest>|


## Events

The following table lists the events for the Package (mspcat_packages) table.
Events are messages that exist so that you can subscribe to them. Unless you added the event, you shouldn't invoke the message, only subscribe to it.

|Name|Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `BulkRetain`|<xref:Microsoft.Dynamics.CRM.BulkRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `PurgeRetainedContent`|<xref:Microsoft.Dynamics.CRM.PurgeRetainedContent?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retain`|<xref:Microsoft.Dynamics.CRM.Retain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `RollbackRetain`|<xref:Microsoft.Dynamics.CRM.RollbackRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `ValidateRetentionConfig`|<xref:Microsoft.Dynamics.CRM.ValidateRetentionConfig?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|

## Properties

The following table lists selected properties for the Package (mspcat_packages) table.

|Property|Value|
| --- | --- |
| **DisplayName** | **Package** |
| **DisplayCollectionName** | **Packages** |
| **SchemaName** | `mspcat_packages` |
| **CollectionSchemaName** | `mspcat_packageses` |
| **EntitySetName** | `mspcat_packageses`|
| **LogicalName** | `mspcat_packages` |
| **LogicalCollectionName** | `mspcat_packageses` |
| **PrimaryIdAttribute** | `mspcat_packagesid` |
| **PrimaryNameAttribute** |`mspcat_name` |
| **TableType** | `Standard` |
| **OwnershipType** | `UserOwned` |

## Writable columns/attributes

These columns/attributes return true for either **IsValidForCreate** or **IsValidForUpdate** (usually both). Listed by **SchemaName**.

- [ImportSequenceNumber](#BKMK_ImportSequenceNumber)
- [mspcat_AllowPackagingCodeExecution](#BKMK_mspcat_AllowPackagingCodeExecution)
- [mspcat_applicationitemcrossreferance](#BKMK_mspcat_applicationitemcrossreferance)
- [mspcat_Available](#BKMK_mspcat_Available)
- [mspcat_CrmMaxVersion](#BKMK_mspcat_CrmMaxVersion)
- [mspcat_CrmMinVersion](#BKMK_mspcat_CrmMinVersion)
- [mspcat_CRMWorkingPackageDropPath](#BKMK_mspcat_CRMWorkingPackageDropPath)
- [mspcat_DefaultPackageLocaleId](#BKMK_mspcat_DefaultPackageLocaleId)
- [mspcat_EndDateUtc](#BKMK_mspcat_EndDateUtc)
- [mspcat_InstanceConfigurationUrl](#BKMK_mspcat_InstanceConfigurationUrl)
- [mspcat_LastSyncDate](#BKMK_mspcat_LastSyncDate)
- [mspcat_LearnMoreUrl](#BKMK_mspcat_LearnMoreUrl)
- [mspcat_name](#BKMK_mspcat_name)
- [mspcat_PackageManifestFileName](#BKMK_mspcat_PackageManifestFileName)
- [mspcat_PackageManifestUri](#BKMK_mspcat_PackageManifestUri)
- [mspcat_packagesId](#BKMK_mspcat_packagesId)
- [mspcat_PackageUri](#BKMK_mspcat_PackageUri)
- [mspcat_ProviderName](#BKMK_mspcat_ProviderName)
- [mspcat_PushedDate](#BKMK_mspcat_PushedDate)
- [mspcat_RevisionOf](#BKMK_mspcat_RevisionOf)
- [mspcat_StartDateUtc](#BKMK_mspcat_StartDateUtc)
- [mspcat_SupportedCountries](#BKMK_mspcat_SupportedCountries)
- [mspcat_TPSID](#BKMK_mspcat_TPSID)
- [mspcat_UniqueName](#BKMK_mspcat_UniqueName)
- [mspcat_Version](#BKMK_mspcat_Version)
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

### <a name="BKMK_mspcat_AllowPackagingCodeExecution"></a> mspcat_AllowPackagingCodeExecution

|Property|Value|
|---|---|
|Description|**if this is set to true, this will allow a deployment package to execute code during deployment.**|
|DisplayName|**Allow Package Code Execution**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_allowpackagingcodeexecution`|
|RequiredLevel|Recommended|
|Type|Boolean|
|GlobalChoiceName|`mspcat_packages_mspcat_allowpackagingcodeexecution`|
|DefaultValue|True|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_applicationitemcrossreferance"></a> mspcat_applicationitemcrossreferance

|Property|Value|
|---|---|
|Description|**Connects to the common catalog item record regardless of revision.**|
|DisplayName|**Catalog Item Cross Referance**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_applicationitemcrossreferance`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|mspcat_applicationreference|

### <a name="BKMK_mspcat_Available"></a> mspcat_Available

|Property|Value|
|---|---|
|Description||
|DisplayName|**Available**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_available`|
|RequiredLevel|None|
|Type|Boolean|
|GlobalChoiceName|`mspcat_packages_mspcat_available`|
|DefaultValue|False|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_CrmMaxVersion"></a> mspcat_CrmMaxVersion

|Property|Value|
|---|---|
|Description||
|DisplayName|**CrmMaxVersion**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_crmmaxversion`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|25|

### <a name="BKMK_mspcat_CrmMinVersion"></a> mspcat_CrmMinVersion

|Property|Value|
|---|---|
|Description||
|DisplayName|**CrmMinVersion**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_crmminversion`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|25|

### <a name="BKMK_mspcat_CRMWorkingPackageDropPath"></a> mspcat_CRMWorkingPackageDropPath

|Property|Value|
|---|---|
|Description|**This is the location where the package file has been dropped for working**|
|DisplayName|**CRM Working Package Drop Path**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_crmworkingpackagedroppath`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|2000|

### <a name="BKMK_mspcat_DefaultPackageLocaleId"></a> mspcat_DefaultPackageLocaleId

|Property|Value|
|---|---|
|Description||
|DisplayName|**DefaultPackageLocaleId**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_defaultpackagelocaleid`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_mspcat_EndDateUtc"></a> mspcat_EndDateUtc

|Property|Value|
|---|---|
|Description||
|DisplayName|**EndDateUtc**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_enddateutc`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|True|
|DateTimeBehavior|UserLocal|
|Format|DateAndTime|
|ImeMode|Auto|
|SourceTypeMask|0|

### <a name="BKMK_mspcat_InstanceConfigurationUrl"></a> mspcat_InstanceConfigurationUrl

|Property|Value|
|---|---|
|Description||
|DisplayName|**InstanceConfigurationUrl**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_instanceconfigurationurl`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|2500|

### <a name="BKMK_mspcat_LastSyncDate"></a> mspcat_LastSyncDate

|Property|Value|
|---|---|
|Description||
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

### <a name="BKMK_mspcat_LearnMoreUrl"></a> mspcat_LearnMoreUrl

|Property|Value|
|---|---|
|Description||
|DisplayName|**LearnMoreUrl**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_learnmoreurl`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|1024|

### <a name="BKMK_mspcat_name"></a> mspcat_name

|Property|Value|
|---|---|
|Description|**The name of the custom entity.**|
|DisplayName|**Name**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_name`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_mspcat_PackageManifestFileName"></a> mspcat_PackageManifestFileName

|Property|Value|
|---|---|
|Description||
|DisplayName|**Package Manifest File Name**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_packagemanifestfilename`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_mspcat_PackageManifestUri"></a> mspcat_PackageManifestUri

|Property|Value|
|---|---|
|Description|**URI to the package manifest.**|
|DisplayName|**Package Manifest Uri**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_packagemanifesturi`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_mspcat_packagesId"></a> mspcat_packagesId

|Property|Value|
|---|---|
|Description|**Unique identifier for entity instances**|
|DisplayName|**Packages**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_packagesid`|
|RequiredLevel|SystemRequired|
|Type|Uniqueidentifier|

### <a name="BKMK_mspcat_PackageUri"></a> mspcat_PackageUri

|Property|Value|
|---|---|
|Description||
|DisplayName|**Package Uri**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_packageuri`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|1000|

### <a name="BKMK_mspcat_ProviderName"></a> mspcat_ProviderName

|Property|Value|
|---|---|
|Description||
|DisplayName|**ProviderName**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_providername`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|250|

### <a name="BKMK_mspcat_PushedDate"></a> mspcat_PushedDate

|Property|Value|
|---|---|
|Description||
|DisplayName|**Pushed Date**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_pusheddate`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|True|
|DateTimeBehavior|UserLocal|
|Format|DateOnly|
|ImeMode|Auto|
|SourceTypeMask|0|

### <a name="BKMK_mspcat_RevisionOf"></a> mspcat_RevisionOf

|Property|Value|
|---|---|
|Description|**This field is populated when a new approval request contains a reference to an existing package version that has previously been made available**|
|DisplayName|**Revision Of**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_revisionof`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|mspcat_packages|

### <a name="BKMK_mspcat_StartDateUtc"></a> mspcat_StartDateUtc

|Property|Value|
|---|---|
|Description||
|DisplayName|**StartDateUtc**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_startdateutc`|
|RequiredLevel|Recommended|
|Type|DateTime|
|CanChangeDateTimeBehavior|True|
|DateTimeBehavior|UserLocal|
|Format|DateAndTime|
|ImeMode|Auto|
|SourceTypeMask|0|

### <a name="BKMK_mspcat_SupportedCountries"></a> mspcat_SupportedCountries

|Property|Value|
|---|---|
|Description||
|DisplayName|**SupportedCountries**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_supportedcountries`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|1024|

### <a name="BKMK_mspcat_TPSID"></a> mspcat_TPSID

|Property|Value|
|---|---|
|Description|**ID of the record in TPS**|
|DisplayName|**TPS ID**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_tpsid`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|50|

### <a name="BKMK_mspcat_UniqueName"></a> mspcat_UniqueName

|Property|Value|
|---|---|
|Description||
|DisplayName|**UniqueName**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_uniquename`|
|RequiredLevel|ApplicationRequired|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|150|

### <a name="BKMK_mspcat_Version"></a> mspcat_Version

|Property|Value|
|---|---|
|Description||
|DisplayName|**Version**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_version`|
|RequiredLevel|ApplicationRequired|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|25|

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
|Description|**Status of the Packages**|
|DisplayName|**Status**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statecode`|
|RequiredLevel|SystemRequired|
|Type|State|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_packages_statecode`|

#### statecode Choices/Options

|Value|Details|
|---|---|
|0|Label: **Active**<br />DefaultStatus: 3<br />InvariantName: `Active`|
|1|Label: **Inactive**<br />DefaultStatus: 2<br />InvariantName: `Inactive`|

### <a name="BKMK_statuscode"></a> statuscode

|Property|Value|
|---|---|
|Description|**Reason for the status of the Packages**|
|DisplayName|**Status Reason**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statuscode`|
|RequiredLevel|None|
|Type|Status|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_packages_statuscode`|

#### statuscode Choices/Options

|Value|Details|
|---|---|
|1|Label: **Available**<br />State:0<br />TransitionData: None|
|2|Label: **Inactive**<br />State:1<br />TransitionData: None|
|3|Label: **Draft**<br />State:0<br />TransitionData: None|
|526430000|Label: **Pending Approval**<br />State:0<br />TransitionData: None|
|526430001|Label: **Rejected**<br />State:1<br />TransitionData: None|
|526430002|Label: **Published**<br />State:0<br />TransitionData: None|

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
- [mspcat_PackageFile](#BKMK_mspcat_PackageFile)
- [mspcat_PackageFile_Name](#BKMK_mspcat_PackageFile_Name)
- [mspcat_PackageManifestFile](#BKMK_mspcat_PackageManifestFile)
- [mspcat_PackageManifestFile_Name](#BKMK_mspcat_PackageManifestFile_Name)
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

### <a name="BKMK_mspcat_PackageFile"></a> mspcat_PackageFile

|Property|Value|
|---|---|
|Description|**Package File to be installed.**|
|DisplayName|**Package File**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_packagefile`|
|RequiredLevel|Recommended|
|Type|File|
|MaxSizeInKB|128000|

### <a name="BKMK_mspcat_PackageFile_Name"></a> mspcat_PackageFile_Name

|Property|Value|
|---|---|
|Description||
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_packagefile_name`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Disabled|
|IsLocalizable|False|
|MaxLength|200|

### <a name="BKMK_mspcat_PackageManifestFile"></a> mspcat_PackageManifestFile

|Property|Value|
|---|---|
|Description|**Manifest File from the package.**|
|DisplayName|**Package Manifest File**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_packagemanifestfile`|
|RequiredLevel|Recommended|
|Type|File|
|MaxSizeInKB|128000|

### <a name="BKMK_mspcat_PackageManifestFile_Name"></a> mspcat_PackageManifestFile_Name

|Property|Value|
|---|---|
|Description||
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_packagemanifestfile_name`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Disabled|
|IsLocalizable|False|
|MaxLength|200|

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

- [business_unit_mspcat_packages](#BKMK_business_unit_mspcat_packages)
- [FileAttachment_mspcat_packages_mspcat_PackageFile](#BKMK_FileAttachment_mspcat_packages_mspcat_PackageFile)
- [FileAttachment_mspcat_packages_mspcat_PackageManifestFile](#BKMK_FileAttachment_mspcat_packages_mspcat_PackageManifestFile)
- [lk_mspcat_packages_createdby](#BKMK_lk_mspcat_packages_createdby)
- [lk_mspcat_packages_createdonbehalfby](#BKMK_lk_mspcat_packages_createdonbehalfby)
- [lk_mspcat_packages_modifiedby](#BKMK_lk_mspcat_packages_modifiedby)
- [lk_mspcat_packages_modifiedonbehalfby](#BKMK_lk_mspcat_packages_modifiedonbehalfby)
- [mspcat_mspcat_packages_applicationitemcrossrefer](#BKMK_mspcat_mspcat_packages_applicationitemcrossrefer)
- [mspcat_mspcat_packages_RevisionOf_mspcat_package](#BKMK_mspcat_mspcat_packages_RevisionOf_mspcat_package-many-to-one)
- [owner_mspcat_packages](#BKMK_owner_mspcat_packages)
- [team_mspcat_packages](#BKMK_team_mspcat_packages)
- [user_mspcat_packages](#BKMK_user_mspcat_packages)

### <a name="BKMK_business_unit_mspcat_packages"></a> business_unit_mspcat_packages

One-To-Many Relationship: [businessunit business_unit_mspcat_packages](businessunit.md#BKMK_business_unit_mspcat_packages)

|Property|Value|
|---|---|
|ReferencedEntity|`businessunit`|
|ReferencedAttribute|`businessunitid`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencingEntityNavigationPropertyName|`owningbusinessunit`|
|IsHierarchical||
|CascadeConfiguration|Archive: `Restrict`<br />Assign: `NoCascade`<br />Delete: `Restrict`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_FileAttachment_mspcat_packages_mspcat_PackageFile"></a> FileAttachment_mspcat_packages_mspcat_PackageFile

One-To-Many Relationship: [fileattachment FileAttachment_mspcat_packages_mspcat_PackageFile](fileattachment.md#BKMK_FileAttachment_mspcat_packages_mspcat_PackageFile)

|Property|Value|
|---|---|
|ReferencedEntity|`fileattachment`|
|ReferencedAttribute|`fileattachmentid`|
|ReferencingAttribute|`mspcat_packagefile`|
|ReferencingEntityNavigationPropertyName|`mspcat_packagefile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `RemoveLink`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_FileAttachment_mspcat_packages_mspcat_PackageManifestFile"></a> FileAttachment_mspcat_packages_mspcat_PackageManifestFile

One-To-Many Relationship: [fileattachment FileAttachment_mspcat_packages_mspcat_PackageManifestFile](fileattachment.md#BKMK_FileAttachment_mspcat_packages_mspcat_PackageManifestFile)

|Property|Value|
|---|---|
|ReferencedEntity|`fileattachment`|
|ReferencedAttribute|`fileattachmentid`|
|ReferencingAttribute|`mspcat_packagemanifestfile`|
|ReferencingEntityNavigationPropertyName|`mspcat_packagemanifestfile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `RemoveLink`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_packages_createdby"></a> lk_mspcat_packages_createdby

One-To-Many Relationship: [systemuser lk_mspcat_packages_createdby](systemuser.md#BKMK_lk_mspcat_packages_createdby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`createdby`|
|ReferencingEntityNavigationPropertyName|`createdby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_packages_createdonbehalfby"></a> lk_mspcat_packages_createdonbehalfby

One-To-Many Relationship: [systemuser lk_mspcat_packages_createdonbehalfby](systemuser.md#BKMK_lk_mspcat_packages_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencingEntityNavigationPropertyName|`createdonbehalfby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_packages_modifiedby"></a> lk_mspcat_packages_modifiedby

One-To-Many Relationship: [systemuser lk_mspcat_packages_modifiedby](systemuser.md#BKMK_lk_mspcat_packages_modifiedby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`modifiedby`|
|ReferencingEntityNavigationPropertyName|`modifiedby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_packages_modifiedonbehalfby"></a> lk_mspcat_packages_modifiedonbehalfby

One-To-Many Relationship: [systemuser lk_mspcat_packages_modifiedonbehalfby](systemuser.md#BKMK_lk_mspcat_packages_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencingEntityNavigationPropertyName|`modifiedonbehalfby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_mspcat_packages_applicationitemcrossrefer"></a> mspcat_mspcat_packages_applicationitemcrossrefer

One-To-Many Relationship: [mspcat_applicationreference mspcat_mspcat_packages_applicationitemcrossrefer](mspcat_applicationreference.md#BKMK_mspcat_mspcat_packages_applicationitemcrossrefer)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applicationreference`|
|ReferencedAttribute|`mspcat_applicationreferenceid`|
|ReferencingAttribute|`mspcat_applicationitemcrossreferance`|
|ReferencingEntityNavigationPropertyName|`mspcat_applicationitemcrossreferance`|
|IsHierarchical||
|CascadeConfiguration|Archive: `RemoveLink`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_mspcat_packages_RevisionOf_mspcat_package-many-to-one"></a> mspcat_mspcat_packages_RevisionOf_mspcat_package

One-To-Many Relationship: [mspcat_packages mspcat_mspcat_packages_RevisionOf_mspcat_package](#BKMK_mspcat_mspcat_packages_RevisionOf_mspcat_package-one-to-many)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`mspcat_revisionof`|
|ReferencingEntityNavigationPropertyName|`mspcat_RevisionOf`|
|IsHierarchical||
|CascadeConfiguration|Archive: `RemoveLink`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_owner_mspcat_packages"></a> owner_mspcat_packages

One-To-Many Relationship: [owner owner_mspcat_packages](owner.md#BKMK_owner_mspcat_packages)

|Property|Value|
|---|---|
|ReferencedEntity|`owner`|
|ReferencedAttribute|`ownerid`|
|ReferencingAttribute|`ownerid`|
|ReferencingEntityNavigationPropertyName|`ownerid`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_team_mspcat_packages"></a> team_mspcat_packages

One-To-Many Relationship: [team team_mspcat_packages](team.md#BKMK_team_mspcat_packages)

|Property|Value|
|---|---|
|ReferencedEntity|`team`|
|ReferencedAttribute|`teamid`|
|ReferencingAttribute|`owningteam`|
|ReferencingEntityNavigationPropertyName|`owningteam`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_user_mspcat_packages"></a> user_mspcat_packages

One-To-Many Relationship: [systemuser user_mspcat_packages](systemuser.md#BKMK_user_mspcat_packages)

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

- [mspcat_mspcat_applications_PackageAsset_mspcat_p](#BKMK_mspcat_mspcat_applications_PackageAsset_mspcat_p)
- [mspcat_mspcat_installhistory_Package_mspcat_pack](#BKMK_mspcat_mspcat_installhistory_Package_mspcat_pack)
- [mspcat_mspcat_packages_mspcat_packagelocales_PackageId](#BKMK_mspcat_mspcat_packages_mspcat_packagelocales_PackageId)
- [mspcat_mspcat_packages_RevisionOf_mspcat_package](#BKMK_mspcat_mspcat_packages_RevisionOf_mspcat_package-one-to-many)
- [mspcat_mspcat_packagesolutions_Package_mspcat_pa](#BKMK_mspcat_mspcat_packagesolutions_Package_mspcat_pa)
- [mspcat_packages_ActivityPointers](#BKMK_mspcat_packages_ActivityPointers)
- [mspcat_packages_adx_inviteredemptions](#BKMK_mspcat_packages_adx_inviteredemptions)
- [mspcat_packages_adx_portalcomments](#BKMK_mspcat_packages_adx_portalcomments)
- [mspcat_packages_Annotations](#BKMK_mspcat_packages_Annotations)
- [mspcat_packages_Appointments](#BKMK_mspcat_packages_Appointments)
- [mspcat_packages_AsyncOperations](#BKMK_mspcat_packages_AsyncOperations)
- [mspcat_packages_BulkDeleteFailures](#BKMK_mspcat_packages_BulkDeleteFailures)
- [mspcat_packages_chats](#BKMK_mspcat_packages_chats)
- [mspcat_packages_connections1](#BKMK_mspcat_packages_connections1)
- [mspcat_packages_connections2](#BKMK_mspcat_packages_connections2)
- [mspcat_packages_DuplicateBaseRecord](#BKMK_mspcat_packages_DuplicateBaseRecord)
- [mspcat_packages_DuplicateMatchingRecord](#BKMK_mspcat_packages_DuplicateMatchingRecord)
- [mspcat_packages_Emails](#BKMK_mspcat_packages_Emails)
- [mspcat_packages_Faxes](#BKMK_mspcat_packages_Faxes)
- [mspcat_packages_Feedback](#BKMK_mspcat_packages_Feedback)
- [mspcat_packages_FileAttachments](#BKMK_mspcat_packages_FileAttachments)
- [mspcat_packages_Letters](#BKMK_mspcat_packages_Letters)
- [mspcat_packages_MailboxTrackingFolders](#BKMK_mspcat_packages_MailboxTrackingFolders)
- [mspcat_packages_mspcat_InstallActivities](#BKMK_mspcat_packages_mspcat_InstallActivities)
- [mspcat_packages_PhoneCalls](#BKMK_mspcat_packages_PhoneCalls)
- [mspcat_packages_PrincipalObjectAttributeAccesses](#BKMK_mspcat_packages_PrincipalObjectAttributeAccesses)
- [mspcat_packages_ProcessSession](#BKMK_mspcat_packages_ProcessSession)
- [mspcat_packages_RecurringAppointmentMasters](#BKMK_mspcat_packages_RecurringAppointmentMasters)
- [mspcat_packages_SocialActivities](#BKMK_mspcat_packages_SocialActivities)
- [mspcat_packages_SyncErrors](#BKMK_mspcat_packages_SyncErrors)
- [mspcat_packages_Tasks](#BKMK_mspcat_packages_Tasks)

### <a name="BKMK_mspcat_mspcat_applications_PackageAsset_mspcat_p"></a> mspcat_mspcat_applications_PackageAsset_mspcat_p

Many-To-One Relationship: [mspcat_applications mspcat_mspcat_applications_PackageAsset_mspcat_p](mspcat_applications.md#BKMK_mspcat_mspcat_applications_PackageAsset_mspcat_p)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_applications`|
|ReferencingAttribute|`mspcat_packageasset`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_applications_PackageAsset_mspcat_p`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_installhistory_Package_mspcat_pack"></a> mspcat_mspcat_installhistory_Package_mspcat_pack

Many-To-One Relationship: [mspcat_installhistory mspcat_mspcat_installhistory_Package_mspcat_pack](mspcat_installhistory.md#BKMK_mspcat_mspcat_installhistory_Package_mspcat_pack)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`mspcat_package`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_installhistory_Package_mspcat_pack`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_packages_mspcat_packagelocales_PackageId"></a> mspcat_mspcat_packages_mspcat_packagelocales_PackageId

Many-To-One Relationship: [mspcat_packagelocales mspcat_mspcat_packages_mspcat_packagelocales_PackageId](mspcat_packagelocales.md#BKMK_mspcat_mspcat_packages_mspcat_packagelocales_PackageId)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagelocales`|
|ReferencingAttribute|`mspcat_packageid`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_packages_mspcat_packagelocales_PackageId`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_packages_RevisionOf_mspcat_package-one-to-many"></a> mspcat_mspcat_packages_RevisionOf_mspcat_package

Many-To-One Relationship: [mspcat_packages mspcat_mspcat_packages_RevisionOf_mspcat_package](#BKMK_mspcat_mspcat_packages_RevisionOf_mspcat_package-many-to-one)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packages`|
|ReferencingAttribute|`mspcat_revisionof`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_packages_RevisionOf_mspcat_package`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_packagesolutions_Package_mspcat_pa"></a> mspcat_mspcat_packagesolutions_Package_mspcat_pa

Many-To-One Relationship: [mspcat_packagesolutions mspcat_mspcat_packagesolutions_Package_mspcat_pa](mspcat_packagesolutions.md#BKMK_mspcat_mspcat_packagesolutions_Package_mspcat_pa)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packagesolutions`|
|ReferencingAttribute|`mspcat_package`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_packagesolutions_Package_mspcat_pa`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_ActivityPointers"></a> mspcat_packages_ActivityPointers

Many-To-One Relationship: [activitypointer mspcat_packages_ActivityPointers](activitypointer.md#BKMK_mspcat_packages_ActivityPointers)

|Property|Value|
|---|---|
|ReferencingEntity|`activitypointer`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_ActivityPointers`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_adx_inviteredemptions"></a> mspcat_packages_adx_inviteredemptions

Many-To-One Relationship: [adx_inviteredemption mspcat_packages_adx_inviteredemptions](adx_inviteredemption.md#BKMK_mspcat_packages_adx_inviteredemptions)

|Property|Value|
|---|---|
|ReferencingEntity|`adx_inviteredemption`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_adx_inviteredemptions`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_adx_portalcomments"></a> mspcat_packages_adx_portalcomments

Many-To-One Relationship: [adx_portalcomment mspcat_packages_adx_portalcomments](adx_portalcomment.md#BKMK_mspcat_packages_adx_portalcomments)

|Property|Value|
|---|---|
|ReferencingEntity|`adx_portalcomment`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_adx_portalcomments`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_Annotations"></a> mspcat_packages_Annotations

Many-To-One Relationship: [annotation mspcat_packages_Annotations](annotation.md#BKMK_mspcat_packages_Annotations)

|Property|Value|
|---|---|
|ReferencingEntity|`annotation`|
|ReferencingAttribute|`objectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_Annotations`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_Appointments"></a> mspcat_packages_Appointments

Many-To-One Relationship: [appointment mspcat_packages_Appointments](appointment.md#BKMK_mspcat_packages_Appointments)

|Property|Value|
|---|---|
|ReferencingEntity|`appointment`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_Appointments`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_AsyncOperations"></a> mspcat_packages_AsyncOperations

Many-To-One Relationship: [asyncoperation mspcat_packages_AsyncOperations](asyncoperation.md#BKMK_mspcat_packages_AsyncOperations)

|Property|Value|
|---|---|
|ReferencingEntity|`asyncoperation`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_AsyncOperations`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_BulkDeleteFailures"></a> mspcat_packages_BulkDeleteFailures

Many-To-One Relationship: [bulkdeletefailure mspcat_packages_BulkDeleteFailures](bulkdeletefailure.md#BKMK_mspcat_packages_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencingEntity|`bulkdeletefailure`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_BulkDeleteFailures`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_chats"></a> mspcat_packages_chats

Many-To-One Relationship: [chat mspcat_packages_chats](chat.md#BKMK_mspcat_packages_chats)

|Property|Value|
|---|---|
|ReferencingEntity|`chat`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_chats`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_connections1"></a> mspcat_packages_connections1

Many-To-One Relationship: [connection mspcat_packages_connections1](connection.md#BKMK_mspcat_packages_connections1)

|Property|Value|
|---|---|
|ReferencingEntity|`connection`|
|ReferencingAttribute|`record1id`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_connections1`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 100<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_connections2"></a> mspcat_packages_connections2

Many-To-One Relationship: [connection mspcat_packages_connections2](connection.md#BKMK_mspcat_packages_connections2)

|Property|Value|
|---|---|
|ReferencingEntity|`connection`|
|ReferencingAttribute|`record2id`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_connections2`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_DuplicateBaseRecord"></a> mspcat_packages_DuplicateBaseRecord

Many-To-One Relationship: [duplicaterecord mspcat_packages_DuplicateBaseRecord](duplicaterecord.md#BKMK_mspcat_packages_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencingEntity|`duplicaterecord`|
|ReferencingAttribute|`baserecordid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_DuplicateBaseRecord`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_DuplicateMatchingRecord"></a> mspcat_packages_DuplicateMatchingRecord

Many-To-One Relationship: [duplicaterecord mspcat_packages_DuplicateMatchingRecord](duplicaterecord.md#BKMK_mspcat_packages_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencingEntity|`duplicaterecord`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_DuplicateMatchingRecord`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_Emails"></a> mspcat_packages_Emails

Many-To-One Relationship: [email mspcat_packages_Emails](email.md#BKMK_mspcat_packages_Emails)

|Property|Value|
|---|---|
|ReferencingEntity|`email`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_Emails`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_Faxes"></a> mspcat_packages_Faxes

Many-To-One Relationship: [fax mspcat_packages_Faxes](fax.md#BKMK_mspcat_packages_Faxes)

|Property|Value|
|---|---|
|ReferencingEntity|`fax`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_Faxes`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_Feedback"></a> mspcat_packages_Feedback

Many-To-One Relationship: [feedback mspcat_packages_Feedback](feedback.md#BKMK_mspcat_packages_Feedback)

|Property|Value|
|---|---|
|ReferencingEntity|`feedback`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_Feedback`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 150<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_FileAttachments"></a> mspcat_packages_FileAttachments

Many-To-One Relationship: [fileattachment mspcat_packages_FileAttachments](fileattachment.md#BKMK_mspcat_packages_FileAttachments)

|Property|Value|
|---|---|
|ReferencingEntity|`fileattachment`|
|ReferencingAttribute|`objectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_FileAttachments`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_Letters"></a> mspcat_packages_Letters

Many-To-One Relationship: [letter mspcat_packages_Letters](letter.md#BKMK_mspcat_packages_Letters)

|Property|Value|
|---|---|
|ReferencingEntity|`letter`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_Letters`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_MailboxTrackingFolders"></a> mspcat_packages_MailboxTrackingFolders

Many-To-One Relationship: [mailboxtrackingfolder mspcat_packages_MailboxTrackingFolders](mailboxtrackingfolder.md#BKMK_mspcat_packages_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencingEntity|`mailboxtrackingfolder`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_MailboxTrackingFolders`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_mspcat_InstallActivities"></a> mspcat_packages_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity mspcat_packages_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_mspcat_packages_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_PhoneCalls"></a> mspcat_packages_PhoneCalls

Many-To-One Relationship: [phonecall mspcat_packages_PhoneCalls](phonecall.md#BKMK_mspcat_packages_PhoneCalls)

|Property|Value|
|---|---|
|ReferencingEntity|`phonecall`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_PhoneCalls`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_PrincipalObjectAttributeAccesses"></a> mspcat_packages_PrincipalObjectAttributeAccesses

Many-To-One Relationship: [principalobjectattributeaccess mspcat_packages_PrincipalObjectAttributeAccesses](principalobjectattributeaccess.md#BKMK_mspcat_packages_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencingEntity|`principalobjectattributeaccess`|
|ReferencingAttribute|`objectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_PrincipalObjectAttributeAccesses`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_ProcessSession"></a> mspcat_packages_ProcessSession

Many-To-One Relationship: [processsession mspcat_packages_ProcessSession](processsession.md#BKMK_mspcat_packages_ProcessSession)

|Property|Value|
|---|---|
|ReferencingEntity|`processsession`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_ProcessSession`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_RecurringAppointmentMasters"></a> mspcat_packages_RecurringAppointmentMasters

Many-To-One Relationship: [recurringappointmentmaster mspcat_packages_RecurringAppointmentMasters](recurringappointmentmaster.md#BKMK_mspcat_packages_RecurringAppointmentMasters)

|Property|Value|
|---|---|
|ReferencingEntity|`recurringappointmentmaster`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_RecurringAppointmentMasters`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_SocialActivities"></a> mspcat_packages_SocialActivities

Many-To-One Relationship: [socialactivity mspcat_packages_SocialActivities](socialactivity.md#BKMK_mspcat_packages_SocialActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`socialactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_SocialActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_SyncErrors"></a> mspcat_packages_SyncErrors

Many-To-One Relationship: [syncerror mspcat_packages_SyncErrors](syncerror.md#BKMK_mspcat_packages_SyncErrors)

|Property|Value|
|---|---|
|ReferencingEntity|`syncerror`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_SyncErrors`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_packages_Tasks"></a> mspcat_packages_Tasks

Many-To-One Relationship: [task mspcat_packages_Tasks](task.md#BKMK_mspcat_packages_Tasks)

|Property|Value|
|---|---|
|ReferencingEntity|`task`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_packages_Tasks`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|


## Many-to-Many relationships

These relationships are many-to-many. Listed by **SchemaName**.

- [mspcat_attachedpackages](#BKMK_mspcat_attachedpackages)
- [mspcat_mspcat_packages_mspcat_applications](#BKMK_mspcat_mspcat_packages_mspcat_applications)

### <a name="BKMK_mspcat_attachedpackages"></a> mspcat_attachedpackages

See [mspcat_certificationrequest mspcat_attachedpackages Many-To-Many Relationship](mspcat_certificationrequest.md#BKMK_mspcat_attachedpackages)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_certreq_package_association`|
|IsCustomizable|True|
|SchemaName|`mspcat_attachedpackages`|
|IntersectAttribute|`mspcat_packagesid`|
|NavigationPropertyName|`mspcat_attachedpackages`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseLabel`<br />Group: `Details`<br />Label: Attached packages<br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_packages_mspcat_applications"></a> mspcat_mspcat_packages_mspcat_applications

See [mspcat_applications mspcat_mspcat_packages_mspcat_applications Many-To-Many Relationship](mspcat_applications.md#BKMK_mspcat_mspcat_packages_mspcat_applications)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_mspcat_packages_mspcat_applications`|
|IsCustomizable|True|
|SchemaName|`mspcat_mspcat_packages_mspcat_applications`|
|IntersectAttribute|`mspcat_packagesid`|
|NavigationPropertyName|`mspcat_mspcat_packages_mspcat_applications`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   

