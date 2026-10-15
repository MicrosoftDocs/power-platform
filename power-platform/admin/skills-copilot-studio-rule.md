---
title: Configure skills in the Power Platform admin center
description: Learn how to manage the Skills in Copilot Studio setting to govern the use of skills at the environment and environment group level.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 10/14/2026
author: laneswenka
ms.author: laswenka
ms.contributors:
  - mkaur
  - ronimilner
ms.reviewer: ellenwehrle
ms.subservice: admin
ms.custom: NewPPAC
ai-usage: ai-assisted
search.audienceType:
  - admin
---

# Configure skills in the Power Platform admin center

You can choose which types of skills agents in Microsoft Copilot Studio can reference. The **Skills in Copilot Studio** setting in the Power Platform admin center enhances observability and governance by replacing legacy data loss prevention (DLP) virtual connectors with modern, environment-level, and environment group-level capabilities.

By using the **Skills in Copilot Studio** setting, admins can:

- Apply rules at the environment and environment group level to manage the use of skills in Copilot Studio.
- Enable or disable the relevant skills control section for users to configure.

> [!NOTE]
> This rule replaces the legacy Copilot Studio virtual connectors used in classic [data policies](wp-data-loss-prevention.md#virtual-connectors) to govern skills. [Advanced connector policies](advanced-connector-policies.md) (ACP) don't support this rule. For more information about this transition, see [Virtual connector transition](advanced-connector-policies.md#virtual-connector-transition).

## Manage skills in Copilot Studio for an environment group

> [!NOTE]
> You can configure the **Skills in Copilot Studio** rule for an environment group from both the **Manage** > **Environment groups** section and the **Security** > **Data and privacy** section.

To manage the **Skills in Copilot Studio** rule for an environment group, complete the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environment groups**.
1. Select the environment group where you want to apply the rule.
1. On the environment group's page, select the **Rules** tab.
1. Select **Skills in Copilot Studio**.
1. Enable or disable the skills control sections that you want users to be able to configure.
1. Select **Save**.
1. After you update all rules to your requirements, select **Publish rules** in the command bar.

## Manage skills in Copilot Studio for a single environment

To manage the **Skills in Copilot Studio** rule for a single environment, complete the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Security**.
1. In the **Security** pane, select **Data and privacy**.
1. Select **Skills in Copilot Studio**.
1. Switch to the **Environments** tab.
1. Enable or disable the skills control sections that you want users to be able to configure.
1. Select **Save**.

## Related content

- [Rules for environment groups](environment-groups-rules.md)
- [Data policies](wp-data-loss-prevention.md)
- [Advanced connector policies](advanced-connector-policies.md)
- [Configure data policies for agents](/microsoft-copilot-studio/admin-data-loss-prevention)
