---
title: "Mailbox table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Mailbox table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Mailbox table/entity reference



> [!NOTE]
> The Power Platform Catalog Manager Mailbox table extends the [Microsoft Dataverse Mailbox table](/power-apps/developer/data-platform/reference/entities/mailbox).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

### <a name="BKMK_mspcat_installactivity_mailbox_sendermailboxid"></a> mspcat_installactivity_mailbox_sendermailboxid

Many-To-One Relationship: [mspcat_installactivity mspcat_installactivity_mailbox_sendermailboxid](mspcat_installactivity.md#BKMK_mspcat_installactivity_mailbox_sendermailboxid)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_installactivity`|
|ReferencingAttribute|`sendermailboxid`|
|ReferencedEntityNavigationPropertyName|`mspcat_installactivity_mailbox_sendermailboxid`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.mailbox?displayProperty=fullName>
