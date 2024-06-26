---
title: "Catalog Item (mspcat_applications) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Catalog Item (mspcat_applications) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Catalog Item (mspcat_applications) table/entity reference

Entry that will appear in the Catalog

## Messages

The following table lists the messages for the Catalog Item (mspcat_applications) table.
Messages represent operations that can be performed on the table. They may also be events.

| Name <br />Is Event? |Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `Assign`<br />Event: True |`PATCH` /mspcat_applicationses(*mspcat_applicationsid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `ownerid` property. |<xref:Microsoft.Crm.Sdk.Messages.AssignRequest>|
| `Create`<br />Event: True |`POST` /mspcat_applicationses<br />See [Create](/powerapps/developer/data-platform/webapi/create-entity-web-api) |[Create records](/power-apps/developer/data-platform/org-service/entity-operations-create#basic-create)|
| `CreateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.CreateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.CreateMultipleRequest>|
| `Delete`<br />Event: True |`DELETE` /mspcat_applicationses(*mspcat_applicationsid*)<br />See [Delete](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-delete) |[Delete records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-delete)|
| `GrantAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.GrantAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.GrantAccessRequest>|
| `IsValidStateTransition`<br />Event: False |<xref:Microsoft.Dynamics.CRM.IsValidStateTransition?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.IsValidStateTransitionRequest>|
| `ModifyAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.ModifyAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.ModifyAccessRequest>|
| `mspcat_InstallCatalogItem`<br />Event: False |**mspcat_InstallCatalogItem function** |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retrieve`<br />Event: True |`GET` /mspcat_applicationses(*mspcat_applicationsid*)<br />See [Retrieve](/powerapps/developer/data-platform/webapi/retrieve-entity-using-web-api) |[Retrieve records](/power-apps/developer/data-platform/org-service/entity-operations-retrieve)|
| `RetrieveMultiple`<br />Event: True |`GET` /mspcat_applicationses<br />See [Query data](/power-apps/developer/data-platform/webapi/query-data-web-api) |[Query data](/power-apps/developer/data-platform/org-service/entity-operations-query-data)|
| `RetrievePrincipalAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrievePrincipalAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrievePrincipalAccessRequest>|
| `RetrieveSharedPrincipalsAndAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrieveSharedPrincipalsAndAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrieveSharedPrincipalsAndAccessRequest>|
| `RevokeAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RevokeAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RevokeAccessRequest>|
| `SetState`<br />Event: True |`PATCH` /mspcat_applicationses(*mspcat_applicationsid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `statecode` and `statuscode` properties. |<xref:Microsoft.Crm.Sdk.Messages.SetStateRequest>|
| `Update`<br />Event: True |`PATCH` /mspcat_applicationses(*mspcat_applicationsid*)<br />See [Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) |[Update records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-update)|
| `UpdateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.UpdateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpdateMultipleRequest>|
| `Upsert`<br />Event: False |`PATCH` /mspcat_applicationses(*mspcat_applicationsid*)<br />See [Upsert a table row](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#upsert-a-table-row) |<xref:Microsoft.Xrm.Sdk.Messages.UpsertRequest>|
| `UpsertMultiple`<br />Event: False |<xref:Microsoft.Dynamics.CRM.UpsertMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpsertMultipleRequest>|


## Events

The following table lists the events for the Catalog Item (mspcat_applications) table.
Events are messages that exist so that you can subscribe to them. Unless you added the event, you shouldn't invoke the message, only subscribe to it.

|Name|Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `BulkRetain`|<xref:Microsoft.Dynamics.CRM.BulkRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `PurgeRetainedContent`|<xref:Microsoft.Dynamics.CRM.PurgeRetainedContent?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retain`|<xref:Microsoft.Dynamics.CRM.Retain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `RollbackRetain`|<xref:Microsoft.Dynamics.CRM.RollbackRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `ValidateRetentionConfig`|<xref:Microsoft.Dynamics.CRM.ValidateRetentionConfig?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|

## Properties

The following table lists selected properties for the Catalog Item (mspcat_applications) table.

|Property|Value|
| --- | --- |
| **DisplayName** | **Catalog Item** |
| **DisplayCollectionName** | **Catalog Items** |
| **SchemaName** | `mspcat_applications` |
| **CollectionSchemaName** | `mspcat_applicationses` |
| **EntitySetName** | `mspcat_applicationses`|
| **LogicalName** | `mspcat_applications` |
| **LogicalCollectionName** | `mspcat_applicationses` |
| **PrimaryIdAttribute** | `mspcat_applicationsid` |
| **PrimaryNameAttribute** |`mspcat_name` |
| **TableType** | `Standard` |
| **OwnershipType** | `UserOwned` |

## Writable columns/attributes

These columns/attributes return true for either **IsValidForCreate** or **IsValidForUpdate** (usually both). Listed by **SchemaName**.

- [ImportSequenceNumber](#BKMK_ImportSequenceNumber)
- [mspcat_AdminCenterVisibility](#BKMK_mspcat_AdminCenterVisibility)
- [mspcat_allowautoapproval](#BKMK_mspcat_allowautoapproval)
- [mspcat_appicon216x216link](#BKMK_mspcat_appicon216x216link)
- [mspcat_appicon48x48link](#BKMK_mspcat_appicon48x48link)
- [mspcat_applicationitemcrossreferance](#BKMK_mspcat_applicationitemcrossreferance)
- [mspcat_applicationsId](#BKMK_mspcat_applicationsId)
- [mspcat_ApplicationType](#BKMK_mspcat_ApplicationType)
- [mspcat_AzureAssetId](#BKMK_mspcat_AzureAssetId)
- [mspcat_BusinessCategory](#BKMK_mspcat_BusinessCategory)
- [mspcat_CatalogVisibility](#BKMK_mspcat_CatalogVisibility)
- [mspcat_CodeRepo](#BKMK_mspcat_CodeRepo)
- [mspcat_ComponentLogicalName](#BKMK_mspcat_ComponentLogicalName)
- [mspcat_DeployType](#BKMK_mspcat_DeployType)
- [mspcat_Description](#BKMK_mspcat_Description)
- [mspcat_EngineeringContact](#BKMK_mspcat_EngineeringContact)
- [mspcat_HelpLink](#BKMK_mspcat_HelpLink)
- [mspcat_LastSyncDate](#BKMK_mspcat_LastSyncDate)
- [mspcat_LegalTerms](#BKMK_mspcat_LegalTerms)
- [mspcat_LegalTermsLink](#BKMK_mspcat_LegalTermsLink)
- [mspcat_name](#BKMK_mspcat_name)
- [mspcat_PackageAsset](#BKMK_mspcat_PackageAsset)
- [mspcat_PostInstallOperationType](#BKMK_mspcat_PostInstallOperationType)
- [mspcat_PrivacyPolicyUrl](#BKMK_mspcat_PrivacyPolicyUrl)
- [mspcat_PublisherId](#BKMK_mspcat_PublisherId)
- [mspcat_PushedDate](#BKMK_mspcat_PushedDate)
- [mspcat_RequireEntitlement](#BKMK_mspcat_RequireEntitlement)
- [mspcat_SinglePageApplicationUrl](#BKMK_mspcat_SinglePageApplicationUrl)
- [mspcat_SupportContact](#BKMK_mspcat_SupportContact)
- [mspcat_SupportedApplicationTypes](#BKMK_mspcat_SupportedApplicationTypes)
- [mspcat_SupportsAppType](#BKMK_mspcat_SupportsAppType)
- [mspcat_TargetStudioType](#BKMK_mspcat_TargetStudioType)
- [mspcat_TPSID](#BKMK_mspcat_TPSID)
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

### <a name="BKMK_mspcat_AdminCenterVisibility"></a> mspcat_AdminCenterVisibility

|Property|Value|
|---|---|
|Description||
|DisplayName|**AdminCenter Visibility**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_admincentervisibility`|
|RequiredLevel|Recommended|
|Type|MultiSelectPicklist|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_applicationvisibility`|

#### mspcat_AdminCenterVisibility Choices/Options

|Value|Label|
|---|---|
|526430001|**Crm Admin Center**|
|526430002|**Bap Admin Center**|
|526430003|**One Admin Center**|

### <a name="BKMK_mspcat_allowautoapproval"></a> mspcat_allowautoapproval

|Property|Value|
|---|---|
|Description|**Permits auto-approvals for this app's requests if they are constrained to the list of GEOs in the "auto-approved GEOs" list.**|
|DisplayName|**Allow auto-approval**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_allowautoapproval`|
|RequiredLevel|None|
|Type|Boolean|
|GlobalChoiceName|`mspcat_applications_mspcat_allowautoapproval`|
|DefaultValue|False|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_appicon216x216link"></a> mspcat_appicon216x216link

|Property|Value|
|---|---|
|Description|**Large App Icon Link.**|
|DisplayName|**Large Icon (216x216)**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_appicon216x216link`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|4000|

### <a name="BKMK_mspcat_appicon48x48link"></a> mspcat_appicon48x48link

|Property|Value|
|---|---|
|Description|**48x48 Application Icon Link**|
|DisplayName|**Small Icon (48x48)**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_appicon48x48link`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|4000|

### <a name="BKMK_mspcat_applicationitemcrossreferance"></a> mspcat_applicationitemcrossreferance

|Property|Value|
|---|---|
|Description|**Relates to cross-reference table for application items, allows for a Id to item revision lookup**|
|DisplayName|**Catalog Item Cross Reference**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_applicationitemcrossreferance`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|mspcat_applicationreference|

### <a name="BKMK_mspcat_applicationsId"></a> mspcat_applicationsId

|Property|Value|
|---|---|
|Description|**Unique identifier for entity instances**|
|DisplayName|**Catalog Item**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_applicationsid`|
|RequiredLevel|SystemRequired|
|Type|Uniqueidentifier|

### <a name="BKMK_mspcat_ApplicationType"></a> mspcat_ApplicationType

|Property|Value|
|---|---|
|Description|**Type of application entry.  used to describe the  intended use case for this catalog item.**|
|DisplayName|**Type**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_applicationtype`|
|RequiredLevel|Recommended|
|Type|Picklist|
|DefaultFormValue|526430000|
|GlobalChoiceName|`mspcat_applications_applicationtype`|

#### mspcat_ApplicationType Choices/Options

|Value|Label|
|---|---|
|526430000|**Component Collection**|
|526430001|**Application**|

### <a name="BKMK_mspcat_AzureAssetId"></a> mspcat_AzureAssetId

|Property|Value|
|---|---|
|Description||
|DisplayName|**Azure Asset Id**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_azureassetid`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|110|

### <a name="BKMK_mspcat_BusinessCategory"></a> mspcat_BusinessCategory

|Property|Value|
|---|---|
|Description|**Business Categories assigned to this Catalog Item.**|
|DisplayName|**Business Category**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_businesscategory`|
|RequiredLevel|None|
|Type|MultiSelectPicklist|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_catalogbusinesscategory`|

#### mspcat_BusinessCategory Choices/Options

|Value|Label|
|---|---|
|526430000|**Customer Service**|
|526430001|**Project Management**|
|526430002|**Calendar Management & Scheduling**|
|526430003|**Email Management**|
|526430004|**Files & Documentation**|
|526430005|**Notification & Reminders**|
|526430006|**Analytics**|
|526430007|**Collaboration**|
|526430008|**Commerce**|
|526430009|**Finance**|
|526430010|**Compliance & Legal**|
|526430011|**Sales**|
|526430012|**IT Tools**|
|526430013|**Marketing**|
|526430014|**Operations & Supply Chain**|
|526430015|**Internet of Things**|
|526430016|**AI Machine Learning**|
|526430017|**Geolocation**|
|526430018|**Human Resources**|

### <a name="BKMK_mspcat_CatalogVisibility"></a> mspcat_CatalogVisibility

|Property|Value|
|---|---|
|Description||
|DisplayName|**Catalog Visibility**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_catalogvisibility`|
|RequiredLevel|Recommended|
|Type|MultiSelectPicklist|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_catalogvisibility`|

#### mspcat_CatalogVisibility Choices/Options

|Value|Label|
|---|---|
|526430000|**Admin Centers**|
|526430001|**Teams**|

### <a name="BKMK_mspcat_CodeRepo"></a> mspcat_CodeRepo

|Property|Value|
|---|---|
|Description|**Code repository where the source code for this submission lives**|
|DisplayName|**Code Repository**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_coderepo`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|500|

### <a name="BKMK_mspcat_ComponentLogicalName"></a> mspcat_ComponentLogicalName

|Property|Value|
|---|---|
|Description|**Logical name of the component to launch when completed**|
|DisplayName|**Component Logical Name**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_componentlogicalname`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_mspcat_DeployType"></a> mspcat_DeployType

|Property|Value|
|---|---|
|Description|**Describes how a given application will be deployed when acquired.**|
|DisplayName|**Deploy Type**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_deploytype`|
|RequiredLevel|ApplicationRequired|
|Type|Picklist|
|DefaultFormValue|526430000|
|GlobalChoiceName|`mspcat_applications_deploytype`|

#### mspcat_DeployType Choices/Options

|Value|Label|
|---|---|
|526430000|**Normal**|
|526430001|**Template**|

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
|MaxLength|10000|

### <a name="BKMK_mspcat_EngineeringContact"></a> mspcat_EngineeringContact

|Property|Value|
|---|---|
|Description|**This will be the engineering contact used to by the approval team to communicate with the publisher.**|
|DisplayName|**Engineering Contact**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_engineeringcontact`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|contact|

### <a name="BKMK_mspcat_HelpLink"></a> mspcat_HelpLink

|Property|Value|
|---|---|
|Description|**Link to Documentation or Help for this Catalog Item.**|
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
|MaxLength|500|

### <a name="BKMK_mspcat_LastSyncDate"></a> mspcat_LastSyncDate

|Property|Value|
|---|---|
|Description|**Date record was last synced from TPS**|
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

### <a name="BKMK_mspcat_LegalTerms"></a> mspcat_LegalTerms

|Property|Value|
|---|---|
|Description|**Legal Terms ( long form ) that are associated with this catalog item**|
|DisplayName|**Legal Terms**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_legalterms`|
|RequiredLevel|None|
|Type|Memo|
|Format|Text|
|FormatName|RichText|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|18000|

### <a name="BKMK_mspcat_LegalTermsLink"></a> mspcat_LegalTermsLink

|Property|Value|
|---|---|
|Description|**Link to legal terms for this catalog item.**|
|DisplayName|**Legal Terms Link**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_legaltermslink`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|500|

### <a name="BKMK_mspcat_name"></a> mspcat_name

|Property|Value|
|---|---|
|Description|**The name of the custom entity.**|
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
|MaxLength|100|

### <a name="BKMK_mspcat_PackageAsset"></a> mspcat_PackageAsset

|Property|Value|
|---|---|
|Description|**Package Asset that will be deployed**|
|DisplayName|**Package Asset**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_packageasset`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|mspcat_packages|

### <a name="BKMK_mspcat_PostInstallOperationType"></a> mspcat_PostInstallOperationType

|Property|Value|
|---|---|
|Description|**This stores the action to execute post install**|
|DisplayName|**Post Install Operation Type**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_postinstalloperationtype`|
|RequiredLevel|ApplicationRequired|
|Type|Picklist|
|DefaultFormValue|0|
|GlobalChoiceName|`mspcat_mspcat_applications_mspcat_postinstalloperationtype`|

#### mspcat_PostInstallOperationType Choices/Options

|Value|Label|
|---|---|
|0|**None**|
|1|**Editor**|
|2|**Player**|
|3|**Solution**|

### <a name="BKMK_mspcat_PrivacyPolicyUrl"></a> mspcat_PrivacyPolicyUrl

|Property|Value|
|---|---|
|Description|**Link to privacy policy to display**|
|DisplayName|**Privacy Policy Link**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_privacypolicyurl`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|500|

### <a name="BKMK_mspcat_PublisherId"></a> mspcat_PublisherId

|Property|Value|
|---|---|
|Description||
|DisplayName|**Publishers**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_publisherid`|
|RequiredLevel|ApplicationRequired|
|Type|Lookup|
|Targets|mspcat_publisher|

### <a name="BKMK_mspcat_PushedDate"></a> mspcat_PushedDate

|Property|Value|
|---|---|
|Description|**Last Date that this was pushed to TPS\PES**|
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

### <a name="BKMK_mspcat_RequireEntitlement"></a> mspcat_RequireEntitlement

|Property|Value|
|---|---|
|Description||
|DisplayName|**RequireEntitlement**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_requireentitlement`|
|RequiredLevel|None|
|Type|Boolean|
|GlobalChoiceName|`mspcat_applications_mspcat_requireentitlement`|
|DefaultValue|False|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_SinglePageApplicationUrl"></a> mspcat_SinglePageApplicationUrl

|Property|Value|
|---|---|
|Description|**SPA**|
|DisplayName|**SinglePageApplicationUrl**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_singlepageapplicationurl`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|300|

### <a name="BKMK_mspcat_SupportContact"></a> mspcat_SupportContact

|Property|Value|
|---|---|
|Description|**This refers to the support user contact**|
|DisplayName|**Support Contact**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_supportcontact`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|contact|

### <a name="BKMK_mspcat_SupportedApplicationTypes"></a> mspcat_SupportedApplicationTypes

|Property|Value|
|---|---|
|Description||
|DisplayName|**Supported Application Types**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_supportedapplicationtypes`|
|RequiredLevel|None|
|Type|MultiSelectPicklist|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_mspcat_applications_mspcat_supportedapplicationtypes`|

#### mspcat_SupportedApplicationTypes Choices/Options

|Value|Label|
|---|---|
|1|**CanvasApps**|
|2|**ModelApps**|
|3|**PowerPortals**|
|4|**PowerAutomate**|

### <a name="BKMK_mspcat_SupportsAppType"></a> mspcat_SupportsAppType

|Property|Value|
|---|---|
|Description|**Identifies the type of UI that this component or application works with**|
|DisplayName|**Supports App Type**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_supportsapptype`|
|RequiredLevel|None|
|Type|MultiSelectPicklist|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_catalogapptypes`|

#### mspcat_SupportsAppType Choices/Options

|Value|Label|
|---|---|
|1|**Canvas Apps**|
|2|**Model Apps**|
|3|**Power Portals**|
|4|**Power Automate**|

### <a name="BKMK_mspcat_TargetStudioType"></a> mspcat_TargetStudioType

|Property|Value|
|---|---|
|Description|**Describes which surface needs to be opened post install**|
|DisplayName|**Target Studio Type**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_targetstudiotype`|
|RequiredLevel|ApplicationRequired|
|Type|Picklist|
|DefaultFormValue|0|
|GlobalChoiceName|`mspcat_mspcat_applications_mspcat_targetstudiotype`|

#### mspcat_TargetStudioType Choices/Options

|Value|Label|
|---|---|
|0|**Default**|
|1|**PowerApps**|
|2|**PowerAutomate**|
|3|**Pages**|
|4|**Bots**|

### <a name="BKMK_mspcat_TPSID"></a> mspcat_TPSID

|Property|Value|
|---|---|
|Description|**Application ID that will be used as the key for external systems.  Must be unique**|
|DisplayName|**Catalog Item Id**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_tpsid`|
|RequiredLevel|ApplicationRequired|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|150|

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
|Description|**Status of the Applications**|
|DisplayName|**Status**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statecode`|
|RequiredLevel|SystemRequired|
|Type|State|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_applications_statecode`|

#### statecode Choices/Options

|Value|Details|
|---|---|
|0|Label: **Active**<br />DefaultStatus: 3<br />InvariantName: `Active`|
|1|Label: **Inactive**<br />DefaultStatus: 2<br />InvariantName: `Inactive`|

### <a name="BKMK_statuscode"></a> statuscode

|Property|Value|
|---|---|
|Description|**Reason for the status of the Applications**|
|DisplayName|**Status Reason**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statuscode`|
|RequiredLevel|None|
|Type|Status|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_applications_statuscode`|

#### statuscode Choices/Options

|Value|Details|
|---|---|
|1|Label: **Active**<br />State:0<br />TransitionData: None|
|2|Label: **Inactive**<br />State:1<br />TransitionData: None|
|3|Label: **Draft**<br />State:0<br />TransitionData: None|
|526430000|Label: **Published**<br />State:0<br />TransitionData: None|
|526430001|Label: **Rejected**<br />State:1<br />TransitionData: None|
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

- [business_unit_mspcat_applications](#BKMK_business_unit_mspcat_applications)
- [lk_mspcat_applications_createdby](#BKMK_lk_mspcat_applications_createdby)
- [lk_mspcat_applications_createdonbehalfby](#BKMK_lk_mspcat_applications_createdonbehalfby)
- [lk_mspcat_applications_modifiedby](#BKMK_lk_mspcat_applications_modifiedby)
- [lk_mspcat_applications_modifiedonbehalfby](#BKMK_lk_mspcat_applications_modifiedonbehalfby)
- [mspcat_contact_mspcat_applications_EngineeringContact](#BKMK_mspcat_contact_mspcat_applications_EngineeringContact)
- [mspcat_contact_mspcat_applications_SupportContact](#BKMK_mspcat_contact_mspcat_applications_SupportContact)
- [mspcat_mspcat_applications_applicationitemcrossr](#BKMK_mspcat_mspcat_applications_applicationitemcrossr)
- [mspcat_mspcat_applications_PackageAsset_mspcat_p](#BKMK_mspcat_mspcat_applications_PackageAsset_mspcat_p)
- [mspcat_mspcat_publisher_mspcat_applications_PublisherId](#BKMK_mspcat_mspcat_publisher_mspcat_applications_PublisherId)
- [owner_mspcat_applications](#BKMK_owner_mspcat_applications)
- [team_mspcat_applications](#BKMK_team_mspcat_applications)
- [user_mspcat_applications](#BKMK_user_mspcat_applications)

### <a name="BKMK_business_unit_mspcat_applications"></a> business_unit_mspcat_applications

One-To-Many Relationship: [businessunit business_unit_mspcat_applications](businessunit.md#BKMK_business_unit_mspcat_applications)

|Property|Value|
|---|---|
|ReferencedEntity|`businessunit`|
|ReferencedAttribute|`businessunitid`|
|ReferencingAttribute|`owningbusinessunit`|
|ReferencingEntityNavigationPropertyName|`owningbusinessunit`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Restrict`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_applications_createdby"></a> lk_mspcat_applications_createdby

One-To-Many Relationship: [systemuser lk_mspcat_applications_createdby](systemuser.md#BKMK_lk_mspcat_applications_createdby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`createdby`|
|ReferencingEntityNavigationPropertyName|`createdby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_applications_createdonbehalfby"></a> lk_mspcat_applications_createdonbehalfby

One-To-Many Relationship: [systemuser lk_mspcat_applications_createdonbehalfby](systemuser.md#BKMK_lk_mspcat_applications_createdonbehalfby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`createdonbehalfby`|
|ReferencingEntityNavigationPropertyName|`createdonbehalfby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_applications_modifiedby"></a> lk_mspcat_applications_modifiedby

One-To-Many Relationship: [systemuser lk_mspcat_applications_modifiedby](systemuser.md#BKMK_lk_mspcat_applications_modifiedby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`modifiedby`|
|ReferencingEntityNavigationPropertyName|`modifiedby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_lk_mspcat_applications_modifiedonbehalfby"></a> lk_mspcat_applications_modifiedonbehalfby

One-To-Many Relationship: [systemuser lk_mspcat_applications_modifiedonbehalfby](systemuser.md#BKMK_lk_mspcat_applications_modifiedonbehalfby)

|Property|Value|
|---|---|
|ReferencedEntity|`systemuser`|
|ReferencedAttribute|`systemuserid`|
|ReferencingAttribute|`modifiedonbehalfby`|
|ReferencingEntityNavigationPropertyName|`modifiedonbehalfby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_contact_mspcat_applications_EngineeringContact"></a> mspcat_contact_mspcat_applications_EngineeringContact

One-To-Many Relationship: [contact mspcat_contact_mspcat_applications_EngineeringContact](contact.md#BKMK_mspcat_contact_mspcat_applications_EngineeringContact)

|Property|Value|
|---|---|
|ReferencedEntity|`contact`|
|ReferencedAttribute|`contactid`|
|ReferencingAttribute|`mspcat_engineeringcontact`|
|ReferencingEntityNavigationPropertyName|`mspcat_EngineeringContact`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `Cascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_contact_mspcat_applications_SupportContact"></a> mspcat_contact_mspcat_applications_SupportContact

One-To-Many Relationship: [contact mspcat_contact_mspcat_applications_SupportContact](contact.md#BKMK_mspcat_contact_mspcat_applications_SupportContact)

|Property|Value|
|---|---|
|ReferencedEntity|`contact`|
|ReferencedAttribute|`contactid`|
|ReferencingAttribute|`mspcat_supportcontact`|
|ReferencingEntityNavigationPropertyName|`mspcat_SupportContact`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `Cascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_mspcat_applications_applicationitemcrossr"></a> mspcat_mspcat_applications_applicationitemcrossr

One-To-Many Relationship: [mspcat_applicationreference mspcat_mspcat_applications_applicationitemcrossr](mspcat_applicationreference.md#BKMK_mspcat_mspcat_applications_applicationitemcrossr)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applicationreference`|
|ReferencedAttribute|`mspcat_applicationreferenceid`|
|ReferencingAttribute|`mspcat_applicationitemcrossreferance`|
|ReferencingEntityNavigationPropertyName|`mspcat_applicationitemcrossreferance`|
|IsHierarchical||
|CascadeConfiguration|Archive: `RemoveLink`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_mspcat_applications_PackageAsset_mspcat_p"></a> mspcat_mspcat_applications_PackageAsset_mspcat_p

One-To-Many Relationship: [mspcat_packages mspcat_mspcat_applications_PackageAsset_mspcat_p](mspcat_packages.md#BKMK_mspcat_mspcat_applications_PackageAsset_mspcat_p)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`mspcat_packageasset`|
|ReferencingEntityNavigationPropertyName|`mspcat_PackageAsset`|
|IsHierarchical||
|CascadeConfiguration|Archive: `RemoveLink`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_mspcat_publisher_mspcat_applications_PublisherId"></a> mspcat_mspcat_publisher_mspcat_applications_PublisherId

One-To-Many Relationship: [mspcat_publisher mspcat_mspcat_publisher_mspcat_applications_PublisherId](mspcat_publisher.md#BKMK_mspcat_mspcat_publisher_mspcat_applications_PublisherId)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`mspcat_publisherid`|
|ReferencingEntityNavigationPropertyName|`mspcat_PublisherId`|
|IsHierarchical||
|CascadeConfiguration|Archive: `Cascade`<br />Assign: `Cascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `Cascade`<br />RollupView: `NoCascade`<br />Share: `Cascade`<br />Unshare: `Cascade`|

### <a name="BKMK_owner_mspcat_applications"></a> owner_mspcat_applications

One-To-Many Relationship: [owner owner_mspcat_applications](owner.md#BKMK_owner_mspcat_applications)

|Property|Value|
|---|---|
|ReferencedEntity|`owner`|
|ReferencedAttribute|`ownerid`|
|ReferencingAttribute|`ownerid`|
|ReferencingEntityNavigationPropertyName|`ownerid`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_team_mspcat_applications"></a> team_mspcat_applications

One-To-Many Relationship: [team team_mspcat_applications](team.md#BKMK_team_mspcat_applications)

|Property|Value|
|---|---|
|ReferencedEntity|`team`|
|ReferencedAttribute|`teamid`|
|ReferencingAttribute|`owningteam`|
|ReferencingEntityNavigationPropertyName|`owningteam`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_user_mspcat_applications"></a> user_mspcat_applications

One-To-Many Relationship: [systemuser user_mspcat_applications](systemuser.md#BKMK_user_mspcat_applications)

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

- [mspcat_applications_ActivityPointers](#BKMK_mspcat_applications_ActivityPointers)
- [mspcat_applications_adx_inviteredemptions](#BKMK_mspcat_applications_adx_inviteredemptions)
- [mspcat_applications_adx_portalcomments](#BKMK_mspcat_applications_adx_portalcomments)
- [mspcat_applications_Annotations](#BKMK_mspcat_applications_Annotations)
- [mspcat_applications_Appointments](#BKMK_mspcat_applications_Appointments)
- [mspcat_applications_AsyncOperations](#BKMK_mspcat_applications_AsyncOperations)
- [mspcat_applications_BulkDeleteFailures](#BKMK_mspcat_applications_BulkDeleteFailures)
- [mspcat_applications_chats](#BKMK_mspcat_applications_chats)
- [mspcat_applications_connections1](#BKMK_mspcat_applications_connections1)
- [mspcat_applications_connections2](#BKMK_mspcat_applications_connections2)
- [mspcat_applications_DuplicateBaseRecord](#BKMK_mspcat_applications_DuplicateBaseRecord)
- [mspcat_applications_DuplicateMatchingRecord](#BKMK_mspcat_applications_DuplicateMatchingRecord)
- [mspcat_applications_Emails](#BKMK_mspcat_applications_Emails)
- [mspcat_applications_Faxes](#BKMK_mspcat_applications_Faxes)
- [mspcat_applications_Feedback](#BKMK_mspcat_applications_Feedback)
- [mspcat_applications_Letters](#BKMK_mspcat_applications_Letters)
- [mspcat_applications_MailboxTrackingFolders](#BKMK_mspcat_applications_MailboxTrackingFolders)
- [mspcat_applications_mspcat_InstallActivities](#BKMK_mspcat_applications_mspcat_InstallActivities)
- [mspcat_applications_PhoneCalls](#BKMK_mspcat_applications_PhoneCalls)
- [mspcat_applications_PrincipalObjectAttributeAccesses](#BKMK_mspcat_applications_PrincipalObjectAttributeAccesses)
- [mspcat_applications_ProcessSession](#BKMK_mspcat_applications_ProcessSession)
- [mspcat_applications_RecurringAppointmentMasters](#BKMK_mspcat_applications_RecurringAppointmentMasters)
- [mspcat_applications_SocialActivities](#BKMK_mspcat_applications_SocialActivities)
- [mspcat_applications_SyncErrors](#BKMK_mspcat_applications_SyncErrors)
- [mspcat_applications_Tasks](#BKMK_mspcat_applications_Tasks)
- [mspcat_CatalogItemFile_CatalogItem_mspcat](#BKMK_mspcat_CatalogItemFile_CatalogItem_mspcat)
- [mspcat_mspcat_applications_mspcat_certificationrequest_Application](#BKMK_mspcat_mspcat_applications_mspcat_certificationrequest_Application)
- [mspcat_mspcat_applications_mspcat_crmgeodeploymentstatus_Application](#BKMK_mspcat_mspcat_applications_mspcat_crmgeodeploymentstatus_Application)
- [mspcat_mspcat_installhistory_CatalogItem_mspcat_](#BKMK_mspcat_mspcat_installhistory_CatalogItem_mspcat_)

### <a name="BKMK_mspcat_applications_ActivityPointers"></a> mspcat_applications_ActivityPointers

Many-To-One Relationship: [activitypointer mspcat_applications_ActivityPointers](activitypointer.md#BKMK_mspcat_applications_ActivityPointers)

|Property|Value|
|---|---|
|ReferencingEntity|`activitypointer`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_ActivityPointers`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_adx_inviteredemptions"></a> mspcat_applications_adx_inviteredemptions

Many-To-One Relationship: [adx_inviteredemption mspcat_applications_adx_inviteredemptions](adx_inviteredemption.md#BKMK_mspcat_applications_adx_inviteredemptions)

|Property|Value|
|---|---|
|ReferencingEntity|`adx_inviteredemption`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_adx_inviteredemptions`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_adx_portalcomments"></a> mspcat_applications_adx_portalcomments

Many-To-One Relationship: [adx_portalcomment mspcat_applications_adx_portalcomments](adx_portalcomment.md#BKMK_mspcat_applications_adx_portalcomments)

|Property|Value|
|---|---|
|ReferencingEntity|`adx_portalcomment`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_adx_portalcomments`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_Annotations"></a> mspcat_applications_Annotations

Many-To-One Relationship: [annotation mspcat_applications_Annotations](annotation.md#BKMK_mspcat_applications_Annotations)

|Property|Value|
|---|---|
|ReferencingEntity|`annotation`|
|ReferencingAttribute|`objectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_Annotations`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_Appointments"></a> mspcat_applications_Appointments

Many-To-One Relationship: [appointment mspcat_applications_Appointments](appointment.md#BKMK_mspcat_applications_Appointments)

|Property|Value|
|---|---|
|ReferencingEntity|`appointment`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_Appointments`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_AsyncOperations"></a> mspcat_applications_AsyncOperations

Many-To-One Relationship: [asyncoperation mspcat_applications_AsyncOperations](asyncoperation.md#BKMK_mspcat_applications_AsyncOperations)

|Property|Value|
|---|---|
|ReferencingEntity|`asyncoperation`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_AsyncOperations`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_BulkDeleteFailures"></a> mspcat_applications_BulkDeleteFailures

Many-To-One Relationship: [bulkdeletefailure mspcat_applications_BulkDeleteFailures](bulkdeletefailure.md#BKMK_mspcat_applications_BulkDeleteFailures)

|Property|Value|
|---|---|
|ReferencingEntity|`bulkdeletefailure`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_BulkDeleteFailures`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_chats"></a> mspcat_applications_chats

Many-To-One Relationship: [chat mspcat_applications_chats](chat.md#BKMK_mspcat_applications_chats)

|Property|Value|
|---|---|
|ReferencingEntity|`chat`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_chats`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_connections1"></a> mspcat_applications_connections1

Many-To-One Relationship: [connection mspcat_applications_connections1](connection.md#BKMK_mspcat_applications_connections1)

|Property|Value|
|---|---|
|ReferencingEntity|`connection`|
|ReferencingAttribute|`record1id`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_connections1`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 100<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_connections2"></a> mspcat_applications_connections2

Many-To-One Relationship: [connection mspcat_applications_connections2](connection.md#BKMK_mspcat_applications_connections2)

|Property|Value|
|---|---|
|ReferencingEntity|`connection`|
|ReferencingAttribute|`record2id`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_connections2`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_DuplicateBaseRecord"></a> mspcat_applications_DuplicateBaseRecord

Many-To-One Relationship: [duplicaterecord mspcat_applications_DuplicateBaseRecord](duplicaterecord.md#BKMK_mspcat_applications_DuplicateBaseRecord)

|Property|Value|
|---|---|
|ReferencingEntity|`duplicaterecord`|
|ReferencingAttribute|`baserecordid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_DuplicateBaseRecord`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_DuplicateMatchingRecord"></a> mspcat_applications_DuplicateMatchingRecord

Many-To-One Relationship: [duplicaterecord mspcat_applications_DuplicateMatchingRecord](duplicaterecord.md#BKMK_mspcat_applications_DuplicateMatchingRecord)

|Property|Value|
|---|---|
|ReferencingEntity|`duplicaterecord`|
|ReferencingAttribute|`duplicaterecordid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_DuplicateMatchingRecord`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_Emails"></a> mspcat_applications_Emails

Many-To-One Relationship: [email mspcat_applications_Emails](email.md#BKMK_mspcat_applications_Emails)

|Property|Value|
|---|---|
|ReferencingEntity|`email`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_Emails`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_Faxes"></a> mspcat_applications_Faxes

Many-To-One Relationship: [fax mspcat_applications_Faxes](fax.md#BKMK_mspcat_applications_Faxes)

|Property|Value|
|---|---|
|ReferencingEntity|`fax`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_Faxes`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_Feedback"></a> mspcat_applications_Feedback

Many-To-One Relationship: [feedback mspcat_applications_Feedback](feedback.md#BKMK_mspcat_applications_Feedback)

|Property|Value|
|---|---|
|ReferencingEntity|`feedback`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_Feedback`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 150<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_Letters"></a> mspcat_applications_Letters

Many-To-One Relationship: [letter mspcat_applications_Letters](letter.md#BKMK_mspcat_applications_Letters)

|Property|Value|
|---|---|
|ReferencingEntity|`letter`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_Letters`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_MailboxTrackingFolders"></a> mspcat_applications_MailboxTrackingFolders

Many-To-One Relationship: [mailboxtrackingfolder mspcat_applications_MailboxTrackingFolders](mailboxtrackingfolder.md#BKMK_mspcat_applications_MailboxTrackingFolders)

|Property|Value|
|---|---|
|ReferencingEntity|`mailboxtrackingfolder`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_MailboxTrackingFolders`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_mspcat_InstallActivities"></a> mspcat_applications_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity mspcat_applications_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_mspcat_applications_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_PhoneCalls"></a> mspcat_applications_PhoneCalls

Many-To-One Relationship: [phonecall mspcat_applications_PhoneCalls](phonecall.md#BKMK_mspcat_applications_PhoneCalls)

|Property|Value|
|---|---|
|ReferencingEntity|`phonecall`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_PhoneCalls`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_PrincipalObjectAttributeAccesses"></a> mspcat_applications_PrincipalObjectAttributeAccesses

Many-To-One Relationship: [principalobjectattributeaccess mspcat_applications_PrincipalObjectAttributeAccesses](principalobjectattributeaccess.md#BKMK_mspcat_applications_PrincipalObjectAttributeAccesses)

|Property|Value|
|---|---|
|ReferencingEntity|`principalobjectattributeaccess`|
|ReferencingAttribute|`objectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_PrincipalObjectAttributeAccesses`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_ProcessSession"></a> mspcat_applications_ProcessSession

Many-To-One Relationship: [processsession mspcat_applications_ProcessSession](processsession.md#BKMK_mspcat_applications_ProcessSession)

|Property|Value|
|---|---|
|ReferencingEntity|`processsession`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_ProcessSession`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_RecurringAppointmentMasters"></a> mspcat_applications_RecurringAppointmentMasters

Many-To-One Relationship: [recurringappointmentmaster mspcat_applications_RecurringAppointmentMasters](recurringappointmentmaster.md#BKMK_mspcat_applications_RecurringAppointmentMasters)

|Property|Value|
|---|---|
|ReferencingEntity|`recurringappointmentmaster`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_RecurringAppointmentMasters`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_SocialActivities"></a> mspcat_applications_SocialActivities

Many-To-One Relationship: [socialactivity mspcat_applications_SocialActivities](socialactivity.md#BKMK_mspcat_applications_SocialActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`socialactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_SocialActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_SyncErrors"></a> mspcat_applications_SyncErrors

Many-To-One Relationship: [syncerror mspcat_applications_SyncErrors](syncerror.md#BKMK_mspcat_applications_SyncErrors)

|Property|Value|
|---|---|
|ReferencingEntity|`syncerror`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_SyncErrors`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_applications_Tasks"></a> mspcat_applications_Tasks

Many-To-One Relationship: [task mspcat_applications_Tasks](task.md#BKMK_mspcat_applications_Tasks)

|Property|Value|
|---|---|
|ReferencingEntity|`task`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_applications_Tasks`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_CatalogItemFile_CatalogItem_mspcat"></a> mspcat_CatalogItemFile_CatalogItem_mspcat

Many-To-One Relationship: [mspcat_catalogitemfile mspcat_CatalogItemFile_CatalogItem_mspcat](mspcat_catalogitemfile.md#BKMK_mspcat_CatalogItemFile_CatalogItem_mspcat)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogitemfile`|
|ReferencingAttribute|`mspcat_catalogitem`|
|ReferencedEntityNavigationPropertyName|`mspcat_CatalogItemFile_CatalogItem_mspcat`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_applications_mspcat_certificationrequest_Application"></a> mspcat_mspcat_applications_mspcat_certificationrequest_Application

Many-To-One Relationship: [mspcat_certificationrequest mspcat_mspcat_applications_mspcat_certificationrequest_Application](mspcat_certificationrequest.md#BKMK_mspcat_mspcat_applications_mspcat_certificationrequest_Application)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`mspcat_application`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_applications_mspcat_certificationrequest_Application`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_applications_mspcat_crmgeodeploymentstatus_Application"></a> mspcat_mspcat_applications_mspcat_crmgeodeploymentstatus_Application

Many-To-One Relationship: [mspcat_crmgeodeploymentstatus mspcat_mspcat_applications_mspcat_crmgeodeploymentstatus_Application](mspcat_crmgeodeploymentstatus.md#BKMK_mspcat_mspcat_applications_mspcat_crmgeodeploymentstatus_Application)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeodeploymentstatus`|
|ReferencingAttribute|`mspcat_application`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_applications_mspcat_crmgeodeploymentstatus_Application`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_installhistory_CatalogItem_mspcat_"></a> mspcat_mspcat_installhistory_CatalogItem_mspcat_

Many-To-One Relationship: [mspcat_installhistory mspcat_mspcat_installhistory_CatalogItem_mspcat_](mspcat_installhistory.md#BKMK_mspcat_mspcat_installhistory_CatalogItem_mspcat_)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`mspcat_catalogitem`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_installhistory_CatalogItem_mspcat_`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|


## Many-to-Many relationships

These relationships are many-to-many. Listed by **SchemaName**.

- [mspcat_app_policy_reln](#BKMK_mspcat_app_policy_reln)
- [mspcat_contact_mspcat_applications](#BKMK_mspcat_contact_mspcat_applications)
- [mspcat_mspcat_app_autoapproved_geo](#BKMK_mspcat_mspcat_app_autoapproved_geo)
- [mspcat_mspcat_crmgeo_mspcat_applications](#BKMK_mspcat_mspcat_crmgeo_mspcat_applications)
- [mspcat_mspcat_packages_mspcat_applications](#BKMK_mspcat_mspcat_packages_mspcat_applications)

### <a name="BKMK_mspcat_app_policy_reln"></a> mspcat_app_policy_reln

See [mspcat_staticanalysispolicy mspcat_app_policy_reln Many-To-Many Relationship](mspcat_staticanalysispolicy.md#BKMK_mspcat_app_policy_reln)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_app_policy_reln_entity`|
|IsCustomizable|True|
|SchemaName|`mspcat_app_policy_reln`|
|IntersectAttribute|`mspcat_applicationsid`|
|NavigationPropertyName|`mspcat_app_policy_reln`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_contact_mspcat_applications"></a> mspcat_contact_mspcat_applications

See [contact mspcat_contact_mspcat_applications Many-To-Many Relationship](contact.md#BKMK_mspcat_contact_mspcat_applications)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_contact_mspcat_applications`|
|IsCustomizable|True|
|SchemaName|`mspcat_contact_mspcat_applications`|
|IntersectAttribute|`mspcat_applicationsid`|
|NavigationPropertyName|`mspcat_contact_mspcat_applications`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_app_autoapproved_geo"></a> mspcat_mspcat_app_autoapproved_geo

See [mspcat_crmgeo mspcat_mspcat_app_autoapproved_geo Many-To-Many Relationship](mspcat_crmgeo.md#BKMK_mspcat_mspcat_app_autoapproved_geo)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_mspcat_app_autoapproved_geo_reln`|
|IsCustomizable|True|
|SchemaName|`mspcat_mspcat_app_autoapproved_geo`|
|IntersectAttribute|`mspcat_applicationsid`|
|NavigationPropertyName|`mspcat_mspcat_app_autoapproved_geo`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseLabel`<br />Group: `Details`<br />Label: Auto-approved apps<br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_crmgeo_mspcat_applications"></a> mspcat_mspcat_crmgeo_mspcat_applications

See [mspcat_crmgeo mspcat_mspcat_crmgeo_mspcat_applications Many-To-Many Relationship](mspcat_crmgeo.md#BKMK_mspcat_mspcat_crmgeo_mspcat_applications)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_mspcat_crmgeo_mspcat_applications`|
|IsCustomizable|True|
|SchemaName|`mspcat_mspcat_crmgeo_mspcat_applications`|
|IntersectAttribute|`mspcat_applicationsid`|
|NavigationPropertyName|`mspcat_mspcat_crmgeo_mspcat_applications`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_packages_mspcat_applications"></a> mspcat_mspcat_packages_mspcat_applications

See [mspcat_packages mspcat_mspcat_packages_mspcat_applications Many-To-Many Relationship](mspcat_packages.md#BKMK_mspcat_mspcat_packages_mspcat_applications)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_mspcat_packages_mspcat_applications`|
|IsCustomizable|True|
|SchemaName|`mspcat_mspcat_packages_mspcat_applications`|
|IntersectAttribute|`mspcat_applicationsid`|
|NavigationPropertyName|`mspcat_mspcat_packages_mspcat_applications`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   

