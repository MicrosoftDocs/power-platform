---
title: Advanced connector policies (preview)
description: Learn how to use Advanced connector policies to govern connector usage in Power Platform.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 04/15/2025
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
Advanced connector policies (ACP) represent the next generation of securing connector usage within the Power Platform. This feature provides a modern and flexible approach to managing all [certified connectors](/power-platform/admin/dlp-connector-classification), aligning with the broader governance strategy of per-environment security controls paired with [environment group support](../admin/environment-groups.md).

By adopting advanced connector policies, administrators gain greater control and granularity in securing and managing connector usage while enhancing the overall governance of their Power Platform environments.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Known limitations

While advanced connector policies (ACP) offer robust capabilities, there are a few limitations to consider:

- **Environment group dependencies**: Per-environment support isn't yet available. When it becomes available, we'll update this article.
- **Endpoint filtering**: Endpoint filtering will be replaced by a broader connection parameter filtering capability of which isn't yet available.
- **Managed Environments**: This feature requires Managed Environments to be enabled. In the future, you'll be able to use it on non-Managed Environments if you're not limiting the nonblockable connectors.  

## Configure an advanced connector policy

To configure an advanced connector policy, complete the following steps.

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environment groups**.
1. In the **Environment groups** page, select the environment group where you want the policy applied.
1. The environment group's page is displayed. Select the **Rules** tab.
1. Select **Advanced connector policies (preview)**. The **Advanced connector policies (preview)** pane is displayed.
1. Define the policy. Keep the following points in mind:
   - By default, the nonblockable connectors are preloaded as _allowed_.
   - To add new connectors, select **Add connectors** to choose from all certified connectors.
   - To remove connectors, select them and then select **Remove connector**. You can remove any connector to block it.
1. When all connectors are set as you require, select **Save**.
1. The environment group's page is redisplayed. After all rules are updated to your requirements, select **Publish rules** in the command bar.

## [Classic admin center](#tab/classic)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Environment groups**.
1. In the **Environment groups** page, select the environment group where you want the policy applied.
1. The environment group's page is displayed. Select the **Rules** tab.
1. Select **Advanced connector policies (preview)**. The **Advanced connector policies (preview)** pane is displayed.
1. Define the policy. Keep the following points in mind:
   - By default, the nonblockable connectors are preloaded as _allowed_.
   - To add new connectors, select **Add connectors** to choose from all certified connectors.
   - To remove connectors, select them and then select **Remove connector**. You can remove any connector to block it.
1. When all connectors are set as you require, select **Save**.
1. The environment group's page is redisplayed. After all rules are updated to your requirements, select **Publish rules** in the command bar.
---

During publishing, an environment lifecycle operation is performed on every environment that's part of the group, or the individual environment depending on where you're configuring the policy. This operation is available in environment history as *Update Managed Environment Settings* and cascades the new connector policy to the design time and runtime infrastructure.

### More visibility and control

In [data policies](managed-environment-data-policies.md) customers couldn't see triggers, internal actions, or if an action is deprecated.  We have added these tags across all certified connectors so that administrators can quickly decide to block specific triggers from use or turn off actions which are deprecated and no longer supported by the connector publisher.

:::image type="content" source="media/advanced-connector-policies-2.png" alt-text="Admins can quickly decide to block specific triggers from use or turn off actions which are deprecated and no longer supported." lightbox="media/advanced-connector-policies-2.png":::

### Easier management experience

Based on customer feedback, we drastically simplified the management experience by making the policy a strict allowlist. When configured, all new connectors are blocked. If you configure the allowed actions on a given connector, then no new actions, triggers, or internal actions are allowed. The concept of the business and nonbusiness categories in data policies haven't been brought forward, as it wasn't deemed effective in policy management.  

### Proactive policy management

Advanced connector policies have shipped as part of environment groups and rules. These have publicly documented APIs available on [Power Platform API](/rest/api/power-platform/environmentmanagement/environment-groups) so that you can build automated scenarios such as creating new policies, updating policies, and moving environments in to groups for management at scale. 

## Data policy mixed mode

Advanced connector policies (ACP) can be used in mixed mode with classic data policies. This allows for complimenting configurations to be made such that data policies can achieve action control and endpoint filtering until such time as those features are native to ACP.  In addition, you can use ACP to block any connector which isn't possible in classic data policies.  

At runtime, when a connector operation is invoked, it queries the effective policy for the current hosting environment. This includes a combined policy that merges the most restrictive settings from both classic data policies and ACP to provide full enforcement.

In the future, a separate rule will become available to allow you to skip data policy evaluation in favor of only relying upon connector policy.  

## Provide feedback

Trying out the new advanced connector policies? We would love your feedback! Join our Viva Engage network for keeping the conversation going under non-disclosure agreement:
[Public Preview - Advanced Connector Policies](https://www.yammer.com/dynamicsaxfeedbackprograms/#/threads/inGroup?type=in_group&feedId=215134347264&view=all).
