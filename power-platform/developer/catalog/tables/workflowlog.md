---
title: "Process Log (WorkflowLog) table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Process Log (WorkflowLog) table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Process Log (WorkflowLog) table/entity reference

Log used to track process execution.

> [!NOTE]
> The Power Platform Catalog Manager Process Log (WorkflowLog) table extends the [Microsoft Dataverse Process Log (WorkflowLog) table](/power-apps/developer/data-platform/reference/entities/workflowlog).




## Many-to-One relationships

These relationships are many-to-one. Listed by **SchemaName**.

### <a name="BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_WorkflowLogs"></a> mspcat_bpf_06d86bf860814221be8c81204be2199d_WorkflowLogs

One-To-Many Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d mspcat_bpf_06d86bf860814221be8c81204be2199d_WorkflowLogs](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_mspcat_bpf_06d86bf860814221be8c81204be2199d_WorkflowLogs)

|Property|Value|
|---|---|
|ReferencedEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencedAttribute|`businessprocessflowinstanceid`|
|ReferencingAttribute|`asyncoperationid`|
|ReferencingEntityNavigationPropertyName|`asyncoperationid_mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|IsHierarchical||
|CascadeConfiguration|Archive: `NoCascade`<br />Assign: `NoCascade`<br />Delete: `NoCascade`<br />Merge: `NoCascade`<br />Reparent: `NoCascade`<br />RollupView: `NoCascade`<br />Share: `NoCascade`<br />Unshare: `NoCascade`|



### See also

[Dataverse table/entity reference](/power-apps/developer/data-platform/reference/about-entity-reference)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.workflowlog?displayProperty=fullName>
