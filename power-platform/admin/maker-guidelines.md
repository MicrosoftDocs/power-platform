---
title: Configure maker guidelines for Copilot Studio (preview)
description: Learn how to configure organization-specific guidance for Copilot Studio makers in managed environments.
ms.component: pa-admin
ms.topic: how-to
ms.date: 09/28/2026
author: mikferland-msft
ms.author: miferlan
ms.reviewer: ellenwehrle
ms.subservice: admin
ms.custom: "admin-security"
search.audienceType:
  - admin
contributors:
  - mikferland-msft
ai-usage: ai-assisted
---

# Configure maker guidelines for Copilot Studio (preview)

[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner.md)]

Maker guidelines let Power Platform administrators share organization-specific guidance with Copilot Studio makers while they build. Use the message to explain what is available in an environment and direct makers to internal guidance, request processes, or support.

The guidance appears in the Copilot Studio **Review** pane. [Maker welcome content](welcome-content.md) sets expectations when makers first enter the product. Maker guidelines keeps that guidance close at hand while they work.

## Prerequisites

Maker guidelines is available only for managed environments.

## Configure maker guidelines

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage** > **Environment groups**.
1. Select an environment group, and then select the **Rules** tab.
1. If **Maker guidelines** isn't listed, select **Add rules**, find **Maker guidelines**, and add it to the group.
1. Open **Maker guidelines**.
1. Under **Where to show the message**, select **Maker selects Review**.
1. Enter a plain-text message of up to 400 characters. Tell makers what they should know about building in the environment and where they can go for help.
1. Optionally, add:
   - A **Button label** of up to 50 characters.
   - An HTTPS **Button link** to guidance or a request process.
   - A **Contact email** that makers can use for help.
1. Select **Save**, and then select **Publish rules**.

## What makers see

When a maker selects **Review** for an agent in Copilot Studio, the pane shows the agent's blockers and warnings together with **A message from your admin**. The maker can use the configured link or email without leaving the Review experience.

Maker guidelines remain available when the agent has no blockers or warnings, giving makers a consistent place to find organizational expectations and help.

## Known limitations

You can configure maker guidelines only for environment groups. You can't configure it for an individual environment.

## Related content

- [Enable maker welcome content](welcome-content.md)
- [Rules for environment groups](environment-groups-rules.md)
- [Review agent readiness and issue status in Microsoft Copilot Studio](/microsoft-copilot-studio/authoring-agent-status)
