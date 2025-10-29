---
title: Track, manage, and scale Copilot adoption in the Power Platform
description: Learn about the Copilot page in the Power Platform admin center for documents, insights, and controls related to Power Platform Copilots.
author: amchern
ms.component: pa-admin
ms.topic: concept-article
ms.date: 10/31/2025
ms.subservice: admin
ms.author: amchern
ms.reviewer: sericks
search.audienceType:
  - admin
contributors:
  - jordanchodak
  - JesseParsons
---

# Track, manage, and scale Copilot adoption in the Power Platform

The **Copilot** area in the Power Platform admin center is a centralized location for usage and cost insights, upcoming features, learning documents, and granular controls to scale Copilot and agent adoption in Power Platform. Tenant admins and environment admins can access these resources in one place by selecting **Copilot** in the navigation pane.

# [New admin center](#tab/new)

When you select **Copilot** in the navigation pane, you can select the following pages in the **Copilot** pane of the Power Platform admin center.

## Get started

The **Get started** page provides resources and documents to help admins better understand how Copilot works, data and security fundamentals for Copilot features, and Microsoft's Responsible AI principles. Microsoft updates these documents over time as new Copilot capabilities are released.

## What's new

The **What’s new** page in the **Copilot** area provides admins with a centralized location to view notifications and updates about upcoming AI capabilities. Admins can learn about the capability, how it impacts their organization, and prepare environment configurations for the new capability. It also includes capabilities that recently became available.

## Settings

The **Settings** page displays settings grouped by product. Some settings span across Power Platform and appear at the top in the **Power Platform** section. You can configure settings at the environment level, with some settings also configurable through environment groups and rules. When you select a setting, a panel opens where you can select your environment, select **Add**, and configure the control. Some settings in the Copilot Studio product direct you to documentation with instructions on how you can configure a data loss prevention (DLP) policy.

> [!NOTE]
> Tenant users with environment access can view Copilot settings.

### Control who can use AI features in model-driven apps (preview)
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-banner-section.md)]
[!INCLUDE [file-name](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

Admins can define who within an environment can use Copilot capabilities in model-driven apps&mdash;either by explicitly allowing specific users or allowing all users except a defined exclusion list. This capability is currently in preview and is only for environments activated for [Managed Environments](../managed-environment-enable.md), with a subset of Copilot features adhering to it. Review the following table to learn which capabilities adhere to this configuration.

| Product | Feature |
|---------|---------|
| Dynamics 365 Sales | [Lead summary](/dynamics365/sales/copilot-configure-summary-fields) |
| Dynamics 365 Sales | [Opportunity summary](/dynamics365/sales/copilot-configure-summary-fields) |
| Dynamics 365 Sales | [Copilot in Dynamics 365 Sales](/dynamics365/sales/enable-setup-copilot) |
| Power Apps | [Copilot chat](/power-apps/user/use-copilot-model-driven-apps)|
| Power Apps | [Form fill assistance](/power-apps/user/form-filling-assistance#use-form-fill-assistance) |
| Power Apps | [Smart paste](/power-apps/user/form-filling-assistance#use-smart-paste-preview) |
| Power Apps | [Row summary](/power-apps/user/record-summaries) |
| Power Apps | [Visualize with Copilot](/power-apps/user/visualize-data-in-copilot)|
| Power Apps | [Natural language search and filtering](/power-apps/user/find-data-with-ai) |

## Product pages
The product pages contain usage and cost insights specific to each product. Currently, there are product pages for **Copilot Studio**, **Power Apps**, and **Power Pages**.

### Copilot Studio

The **Copilot Studio** page provides valuable insights about agents built in Copilot Studio. Admins can view message consumption data, with more licensing details available through the **Licensing** area of the Power Platform admin center. Admins can view the number of active agents, defined as agents with active sessions in the last 28 days, and the agent session success rate, which is the percentage of sessions resolved by conversational agents or runs that are successful for autonomous agents. The agent table displays the top 10 agents ranked by monthly active sessions.

> [!NOTE]
> - The **Copilot Studio** page doesn't include agents built with the lite version of Copilot Studio at this time.
> - During the initial weeks of rollout, data is populated over a 28-day lookback period, resulting in an incomplete month initially.

### Power Apps

Admins can view usage analytics for the data entry agent and data exploration agent on the **Power Apps** page to understand the value that end users are getting from AI in Power Apps. The page includes monthly active user count information for each agent, and the number of actions taken. For the data entry agent, this action count is the number of forms where Copilot helped provide information. For data exploration agent, this action count is for the number of natural language queries that users have entered to search and filter their grid view using natural language. Furthermore, admins can look into each agent by selecting them from the bottom table view. This opens a panel where you can see top environments and investigate those to see apps where users are interacting with each agent the most.

> [!NOTE]
> During the initial weeks of rollout, data is populated over a 28-day lookback period, resulting in an incomplete month initially.

### Power Pages

Power Pages now has a dedicated experience within the **Copilot** area of the Power Platform admin center, allowing tenant administrators to monitor and manage AI-powered features specific to website creation and usage. This integration provides visibility into how makers use AI to build sites and how end users interact with AI components on live sites.

Admins can access detailed usage analytics and apply governance controls tailored to Power Pages, ensuring responsible and effective use of Copilot features across environments and individual sites.

### Dynamics 365 Sales

Admins can view usage analytics for Copilot in Dynamics 365 Sales on the **Dynamics 365 Sales** page to understand the value that end users get from AI in Dynamics 365 Sales. The page includes monthly active user count information for Copilot in Dynamics 365 Sales, and the number of actions taken. Furthermore, admins can perform an in-depth analysis of Copilot by selecting it from the bottom table view. This selection opens a panel where you can see top environments and drill into those environments to see apps where users interact with Copilot the most.

# [Classic admin center](#tab/classic)

## Get ready to manage Copilot and agents

Resources and documents to help admins better understand how Copilot works, data and security fundamentals for Copilot features, and Microsoft's Responsible AI principles are available in the **Get ready to manage Copilot and agents** section. These documents are updated over time as new Copilot capabilities are released.

The **What’s new** web part lists new Copilot features as they're introduced or promoted to general availability.

> [!NOTE]
> There might be a one or two week delay to updates made in the **What’s new** web part. The [Release plans](/dynamics365/release-plans/) and [Power Platform blogs](https://www.microsoft.com/power-platform/blog) are the best source to stay on top of new Copilot features.

## Usage

The usage metrics in the **Usage** section show monthly active users for each Copilot feature across Power Platform. _Active_ usage is defined as a session or interaction with Copilot.

To learn more about each feature, use the following links.

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

The **Governance** section shows the percentage of environments in your tenant that have specific Copilot features turned on or off. When you select the Power Automate or Copilot Studio features, you see documentation with detailed information on that Copilot's capabilities, prerequisites, and how to turn it on or off.  

When you select the Power Platform Settings, Power Apps settings, or **Manage settings** next to the governance header, you open the settings panel where you can modify [tenant](../tenant-settings.md) and [environment-level Copilot settings](../settings-features.md#copilot-preview). Select your environment, your Power Platform product, and set your controls before selecting **Save**.

> [!NOTE]
> Data refresh can take up to eight hours.
