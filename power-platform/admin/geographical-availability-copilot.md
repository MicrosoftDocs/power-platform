---
title: Move data across regions for Copilots and generative AI features
description: Learn how to turn on data movement across regions for Copilots and generative AI features.
author: amchern
ms.component: pa-admin
ms.topic: conceptual
ms.date: 02/07/2025
ms.subservice: admin
ms.author: amchern
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
  - NewPPAC
  - ai-gen-docs-bap
  - ai-gen-title
  - ai-seo-date:09/07/2023
  - copilot-learning-hub
ms.collection: 
    - bap-ai-copilot
---

# Move data across regions for Copilots and generative AI features
Copilots and generative AI features in [Microsoft Power Platform](/power-platform/) and [Microsoft Dynamics 365](/dynamics365/) help you build apps, flows, and chatbots, analyze your data, summarize information, reply to messages, and generate ideas.

However, Copilots and generative AI features aren't available in all regions and languages. In some cases, even where there is in region capacity, data must still move outside of the region for availability reasons. For this reason and depending on where your environment is hosted, you might need to allow data movement across regions to use Copilots and generative AI features. This article explains how to do that.

> [!NOTE]
> Keep the following points in mind:
> - Copilots and generative AI features that are generally available are turned on by default. However, you might need to allow data movement across regions to use all Copilot and generative AI features.
> - If you don't allow data movement across regions, that doesn't turn off all Copilots and generative AI features. Copilots and generative AI features are allowed as capacity is made available in the region.

## Regions where data is processed for Copilots and generative AI features

When you use Copilots and generative AI features, **your inputs (prompts) and outputs (results) might move outside of your region to the location where the generative AI feature is hosted**. We don't use your data to train, retrain, or improve Azure OpenAI Service foundation models. Learn more about product-specific Copilot availability in the [Copilot international availability report](https://releaseplans.microsoft.com/en-US/availability-reports/?report=copilotproductreport).

The following table lists the regions where your Power Platform or Dynamics 365 environment is hosted and the corresponding regions where Azure OpenAI service and Bing search service are hosted.

| Region where your Power Platform or Dynamics 365 environment is hosted | Region where Azure OpenAI Service is hosted | Region where data is stored and processed for Bing Search | 
|-------------------------|-------------------------|-------------------------|
| United States | In region* | United States| 
| Europe\**  | Spain, Sweden, or Switzerland| United States |
| France<br>Germany<br>Norway<br>Switzerland | Spain, Sweden, or Switzerland | United States|
| Asia<br>Brazil<br>Canada<br>Japan<br>Korea<br>Singapore<br>South Africa<br>United Arab Emirates | United States | United States| 
| Australia<br>India | In region* or United States | United States |
| United Kingdom | In region*, Spain, Sweden or Switzerland | United States |
| Government cloud (GCC, GCC High) | In region* | United States |

\*In region means within the geographical region of your Power Platform or Dynamics 365 environment.

\**If your Power Platform and Dynamics 365 environments are hosted in the EU Data Boundary, we use an Azure OpenAI endpoint in the same boundary.

## Turn on data movement and Bing search for Copilots and generative AI features

To turn on data movement across regions and Bing search for copilots and generative AI features, you must consent to the terms of use in the Power Platform admin center. To grant consent, you must be a Power Platform administrator or Dynamics 365 administrator.

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**. The **Environments** page is displayed.
1. Select the name of your environment. Details about your environment are displayed.
1. In the **Generative AI features** card, select **Edit**. 

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

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Environments**.
1. Select the name of your environment.
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

---

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

## FAQ

### Is it possible to modify this setting at scale across all my environments?
Yes, you can use the “Generative AI settings” environment rule to control this at scale. 

### What features are disabled by turning off “move data across regions”?
This setting is not intended to turn off copilots and generative AI features.  While disabling the “move data across regions” setting may disable some features that require data movement, feature disablement will be controlled by each feature. 

### Why do I need to enable the “move data across regions” setting if my environment has in region capacity? 
Some regions may have more limited capacity. To help ensure high availability of copilots and generative AI features, we may need to move the data outside of region for processing.

### Why does the “move data across regions” setting not appear in some of my environments?
If your environment is in a region that has full in region capacity, the “move data across regions” setting will not appear.

## Related information

[Legal terms](https://go.microsoft.com/fwlink/?linkid=2182773)
