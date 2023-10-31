---
title: Enable copilots and generative AI features outside United States
description: Learn about how to enable copilot and generative AI features in Power Platform environments located outside United States.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 10/31/2023
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

# Enable copilots and generative AI features outside United States

With copilots and generative AI features in [Microsoft Power Platform](/power-platform/) and [Microsoft Dynamics 365](/dynamics365/), you can build apps, flows, pages, chatbots, ask questions about your data, summarize information, reply to chat and email messages, generate content ideas, get general answers related to the product, and do more.

All these capabilities are currently available in environments in United States and support the English language. They're starting to be available in Sweden (October 31, 2023), Australia and United Kingdom (Mid-November 2023) progressively. With this feature, you can try the copilots and generative AI features across Power Platform and Dynamics 365 customer engagement environments outside United States and the above listed regions.

> [!NOTE]
> - The underlying infrastructure for copilots is currently available only in the Power Platform environment regions located in United States and the above listed regions. Accessing copilots or generative AI features from regions outside United States or one of the above listed regions, results in **data movement across regional boundaries**. Once enabled, any data movement that already happened while this feature was enabled cannot be reversed by [removing your consent](#disable-copilots-and-generative-ai-outside-united-states).
> - All data from the copilots and generative AI features in the Europe region (including France and Germany) are handled by the underlying infrastructure hosted in the Sweden region. For all other Power Platform environment regions, the requests are handled by the infrastructure hosted in the United States region.
> - This setting is only available in a Power Platform environment that is created in regions other than **United States - Default** and **Preview (United States)**. To enable or disable copilot features in environments created in **United States – Default** and **Preview (United States)** regions, refer to the respective product documentation for the applicable product.
> - To enable copilot for Dynamics 365 Customer Service outside United States, refer to [Copilot data movement across geographies (preview)](/dynamics365/customer-service/copilot-data-movement).
> - To enable copilot for Dynamics 365 Sales outside North America, refer to [Sales Copilot data movement across geographies](/dynamics365/sales/sales-copilot-data-movement).

You can allow copilots in your Power Platform environments outside the United States regions by following these steps:

1. Open [Power Platform admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments** in the navigation pane.

1. Select your environment.

1. On the right side of the screen, select **Edit** on the **Generative AI features** card.

    :::image type="content" source="media/ai-not-allowed.svg" alt-text="Select **Edit** on the **Generative AI features** card.":::

1. Read the information in the panel and select the check mark to consent to the terms of use.

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
