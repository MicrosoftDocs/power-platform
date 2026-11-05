---
title: Personal environments
description: Learn how personal environments give each maker a governed space to build apps, agents, and flows, and how admins manage them with environment routing and environment groups.
author: sidhartg
ms.author: sidhartg
ms.reviewer: ellenwehrle
ms.component: pa-admin
ms.topic: overview
ms.subservice: admin
ms.date: 11/04/2026
ai-usage: ai-assisted
search.audienceType:
  - admin
  - maker
#customer intent: As a Power Platform admin, I want to understand how personal environments work so that I can give makers their own workspaces and govern them through environment groups.
---

# What is a personal environment?

A personal environment is a Power Platform environment for one maker to build and test apps, agents, and flows. It keeps their work separate from other makers' work. Environment routing takes makers to their personal environment and creates it on their first visit, so they don't need to request an environment or choose where to build.

Like OneDrive for files, a personal environment keeps work private until the maker shares it. Apps, agents, and flows can connect to data and act on it, so each personal environment is a managed environment in an environment group. As an admin, you govern these workspaces through the group's rules.

> [!NOTE]
> Personal environments were previously called *personal developer environments*. Some articles and parts of the Power Platform admin center might still use the earlier name.

## Benefits for makers and admins

Makers get their own workspaces, and admins manage them through shared policies.

For makers:

- **Start building right away.** The personal environment is ready the first time a maker opens a supported product. There's nothing to request and no environment to choose.
- **Keep work in progress private.** Other makers can't access a maker's apps or data unless the maker shares them.
- **Come back to the same place.** Makers return to the same personal environment every time.

For admins:

- **Keep the default environment clean.** New work starts in personal environments instead of the default environment that everyone in the tenant shares.
- **Govern at scale.** Rules that you set on an environment group apply to every personal environment in the group, and makers can't override them.
- **Match policies to each audience.** Routing rules based on security groups place different makers in different environment groups, each with its own rules.
- **Get managed environment capabilities by default.** Every personal environment is a managed environment, so capabilities such as sharing limits, usage insights, and solution checker are available.

## How personal environments work

Three Power Platform capabilities create and govern personal environments.

| Capability | What it does |
|---|---|
| [Environment routing](default-environment-routing.md) | Decides which makers get a personal environment and which environment group it joins. |
| [Environment groups](environment-groups.md) | Organize personal environments and apply rules to all of them at once. |
| [Managed environments](managed-environment-overview.md) | Provide the governance capabilities, such as sharing limits and usage insights, that environment group rules control. |

### Personal environment assignment

A maker gets a personal environment through the following sequence:

1. A maker opens Power Apps, Power Automate, Power Automate for desktop, or Microsoft Copilot Studio, or builds an app with Microsoft Copilot Managed Runtime (preview).
2. Environment routing checks your routing rules in priority order and applies the first rule that matches the maker. Each rule targets **Everyone** or specific Microsoft Entra security groups and names an environment group.
3. If the maker already owns a developer environment, routing takes them there. Otherwise, Power Platform creates a personal environment for them as a managed environment in the environment group that the rule names.
4. The personal environment follows the rules of its environment group. The maker is assigned the admin role in the environment and can start building.

When a maker opens a product and no rule matches, or routing isn't turned on for that product, the maker goes to the default environment. The maker also goes to the default environment if their personal environment can't be created. Makers can always switch to other environments where they have access.

### Example: Route makers by security group

Contoso wants its professional developers to have more flexibility than other makers. As a Power Platform admin at Contoso, you can apply different policies to these groups:

1. Create two environment groups, *Pro developer workspaces* and *Maker workspaces*, and apply stricter sharing and connector rules to *Maker workspaces*.
2. Create a routing rule that sends members of the *Pro Developers* security group to *Pro developer workspaces*.
3. Create a second rule, last in priority, that sends **Everyone** to *Maker workspaces*.

When a member of *Pro Developers* opens Power Apps for the first time, Power Platform creates their personal environment in *Pro developer workspaces*, and that group's rules apply to it. Every other maker gets a personal environment in *Maker workspaces*.

## Personal environments for Copilot Managed Runtime apps (preview)

Environment routing for [Microsoft Copilot Managed Runtime](/microsoft-365/managed-apps/) is on in every tenant, and you can't turn it off. When a maker builds an app with Copilot Managed Runtime, such as in Copilot Cowork, Copilot Studio, or the Copilot Managed Runtime command-line interface (CLI), the app is created in the maker's personal environment.

- If your tenant has no routing rules, Power Platform creates a rule that routes **Everyone** to their own personal environment. It also creates a default environment group and applies rules for Copilot Managed Runtime to it. You can review and adjust those rules in the Microsoft 365 admin center or Power Platform admin center.
- If your tenant already has routing rules, they aren't changed, and only makers who match one of them can build Copilot Managed Runtime apps. To include other makers, add an **Everyone** rule or add the makers to a security group that a rule targets.
- Routing for Copilot Managed Runtime applies only to Copilot Managed Runtime apps. Makers who build agents in Copilot Studio, or apps and flows in Power Apps and Power Automate, aren't routed unless you turn on routing for those products.
- Personal environments created for Copilot Managed Runtime apps start without Dataverse.

Learn more in [Environment routing for Copilot Managed Runtime](default-environment-routing-copilot-managed-runtime.md).

## Personal environment attributes

Use these attributes to understand how personal environments fit into your tenant.

| Attribute | Details |
|---|---|
| Owner | One maker, who is assigned the admin role. In environments that have Dataverse, that's the System Administrator security role. |
| Environment type | Developer |
| Managed environment | Yes |
| Environment group | The group named by the routing rule that matched the maker when the environment was created. |
| Dataverse | Added automatically when the maker is routed from Power Apps, Power Automate, or Copilot Studio. Personal environments created for Copilot Managed Runtime apps start without Dataverse, and makers or admins can add it manually from the Power Platform admin center. |
| Region | Your tenant's home geography. |
| Policies | Your tenant-level data policies, plus the rules of the environment group. |
| Dataverse capacity | Doesn't count against your tenant's Dataverse capacity. |
| Personal environments per maker | One. Routing takes the maker to the same personal environment on every visit. |

## Governance with environment groups

Govern personal environments through the rules on their environment group, not one environment at a time. When you publish a rule on a group, Power Platform enforces and locks the setting in every environment in the group. The maker can't change it, even as the environment's admin.

Common rules for personal environments include sharing controls for canvas apps, solution-aware cloud flows, and agents; advanced connector policies; solution checker enforcement; usage insights; and maker welcome content. For the full list of available rules, see [Rules for environment groups](environment-groups-rules.md).

> [!TIP]
> Keep personal environments in environment groups of their own, separate from shared development, test, and production environments. Their rules can treat each environment as an individual workspace.

### Move a personal environment to another group

Routing never moves a personal environment from one environment group to another. The environment stays in its group when:

- The maker joins or leaves a security group, and a different routing rule now matches them.
- You change the environment group that a routing rule targets.

To move a personal environment, remove it from its current group and add it to the new group. Review the new group's rules before you move it. The environment takes on those rules, which can change how its apps, agents, and flows behave. For example, a stricter connector policy can stop a flow that uses a connector the new group blocks.

> [!IMPORTANT]
> An environment that you remove from a group keeps the settings the group applied, but they're no longer locked. Because the maker is the admin of their personal environment, they can change those settings until you add the environment to another group.

> [!TIP]
> Use [Power Platform Admin in Cowork (preview)](power-platform-admin-cowork.md) to analyze the resources in a personal environment and see how moving the environment to a different environment group would affect them.

### Control who gets a personal environment

- **Power Apps, Power Automate, and Copilot Studio**: Turn on environment routing for the products you choose, and target routing rules to **Everyone** or to specific security groups.
- **Copilot Managed Runtime apps**: Routing is always on. To control who can build these apps, use the app creation settings in the Microsoft 365 admin center.

The **Developer environment assignments** tenant setting doesn't control personal environments. It applies only to developer environments that people create manually. Learn more in [Control environment creation](control-environment-creation.md).

### Set up personal environments

Admins typically set up personal environments in three stages:

1. Create an environment group for personal environments, and add the rules that every personal environment in it should follow. Learn more in [Environment groups](environment-groups.md).
2. Turn on environment routing for the products you want, and create routing rules that send makers to your group. Learn more in [Environment routing](default-environment-routing.md).
3. Welcome your makers. Use the maker welcome content rule to explain what personal environments are for and where to move work that others rely on.

## Intended use and shared environments

Use personal environments for building and testing, and for running apps, flows, and agents that aren't mission-critical and serve a small audience, such as your team. When a larger group of people starts to rely on an app, flow, or agent, move it to a shared environment that your organization owns and supports. For solution-aware work, add it to a solution, and then deploy the solution by using [pipelines in Power Platform](../alm/pipelines.md) or export and import it.

## Lifecycle

Personal environments that have Dataverse follow the inactivity-based cleanup schedule for developer environments. You can't turn off this cleanup.

| Time without activity | What happens |
|---|---|
| 53 days | Power Platform sends a warning email, and a countdown appears in the Power Platform admin center. |
| 57 days | Power Platform sends a second warning email. |
| 60 days | Power Platform disables the environment. |
| 7 and 11 days after Power Platform disables the environment | Power Platform sends warnings that it will delete the environment. |
| 15 days after Power Platform disables the environment | Power Platform deletes the environment. Admins can recover it for seven days. |

The environment's admins, tenant admins, and the person who created it receive the notifications. Automated activity, such as a scheduled flow run, counts as activity. To keep an environment, an admin can trigger activity in it before it's disabled, or re-enable it before it's deleted. Learn more in [Automatic deletion of Power Platform environments](automatic-environment-cleanup.md#developer-environments).

> [!IMPORTANT]
> Personal environments without Dataverse aren't deleted for inactivity. Tenant admins can delete them manually when they're no longer needed or when their owner leaves the organization.

## Frequently asked questions

Find answers to common questions about personal environments, including setup, governance, licensing, and lifecycle.

### General

Learn how personal environments differ from shared environments and which products support environment routing.

#### What is a personal environment?

A personal environment is a developer environment that one maker owns and uses to build apps, agents, and flows. Environment routing takes makers to their own workspace instead of a shared environment, such as the default environment. If the maker already has a personal environment, routing reuses it.

#### How is a personal environment different from the default environment?

Everyone in your tenant can build in the default environment. It holds work from many makers, and one set of policies has to fit all of them. A personal environment belongs to one maker. Other makers can't access its apps or data unless the maker shares them, and its policies come from the environment group that it belongs to.

#### Which products route makers to personal environments?

Environment routing works with Copilot Managed Runtime apps (preview), Power Apps, Power Automate (cloud and desktop flows), and Copilot Studio. Routing for Copilot Managed Runtime is always on. For the other products, you turn it on. Environment routing isn't available for Power Pages.

#### How many personal environments can a maker have?

One. Routing always takes a maker to the same personal environment. Starting November 15, 2026, each user can create only one managed developer environment. Existing managed developer environments aren't changed, even if a user already has more than one. If a maker owns more than one developer environment, routing takes them to the oldest one.

#### In which region are personal environments created?

By default, personal environments are created in your tenant's home geography.

#### Can makers build in a different environment?

Yes. In Power Apps, Power Automate, and Copilot Studio, makers can switch to the default environment or any other environment where they have maker permissions. For Copilot Managed Runtime apps, makers can currently choose a different environment only in the CLI, by using the `--environment-id` parameter when they run `ms app create`. Learn more in [Copilot Managed Runtime CLI command reference](/microsoft-365/managed-apps/developer/ms-cli-command-reference).

### Creation and provisioning

Learn when Power Platform creates personal environments and how to control who gets one.

#### Why did Power Platform create personal environments in my tenant even though I didn't turn on environment routing?

Power Platform turns on environment routing for Copilot Managed Runtime automatically in all tenants, and you can't turn it off. Power Platform creates a personal environment the first time a maker builds an app with Copilot Managed Runtime. If your tenant has no routing rules, the service also creates a rule that routes **Everyone** to their own personal environment, and a default environment group with rules for Copilot Managed Runtime. If your tenant already has routing rules, the service doesn't change them. Learn more in [Personal environments for Copilot Managed Runtime apps](#personal-environments-for-copilot-managed-runtime-apps-preview).

#### Where was this behavior announced?

Microsoft announced this behavior in Microsoft 365 Message center post MC1469329, published on September 9, 2026, and updated on October 13, 2026, when the rollout to Copilot Studio began. The post explains that app building is on by default for eligible makers, and that makers are routed to their own personal environment, including in tenants that didn't turn on environment routing.

#### Does environment routing also apply to makers who use Power Apps, Power Automate, or Copilot Studio agents?

Not unless you turn on routing for those products. When Copilot Managed Runtime is the only product turned on for routing, makers who use Power Apps, Power Automate, or Copilot Studio agents aren't routed to personal environments. They can continue to build in the default environment or in any environment where they have maker permissions.

#### Can I prevent personal environments from being created, or limit them to selected users?

Yes, by controlling who builds in each product:

- **Copilot Managed Runtime apps**: Power Platform creates a personal environment only when a maker builds an app, so control who can build apps. In the Microsoft 365 admin center, go to **Apps** > **Overview** > **Set up app creation spaces**. You can turn off app creation in Copilot Studio or limit it to selected security groups. App building in Copilot Cowork is governed through Frontier onboarding and Cowork access, and app creation with the CLI is off by default. These settings don't delete existing personal environments or turn off routing for Copilot Managed Runtime. Learn more in [Copilot Managed Runtime overview and key concepts for admins](/microsoft-365/admin/manage/apps/).
- **Power Apps, Power Automate, and Copilot Studio agents**: Makers are routed only when you turn on environment routing for the product and a routing rule matches them.

#### Why do makers get a personal environment when the **Developer environment assignments** setting is set to admins only?

The **Developer environment assignments** setting controls only the developer environments that users create themselves from the Power Platform admin center or the API. It doesn't apply to environments that environment routing creates. To control who gets a personal environment, use routing rules with security groups and, for Copilot Managed Runtime apps, the app creation controls in the Microsoft 365 admin center.

#### What happens if no routing rule matches a maker?

It depends on the product. Makers who open Power Apps, Power Automate, or Copilot Studio go to the default environment. For Copilot Managed Runtime apps, a maker who doesn't match any rule can't get a personal environment or create an app. The app creation experience reports that the environment couldn't be created. This condition can happen in tenants that had routing rules before Copilot Managed Runtime and don't have an **Everyone** rule. To resolve it, add the maker to a security group that a routing rule targets, update a rule to include one of the maker's groups, or add an **Everyone** rule.

#### Can I delete the **Everyone** routing rule or change its priority?

You can't delete the routing rule that routes **Everyone** to an environment group. After Copilot Managed Runtime governance initializes in your tenant, you can't modify it either. Governance initializes when the first app is created, or earlier if an admin opens the app governance experience in the Microsoft 365 admin center. The **Everyone** rule must be last in priority. If it's above a security group rule, adjust the priority before you make other changes. New routing rules must have an environment group.

#### If a maker creates a developer environment manually, is it governed the same way?

No. Environment routing creates each personal environment as a managed environment in the routing rule's environment group, so the group's rules apply from the start. Developer environments that makers create themselves from the Power Platform admin center aren't added to an environment group automatically, so group rules don't apply to them unless an admin adds them to a group.

#### Does routing move a personal environment to a different environment group?

No. A personal environment that's in an environment group stays there, even if a different routing rule matches the maker later. If the maker's developer environment isn't in any group, routing adds it to the group that matches the maker's routing rule. To move a personal environment yourself, see [Move a personal environment to another group](#move-a-personal-environment-to-another-group).

#### What happens to apps, flows, and agents that are already in the default environment?

They stay where they are. Turning on environment routing doesn't move existing work, and makers can still open it by switching environments.

### Governance and security

Learn how environment group rules, admin roles, and sharing controls apply to personal environments.

#### Are personal environments managed environments?

Yes. Personal environments that environment routing creates, including those created for Copilot Managed Runtime apps, are always managed environments.

#### Which policies apply to apps in a personal environment?

Set policies once for the environment group instead of for each environment. Each personal environment inherits the group's policies, including advanced connector policies and app sharing rules. Your tenant-level data policies also apply.

For Copilot Managed Runtime apps, review and adjust the group's connector and Model Context Protocol (MCP) server, sharing, and content security policy rules in the Microsoft 365 admin center under **Apps** > **Settings** > **Environment groups**. Learn more in [Review default governance settings for apps](/microsoft-365/admin/manage/apps/governance).

#### What role does the maker have in their personal environment?

The maker is the admin of their personal environment, with the System Administrator security role in environments that have Dataverse. As admin, the maker can configure the environment's settings, except settings that an environment group rule governs. Those settings are locked.

#### Can apps built in a personal environment be shared with other people?

Yes, within the sharing rules of the environment group. These rules apply to every app in the group and control whether makers can share with everyone in the organization or with guests. For Copilot Managed Runtime apps, sharing gives people access to the app, not to its underlying data. Recipients still need the appropriate permissions and connections for the app's data sources.

#### How do I find personal environments and the apps in them?

- **Personal environments**: In the Power Platform admin center, select **Manage** > **Environments**, and filter the list where **Type** is **Developer**. To see the personal environments in one group, select **Manage** > **Environment groups**, and then select the group.
- **Copilot Managed Runtime apps**: In the Microsoft 365 admin center, **Apps** > **All apps** lists every app and its owner. To see which environment hosts an app, go to **Manage** > **Inventory** in the Power Platform admin center, set **Item type** to **Managed app**, and add the **Environment**, **Environment ID**, **Environment Group**, and **Environment Group ID** columns.

### Licensing and cost

Review licensing requirements and how personal environments use Dataverse capacity.

#### Do makers need a premium license to use a personal environment?

The personal environment itself doesn't require a license. What makers and users need depends on what they build and run:

- **Copilot Managed Runtime apps**: Makers who use their personal environment only to build Copilot Managed Runtime apps don't need a premium Power Platform license. Building apps consumes Copilot Credits, and running them requires Copilot Credits or a Power Apps Premium license. Learn more in [Licensing and billing](/microsoft-365/admin/manage/apps/#licensing-and-billing).
- **Apps and flows built in Power Apps and Power Automate**: Makers don't need a premium license to create or preview apps and flows. Because personal environments are managed environments, makers and users need a premium license to run them. The Power Apps Developer Plan doesn't include use rights for managed environments. Starting February 2027, users who don't have an appropriate license can't open apps in managed environments. Learn more in [Licensing requirements for managed environments](managed-environment-licensing.md).

#### Can makers add Dataverse to their personal environment?

Yes. Personal environments created for Copilot Managed Runtime apps don't include Dataverse at first. Dataverse is added automatically when the maker is routed to their personal environment from Power Apps, Power Automate, or Copilot Studio. Makers and admins can also add Dataverse manually from the Power Platform admin center.

#### Does a personal environment use my tenant's Dataverse capacity?

No. Developer environments, including personal environments, don't count against your tenant's Dataverse capacity.

### Lifecycle and operations

Learn how inactivity, maker departures, and environment deletion affect personal environments.

#### Are inactive personal environments cleaned up automatically?

Yes, if they have Dataverse. After 60 days without activity, a personal environment that has Dataverse is disabled. If no one re-enables it within 15 days, it's deleted, and admins have seven days to recover it. Personal environments without Dataverse aren't deleted for inactivity. Learn more in [Lifecycle](#lifecycle).

#### What happens to apps when a maker leaves or their personal environment is deleted?

Apps in a personal environment are removed when the environment is deleted. When a maker leaves your organization, their personal environment isn't deleted or reassigned automatically. If it has Dataverse, it continues to follow the inactivity-based cleanup schedule, and a scheduled flow that keeps running counts as activity. If the environment's admins are no longer in your tenant, a tenant admin can delete the environment manually. To keep apps that others rely on, a Power Platform admin can add another person as an admin of the environment.

#### How does the deprecation of unmanaged developer environments affect personal environments?

It doesn't. Personal environments are managed environments, so they aren't affected. Unmanaged developer environments are suspended starting December 15, 2026, and deleted starting January 15, 2027. To give makers a personal space to build and test, turn on environment routing. Learn more in [Deprecation of unmanaged developer environments and the Power Apps Developer Plan](../important-changes-coming.md#deprecation-of-unmanaged-developer-environments-and-the-power-apps-developer-plan).

## Related content

- [Environment routing](default-environment-routing.md).
- [Environment routing for Copilot Managed Runtime](default-environment-routing-copilot-managed-runtime.md).
- [Environment groups](environment-groups.md).
- [Rules for environment groups](environment-groups-rules.md).
- [Managed environments overview](managed-environment-overview.md).
- [Automatic deletion of Power Platform environments](automatic-environment-cleanup.md).
- [What is Microsoft Copilot Managed Runtime (preview)](/microsoft-365/managed-apps/).
- [FAQ about Microsoft Copilot Managed Runtime (preview)](/microsoft-365/admin/manage/apps/faq-about-apps).
- [Review default governance settings for apps (preview)](/microsoft-365/admin/manage/apps/governance).
