---
title: Turn on copilots and generative AI features
description: Learn how to turn on copilots and generative AI features.
author: caitlinshaw1
ms.component: pa-admin
ms.topic: conceptual
ms.date: 09/17/2024
ms.subservice: admin
ms.author: caitlinshaw
ms.reviewer: sericks
search.audienceType:
  - admin
contributors:
  - antoinecellerier 
  - JesseParsons
  - tapanm-msft
  - sidhartg
  - sericks007
  - prvenka
  - caitlinshaw1
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-title
  - ai-seo-date:09/07/2023
  - copilot-learning-hub
ms.collection: 
    - bap-ai-copilot
---

# Turn on copilots and generative AI features

Copilots and generative AI features in [Microsoft Power Platform](/power-platform/) and [Microsoft Dynamics 365](/dynamics365/) help you build apps, flows, and chatbots, analyze your data, summarize information, reply to messages, and generate ideas.

However, copilots and generative AI features aren't available in all regions and languages. Depending on where your environment is hosted, you might need to allow data movement across regions to use them. This article explains how to do that.

> [!NOTE]
> Copilots and generative AI features that are generally available are turned on by default. However, you might need to allow data movement across regions to use all copilot and generative AI features.

## Regions involved with copilots and generative AI features

When you use copilots and generative AI features, **your inputs (prompts) and outputs (results) might move outside of your region to the location where the generative AI feature is hosted**. We don't use your data to train, retrain, or improve Azure OpenAI Service foundation models. Learn more about product-specific Copilot availability, in the [Copilot international availability report](https://releaseplans.microsoft.com/en-US/availability-reports/?report=copilotproductreport).

The following table lists the regions where your Power Platform or Dynamics 365 environment is hosted and the corresponding regions where Azure OpenAI service and Bing search service are hosted:

| Region where your Power Platform or Dynamics 365 environment is hosted | Region where Azure OpenAI Service is hosted | Region where data is stored and processed for Bing Search | 
|-------------------------|-------------------------|-------------------------|
| Australia<br>India<br>United Kingdom<br>United States | Within the geographical region of your Power Platform or Dynamics 365 environment | United States| 
| Europe\*  | Spain, Sweden, or Switzerland| United States |
| France<br>Germany<br>Norway<br>Switzerland | Spain, Sweden, or Switzerland | United States|
| Asia<br>Brazil<br>Canada<br>Japan<br>Korea<br>Singapore<br>South Africa<br>United Arab Emirates | United States | United States| 
| Government cloud (GCC, GCC High) | United States (commercial cloud) | United States |

\*If your Power Platform and Dynamics 365 environments are hosted in the EU Data Boundary, we use an Azure OpenAI endpoint in the same boundary.

## Turn on copilots and generative AI features

To use copilots and generative AI features, you must consent to the terms of use in the Power Platform admin center. To grant consent, you must be a Power Platform administrator or Dynamics 365 administrator.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the left side panel, select **Environments**.
1. Select your environment.
1. On the **Generative AI features** card, select **Edit**. 

    > [!NOTE]
    > The **Generative AI features** card isn't displayed for regions listed in [Regions involved with copilots and generative AI features](#regions-involved-with-copilots-and-generative-ai-features) where the Azure OpenAI Service is hosted in the same region.

1. Review the terms of use and select the **Move data across regions** checkbox.

    When you use copilots and generative AI features, your inputs (prompts) and outputs (results) might move outside of your region to the location where the generative AI feature is hosted, as described in the preceding table. Learn more: [Regions involved with copilots and generative AI features](#regions-involved-with-copilots-and-generative-ai-features)

    > [!NOTE]
    > Data movement that occurred while your environment was allowed to move data across regions can't be reversed by clearing the **Move data across regions** checkbox.

1. Review the terms of use and select the **Bing Search** checkbox.

    When the **Bing Search** feature is turned on, your copilot in Microsoft Copilot Studio can use the data sources you provided, but it can use Bing's APIs to index the results better and find the best answer from within your data sources. Learn more: [Generative answers](/microsoft-copilot-studio/nlu-boost-conversations)

    > [!NOTE]
    > You can select the **Bing Search** checkbox only if the **Move data across regions** checkbox is already selected.

1. Select **Save**.

## Copilots and generative AI features that are available when you enable data movement across regions

The following table lists copilots and generative AI features that are available in Power Platform environments when the **Move data across regions** checkbox is selected.

More copilots and generative AI features will be available in the future.

| Product | Feature  | Available in GCC? | Documentation
|-------------------------|-------------------------|-------------------------|-------------------------|
| Dynamics 365 Customer Service | Copilot | No | [Manage Copilot features in Customer Service](/dynamics365/customer-service/administer/configure-copilot-features)|
| Dynamics 365 Sales | Copilot | No | [Copilot in Dynamics 365 Sales overview](/dynamics365/sales/copilot-overview)|
| Microsoft Copilot Studio | Generative AI in copilots | Yes | [AI-based copilot authoring overview](/microsoft-copilot-studio/nlu-gpt-overview) and [Configure data movement for Copilot Studio generative AI features outside the United States](/microsoft-copilot-studio/manage-data-movement-outside-us) |
| Microsoft Dataverse | Excel to table for new makers | No | [Upload an Excel file (preview)](/power-apps/maker/data-platform/create-edit-entities-portal#upload-an-excel-file-preview) |
| Power Apps | Build apps through conversation | No | [Build apps through conversation](/power-apps/maker/canvas-apps/ai-conversations-create-app) |
| Power Apps | Describe a new table | No | [Describe the new table](/power-apps/maker/data-platform/create-edit-entities-portal#describe-the-new-table) |
| Power Apps | Draft with Copilot | No | [Draft with Copilot](/power-apps/user/well-written-input-text-copilot) |
| Power Automate | Power Automate designer copilot | No | [Get started with Copilot in cloud flows (preview)](/power-automate/get-started-with-copilot) |
| Power Pages | Copilot | No | [Overview of AI-powered and Copilot features in Power Pages (preview)](/power-pages/configure/ai-copilot-overview) |
| AI Builder | AI Prompts | Yes | [Overview of Prompts](/ai-builder/prompts-overview) |

> [!NOTE]
> For Dynamics 365 Customer Insights - Data, see [Give consent to use Copilot in Customer Insights – Data](/dynamics365/customer-insights/data/copilot-global-consent).


## Languages availability

Learn about the languages that are supported, in the [Copilot international availability report](https://aka.ms/bapcopilot-intl-report-external).

## Related information

[Legal terms](https://go.microsoft.com/fwlink/?linkid=2182773)
