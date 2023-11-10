---
title: Enable copilots and generative AI features
description: Learn about how to enable data movement across regions for copilots and generative AI features.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 11/10/2023
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

However, these features aren't available in all regions and languages. Depending on where your enviroment is hosted, you may need to enable data movement across regions to use them. This article explains how to do that.

## How data moveent across regions works

When you use copilots and generative AI features, **your inputs (prompts) and outputs (results) might move outside of your region**. That data is protected and secured at every step in ways that comply with all applicable privacy laws and regulations, such as the Europen Union data boundary. We might store it for up to 30 days to [monitor for abuse](/azure/ai-services/openai/concepts/abuse-monitoring), but we don't look at it unless our automated systems flag it for review.

The following table describes when and how data can move across regions for copilots and generative AI features.

| Region where your environment is hosted | Region where data is stored and processed | Does data move across regions? | How to allow data to move across regions|
|-------------------------|-------------------------|-------------------------|-------------------------|
| Australia (availability starting Nov 10, 2023)</br>United Kingdom (availability starting Nov 10, 2023)</br>United States | Within the respective geographical region | No | No action required. Data doesn't move across regions in this scenario.|
| Europe | Sweden or Switzerland | Yes | No action required. Data doesn't move outside the [EU Data Boundary](https://www.microsoft.com/en-us/trust-center/privacy/european-data-boundary-eudb) in this scenario.<br><br>Admins can clear the [**Move data across regions**](#enable-data-movement-across-regions) checkbox, if they want to. |
| France</br>Germany</br>Norway</br>Switzerland | Sweden or Switzerland | Yes | Complete the steps in [Enable data movement across regions](#enable-data-movement-across-regions). |
| Asia</br>Canada</br>India</br>Japan</br>South Africa</br>South America</br>South Korea</br>United Arab Emirates | United States | Yes | Complete the steps in [Enable data movement across regions](#enable-data-movement-across-regions). |

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
   > Movement of data across regions complies with all applicable privacy laws and regulations. Data movement can’t be reversed by clearing the **Move data across regions** checkbox.

## Copilots and generative AI features that are available when you enable data movement across regions
The following table lists copilots and generative AI features that are available in Power Platform environments when the **Move data across regions** checkbox is selected.

More copilots and generative AI features will be available in the future.

| Product | Feature  | Documentation
|-------------------------|-------------------------|-------------------------|
| Microsoft Dataverse | Excel to table for new makers | [Upload an Excel file (preview)](/power-apps/maker/data-platform/create-edit-entities-portal#upload-an-excel-file-preview) |
| Power Automate | Power Automate designer copilot | [Get started with Copilot in cloud flows (preview)](/power-automate/get-started-with-copilot) |

## Region and language support
Copilot and generative AI features of Power Platform and Dynamics 365 are supported differently in different regions.

For information about regions supported by Dynamics 365 copilots and generative AI features, see the following documentation:

- For Dynamics 36 Customer Insights - Data, see [Give consent to use Copilot in Customer Insights – Data](/dynamics365/customer-insights/data/copilot-global-consent).
- For Dynamics 365 Customer Service, see [Copilot data movement across geographies (preview)](/dynamics365/customer-service/copilot-data-movement).
- For Dynamics 365 Sales, see [Copilot data movement across geographies](/dynamics365/sales/sales-copilot-data-movement).

To learn about the languages that are supported, see the [Copilot International Availability report](https://dynamics.microsoft.com/en-us/availability-reports/copilotreport/).

