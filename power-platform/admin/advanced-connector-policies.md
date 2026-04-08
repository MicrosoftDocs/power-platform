---
title: Advanced connector policies (preview)
description: Learn how to use Advanced connector policies to govern connector usage in Power Platform.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 04/07/2026
author: laneswenka
ms.author: laswenka
ms.reviewer: sericks
contributors:
  - laneswenka
ms.subservice: admin
ms.custom: NewPPAC
search.audienceType:
  - admin
---

# Advanced connector policies (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

## Overview

Advanced connector policies (ACP) represent the next generation of securing connector usage within Power Platform. ACP provides a modern, flexible approach to managing [certified connectors](/power-platform/admin/dlp-connector-classification), replacing the Business/Non-Business/Blocked classification model in classic [data policies](wp-data-loss-prevention.md) with a strict allowlist that blocks all connectors by default.

Key principles of advanced connector policies:

- **Default-deny posture**: All connectors and actions are blocked unless explicitly allowed. New connectors added to the platform are automatically blocked.
- **Per-environment and environment group support**: Configure policies directly on individual environments or deploy at scale through [environment groups](environment-groups.md).
- **Action-level visibility**: See triggers, internal actions, and deprecated actions across all certified connectors to make informed governance decisions.
- **Design-time enforcement**: Makers are blocked from using restricted connectors while authoring, not just at runtime.
- **ACP-only mode**: Optionally skip classic data policy evaluation entirely for a clean governance posture.

By adopting advanced connector policies, administrators gain greater control and granularity in securing and managing connector usage while enhancing the overall governance of their Power Platform environments.

> [!IMPORTANT]
> Advanced connector policies currently apply to **certified connectors only**. Custom connectors and HTTP connectors aren't yet supported. They're planned as a separate rule type in the future. For governing custom connectors and HTTP connectors today, continue using classic [data policies](prevent-data-loss.md).

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Supported connector types

Advanced connector policies are built on the certified connector catalog. ACP doesn't support all connector types from classic data policies.

| Connector type | ACP support | Notes |
|---|---|---|
| **Certified connectors** | Supported | First-party and certified third-party connectors. Full allow/block at the connector and action level. |
| **MCP connectors** | Supported | MCP server-level blocking is available. See [MCP server management](#model-context-protocol-mcp-server-management). |
| **Custom connectors** | Not yet supported | Planned as a separate rule type in a future release. Use classic [data policies](prevent-data-loss.md) for custom connector governance. |
| **HTTP connectors** | Not yet supported | Planned alongside custom connector support. Use classic [data policies](prevent-data-loss.md) and [connector endpoint filtering](connector-endpoint-filtering.md) for HTTP governance. |
| **Virtual connectors** | Not supported | Virtual connectors aren't supported by ACP and won't be added in the future. See [Virtual connector transition](#virtual-connector-transition). |

### Virtual connector transition

Virtual connectors are governance-only constructs in classic data policies that aren't based on a RESTful API. ACP is designed around the certified connector catalog and doesn't support virtual connectors. The following transition paths apply:

- **Copilot Studio virtual connectors**: These connectors are evolving into their own dedicated governance rules, separate from ACP. Administrators should continue using classic data policies for Copilot Studio virtual connector governance until the new rules are available.
- **Desktop Flow virtual connectors**: Desktop Flow connectors are transitioning to certified connectors. Once certified, you manage them through ACP like any other certified connector.

## Configure an advanced connector policy

You can configure advanced connector policies at the environment group level for bulk deployment or directly on individual environments for targeted governance.

### Environment group configuration

To configure an advanced connector policy for an environment group, complete the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environment groups**.
1. In the **Environment groups** page, select the environment group where you want to apply the policy.
1. The environment group's page is displayed. Select the **Rules** tab.
1. Select **Advanced connector policies (preview)**. The **Advanced connector policies (preview)** pane is displayed.
1. Define the policy. Keep the following points in mind:
   - By default, the nonblockable connectors are preloaded as _allowed_.
   - To add new connectors, select **Add connectors** to choose from all certified connectors.
   - To remove connectors, select them and then select **Remove connector**. You can remove any connector to block it.
1. When all connectors are set as you require, select **Save**.
1. The environment group's page is redisplayed. After you update all rules to your requirements, select **Publish rules** in the command bar.

During publishing, the system performs an environment lifecycle operation on every environment that's part of the group. This operation appears in environment history as *Update Managed Environment Settings* and cascades the new connector policy to the design time and runtime infrastructure.

### Single environment configuration

You can also configure an advanced connector policy directly on an individual environment without using environment groups. This approach is ideal for targeted governance on high-risk, pilot, or regulated environments.

:::image type="content" source="media/acp-security-hub.png" alt-text="The Security Hub showing advanced connector policy options under Data and Privacy." lightbox="media/acp-security-hub.png":::

To configure an advanced connector policy for a single environment:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Data and privacy**.
1. Select **Advanced connector policies (preview)**.
1. Define the policy by using the same connector allow and block controls as the environment group experience.
1. Select **Save** to apply the policy.

:::image type="content" source="media/acp-single-environment.png" alt-text="Configuring an advanced connector policy on a single environment." lightbox="media/acp-single-environment.png":::

> [!NOTE]
> Each environment supports a maximum of one effective advanced connector policy. This policy is either directly configured on the environment or inherited from an environment group. If you remove an environment from an environment group, it retains its last known ACP configuration from the group. You can then adjust the policy individually on that environment.

### Policy status

A **Status** property is displayed at the top of every advanced connector policy panel, indicating whether the rule is **Applied** or **Not applied**. This property provides administrators with a quick visual confirmation of the enforcement state for the current scope.

### Remove a rule

Advanced connector policies include a **Remove rule** button for both environment groups and single environments. When you select this button, you disable ACP entirely for that scope and remove the policy enforcement.

> [!TIP]
> Previously, you could disable ACP only through the API or by adding all connectors as allowed, which wasn't an intuitive experience. The **Remove rule** button provides a straightforward way to disable ACP when needed.

## More visibility and control

In [data policies](managed-environment-data-policies.md), customers couldn't see triggers, internal actions, or if an action is deprecated.  By adding these tags across all certified connectors, administrators can quickly decide to block specific triggers from use or turn off actions that are deprecated and no longer supported by the connector publisher.

:::image type="content" source="media/advanced-connector-policies-2.png" alt-text="Admins can quickly decide to block specific triggers from use or turn off actions that are deprecated and no longer supported." lightbox="media/advanced-connector-policies-2.png":::

## Easier management experience

Based on customer feedback, the management experience is drastically simplified by making the policy a strict *allowlist*. When you configure it, you block all new connectors. If you configure the allowed actions on a given connector, then no new actions, triggers, or internal actions are allowed. The concept of the business and nonbusiness categories in data policies isn't brought forward, as it wasn't deemed effective in policy management.

## Proactive policy management

Advanced connector policies are available as part of environment groups and rules, as well as on individual environments. The [Power Platform API](/rest/api/power-platform/environmentmanagement/environment-groups) provides publicly documented APIs so you can build automated scenarios such as creating new policies, updating policies, and moving environments into groups for management at scale.

## Model Context Protocol (MCP) server management

Advanced connector policies support visibility and management of Model Context Protocol (MCP) servers. MCP servers are special connector endpoints that expose MCP-enabled APIs and tooling capabilities within Power Platform.

Within advanced connector policies, administrators can see MCP servers listed alongside other connector types and can choose to block an entire MCP server. As of now, granular control over individual MCP tools (endpoints and actions) within an MCP server isn't available. Blocking the entire MCP server is supported.

:::image type="content" source="media/block-mcp.png" alt-text="Block MCP server in advanced connector policies.":::

## ACP-only mode

ACP-only mode allows administrators to skip classic data policy evaluation entirely and rely solely on advanced connector policies for connector governance. You can enable this mode at both the environment group level and the single environment level.

When you enable ACP-only mode:

- The policy engine evaluates only ACP rules for the affected environments.
- All classic data policies are ignored for those environments, even if they're still configured.
- Data policy configurations aren't deleted. They remain in place but aren't enforced while ACP-only mode is active.

> [!IMPORTANT]
> Use ACP-only mode for organizations that fully migrated their connector governance to ACP and want to eliminate the complexity of running both policy systems simultaneously.

### Why use ACP-only mode?

Running classic data policies and ACP side by side (mixed mode) can create confusion for administrators and makers. Policy violations can come from either system, making it harder to understand and troubleshoot enforcement behavior. ACP-only mode provides a clean break by consolidating governance into a single policy framework.

### Enable ACP-only mode

You can configure ACP-only mode:

- **On an environment group**: Under the environment group's **Rules** tab, enable the **Advanced connector policies only** rule. This setting applies to all environments in the group.
- **On a single environment**: Under the environment's **Security** > **Data and privacy** settings, enable the **Advanced connector policies only** option. This setting applies to that environment only.

## Data policy mixed mode

Advanced connector policies can run in mixed mode alongside classic data policies. This approach allows you to complement configurations so that data policies can achieve action control and endpoint filtering until such time as those features are native to ACP. In addition, you can use ACP to block any connector that isn't possible in classic data policies.

At runtime, when a connector operation is invoked, it queries the effective policy for the current hosting environment. This query includes a combined policy that merges the most restrictive settings from both classic data policies and ACP to provide full enforcement.

> [!TIP]
> Mixed mode is useful during migration from classic data policies to ACP. Once your organization fully adopts ACP, consider enabling [ACP-only mode](#acp-only-mode) to simplify your governance posture and eliminate the dual-evaluation complexity.

## Design-time enforcement

Advanced connector policies support design-time enforcement, which catches policy violations while makers are authoring their apps, flows, and agents, not just at runtime. When a maker attempts to use a blocked connector or action during the authoring experience, they receive a clear error message indicating the policy violation.

Design-time enforcement is rolling out across maker portals in the following order:

1. **Power Automate maker portal** — rolling out first
1. **Copilot Studio** — following Power Automate
1. **Power Apps maker portal** — following Copilot Studio

> [!IMPORTANT]
> Each maker portal's release of design-time enforcement for ACP marks the **general availability** of ACP for that workload. Until design-time support is available in a given maker portal, ACP operates as a runtime-only enforcement for that workload.

Design-time enforcement provides consistent violation messaging across the following surfaces:

- **Flow Checker** in Power Automate.
- **Email notifications** sent to makers when violations are detected.
- **API error responses** returned by the policy evaluation endpoint.

This shift-left approach reduces maker confusion by surfacing policy boundaries early in the development process, eliminating the scenario where makers build and publish resources only to discover violations at runtime.

## Known limitations

While advanced connector policies offer robust capabilities, consider the following limitations:

- **Certified connectors only**: ACP currently supports certified connectors only. Custom connector and HTTP connector support are planned for a future date as a separate rule type.
- **Virtual connectors**: ACP doesn't support virtual connectors and won't support them in the future. For migration paths, see [Virtual connector transition](#virtual-connector-transition).
- **Managed Environments and nonblockable connectors**: In single environment mode, ACP works on both Managed Environments and non-Managed Environments so that all customers using classic data policies can migrate to ACP without extra cost. However, on non-Managed Environments, the nonblockable connectors remain nonblockable. On Managed Environments (single or environment group), you can block any connector or any action, including those that are nonblockable in classic data policies.

## Provide feedback

Are you trying out the new advanced connector policies? The product team would love your feedback! Join the Viva Engage network for keeping the conversation going under non-disclosure agreement:
[Public Preview - Advanced Connector Policies](https://www.yammer.com/dynamicsaxfeedbackprograms/#/threads/inGroup?type=in_group&feedId=215134347264&view=all).
