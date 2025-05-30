---
title: Move data across regions for Copilots and generative AI features
description: Learn how to turn on data movement across regions for Copilots and generative AI features.
author: amchern
ms.component: pa-admin
ms.topic: how-to
ms.date: 05/30/2025
ms.subservice: admin
ms.author: amchern
ms.reviewer: sericks
search.audienceType:
  - admin
contributors:
  - v-aangie
  - CedrickBellarosa 
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

However, Copilots and generative AI features aren't available in all regions and languages. In some cases, even where there's some in region capacity, data may still have to move outside of the region for availability reasons or because certain features depend on other capacity or Microsoft services. For this reason and depending on where your environment is hosted and what features you use, you might need to allow data movement across regions to use Copilots and generative AI features. This article explains how to do that.

> [!NOTE]
> - Copilots and generative AI features that are generally available are turned on by default. However, you might need to allow data movement across regions to use all Copilot and generative AI features.
> - If you don't allow data movement across regions, that doesn't turn off all Copilots and generative AI features. Copilots and generative AI features are allowed as capacity is made available in the region.
> - Certain generative AI features are powered by Microsoft 365 services and store data according to Microsoft 365 terms and data residency commitments. 

## Regions where data is processed for Copilots and generative AI features

When you allow data movement across regions, **your inputs (prompts) and outputs (results) might move outside of your region to the location where the generative AI feature is hosted**. We don't use your data to train, retrain, or improve Azure OpenAI Service foundation models. Learn more about product-specific Copilot availability in the [Copilot international availability report](https://releaseplans.microsoft.com/en-US/availability-reports/?report=copilotproductreport).

The following table lists the regions where your Power Platform or Dynamics 365 environment is hosted and the corresponding regions where the Azure OpenAI service and Bing search service are hosted. 

| Region where your Power Platform or Dynamics 365 environment is hosted | Region where Azure OpenAI Service is hosted | Region where data is stored and processed for Bing Search | 
|-------------------------|-------------------------|-------------------------|
| United States | In region* | United States| 
| Europe\**  | Norway, Spain, Sweden, or Switzerland| United States |
| France<br>Germany<br>Norway<br>Sweden<br>Switzerland | Norway, Spain, Sweden, or Switzerland | United States|
| Asia<br>Brazil<br>Canada<br>Japan<br>Korea<br>South Africa<br>United Arab Emirates | United States | United States| 
| Singapore | In region* or United States | United States |
| Australia<br>India | In region* or United States | United States |
| United Kingdom | In region*, Norway, Spain, Sweden, or Switzerland | United States |
| Government cloud (GCC, GCC High) | In region* | United States |

\*In region means within the geographical region of your Power Platform or Dynamics 365 environment.

\**If your Power Platform and Dynamics 365 environments are hosted in the EU Data Boundary, we use an Azure OpenAI endpoint in the same boundary.

## Turn on data movement, Bing search, and Microsoft 365 services for Copilots and generative AI features

To turn on data movement across regions, Bing search, and Microsoft 365 services for Copilots and generative AI features, you must consent to the terms of use in the Power Platform admin center. To grant consent, you must be a Power Platform administrator or Dynamics 365 administrator.

# [New admin center](#tab/new)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Manage**.
1. In the **Manage** pane, select **Environments**. The **Environments** page is displayed.
1. Select the name of your environment. Details about your environment are displayed.
1. In the **Generative AI features** card, select **Edit**. The **Generative AI features** pane is displayed.
1. Review the terms of use and select the **Move data across regions** checkbox.

    > [!Note]
    > The **Move data across regions** checkbox isn't displayed for US and government cloud regions.

    When you use Copilots and generative AI features&mdash;and the **Move data across regions** checkbox is selected&mdash;your inputs (prompts) and outputs (results) might move outside of your region to the location where the generative AI feature is hosted, as described in the preceding table. Learn more in [Regions where data is processed for Copilots and generative AI features](#regions-where-data-is-processed-for-copilots-and-generative-ai-features).

    > [!NOTE]
    > Data movement that occurred while your environment was allowed to move data across regions can't be reversed by clearing the **Move data across regions** checkbox.

1. Review the terms of use and select the **Bing search** checkbox.

    When the **Bing search** feature is turned on, your agent in Microsoft Copilot Studio can use the data sources you provided, but it can use Bing's APIs to index the results better and find the best answer from within your data sources. Learn more in [Generative answers](/microsoft-copilot-studio/nlu-boost-conversations).

    > [!NOTE]
    > If the **Move data across regions** checkbox is displayed in the **Generative AI features** pane, you must have it already selected in order to select the **Bing search** checkbox.

1. Review the terms of use and select the **Microsoft 365 services** checkbox.

    When the **Microsoft 365 services** feature is turned on, users can use features powered by Microsoft 365 services.

    To learn more about how the **Microsoft 365 services** feature impacts Copilot Studio, go to [Manage activity data powered by Microsoft 365 services](/microsoft-copilot-studio/manage-activity-data-m365) and [Review agent activity](/microsoft-copilot-studio/authoring-review-activity). For information about data locations, go to [Data locations in Copilot Studio](/microsoft-copilot-studio/data-location).

    > [!NOTE]
    > If the **Move data across regions** checkbox is displayed in the **Generative AI features** pane, you must have it already selected in order to select the **Microsoft 365 services** checkbox.

1. Select **Save**.

# [Classic admin center](#tab/classic)

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the navigation pane, select **Environments**. The **Environments** page is displayed.
1. Select the name of your environment. Details about your environment are displayed.
1. In the **Generative AI features** card, select **Edit**. The **Generative AI features** pane is displayed.
1. Review the terms of use and select the **Move data across regions** checkbox.

    > [!Note]
    > The **Move data across regions** checkbox isn't displayed for regions listed in [Regions where data is processed for Copilots and generative AI features](#regions-where-data-is-processed-for-copilots-and-generative-ai-features) where the Azure OpenAI Service is hosted in the same region.

    When you use Copilots and generative AI features, your inputs (prompts) and outputs (results) might move outside of your region to the location where the generative AI feature is hosted, as described in the preceding table. Learn more in [Regions where data is processed for Copilots and generative AI features](#regions-where-data-is-processed-for-copilots-and-generative-ai-features).

    > [!NOTE]
    > Data movement that occurred while your environment was allowed to move data across regions can't be reversed by clearing the **Move data across regions** checkbox.

1. Review the terms of use and select the **Bing search** checkbox.

    When the **Bing search** feature is turned on, your agent in Microsoft Copilot Studio can use the data sources you provided, but it can use Bing's APIs to index the results better and find the best answer from within your data sources. Learn more in [Generative answers](/microsoft-copilot-studio/nlu-boost-conversations).

    > [!NOTE]
    > If the **Move data across regions** checkbox is displayed in the **Generative AI features** pane, you must have it already selected in order to select the **Bing search** checkbox.

1. Review the terms of use and select the **Microsoft 365 services** checkbox.

    When the **Microsoft 365 services** feature is turned on, users can use features powered by Microsoft 365 services.

    To learn more about how the **Microsoft 365 services** feature impacts Copilot Studio, go to [Manage activity data powered by Microsoft 365 services](/microsoft-copilot-studio/manage-activity-data-m365) and [Review agent activity](/microsoft-copilot-studio/authoring-review-activity). For information about data locations, go to [Data locations in Copilot Studio](/microsoft-copilot-studio/data-location).

    > [!NOTE]
    > If the **Move data across regions** checkbox is displayed in the **Generative AI features** pane, you must have it already selected in order to select the **Microsoft 365 services** checkbox.

1. Select **Save**.

---

## Copilots and generative AI features that depend on data movement across regions

The following table lists Copilots and generative AI features that depend on the **Move data across regions** checkbox.

When the **Move data across regions** checkbox is selected, these features work at their best, allowing use of other region capacity when needed. 

When the **Move data across regions** checkbox isn't selected, no data is sent outside of the region, so depending on the _in region_ capacities, some of these features won’t work. 

More Copilots and generative AI features will be available in the future.

| Product | Feature  | Available in GCC? | Documentation
|-------------------------|-------------------------|-------------------------|-------------------------|
| Dynamics 365 Customer Service | Copilot | No | [Manage Copilot features in Customer Service](/dynamics365/customer-service/administer/configure-copilot-features)|
| Dynamics 365 Sales | Copilot | No | [Copilot in Dynamics 365 Sales overview](/dynamics365/sales/copilot-overview)|
| Microsoft Copilot Studio | Generative AI in copilots | Yes | [AI-based copilot authoring overview](/microsoft-copilot-studio/nlu-gpt-overview) and [Configure data movement for Copilot Studio generative AI features outside the United States](/microsoft-copilot-studio/manage-data-movement-outside-us) |
| Microsoft Dataverse | Excel to table for new makers | No | [Upload an Excel file (preview)](/power-apps/maker/data-platform/create-edit-entities-portal#upload-an-excel-file-preview) |
| Power Apps | Build apps through conversation | No | [Build apps through conversation](/power-apps/maker/canvas-apps/ai-conversations-create-app) |
| Power Apps | Describe a new table | No | [Describe the new table](/power-apps/maker/data-platform/create-edit-entities-portal#describe-the-new-table) |
| Power Automate | Power Automate designer Copilot | Yes | [Get started with Copilot in cloud flows](/power-automate/get-started-with-copilot) |
| Power Pages | Copilot | No | [Overview of AI-powered and Copilot features in Power Pages (preview)](/power-pages/configure/ai-copilot-overview) |
| AI Builder | AI Prompts | Yes | [Overview of Prompts](/ai-builder/prompts-overview) |

> [!NOTE]
> For Dynamics 365 Customer Insights - Data, see [Give consent to use Copilot in Customer Insights – Data](/dynamics365/customer-insights/data/copilot-global-consent).

## Languages availability

Learn more about the languages that are supported in the [Copilot international availability report](https://aka.ms/bapcopilot-intl-report-external).

## Frequently asked questions (FAQ)

### Is it possible to modify the "Move data across regions" checkbox at scale across all my environments?
Yes, you can use the **Generative AI settings** environment rule to control this at scale. Learn more in [Rules](/power-platform/admin/environment-groups#rules).

### What features are turned off when you clear the “Move data across regions” checkbox?
The **Move data across regions** checkbox isn't intended to turn off Copilots and generative AI features. When you clear the **Move data across regions** checkbox, it may turn off some features that require data movement. As we add new capacities to new regions, these features may work with in region capacity at some point. Use feature-dedicated controls to turn off unwanted features.

### Why do I need to select the “Move data across regions” checkbox if my environment has in region capacity? 
Some regions may have limited capacity, or no capacity at all. To ensure availability of Copilots and generative AI features, we may need to move the data outside of the region for processing.

### Why does the “Move data across regions” checkbox not appear in some of my environments?
If your environment is in a region that has full in region capacity, the **Move data across regions** checkbox doesn't appear.

## Related information

[Legal terms](https://go.microsoft.com/fwlink/?linkid=2182773)
