---
title: Manage Copilot
description: Learn about the Copilot page in the Power Platform admin center for documents, insights, and controls related to Power Platform Copilots.
author: amchern
ms.component: pa-admin
ms.topic: concept-article
ms.date: 12/05/2024
ms.subservice: admin
ms.author: amchern
ms.reviewer: sericks
search.audienceType:
  - admin
---

# Manage Copilot

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The **Copilot** page is a centralized location in the Power Platform admin center for documents, insights, and controls relevant to Power Platform Copilots. Tenant admins can access educational resources about Copilot features, track usage, and access governance controls in one place by selecting **Copilot** in the navigation pane.

## Readiness 

Resources and documents to help admins better understand how Copilot works, data and security fundamentals for Copilot features, and Microsoft's Responsible AI principles are available in the **Readiness** section. These documents are updated over time as new Copilot capabilities are released. 

The **What’s new** web part lists new Copilot features as they're introduced or promoted to general availability. 

> [!Note]
> There may be a one or two week delay to updates made in the **What’s new** web part. The [Release plans](/dynamics365/release-plans/) and [Power Platform blogs](https://www.microsoft.com/power-platform/blog) are the best source to stay on top of new Copilot features. 

## Usage 

The usage metrics in the **Usage** section show monthly active users for each Copilot feature across Power Platform. _Active_ usage is defined as a session or interaction with Copilot. 

To learn more information on each feature, use the following links.

### Copilot Studio 

- Copilot: [AI-based copilot authoring overview](/microsoft-copilot-studio/nlu-gpt-overview)
- Generative answers: [Generative answers](/microsoft-copilot-studio/nlu-boost-conversations)
  
### Power Apps 

- Copilot for makers: [Build apps through conversation](/power-apps/maker/canvas-apps/ai-conversations-create-app)
- Copilot for apps: [Add Copilot for app users in model-driven apps](/power-apps/maker/model-driven-apps/add-ai-copilot) and [Add a Copilot Control to a canvas app](/power-apps/maker/canvas-apps/add-ai-copilot)
- App descriptions: [FAQ for generate app descriptions with Copilot](/power-apps/maker/common/ai-app-descriptions-faq)

### Power Automate  

- Cloud flow Copilot: [FAQ for Copilot in cloud flows](/power-automate/faqs-copilot)
- Process flow Copilot: [FAQ for Copilot in Power Automate Process Mining](/power-automate/faqs-copilot-in-process-mining)

### Power Pages 

- Maker Copilot: [Create an AI-generated webpage using Copilot](/power-pages/getting-started/create-page-copilot)

## Governance 

The **Governance** section displays the percentage of environments in your tenant that have specific Copilot features turned on or off. When selecting the Power Automate or Copilot Studio features, you'll find documentation with detailed information on that Copilot’s capabilities, prerequisites, and how to turn it on or off.  

Selecting the Power Platform Settings, Power Apps settings or **Manage settings** next to the governance header opens the settings panel where you can modify [tenant](../tenant-settings.md) and [environment-level Copilot settings](../settings-features.md#copilot-preview). Select your environment, your Power Platform product, and set your controls before selecting **Save**. 

> [!Note]
> There may be a delay of up to eight hours for data refresh.

## Content moderation 

The **Content moderation** section shows a count of queries that are blocked as part of Microsoft’s Responsible AI initiatives. For more information on content moderation, go to [How does Copilot block harmful content?](../../faqs-copilot-data-security-privacy.md#how-does-copilot-block-harmful-content)
