---
title: "Process (Workflow) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Process (Workflow) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Process (Workflow) table/entity reference

Set of logical rules that define the steps necessary to automate a specific business process, task, or set of actions to be performed.

> [!NOTE]
> The Power Platform Catalog Manager Process (Workflow) table extends the [Microsoft Dataverse Process (Workflow) table](/power-apps/developer/data-platform/reference/entities/workflow).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

### <a name="BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_processid"></a> lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_processid

Many-To-One Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_processid](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_processid)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencingAttribute|`processid`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_processid`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.workflow?displayProperty=fullName>
