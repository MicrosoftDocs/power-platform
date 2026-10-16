---
title: Agentic governance with Power Platform Admin in Cowork
description: Learn how to ask tenant governance questions with Power Platform Admin in Cowork and turn answers into reports and scheduled briefings.
author: manuelap-msft
ms.author: rusant
ms.topic: overview
ms.subservice: guidance
ms.date: 10/16/2026
ai-usage: ai-assisted
---

# Agentic governance with Power Platform Admin in Cowork

Power Platform administrators regularly get questions such as "Which apps didn't anyone use in the last 30 days?" Traditionally, answering these questions means moving between [Power Platform admin center](../../admin/admin-documentation.md) pages, maintaining reports, and exporting data to Excel to piece together an answer that leadership can use.

By using [Power Platform Admin in Cowork](/power-platform/admin/power-platform-admin-cowork), you can ask the question in plain language in [Microsoft Copilot Cowork](/microsoft-365/copilot/cowork/). The Power Platform Admin plugin gathers inventory, usage, and ownership data across your environments and returns an answer. Because the conversation happens in Cowork, you can ask Cowork to turn the answer into a report, draft an email to the resource owner, or repeat the question on a schedule.

> [!IMPORTANT]
> Power Platform Admin in Cowork is in preview. The plugin provides read-only insights and guidance and doesn't independently execute administrative actions.

This article series describes how to use Power Platform Admin in Cowork for tenant governance. Use this approach alongside your [governance strategy](admin-best-practices.md).

## How the plugin and Cowork work together

The Power Platform Admin plugin brings the tenant knowledge: what exists, who owns it, and how it's used. Cowork brings the ability to act on that knowledge. Cowork is an agentic system: you describe the outcome you want, and Cowork plans the steps and carries them out across [Microsoft 365](/microsoft-365/). It can search your organization, create documents and presentations, draft and send email, and post in [Microsoft Teams](/microsoftteams/teams-overview).

| Capability | What it means for governance |
|---|---|
| Grounded in your work | Through [Work IQ](/microsoft-365/copilot/extensibility/work-iq), Cowork reasons over your email, meetings, and files, so you can connect a governance answer to the people and conversations around it. |
| Runs on its own | Cowork can [repeat a prompt on a schedule](/microsoft-365/copilot/cowork/use-cowork#schedule-prompts), or act when a matching email arrives or a Teams message is posted. |
| Keeps you in control | Cowork pauses for your [approval before sensitive actions](/microsoft-365/copilot/cowork/use-cowork#approve-actions), such as sending an email or posting in Teams. |
| Extensible | [Skills](/microsoft-365/copilot/cowork/use-cowork#cowork-skills) and [plugins](/microsoft-365/copilot/cowork/cowork-plugins) add capabilities and connect Cowork to other systems. |

The question, report, email to the owner, and recurring schedule all live in one conversation, without handing off between tools.

## An agentic approach to governance

Traditional governance reporting uses data pipelines, reports, and dashboards that answer predefined questions. When governance questions change, you might need to update those reports.

In an agentic approach, you describe the outcome you want and Cowork helps you investigate it. The platform provides building blocks that include [tenant-wide inventory](../../admin/power-platform-inventory.md), [usage insights](../../admin/tenant-level-analytics.md), [admin center recommendations](../../admin/power-platform-advisor.md), [Managed Environments](../../admin/managed-environment-overview.md), and [default environment routing](../../admin/default-environment-routing.md). Power Platform Admin in Cowork helps you explore your tenant's governance data. You don't need to know where each piece of data lives or how to join it. Instead, decide what to ask and what happens to the answer.

| Task | Traditional approach | Agentic approach with Power Platform Admin in Cowork |
|---|---|---|
| Setup | Build, configure, and maintain reporting solutions. | [Connect the Power Platform Admin plugin in Cowork](../../admin/power-platform-admin-cowork.md#connect-the-plugin-in-cowork), then ask. |
| Questions | Use the questions the report was built to answer. | Ask questions about the governance signals available to the plugin. |
| Join data | Join data in [Power BI](/power-bi/fundamentals/power-bi-overview) or Excel. | Ask Cowork to connect data across environments. |
| Follow-up questions | Build or update a report. | Ask another question in the same conversation. |
| Share findings | Export and reformat results. | Ask Cowork for a report, an email, or a Teams post. |
| Automation | Build and maintain scheduled flows. | Ask Cowork to run the prompt on a schedule. |
| Action | Hand off findings to other tools and people. | Ask Cowork to draft owner outreach, with your approval before anything is sent. |

## Power Platform Admin in Cowork at a glance

- **Where:** Follow the [plugin installation instructions](/power-platform/admin/power-platform-admin-cowork#install-the-plugin-for-users) and [connect the plugin in Cowork](/power-platform/admin/power-platform-admin-cowork#connect-the-plugin-in-cowork), then ask about your Power Platform tenant.
- **Who:** [Power Platform administrators and Dynamics 365 administrators](../../admin/use-service-admin-role-manage-tenant.md), and [Global administrators](/entra/identity/role-based-access-control/permissions-reference#global-administrator).
- **What it reasons over:** Your tenant's inventory of apps, flows, agents, and environments, plus usage and ownership data. More governance signals are added over time.
- **How you work with it:** Ask a question, refine it with follow-up questions, and then ask Cowork to act on the answer.
- **What it costs:** Questions consume [Copilot credits](/microsoft-365/copilot/usage-based-billing-overview-copilot-credits). Administrators can [monitor consumption](/microsoft-365/copilot/usage-based-billing-copilot-credits-monitor-spending) and configure [spending policies](/microsoft-365/copilot/usage-based-billing-manage-copilot-credits) in the [Microsoft 365 admin center](/microsoft-365/admin/admin-overview/about-the-admin-center) to control access and Copilot Credit spending.
- **Managed Environments:** These environments aren't required to ask questions. Features such as environment groups and default environment routing have their own requirements. The plugin provides read-only insights, not administrative changes.

> [!IMPORTANT]
> Answers are AI-generated and can vary between runs and tenants. Validate findings before you contact makers or change policies, environments, or resources.

## Prepare for rollout

> [!IMPORTANT]
> For access, licensing, required roles, and plugin setup, follow the [Power Platform Admin in Cowork documentation](/power-platform/admin/power-platform-admin-cowork#prerequisites).

Before a broad rollout, plan how you'll manage Copilot Credit spending:

1. Run a pilot. Schedule two or three governance scenarios for a month and use the actual consumption to set your budget.
2. Configure [spending policies](/microsoft-365/copilot/usage-based-billing-manage-copilot-credits) in the Microsoft 365 admin center to control access and Copilot Credit spending.
3. [Monitor consumption](/microsoft-365/copilot/usage-based-billing-copilot-credits-monitor-spending) in the Microsoft 365 admin center.

Review the [Cowork security and compliance guidance](/microsoft-365/copilot/cowork/cowork-admin-governance) and [responsible AI application card](/microsoft-365/copilot/responsible-ai/copilot-cowork-application-card) with your compliance team. Confirm supported regions and AI subprocessors for your deployment.

### Managed Environments

Managed Environments aren't required to ask questions. The Power Platform Admin plugin provides read-only insights and doesn't independently change settings. If you act on findings in the Power Platform admin center, check the requirements for any [Managed Environments](../../admin/managed-environment-overview.md) features you use.

### Data handling and compliance

Review the [Cowork security and compliance guidance](/microsoft-365/copilot/cowork/cowork-admin-governance) and [responsible AI application card](/microsoft-365/copilot/responsible-ai/copilot-cowork-application-card) with your compliance team before you roll out Power Platform Admin in Cowork. Confirm supported regions and AI subprocessors for your deployment.

### Responsible use

Answers are AI-generated and can vary between runs and tenants. Validate answers before you make changes to policies, environments, or resources, or before you contact makers.

## Next steps

Explore example prompts to investigate your tenant's inventory, usage, and governance.

> [!div class="nextstepaction"]
> [Governance prompt library](agentic-governance-prompts.md)

## Related information

- [Power Platform Admin in Cowork (preview)](../../admin/power-platform-admin-cowork.md)
- [Managed Environments overview](../../admin/managed-environment-overview.md)
- [Actions overview in the Power Platform admin center](../../admin/power-platform-advisor.md)
- [Managed Platform workshop labs](https://microsoft.github.io/apps-agents-workshop/)
