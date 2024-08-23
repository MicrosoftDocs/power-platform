---
title: Copilot page (preview)
description: Learn more about the Copilot page, a centralized location in the Power Platform admin center for documents, insights, and controls relevant to Power Platform Copilots. 
author: caitlinshaw1
ms.component: pa-admin
ms.topic: conceptual
ms.date: 08/23/2024
ms.subservice: admin
ms.author: caitlinshaw
ms.reviewer: sericks
search.audienceType:
  - admin
---

# Copilot page (preview)

[!INCLUDE [file-name](../../shared-content/shared/preview-includes/file-name.md)]

The Copilot page [preview] is a centralized location in the Power Platform admin center for documents, insights, and controls relevant to Power Platform Copilots. Tenant admins can access educational resources about Copilot features, track usage, and access governance controls in one place by selecting **Copilot** in the navigation pane.

## Readiness 

Resources and documents to help admins better understand and govern Copilots are available in the **Readiness** section. These documents are updated over time as new Copilot capabilities are released. The **What’s new** web part lists new Copilot features as they are introduced or promoted to general availability. 

> [!Note]
> There may be a one to two week delay to updates made in the **What’s new** web part. The [Release plans](/dynamics365/release-plans/) and [Power Platform blogs](https://www.microsoft.com/power-platform/blog) are the best source to stay on top of new Copilot features. 

## Usage 

The usage metrics in this section show monthly active users for each Copilot feature. “Active” usage is defined as a session and/or interaction with Copilot. 

For more information on each feature, refer to the links below: 

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

This section displays the percentage of environments in your tenant that have specific Copilot features enabled/disabled. Clicking on Power Automate or Copilot Studio features will lead you to documentation that includes detailed information on that Copilot’s capabilities, prerequisites, and how to enable/disable it.  

Clicking on Power Apps Copilots or “Manage Settings” next to the governance header will open the settings panel where you can modify tenant and environment level Copilot settings. Select your environment, your Power Platform product, and set your controls before selecting save. 

> [!Note]
> There may be a delay of up to 8 hours for data refresh of usage insights and select settings enablement statuses.

## Content moderation 

This section shows a count of queries that are blocked as part of Microsoft’s Responsible AI initiatives. For more information on content moderation, go to [How does Copilot block harmful content?](../faqs-copilot-data-security-privacy#how-does-copilot-block-harmful-content.md)
