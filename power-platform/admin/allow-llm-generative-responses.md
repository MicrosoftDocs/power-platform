---
title: Allow external large language models for generative responses
description: Learn how to allow external large language models for generative responses in Power Platform.
ms.subservice: admin
ms.component: pa-admin
ms.topic: concept-article
ms.date: 09/18/2025
author: sericks007
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.contributors:
  - jcaugusto
---

# Allow external large language models for generative responses

AI innovation moves ata a rapid pace, and each AI model has different strengths and specialies. With the **External models** rule and setting, you can allow the use of beta AI models for an environment or an environment group. These models offer an alternative approach to generative AI in Microsoft Copilot Studio. These models support advanced summarization and conversational capabilities and are now available in beta for evaluation purposes. The models available under this External models setting are Anthropic models that are hosted outside of Microsoft and subject to Anthropic terms and data handling.

> [NOTE]
> Your admin must first allow acess in the Microsoft 365 admin center. Once allowed there, you can access these settings in the Power Platform admin center.

## Control external AI models use for an environment
To allow external models, complete these steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**. Then select the environment you want to manage.
1. In the command bar, select **Settings**.
1. On the **Settings** page, select **Product** > **Features**.
1. On the **Features** page, turn the External models setting **On** or **Off**.

## Control external models use for an environment group
If your environment is part of an environment group, you can govern external models use through the External models environment group rule.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**. Then select the environment you want to manage.
1. Select the **Rules** tab.
1. Select the **External models** rule. In the **Preview and experimental AI models** pane, turn the feature **On** or **Off**.
1. Save your changes.
1. To apply your changes to the environments in the group, select **Publish rules**.

> [!NOTE]
> If the external model toggle is visible but unable to be switched, that means your organization's admin hasn't allowed access to Anthropic models in the Microsoft 365 admin center. Complete the steps in Connect to Anthropic LLM.
