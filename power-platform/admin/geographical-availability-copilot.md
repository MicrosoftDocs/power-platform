---
title: Enable copilots and generative AI features outside United States and Switzerland regions
description: Learn about how to enable copilot and generative AI features in non-US and non-Switzerland regions.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/08/2023
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
---
# Enable copilots and generative AI features outside United States and Switzerland regions

With copilots and generative AI features in Power Platform and Dynamics 365, you can build apps, flows, pages, chatbots, ask questions about your data, summarize information, reply to chat and email messages, generate content ideas, get general answers related to the product, and more.

All these capabilities are currently available in environments in the US region and support the English language. They are starting to be available in Switzerland progressively. With this feature, you can try the copilot and generative features across Power Platform and Dynamics 365 customer engagement environments is non-US and non-Switzerland regions.

> [!NOTE]
> - The underlying infrastructure for copilots is currently available in the US and Switzerland regions only. Accessing copilots or generative AI features from non-US and non-Switzerland regions results in **data movement across regional boundaries**. Once enabled, any data movement that already happened while this feature was enabled cannot be reversed by [removing your consent](#disable-copilots-and-generative-ai-in-non-us-and-non-switzerland-regions).
> - All data from the Copilots and generative AI features in the Europe region (including France and Germany) will be handled by the underlying infrastructure hosted in Switzerland region. For all other regions, the requests are handled by the infrastructure hosted in the US region.
> - This setting is only available in a Power Platform environment that is created in regions other than **United States - Default**, **Preview (United States)**, and **Switzerland**. To enable or disable copilot features in environments created in **United States – Default**, **Preview (United States)**, or **Switzerland** regions, refer to the [documentation for the applicable product](#available-copilot-and-generative-ai-features-outside-united-states-and-switzerland-regions).
> - To enable Copilot for Dynamics 365 Customer Service outside United States region, refer to [Copilot data movement across geographies (preview)](/dynamics365/customer-service/copilot-data-movement).

You can allow copilots in your non-US and non-Switzerland environments by following these steps:

1. Open [Power Platform admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments** from the left-pane.

1. Select your environment.

1. From the right-side of the screen, select **Edit** on the **Allow data movement across regions for AI features** card.

    ![Select **Edit** on the **Allow data movement across regions for AI features** card.](media/allow-data-movement.png)

1. Read the information on the panel and select the check mark to consent to the terms of use.

    ![Select the check mark to consent to the terms of use.](media/terms-of-use.png)

1. Select **Enable**.

    After you consent, the status on the **Allow data movement across regions for AI features** card shows **Allowed** and copilots and generative AI features are enabled in the environment.

## Disable copilots and generative AI in non-US and non-Switzerland regions

You can disable the copilots and generative AI features in non-US and non-Switzerland environments by following these steps.

> [!IMPORTANT]
> Any data movement that happened while this feature was enabled cannot be reversed by removing your consent.

1. Open [Power Platform admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments** from the left-pane.

1. Select your environment.

1. From the right-side of the screen, select **Edit** on the **Allow data movement across regions for AI features** card.

1. Clear the terms of use check mark.

1. Select **Disable**.

    After you remove your consent, the status on the **Allow data movement across regions for AI features** card shows **Not allowed** and copilots and generative AI features are disabled in the environment.

## Available copilot and generative AI features outside United States and Switzerland regions

Currently all the Power Platform and Dynamics 365 copilots and generative features are available only in the US and Switzerland regions. As the required infrastructure is available across other regions, copilots and generative AI features can be accessed from the same data boundary and opt-in consent is not required.

The following table lists all copilot and generative AI features available in Power Platform environments outside US and Switzerland regions with consent set.

> [!NOTE]
> Copilot and generative AI features only work with English language.

| Product | Feature  | Documentation
|-------------------------|-------------------------|-------------------------|
| Microsoft Dataverse | Excel to table for new makers | [Upload an Excel file (preview)](/power-apps/maker/data-platform/create-edit-entities-portal#upload-an-excel-file-preview) |
| Power Automate | Power Automate designer copilot | [Understand AI-powered cloud flows designer (preview)](/power-automate/flows-designer) |

### See also

[Troubleshoot missing environments](troubleshoot-missing-environments.md)
