---
title: Advanced connector policies (preview)
description: Learn how to use Advanced connector policies to govern connector usage in Power Platform.
ms.component: pa-admin
ms.topic: conceptual
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
Advanced connector policies (ACP) represent the next generation of securing connector usage within the Power Platform. This feature provides a modern and flexible approach to managing all [certified connectors](/power-platform/admin/dlp-connector-classification), aligning with the broader governance strategy of per-environment security controls paired with [environment group support](power-platform/admin/environment-groups).

By adopting advanced connector policies, administrators gain greater control and granularity in securing and managing connector usage while enhancing the overall governance of their Power Platform environments.

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Known limitations

While advanced connector policies (ACP) offer robust capabilities, there are a few limitations to consider:

- **Environment group dependencies**: Per-environment support isn't yet available. When it becomes available, we'll update this article.
- **Endpoint filtering**: Endpoint filtering will be replaced by a broader connection parameter filtering capability of which isn't yet available.
- **Managed Environments**: This feature requires Managed Environments to be enabled.  In the future, you'll be able to use it on non-Managed Environments provided that you're not limiting the non-blockable connectors.  

## Configure an advanced connector policy

To configure an advanced connector policy, complete the following steps.

## [New admin center](#tab/new)
1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environment groups**.
1. In the **Environment groups** page, select the environment group where the policy will be applied.
1. The environment group's page is displayed. Select the **Rules** tab.
1. Selecct **Advanced connector policies (preview)**. The **Advanced connector policies (preview)** pane is displayed.
1. Define the policy. Keep the following points in mind:
   - By default, the non-blockable connectors are pre-loaded as _allowed_.
   - To add new connectors, select **Add connectors** to choose from all certified connectors.
   - To remove connectors, select them and then select **Remove connector**.  You can remove any connector to block it.
1. When all connectors are set as you require, select **Save**.
1. The envrioment group's page is redisplayed. After all rules are updated to your requirements, select **Publish rules** in the command bar.

During publishing, an environment lifecycle operation will be performed on every environment that is part of the group, or the individual environment depending on where you are configuring the policy.  This operation will be available in environment history as *Update Managed Environment Settings* and will be what cascades the new connector policy to the design time and runtime infrastructure.

### More visibility and control

Previously, in Data Policies (DLP) customers could not see Triggers, Internal Actions, or if an action is Deprecated.  We have now added these tags across all certified connectors so that administrators can quickly decide to block specific triggers from use or turning off actions which are deprecated and no longer supported by the connector publisher.

<img src="media/advanced-connector-policies-2.png" width="600px" />

### Easier management experience

We have taken feedback from customers and drastically simplified the management experience by making the policy a strict allow list.  When configured, all new connectors are blocked.  If you configure the allowed actions on a given connector, then no new actions, triggers, or internal actions will be allowed.  The concept of the Business and Non-Business categories in Data Policies (DLP) is not brought forward as it was not deemed effective in policy management.  

### Proactive policy management

Advanced connector policies has shipped as part of environment groups and rules.  These have publicly documented APIs available on [Power Platform API](/rest/api/power-platform/environmentmanagement/environment-groups) so that you can build automated scenarios such as creating new policies, updating policies, and moving environments in to groups for management at scale. 

## Data Policy (DLP) Mixed Mode

Advanced connector policies (ACP) can be used in mixed mode with classic Data Policies (DLP).  This allows for complimenting configurations to be made such that DLP can achieve action control and endpoint filtering until such time as those features are native to ACP.  In addition, you can use ACP to block any connector which is not possible in classic DLP.  

At runtime, when a connector operation is invoked, it will query the effective policy for the current hosting environment.  This will include a combined policy that merges the most restrictive settings from both classic DLP and ACP to provide full enforcement.

In the future, a separate rule will become available to allow you to skip Data Policy (DLP) evaluation in favor of only relying upon Connector Policy.  

## Provide Feedback

Trying out the new Advanced connector policies?  We would love your feedback!  Please join our Viva Engage network for keeping the conversation going under non-disclosure agreement (NDA):
[Public Preview - Advanced Connector Policies](https://www.yammer.com/dynamicsaxfeedbackprograms/#/threads/inGroup?type=in_group&feedId=215134347264&view=all).
