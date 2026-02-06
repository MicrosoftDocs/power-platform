---
title: Allow external language models for generative responses
description: Learn how to allow external language models for generative responses in Power Platform.
ms.subservice: admin
ms.component: pa-admin
ms.topic: how-to
ms.date: 02/06/2026
author: sericks007
ms.author: sericks
ms.reviewer: sericks
search.audienceType: 
  - admin
ms.contributors:
  - jcaugusto
---

# Allow external language models for generative responses

AI innovation moves at a rapid pace, and each AI model has different strengths and specialties. By turning on the **Enable External Models** setting or rule, you allow the use of external AI models for an environment or an environment group. These models offer an alternative approach to generative AI in Microsoft Copilot Studio. These models support advanced summarization and conversational capabilities. 

Some model families are available in preview for evaluation purposes, and also in production as Microsoft subprocessors. The models available under the **Enable External Models** setting are hosted outside of Microsoft and, in some cases, are subject to their own terms and data handling. Currently, the only models available under the **Enable External Models** setting are Anthropic models.

> [!IMPORTANT]
> As of January 7, 2026, Anthropic operates as a Microsoft subprocessor and the Microsoft [Product Terms](https://www.microsoft.com/licensing/terms?msockid=344e0e6ad66c6b3e19441848d7416abd) and [Microsoft Data Protection Addendum (DPA)](https://www.microsoft.com/licensing/docs/view/Microsoft-Products-and-Services-Data-Protection-Addendum-DPA?lang=18&msockid=344e0e6ad66c6b3e19441848d7416abd) apply to use of Anthropic models through Copilot Studio.

## Allow access

A Power Platform [system admin](/entra/identity/role-based-access-control/permissions-reference#power-platform-administrator) needs to allow access to Anthropic's AI models in the [Microsoft 365 admin center](https://admin.cloud.microsoft/#/copilot/settings/DataAccess). If enabled there, you can access the **Enable External Models** environment setting and environment group rule in the Power Platform admin center.

To enable Anthropic models, complete the steps in [Anthropic as a subprocessor for Microsoft Online Services](/copilot/microsoft-365/connect-to-ai-subprocessor).

If you see the **Enable External Models** setting or rule in the Power Platform admin center but you can't switch it on, it might be because:

- Your admin didn't allow access to Anthropic's AI models.
- Your admin allowed access, but it takes more time before the setting is available to you.

## Control use of external models for an environment

To control the use of external models, complete these steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**. Then select the environment you want to manage.
1. In the command bar, select **Settings**.
1. On the **Settings** page, select **Product** > **Features**.
1. On the **Features** page, turn the **Enable External Models** toggle setting **On** or **Off**.
1. Select **Save**.

## Control use of external models for an environment group

If your environment is part of an [environment group](environment-groups.md), you can govern use of external models through the **Enable External Models** environment group rule.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environment groups**. Then select the environment group you want to manage.
1. Select the **Rules** tab.
1. Select the **Enable External Models** rule.
1. In the **Enable External Models** pane, do one of the following options:
    - Select the **Enable External Models** box to turn the feature on.
    - Clear the **Enable External Models** box to turn the feature off.
1. Select **Save**.
1. To apply your changes to the environments in the group, select **Publish rules**.

## Exclusions

The following exclusions apply when you use Anthropic models:

- Anthropic models in Copilot Studio are currently excluded from EU Data Boundary commitments.
- FedRAMP isn't achieved for Anthropic models in Copilot Studio. If your organization requires FedRAMP before use, consult with your authorization official to determine if use of Anthropic models is allowed.
- Payment Card Industry (PCI) Data Security Standard (DSS) is not applicable to Anthropic models within Copilot Studio. You should not use Anthropic models within Copilot Studio to store, process, or transmit payment and cardholder data.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
