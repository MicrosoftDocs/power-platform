---
title: Understand agent counts across admin surfaces
description: Understand why agent counts differ across Microsoft admin surfaces, and how Power Platform inventory compares to the Microsoft 365 admin center.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: ellenwehrle
ms.date: 08/06/2026
ms.topic: concept-article
contributors:
    - Grayson-Bishop
ai-usage: ai-assisted
---

# Understand agent counts across admin surfaces

Microsoft offers multiple admin surfaces that display agents, and you might notice that the agent counts differ across them. Each surface serves a different audience, shows different types of agents, and answers a different question. Understanding these differences helps you interpret the agent counts you see across your organization.

## Power Platform inventory vs. Microsoft 365 admin center

The [Microsoft 365 admin center](/microsoft-365/admin/manage/manage-copilot-agents-integrated-apps) shows agents that are **available to users in your tenant**. This view includes Microsoft first-party agents, third-party ISV agents, and org-created agents that you publish or share. Org-created agents in the Microsoft 365 admin center come from many authoring surfaces, including Teams Store Platform, Agent Toolkit, Foundry, Fabric, SharePoint, and more. It functions as a catalog of everything accessible to your employees.

Power Platform inventory, by contrast, shows only agents that were **built on Power Platform**. This includes both published and draft agents created in Copilot Studio or Microsoft 365 Copilot Agent Builder. It doesn't include first-party Microsoft agents, ISV agents, or agents created on other Microsoft surfaces.

As a result, the agent counts between the two surfaces differ. The Microsoft 365 admin center includes agents your organization didn't build. Power Platform inventory might include agents that don't appear in the Microsoft 365 admin center if those agents are in draft form and not yet published.

## Summary of differences

| | Power Platform inventory | Microsoft 365 admin center |
|---|---|---|
| **Designed for** | IT admins (Power Platform) | IT admins (Microsoft 365) |
| **Shows** | Agents built on Power Platform | All agents available in your tenant (including agents from Teams Store Platform, Agent Toolkit, Foundry, Fabric, SharePoint, Groups, and more) |
| **Includes drafts** | Yes | Published and shared only |
| **Includes 1st-party / ISV** | No | Yes |
| **Scoped to** | Environments (rolled up to tenant) | Tenant |

> [!TIP]
> If you're asked to report on your organization's agent count, clarify what type of count is needed: **total available agents** (Microsoft 365 admin center) or **org-created agents on Power Platform** (Power Platform inventory). Each number is correct within its own context.

## Related content

- [Power Platform inventory](power-platform-inventory.md)
- [Power Platform inventory schema reference](inventory-schema.md)
- [Manage Copilot agents in the Microsoft 365 admin center](/microsoft-365/admin/manage/manage-copilot-agents-integrated-apps)
