---
title: "Approval Request (mspcat_certificationrequest) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Approval Request (mspcat_certificationrequest) table/entity with Power Platform Catalog Manager."
ms.date: 11/05/2024
ms.service: power-platform
ms.topic: generated-reference
author: isaacwinoto
ms.author: isaacwinoto
search.audienceType: 
  - developer
---

# Approval Request (mspcat_certificationrequest) table/entity reference

Contains Approval records that are used to process new or updated submissions to the catalog system.

## Messages

The following table lists the messages for the Approval Request (mspcat_certificationrequest) table.
Messages represent operations that can be performed on the table. They may also be events.

| Name <br />Is Event? |Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `Assign`<br />Event: True |`PATCH` /mspcat_certificationrequests(*mspcat_certificationrequestid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `ownerid` property. |<xref:Microsoft.Crm.Sdk.Messages.AssignRequest>|
| `Create`<br />Event: True |`POST` /mspcat_certificationrequests<br />See [Create](/powerapps/developer/data-platform/webapi/create-entity-web-api) |[Create records](/power-apps/developer/data-platform/org-service/entity-operations-create#basic-create)|
| `CreateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.CreateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.CreateMultipleRequest>|
| `Delete`<br />Event: True |`DELETE` /mspcat_certificationrequests(*mspcat_certificationrequestid*)<br />See [Delete](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-delete) |[Delete records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-delete)|
| `GrantAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.GrantAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.GrantAccessRequest>|
| `IsValidStateTransition`<br />Event: False |<xref:Microsoft.Dynamics.CRM.IsValidStateTransition?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.IsValidStateTransitionRequest>|
| `ModifyAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.ModifyAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.ModifyAccessRequest>|
| `mspcat_ResolveApproval`<br />Event: False |**mspcat_ResolveApproval action** |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Restore`<br />Event: True |<xref:Microsoft.Dynamics.CRM.Restore?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retrieve`<br />Event: True |`GET` /mspcat_certificationrequests(*mspcat_certificationrequestid*)<br />See [Retrieve](/powerapps/developer/data-platform/webapi/retrieve-entity-using-web-api) |[Retrieve records](/power-apps/developer/data-platform/org-service/entity-operations-retrieve)|
| `RetrieveMultiple`<br />Event: True |`GET` /mspcat_certificationrequests<br />See [Query data](/power-apps/developer/data-platform/webapi/query-data-web-api) |[Query data](/power-apps/developer/data-platform/org-service/entity-operations-query-data)|
| `RetrievePrincipalAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrievePrincipalAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrievePrincipalAccessRequest>|
| `RetrieveSharedPrincipalsAndAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RetrieveSharedPrincipalsAndAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RetrieveSharedPrincipalsAndAccessRequest>|
| `RevokeAccess`<br />Event: True |<xref:Microsoft.Dynamics.CRM.RevokeAccess?displayProperty=nameWithType /> |<xref:Microsoft.Crm.Sdk.Messages.RevokeAccessRequest>|
| `SetState`<br />Event: True |`PATCH` /mspcat_certificationrequests(*mspcat_certificationrequestid*)<br />[Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) the `statecode` and `statuscode` properties. |<xref:Microsoft.Crm.Sdk.Messages.SetStateRequest>|
| `Update`<br />Event: True |`PATCH` /mspcat_certificationrequests(*mspcat_certificationrequestid*)<br />See [Update](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update) |[Update records](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-update)|
| `UpdateMultiple`<br />Event: True |<xref:Microsoft.Dynamics.CRM.UpdateMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpdateMultipleRequest>|
| `Upsert`<br />Event: False |`PATCH` /mspcat_certificationrequests(*mspcat_certificationrequestid*)<br />See [Upsert a table row](/powerapps/developer/data-platform/webapi/update-delete-entities-using-web-api#upsert-a-table-row) |<xref:Microsoft.Xrm.Sdk.Messages.UpsertRequest>|
| `UpsertMultiple`<br />Event: False |<xref:Microsoft.Dynamics.CRM.UpsertMultiple?displayProperty=nameWithType /> |<xref:Microsoft.Xrm.Sdk.Messages.UpsertMultipleRequest>|


## Events

The following table lists the events for the Approval Request (mspcat_certificationrequest) table.
Events are messages that exist so that you can subscribe to them. Unless you added the event, you shouldn't invoke the message, only subscribe to it.

|Name|Web API Operation |SDK for .NET |
| ---- | ----- |----- |
| `BulkRetain`|<xref:Microsoft.Dynamics.CRM.BulkRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `PurgeRetainedContent`|<xref:Microsoft.Dynamics.CRM.PurgeRetainedContent?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `Retain`|<xref:Microsoft.Dynamics.CRM.Retain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `RollbackRetain`|<xref:Microsoft.Dynamics.CRM.RollbackRetain?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|
| `ValidateRetentionConfig`|<xref:Microsoft.Dynamics.CRM.ValidateRetentionConfig?displayProperty=nameWithType /> |[Learn to use messages with the SDK for .NET](/power-apps/developer/data-platform/org-service/use-messages)|

## Properties

The following table lists selected properties for the Approval Request (mspcat_certificationrequest) table.

|Property|Value|
| --- | --- |
| **DisplayName** | **Approval Request** |
| **DisplayCollectionName** | **Approval Requests** |
| **SchemaName** | `mspcat_certificationrequest` |
| **CollectionSchemaName** | `mspcat_certificationrequests` |
| **EntitySetName** | `mspcat_certificationrequests`|
| **LogicalName** | `mspcat_certificationrequest` |
| **LogicalCollectionName** | `mspcat_certificationrequests` |
| **PrimaryIdAttribute** | `mspcat_certificationrequestid` |
| **PrimaryNameAttribute** |`mspcat_requestname` |
| **TableType** | `Standard` |
| **OwnershipType** | `UserOwned` |

## Writable columns/attributes

These columns/attributes return true for either **IsValidForCreate** or **IsValidForUpdate** (usually both). Listed by **SchemaName**.

- [ImportSequenceNumber](#BKMK_ImportSequenceNumber)
- [LastOnHoldTime](#BKMK_LastOnHoldTime)
- [mspcat_Application](#BKMK_mspcat_Application)
- [mspcat_autoapproved](#BKMK_mspcat_autoapproved)
- [mspcat_certduration](#BKMK_mspcat_certduration)
- [mspcat_certenddate](#BKMK_mspcat_certenddate)
- [mspcat_certificationrequestId](#BKMK_mspcat_certificationrequestId)
- [mspcat_certstartdate](#BKMK_mspcat_certstartdate)
- [mspcat_codereview](#BKMK_mspcat_codereview)
- [mspcat_CRMPackageDropLocation](#BKMK_mspcat_CRMPackageDropLocation)
- [mspcat_CRMWorkingPackageDropPath](#BKMK_mspcat_CRMWorkingPackageDropPath)
- [mspcat_DropContainsMultiplePackages](#BKMK_mspcat_DropContainsMultiplePackages)
- [mspcat_functionalvalidation](#BKMK_mspcat_functionalvalidation)
- [mspcat_internalreview](#BKMK_mspcat_internalreview)
- [mspcat_isvduration](#BKMK_mspcat_isvduration)
- [mspcat_isvresponded](#BKMK_mspcat_isvresponded)
- [mspcat_isvwaitingstarttime](#BKMK_mspcat_isvwaitingstarttime)
- [mspcat_MarketingOnlyChange](#BKMK_mspcat_MarketingOnlyChange)
- [mspcat_OperationId](#BKMK_mspcat_OperationId)
- [mspcat_OperationType](#BKMK_mspcat_OperationType)
- [mspcat_packagedeployment](#BKMK_mspcat_packagedeployment)
- [mspcat_Publisher](#BKMK_mspcat_Publisher)
- [mspcat_PublishVersion](#BKMK_mspcat_PublishVersion)
- [mspcat_RequestAssetId](#BKMK_mspcat_RequestAssetId)
- [mspcat_RequestAssetVersion](#BKMK_mspcat_RequestAssetVersion)
- [mspcat_RequestCorrelationId](#BKMK_mspcat_RequestCorrelationId)
- [mspcat_requestname](#BKMK_mspcat_requestname)
- [mspcat_RequestsAccesstoTSPEvents](#BKMK_mspcat_RequestsAccesstoTSPEvents)
- [mspcat_RequestSource](#BKMK_mspcat_RequestSource)
- [mspcat_RequestsSecureStoreAccess](#BKMK_mspcat_RequestsSecureStoreAccess)
- [mspcat_securityreview](#BKMK_mspcat_securityreview)
- [mspcat_stagename](#BKMK_mspcat_stagename)
- [mspcat_summaryscanstatus](#BKMK_mspcat_summaryscanstatus)
- [mspcat_Supersededby](#BKMK_mspcat_Supersededby)
- [mspcat_totalduration](#BKMK_mspcat_totalduration)
- [OverriddenCreatedOn](#BKMK_OverriddenCreatedOn)
- [OwnerId](#BKMK_OwnerId)
- [OwnerIdType](#BKMK_OwnerIdType)
- [processid](#BKMK_processid)
- [SLAId](#BKMK_SLAId)
- [stageid](#BKMK_stageid)
- [statecode](#BKMK_statecode)
- [statuscode](#BKMK_statuscode)
- [TimeZoneRuleVersionNumber](#BKMK_TimeZoneRuleVersionNumber)
- [traversedpath](#BKMK_traversedpath)
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

### <a name="BKMK_LastOnHoldTime"></a> LastOnHoldTime

|Property|Value|
|---|---|
|Description|**Contains the date and time stamp of the last on-hold time**|
|DisplayName|**Last On Hold Time**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`lastonholdtime`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|False|
|DateTimeBehavior|UserLocal|
|Format|DateAndTime|
|ImeMode|Inactive|
|SourceTypeMask|0|

### <a name="BKMK_mspcat_Application"></a> mspcat_Application

|Property|Value|
|---|---|
|Description|**Application that this submission concerns.**|
|DisplayName|**Catalog Item**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_application`|
|RequiredLevel|Recommended|
|Type|Lookup|
|Targets|mspcat_applications|

### <a name="BKMK_mspcat_autoapproved"></a> mspcat_autoapproved

|Property|Value|
|---|---|
|Description||
|DisplayName|**Auto Approved**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_autoapproved`|
|RequiredLevel|None|
|Type|Boolean|
|GlobalChoiceName|`mspcat_certificationrequest_mspcat_autoapproved`|
|DefaultValue|False|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_certduration"></a> mspcat_certduration

|Property|Value|
|---|---|
|Description||
|DisplayName|**Cert Duration**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_certduration`|
|RequiredLevel|None|
|Type|Integer|
|MaxValue|2147483647|
|MinValue|0|

### <a name="BKMK_mspcat_certenddate"></a> mspcat_certenddate

|Property|Value|
|---|---|
|Description|**Captures the date time when approval team completed the request**|
|DisplayName|**Actual End Date**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_certenddate`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|True|
|DateTimeBehavior|UserLocal|
|Format|DateAndTime|
|ImeMode|Auto|
|SourceTypeMask|0|

### <a name="BKMK_mspcat_certificationrequestId"></a> mspcat_certificationrequestId

|Property|Value|
|---|---|
|Description|**Unique identifier for entity instances**|
|DisplayName|**Certification Request**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_certificationrequestid`|
|RequiredLevel|SystemRequired|
|Type|Uniqueidentifier|

### <a name="BKMK_mspcat_certstartdate"></a> mspcat_certstartdate

|Property|Value|
|---|---|
|Description|**Captures the date time when Approval team picked up the request**|
|DisplayName|**Actual Start Date**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_certstartdate`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|True|
|DateTimeBehavior|UserLocal|
|Format|DateAndTime|
|ImeMode|Auto|
|SourceTypeMask|0|

### <a name="BKMK_mspcat_codereview"></a> mspcat_codereview

|Property|Value|
|---|---|
|Description|**shows the code review stage status.**|
|DisplayName|**Code Review**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_codereview`|
|RequiredLevel|None|
|Type|Picklist|
|DefaultFormValue|526430000|
|GlobalChoiceName|`mspcat_certificationstage`|

#### mspcat_codereview Choices/Options

|Value|Label|
|---|---|
|526430000|**Not Started**|
|526430001|**In Progress**|
|526430002|**Waiting on Submitting User**|
|526430003|**Completed**|

### <a name="BKMK_mspcat_CRMPackageDropLocation"></a> mspcat_CRMPackageDropLocation

|Property|Value|
|---|---|
|Description|**URL of the package to be picked up for processing**|
|DisplayName|**CRM Package Drop Location**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_crmpackagedroplocation`|
|RequiredLevel|None|
|Type|String|
|Format|Url|
|FormatName|Url|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|500|

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
|MaxLength|500|

### <a name="BKMK_mspcat_DropContainsMultiplePackages"></a> mspcat_DropContainsMultiplePackages

|Property|Value|
|---|---|
|Description|**indicator that the file at the drop location has more then one file in it.**|
|DisplayName|**Drop Contains Multiple Packages**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_dropcontainsmultiplepackages`|
|RequiredLevel|None|
|Type|Boolean|
|GlobalChoiceName|`mspcat_mspcat_certificationrequest_mspcat_dropcontainsmultiplepackages`|
|DefaultValue|False|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_functionalvalidation"></a> mspcat_functionalvalidation

|Property|Value|
|---|---|
|Description|**shows the Functional Validation stage status.**|
|DisplayName|**Functional Validation**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_functionalvalidation`|
|RequiredLevel|None|
|Type|Picklist|
|DefaultFormValue|526430000|
|GlobalChoiceName|`mspcat_certificationstage`|

#### mspcat_functionalvalidation Choices/Options

|Value|Label|
|---|---|
|526430000|**Not Started**|
|526430001|**In Progress**|
|526430002|**Waiting on Submitting User**|
|526430003|**Completed**|

### <a name="BKMK_mspcat_internalreview"></a> mspcat_internalreview

|Property|Value|
|---|---|
|Description|**Shows the Internal Review stage status.**|
|DisplayName|**Internal Review**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_internalreview`|
|RequiredLevel|None|
|Type|Picklist|
|DefaultFormValue|526430000|
|GlobalChoiceName|`mspcat_certificationrequest_mspcat_internalreview`|

#### mspcat_internalreview Choices/Options

|Value|Label|
|---|---|
|526430000|**Not Started**|
|526430001|**InProgress**|
|526430002|**Reviews Implemented**|
|526430003|**Review Completed**|

### <a name="BKMK_mspcat_isvduration"></a> mspcat_isvduration

|Property|Value|
|---|---|
|Description||
|DisplayName|**ISV Duration**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_isvduration`|
|RequiredLevel|None|
|Type|Integer|
|MaxValue|2147483647|
|MinValue|0|

### <a name="BKMK_mspcat_isvresponded"></a> mspcat_isvresponded

|Property|Value|
|---|---|
|Description|**Captures the ISV responded date time**|
|DisplayName|**ISV Responded**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_isvresponded`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|True|
|DateTimeBehavior|UserLocal|
|Format|DateAndTime|
|ImeMode|Auto|
|SourceTypeMask|0|

### <a name="BKMK_mspcat_isvwaitingstarttime"></a> mspcat_isvwaitingstarttime

|Property|Value|
|---|---|
|Description|**Captures the ISV waiting start time**|
|DisplayName|**ISV Waiting Start Time**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_isvwaitingstarttime`|
|RequiredLevel|None|
|Type|DateTime|
|CanChangeDateTimeBehavior|True|
|DateTimeBehavior|UserLocal|
|Format|DateAndTime|
|ImeMode|Auto|
|SourceTypeMask|0|

### <a name="BKMK_mspcat_MarketingOnlyChange"></a> mspcat_MarketingOnlyChange

|Property|Value|
|---|---|
|Description|**Indicates that this Approval Request is a Marketing Only Change request.**|
|DisplayName|**Marketing Only Change**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_marketingonlychange`|
|RequiredLevel|None|
|Type|Boolean|
|GlobalChoiceName|`mspcat_certificationrequest_mspcat_marketingonlychange`|
|DefaultValue|False|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_OperationId"></a> mspcat_OperationId

|Property|Value|
|---|---|
|Description|**Operation ID used to report status back to Calling Service**|
|DisplayName|**OperationId**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_operationid`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|50|

### <a name="BKMK_mspcat_OperationType"></a> mspcat_OperationType

|Property|Value|
|---|---|
|Description|**Operation Type passed to us by the Storefront**|
|DisplayName|**Operation Type**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_operationtype`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|500|

### <a name="BKMK_mspcat_packagedeployment"></a> mspcat_packagedeployment

|Property|Value|
|---|---|
|Description|**shows the Package Deployment Stage status.**|
|DisplayName|**Deployment**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_packagedeployment`|
|RequiredLevel|None|
|Type|Picklist|
|DefaultFormValue|526430000|
|GlobalChoiceName|`mspcat_certificationstage`|

#### mspcat_packagedeployment Choices/Options

|Value|Label|
|---|---|
|526430000|**Not Started**|
|526430001|**In Progress**|
|526430002|**Waiting on Submitting User**|
|526430003|**Completed**|

### <a name="BKMK_mspcat_Publisher"></a> mspcat_Publisher

|Property|Value|
|---|---|
|Description|**Publisher that this request concerns.**|
|DisplayName|**Publisher**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_publisher`|
|RequiredLevel|Recommended|
|Type|Lookup|
|Targets|mspcat_publisher|

### <a name="BKMK_mspcat_PublishVersion"></a> mspcat_PublishVersion

|Property|Value|
|---|---|
|Description||
|DisplayName|**Publish Version**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_publishversion`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|10|

### <a name="BKMK_mspcat_RequestAssetId"></a> mspcat_RequestAssetId

|Property|Value|
|---|---|
|Description||
|DisplayName|**Request Asset Id**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_requestassetid`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_mspcat_RequestAssetVersion"></a> mspcat_RequestAssetVersion

|Property|Value|
|---|---|
|Description||
|DisplayName|**Request Asset Version**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_requestassetversion`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_mspcat_RequestCorrelationId"></a> mspcat_RequestCorrelationId

|Property|Value|
|---|---|
|Description|**Correlation ID provided on the request for the approval.**|
|DisplayName|**Request Correlation Id**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_requestcorrelationid`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|50|

### <a name="BKMK_mspcat_requestname"></a> mspcat_requestname

|Property|Value|
|---|---|
|Description|**Request name - generated from the request data.**|
|DisplayName|**Request Name**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_requestname`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|500|

### <a name="BKMK_mspcat_RequestsAccesstoTSPEvents"></a> mspcat_RequestsAccesstoTSPEvents

|Property|Value|
|---|---|
|Description|**If true, publisher is requesting intergration to the TPS Event system**|
|DisplayName|**Requests Access to TSP Events**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_requestsaccesstotspevents`|
|RequiredLevel|None|
|Type|Boolean|
|GlobalChoiceName|`mspcat_mspcat_certificationrequest_mspcat_requestsaccesstotspevents`|
|DefaultValue|False|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_RequestSource"></a> mspcat_RequestSource

|Property|Value|
|---|---|
|Description|**Contains the Source of the approval request**|
|DisplayName|**Request Source**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_requestsource`|
|RequiredLevel|ApplicationRequired|
|Type|Picklist|
|DefaultFormValue|526430000|
|GlobalChoiceName|`mspcat_certificationrequest_requestsource`|

#### mspcat_RequestSource Choices/Options

|Value|Label|
|---|---|
|526430000|**Other**|
|526430001|**Power Automate Maker Portal**|
|526430002|**Power Platform Maker Portal**|
|526430003|**Power Virtual Agents Maker Portal**|
|526430004|**Power Platform Admin API**|
|526430005|**PAC CLI**|
|526430006|**PAC Build Task**|
|526430007|**Pipelines in Power Platform**|

### <a name="BKMK_mspcat_RequestsSecureStoreAccess"></a> mspcat_RequestsSecureStoreAccess

|Property|Value|
|---|---|
|Description|**if true, publisher is requesting use of the secure store system for this application**|
|DisplayName|**Requests Secure Store Access**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_requestssecurestoreaccess`|
|RequiredLevel|None|
|Type|Boolean|
|GlobalChoiceName|`mspcat_mspcat_certificationrequest_mspcat_requestssecurestoreaccess`|
|DefaultValue|False|
|True Label|Yes|
|False Label|No|

### <a name="BKMK_mspcat_securityreview"></a> mspcat_securityreview

|Property|Value|
|---|---|
|Description|**displays the status Security Review**|
|DisplayName|**Security Review**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_securityreview`|
|RequiredLevel|None|
|Type|Picklist|
|DefaultFormValue|-1|
|GlobalChoiceName|`mspcat_certificationstage`|

#### mspcat_securityreview Choices/Options

|Value|Label|
|---|---|
|526430000|**Not Started**|
|526430001|**In Progress**|
|526430002|**Waiting on Submitting User**|
|526430003|**Completed**|

### <a name="BKMK_mspcat_stagename"></a> mspcat_stagename

|Property|Value|
|---|---|
|Description|**It denotes the current stage name of the Approval request record.**|
|DisplayName|**Stage Name**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_stagename`|
|RequiredLevel|None|
|Type|Picklist|
|DefaultFormValue|526430000|
|GlobalChoiceName|`mspcat_certificationrequest_mspcat_stagename`|

#### mspcat_stagename Choices/Options

|Value|Label|
|---|---|
|526430000|**Code Review**|
|526430001|**ISV Code Review Response**|
|526430002|**Security Review**|
|526430003|**ISV Security Review Response**|
|526430004|**Package Deployment**|
|526430005|**ISV Package Issue Response**|
|526430006|**Functional Validation**|
|526430007|**ISV Functional Issue Response**|

### <a name="BKMK_mspcat_summaryscanstatus"></a> mspcat_summaryscanstatus

|Property|Value|
|---|---|
|Description||
|DisplayName|**Summary of PowerApps scan status**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_summaryscanstatus`|
|RequiredLevel|None|
|Type|Picklist|
|DefaultFormValue|-1|
|GlobalChoiceName|`mspcat_scanstatus`|

#### mspcat_summaryscanstatus Choices/Options

|Value|Label|
|---|---|
|526430000|**Required**|
|526430001|**In Progress**|
|526430002|**Success**|
|526430003|**CompletedWithError**|
|526430004|**Internal error**|
|526430005|**Not required**|

### <a name="BKMK_mspcat_Supersededby"></a> mspcat_Supersededby

|Property|Value|
|---|---|
|Description|**When populated, Indicated the Approval request that Superseded this request.**|
|DisplayName|**Superseded by**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_supersededby`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|mspcat_certificationrequest|

### <a name="BKMK_mspcat_totalduration"></a> mspcat_totalduration

|Property|Value|
|---|---|
|Description||
|DisplayName|**Total Duration**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_totalduration`|
|RequiredLevel|None|
|Type|Integer|
|MaxValue|2147483647|
|MinValue|0|

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

### <a name="BKMK_processid"></a> processid

|Property|Value|
|---|---|
|Description|**Contains the id of the process associated with the entity.**|
|DisplayName|**Process Id**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`processid`|
|RequiredLevel|None|
|Type|Uniqueidentifier|

### <a name="BKMK_SLAId"></a> SLAId

|Property|Value|
|---|---|
|Description|**Choose the service level agreement (SLA) that you want to apply to the record.**|
|DisplayName|**SLA**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`slaid`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|sla|

### <a name="BKMK_stageid"></a> stageid

|Property|Value|
|---|---|
|Description|**Contains the id of the stage where the entity is located.**|
|DisplayName|**Stage Id**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`stageid`|
|RequiredLevel|None|
|Type|Uniqueidentifier|

### <a name="BKMK_statecode"></a> statecode

|Property|Value|
|---|---|
|Description|**Status of the Approval Request**|
|DisplayName|**Status**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statecode`|
|RequiredLevel|SystemRequired|
|Type|State|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_certificationrequest_statecode`|

#### statecode Choices/Options

|Value|Details|
|---|---|
|0|Label: **Active**<br />DefaultStatus: 526430008<br />InvariantName: `Active`|
|1|Label: **Inactive**<br />DefaultStatus: 526430000<br />InvariantName: `Inactive`|

### <a name="BKMK_statuscode"></a> statuscode

|Property|Value|
|---|---|
|Description|**Reason for the status of the Approval Request**|
|DisplayName|**Status Reason**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`statuscode`|
|RequiredLevel|None|
|Type|Status|
|DefaultFormValue||
|GlobalChoiceName|`mspcat_certificationrequest_statuscode`|

#### statuscode Choices/Options

|Value|Details|
|---|---|
|1|Label: **Submitted**<br />State:0<br />TransitionData: None|
|2|Label: **Completed**<br />State:1<br />TransitionData: None|
|526430000|Label: **Abandoned**<br />State:1<br />TransitionData: None|
|526430001|Label: **InProgress**<br />State:0<br />TransitionData: None|
|526430002|Label: **Waiting On Submitter**<br />State:0<br />TransitionData: None|
|526430003|Label: **Pending Deployment**<br />State:0<br />TransitionData: None|
|526430004|Label: **Rejected**<br />State:1<br />TransitionData: None|
|526430005|Label: **Marketing Content**<br />State:1<br />TransitionData: None|
|526430006|Label: **Duplicate Request**<br />State:1<br />TransitionData: None|
|526430008|Label: **Draft**<br />State:0<br />TransitionData: None|
|526430009|Label: **Processing**<br />State:0<br />TransitionData: None|
|526430010|Label: **Failed Prevalidation**<br />State:1<br />TransitionData: None|

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

### <a name="BKMK_traversedpath"></a> traversedpath

|Property|Value|
|---|---|
|Description|**A comma separated list of string values representing the unique identifiers of stages in a Business Process Flow Instance in the order that they occur.**|
|DisplayName|**Traversed Path**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`traversedpath`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|1250|

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
- [mspcat_duration](#BKMK_mspcat_duration)
- [mspcat_Submissiondocument](#BKMK_mspcat_Submissiondocument)
- [mspcat_Submissiondocument_Name](#BKMK_mspcat_Submissiondocument_Name)
- [OnHoldTime](#BKMK_OnHoldTime)
- [OwnerIdName](#BKMK_OwnerIdName)
- [OwnerIdYomiName](#BKMK_OwnerIdYomiName)
- [OwningBusinessUnit](#BKMK_OwningBusinessUnit)
- [OwningTeam](#BKMK_OwningTeam)
- [OwningUser](#BKMK_OwningUser)
- [slaidname](#BKMK_slaidname)
- [SLAInvokedId](#BKMK_SLAInvokedId)
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

### <a name="BKMK_mspcat_duration"></a> mspcat_duration

|Property|Value|
|---|---|
|Description|**Time spent on the current approval request**|
|DisplayName|**Approval Duration**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_duration`|
|RequiredLevel|None|
|Type|Integer|
|MaxValue|2147483647|
|MinValue|0|

### <a name="BKMK_mspcat_Submissiondocument"></a> mspcat_Submissiondocument

|Property|Value|
|---|---|
|Description|**A copy of the submission document for an approval request**|
|DisplayName|**Submission document**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`mspcat_submissiondocument`|
|RequiredLevel|None|
|Type|File|
|MaxSizeInKB|32768|

### <a name="BKMK_mspcat_Submissiondocument_Name"></a> mspcat_Submissiondocument_Name

|Property|Value|
|---|---|
|Description||
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`mspcat_submissiondocument_name`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Disabled|
|IsLocalizable|False|
|MaxLength|200|

### <a name="BKMK_OnHoldTime"></a> OnHoldTime

|Property|Value|
|---|---|
|Description|**Shows how long, in minutes, that the record was on hold**|
|DisplayName|**On Hold Time (Minutes)**|
|IsValidForForm|True|
|IsValidForRead|True|
|LogicalName|`onholdtime`|
|RequiredLevel|None|
|Type|Integer|
|MaxValue|2147483647|
|MinValue|-2147483648|

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

### <a name="BKMK_slaidname"></a> slaidname

|Property|Value|
|---|---|
|Description||
|DisplayName||
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`slaidname`|
|RequiredLevel|None|
|Type|String|
|Format|Text|
|FormatName|Text|
|ImeMode|Auto|
|IsLocalizable|False|
|MaxLength|100|

### <a name="BKMK_SLAInvokedId"></a> SLAInvokedId

|Property|Value|
|---|---|
|Description|**For internal use only.**|
|DisplayName|**Last SLA Applied**|
|IsValidForForm|False|
|IsValidForRead|True|
|LogicalName|`slainvokedid`|
|RequiredLevel|None|
|Type|Lookup|
|Targets|sla|

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

- [mspcat_mspcat_applications_mspcat_certificationrequest_Application](#BKMK_mspcat_mspcat_applications_mspcat_certificationrequest_Application)
- [mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby](#BKMK_mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby-many-to-one)
- [mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher](#BKMK_mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher)

### <a name="BKMK_mspcat_mspcat_applications_mspcat_certificationrequest_Application"></a> mspcat_mspcat_applications_mspcat_certificationrequest_Application

One-To-Many Relationship: [mspcat_applications mspcat_mspcat_applications_mspcat_certificationrequest_Application](mspcat_applications.md#BKMK_mspcat_mspcat_applications_mspcat_certificationrequest_Application)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_applications`|
|ReferencedAttribute|`mspcat_applicationsid`|
|ReferencingAttribute|`mspcat_application`|
|ReferencingEntityNavigationPropertyName|`mspcat_Application`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby-many-to-one"></a> mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby

One-To-Many Relationship: [mspcat_certificationrequest mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby](#BKMK_mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby-one-to-many)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`mspcat_supersededby`|
|ReferencingEntityNavigationPropertyName|`mspcat_Supersededby`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher"></a> mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher

One-To-Many Relationship: [mspcat_publisher mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher](mspcat_publisher.md#BKMK_mspcat_mspcat_publisher_mspcat_certificationrequest_Publisher)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_publisher`|
|ReferencedAttribute|`mspcat_publisherid`|
|ReferencingAttribute|`mspcat_publisher`|
|ReferencingEntityNavigationPropertyName|`mspcat_Publisher`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `RemoveLink`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|


## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [mspcat_certificationrequest_mspcat_InstallActivities](#BKMK_mspcat_certificationrequest_mspcat_InstallActivities)
- [mspcat_certreject_cert](#BKMK_mspcat_certreject_cert)
- [mspcat_certreq_analysis_status_reln](#BKMK_mspcat_certreq_analysis_status_reln)
- [mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby](#BKMK_mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby-one-to-many)


### <a name="BKMK_mspcat_certificationrequest_mspcat_InstallActivities"></a> mspcat_certificationrequest_mspcat_InstallActivities

Many-To-One Relationship: [mspcat_installactivity mspcat_certificationrequest_mspcat_InstallActivities](mspcat_installactivity.md#BKMK_mspcat_certificationrequest_mspcat_InstallActivities)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`regardingobjectid`|
|ReferencedEntityNavigationPropertyName|`mspcat_certificationrequest_mspcat_InstallActivities`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_certreject_cert"></a> mspcat_certreject_cert

Many-To-One Relationship: [mspcat_certificationrejectionappliedpolicy mspcat_certreject_cert](mspcat_certificationrejectionappliedpolicy.md#BKMK_mspcat_certreject_cert)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrejectionappliedpolicy`|
|ReferencingAttribute|`mspcat_certificationrequest`|
|ReferencedEntityNavigationPropertyName|`mspcat_certreject_cert`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_certreq_analysis_status_reln"></a> mspcat_certreq_analysis_status_reln

Many-To-One Relationship: [mspcat_powerappsscanstatus mspcat_certreq_analysis_status_reln](mspcat_powerappsscanstatus.md#BKMK_mspcat_certreq_analysis_status_reln)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_powerappsscanstatus`|
|ReferencingAttribute|`mspcat_parentrequestid`|
|ReferencedEntityNavigationPropertyName|`mspcat_certreq_analysis_status_reln`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby-one-to-many"></a> mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby

Many-To-One Relationship: [mspcat_certificationrequest mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby](#BKMK_mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby-many-to-one)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`mspcat_supersededby`|
|ReferencedEntityNavigationPropertyName|`mspcat_mspcat_certificationrequest_mspcat_certificationrequest_Supersededby`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseCollectionName`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|


## Many-to-Many relationships

### <a name="BKMK_mspcat_attachedpackages"></a> mspcat_attachedpackages

See [mspcat_packages mspcat_attachedpackages Many-To-Many Relationship](mspcat_packages.md#BKMK_mspcat_attachedpackages)

|Property|Value|
|---|---|
|IntersectEntityName|`mspcat_certreq_package_association`|
|IsCustomizable|True|
|SchemaName|`mspcat_attachedpackages`|
|IntersectAttribute|`mspcat_certificationrequestid`|
|NavigationPropertyName|`mspcat_attachedpackages`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `UseLabel`<br />Group: `Details`<br />Label: Related offers<br />MenuId: null<br />Order: 10000<br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   

