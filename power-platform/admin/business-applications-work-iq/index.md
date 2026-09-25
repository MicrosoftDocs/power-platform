---
title: Business Applications in Work IQ administration overview (preview)
description: Learn key concepts for admins adopting Business Applications in Work IQ, including access control, governance, and cost management strategies.
#customer intent: As an administrator, I want to understand what Business Applications in Work IQ is, so that I can decide how to adopt it responsibly across my organization.
ms.date: 09/25/2026
author: karissa-larson
ms.author: kalars
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: concept-article
ms.subservice: admin
ms.custom: NewPPAC
ai-usage: ai-assisted
search.audienceType:
  - admin
ms.collection: bap-ai-copilot
---

# Business Applications in Work IQ administration (preview)

[!INCLUDE [cc-preview-work-iq](../../includes/cc-preview-work-iq.md)]

**Work IQ** is Microsoft's context and intelligence layer for AI at work. **Business Applications in Work IQ** is the connection between that layer and the business applications data stored across Dynamics 365 and Power Apps, enabling AI experiences and coding agents to work with your organization's business data and context.

These connections support experiences ranging from answering business questions to powering business processes and operations through skills and agents, and helping developers build business solutions. As an administrator, your role is to help your organization adopt these capabilities in a trusted and responsible way—understanding who and what can access your business data, deciding what participates and where it can be used, and maintaining visibility into AI activity and spending.

## Bring business context to AI experiences

Business applications contain both the data your organization works with and context about how your business operates. Business Applications in Work IQ makes that context available to connected AI experiences and agents.

For example, business context can help:

1. Employees ask questions grounded in business applications data through AI experiences such as Microsoft 365 Copilot.
1. Makers and agent builders create skills and agents that support business processes and operations.
1. Developers connect coding agents to business context and permitted actions through the Work IQ MCP server.

Making these connections available doesn't replace existing access permissions. Work IQ respects the user, agent, and application access already configured for the underlying business data.

## Administrator responsibilities

The admin experience centers on three responsibilities: 

- securing access
- governing participation and use
- observing activity and costs

### Secure: Understand who and what has access

Start with the permissions already configured for your business applications data. Those permissions remain important when the data becomes available through AI experiences.

As an administrator, you should:

1. Review which users, agents, and applications can access the underlying data.
1. Confirm that their permissions are appropriate for the intended business scenarios.
1. Restrict or block access where it isn't appropriate.
1. Understand the difference between access to an AI experience and permission to access the business data used by that experience.

Enabling an experience doesn't grant access to business data. Reviewing existing permissions is therefore a foundational step in preparing for adoption—not something replaced by enabling Work IQ.

See [Review user, agent, and application access for Business Applications in Work IQ](review-data-access.md).

### Governable: Decide what participates and where it can be used

Governance determines the scope of business context available to AI. These decisions span environments, applications, and the experiences that connect to them.

As an administrator, you should:

- Decide which environments participate in Work IQ.
- Work with makers to determine which applications and data participate within those environments.
- Decide which AI experiences and agent connections can use business applications through Work IQ.
- Review current settings and default-enablement behavior as you plan your rollout.

These decisions are separate. An environment's participation doesn't mean every application must participate, and participation doesn't grant extra data permissions.

AI administrators manage experience availability in the Microsoft 365 admin center. Platform and environment administrators manage environment participation in the Power Platform admin center, while makers refine the participating apps and data.

See [Manage participation in Business Applications in Work IQ](manage-participation.md) and [Manage AI experience access to Business Applications in Work IQ](manage-ai-experience-access.md).

### Observable: Understand AI activity and spending

Responsible adoption requires visibility into both how AI interacts with business data and the consumption those experiences generate.

As an administrator, you should:

1. Understand what connected AI experiences and agents are permitted to do.
1. Use the available monitoring capabilities to review their interactions with business data.
1. Understand where usage and charges are reported.
1. Review consumption and spending, and apply the supported cost-management controls.

Consider activity and spending together when deciding whether to expand a rollout or adjust its scope.

See [Manage AI experience access to Business Applications in Work IQ](manage-ai-experience-access.md) and [Understand costs for Business Applications in Work IQ](understand-costs.md).

## Plan a controlled rollout

Start with a defined business scenario. Review access permissions, select participating environments, coordinate application scope with makers, and choose the AI experiences you want to enable.

Before expanding, validate access, review available activity and consumption information, and understand how to turn off participation or block access if needed.

For setup guidance, see [Quickstart: Set up Business Applications in Work IQ for a pilot](quickstart.md). For targeted procedures, see [Manage participation in Business Applications in Work IQ](manage-participation.md) and [Manage AI experience access to Business Applications in Work IQ](manage-ai-experience-access.md).
