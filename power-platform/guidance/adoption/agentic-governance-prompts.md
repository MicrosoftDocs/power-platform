---
title: Governance prompt library for Power Platform Admin in Cowork
description: Use prompts with Power Platform Admin in Cowork to inventory your tenant, find unused resources, check policy impact, and plan capacity.
author: manuelap-msft
ms.author: rusant
ms.topic: reference
ms.subservice: guidance
ms.date: 10/16/2026
ai-usage: ai-assisted
---

# Governance prompt library for Power Platform Admin in Cowork

Use the prompts in this article with [Power Platform Admin in Cowork (preview)](../../admin/power-platform-admin-cowork.md) after you review the [prerequisites](../../admin/power-platform-admin-cowork.md#prerequisites), [install the plugin](../../admin/power-platform-admin-cowork.md#install-the-plugin-for-users), and [connect it in Cowork](../../admin/power-platform-admin-cowork.md#connect-the-plugin-in-cowork). Use them as a starting point: change the time window, environment, or threshold to fit your organization.

> [!IMPORTANT]
> Before you begin, review the [Power Platform Admin in Cowork prerequisites](/power-platform/admin/power-platform-admin-cowork#prerequisites) and [prepare for rollout](agentic-governance.md#prepare-for-rollout).

## Write effective prompts

- **Be specific.** Include a time window, an environment, a threshold, and the output format you want, for example, "as a table with owner and environment."
- **Use follow-up questions.** The second and third questions in a conversation often give the most useful answers.
- **Ask even if you're not sure.** Coverage grows over time. If Power Platform Admin in Cowork can't answer yet, send feedback.
- **Reuse what works.** Save prompts that give the right answer, or turn them into a skill and schedule them. Learn more in [Turn governance answers into reports and automations](agentic-governance-reports.md).

## Understand what you have

Get a briefing on what was created and changed across apps, flows, and agents. For the underlying resource inventory experience, see [Power Platform inventory](../../admin/power-platform-inventory.md).

```prompt
What happened in my Power Platform tenant in the last week?
```

Follow up to connect the inventory to the people behind it:

```prompt
Who created them?
```

## Find unused and ownerless resources

Build a cleanup list and start a conversation with makers.

```prompt
Which apps haven't been used in the last 30 days?
```

```prompt
Show me the apps and flows whose owner has left the organization.
```

## Manage the default environment

Identify apps that no longer fit personal productivity needs.

```prompt
Which apps in the default environment are used by more than 10 people? Give me the owner and a link to each.
```

Combine this information with the [Power Platform admin center](../../admin/admin-documentation.md) recommendation to move apps out of the default environment, and plan a suitable [Managed Environment](../../admin/managed-environment-overview.md) for them. Learn more in [Default environment routing](../../admin/default-environment-routing.md) and [Manage the default environment](manage-default-environment.md).

## Check the impact before you change a policy

Before you block a connector, understand which resources are affected and who owns them. Bring the list of affected resources and owners to your change advisory board. For policy concepts, see [Data policies](../../admin/wp-data-loss-prevention.md).

```prompt
If I block the [connector name] connector, which apps, flows, and agents would be affected, and who owns them?
```

```prompt
In which environments could I block [connector name] today without breaking anything?
```

## Build a showback report

Many organizations want to allocate platform consumption costs to the business areas that use the platform. Start with usage by owner, then add the owner's department in the same conversation.

```prompt
Break down app, flow, and agent usage by owner for the last 30 days.
```

```prompt
Add each owner's department and summarize usage by department as a table.
```

To see where adoption and AI consumption sit across the organization:

```prompt
Show me app usage across my tenant, grouped by the owner's department.
```

```prompt
Create a report on AI credit consumption, grouped by the owner's department.
```

Use the department view to identify the business areas driving adoption, compare demand, and start informed showback and capacity-planning conversations.

## Get a security and governance baseline

Create a starting point for the conversation with your security team and a prioritized list of what to fix first.

```prompt
Give me a security and governance overview of my tenant.
```

```prompt
Do a security posture analysis of my default environment.
```

## Plan environment capacity

Identify environments approaching [Dataverse capacity](../../admin/capacity-storage.md) or AI credit limits, forecast demand, and notify owners early so they can plan extra capacity before services are affected.

```prompt
Show me which environments have limited Dataverse capacity.
```

```prompt
Predict which environments will need additional AI credits before the end of the month, based on weekly usage.
```

```prompt
For environments with less than 40% Dataverse capacity free, draft an email to each environment owner with an estimate of the capacity needed until the end of the year. Save the emails in my Drafts folder.
```

> [!TIP]
> Asking Cowork to save emails as drafts lets you review each message before it's sent.

## Turn the answer into a report

Turn any answer into an interactive HTML report with sortable, filterable tables, so you can explore and share governance data without building a separate workbook or dashboard.

```prompt
Build an HTML report with this information. Make sure I can filter tables and sort columns by value.
```

## Next steps

Turn your governance findings into reports, recurring briefings, and follow-up actions.

> [!div class="nextstepaction"]
> [Turn governance answers into reports and automations](agentic-governance-reports.md)
