---
title: "Approval Rejection Applied Policy (mspcat_CertificationRejectionAppliedPolicy) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Approval Rejection Applied Policy (mspcat_CertificationRejectionAppliedPolicy) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Approval Rejection Applied Policy (mspcat_CertificationRejectionAppliedPolicy) table/entity reference



## Messages

The following table lists the messages for the Approval Rejection Applied Policy (mspcat_CertificationRejectionAppliedPolicy) table.
Messages represent operations that can be performed on the table. They may also be events.

| Name <br />Is Event? |Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `Assign`<br />Event: True |`PATCH` /mspcat_certificationrejectionappliedpolicies(*mspcat_certificationrejectionappliedpolicyid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `ownerid` property. |<xref:Microsoft.Crm.Sdk.Messages.AssignRequest>|
| `Create`<br />Event: True |`POST` /mspcat_certificationrejectionappliedpolicies<br />See [Create](/powerapps/developer/data-platform/webapi/create-entity-web-api) |[Create records](/power-apps/developer/data-platform/org-service/entity-operations-create#basic-create)|
| `CreateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.CreateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.CreateMultipleRequest>|
| `Delete`<br />Event: True |`DELETE` /mspcat_certificationrejectionappliedpolicies(*mspcat_certificationrejectionappliedpolicyid*)<br />See [Delete](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-delete) |[Delete records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-delete)|
| `GrantAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.GrantAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.GrantAccessRequest>|
| `IsValidStateTransition`<br />Event: False |<xref:Microsoft.Dynamics.CRM.IsValidStateTransition?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.IsValidStateTransitionRequest>|
| `ModifyAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.ModifyAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.ModifyAccessRequest>|
| `Retrieve`<br />Event: True |`GET` /mspcat_certificationrejectionappliedpolicies(*mspcat_certificationrejectionappliedpolicyid*)<br />See [Retrieve](/powerapps/developer/data-platform/webapi/retrieve-entity-using-web-api) |[Retrieve records](/power-apps/developer/data-platform/org-service/entity-operations-retrieve)|
| `RetrieveMultiple`<br />Event: True |`GET` /mspcat_certificationrejectionappliedpolicies<br />See [Query data](/power-apps/developer/data-platform/webapi/query-data-web-api) |[Query data](/power-apps/developer/data-platform/org-service/entity-operations-query-data)|
| `RetrievePrincipalAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrievePrincipalAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrievePrincipalAccessRequest>|
| `RetrieveSharedPrincipalsAndAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrieveSharedPrincipalsAndAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrieveSharedPrincipalsAndAccessRequest>|
| `RevokeAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RevokeAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RevokeAccessRequest>|
| `SetState`<br />Event: True |`PATCH` /mspcat_certificationrejectionappliedpolicies(*mspcat_certificationrejectionappliedpolicyid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `statecode` and `statuscode` properties. |<xref:Microsoft.Crm.Sdk.Messages.SetStateRequest>|
| `Update`<br />Event: True |`PATCH` /mspcat_certificationrejectionappliedpolicies(*mspcat_certificationrejectionappliedpolicyid*)<br />See [Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) |[Update records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-update)|
| `UpdateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.UpdateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpdateMultipleRequest>|
| `Upsert`<br />Event: False |`PATCH` /mspcat_certificationrejectionappliedpolicies(*mspcat_certificationrejectionappliedpolicyid*)<br />See [Upsert a table row](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#upsert-a-table-row) |<xref:Microsoft.Xrm.Sdk.Messages.UpsertRequest>|
| `UpsertMultiple`<br />Event: False |<xref:Microsoft.Dynamics.CRM.UpsertMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpsertMultipleRequest>|


## Events

The following table lists the events for the Approval Rejection Applied Policy (mspcat_CertificationRejectionAppliedPolicy) table.
Events are messages that exist so that you can subscribe to them. Unless you added the event, you shouldn't invoke the message, only subscribe to it.

|Name|Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `BulkRetain`|<xref:Microsoft.Dynamics.CRM.BulkRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `PurgeRetainedContent`|<xref:Microsoft.Dynamics.CRM.PurgeRetainedContent?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retain`|<xref:Microsoft.Dynamics.CRM.Retain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `RollbackRetain`|<xref:Microsoft.Dynamics.CRM.RollbackRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `ValidateRetentionConfig`|<xref:Microsoft.Dynamics.CRM.ValidateRetentionConfig?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|

## Properties

The following table lists selected properties for the Approval Rejection Applied Policy (mspcat_CertificationRejectionAppliedPolicy) table.

|Property|Value|
| --- | --- |
| **DisplayName** | **Approval Rejection Applied Policy** |
| **DisplayCollectionName** | **Approval Rejection Applied Policies** |
| **SchemaName** | `mspcat_CertificationRejectionAppliedPolicy` |
| **CollectionSchemaName** | `mspcat_CertificationRejectionAppliedPolicies` |
| **EntitySetName** | `mspcat_certificationrejectionappliedpolicies`|
| **LogicalName** | `mspcat_certificationrejectionappliedpolicy` |
| **LogicalCollectionName** | `mspcat_certificationrejectionappliedpolicies` |
| **PrimaryIdAttribute** | `mspcat_certificationrejectionappliedpolicyid` |
| **PrimaryNameAttribute** |`mspcat_name` |
| **TableType** | `Standard` |
| **OwnershipType** | `UserOwned` |

## Writable columns/attributes

These columns/attributes return true for either **IsValidForCreate** or **IsValidForUpdate** (usually both). Listed by **SchemaName**.

- [cr9d4_PolicyRejectionReason](#BKMK_cr9d4_PolicyRejectionReason)
- [ImportSequenceNumber](#BKMK_ImportSequenceNumber)
- [mspcat_CertificationRejectionAppliedPolicyId](#BKMK_mspcat_CertificationRejectionAppliedPolicyId)
- [mspcat_CertificationRequest](#BKMK_mspcat_CertificationRequest)
- [mspcat_CustomerNotice](#BKMK_mspcat_CustomerNotice)
- [mspcat_Name](#BKMK_mspcat_Name)
- [mspcat_PolicyCode](#BKMK_mspcat_PolicyCode)
- [OverriddenCreatedOn](#BKMK_OverriddenCreatedOn)
- [OwnerId](#BKMK_OwnerId)
- [OwnerIdType](#BKMK_OwnerIdType)
- [statecode](#BKMK_statecode)
- [statuscode](#BKMK_statuscode)
- [TimeZoneRuleVersionNumber](#BKMK_TimeZoneRuleVersionNumber)
- [UTCConversionTimeZoneCode](#BKMK_UTCConversionTimeZoneCode)

### <a name="BKMK_cr9d4_PolicyRejectionReason"></a> cr9d4_PolicyRejectionReason

|Property|Value|
|---|---|
|Description||
|DisplayName|**Policy Rejection Reason**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`cr9d4_policyrejectionreason`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|mspcat_sspolicytemplate|

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

### <a name="BKMK_mspcat_CertificationRejectionAppliedPolicyId"></a> mspcat_CertificationRejectionAppliedPolicyId

|Property|Value|
|---|---|
|Description|**Unique identifier for entity instances**|
|DisplayName|**Certification Rejection Applied Policy**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_certificationrejectionappliedpolicyid`|
|RequiredLevel|SystemRequired|
|Type|Uniqueidentifier|

### <a name="BKMK_mspcat_CertificationRequest"></a> mspcat_CertificationRequest

|Property|Value|
|---|---|
|Description||
|DisplayName|**Certification Request**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_certificationrequest`|
|RequiredLevel|ApplicationRequired|
|Type|Lookup|
|Targets|mspcat_certificationrequest|

### <a name="BKMK_mspcat_CustomerNotice"></a> mspcat_CustomerNotice

|Property|Value|
|---|---|
|Description||
|DisplayName|**Customer Notice**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_customernotice`|
|RequiredLevel|None|
|Type|Memo|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|2000|

### <a name="BKMK_mspcat_Name"></a> mspcat_Name

|Property|Value|
|---|---|
|Description|**Required name field**|
|DisplayName|**Name**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_name`|
|RequiredLevel|Recommended|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_mspcat_PolicyCode"></a> mspcat_PolicyCode

|Property|Value|
|---|---|
|Description||
|DisplayName|**Policy Code**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_policycode`|
|RequiredLevel|ApplicationRequired|
|Type|Lookup|
|Targets|mspcat_sspolicy|

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
|Description|**Status of the Approval Rejection Applied Policy**|
|DisplayName|**Status**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statecode`|
|RequiredLevel|SystemRequired|
|Type|State|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_certificationrejectionappliedpolicy_statecode`|

#### statecode Choices/Options

|Value|Details|
|---|---|
|0|Label: **Active**<br />DefaultStatus: 1<br />InvariantName: `Active`|
|1|Label: **Inactive**<br />DefaultStatus: 2<br />InvariantName: `Inactive`|

### <a name="BKMK_statuscode"></a> statuscode

|Property|Value|
|---|---|
|Description|**Reason for the status of the Approval Rejection Applied Policy**|
|DisplayName|**Status Reason**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statuscode`|
|RequiredLevel|None|
|Type|Status|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_certificationrejectionappliedpolicy_statuscode`|

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

- [business_unit_mspcat_certificationrejectionappliedpolicy](#BKMK_business_unit_mspcat_certificationrejectionappliedpolicy)
- [cr9d4_mspcat_CertificationRejectionAppliedPol](#BKMK_cr9d4_mspcat_CertificationRejectionAppliedPol)
- [lk_mspcat_certificationrejectionappliedpolicy_createdby](#BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdby)
- [lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby](#BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby)
- [lk_mspcat_certificationrejectionappliedpolicy_modifiedby](#BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedby)
- [lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby](#BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby)
- [mspcat_CertificationRejectionAppliedPol](#BKMK_mspcat_CertificationRejectionAppliedPol)
- [mspcat_certreject_cert](#BKMK_mspcat_certreject_cert)
- [owner_mspcat_certificationrejectionappliedpolicy](#BKMK_owner_mspcat_certificationrejectionappliedpolicy)
- [team_mspcat_certificationrejectionappliedpolicy](#BKMK_team_mspcat_certificationrejectionappliedpolicy)
- [user_mspcat_certificationrejectionappliedpolicy](#BKMK_user_mspcat_certificationrejectionappliedpolicy)

### <a name="BKMK_business_unit_mspcat_certificationrejectionappliedpolicy"></a> business_unit_mspcat_certificationrejectionappliedpolicy

One-To-Many Relationship: [businessunit business_unit_mspcat_certificationrejectionappliedpolicy](businessunit.md#BKMK_business_unit_mspcat_certificationrejectionappliedpolicy)

|Property|Value|
|---|---|
|ReferencedEntity|`businessunit`|
|ReferencedAttribute|`businessunitid`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencingEntityNavigationPropertyName|`owningbusinessunit`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Restrict`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_cr9d4_mspcat_CertificationRejectionAppliedPol"></a> cr9d4_mspcat_CertificationRejectionAppliedPol

One-To-Many Relationship: [mspcat_sspolicytemplate cr9d4_mspcat_CertificationRejectionAppliedPol](mspcat_sspolicytemplate.md#BKMK_cr9d4_mspcat_CertificationRejectionAppliedPol)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicytemplate`|
|ReferencedAttribute|`mspcat_sspolicytemplateid`|
|ReferencingAttribute|`cr9d4_policyrejectionreason`|
|ReferencingEntityNavigationPropertyName|`cr9d4_PolicyRejectionReason`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdby"></a> lk_mspcat_certificationrejectionappliedpolicy_createdby

One-To-Many Relationship: [systemuser lk_mspcat_certificationrejectionappliedpolicy_createdby](systemuser.md#BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`createdby`|
|ReferencingEntityNavigationPropertyName|`createdby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby"></a> lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby

One-To-Many Relationship: [systemuser lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby](systemuser.md#BKMK_lk_mspcat_certificationrejectionappliedpolicy_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencingEntityNavigationPropertyName|`createdonbehalfby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedby"></a> lk_mspcat_certificationrejectionappliedpolicy_modifiedby

One-To-Many Relationship: [systemuser lk_mspcat_certificationrejectionappliedpolicy_modifiedby](systemuser.md#BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`modifiedby`|
|ReferencingEntityNavigationPropertyName|`modifiedby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby"></a> lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby

One-To-Many Relationship: [systemuser lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby](systemuser.md#BKMK_lk_mspcat_certificationrejectionappliedpolicy_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencingEntityNavigationPropertyName|`modifiedonbehalfby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_CertificationRejectionAppliedPol"></a> mspcat_CertificationRejectionAppliedPol

One-To-Many Relationship: [mspcat_sspolicy mspcat_CertificationRejectionAppliedPol](mspcat_sspolicy.md#BKMK_mspcat_CertificationRejectionAppliedPol)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_sspolicy`|
|ReferencedAttribute|`mspcat_sspolicyid`|
|ReferencingAttribute|`mspcat_policycode`|
|ReferencingEntityNavigationPropertyName|`mspcat_PolicyCode`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certreject_cert"></a> mspcat_certreject_cert

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certreject_cert](mspcat_certificationrequest.md#BKMK_mspcat_certreject_cert)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`mspcat_certificationrequest`|
|ReferencingEntityNavigationPropertyName|`mspcat_CertificationRequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_owner_mspcat_certificationrejectionappliedpolicy"></a> owner_mspcat_certificationrejectionappliedpolicy

One-To-Many Relationship: [owner owner_mspcat_certificationrejectionappliedpolicy](owner.md#BKMK_owner_mspcat_certificationrejectionappliedpolicy)

|Property|Value|
|---|---|
|ReferencedEntity|`owner`|
|ReferencedAttribute|`ownerid`|
|ReferencingAttribute|`ownerid`|
|ReferencingEntityNavigationPropertyName|`ownerid`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_team_mspcat_certificationrejectionappliedpolicy"></a> team_mspcat_certificationrejectionappliedpolicy

One-To-Many Relationship: [team team_mspcat_certificationrejectionappliedpolicy](team.md#BKMK_team_mspcat_certificationrejectionappliedpolicy)

|Property|Value|
|---|---|
|ReferencedEntity|`team`|
|ReferencedAttribute|`teamid`|
|ReferencingAttribute|`owningteam`|
|ReferencingEntityNavigationPropertyName|`owningteam`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_user_mspcat_certificationrejectionappliedpolicy"></a> user_mspcat_certificationrejectionappliedpolicy

One-To-Many Relationship: [systemuser user_mspcat_certificationrejectionappliedpolicy](systemuser.md#BKMK_user_mspcat_certificationrejectionappliedpolicy)

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

- [mspcat_certificationrejectionappliedpolicy_AsyncOperations](#BKMK_mspcat_certificationrejectionappliedpolicy_AsyncOperations)
- [mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures](#BKMK_mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures)
- [mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord](#BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord)
- [mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord](#BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord)
- [mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders](#BKMK_mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders)
- [mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses](#BKMK_mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses)
- [mspcat_certificationrejectionappliedpolicy_ProcessSession](#BKMK_mspcat_certificationrejectionappliedpolicy_ProcessSession)
- [mspcat_certificationrejectionappliedpolicy_SyncErrors](#BKMK_mspcat_certificationrejectionappliedpolicy_SyncErrors)

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_AsyncOperations"></a> mspcat_certificationrejectionappliedpolicy_AsyncOperations

Many-To-One Relationship: [asyncoperation mspcat_certificationrejectionappliedpolicy_AsyncOperations](asyncoperation.md#BKMK_mspcat_certificationrejectionappliedpolicy_AsyncOperations)

|Property|Value|
|---|---|
|ReferencingEntity|`asyncoperation`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_certificationrejectionappliedpolicy_AsyncOperations`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures"></a> mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures

Many-To-One Relationship: [bulkdeletefailure mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures](bulkdeletefailure.md#BKMK_mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencingEntity|`bulkdeletefailure`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_certificationrejectionappliedpolicy_BulkDeleteFailures`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord"></a> mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord

Many-To-One Relationship: [duplicaterecord mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord](duplicaterecord.md#BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencingEntity|`duplicaterecord`|
|ReferencingAttribute|`baserecordid`|
|ReferencedEntityNavigationPropertyName|`mspcat_certificationrejectionappliedpolicy_DuplicateBaseRecord`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord"></a> mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord

Many-To-One Relationship: [duplicaterecord mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord](duplicaterecord.md#BKMK_mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencingEntity|`duplicaterecord`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencedEntityNavigationPropertyName|`mspcat_certificationrejectionappliedpolicy_DuplicateMatchingRecord`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders"></a> mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders

Many-To-One Relationship: [mailboxtrackingfolder mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders](mailboxtrackingfolder.md#BKMK_mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencingEntity|`mailboxtrackingfolder`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_certificationrejectionappliedpolicy_MailboxTrackingFolders`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses"></a> mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses

Many-To-One Relationship: [principalobjectattributeaccess mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses](principalobjectattributeaccess.md#BKMK_mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencingEntity|`principalobjectattributeaccess`|
|ReferencingAttribute|`objectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_certificationrejectionappliedpolicy_PrincipalObjectAttributeAccesses`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_ProcessSession"></a> mspcat_certificationrejectionappliedpolicy_ProcessSession

Many-To-One Relationship: [processsession mspcat_certificationrejectionappliedpolicy_ProcessSession](processsession.md#BKMK_mspcat_certificationrejectionappliedpolicy_ProcessSession)

|Property|Value|
|---|---|
|ReferencingEntity|`processsession`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_certificationrejectionappliedpolicy_ProcessSession`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_certificationrejectionappliedpolicy_SyncErrors"></a> mspcat_certificationrejectionappliedpolicy_SyncErrors

Many-To-One Relationship: [syncerror mspcat_certificationrejectionappliedpolicy_SyncErrors](syncerror.md#BKMK_mspcat_certificationrejectionappliedpolicy_SyncErrors)

|Property|Value|
|---|---|
|ReferencingEntity|`syncerror`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_certificationrejectionappliedpolicy_SyncErrors`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   

