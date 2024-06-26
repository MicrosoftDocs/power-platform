---
title: "Process Stage (ProcessStage) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Process Stage (ProcessStage) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Process Stage (ProcessStage) table/entity reference

Stage associated with a process.

> [!NOTE]
> The Power Platform Catalog Manager Process Stage (ProcessStage) table extends the [Microsoft Dataverse Process Stage (ProcessStage) table](/power-apps/developer/data-platform/reference/entities/processstage).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_activestageid](#BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_activestageid)
- [processstage_mspcat_certificationrequest](#BKMK_processstage_mspcat_certificationrequest)

### <a name="BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_activestageid"></a> lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_activestageid

Many-To-One Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_activestageid](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_activestageid)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencingAttribute|`activestageid`|
|ReferencedEntityNavigationPropertyName|`lk_mspcat_bpf_06d86bf860814221be8c81204be2199d_activestageid`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_processstage_mspcat_certificationrequest"></a> processstage_mspcat_certificationrequest

Many-To-One Relationship: [mspcat_certificationrequest processstage_mspcat_certificationrequest](mspcat_certificationrequest.md#BKMK_processstage_mspcat_certificationrequest)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_certificationrequest`|
|ReferencingAttribute|`stageid`|
|ReferencedEntityNavigationPropertyName|`processstage_mspcat_certificationrequest`|
|IsCustomizable|`False`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.processstage?displayProperty=fullName>
