---
title: Microsoft 365 environment for recurring Copilot prompts 
description: Learn more about the Microsoft 365 environment that supports runtime operations required by features like Scheduled Prompts, Teams AI Workflows, and more.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/17/2025
author: sericks007
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.contributors:
  - saraje
---

# Microsoft 365 environment for recurring Copilot prompts 

A Microsoft 365 environment, that's a Power Platform production environment, is automatically created when users in your tenant first use a recurring Copilot feature. This environment supports runtime operations required by features like scheduled prompts, Teams AI workflows, and more. It's provisioned and governed differently than typical environments.

This article provides details about the environment’s characteristics, behavior, permissions, and limitations to help Power Platform and Microsoft 365 administrators understand and manage the environment appropriately.

## Environment provisioning

The Microsoft 365 environment is automatically created when a user with a Copilot license uses a recurring Copilot feature for the first time. The environment is created in the region closest to the default region of the Microsoft Entra tenant.

The following list includes examples of Copilot features that support recurrence:
- **[Scheduled prompts](/copilot/microsoft-365/scheduled-prompts)** from Microsoft 365 Copilot
- **[AI workflow templates](https://support.microsoft.com/topic/b7023604-c62a-44d3-a097-fddb68e41ff3?preview=true)** from the Workflows app in Microsoft Teams

You don't need to take any manual steps to create the environment. Only one environment is created per tenant, and it's name appears as **Microsoft 365** in the Power Platform admin center.

If the environment is deleted and the feature is used again, it's automatically recreated.

## Permissions and access
### App and connection usage

A security role, **Microsoft 365 Copilot Actions Access**, is created in the environment and is assigned to the default team, which provides users with the permissions to use the feature.

> [!Note]
> By default, users aren't given **Environment Maker** permissions.

Users don't have direct access to:

- Create, execute, or share Connections.
- Create apps, flows, custom connectors, dataflows, or bots.

Runtime operations are strictly limited to Microsoft-owned, first-party apps.
  
### Data loss prevention (DLP)
The Microsoft 365 environment has a fixed DLP policy: All connectors are blocked, except for a set of connectors used by recurring Copilot prompts. This includes:
- Microsoft 365 Copilot actions
- Microsoft Teams
- Outlook (Office 365 Outlook)

> [!Important]
> Tenant-level and environment-level DLP policies don't apply to the Microsoft 365 environment.

### Lifecycle and operations
The Microsoft 365 environment is treated as a standard production environment with certain exceptions in lifecycle operations:

- Restore to same org
- Restore from backup
- Copy from other environments
- Virtual Network or private link integration
- Identity configuration

## Frequently asked questions (FAQ)

### What triggers the creation of the Microsoft 365 environment?
The environment is created when a licensed user in the tenant uses recurring Copilot prompts for the first time.

### What license or app does the user require?
The user must be assigned a Microsoft 365 Copilot license with the Microsoft Copilot with graph-grounded chat app for the user to be provisioned in the environment.

### Can the environment be deleted?
Yes. Admins can delete the Microsoft 365 environment through the Power Platform admin center. However, if recurring Copilot prompts are used again, the environment is automatically recreated.

### Does this environment consume storage from my tenant’s entitlement?
No. Storage used by this environment is excluded from your tenant’s capacity calculations and doesn't appear on capacity pages.

### Can I apply custom DLP policies to this environment?
No. This environment is governed by a fixed DLP policy, and tenant or environment-level policies don't apply to this environment.

### Can users create custom apps, flows, or bots in this environment?
No. All app, flow, and connection creation are blocked by default. Only runtime operations by Microsoft-owned apps are permitted.




