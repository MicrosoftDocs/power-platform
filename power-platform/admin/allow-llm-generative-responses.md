---
title: Allow external large language models (LLMs) for generative responses
description: Learn how to allow external large language models for generative responses in Power Platform.
ms.subservice: admin
ms.component: pa-admin
ms.topic: how-to
ms.date: 12/16/2025
author: sericks007
ms.author: sericks
ms.reviewer: ellenwehrle
search.audienceType: 
  - admin
ms.contributors:
  - jcaugusto
---

# Allow external large language models (LLMs) for generative responses

AI innovation moves at a rapid pace, and each AI model has different strengths and specialties. By turning on the **Enable External Models** setting or rule, you allow the use of external AI models for an environment or an environment group. These models offer an alternative approach to generative AI in Microsoft Copilot Studio. These models support advanced summarization and conversational capabilities. Some model families are available in preview, for evaluation purposes, and also in production, as Microsoft subprocessors. The models available under the **Enable External Models** setting are hosted outside of Microsoft and, in some cases, are subject to their own terms and data handling. Currently, the only models available under the **Enable External Models** setting are Anthropic models.

> [!IMPORTANT]
> Starting January 7,2026, Anthropic operates as a Microsoft subprocessor and the Microsoft Product Terms and Microsoft Data Protection Addendum (DPA) apply to use of Anthropic models through Copilot Studio.

## Allow access

Before you can access the *Enable External Models* environment setting and the group environment rule in the Power Platform admin center, a [system admin](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) needs to allow access to Anthropic's AI models in the [Microsoft 365 admin center](https://admin.cloud.microsoft/#/copilot/settings/DataAccess).

- To enable Anthropic models before January 7, 2026, complete the steps in [Connect to Anthropic's AI models](https://go.microsoft.com/fwlink/?linkid=2334803).
- To enable Anthropic models on January 7, 2026, or later, complete the steps in [Anthropic as a subprocessor for Microsoft Online Services](/copilot/microsoft-365/connect-to-ai-subprocessor).

If the **Enable External Models** setting or rule is visible in the Power Platform admin center but you can't switch it, it might be because:

- Your admin didn't allow access to Anthropic's AI models.
- Your admin allowed access, but it takes more time before the setting is available to you.

## Control external models use for an environment

To control the use of external models, complete these steps.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**. Then select the environment you want to manage.
1. In the command bar, select **Settings**.
1. On the **Settings** page, select **Product** > **Features**.
1. On the **Features** page, turn the **Enable External Models** toggle setting **On** or **Off**.
1. Select **Save**.

## Control external models use for an environment group

If your environment is part of an [environment group](environment-groups.md), you can govern external models use through the **Enable External models** environment group rule.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environment groups**. Then select the environment group you want to manage.
1. Select the **Rules** tab.
1. Select the **Enable External Models** rule.
1. In the **Enable External Models** pane, do one of the following options:
    - **Check** the **Enable External Models** box to turn the feature **On**.
    - **Uncheck** the **Enable External Models** box to turn the feature **Off**.
1. Select **Save**.
1. To apply your changes to the environments in the group, select **Publish rules**.

## Exclusions

The following exclusions apply when using Anthropic models:

- Anthropic models within Copilot Studio are currently excluded from EU Data Boundary commitments.
- FedRAMP is not achieved for Anthropic models within Copilot Studio. If your organization requires FedRAMP prior to use, you should consult with your Authorization Official to determine if use of Anthropic models is allowed.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
