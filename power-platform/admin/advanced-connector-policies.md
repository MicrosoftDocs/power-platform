---
title: Advanced connector policies
description: Learn how to use Advanced connector policies to govern connector usage in Power Platform.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 11/18/2026
ai-usage: ai-generated
author: laneswenka
ms.author: laswenka
ms.reviewer: ellenwehrle
contributors:
  - laneswenka
ms.subservice: admin
ms.custom: NewPPAC
search.audienceType:
  - admin
---

# Advanced connector policies 

Advanced connector policies (ACP) provide the next generation of securing connector usage within Power Platform. ACP offers a modern, flexible approach to managing [certified connectors](/power-platform/admin/dlp-connector-classification). It replaces the Business, Non-Business, and Blocked classification model in classic [data policies](wp-data-loss-prevention.md) with a strict allowlist that blocks all connectors by default.

Key principles of advanced connector policies:

- **Default-deny posture**: All connectors and actions are blocked unless explicitly allowed. New connectors added to the platform are automatically blocked.
- **Per-environment and environment group support**: Configure policies directly on individual environments or deploy at scale through [environment groups](environment-groups.md).
- **Action-level visibility**: See triggers, [internal actions](#internal-actions), and deprecated actions across all certified connectors to make informed governance decisions.
- **Design-time enforcement**: Makers are blocked from using restricted connectors while authoring, not just at runtime.
- **ACP-only mode**: Optionally skip classic data policy evaluation entirely for a clean governance posture.

By adopting advanced connector policies, administrators gain greater control and granularity in securing and managing connector usage while enhancing the overall governance of their Power Platform environments.

> [!IMPORTANT]
> Advanced connector policies currently apply to **certified connectors only**. Custom connectors and HTTP connectors aren't yet supported. They're planned as a separate rule type in the future. For governing custom connectors and HTTP connectors today, continue using classic [data policies](prevent-data-loss.md).

## Enforcement modes

When you enable ACP, you choose how it works alongside your existing classic [data policies](wp-data-loss-prevention.md). Two modes are available:

- **Mixed mode (default)**: ACP runs alongside classic data policies, and the most restrictive settings from both are enforced. This mode is the starting state when you first enable ACP and is recommended while you migrate. For details, see [Data policy mixed mode](#data-policy-mixed-mode).
- **ACP-only mode**: ACP becomes the sole policy evaluator. Classic data policies are ignored but not deleted for the affected scope. Choose this mode after you fully migrate connector governance to ACP. For details, see [ACP-only mode](#acp-only-mode).

Set the mode independently on an environment group or a single environment. For a phased approach to moving from classic data policies to ACP, see [Migrate from data policies to ACP](#migrate-from-data-policies-to-acp).

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

- **Copilot Studio virtual connectors**: These connectors are moving to dedicated agent settings in the Power Platform admin center, separate from ACP. Dedicated settings are available for agent publishing channels, agent authentication, and skills. For Copilot Studio virtual connectors that don't have a dedicated setting yet, continue using classic data policies. For the full mapping, see [Which control to use](#which-control-to-use).
- **Desktop Flow virtual connectors**: Desktop Flow connectors are transitioning to certified connectors. Once certified, you manage them through ACP like any other certified connector.

## Configure an advanced connector policy

You can configure advanced connector policies at the environment group level for bulk deployment or directly on individual environments for targeted governance.

> [!IMPORTANT]
> ACP enforces a strict allowlist as soon as you save it (single environment) or publish it (environment group): every connector that isn't explicitly allowed is blocked. Before you enable ACP at scale, review and curate the allowed connectors for the scope first. To validate policy behavior without immediately blocking makers, keep your classic data policies in place and start in [mixed mode](#data-policy-mixed-mode) rather than [ACP-only mode](#acp-only-mode).

### Environment group configuration

To configure an advanced connector policy for an environment group, complete the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environment groups**.
1. In the **Environment groups** page, select the environment group where you want to apply the policy.
1. The environment group's page is displayed. Select the **Rules** tab.
1. Select **Advanced connector policies**. The **Advanced connector policies** pane is displayed.
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
1. Select **Advanced connector policies**.
1. Define the policy by using the same connector allow and block controls as the environment group experience.
1. Select **Save** to apply the policy.

:::image type="content" source="media/acp-single-environment.png" alt-text="Configuring an advanced connector policy on a single environment." lightbox="media/acp-single-environment.png":::

> [!NOTE]
> Each environment supports a maximum of one effective advanced connector policy. This policy is either directly configured on the environment or inherited from an environment group. Removing a rule from a group - including an advanced connector policy - doesn't automatically remove that rule from the individual environments in the group. The same rule applies when you remove an environment from a group: the affected environments keep their last known ACP configuration rather than reverting automatically. This behavior is intentional, because it prevents an enforcement gap where connectors would otherwise become unexpectedly unblocked. To remove enforcement, go to each affected environment and remove the policy directly, or automate the removal at scale by using the [Power Platform API](/rest/api/power-platform/governance/rule-based-policies).

### Policy status

A **Status** property is displayed at the top of every advanced connector policy panel, indicating whether the rule is **Applied** or **Not applied**. This property provides administrators with a quick visual confirmation of the enforcement state for the current scope.

### Remove a rule

Advanced connector policies include a **Remove rule** button for both environment groups and single environments. When you select this button, you disable ACP entirely for that scope and remove the policy enforcement.

> [!IMPORTANT]
> Removing a rule at the environment group scope stops the group from managing that rule, but it doesn't remove the rule from environments that already inherited it - including an advanced connector policy. Those environments retain their last applied ACP configuration. To fully remove enforcement, remove the rule on each affected environment individually, or use the [Power Platform API](/rest/api/power-platform/governance/rule-based-policies) to remove it across many environments at scale.

> [!TIP]
> Previously, you could disable ACP only through the API or by adding all connectors as allowed, which wasn't an intuitive experience. The **Remove rule** button provides a straightforward way to disable ACP when needed.

## More visibility and control

In [data policies](managed-environment-data-policies.md), customers couldn't see triggers, internal actions, or if an action is deprecated.  By adding these tags across all certified connectors, administrators can quickly decide to block specific triggers from use or turn off actions that are deprecated and no longer supported by the connector publisher.

:::image type="content" source="media/advanced-connector-policies-2.png" alt-text="Admins can quickly decide to block specific triggers from use or turn off actions that are deprecated and no longer supported." lightbox="media/advanced-connector-policies-2.png":::

### Internal actions

An *internal action* is a connector operation that the connector's publisher hides from makers. The publisher marks the operation as internal in the connector definition by using the [`x-ms-visibility`](/connectors/custom-connectors/openapi-extensions#x-ms-visibility) extension. Makers don't see internal actions when they add actions to apps, flows, or agents. Instead, connectors and products call internal actions behind the scenes to support other functionality. For example, a connector can use an internal action to [load the values of a drop-down list](/connectors/custom-connectors/openapi-extensions#x-ms-dynamic-values) or the fields of a list for one of its visible actions. Products can also use internal actions to support built-in experiences.

Internal actions differ from standard connector actions in the following ways:

| Characteristic | Standard action | Internal action |
|---|---|---|
| Makers can select it in the designer | Yes | No |
| Listed in the connector's reference documentation | Yes | No |
| Listed in the **Connector actions** pane in ACP | Yes | Yes, with the **[INTERNAL]** label |
| Can be allowed or blocked in ACP | Yes | Yes |

#### Why ACP shows internal actions

Internal actions run through the same connection as the connector's other actions, so they can access the same data in the connected service. Because internal actions underpin visible actions and product features, you can't govern some capabilities by allowing or blocking visible actions alone. If ACP hid internal actions, those capabilities would be outside your control. ACP lists internal actions so that you can include them in the same allow and block decisions as the connector's other actions.

#### Why connector documentation doesn't list internal actions

The [connector reference documentation](/connectors/connector-reference/) describes the actions and triggers that makers can use in apps, flows, and agents. Because makers can't select internal actions, the reference documentation intentionally leaves them out. If ACP lists an action that you can't find in the connector's reference article, check whether the action has the **[INTERNAL]** label. You can allow or block an internal action in ACP even though the connector reference doesn't document it.

For example, the **Connector actions** pane for the SharePoint connector, shown in the previous screenshot, lists internal actions such as **Returns User fields for a list [INTERNAL]** and **Set request sign-off status [INTERNAL]** alongside standard actions such as **Send an HTTP request to SharePoint**. The [SharePoint connector reference](/connectors/sharepointonline/) doesn't list these internal actions.

#### Govern internal actions

Keep the following points in mind when you govern internal actions:

- When you allow a connector without restricting its actions, ACP allows all of the connector's actions, including its internal actions.
- When you allow only specific actions on a connector, ACP blocks every internal action that you don't allow, including internal actions that the publisher adds later.
- Blocking an internal action might stop visible actions or built-in features that depend on it from working as expected. If an allowed action stops working after you restrict a connector, check whether it depends on an internal action that you blocked. Test these changes in a pilot environment first, as described in [Step 6: Validate the pilot](#step-6-validate-the-pilot).
- If an action that you want to allow isn't selectable in the Power Platform admin center, add it to the policy by its operation ID by using the Power Platform API. For an example, see [Enable an individual connector action](programmability-tutorial-manage-advanced-connector-policies.md#step-4-enable-an-individual-connector-action).

## Easier management experience

Based on customer feedback, the management experience is drastically simplified by making the policy a strict *allowlist*. When you configure it, you block all new connectors. If you configure the allowed actions on a given connector, then no new actions, triggers, or internal actions are allowed. The concept of the business and nonbusiness categories in data policies isn't brought forward, as it wasn't deemed effective in policy management.

## Proactive policy management

Advanced connector policies are available as part of environment groups and rules, as well as on individual environments. The [Power Platform API](/rest/api/power-platform/environmentmanagement/environment-groups) provides publicly documented APIs so you can build automated scenarios such as creating new policies, updating policies, and moving environments into groups for management at scale.

For a step-by-step walkthrough with PowerShell, C#, and Python examples, see [Tutorial: Manage advanced connector policies programmatically](programmability-tutorial-manage-advanced-connector-policies.md).

## Model Context Protocol (MCP) server management

Advanced connector policies support visibility and management of Model Context Protocol (MCP) servers. MCP servers are special connector endpoints that expose MCP-enabled APIs and tooling capabilities within Power Platform.

Within advanced connector policies, administrators can see MCP servers listed alongside other connector types and can choose to block an entire MCP server. As of now, granular control over individual MCP tools (endpoints and actions) within an MCP server isn't available. Blocking the entire MCP server is supported.

:::image type="content" source="media/block-mcp.png" alt-text="Block MCP server in advanced connector policies.":::

## Data policy mixed mode

Advanced connector policies can run in mixed mode alongside classic data policies. This approach allows you to complement configurations so that data policies can achieve action control and endpoint filtering until such time as those features are native to ACP. In addition, you can use ACP to block any connector that isn't possible in classic data policies.

Mixed mode is the default state when you first enable ACP: classic data policies continue to be evaluated alongside your new advanced connector policy until you switch to ACP-only mode.

At runtime, when a connector operation is invoked, it queries the effective policy for the current hosting environment. This query includes a combined policy that merges the most restrictive settings from both classic data policies and ACP to provide full enforcement.

> [!TIP]
> Mixed mode is useful during [migration from classic data policies to ACP](#migrate-from-data-policies-to-acp). Once your organization fully adopts ACP, consider enabling [ACP-only mode](#acp-only-mode) to simplify your governance posture and eliminate the dual-evaluation complexity.

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

## How ACP, data policies, and agent settings work together

Power Platform uses three types of controls to govern connectors and agents: advanced connector policies, classic data policies, and dedicated agent settings in the Power Platform admin center. Each control governs a different set of capabilities, and some capabilities can be governed by more than one control at the same time. Use this section to choose the right control and to understand which outcome applies when controls overlap.

### Which control to use

The following table shows which control governs each capability. Where a dedicated agent setting replaces a Copilot Studio virtual connector, use the dedicated setting for new configurations.

| What you want to govern | Control to use | Notes |
|---|---|---|
| Certified connectors, including their actions and triggers, in apps, flows, and agents | Advanced connector policies | In mixed mode, classic data policies also apply. |
| MCP servers | Advanced connector policies | You can block an entire MCP server. See [MCP server management](#model-context-protocol-mcp-server-management). |
| Custom connectors and HTTP connectors | Classic [data policies](prevent-data-loss.md) | Not yet supported by ACP. |
| Endpoints that a connector can reach | Classic data policies with [connector endpoint filtering](connector-endpoint-filtering.md) | Not available in ACP. |
| Channels that makers can publish agents to | [Agent access channels](security/identity-access-management.md#agent-access-channels-preview) (preview) | Replaces the Copilot Studio channel virtual connectors, such as **Direct Line channels in Copilot Studio** and **WhatsApp channel in Copilot Studio**. To configure it, see [Configure channel publishing and connected agent access](security/configure-channel-connected-agent-publishing.md). |
| Whether agents allow access without authentication | [Authentication for agents](security/identity-access-management.md#authentication-for-agents-preview) (preview) | Replaces the **Chat without Microsoft Entra ID authentication in Copilot Studio** virtual connector. |
| Skills that agents can use | [Skills in Copilot Studio](skills-copilot-studio-rule.md) | Replaces the Copilot Studio virtual connectors that govern skills. |
| Knowledge sources that agents can use | [Knowledge sources for agents](knowledge-sources-for-agents-rule.md) (preview) | Dedicated agent setting, separate from ACP. |
| Other Copilot Studio virtual connectors, such as **Application Insights in Copilot Studio** and **Microsoft Copilot Studio**, and desktop flow virtual connectors | Classic data policies | No dedicated setting is available yet, and ACP doesn't support virtual connectors. |

### How conflicts are resolved

When more than one control applies to the same capability, the most restrictive outcome wins. An allow in one control never overrides a block in another control.

- **ACP and data policies in mixed mode**: Both are evaluated. Makers can use a connector or action only when ACP allows it and no data policy that applies to the environment blocks it. For example, if ACP allows the SharePoint connector but a data policy blocks it, SharePoint is blocked. The Business and Non-business data groups in data policies also continue to apply.
- **ACP-only mode**: Classic data policies are ignored for the scope, and ACP is the only connector policy that's evaluated. Don't rely on a data policy for any control in an ACP-only scope, including custom connectors, HTTP connectors, endpoint filtering, and virtual connectors. Before you switch, move agent controls to the dedicated agent settings. If a scope still depends on data policies, keep it in mixed mode.
- **Dedicated agent settings and Copilot Studio virtual connectors**: While data policies are evaluated for an environment, **Agent access channels** and the channel virtual connectors both apply. **Authentication for agents** and the **Chat without Microsoft Entra ID authentication in Copilot Studio** virtual connector also both apply. Allow access in both places. If either one blocks access, access is blocked. For example, if **Agent access channels** allows WhatsApp but a data policy blocks the **WhatsApp channel in Copilot Studio** virtual connector, makers can't publish agents to WhatsApp.
- **ACP and dedicated agent settings**: These controls govern different capabilities, so they don't conflict. ACP doesn't govern channels, authentication, skills, or knowledge sources, and dedicated agent settings don't govern connectors. Dedicated agent settings apply in both mixed mode and ACP-only mode.
- **Environment groups and environments**: A rule that's published on an [environment group](environment-groups.md) takes precedence over the same setting on individual environments in the group, and the environment-level setting becomes read-only.

> [!TIP]
> If a channel is allowed in **Agent access channels** but makers still can't select it, check whether a data policy blocks the matching Copilot Studio virtual connector. A virtual connector can be blocked explicitly, or because it's in the data policy's default group for new connectors and that group is **Blocked**. To resolve the conflict, allow the virtual connector in the data policy.

## Migrate from data policies to ACP

Move connector governance from classic data policies to ACP in phases so that makers aren't disrupted and you can roll back at any point. The following approach keeps your data policies in place until each scope is validated, starts with a small pilot, and then expands in waves.

### Step 1: Inventory your data policies

For each data policy in your tenant, record the following information:

- The environments that the policy applies to: all environments, specific environments, or all environments except specific ones.
- The connectors in the **Business**, **Non-business**, and **Blocked** groups, and the default group for new connectors.
- Any [connector action control](connector-action-control.md) and [endpoint filtering](connector-endpoint-filtering.md) rules.
- How the policy classifies custom connectors, including host URL patterns in tenant-level policies.
- The Copilot Studio and desktop flow virtual connectors that the policy blocks.

More than one data policy can apply to the same environment, and the [combined effect](dlp-combined-effect-multiple-policies.md) is the most restrictive result. Group your environments by the set of data policies that apply to them. Environments that share the same set of data policies are good candidates to share an advanced connector policy.

To export policy settings by using PowerShell, use the `Get-DlpPolicy` and `Get-PowerAppDlpPolicyConnectorConfigurations` cmdlets. For more information, see [Data policy commands](powerapps-powershell.md#data-policy-commands).

> [!NOTE]
> When you view a data policy by using PowerShell, you see only connectors that are explicitly classified. Connectors that were never moved out of the default group aren't returned. To see every connector in a policy, use the Power Platform admin center. For more information, see [Viewing the classification of connectors](dlp-connector-classification.md#viewing-the-classification-of-connectors).

### Step 2: Choose your pilot scope

Decide where each advanced connector policy applies, and start with a small, lower-risk pilot, such as a group of developer environments.

- Use [environment groups](environment-groups.md) to apply one policy to many managed environments.
- Configure a policy on a single environment when the environment isn't a managed environment or needs its own policy.
- To make sure new developer environments are governed by ACP from the start, use [environment routing](default-environment-routing.md) to place them in an environment group that has an advanced connector policy.

### Step 3: Map data policy settings to ACP and agent settings

Use the following table to decide where each data policy setting belongs after you migrate.

| Data policy setting | Where to configure it after you migrate |
|---|---|
| Certified connectors in **Business** or **Non-business** | Allow them in ACP. |
| Certified connectors in **Blocked** | Leave them out of ACP. ACP blocks every connector that isn't allowed. |
| Default group for new connectors | Nothing to configure. ACP blocks new connectors by default. |
| Connector action control rules | Allow only the required actions on the connector in ACP. |
| Connector endpoint filtering rules | Keep them in data policies. |
| Custom connector and HTTP connector rules | Keep them in data policies. |
| Copilot Studio channel virtual connectors | **Agent access channels** |
| **Chat without Microsoft Entra ID authentication in Copilot Studio** | **Authentication for agents** |
| Copilot Studio virtual connectors that govern skills | **Skills in Copilot Studio** |
| Other Copilot Studio virtual connectors and desktop flow virtual connectors | Keep them in data policies. |

Keep the following differences in mind:

- ACP doesn't have data groups, so it doesn't stop makers from using Business and Non-business connectors together in the same app, flow, or agent. If you rely on data groups to keep data from moving between specific connectors, keep the scope in mixed mode so that the data policy continues to apply.
- Use the migration to tighten your allow list. Allow only the connectors that your makers need rather than every connector that a data policy didn't block.
- On managed environments, ACP can block connectors that data policies can't block. Make sure your policy allows the [connectors that you can't block in data policies](dlp-connector-classification.md#list-of-connectors-that-you-cant-block) that your organization relies on.

### Step 4: Create the advanced connector policy in mixed mode

Create the advanced connector policy for your pilot scope without changing or deleting your data policies.

1. Create the policy and apply it to the pilot scope, as described in [Configure an advanced connector policy](#configure-an-advanced-connector-policy). To build the allow list from an existing data policy by using a script, see [Create a policy from an existing data policy](programmability-tutorial-manage-advanced-connector-policies.md#step-8-create-a-policy-from-an-existing-data-policy).
1. Leave **Advanced connector policies only** turned off so that the scope runs in mixed mode.
1. Confirm that the policy's **Status** is **Applied**.

Because mixed mode enforces the most restrictive result, an advanced connector policy that allows every connector your data policies allow doesn't change what makers can do. If the policy misses a connector that makers use, that connector becomes blocked, which helps you find gaps during the pilot.

### Step 5: Configure dedicated agent settings

Configure the dedicated agent settings for the same scope so that they match your current Copilot Studio virtual connector settings:

- [Agent access channels](security/configure-channel-connected-agent-publishing.md) for publishing channels.
- [Authentication for agents](security/identity-access-management.md#authentication-for-agents-preview) for agent authentication.
- [Skills in Copilot Studio](skills-copilot-studio-rule.md) for skills.

While data policies are still evaluated, both the dedicated setting and the virtual connector apply, and the most restrictive outcome wins. Match the settings so that the dedicated settings don't block anything your makers use today, and so that they enforce the same restrictions after data policies are no longer evaluated.

### Step 6: Validate the pilot

Give the policy time to take effect across the pilot environments. Then run smoke tests in at least one pilot environment:

1. In Power Automate, create a flow that uses an allowed connector, and confirm that you can save and run it.
1. Add a connector that ACP doesn't allow, and confirm that you see a policy violation.
1. If you restricted connector actions, confirm that only the allowed actions are available.
1. Run representative existing apps, flows, and agents, and confirm that they still work.
1. In Copilot Studio, confirm that makers can publish agents only to allowed channels, and that your authentication and skills settings are enforced.

Design-time enforcement is rolling out across maker portals. Where it isn't available yet, ACP violations appear at runtime, so include runtime tests. For more information, see [Design-time enforcement](#design-time-enforcement).

If a test fails because a connector that makers need is blocked, allow the connector in ACP and test again. Ask pilot makers to report any unexpected policy violations.

### Step 7: Switch the pilot to ACP-only mode

When the pilot scope no longer depends on data policies, switch it to ACP-only mode. A scope still depends on data policies if it relies on them for any of the following capabilities:

- Custom connectors or HTTP connectors.
- Connector endpoint filtering.
- Copilot Studio or desktop flow virtual connectors that don't have a dedicated setting.
- Data groups that keep data from moving between specific connectors.

To switch, turn on **Advanced connector policies only** for the scope, as described in [Enable ACP-only mode](#enable-acp-only-mode). Then repeat the smoke tests from step 6.

To roll back, turn off **Advanced connector policies only**. Your data policies weren't deleted, so they're evaluated again for the scope.

### Step 8: Expand the rollout

Repeat steps 4 through 7 for more environments in waves. Add environments to a migrated environment group, or migrate more environment groups and single environments. Validate each wave before you start the next one.

### Step 9: Retire your data policies

Keep each data policy until every environment that it applies to runs in ACP-only mode. Then remove those environments from the policy's scope, or delete the policy if it no longer applies to any environment.

A data policy that applies to all environments also applies to new environments. Keep it until you have a way to govern new environments with ACP, such as environment routing to an environment group that runs in ACP-only mode.

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
- **Managed environments and nonblockable connectors**: In single environment mode, ACP works on both managed environments and non-managed environments so that all customers using classic data policies can migrate to ACP without extra cost. However, on non-managed environments, the nonblockable connectors remain nonblockable. On managed environments (single or environment group), you can block any connector or any action, including those that are nonblockable in classic data policies.
- **Allowed connector count**: The **Allowed (n)** summary can be greater than the number of connectors displayed in the allow list. The summary counts every connector resource ID stored in the policy, but the allow list displays only IDs that resolve to connectors in the current certified connector catalog. A retired connector or an invalid connector ID added programmatically can cause this difference. To reconcile the count, use the [Power Platform API](/rest/api/power-platform/governance/rule-based-policies) to retrieve the policy, remove entries from `ConnectorManagement.inputs.AllowedConnectorList` that don't resolve to a current certified connector, and update the policy.
