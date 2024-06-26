---
title: "FileAttachment table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the FileAttachment table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# FileAttachment table/entity reference

File Attachment

> [!NOTE]
> The Power Platform Catalog Manager FileAttachment table extends the [Microsoft Dataverse FileAttachment table](/power-apps/developer/data-platform/reference/entities/fileattachment).



## Customized columns/attributes

Power Platform Catalog Manager modifies the definition of columns/attributes defined in other solutions. Listed by **SchemaName**.

### <a name="BKMK_ObjectId"></a> ObjectId

Changes from [ObjectId (Microsoft Dataverse)](/power-apps/developer/data-platform/reference/entities/fileattachment#BKMK_ObjectId)

|Property|Value|
|---|---|
|Targets|mspcat_catalogitemfile|


## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

- [mspcat_catalogitemfile_FileAttachments](#BKMK_mspcat_catalogitemfile_FileAttachments)
- [mspcat_certificationrequest_FileAttachments](#BKMK_mspcat_certificationrequest_FileAttachments)
- [mspcat_installhistory_FileAttachments](#BKMK_mspcat_installhistory_FileAttachments)
- [mspcat_packages_FileAttachments](#BKMK_mspcat_packages_FileAttachments)

### <a name="BKMK_mspcat_catalogitemfile_FileAttachments"></a> mspcat_catalogitemfile_FileAttachments

One-To-Many Relationship: [mspcat_catalogitemfile mspcat_catalogitemfile_FileAttachments](mspcat_catalogitemfile.md#BKMK_mspcat_catalogitemfile_FileAttachments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_catalogitemfile`|
|ReferencedAttribute|`mspcat_catalogitemfileid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_catalogitemfile`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_certificationrequest_FileAttachments"></a> mspcat_certificationrequest_FileAttachments

One-To-Many Relationship: [mspcat_certificationrequest mspcat_certificationrequest_FileAttachments](mspcat_certificationrequest.md#BKMK_mspcat_certificationrequest_FileAttachments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_certificationrequest`|
|ReferencedAttribute|`mspcat_certificationrequestid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_certificationrequest`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_installhistory_FileAttachments"></a> mspcat_installhistory_FileAttachments

One-To-Many Relationship: [mspcat_installhistory mspcat_installhistory_FileAttachments](mspcat_installhistory.md#BKMK_mspcat_installhistory_FileAttachments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_installhistory`|
|ReferencedAttribute|`mspcat_installhistoryid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_installhistory`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|

### <a name="BKMK_mspcat_packages_FileAttachments"></a> mspcat_packages_FileAttachments

One-To-Many Relationship: [mspcat_packages mspcat_packages_FileAttachments](mspcat_packages.md#BKMK_mspcat_packages_FileAttachments)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_packages`|
|ReferencedAttribute|`mspcat_packagesid`|
|ReferencingAttribute|`objectid`|
|ReferencingEntityNavigationPropertyName|`objectid_mspcat_packages`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `Cascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|


## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [FileAttachment_mspcat_CatalogItemFile_mspcat_File](#BKMK_FileAttachment_mspcat_CatalogItemFile_mspcat_File)
- [FileAttachment_mspcat_certificationrequest_mspcat_Submissiondocument](#BKMK_FileAttachment_mspcat_certificationrequest_mspcat_Submissiondocument)
- [FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile](#BKMK_FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile)
- [FileAttachment_mspcat_packages_mspcat_PackageFile](#BKMK_FileAttachment_mspcat_packages_mspcat_PackageFile)
- [FileAttachment_mspcat_packages_mspcat_PackageManifestFile](#BKMK_FileAttachment_mspcat_packages_mspcat_PackageManifestFile)

### <a name="BKMK_FileAttachment_mspcat_CatalogItemFile_mspcat_File"></a> FileAttachment_mspcat_CatalogItemFile_mspcat_File

Many-To-One Relationship: [mspcat_catalogitemfile FileAttachment_mspcat_CatalogItemFile_mspcat_File](mspcat_catalogitemfile.md#BKMK_FileAttachment_mspcat_CatalogItemFile_mspcat_File)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogitemfile`|
|ReferencingAttribute|`mspcat_file`|
|ReferencedEntityNavigationPropertyName|`FileAttachment_mspcat_CatalogItemFile_mspcat_File`|
|IsCustomizable|`False`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_FileAttachment_mspcat_certificationrequest_mspcat_Submissiondocument"></a> FileAttachment_mspcat_certificationrequest_mspcat_Submissiondocument

Many-To-One Relationship: [mspcat_certificationrequest FileAttachment_mspcat_certificationrequest_mspcat_Submissiondocument](mspcat_certificationrequest.md#BKMK_FileAttachment_mspcat_certificationrequest_mspcat_Submissiondocument)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`mspcat_submissiondocument`|
|ReferencedEntityNavigationPropertyName|`FileAttachment_mspcat_certificationrequest_mspcat_Submissiondocument`|
|IsCustomizable|`False`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile"></a> FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile

Many-To-One Relationship: [mspcat_installhistory FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile](mspcat_installhistory.md#BKMK_FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installhistory`|
|ReferencingAttribute|`mspcat_deploymentlogfile`|
|ReferencedEntityNavigationPropertyName|`FileAttachment_mspcat_InstallHistory_mspcat_DeploymentLogFile`|
|IsCustomizable|`False`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_FileAttachment_mspcat_packages_mspcat_PackageFile"></a> FileAttachment_mspcat_packages_mspcat_PackageFile

Many-To-One Relationship: [mspcat_packages FileAttachment_mspcat_packages_mspcat_PackageFile](mspcat_packages.md#BKMK_FileAttachment_mspcat_packages_mspcat_PackageFile)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packages`|
|ReferencingAttribute|`mspcat_packagefile`|
|ReferencedEntityNavigationPropertyName|`FileAttachment_mspcat_packages_mspcat_PackageFile`|
|IsCustomizable|`False`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_FileAttachment_mspcat_packages_mspcat_PackageManifestFile"></a> FileAttachment_mspcat_packages_mspcat_PackageManifestFile

Many-To-One Relationship: [mspcat_packages FileAttachment_mspcat_packages_mspcat_PackageManifestFile](mspcat_packages.md#BKMK_FileAttachment_mspcat_packages_mspcat_PackageManifestFile)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_packages`|
|ReferencingAttribute|`mspcat_packagemanifestfile`|
|ReferencedEntityNavigationPropertyName|`FileAttachment_mspcat_packages_mspcat_PackageManifestFile`|
|IsCustomizable|`False`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.fileattachment?displayProperty=fullName>
