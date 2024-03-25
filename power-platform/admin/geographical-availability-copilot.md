---
title: Turn on copilots and generative AI features
description: Learn how to enable data movement across regions for copilots and generative AI features.
author: caitlinshaw1
ms.component: pa-admin
ms.topic: conceptual
ms.date: 03/22/2024
ms.subservice: admin
ms.author: caitlinshaw
ms.reviewer: sericks
search.audienceType:
  - admin
contributors: 
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
ms.collection: 
    - bap-ai-copilot
---

# Turn on copilots and generative AI features

Copilots and generative AI features in [Microsoft Power Platform](/power-platform/) and [Microsoft Dynamics 365](/dynamics365/) help you build apps, flows, and chatbots, analyze your data, summarize information, reply to messages, and generate ideas.

However, copilots and generative AI features aren't available in all regions and languages. Depending on where your environment is hosted, you might need to allow data movement across regions to use them. This article explains how to do that.

> [!NOTE]
> Copilot and genearative AI features that are generally available are enabled by default. However, you might need to allow data movement across regions to use all copilot and generative AI features.

## How data movement across regions works

When you use copilots and generative AI features, **your inputs (prompts) and outputs (results) might move outside of your region to the location where the generative AI feature is hosted**. We do not use your data to train, retrain, or improve Azure OpenAI Service foundation models.

The following table describes when and how data can move across regions for copilots and generative AI features.

| Region where your Power Platform or Dynamics 365 environment is hosted | Region where Azure OpenAI Service is hosted | Region where data is stored and proccessed for Bing Search | Does data move across regions? | How to allow data to move across regions|
|-------------------------|-------------------------|-------------------------|-----|--------------------|
| Australia</br>India</br>United Kingdom</br>United States | Within the respective geographical region of your Power Platform or Dynamics 365 environment | United States| No | No action required. Data doesn't move across regions in this scenario.|
| Europe | Sweden or Switzerland | United States | Yes\* | No action required. Data doesn't move outside the [EU Data Boundary](https://www.microsoft.com/en-us/trust-center/privacy/european-data-boundary-eudb) in this scenario.<br><br>Admins can clear the [**Move data across regions**](#enable-data-movement-across-regions) checkbox, if they want to. |
| France</br>Germany</br>Norway</br>Switzerland | Sweden or Switzerland | United States| Yes | Complete the steps in [Enable data movement across regions](#enable-data-movement-across-regions). |
| Asia</br>Canada</br>Japan</br>South Africa</br>South America</br>South Korea</br>United Arab Emirates | United States | United States| Yes | Complete the steps in [Enable data movement across regions](#enable-data-movement-across-regions). |
| Government cloud (GCC, GCC High) | United States (commercial cloud) | United States | Yes - to commercial (United States) | Complete the steps in [Enable data movement across regions](#enable-data-movement-across-regions). |

\*If your Power Platform and Dynamics 365 environments are hosted in the EU Data Boundary, we use an Azure OpenAI endpoint in the same boundary.

## Turn on copilots and generative AI features

If your environment is hosted in a region that requires data movement across regions to use copilots and generative AI features, you need to consent to the terms of use on the **Move data across regions** checkbox in the Power Platform admin center.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).
1. In the left side panel, select **Environments**.
1. Select your environment.
1. On the **Generative AI features** card, select **Edit**.
1. Review the terms of use and select the **Move data across regions** checkbox.

   > [!Note]
   > Data movement that occurred while your environment was enabled to move data across regions, can't be reversed by clearing the **Move data across regions** checkbox.
   
1. Review the terms of use and select the **Bing Search** checkbox.

   > [!Note]
   > To select the **Bing Search** checkbox, the **Move data across regions** checkbox must be already selected.
   > Data is stored and processed in the United States region for Bing search.

1. Select **Save**.

## Copilots and generative AI features that are available when you enable data movement across regions

The following table lists copilots and generative AI features that are available in Power Platform environments when the **Move data across regions** checkbox is selected.

More copilots and generative AI features will be available in the future.

| Product | Feature  | Available in GCC? | Documentation
|-------------------------|-------------------------|-------------------------|-------------------------|
| Dynamics 365 Customer Service | Copilot | No | [Manage Copilot features in Customer Service](/dynamics365/customer-service/administer/configure-copilot-features)|
| Microsoft Copilot Studio | Generative AI in copilots | No | [AI-based copilot authoring overview](/microsoft-copilot-studio/nlu-gpt-overview) and [Configure data movement for Copilot Studio generative AI features outside the United States](/microsoft-copilot-studio/manage-data-movement-outside-us) |
| Microsoft Dataverse | Excel to table for new makers | No | [Upload an Excel file (preview)](/power-apps/maker/data-platform/create-edit-entities-portal#upload-an-excel-file-preview) |
| Power Apps | Build apps through conversation | No | [Build apps through conversation](/power-apps/maker/canvas-apps/ai-conversations-create-app) |
| Power Apps | Describe a new table | No | [Describe the new table](/power-apps/maker/data-platform/create-edit-entities-portal#describe-the-new-table) |
| Power Apps | Draft with Copilot | No | [Draft with Copilot](/power-apps/user/well-written-input-text-copilot) |
| Power Automate | Power Automate designer copilot | No | [Get started with Copilot in cloud flows (preview)](/power-automate/get-started-with-copilot) |
| Power Pages | Copilot | No | [Overview of AI-powered and Copilot features in Power Pages (preview)](/power-pages/configure/ai-copilot-overview) |
| AI Builder | AI Prompts | Yes | [Overview of Prompts](/ai-builder/prompts-overview) |


## Copilot data movement across geographies for Dynamics 365

Copilot and generative AI features of Power Platform and Dynamics 365 are supported differently in different regions.

For information about regions supported by Dynamics 365 copilots and generative AI features, see the following documentation:

- For Dynamics 365 Customer Insights - Data, see [Give consent to use Copilot in Customer Insights – Data](/dynamics365/customer-insights/data/copilot-global-consent).
- For Dynamics 365 Sales, see [Copilot data movement across geographies](/dynamics365/sales/sales-copilot-data-movement).

## Languages availability

To learn about the languages that are supported, see the [Copilot International Availability report](https://dynamics.microsoft.com/en-us/availability-reports/copilotreport/).

## Related content

[Legal terms](https://go.microsoft.com/fwlink/?linkid=2182773).
