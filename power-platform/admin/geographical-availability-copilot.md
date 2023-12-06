---
title: Enable copilots and generative AI features
description: Learn about how to enable data movement across regions for copilots and generative AI features.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 12/06/2023
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

# Enable copilots and generative AI features
Copilots and generative AI features in [Microsoft Power Platform](/power-platform/) and [Microsoft Dynamics 365](/dynamics365/) help you build apps, flows, and chatbots, analyze your data, summarize information, reply to messages, generate ideas, and more.

However, these features aren't available in all regions and languages. Depending on where your environment is hosted, you might need to enable data movement across regions to use them. This article explains how to do that.

## How data movement across regions works

When you use copilots and generative AI features, **your inputs (prompts) and outputs (results) might move outside of your region to the location where the Azure OpenAI Service endpoint that powers these features is hosted**. We might store prompt and output data for up to 30 days to [monitor for abuse](/azure/ai-services/openai/concepts/abuse-monitoring), but we don't look at it unless our automated systems flag it for review.

The following table describes when and how data can move across regions for copilots and generative AI features.

| Region where your Power Platform or Dynamics 365 environment is hosted | Region where Azure OpenAI Service is hosted | Does data move across regions? | How to allow data to move across regions|
|-------------------------|-------------------------|-------------------------|-------------------------|
| Australia</br>United Kingdom</br>United States | Within the respective geographical region of your Power Platform or Dynamics 365 environment | No | No action required. Data doesn't move across regions in this scenario.|
| Europe | Sweden or Switzerland | Yes\* | No action required. Data doesn't move outside the [EU Data Boundary](https://www.microsoft.com/en-us/trust-center/privacy/european-data-boundary-eudb) in this scenario.<br><br>Admins can clear the [**Move data across regions**](#enable-data-movement-across-regions) checkbox, if they want to. |
| France</br>Germany</br>Norway</br>Switzerland | Sweden or Switzerland | Yes | Complete the steps in [Enable data movement across regions](#enable-data-movement-across-regions). |
| Asia</br>Canada</br>India</br>Japan</br>South Africa</br>South America</br>South Korea</br>United Arab Emirates | United States | Yes | Complete the steps in [Enable data movement across regions](#enable-data-movement-across-regions). |

\* For your Power Platform and Dynamics 365 environment regions hosted within the EU Data Boundary, we use an Azure OpenAI endpoint within the EU Data Boundary.

## Enable data movement across regions
If your environment is hosted in a region that requires data movement across regions to use copilots and generative AI features, you need to consent to the terms of use on the **Move data across regions** checkbox in the Power Platform admin center.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com).

1. In the left side panel, select **Environments**.

1. Select your environment.

1. On the **Generative AI features** card, select **Edit**.

    :::image type="content" source="media/ai-not-allowed.svg" alt-text="Select **Edit** on the **Generative AI features** card.":::

1. Review the terms of use and select the **Move data across regions** checkbox.

    :::image type="content" source="media/terms-of-use.png" alt-text="Select the check mark to consent to the terms of use.":::

1. Select **Enable**.

    After you consent to the terms of use, the status of the **Move data across regions** field on the **Generative AI features** card shows **Allowed**. Copilots and generative AI features are enabled in the environment.

   > [!Note]
   > Data movement that occurred while your environment was enabled to move data across regions, can't be reversed by clearing the **Move data across regions** checkbox. The data might be stored by the Azure OpenAI Service for up to 30 days to monitor for abuse.

## Copilots and generative AI features that are available when you enable data movement across regions
The following table lists copilots and generative AI features that are available in Power Platform environments when the **Move data across regions** checkbox is selected.

More copilots and generative AI features will be available in the future.

| Product | Feature  | Documentation
|-------------------------|-------------------------|-------------------------|
| Dynamics 365 Customer Service | Copilot | [Manage Copilot features in Customer Service](/dynamics365/customer-service/administer/configure-copilot-features)|
| Microsoft Copilot Studio | Generative AI in copilots | [AI-based copilot authoring overview](/microsoft-copilot-studio/nlu-gpt-overview) and [Configure data movement for Copilot Studio generative AI features outside the United States](/microsoft-copilot-studio/manage-data-movement-outside-us) |
| Microsoft Dataverse | Excel to table for new makers | [Upload an Excel file (preview)](/power-apps/maker/data-platform/create-edit-entities-portal#upload-an-excel-file-preview) |
| Power Apps | Build apps through conversation | [Build apps through conversation](/power-apps/maker/canvas-apps/ai-conversations-create-app) |
| Power Apps | Describe a new table | [Describe the new table](/power-apps/maker/data-platform/create-edit-entities-portal#describe-the-new-table)
| Power Automate | Power Automate designer copilot | [Get started with Copilot in cloud flows (preview)](/power-automate/get-started-with-copilot) |

## Copilot data movement across geographies for Dynamics 365
Copilot and generative AI features of Power Platform and Dynamics 365 are supported differently in different regions.

For information about regions supported by Dynamics 365 copilots and generative AI features, see the following documentation:

- For Dynamics 365 Customer Insights - Data, see [Give consent to use Copilot in Customer Insights – Data](/dynamics365/customer-insights/data/copilot-global-consent).
- For Dynamics 365 Sales, see [Copilot data movement across geographies](/dynamics365/sales/sales-copilot-data-movement).

## Languages availability
To learn about the languages that are supported, see the [Copilot International Availability report](https://dynamics.microsoft.com/en-us/availability-reports/copilotreport/).
