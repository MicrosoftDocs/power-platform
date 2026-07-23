---
title: Unified environment types and templates for finance and operations apps
description: Learn about unified production (UPE), sandbox (USE), and developer (UDE) environments, Dynamics 365 ERP templates, and regional availability for finance and operations apps in Power Platform.
author: laneswenka
ms.topic: concept-article
ms.date: 04/06/2026
ms.subservice: admin
ms.author: laswenka
ms.reviewer: smurkute

---

# Unified environment types and templates for finance and operations apps

You manage finance and operations apps in the Power Platform admin center with zero Microsoft Dynamics Lifecycle Services footprint. These environments are *unified environments* because they bring together Dynamics 365 ERP workloads, Dynamics 365 customer engagement apps, and low-code artifacts in a single Power Platform environment backed by Microsoft Dataverse.

This article defines the unified environment types, explains which applications are included in each ERP template, and lists the Azure regions where finance and operations apps are available.

For a general introduction to the unified admin experience, see [Overview of unified admin experience for finance and operations apps](finance-operations-apps-overview.md).

## Unified environment types

Every unified environment for finance and operations apps maps to a standard Power Platform environment type. The following sections define each unified environment type and its intended purpose.

### Unified production environment (UPE)

| Property | Value |
|---|---|
| **Power Platform environment type** | Production |
| **Purpose** | Live production workloads |
| **Elastic compute** | Full scaling, up to 80 AOS instances (40 interactive, 40 batch) |

A unified production environment (UPE) hosts your live finance and operations workload. You can create a UPE by provisioning a new production environment with an ERP template, or by [converting an existing sandbox to production](tutorial-convert-sandbox-to-production.md).

### Unified sandbox environment (USE)

| Property | Value |
|---|---|
| **Power Platform environment type** | Sandbox |
| **Purpose** | Testing, UAT, staging, training |
| **Elastic compute** | Full scaling, up to 80 AOS instances (40 interactive, 40 batch) |

A unified sandbox environment (USE) supports testing, user acceptance, staging, and training scenarios. USE environments support the full set of lifecycle operations, including [copy](tutorial-copy-lifecycle-services-environment-unified-environment.md), [backup and restore](tutorial-backup-restore-unified-environment.md), and [transaction-less copy](tutorial-perform-transactionless-copy.md).

This environment type is the same sandbox environment that Dynamics 365 customer engagement (CRM/CE) customers use for development and testing today.

### Unified developer environment (UDE)

| Property | Value |
|---|---|
| **Power Platform environment type** | Sandbox |
| **Purpose** | Single-developer X++ development |
| **Elastic compute** | Limited to 1 AOS instance (no scaling) |

A unified developer environment (UDE) is a sandbox environment provisioned specifically for X++ development by using the Power Platform CLI and Visual Studio. UDE replaces the cloud-hosted developer virtual machines (VMs) that were previously deployed through Lifecycle Services.

The key characteristics of UDE environments include:

- Provisioned through PowerShell by using the `DevToolsEnabled=true` parameter. For step-by-step instructions, see [Tutorial: Provision a new environment with an ERP-based template](tutorial-deploy-new-environment-with-ERP-template.md).
- Limited to a single AOS instance with no elastic scaling. To learn more, see [Elastic compute for finance and operations apps](elastic-compute.md).
- Intended for single-developer use. Not suitable for multi-user development or performance testing.
- Supports direct database access for development purposes. To learn more, see [Request credentials to product database](../../developer/unified-experience/finance-operations-product-db-access.md).

> [!IMPORTANT]
> UDE isn't the same as the Power Platform developer environment type. The Power Platform *Developer* environment type doesn't support any Dynamics 365 workload today. It provides only a limited Dataverse schema that supports low-code artifacts such as canvas apps, flows, and agents. UDE uses the *Sandbox* environment type with developer tooling enabled, which includes the full Dataverse schema and the finance and operations runtime.

> [!NOTE]
> When you provision an environment as a unified sandbox environment (USE), you **can't** change it to a unified developer environment (UDE) and vice versa.

### Summary of unified environment types

| Unified environment type | Abbreviation | Power Platform environment type | Elastic compute | Typical use |
|---|---|---|---|---|
| Unified production environment | UPE | Production | Full scaling | Live production workloads |
| Unified sandbox environment | USE | Sandbox | Full scaling | Testing, UAT, staging, training |
| Unified developer environment | UDE | Sandbox | Single AOS (no scaling) | X++ development |

## D365_FinOps templates and included apps

A *template* is a bundle of Microsoft-published applications that are preinstalled when you create a new Dataverse-based Power Platform environment. Templates help you quickly deploy an environment with a known configuration of apps without having to manually install each one. For step-by-step provisioning instructions, see [Tutorial: Provision a new environment with an ERP-based template](tutorial-deploy-new-environment-with-ERP-template.md).

### Template reference

| Template ID | Display name | License required |
|---|---|---|---|
| D365_FinOps_Finance | Finance (preview) | Dynamics 365 Finance | 
| D365_FinOps_SCM | Supply Chain Management (preview) | Dynamics 365 Supply Chain Management | 
| D365_FinOps_ProjOps | Project Operations Integrated (preview) | Dynamics 365 Project Operations or Dynamics 365 Operations Application Partner Sandbox | 
| D365_FinOps_Commerce<br><br>(Available for trials only)| Commerce (preview) | Dynamics 365 Commerce |  

### Apps included in each template

The following tables list the applications installed by each template. The **Finance** and **Supply Chain Management** templates install an identical set of applications. The **Project Operations** template includes additional customer engagement and dual-write solutions. The **Commerce** template (trials only) is the most comprehensive, including all Project Operations apps plus Commerce-specific components.

#### Finance and Supply Chain Management templates

The D365_FinOps_Finance and D365_FinOps_SCM templates install the same set of applications.

| Application | Package name |
|---|---|
| Finance and Operations Virtual Entity | MicrosoftOperationsVEAnchor |
| Dual-write core solution | DualWriteCoreAnchor |
| Dual-write Application Core Solutions | msdyn_DualWriteAppCoreAnchor |
| Dynamics 365 Finance and Operations Provisioning App | msdyn_FinanceAndOperationsProvisioningAppAnchor |
| Dynamics 365 Finance and Operations Platform Tools | msprov_fnouploadersolution |
| Globalization Solution for Microsoft Dynamics 365 Finance | msdyn_GlobalizationSolutionAnchor |
| Copilot for finance and operations apps | msdyn_FnOCopilotAnchor |
| Dynamics 365 Commerce Application | msdyn_CommerceAnchor |
| Dynamics 365 Demand Planning Application | msdyn_DemandPlanningAnchor |
| Copilot in Microsoft Dynamics 365 Supply Chain Management | msdyn_SCMAIAppAnchor |
| Copilot in Microsoft Dynamics 365 Finance | msdyn_FinanceAIAppAnchor |
| Planning Optimization Add-in for Dynamics 365 SCM | msdyn_MasterPlanningAnchor |

#### Project Operations template

The D365_FinOps_ProjOps template installs all of the applications in the Finance template, plus the following additional applications.

| Application | Package name |
|---|---|
| Dual Write Finance and Extended Solutions | msdyn_Dynamics365FinanceExtendedAnchor |
| Dual-Write Asset Management Solutions | msdyn_DualWriteAssetManagementAnchor |
| Dual-write Dynamics 365 Human Resources | msdyn_Dynamics365HCMAnchor |
| Dynamics 365 HR Common Tables | HCMCommonAnchor |
| Dual Write Supply Chain Extended Solution | msdyn_Dynamics365SupplyChainExtendedAnchor |
| Microsoft Dynamics 365 Project Operations | ProjectOperations_Anchor |
| Dynamics 365 Project Operations Demo Data | msdyn_ProjectOperationsSampleData_Anchor |

#### Commerce template (trials only)

The D365_FinOps_Commerce template installs all of the applications in the Project Operations template, plus the following additional applications.

| Application | Package name |
|---|---|
| Power Pages portal base | CDSBasePortal |
| Dynamics 365 Intelligent Order Management | msdyn_IntelligentOrderManagementAnchor |
| Commerce Scale Unit | msdyn_ScaleUnitAnchor |

## Regional availability for finance and operations apps

Finance and operations app availability depends on the Azure region of your Power Platform environment. Consider two scenarios:

- **New environment with a template**: You select a location during environment creation. The **Azure region** column in the following table is a hint that you can currently use only in PowerShell to target a specific region within a location.
- **Installing on an existing environment**: If your existing Dataverse environment is in an Azure region that finance and operations apps don't support, the installation fails with an error. For more information, see [Known limitations](finance-operations-apps-overview.md#known-limitations).

> [!IMPORTANT]
> Not all Azure regions that Dataverse supports are supported by finance and operations apps. Microsoft is adding validation to prevent ERP templates from being created in unsupported Azure regions, and to block finance and operations app installation on existing environments in unsupported regions. Until this validation is in place, refer to the following table to confirm your Azure region is supported before provisioning.

The following table shows the production cloud (public) regions and which unified environment types are supported in each region. The **Location** column is the value you select when creating an environment in the Power Platform admin center or when using the `-LocationName` parameter in PowerShell.

| Location (display name) | Location (code) | Azure region | UPE | USE | UDE | Trial |
|---|---|---|---|---|---|---|
| Asia | asia | eastasia | Yes | Yes | Yes | Yes |
| Asia | asia | southeastasia | Yes | Yes | Yes | Yes |
| Australia | australia | australiaeast | Yes | Yes | Yes | Yes |
| Australia | australia | australiasoutheast | — | — | Yes | Yes |
| Canada | canada | canadacentral | Yes | Yes | Yes | Yes |
| Canada | canada | canadaeast | — | — | Yes | Yes |
| Europe | europe | northeurope | Yes | Yes | Yes | Yes |
| Europe | europe | westeurope | Yes | Yes | Yes | Yes |
| France | france | francecentral | Yes | Yes | Yes | Yes |
| France | france | francesouth | — | — | Yes | Yes |
| India | india | centralindia | Yes | Yes | Yes | Yes |
| India | india | southindia | — | — | Yes | Yes |
| Italy | italy | italynorth | Yes | Yes | Yes | Yes |
| Japan | japan | japaneast | Yes | Yes | Yes | Yes |
| Japan | japan | japanwest | Yes | Yes | Yes | Yes |
| Norway | norway | norwayeast | Yes | Yes | Yes | Yes |
| Norway | norway | norwaywest | — | — | Yes | Yes |
| Poland | poland | polandcentral | Yes | Yes | Yes | Yes |
| South Africa | southafrica | southafricanorth | Yes | Yes | Yes | Yes |
| South Africa | southafrica | southafricawest | — | — | Yes | Yes |
| South America | southamerica | brazilsouth | Yes | Yes | Yes | Yes |
| Sweden | sweden | swedencentral | Yes | Yes | Yes | Yes |
| Switzerland | switzerland | switzerlandnorth | Yes | Yes | Yes | Yes |
| Switzerland | switzerland | switzerlandwest | — | — | Yes | Yes |
| United Arab Emirates (UAE) | unitedarabemirates | uaenorth | Yes | Yes | Yes | Yes |
| United Kingdom | unitedkingdom | uksouth | Yes | Yes | Yes | Yes |
| United Kingdom | unitedkingdom | ukwest | — | — | Yes | Yes |
| United States | unitedstates | centralus | Yes | Yes | Yes | Yes |
| United States | unitedstates | eastus | Yes | Yes | Yes | Yes |
| United States | unitedstates | eastus2 | Yes | Yes | Yes | Yes |
| United States | unitedstates | westus | Yes | Yes | Yes | Yes |

> [!NOTE]
> Some locations have a secondary Azure region that only supports UDE (developer) and trial environment types. These secondary regions don't support UPE (production) or USE (sandbox) workloads. For sovereign and government cloud availability, contact Microsoft Support.

## Related articles

- [Overview of unified admin experience for finance and operations apps](finance-operations-apps-overview.md)
- [Elastic compute for finance and operations apps](elastic-compute.md)
- [Tutorial: Provision a new environment with an ERP-based template](tutorial-deploy-new-environment-with-ERP-template.md)
- [Tutorial: Convert a sandbox environment to production for finance and operations apps](tutorial-convert-sandbox-to-production.md)
- [Unified developer experience for finance and operations apps](../../developer/unified-experience/finance-operations-dev-overview.md)
- [Manage storage and capacity](../finance-operations-storage-capacity.md)
