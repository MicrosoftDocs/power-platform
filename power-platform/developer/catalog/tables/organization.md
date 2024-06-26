---
title: "Organization table/entity reference (Power Platform Catalog Manager)"
description: "Includes schema information and supported messages for the Organization table/entity with Power Platform Catalog Manager."
ms.date: 06/26/2024
ms.service: powerapps
ms.topic: reference
author: JimDaly
ms.author: jdaly
search.audienceType: 
  - developer
---

# Organization table/entity reference

Top level of the Microsoft Dynamics 365 business hierarchy. The organization can be a specific business, holding company, or corporation.

> [!NOTE]
> The Power Platform Catalog Manager Organization table extends the [Microsoft Dataverse Organization table](/power-apps/developer/data-platform/reference/entities/organization).




## One-to-Many relationships

These relationships are one-to-many. Listed by **SchemaName**.

- [organization_mspcat_bpf_06d86bf860814221be8c81204be2199d](#BKMK_organization_mspcat_bpf_06d86bf860814221be8c81204be2199d)
- [organization_mspcat_catalogdescription](#BKMK_organization_mspcat_catalogdescription)
- [organization_mspcat_configurationforpowerapps](#BKMK_organization_mspcat_configurationforpowerapps)
- [organization_mspcat_crmgeo](#BKMK_organization_mspcat_crmgeo)
- [organization_mspcat_rulesetforpowerappschecker](#BKMK_organization_mspcat_rulesetforpowerappschecker)
- [organization_mspcat_sspolicy](#BKMK_organization_mspcat_sspolicy)
- [organization_mspcat_sspolicytemplate](#BKMK_organization_mspcat_sspolicytemplate)
- [organization_mspcat_staticanalysispolicy](#BKMK_organization_mspcat_staticanalysispolicy)

### <a name="BKMK_organization_mspcat_bpf_06d86bf860814221be8c81204be2199d"></a> organization_mspcat_bpf_06d86bf860814221be8c81204be2199d

Many-To-One Relationship: [mspcat_bpf_06d86bf860814221be8c81204be2199d organization_mspcat_bpf_06d86bf860814221be8c81204be2199d](mspcat_bpf_06d86bf860814221be8c81204be2199d.md#BKMK_organization_mspcat_bpf_06d86bf860814221be8c81204be2199d)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|ReferencingAttribute|`organizationid`|
|ReferencedEntityNavigationPropertyName|`organization_mspcat_bpf_06d86bf860814221be8c81204be2199d`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_organization_mspcat_catalogdescription"></a> organization_mspcat_catalogdescription

Many-To-One Relationship: [mspcat_catalogdescription organization_mspcat_catalogdescription](mspcat_catalogdescription.md#BKMK_organization_mspcat_catalogdescription)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_catalogdescription`|
|ReferencingAttribute|`organizationid`|
|ReferencedEntityNavigationPropertyName|`organization_mspcat_catalogdescription`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_organization_mspcat_configurationforpowerapps"></a> organization_mspcat_configurationforpowerapps

Many-To-One Relationship: [mspcat_configurationforpowerapps organization_mspcat_configurationforpowerapps](mspcat_configurationforpowerapps.md#BKMK_organization_mspcat_configurationforpowerapps)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_configurationforpowerapps`|
|ReferencingAttribute|`organizationid`|
|ReferencedEntityNavigationPropertyName|`organization_mspcat_configurationforpowerapps`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_organization_mspcat_crmgeo"></a> organization_mspcat_crmgeo

Many-To-One Relationship: [mspcat_crmgeo organization_mspcat_crmgeo](mspcat_crmgeo.md#BKMK_organization_mspcat_crmgeo)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_crmgeo`|
|ReferencingAttribute|`organizationid`|
|ReferencedEntityNavigationPropertyName|`organization_mspcat_crmgeo`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_organization_mspcat_rulesetforpowerappschecker"></a> organization_mspcat_rulesetforpowerappschecker

Many-To-One Relationship: [mspcat_rulesetforpowerappschecker organization_mspcat_rulesetforpowerappschecker](mspcat_rulesetforpowerappschecker.md#BKMK_organization_mspcat_rulesetforpowerappschecker)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_rulesetforpowerappschecker`|
|ReferencingAttribute|`organizationid`|
|ReferencedEntityNavigationPropertyName|`organization_mspcat_rulesetforpowerappschecker`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_organization_mspcat_sspolicy"></a> organization_mspcat_sspolicy

Many-To-One Relationship: [mspcat_sspolicy organization_mspcat_sspolicy](mspcat_sspolicy.md#BKMK_organization_mspcat_sspolicy)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_sspolicy`|
|ReferencingAttribute|`organizationid`|
|ReferencedEntityNavigationPropertyName|`organization_mspcat_sspolicy`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_organization_mspcat_sspolicytemplate"></a> organization_mspcat_sspolicytemplate

Many-To-One Relationship: [mspcat_sspolicytemplate organization_mspcat_sspolicytemplate](mspcat_sspolicytemplate.md#BKMK_organization_mspcat_sspolicytemplate)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_sspolicytemplate`|
|ReferencingAttribute|`organizationid`|
|ReferencedEntityNavigationPropertyName|`organization_mspcat_sspolicytemplate`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|

### <a name="BKMK_organization_mspcat_staticanalysispolicy"></a> organization_mspcat_staticanalysispolicy

Many-To-One Relationship: [mspcat_staticanalysispolicy organization_mspcat_staticanalysispolicy](mspcat_staticanalysispolicy.md#BKMK_organization_mspcat_staticanalysispolicy)

|Property|Value|
|---|---|
|ReferencingEntity|`mspcat_staticanalysispolicy`|
|ReferencingAttribute|`organizationid`|
|ReferencedEntityNavigationPropertyName|`organization_mspcat_staticanalysispolicy`|
|IsCustomizable|`True`|
|AssociatedMenuConfiguration|AvailableOffline: True<br />Behavior: `DoNotDisplay`<br />Group: `Details`<br />Label: <br />MenuId: null<br />Order: <br />QueryApi: null<br />ViewId: `00000000-0000-0000-0000-000000000000`|



### See also

[Dataverse table/entity reference](../about-entity-reference.md)  
[Dataverse Web API Reference](/power-apps/developer/data-platform/webapi/reference/about)   
<xref:Microsoft.Dynamics.CRM.organization?displayProperty=fullName>
