---
title: Advanced connector policies (preview)
description: Learn how to use Advanced connector policies to govern connector usage in Power Platform.
ms.component: pa-admin
ms.topic: conceptual
ms.date: 01/28/2025
author: laneswenka
ms.author: laswenka
ms.reviewer: sericks
contributors:
  - laneswenka
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType: 
  - admin
---

# Advanced connector policies (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

## Overview
Advanced Connector Policies (ACP) represent the next generation of securing connector usage within the Power Platform. This feature provides a modern and flexible approach to managing all [Certified Connectors](https://learn.microsoft.com/power-platform/admin/dlp-connector-classification), aligning with the broader governance strategy of per-environment security controls paired with [environment group support](https://learn.microsoft.com/power-platform/admin/environment-groups).

By adopting Advanced Connector Policies, administrators gain greater control and granularity in securing and managing connector usage while enhancing the overall governance of their Power Platform environments.

## Known limitations

While Advanced Connector Policies (ACP) offer robust capabilities, there are a few limitations to consider:

2. **Environment Group Dependencies**: Per-environment support is not yet available.
3. **Action Control**: Ability to block connector actions is not yet available.
4. **Endpoint filtering**: Endpoint filtering will be replaced by a broader Connection Parameter Filtering capability of which is not yet available.
5. **Limited geographies**: ACP are currently only supported in United Arab Emirates (UAE), South Africa, and Norway environment geos.  More geos will be enabled out over time.

## Configure a Policy

To configure an Advanced Connector Policy, follow these steps:

1. **Access the Admin Center**: Navigate to the Power Platform Admin Center and select the environment group where the policy will be applied.
2. **Select the Rules tab**: Under the Rules tab, choose **Advanced Connector Policies (Preview)**.
<br/>
<img src="media/advanced-connector-policies-1.png" width="300px" />
3. **Define the policy**:
   - By default, the nonblockable connectors are pre-loaded as Allowed.
   - Add new connectors by clicking the **Add connectors** button to choose from all Certified Connectors.
   - Remove connectors by clicking the **Remove connectors** button.  You can remove any connector and it will be blocked.
4. **Save the Policy**:
   - When all connectors are set as you require, click the **Save** button.
5. **Publish**: After all rules are updated to your requirements, click the Publish button.

During publishing, an environment lifecycle operation will be performed on every environment that is part of the group, or the individual environment depending on where you are configuring the policy.  This operation will be available in environment history as *Update Managed Environment Settings* and will be what cascades the new connector policy to the design time and runtime infrastructure.

## Data Policy (DLP) Mixed Mode

Advanced connector policies (ACP) can be used in mixed mode with classic Data Policies (DLP).  This allows for complimenting configurations to be made such that DLP can achieve action control and endpoint filtering until such time as those features are native to ACP.  In addition, you can use ACP to block any connector which is not possible in classic DLP.  

At runtime, when a connector operation is invoked, it will query the effective policy for the current hosting environment.  This will include a combined policy that merges the most restrictive settings from both classic DLP and ACP to provide full enforcement.

## Provide Feedback

Trying out the new Advanced connector policies?  We would love your feedback!  Please join our private Viva Engage network for keeping the conversation going under non-disclosure agreement (NDA):
[Private Preview - Advanced Connector Policies](https://www.yammer.com/dynamicsaxfeedbackprograms/#/threads/inGroup?type=in_group&feedId=215134347264&view=all).
