---
title: Allow external language models for generative responses
description: Learn how to allow external language models for generative responses in Power Platform.
ms.subservice: admin
ms.component: pa-admin
ms.topic: how-to
ms.date: 02/17/2026
author: sericks007
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.contributors:
  - jcaugusto
  - yiannismavridis
---

# Allow external language models for generative responses

AI innovation moves at a rapid pace, and each AI model has different strengths and specialties. With the **External models** rule and setting, you can allow the choice of external AI models in model-picking scenarios for an environment or an environment group. These models offer an alternative approach to generative AI in Microsoft Copilot Studio and Power Platform. These models support advanced summarization and conversational capabilities. 

Some model families are available in preview for evaluation purposes, and also in production as Microsoft subprocessors. The models available under the **Enable External Models** setting are hosted outside of Microsoft and, in some cases, are subject to their own usage and data handling terms. Currently, the only models available under the **Enable External Models** setting are through third-parties Anthropic and xAI.

On January 7, 2026, Anthropic operates as a Microsoft subprocessor and the Microsoft [Product Terms](https://www.microsoft.com/licensing/terms?msockid=344e0e6ad66c6b3e19441848d7416abd) and [Microsoft Data Protection Addendum (DPA)](https://www.microsoft.com/licensing/docs/view/Microsoft-Products-and-Services-Data-Protection-Addendum-DPA?lang=18&msockid=344e0e6ad66c6b3e19441848d7416abd) apply to use of Anthropic models through Copilot Studio and Power Platform.

> [!NOTE]
> Your must [allow Anthropic access in the Microsoft 365 admin center and allow xAI access in Microsoft 365 admin center.](/copilot/microsoft-365/connect-to-ai-subprocessor) If enabled there, you can access these settings in the Power Platform admin center.  

## Control external AI models use for an environment

To enable external models, complete these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**. Then select the environment you want to manage.
1. In the command bar, select **Settings**.
1. On the **Settings** page, select **Product** > **Features**.
1. On the **Features** page, check or uncheck the available model family setting to turn it **On** or **Off**.
1. Select **Save**.

## Control external models use for an environment group

If your environment is part of an [environment group](environment-groups.md), you can govern use of external models use through the [External models environment group rule](environment-groups-rules.md).

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environment groups**. Then select the environment group you want to manage.
1. Select the **Rules** tab.
1. Select the **External Models** rule.
1. In the **External Models** pane, check/uncheck the available model family features to turn it On/Off.
1. Select **Save**.
1. To apply your changes to the environments in the group, select **Publish rules**.

> [!NOTE]
> If the external model toggle is visible but unable to be checked, that means your organization’s admin has not enabled access to that model family in the Microsoft 365 admin center. For Anthropic models, to enable before January 7, 2026, complete the steps in [Connect to Anthropic's AI models](/copilot/microsoft-365/connect-to-ai-subprocessor).  To enable Anthropic models on January 7, 2026 or later, complete the steps in [Anthropic as a subprocessor for Microsoft Online Services](/copilot/microsoft-365/connect-to-ai-subprocessor).

## Exclusions

The following exclusions apply:

- Anthropic models in Copilot Studio are currently excluded from EU Data Boundary commitments.
- xAI models within Copilot Studio are currently available for US tenants only. 
- FedRAMP isn't achieved for Anthropic or xAI models in Copilot Studio. If your organization requires FedRAMP before use, consult with your authorization official to determine if use of Anthropic models is allowed.
- Payment Card Industry (PCI) Data Security Standard (DSS) is not applicable to Anthropic or xAI models within Copilot Studio to store, process, or transmit payment and cardholder data.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
