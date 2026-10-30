---
title: Understand agent counts across admin surfaces
description: Understand why agent counts differ across Microsoft admin surfaces, and how Power Platform inventory compares to the Microsoft 365 admin center.
author: mikferland-msft
ms.author: miferlan
ms.reviewer: ellenwehrle
ms.date: 10/30/2026
ms.topic: concept-article
contributors:
    - Grayson-Bishop
ai-usage: ai-assisted
---

# Understand agent counts across admin surfaces

Microsoft offers multiple admin surfaces that display agents, and you might notice that the agent counts differ across them. Each surface serves a different audience, shows different types of agents, and answers a different question. Understanding these differences helps you interpret the agent counts you see across your organization.

## Power Platform inventory vs. Microsoft 365 admin center

The Agent 365 agent registry in the [Microsoft 365 admin center](/microsoft-365/admin/manage/manage-copilot-agents-integrated-apps) provides **tenant-wide visibility across agent platforms**. This view includes Microsoft first-party agents, third-party ISV agents, and org-created agents, including draft and unpublished agents created in Copilot Studio or Microsoft 365 Copilot Agent Builder. Org-created agents in the Microsoft 365 admin center come from many authoring surfaces, including Teams Store Platform, Agent Toolkit, Foundry, Fabric, SharePoint, and more.

Copilot Studio agents register automatically when you create them. Publishing or sharing isn't required for these agents to appear in the registry. An agent's presence in the registry doesn't mean it's available for end users to use. For registration details, see [How Copilot Studio agents appear in the registry](/microsoft-agent-365/builder/agent-registry#how-copilot-studio-agents-appear-in-the-registry).

Power Platform inventory, by contrast, shows only agents that were **built on Power Platform**. This includes both published and draft agents created in Copilot Studio or Microsoft 365 Copilot Agent Builder. It doesn't include first-party Microsoft agents, ISV agents, or agents created on other Microsoft surfaces.

As a result, the agent counts between the two surfaces differ. The Microsoft 365 admin center includes agents your organization didn't build and agents built outside Power Platform. Differences in platform coverage and scope can produce different counts even though both surfaces include draft agents.

## Summary of differences

| | Power Platform inventory | Microsoft 365 admin center (Agent 365 registry) |
|---|---|---|
| **Designed for** | IT admins (Power Platform) | IT admins (Microsoft 365) |
| **Shows** | Agents built on Power Platform | Agents across platforms in your tenant, including draft, unpublished, published, and shared agents |
| **Includes drafts** | Yes | Yes, including draft and unpublished agents created in Copilot Studio or Microsoft 365 Copilot Agent Builder |
| **Includes 1st-party / ISV** | No | Yes |
| **Scoped to** | Environments (rolled up to tenant) | Tenant |

> [!TIP]
> If you're asked to report on your organization's agent count, clarify what type of count is needed: **agents in the tenant-wide registry** (Microsoft 365 admin center) or **org-created agents on Power Platform** (Power Platform inventory). Registry counts aren't limited to agents available for end users to use. Each number is correct within its own context.

## Related content

- [Power Platform inventory](power-platform-inventory.md)
- [Power Platform inventory schema reference](inventory-schema.md)
- [Manage Copilot agents in the Microsoft 365 admin center](/microsoft-365/admin/manage/manage-copilot-agents-integrated-apps)
