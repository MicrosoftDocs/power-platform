---
title: Data movement across regions for copilots and generative AI features
description: Learn about how to enable data movement across regions for copilots and generative AI features.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/09/2023
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
search.audienceType:
  - admin
contributors: 
  - JesseParsons
  - tapanm-msft
  - sidhartg
  - sericks007
  - prvenka
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-title
  - ai-seo-date:09/07/2023
---

# Data movement across regions for copilots and generative AI features

With copilots and generative AI features in [Microsoft Power Platform](/power-platform/) and [Microsoft Dynamics 365](/dynamics365/), you can build apps, flows, pages, chatbots, ask questions about your data, summarize information, reply to chat and email messages, generate content ideas, and more.

Copilots and generative AI features of Power Platform and Dynamics 365 are supported differently in different regions. See your product’s documentation for details.

Accessing copilots and generative AI features from different regions can result in data movement across regions. Note the following points about this data movement:
- The data movement is GDPR and EUDB compliant.
- The data movement includes user prompts (inputs) and completions (outputs).
- Data is stored for up to 30 days for abuse monitoring and is accesses by authorized Microsoft personnel only when flagged by automated systems. For more information, see [Abuse monitoring](/azure/ai-services/openai/concepts/abuse-monitoring).
- Your business data is never moved out of your tenant.

The following table indicates when data moves across regions.

| Your environment region | Region where data storage and processing occurs | Does data move across regions? | Action you must take to enable data movement|
|-------------------------|-------------------------|-------------------------|-------------------------|
| Australia (availability starting Nov 10, 2023)</br>United Kingdom (availability starting Nov 10, 2023)</br>United States | Within the respective geographical region | No | No action required. |
| Europe | Sweden or Switzerland | Yes | No action required. |
| France</br>Germany</br>Norway</br>Switzerland | Sweden or Switzerland | Yes | Complete the steps in the "Enable data movement across regions" section. |
| Asia</br>Canada</br>India</br>Japan</br>South Africa</br>South America</br>South Korea</br>United Arab Emirates | United States | Yes | Complete the steps in the "Enable data movement across regions" section. |

 

To enable copilots and generative AI features in your Power Platform environments outside the United States, complete the following steps.

1. Open [Power Platform admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments** in the navigation pane.

1. Select your environment.

1. On the right side of the screen, select **Edit** on the **Generative AI features** card.

    :::image type="content" source="media/ai-not-allowed.svg" alt-text="Select **Edit** on the **Generative AI features** card.":::

1. Read the information in the **Generative AI features** pane and select the check mark to consent to the terms of use.

    :::image type="content" source="media/terms-of-use.png" alt-text="Select the check mark to consent to the terms of use.":::

1. Select **Enable**.

    After you consent, the status on the **Generative AI features** card shows **Allowed** and copilots and generative AI features are enabled in the environment.

## Data storage and processing regions

The following table provides information about the data storage and processing region depending on your Power Platform environment region where you have enabled data movement for copilot capabilities using the steps described in this article above.

| Power Platform environment region | Data storage and processing region |
| - | - |
| Australia, United Kingdom, United States | Within the respective geographical region |
| Europe, France, Germany, Norway, Switzerland  | Sweden or Switzerland |
| Asia, Brazil, Canada, India, Japan, Singapore, South Africa, South Korea, United Arab Emirates  | United States |

## Disable copilots and generative AI outside United States

You can disable copilots and generative AI features in Power Platform environment regions outside United States by following these steps.

> [!IMPORTANT]
> Any data movement that happened while this feature was enabled cannot be reversed by removing your consent.

1. Open [Power Platform admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments** in the navigation pane.

1. Select your environment.

1. On the right side of the screen, select **Edit** on the **Generative AI features** card.

1. Clear the terms of use check mark.

1. Select **Disable**.

    After you remove your consent, the status on the **Generative AI features** card shows **Not allowed** disabling copilots and generative AI features in the environment.

## Available copilot and generative AI features outside United States

Currently all the Power Platform and Dynamics 365 copilots and generative AI features are available only in the United States. As the required infrastructure is available across other regions, copilots and generative AI features can be accessed from the same data boundary and opt-in consent isn't required.

The following table lists all copilot and generative AI features available in Power Platform environments outside the United States when the consent is set to **Allowed**.

> [!NOTE]
> Copilot and generative AI features only work with the English language unless explicitly mentioned in the respective feature documentation.

| Product | Feature  | Documentation
|-------------------------|-------------------------|-------------------------|
| Microsoft Dataverse | Excel to table for new makers | [Upload an Excel file (preview)](/power-apps/maker/data-platform/create-edit-entities-portal#upload-an-excel-file-preview) |
| Power Automate | Power Automate designer copilot | [Get started with Copilot in cloud flows (preview)](/power-automate/get-started-with-copilot) |

### See also

[Troubleshoot missing environments](troubleshoot-missing-environments.md)
