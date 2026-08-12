---
title: Manage costs for agents powered by the GitHub Copilot harness
description: Learn how to control and monitor Copilot Credit consumption for agents powered by the GitHub Copilot harness.
author: EllenWehrle
ms.date: 08/11/2026
ms.reviewer: ellenwehrle
ms.topic: how-to
ms.subservice: admin
ms.author: dimutako
ms.custom: bap-template, NewPPAC
ai-usage: ai-assisted
search.audienceType:
  - admin
---

# Manage costs for agents powered by the GitHub Copilot harness

Agents powered by the GitHub Copilot harness use consumption-based billing. Building, testing, evaluating, and running these agents can consume Copilot Credits. This usage isn't included with a user's Microsoft 365 Copilot license.

As a Power Platform administrator, you can use controls in the Power Platform admin center to allocate prepaid credits, limit consumption, monitor usage, and identify agents created through the GitHub Copilot harness.

> [!IMPORTANT]
> The capacity and consumption controls in the Power Platform admin center apply across Copilot Studio. They aren't exclusive to the GitHub Copilot harness. Configure controls with the other Copilot Studio agents, workflows, and features in mind for each environment.

For information about which activities consume credits and how consumption is measured, see [Overview of billing for agents powered by the GitHub Copilot harness](/microsoft-copilot-studio/agents-experience/billing-credit-overview).

## Before you begin

To manage Copilot Studio capacity, you need the Power Platform Administrator or Global Administrator role, or an equivalent role that can manage licensing and capacity.

Before you configure controls, determine:

- Which environments can host agents powered by the GitHub Copilot harness.
- Whether each environment uses prepaid capacity, pay-as-you-go billing, or both.
- How much monthly consumption is acceptable for each environment and agent.
- Who is responsible for reviewing usage and responding to alerts.
- How makers request access or additional capacity.

## What consumes Copilot Credits in Copilot Studio today

This table lists the Copilot Studio features that consume Copilot Credits and when a Microsoft 365 Copilot license covers the usage.

| Feature | Covered by a Microsoft 365 Copilot license? | When Copilot Credits are billed |
|---|---|---|
| Standard harness agents|Yes, in Microsoft 365 channels| Billed when the user has no Microsoft 365 Copilot license, or when the agent is used in a channel outside Microsoft 365. |
| Workflows | Yes, when run inside a standard harness agent by a licensed user | Billed in all other cases. |
| Prompts | Yes, when run inside a standard harness agent by a licensed user | Billed in all other cases. |
| Computer use (CUA) | No | Billed for all usage. |
| GitHub Copilot harness agents | No | Billed for all usage. Creation and runtime activities consume Copilot Credits regardless of the user's license. |

## Choose cost controls

Use a combination of environment-level and agent-level controls. An agent-level limit helps contain a single workload, while the environment configuration determines which capacity sources are available to all workloads in the environment.

| Control | Use when | Considerations |
|---|---|---|
| Allocate prepaid credits to an environment. | You want to define how much prepaid capacity is assigned to an environment. | An allocation isn't a boundary if the environment can continue drawing from tenant capacity or pay-as-you-go billing. |
| Turn off drawing from tenant capacity. | You don't want the environment to consume unallocated prepaid capacity after its allocation is exhausted. | This setting doesn't prevent consumption through a pay-as-you-go billing plan linked to the environment. |
| Set an agent-level monthly limit. | You want to prevent one agent from consuming an excessive amount of capacity. | Configure notifications and stop usage when the agent reaches its limit. |
| Apply allocations programmatically. | You need to configure many environments consistently or manage allocations through an administrative process. | Automation requires appropriate permissions, validation, and an owner responsible for maintaining it. |
| Set up pay-as-you-go with Azure budgets and alerts. | An environment uses pay-as-you-go billing and you need subscription-level cost visibility. | Azure budgets and alerts send notifications but don't stop Copilot Studio consumption. |

## Contain prepaid consumption for an environment

To contain prepaid consumption, allocate a defined amount of Copilot Credits to the environment and turn off **Draw from the available capacity in my tenant**.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Licensing**.
1. Under **Products**, select **Copilot Studio**.
1. Select **Manage Copilot Credits**.
1. Select the environment.
1. Enter the number of Copilot Credits to allocate.
1. Under **Capacity overages**, clear **Draw from the available capacity in my tenant**.
1. Select **Save**.

When you clear this option, the environment doesn't draw from unallocated prepaid capacity in the tenant after it consumes its allocation. If the environment is linked to a pay-as-you-go billing plan, usage can continue through the linked Azure subscription.

For complete capacity management instructions, see [Manage Copilot Studio credits and capacity](manage-copilot-studio-messages-capacity.md#manage-capacity).

> [!NOTE]
> When an environment has no available Copilot Credits, experiences that require credits can stop working. This limitation can affect both makers and end users. For more information, see [Enforcement policy for agents consuming Copilot Credits](/microsoft-copilot-studio/agents-experience/enforcement-policy-credits).

## Set a monthly limit for an agent

Use an agent-level limit when you need more granular control than the environment allocation provides.

1. In the Power Platform admin center, go to **Licensing** > **Copilot Studio**.
1. Select **Manage Agents**.
1. Select the agent, and then select **Set limit**.
1. Enter the monthly Copilot Credit limit.
1. Configure the notification threshold.
1. Turn on **Stop usage** if the agent should be turned off when it reaches the limit.
1. Select **Save**.

:::image type="content" source="media/manage-usage-github-copilot-harness/agent-monthly-limit.png" alt-text="Screenshot of managing agent capacity by setting a monthly limit in Power Platform admin center." lightbox="media/manage-usage-github-copilot-harness/agent-monthly-limit.png":::

Review agent limits regularly and adjust them based on expected business demand. For more information, see [Manage monthly consumption limits for Copilot Studio agents](manage-copilot-studio-messages-capacity.md#manage-monthly-consumption-limits-for-copilot-studio-agents).

## Manage allocations across many environments

For a large number of environments, use the Power Platform API or an administration SDK to apply allocations and tenant-capacity draw settings consistently.

Automated allocation is useful when you:

- Maintain an approved list of environments that can consume Copilot Credits.
- Standardize allocations and overage behavior.
- Configure capacity as part of an environment provisioning process.
- Periodically reconcile new or changed environments.

For authentication requirements and PowerShell, C#, and Python examples, see [Manage Copilot credit allocations programmatically](programmability-tutorial-manage-copilot-credit-allocations.md).

## Manage pay-as-you-go costs

When you link an environment to a pay-as-you-go billing plan, you can bill Copilot Studio usage to the associated Azure subscription. Use Azure Cost Management to create budgets and alerts for the Power Platform account resource associated with the billing plan.

Budgets and alerts help finance and service owners monitor spending, but they don't stop usage. To create a workload-level stopping point, also configure an agent limit with **Stop usage**. Keep an accountable business owner for each pay-as-you-go billing plan and environment.

For more information, see:

- [Set up pay-as-you-go](pay-as-you-go-set-up.md)
- [View usage and billing information](pay-as-you-go-usage-costs.md)
- [Create and manage Azure budgets](/azure/cost-management-billing/costs/tutorial-acm-create-budgets)

## Monitor Copilot Credit consumption

Use the Copilot Studio licensing pages in the Power Platform admin center to review consumption at multiple levels:

- **Tenant**: Review purchased, allocated, and consumed capacity.
- **Environment**: Compare prepaid and pay-as-you-go consumption and identify environments in overage.
- **Agent**: Review month-to-date billed credits, configured limits, and agent status.
- **Report**: Download detailed consumption data for additional analysis.

:::image type="content" source="media/manage-usage-github-copilot-harness/copilot-studio-licensing.png" alt-text="Screenshot of high-level view of the Copilot Studio licensing pages in Power Platform admin center." lightbox="media/manage-usage-github-copilot-harness/copilot-studio-licensing.png":::

Review environment and agent consumption together. A tenant-level total alone might not reveal an individual environment or agent that is consuming more credits than expected.

Discrete costs aren't attributed to individual makers or end users. Copilot Studio usage is billed at the environment and agent level, not at the user level. Use permissions to control who builds and runs agents, and use environment and agent limits to contain consumption.

For information about the available views, see [Manage Copilot Studio credits and capacity](manage-copilot-studio-messages-capacity.md).

## Identify and count agents created through the GitHub Copilot harness

You can see a breakdown of agents created through the GitHub Copilot harness in Power Platform inventory.

Use the `properties.isCLIAgent` field to identify these agents through:

- Azure Resource Graph
- Power Platform API
- Power Platform for Admins V2 connector

For a ready-to-run Azure Resource Graph query, see [Count agents by harness](inventory-sample-queries.md#count-agents-by-harness). For the field definition, see [Copilot Studio agents in the inventory schema](inventory-schema.md#copilot-studio-agents).

## Coordinate capacity across admin centers

Prepaid Copilot Credit capacity packs can be used by experiences managed in both the Power Platform admin center and the Microsoft 365 admin center. Capacity allocated to Power Platform environments or consumed by Copilot Studio reduces the prepaid capacity available to supported Microsoft 365 experiences, such as Cowork and Work IQ.

Review capacity in both admin centers if your organization uses these experiences:

- Use the Power Platform admin center to manage Copilot Studio environment allocations and agent consumption.
- Use **Copilot** > **Cost Management** in the Microsoft 365 admin center to review capacity available to Microsoft 365 usage-based experiences and manage their spending policies.

For more information, see [Managing AI experiences enabled by usage-based billing](/microsoft-365/copilot/usage-based-billing-manage-copilot-credits).

## Establish an access and capacity request process

The Power Platform admin center doesn't have a GitHub Copilot harness-specific request process. Use your organization's existing access and approval process for makers who need an environment role or extra capacity.

Document:

- Who can approve access to an environment.
- Who can approve a higher agent or environment limit.
- How makers submit a request.
- What business justification and expected usage information the request must include.
- Who reviews consumption after access is granted.

Pair restrictive limits with a documented request path so that makers know how to request extra capacity when they have a valid business need.

## Prepare for the end of preview billing

Developer environments and trial environments move to usage-based billing September 1, 2026. Review the **Non-billed Copilot Credits** information in **Manage Agents** and in the downloadable consumption report. This information can provide a directional view of agent consumption, but it isn't a billing estimate or a guarantee of future cost.

Before that date:

1. Identify agents created through the GitHub Copilot harness.
1. Review their recent nonbilled consumption.
1. Configure environment capacity and overage behavior.
1. Set limits and notifications for higher-risk agents.
1. Configure Azure budgets and alerts for pay-as-you-go billing plans.
1. Assign an owner to review consumption after billing begins.

## Related content

- [Overview of billing for agents powered by the GitHub Copilot harness](/microsoft-copilot-studio/agents-experience/billing-credit-overview)
- [Purchase and manage Copilot Credits](/microsoft-copilot-studio/agents-experience/billing-manage-buy-credits)
- [Manage Copilot Studio credits and capacity](manage-copilot-studio-messages-capacity.md)
- [Manage Copilot credit allocations programmatically](programmability-tutorial-manage-copilot-credit-allocations.md)
- [Power Platform inventory](power-platform-inventory.md)
