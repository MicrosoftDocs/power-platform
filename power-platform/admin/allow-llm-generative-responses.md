---
title: Allow external language models for generative responses
description: Learn how to make external language models available in Power Platform environments and environment groups.
ms.subservice: admin
ms.component: pa-admin
ms.topic: how-to
ms.date: 10/12/2026
author: EllenWehrle
ms.author: ellenwehrle
ms.reviewer: ellenwehrle
ai-usage: ai-assisted
search.audienceType: 
  - admin
ms.contributors:
  - jcaugusto
  - yiannismavridis
---

# Allow external language models for generative responses

External language models give makers more model choices for generative AI scenarios in Microsoft Copilot Studio and Power Platform. To make these models available, first enable each model provider in the Microsoft 365 admin center. Then, allow the models in an individual environment or an environment group.

The **Enable External Models** settings include models from these providers:

- OpenAI
- Anthropic
- Mistral
- xAI

Model release status, processing arrangements, terms, and data-handling practices vary by provider and model. Review the provider-specific guidance before you enable a provider.

> [!NOTE]
> Each model provider maintains and manages the certifications for its models. For information about available certifications and audit reports, see the [OpenAI Trust Portal](https://trust.openai.com/), [Anthropic Trust Center](https://trust.anthropic.com/), [Mistral AI Trust Center](https://trust.mistral.ai/), and [xAI Trust Center](https://trust.x.ai/).

## Enable model providers in the Microsoft 365 admin center

External models require two separate admin actions. First, a Microsoft 365 AI administrator enables access to a model provider. Then, a Power Platform system admin allows the provider's models in an environment or environment group. Enabling a provider in Microsoft 365 doesn't automatically make its models available in Power Platform.

A Microsoft 365 AI administrator must review and enable each provider that your organization plans to use:

- [Manage OpenAI as a subprocessor](/microsoft-365/copilot/openai-subprocessor)
- [Manage Anthropic model settings](/microsoft-365/copilot/connect-to-ai-subprocessor)
- [Connect to Mistral AI models](/microsoft-365/copilot/connect-mistral-ai-models)
- [Connect to xAI models](/microsoft-365/copilot/connect-to-ai-models)

[!INCLUDE [models-xai-disclaimer-note](~/../shared-content/shared/models-xai-disclaimer-note.md)]

After an admin enables a provider in Microsoft 365, it might take a few hours for the provider settings to become available in the Power Platform admin center.

:::image type="content" source="media/allow-llm-generative-responses/enable-external-models.png" alt-text="Screenshot of Enable External Models settings with disabled checkboxes for OpenAI, Anthropic, xAI, and Mistral models, each off in Microsoft 365 admin center." lightbox="media/allow-llm-generative-responses/enable-external-models.png":::

## Allow external models in an environment

After the model provider is enabled in Microsoft 365, allow its models in each applicable Power Platform environment:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. In the navigation pane, select **Manage**.
3. In the **Manage** pane, select **Environments**, and then select the environment.
4. On the command bar, select **Settings**.
5. On the **Settings** page, select **Product** > **Features**.
6. On the **Features** page, turn each applicable model provider setting **On** or **Off**.
7. Select **Save**.

> [!NOTE]
> If you see a provider setting but can't select it, confirm that a Microsoft 365 admin enabled the provider. To learn how the model providers are enabled in the Microsoft 365 admin center, see [Enable model providers in the Microsoft 365 admin center](#enable-model-providers-in-the-microsoft-365-admin-center).

## Allow external models in an environment group

If an environment is part of an [environment group](environment-groups.md), use [environment group rules](environment-groups-rules.md) to manage external models across the group. Add and configure each applicable rule separately.

| Rule | Purpose |
|---|---|
| **Enable OpenAI models in MCS (Copilot Studio)** | Controls Power Platform OpenAI models. |
| **Power Platform Anthropic** | Controls Power Platform Anthropic models. |
| **Power Platform Mistral AI** | Controls Power Platform Mistral AI models. |
| **Power Platform XAI** | Controls Power Platform xAI models. |

> [!NOTE]
> Environments in an environment group must be managed environments.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
2. In the navigation pane, select **Manage**.
3. In the **Manage** pane, select **Environment groups**, and then select the environment group.
4. Select the **Add rules** tab.
5. Select the checkbox for each rule that you want to add: **Power Pages AI features**, **Power Platform Anthropic**, **Power Platform Mistral AI**, or **Power Platform XAI**. The rules available to you depend on your tenant's configuration.
  :::image type="content" source="media/allow-llm-generative-responses/add-models-rules.png" alt-text="Screenshot of the Add rules to this group pane with the Power Platform Anthropic rule checkbox selected and the Add button." lightbox="media/allow-llm-generative-responses/add-models-rules.png":::
6. Select each rule to see its details page, confirm or configure its feature settings, and then select **Save**.
7. After you configure all selected rules, select **Add**.
8. To publish the rules to the environments in the group, select **Apply changes**.

> [!NOTE]
> If you don't see the rule available for the model provider you want to add, consult with your Microsoft 365 AI administrator about enabling the model in the Microsoft 365 admin center first. To learn how the model providers are enabled in the Microsoft 365 admin center, see [Enable model providers in the Microsoft 365 admin center](#enable-model-providers-in-the-microsoft-365-admin-center).

## Review limitations and exclusions

The following exclusions apply:

- Anthropic models in Copilot Studio are currently excluded from EU Data Boundary commitments.
- xAI models in Copilot Studio are currently available only to US tenants.
- Anthropic and xAI models in Copilot Studio aren't FedRAMP authorized. If your organization requires FedRAMP authorization, consult your authorization official before you use these models.
- Payment Card Industry Data Security Standard (PCI DSS) coverage doesn't apply when Anthropic or xAI models in Copilot Studio store, process, or transmit payment or cardholder data.
