---
title: Track, manage, and scale Copilot adoption in the Power Platform
description: Learn about the Copilot page in the Power Platform admin center for documents, insights, and controls related to Power Platform Copilots.
author: amchern
ms.component: pa-admin
ms.topic: concept-article
ms.date: 05/12/2025
ms.subservice: admin
ms.author: amchern
ms.reviewer: sericks
search.audienceType:
  - admin
contributors:
  - jordanchodak
---

# Track, manage, and scale Copilot adoption in the Power Platform

[!INCLUDE[new-PPAC-banner](~/includes/new-PPAC-banner.md)]

The **Copilot** area in the Power Platform admin center is a centralized location for usage and cost insights, upcoming features, learning documents, and granular controls to scale Copilot and agent adoption in Power Platform. Tenant admins and environment admins can access these resources in one place by selecting **Copilot** in the navigation pane.

# [New admin center](#tab/new)

[This content is prerelease documentation and is subject to change.]

When you select **Copilot** in the navigation pane, the following pages are available for you to select in the **Copilot** pane of the Power Platform admin center.

## Get started 

Resources and documents to help admins better understand how Copilot works, data and security fundamentals for Copilot features, and Microsoft's Responsible AI principles are available in the **Get started** page. These documents are updated over time as new Copilot capabilities are released. 

## What's new

The **What’s new** page in the **Copilot** area provides admins with a centralized location to view notifications and updates about upcoming AI capabilities. Admins can learn about the capability, how it impacts their organization, and prepare environment configurations for the new capability. It also includes capabilities that have recently become available. 

## Settings

The **Settings** page displays settings grouped by product. Some settings span across Power Platform and are located at the top in the **Power Platform** section. Settings can be configured at the environment level, with some settings also configurable through environment groups and rules. Selecting a setting opens a panel where you can select your environment, select **Add**, and configure the control. Some settings in the Copilot Studio product direct you to documentation with instructions on how you can configure a data loss prevention (DLP) policy.

## Product pages 
The product pages contain usage and cost insights specific to each product. Currently, there are product pages for **Copilot Studio**, **Power Apps**, and **Power Pages**.

### Copilot Studio

The **Copilot Studio** page provides valuable insights about agents built in Copilot Studio. Admins can view message consumption data, with additional licensing details available through the **Licensing** area of the Power Platform admin center. Admins can view the number of active agents, defined as agents with active sessions in the last 28 days, and the agent session success rate, which is the percentage of sessions resolved by conversational agents or runs that are successful for autonomous agents. Furthermore, the agent table displays the top 20 agents ranked by monthly active sessions.  

> [!Note]
> - The **Copilot Studio** page doesn't include agents built with Microsoft 365 Agent Builder at this time.
> - During the initial weeks of rollout, data is populated over a 28-day lookback period, resulting in an incomplete month initially.

### Power Apps

Admins can view usage analytics for the data entry agent and data exploration agent on the **Power Apps** page to understand the value that end users are getting from AI in Power Apps. The page includes monthly active user count information for each agent, as well as the number of actions taken. For the data entry agent, this action count is the number of forms where Copilot assisted in filling in information. For data exploration agent, this action count is for the number of natural language queries that users have entered to search and filter their grid view using natural language. Furthermore, admins can deep dive into each agent by selecting them from the bottom table view. This opens a panel where you can see top environments and drill into those to see apps where users are interacting with each agent the most. 

> [!Note]
> During the initial weeks of rollout, data is populated over a 28-day lookback period, resulting in an incomplete month initially.

### Power Pages

Power Pages now has a dedicated experience within the **Copilot** area of the Power Platform admin center, allowing tenant administrators to monitor and manage AI-powered features specific to website creation and usage. This integration provides visibility into how makers use AI to build sites and how end users interact with AI components on live sites. 

Admins can access detailed usage analytics and apply governance controls tailored to Power Pages, ensuring responsible and effective use of Copilot features across environments and individual sites. 

# [Classic admin center](#tab/classic)

## Get ready to manage Copilot and agents

Resources and documents to help admins better understand how Copilot works, data and security fundamentals for Copilot features, and Microsoft's Responsible AI principles are available in the **Get ready to manage Copilot and agents** section. These documents are updated over time as new Copilot capabilities are released. 

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
