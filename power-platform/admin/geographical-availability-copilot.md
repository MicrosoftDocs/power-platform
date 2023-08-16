---
title: Enable copilots and generative AI in non-US regions
description: Description about this article.
author: sidhartg
ms.component: pa-admin
ms.topic: conceptual
ms.date: 07/21/2023
ms.subservice: admin
ms.author: sidhartg
ms.reviewer: sericks
search.audienceType: 
  - admin 
---
# Enable copilots and generative AI features in non-US regions

With copilots and generative AI features in Power Platform and Dynamics 365, you can build apps, flows, pages, chatbots, ask questions about your data, summarize information, reply to chat and email messages, generate content ideas, and get general answers related to the product.

These capabilities are currently available in environments in the US region and support the English language. This feature allows you to try the copilot and generative features across Power Platform and Dynamics 365 customer engagement environments is non-US regions.

> [!NOTE]
> - The underlying infrastructure for copilots is currently available in the US region only. Accessing copilots or generative AI features from non-US regions results in **data movement across regional boundaries**. Once enabled, any data movement that already happened while this feature was enabled cannot be reversed by [removing your consent](#disable-copilots-and-generative-ai-in-non-us-regions).
> - This setting is only available in a Power Platform environment that is created in regions other than **United States - Default** and **Preview (United States)**. To enable or disable copilot features in environments created in **United States – Default** or **Preview (United States)** regions, refer to the [documentation for the applicable product](#geographical-availability-of-copilots-and-generative-ai-features). 

You can allow copilots in your non-US environments by following these steps:

1. Open [Power Platform admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments** from the left-pane.

1. Select your environment.

1. From the right-side of the screen, select **Edit** on the **Allow data movement across regions for AI features** card.

    ![Select **Edit** on the **Allow data movement across regions for AI features** card.](media/allow-data-movement.png)

1. Read the information on the panel and select the check mark to consent to the terms of use.

    ![Select the check mark to consent to the terms of use.](media/terms-of-use.png)

1. Select **Enable**.

    After you consent, the status on the **Allow data movement across regions for AI features** card shows **Allowed** and copilots and generative AI features are enabled in the environment.

## Disable copilots and generative AI in non-US regions

You can disable the copilots and generative AI features in non-US environments by following these steps.

> [!IMPORTANT]
> Any data movement that happened while this feature was enabled cannot be reversed by removing your consent.

1. Open [Power Platform admin center](https://admin.powerplatform.microsoft.com).

1. Select **Environments** from the left-pane.

1. Select your environment.

1. From the right-side of the screen, select **Edit** on the **Allow data movement across regions for AI features** card.

1. Clear the terms of use check mark.

1. Select **Disable**.

    After you remove your consent, the status on the **Allow data movement across regions for AI features** card shows **Not allowed** and copilots and generative AI features are disabled in the environment.

## Geographical availability of copilots and generative AI features

Currently all the Power Platform and Dynamics 365 copilots and generative features are available in the US region only. As the required infrastructure is available across other regions, copilots and generative AI features can be accessed from the same data boundary and opt-in consent is not required.

The following table indicates the availability of copilots and generative AI features in non-US environments.

| Product | Feature  | Regions available without consent | Available in non-US region with consent | Language support |
|-------------------------|-------------------------|-------------------------|-------------------------|-------------------------|
| Dynamics 365 Marketing | **Content Ideas: Generate engaging email content**</br>[Use Copilot to generate email content ideas](/dynamics365/marketing/content-ideas) | US | No | English |
| Dynamics 365 Marketing  | **Query Assist: Natural language to segment**</br>[Target the right customers using the query assist copilot](/marketing/real-time-marketing-natural-language-segments) | US | No | English |
| Dynamics 365 Customer Insights | **Dialog with Data**</br>[Have a dialog with data using Copilot in Customer Insights (preview)](/dynamics365/customer-insights/dialog-with-data) | US | No | English |
| Sales Copilot | **Meeting summary follow-up email**<br /></br>[Create a sales meeting summary email](https://support.microsoft.com/topic/use-copilot-to-kickstart-email-messages-148708be-e1f9-477c-baba-0b4dd4b7abef#bkmk-meeting-summary-ai-reply) | US | No | English |
| Dynamics 365 Finance | **Collections Copilot: Collections timeline summary from workspace**</br>[Collections coordinator summary](/dynamics365/finance/accounts-receivable/collectionscoordinatorsummary) | US | No | English |
|Project Operations | **Project issues and risks tracking information<br /></br>**[Project management Copilot overview](/dynamics365/project-operations/project-management/copilot-features) | US | No | English |
|Project Operations | **Project status reports<br /></br>**[Project management Copilot overview](/dynamics365/project-operations/project-management/copilot-features) | US | No | English |
| Project Operations | **Project WBS generation<br /></br>**[Project management Copilot overview](/dynamics365/project-operations/project-management/copilot-features) | US | No | English |
| Dynamics 365 Customer Service | **Digital messaging with Copilot**<br /></br>[Draft a chat response](/dynamics365/customer-service/use-copilot-features#draft-a-chat-response) | US | Yes | English |
| Dynamics 365 Customer Service | **Auto-Draft Email**<br /></br>[Draft emails](/dynamics365/customer-service/use-copilot-features#draft-emails) | US | Yes | English |
| Dynamics 365 Customer Service | **Converse with Copilot**</br>[Ask a question](/dynamics365/customer-service/use-copilot-features#ask-a-question) | US | Yes | English |
| Dynamics 365 Customer Service | **Conversation summarization**</br>[Summarize conversations](/dynamics365/customer-service/use-copilot-features#summarize-conversations) | US | Yes | English |
| Dynamics 365 Customer Service | **Case summarization**<br /></br>[Summarize cases](/dynamics365/customer-service/use-copilot-features#summarize-cases) | US | Yes | English |
| Nuance Mix (VA, IVR) | **Consumer Assist (Bing/GPT fallback)**</br>(doc link) | US | No | English |
|  Nuance Mix (VA, IVR) | **AppDev Assist (NL2Bot)**</br>(doc link) | US | No | English |
|Microsoft Supply Chain Center | **Contact Suppliers**</br>[Supplier news communication](/supply-chain-platform/supply-chain-center/use/supplier-news-communication) | US | No | English |
| Dynamics 365 Supply Chain Management | **Copilot for Procurement: Summarize and handle PO changes in Dynamics 365 SCM Hub**</br>Learn more: [Review and accept changes to confirmed purchase orders](/dynamics365/supply-chain/procurement/purchase-order-changes-after-confirmation) | US | No | English |
| Business Central| **AI-Generated Product Descriptions**<br /></br>[AI-powered item marketing text with Copilot](/dynamics365/business-central/ai-overview) | US | No | English |
| Dataverse | **Dataverse Service for Copilot for M365 BizChat and BAP business applications<br /></br>**(doc link) | US | No | English |
| Dataverse | **Excel to Table for New Makers<br /></br>**(doc link) | US | No | English |
| Dataverse | **M365 Biz Chat Q&amp;A and Actions with Dataverse Connectors**</br>(doc link) | US | No | English |
| AI Builder | **Text Generation with GPT**<br /></br>[Text generation model overview (preview)](/ai-builder/prebuilt-azure-openai) | US | No | English |
| Power Apps | **Maker Copilot (NL2Table)**<br /></br>Learn more: [Build apps through conversation](/power-apps/maker/canvas-apps/ai-conversations-create-app) | US | No | English |
| Power Apps | **Maker Copilot: (NL2Edit)**</br>(doc link) | US | No | English |
|  Power Apps| **Copilot for canvas apps**<br><br>Learn more: [Add Copilot control to a canvas app](/power-apps/maker/canvas-apps/add-ai-copilot) | US | No | English |
| Power Apps | **App Copilot for model Power Apps and Dynamics 365**</br>(doc link) | US | No | English |
| Power Automate | **Power Automate Designer Copilot**</br>[Understand AI-powered cloud flows designer (preview)](/power-automate/flows-designer) | US | No | English |
| Power Pages| **C2 Copilot (Power Virtual Agents Chatbot)**<br /><br />Learn more: [Enable chatbot in a Power Pages site](/power-pages/getting-started/enable-chatbot) | US | No | English |
| Power Pages | **Create form in webpage**<br /><br />Learn more: [Create AI-generated form using Copilot](/power-pages/getting-started/add-form-copilot) | US | No | English |
| Power Pages | **Create text in webpage**<br /><br />Learn more: [Add AI-generated text using Copilot](/power-pages/getting-started/add-text-copilot) | US | No | English |
| Power Pages| **Create website page**<br /><br />(doc link) | US | No | English |
| Power Virtual Agents | **Generative answers**</br>[Generative answers](/power-virtual-agents/nlu-boost-conversations) | US | No | English |
| Power Virtual Agents | **Power Virtual Agents Copilot**</br>[Create (end edit) with Copilot)](/power-virtual-agents/nlu-authoring) | US | No | English |

### See also

[Troubleshoot missing environments](troubleshoot-missing-environments.md)

