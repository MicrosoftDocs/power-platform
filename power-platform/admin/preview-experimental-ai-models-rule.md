---
title: Preview and experimental AI models
description: Learn how to use a new environment group rule about AI models.
ms.component: pa-admin
ms.topic: concept-article
ms.date: 08/25/2025
author: jekom1
ms.author: jelenak
ms.reviewer: sericks
ms.subservice: admin
search.audienceType: 
  - admin

---

# Preview and experimental AI models

AI innovation moves at a rapid pace, and each AI model has different strengths and specialties. With the **Preview and experimental AI models** rule and setting, you can allow the use of preview and experimental AI models for an environment or an environment group.

## Control preview and experimental AI models use for an environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. In the navigation pane, select **Manage**.
3. In the **Manage** pane, select **Environments**. Then select the environment you want to manage.
4. In the command bar, select **Settings**.
5. On the **Settings** page, select **Product** > **Features**.
6. On the **Features** page, turn the **Preview and experimental AI models** setting **On** or **Off**.

## Control preview and experimantal AI models use for an environment group

If your environment is part of an [environment group](environment-groups.md), you can govern preview and experimental AI model use through the [**Preview and experimental AI models** environment group rule](environment-groups-rules.md).

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. In the navigation pane, select **Manage**.
3. In the **Manage** pane, select **Environment groups**. Then select the environment group you want to manage.
4. Select the **Rules** tab.
5. Select the **Preview and experimental AI models** rule. In the **Preview and experimental AI models** pane, turn the feature **On** or **Off**.
6. Save your changes.
7. To apply your changes to the environments in the group, select **Publish rules**.

If an environment group rule governing preview and experimental AI models and features is published, it locks the **Preview and experimental AI models** setting at the environment-level, preventing any system administrator of those individual environments from editing the setting. To change the setting, admins must modify the corresponding rule in the environment group that includes the environment. 

## Effects of the setting on Copilot Studio agents

Learn more about the effects that the **Preview and experimental AI models** setting has on Copilot Studio agents in [Select a primary AI model for your agent](/microsoft-copilot-studio/authoring-select-agent-model).

## Effects of the setting on the Power Platform

Learn more about the effects that the **Preview and experimental AI models** setting has has on Power Automate and Power Apps in [Enable or disable preview features or models](ai-builder-docs/administer.md#enable-or-disable-preview-features-or-models).

