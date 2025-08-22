---
title: Preview and experimental AI models
description: Learn how to use a new environment group rule about AI models.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 08/21/2025
author: jekom1
ms.author: jelenak
ms.reviewer: sericks
ms.subservice: admin
search.audienceType: 
  - admin

---

# Preview and experimental AI models

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

AI innovation moves at a rapid pace, and each AI model has different strengths and specialties. With the "Preview and experimental AI models" setting, you can enable the use of preview and experimental AI models for an environment or an environment group.

To control preview and experimental AI model or feature availability for an environment:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. In the admin center, go to **Manage** > **Environments** > *[select an environment]* > **Settings** > **Features**.
3. On the **Features** settings page, under **Preview and experimental AI models**, enable or disable **Let people use AI models that are experimental or in preview**.

If your environment is part of an [environment group](/power-platform/admin/environment-groups), you can also govern preview and experimental AI model or feature availability through the "Preview and experimental AI model" environment group rule.

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. In the admin center, select **Manage** > **Environment groups** > *[select an environment group]* > **Rules**.
3. On the **Rules** tab under **Preview and experimental AI models**, enable or disable the **Preview and experimental AI models** checkbox.
4. **Save** the changes.
5. To apply the rules to the environments in the group, select **Publish rules**.

If an environment group rule governing preview and experimental AI models and features is published, it locks the preview and experimental AI models setting at the environment-level, preventing any system administrator of those individual environments from editing the setting. To change the setting, admins must modify the corresponding rule in the environment group that includes the environment. 

# Effect of the setting in Copilot Studio agents

See [Select a primary AI model for your agent](/microsoft-copilot-studio/authoring-select-agent-model.md)

# Effect of the setting in the Power Platform (AI hub in Power Automate and Power Apps) and AI prompts

See [Enable or disable preview features or models](/ai-builder/administer.md#enable-or-disable-preview-features-or-models)

