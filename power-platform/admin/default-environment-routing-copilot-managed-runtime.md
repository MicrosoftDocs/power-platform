---
title: Environment routing for Microsoft Copilot Managed Runtime
description: Environment routing is on by default for Copilot Managed Runtime. Learn what this means for your tenant and makers, and how it works with existing routing rules.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/25/2026
ms.collection: bap-ai-copilot
ai-usage: ai-assisted
author: sidhartg
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: mkaur
ms.custom: copilot-managed-runtime
search.audienceType: 
  - admin
---

# Environment routing for Copilot Managed Runtime

All tenants have routing for Copilot Managed Runtime selected by default. Admins must manually enable routing for other products.

This article explains what environment routing for Copilot Managed Runtime means for your tenant and makers, and how it works with existing environment routing rules you set up.

## Environment routing rules

Review the following routing behavior and requirements for tenants that use Copilot Managed Runtime.

1. Environment routing for Copilot Managed Runtime is automatically enabled in all tenants. You can't change this setting.
    - Admins must enable routing for other products manually.
    - When Copilot Managed Runtime is the only product enabled for routing, makers using Power Apps, Power Automate, or Copilot Studio aren't routed to their personal developer environments. They can continue to build in the default environment or any other environment where they have maker permissions.
1. When there are no routing rules configured in the tenant, a new routing rule is created automatically that routes Everyone in the tenant to their own personal developer environments.
    - A new default environment group is also created automatically, and rules specific to Copilot Managed Runtime are applied to this group.
    - No changes are made if the tenant already has routing rules. In this case, only makers who are part of the security groups used in routing rules can build apps hosted on Copilot Managed Runtime. All other makers are blocked until admins of these tenants create a new **Everyone** routing rule or add makers to security groups used in routing rules.
    - Admins can't delete routing rule that routes Everyone to an environment group.
    - Routing rule targeting Everyone must be the last rule in the priority. Any tenants with routing rule configuration that placed a routing rule targeting Everyone above a security group must adjust the priority before making any further changes.
    - New routing rules can't be created without selecting an environment group.

1. Personal developer environments created for Copilot Managed Runtime are managed environments by default.
    - Auto claim isn't applicable for makers who use these environments only to create apps hosted on Copilot Managed Runtime. No premium licenses are required in this case.
    - Auto claim is applicable if makers create Power Apps, Power Automate, or Copilot Studio in their personal developer environment created for Copilot Managed Runtime. Premium licenses might be required for the maker in this case.
    - Environments created for Copilot Managed Runtime don't have Dataverse. Makers or admins can manually add Dataverse to these environments from the Power Platform Admin Center.
    - Dataverse is automatically added to the personal developer environments when the maker is routed to this environment from Power Apps, Power Automate, or Copilot Studio maker portals due to their routing configuration.

## Related information

- [Copilot Managed Runtime default governance settings (Frontier)](/microsoft-365/admin/manage/apps/governance)
- [What is Copilot Managed Runtime](/microsoft-365/managed-apps/index)
