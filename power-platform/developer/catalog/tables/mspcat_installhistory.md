---
title: "Install History (mspcat_InstallHistory) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Install History (mspcat_InstallHistory) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Install History (mspcat_InstallHistory) table/entity reference

Contains record of installations and their status

## Messages

The following table lists the messages for the Install History (mspcat_InstallHistory) table.
Messages represent operations that can be performed on the table. They may also be events.

| Name <br />Is Event? |Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `Assign`<br />Event: True |`PATCH` /mspcat_installhistories(*mspcat_installhistoryid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `ownerid` property. |<xref:Microsoft.Crm.Sdk.Messages.AssignRequest>|
| `Create`<br />Event: True |`POST` /mspcat_installhistories<br />See [Create](/powerapps/developer/data-platform/webapi/create-entity-web-api) |[Create records](/power-apps/developer/data-platform/org-service/entity-operations-create#basic-create)|
| `CreateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.CreateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.CreateMultipleRequest>|
| `Delete`<br />Event: True |`DELETE` /mspcat_installhistories(*mspcat_installhistoryid*)<br />See [Delete](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-delete) |[Delete records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-delete)|
| `GrantAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.GrantAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.GrantAccessRequest>|
| `IsValidStateTransition`<br />Event: False |<xref:Microsoft.Dynamics.CRM.IsValidStateTransition?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.IsValidStateTransitionRequest>|
| `ModifyAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.ModifyAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.ModifyAccessRequest>|
| `Retrieve`<br />Event: True |`GET` /mspcat_installhistories(*mspcat_installhistoryid*)<br />See [Retrieve](/powerapps/developer/data-platform/webapi/retrieve-entity-using-web-api) |[Retrieve records](/power-apps/developer/data-platform/org-service/entity-operations-retrieve)|
| `RetrieveMultiple`<br />Event: True |`GET` /mspcat_installhistories<br />See [Query data](/power-apps/developer/data-platform/webapi/query-data-web-api) |[Query data](/power-apps/developer/data-platform/org-service/entity-operations-query-data)|
| `RetrievePrincipalAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrievePrincipalAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrievePrincipalAccessRequest>|
| `RetrieveSharedPrincipalsAndAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrieveSharedPrincipalsAndAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrieveSharedPrincipalsAndAccessRequest>|
| `RevokeAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RevokeAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RevokeAccessRequest>|
| `SetState`<br />Event: True |`PATCH` /mspcat_installhistories(*mspcat_installhistoryid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `statecode` and `statuscode` properties. |<xref:Microsoft.Crm.Sdk.Messages.SetStateRequest>|
| `Update`<br />Event: True |`PATCH` /mspcat_installhistories(*mspcat_installhistoryid*)<br />See [Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) |[Update records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-update)|
| `UpdateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.UpdateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpdateMultipleRequest>|
| `Upsert`<br />Event: False |`PATCH` /mspcat_installhistories(*mspcat_installhistoryid*)<br />See [Upsert a table row](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#upsert-a-table-row) |<xref:Microsoft.Xrm.Sdk.Messages.UpsertRequest>|
| `UpsertMultiple`<br />Event: False |<xref:Microsoft.Dynamics.CRM.UpsertMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpsertMultipleRequest>|


## Events

The following table lists the events for the Install History (mspcat_InstallHistory) table.
Events are messages that exist so that you can subscribe to them. Unless you added the event, you shouldn't invoke the message, only subscribe to it.

|Name|Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `BulkRetain`|<xref:Microsoft.Dynamics.CRM.BulkRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `PurgeRetainedContent`|<xref:Microsoft.Dynamics.CRM.PurgeRetainedContent?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retain`|<xref:Microsoft.Dynamics.CRM.Retain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `RollbackRetain`|<xref:Microsoft.Dynamics.CRM.RollbackRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `ValidateRetentionConfig`|<xref:Microsoft.Dynamics.CRM.ValidateRetentionConfig?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|

## Properties

The following table lists selected properties for the Install History (mspcat_InstallHistory) table.

|Property|Value|
| --- | --- |
| **DisplayName** | **Install History** |
| **DisplayCollectionName** | **Install Histories** |
| **SchemaName** | `mspcat_InstallHistory` |
| **CollectionSchemaName** | `mspcat_InstallHistories` |
| **EntitySetName** | `mspcat_installhistories`|
| **LogicalName** | `mspcat_installhistory` |
| **LogicalCollectionName** | `mspcat_installhistories` |
| **PrimaryIdAttribute** | `mspcat_installhistoryid` |
| **PrimaryNameAttribute** |`mspcat_deploymentname` |
| **TableType** | `Standard` |
| **OwnershipType** | `UserOwned` |

## Writable columns/attributes

These columns/attributes return true for either **IsValidForCreate** or **IsValidForUpdate** (usually both). Listed by **SchemaName**.

- [ImportSequenceNumber](#BKMK_ImportSequenceNumber)
- [mspcat_CatalogItem](#BKMK_mspcat_CatalogItem)
- [mspcat_DeploymentName](#BKMK_mspcat_DeploymentName)
- [mspcat_EnvironmentUrl](#BKMK_mspcat_EnvironmentUrl)
- [mspcat_InstallHistoryId](#BKMK_mspcat_InstallHistoryId)
- [mspcat_OperationId](#BKMK_mspcat_OperationId)
- [mspcat_OrganizationId](#BKMK_mspcat_OrganizationId)
- [mspcat_Package](#BKMK_mspcat_Package)
- [mspcat_Publisher](#BKMK_mspcat_Publisher)
- [mspcat_RequestingUser](#BKMK_mspcat_RequestingUser)
- [mspcat_Settings](#BKMK_mspcat_Settings)
- [mspcat_StatusMessage](#BKMK_mspcat_StatusMessage)
- [mspcat_TemplateSuffixId](#BKMK_mspcat_TemplateSuffixId)
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

### <a name="BKMK_mspcat_CatalogItem"></a> mspcat_CatalogItem

|Property|Value|
|---|---|
|Description|**Catalog Item that this package was associated to**|
|DisplayName|**Catalog Item**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_catalogitem`|
|RequiredLevel|ApplicationRequired|
|Type|Lookup|
|Targets|mspcat_applications|

### <a name="BKMK_mspcat_DeploymentName"></a> mspcat_DeploymentName

|Property|Value|
|---|---|
|Description|**Descriptive Name of the Install, Built from Application Name, package unique name , Instance ID**|
|DisplayName|**Deployment Name**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_deploymentname`|
|RequiredLevel|ApplicationRequired|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|200|

### <a name="BKMK_mspcat_EnvironmentUrl"></a> mspcat_EnvironmentUrl

|Property|Value|
|---|---|
|Description|**URL of the environment where this catalog item was installed**|
|DisplayName|**Environment Url**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_environmenturl`|
|RequiredLevel|ApplicationRequired|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|500|

### <a name="BKMK_mspcat_InstallHistoryId"></a> mspcat_InstallHistoryId

|Property|Value|
|---|---|
|Description|**Unique identifier for entity instances**|
|DisplayName|**Install History**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_installhistoryid`|
|RequiredLevel|SystemRequired|
|Type|Uniqueidentifier|

### <a name="BKMK_mspcat_OperationId"></a> mspcat_OperationId

|Property|Value|
|---|---|
|Description|**Id used by the deployment system to track the install.**|
|DisplayName|**Operation Id**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_operationid`|
|RequiredLevel|ApplicationRequired|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|40|

### <a name="BKMK_mspcat_OrganizationId"></a> mspcat_OrganizationId

|Property|Value|
|---|---|
|Description|**ID of the organization that this install was run against.**|
|DisplayName|**Organization Id**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_organizationid`|
|RequiredLevel|ApplicationRequired|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|40|

### <a name="BKMK_mspcat_Package"></a> mspcat_Package

|Property|Value|
|---|---|
|Description|**Package Deployed**|
|DisplayName|**Package**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_package`|
|RequiredLevel|ApplicationRequired|
|Type|Lookup|
|Targets|mspcat_packages|

### <a name="BKMK_mspcat_Publisher"></a> mspcat_Publisher

|Property|Value|
|---|---|
|Description|**Publisher who owns this Catalog Item**|
|DisplayName|**Publisher**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_publisher`|
|RequiredLevel|ApplicationRequired|
|Type|Lookup|
|Targets|mspcat_publisher|

### <a name="BKMK_mspcat_RequestingUser"></a> mspcat_RequestingUser

|Property|Value|
|---|---|
|Description|**User that Requested the Install**|
|DisplayName|**Requesting User**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_requestinguser`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|systemuser|

### <a name="BKMK_mspcat_Settings"></a> mspcat_Settings

|Property|Value|
|---|---|
|Description|**Deployment Settings Included with this Install request.**|
|DisplayName|**Settings**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_settings`|
|RequiredLevel|None|
|Type|Memo|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|400000|

### <a name="BKMK_mspcat_StatusMessage"></a> mspcat_StatusMessage

|Property|Value|
|---|---|
|Description|**Status Message associated with this install**|
|DisplayName|**Status Message**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_statusmessage`|
|RequiredLevel|None|
|Type|Memo|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|4000|

### <a name="BKMK_mspcat_TemplateSuffixId"></a> mspcat_TemplateSuffixId

|Property|Value|
|---|---|
|Description|**This is the suffix id assigned to components created by the template deployment.**|
|DisplayName|**Template Suffix Id**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_templatesuffixid`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|15|

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
|Description|**Status of the Install History**|
|DisplayName|**Status**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statecode`|
|RequiredLevel|SystemRequired|
|Type|State|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_installhistory_statecode`|

#### statecode Choices/Options

|Value|Details|
|---|---|
|0|Label: **Active**<br />DefaultStatus: 1<br />InvariantName: `Active`|
|1|Label: **Inactive**<br />DefaultStatus: 2<br />InvariantName: `Inactive`|

### <a name="BKMK_statuscode"></a> statuscode

|Property|Value|
|---|---|
|Description|**Reason for the status of the Install History**|
|DisplayName|**Status Reason**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statuscode`|
|RequiredLevel|None|
|Type|Status|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_installhistory_statuscode`|

#### statuscode Choices/Options

|Value|Details|
|---|---|
|1|Label: **Requested**<br />State:0<br />TransitionData:<br />`<allowedtransitions xmlns="http://schemas.microsoft.com/crm/2009/WebServices"><allowedtransition sourcestatusid="1" tostatusid="526430003" /><allowedtransition sourcestatusid="1" tostatusid="526430002" /><allowedtransition sourcestatusid="1" tostatusid="2" /><allowedtransition sourcestatusid="1" tostatusid="526430004" /><allowedtransition sourcestatusid="1" tostatusid="526430001" /></allowedtransitions>`|
|2|Label: **Inactive**<br />State:1<br />TransitionData: None|
|526430001|Label: **Pending**<br />State:0<br />TransitionData:<br />`<allowedtransitions xmlns="http://schemas.microsoft.com/crm/2009/WebServices"><allowedtransition sourcestatusid="526430001" tostatusid="526430003" /><allowedtransition sourcestatusid="526430001" tostatusid="526430004" /><allowedtransition sourcestatusid="526430001" tostatusid="526430002" /><allowedtransition sourcestatusid="526430001" tostatusid="2" /></allowedtransitions>`|
|526430002|Label: **In Progress**<br />State:0<br />TransitionData:<br />`<allowedtransitions xmlns="http://schemas.microsoft.com/crm/2009/WebServices"><allowedtransition sourcestatusid="526430002" tostatusid="526430003" /><allowedtransition sourcestatusid="526430002" tostatusid="526430004" /><allowedtransition sourcestatusid="526430002" tostatusid="2" /></allowedtransitions>`|
|526430003|Label: **Completed**<br />State:1<br />TransitionData: None|
|526430004|Label: **Failed**<br />State:1<br />TransitionData: None|

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
- [mspcat_DeploymentLogFile](#BKMK_mspcat_DeploymentLogFile)
- [mspcat_DeploymentLogFile_Name](#BKMK_mspcat_DeploymentLogFile_Name)
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

### <a name="BKMK_mspcat_DeploymentLogFile"></a> mspcat_DeploymentLogFile

|Property|Value|
|---|---|
|Description|**Log file generated by the deployment operation**|
|DisplayName|**Deployment Log File**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_deploymentlogfile`|
|RequiredLevel|None|
|Type|File|
|MaxSizeInKB|56768|

### <a name="BKMK_mspcat_DeploymentLogFile_Name"></a> mspcat_DeploymentLogFile_Name

|Property|Value|
|---|---|
|Description||
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_deploymentlogfile_name`|
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

- [business_unit_mspcat_installhistory](#BKMK_business_unit_mspcat_installhistory)
- [FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile](#BKMK_FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile)
- [lk_mspcat_installhistory_createdby](#BKMK_lk_mspcat_installhistory_createdby)
- [lk_mspcat_installhistory_createdonbehalfby](#BKMK_lk_mspcat_installhistory_createdonbehalfby)
- [lk_mspcat_installhistory_modifiedby](#BKMK_lk_mspcat_installhistory_modifiedby)
- [lk_mspcat_installhistory_modifiedonbehalfby](#BKMK_lk_mspcat_installhistory_modifiedonbehalfby)
- [mspcat_mspcat_installhistory_CatalogItem_mspcat_](#BKMK_mspcat_mspcat_installhistory_CatalogItem_mspcat_)
- [mspcat_mspcat_installhistory_Package_mspcat_pack](#BKMK_mspcat_mspcat_installhistory_Package_mspcat_pack)
- [mspcat_mspcat_installhistory_Publisher_mspcat_pu](#BKMK_mspcat_mspcat_installhistory_Publisher_mspcat_pu)
- [mspcat_mspcat_installhistory_RequestingUser_syst](#BKMK_mspcat_mspcat_installhistory_RequestingUser_syst)
- [owner_mspcat_installhistory](#BKMK_owner_mspcat_installhistory)
- [team_mspcat_installhistory](#BKMK_team_mspcat_installhistory)
- [user_mspcat_installhistory](#BKMK_user_mspcat_installhistory)

### <a name="BKMK_business_unit_mspcat_installhistory"></a> business_unit_mspcat_installhistory

One-To-Many Relationship: [businessunit business_unit_mspcat_installhistory](businessunit.md#BKMK_business_unit_mspcat_installhistory)

|Property|Value|
|---|---|
|ReferencedEntity|`businessunit`|
|ReferencedAttribute|`businessunitid`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencingEntityNavigationPropertyName|`owningbusinessunit`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Restrict`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile"></a> FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile

One-To-Many Relationship: [fileattachment FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile](fileattachment.md#BKMK_FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile)

|Property|Value|
|---|---|
|ReferencedEntity|`fileattachment`|
|ReferencedAttribute|`fileattachmentid`|
|ReferencingAttribute|`mspcat_deploymentlogfile`|
|ReferencingEntityNavigationPropertyName|`mspcat_deploymentlogfile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `RemoveLink`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_installhistory_createdby"></a> lk_mspcat_installhistory_createdby

One-To-Many Relationship: [systemuser lk_mspcat_installhistory_createdby](systemuser.md#BKMK_lk_mspcat_installhistory_createdby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`createdby`|
|ReferencingEntityNavigationPropertyName|`createdby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_installhistory_createdonbehalfby"></a> lk_mspcat_installhistory_createdonbehalfby

One-To-Many Relationship: [systemuser lk_mspcat_installhistory_createdonbehalfby](systemuser.md#BKMK_lk_mspcat_installhistory_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencingEntityNavigationPropertyName|`createdonbehalfby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_installhistory_modifiedby"></a> lk_mspcat_installhistory_modifiedby

One-To-Many Relationship: [systemuser lk_mspcat_installhistory_modifiedby](systemuser.md#BKMK_lk_mspcat_installhistory_modifiedby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`modifiedby`|
|ReferencingEntityNavigationPropertyName|`modifiedby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_installhistory_modifiedonbehalfby"></a> lk_mspcat_installhistory_modifiedonbehalfby

One-To-Many Relationship: [systemuser lk_mspcat_installhistory_modifiedonbehalfby](systemuser.md#BKMK_lk_mspcat_installhistory_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencingEntityNavigationPropertyName|`modifiedonbehalfby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_mspcat_installhistory_CatalogItem_mspcat_"></a> mspcat_mspcat_installhistory_CatalogItem_mspcat_

One-To-Many Relationship: [mspcat_applications mspcat_mspcat_installhistory_CatalogItem_mspcat_](mspcat_applications.md#BKMK_mspcat_mspcat_installhistory_CatalogItem_mspcat_)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`mspcat_catalogitem`|
|ReferencingEntityNavigationPropertyName|`mspcat_CatalogItem`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_mspcat_installhistory_Package_mspcat_pack"></a> mspcat_mspcat_installhistory_Package_mspcat_pack

One-To-Many Relationship: [mspcat_packages mspcat_mspcat_installhistory_Package_mspcat_pack](mspcat_packages.md#BKMK_mspcat_mspcat_installhistory_Package_mspcat_pack)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`mspcat_package`|
|ReferencingEntityNavigationPropertyName|`mspcat_Package`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_mspcat_installhistory_Publisher_mspcat_pu"></a> mspcat_mspcat_installhistory_Publisher_mspcat_pu

One-To-Many Relationship: [mspcat_publisher mspcat_mspcat_installhistory_Publisher_mspcat_pu](mspcat_publisher.md#BKMK_mspcat_mspcat_installhistory_Publisher_mspcat_pu)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`mspcat_publisher`|
|ReferencingEntityNavigationPropertyName|`mspcat_Publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_mspcat_installhistory_RequestingUser_syst"></a> mspcat_mspcat_installhistory_RequestingUser_syst

One-To-Many Relationship: [systemuser mspcat_mspcat_installhistory_RequestingUser_syst](systemuser.md#BKMK_mspcat_mspcat_installhistory_RequestingUser_syst)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`mspcat_requestinguser`|
|ReferencingEntityNavigationPropertyName|`mspcat_RequestingUser`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_owner_mspcat_installhistory"></a> owner_mspcat_installhistory

One-To-Many Relationship: [owner owner_mspcat_installhistory](owner.md#BKMK_owner_mspcat_installhistory)

|Property|Value|
|---|---|
|ReferencedEntity|`owner`|
|ReferencedAttribute|`ownerid`|
|ReferencingAttribute|`ownerid`|
|ReferencingEntityNavigationPropertyName|`ownerid`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_team_mspcat_installhistory"></a> team_mspcat_installhistory

One-To-Many Relationship: [team team_mspcat_installhistory](team.md#BKMK_team_mspcat_installhistory)

|Property|Value|
|---|---|
|ReferencedEntity|`team`|
|ReferencedAttribute|`teamid`|
|ReferencingAttribute|`owningteam`|
|ReferencingEntityNavigationPropertyName|`owningteam`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_user_mspcat_installhistory"></a> user_mspcat_installhistory

One-To-Many Relationship: [systemuser user_mspcat_installhistory](systemuser.md#BKMK_user_mspcat_installhistory)

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

- [mspcat_installhistory_ActivityPointers](#BKMK_mspcat_installhistory_ActivityPointers)
- [mspcat_installhistory_adx_inviteredemptions](#BKMK_mspcat_installhistory_adx_inviteredemptions)
- [mspcat_installhistory_adx_portalcomments](#BKMK_mspcat_installhistory_adx_portalcomments)
- [mspcat_installhistory_Appointments](#BKMK_mspcat_installhistory_Appointments)
- [mspcat_installhistory_AsyncOperations](#BKMK_mspcat_installhistory_AsyncOperations)
- [mspcat_installhistory_BulkDeleteFailures](#BKMK_mspcat_installhistory_BulkDeleteFailures)
- [mspcat_installhistory_chats](#BKMK_mspcat_installhistory_chats)
- [mspcat_installhistory_Emails](#BKMK_mspcat_installhistory_Emails)
- [mspcat_installhistory_Faxes](#BKMK_mspcat_installhistory_Faxes)
- [mspcat_installhistory_FileAttachments](#BKMK_mspcat_installhistory_FileAttachments)
- [mspcat_installhistory_Letters](#BKMK_mspcat_installhistory_Letters)
- [mspcat_installhistory_MailboxTrackingFolders](#BKMK_mspcat_installhistory_MailboxTrackingFolders)
- [mspcat_installhistory_mspcat_InstallActivities](#BKMK_mspcat_installhistory_mspcat_InstallActivities)
- [mspcat_installhistory_PhoneCalls](#BKMK_mspcat_installhistory_PhoneCalls)
- [mspcat_installhistory_PrincipalObjectAttributeAccesses](#BKMK_mspcat_installhistory_PrincipalObjectAttributeAccesses)
- [mspcat_installhistory_ProcessSession](#BKMK_mspcat_installhistory_ProcessSession)
- [mspcat_installhistory_RecurringAppointmentMasters](#BKMK_mspcat_installhistory_RecurringAppointmentMasters)
- [mspcat_installhistory_SocialActivities](#BKMK_mspcat_installhistory_SocialActivities)
- [mspcat_installhistory_SyncErrors](#BKMK_mspcat_installhistory_SyncErrors)
- [mspcat_installhistory_Tasks](#BKMK_mspcat_installhistory_Tasks)

### <a name="BKMK_mspcat_installhistory_ActivityPointers"></a> mspcat_installhistory_ActivityPointers

Many-To-One Relationship: [activitypointer mspcat_installhistory_ActivityPointers](activitypointer.md#BKMK_mspcat_installhistory_ActivityPointers)

|Property|Value|
|---|---|
|ReferencingEntity|`activitypointer`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_ActivityPointers`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_adx_inviteredemptions"></a> mspcat_installhistory_adx_inviteredemptions

Many-To-One Relationship: [adx_inviteredemption mspcat_installhistory_adx_inviteredemptions](adx_inviteredemption.md#BKMK_mspcat_installhistory_adx_inviteredemptions)

|Property|Value|
|---|---|
|ReferencingEntity|`adx_inviteredemption`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_adx_inviteredemptions`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_adx_portalcomments"></a> mspcat_installhistory_adx_portalcomments

Many-To-One Relationship: [adx_portalcomment mspcat_installhistory_adx_portalcomments](adx_portalcomment.md#BKMK_mspcat_installhistory_adx_portalcomments)

|Property|Value|
|---|---|
|ReferencingEntity|`adx_portalcomment`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_adx_portalcomments`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_Appointments"></a> mspcat_installhistory_Appointments

Many-To-One Relationship: [appointment mspcat_installhistory_Appointments](appointment.md#BKMK_mspcat_installhistory_Appointments)

|Property|Value|
|---|---|
|ReferencingEntity|`appointment`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_Appointments`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_AsyncOperations"></a> mspcat_installhistory_AsyncOperations

Many-To-One Relationship: [asyncoperation mspcat_installhistory_AsyncOperations](asyncoperation.md#BKMK_mspcat_installhistory_AsyncOperations)

|Property|Value|
|---|---|
|ReferencingEntity|`asyncoperation`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_AsyncOperations`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_BulkDeleteFailures"></a> mspcat_installhistory_BulkDeleteFailures

Many-To-One Relationship: [bulkdeletefailure mspcat_installhistory_BulkDeleteFailures](bulkdeletefailure.md#BKMK_mspcat_installhistory_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencingEntity|`bulkdeletefailure`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_BulkDeleteFailures`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_chats"></a> mspcat_installhistory_chats

Many-To-One Relationship: [chat mspcat_installhistory_chats](chat.md#BKMK_mspcat_installhistory_chats)

|Property|Value|
|---|---|
|ReferencingEntity|`chat`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_chats`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_Emails"></a> mspcat_installhistory_Emails

Many-To-One Relationship: [email mspcat_installhistory_Emails](email.md#BKMK_mspcat_installhistory_Emails)

|Property|Value|
|---|---|
|ReferencingEntity|`email`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_Emails`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_Faxes"></a> mspcat_installhistory_Faxes

Many-To-One Relationship: [fax mspcat_installhistory_Faxes](fax.md#BKMK_mspcat_installhistory_Faxes)

|Property|Value|
|---|---|
|ReferencingEntity|`fax`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_Faxes`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_FileAttachments"></a> mspcat_installhistory_FileAttachments

Many-To-One Relationship: [fileattachment mspcat_installhistory_FileAttachments](fileattachment.md#BKMK_mspcat_installhistory_FileAttachments)

|Property|Value|
|---|---|
|ReferencingEntity|`fileattachment`|
|ReferencingAttribute|`objectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_FileAttachments`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_Letters"></a> mspcat_installhistory_Letters

Many-To-One Relationship: [letter mspcat_installhistory_Letters](letter.md#BKMK_mspcat_installhistory_Letters)

|Property|Value|
|---|---|
|ReferencingEntity|`letter`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_Letters`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_MailboxTrackingFolders"></a> mspcat_installhistory_MailboxTrackingFolders

Many-To-One Relationship: [mailboxtrackingfolder mspcat_installhistory_MailboxTrackingFolders](mailboxtrackingfolder.md#BKMK_mspcat_installhistory_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencingEntity|`mailboxtrackingfolder`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_MailboxTrackingFolders`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_mspcat_InstallActivities"></a> mspcat_installhistory_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity mspcat_installhistory_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_mspcat_installhistory_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_PhoneCalls"></a> mspcat_installhistory_PhoneCalls

Many-To-One Relationship: [phonecall mspcat_installhistory_PhoneCalls](phonecall.md#BKMK_mspcat_installhistory_PhoneCalls)

|Property|Value|
|---|---|
|ReferencingEntity|`phonecall`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_PhoneCalls`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_PrincipalObjectAttributeAccesses"></a> mspcat_installhistory_PrincipalObjectAttributeAccesses

Many-To-One Relationship: [principalobjectattributeaccess mspcat_installhistory_PrincipalObjectAttributeAccesses](principalobjectattributeaccess.md#BKMK_mspcat_installhistory_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencingEntity|`principalobjectattributeaccess`|
|ReferencingAttribute|`objectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_PrincipalObjectAttributeAccesses`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_ProcessSession"></a> mspcat_installhistory_ProcessSession

Many-To-One Relationship: [processsession mspcat_installhistory_ProcessSession](processsession.md#BKMK_mspcat_installhistory_ProcessSession)

|Property|Value|
|---|---|
|ReferencingEntity|`processsession`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_ProcessSession`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_RecurringAppointmentMasters"></a> mspcat_installhistory_RecurringAppointmentMasters

Many-To-One Relationship: [recurringappointmentmaster mspcat_installhistory_RecurringAppointmentMasters](recurringappointmentmaster.md#BKMK_mspcat_installhistory_RecurringAppointmentMasters)

|Property|Value|
|---|---|
|ReferencingEntity|`recurringappointmentmaster`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_RecurringAppointmentMasters`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_SocialActivities"></a> mspcat_installhistory_SocialActivities

Many-To-One Relationship: [socialactivity mspcat_installhistory_SocialActivities](socialactivity.md#BKMK_mspcat_installhistory_SocialActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`socialactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_SocialActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_SyncErrors"></a> mspcat_installhistory_SyncErrors

Many-To-One Relationship: [syncerror mspcat_installhistory_SyncErrors](syncerror.md#BKMK_mspcat_installhistory_SyncErrors)

|Property|Value|
|---|---|
|ReferencingEntity|`syncerror`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_SyncErrors`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_installhistory_Tasks"></a> mspcat_installhistory_Tasks

Many-To-One Relationship: [task mspcat_installhistory_Tasks](task.md#BKMK_mspcat_installhistory_Tasks)

|Property|Value|
|---|---|
|ReferencingEntity|`task`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installhistory_Tasks`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   

