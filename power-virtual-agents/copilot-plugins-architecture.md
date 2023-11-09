---
title: The lifecycle of a plugin- from creation in Microsoft Copilot Studio to use in various copilots
description: Use plugin actions to extend the capabilities of your bots.
keywords: "PVA, plugin, connector, flow, automate"
ms.date: 09/29/2023
ms.service: power-virtual-agents
ms.topic: article
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: gapretty
ms.custom: plugin, connector, flow, advanced-authoring
ms.collection: virtual-agent
---

# Introduction

A **plugin** is a reusable piece of code that can perform a specific task or provide specific functionality for a copilot. For example, a plugin can help a copilot answer a natural language query, execute a workflow, connect to an external system, or provide topic-specific guidance. A **copilot** is a conversational or UX based assistant that helps users accomplish their tasks and goals in a specific domain or application.

A plugin, in this world, begins its life through the plugin authoring experience in the Microsoft Copilot Studio. Plugin Authoring is a feature of Microsoft Copilot Studio that allows users to create and edit plugins using a graphical user interface and publish them to Biz Apps Registry.

The main goal of the Pl registry is to enable users to create a plugin once and use it in many copilots by providing storage and management for metadata and execution information of plugins. This way, users can leverage the power and flexibility of plugins to enhance the capabilities and functionalities of copilots without writing code for each copilot separately. The various copilots interact with the Biz Apps registry to discover plugins and execution information that are available for a user. Therefore, AI plugins meet their ultimate purpose of being created once and reused many times.

# A plugin is born

![A screenshot of a computer Description automatically generated](media/image1.png)

Figure Plugin Authoring using Microsoft Copilot Studio

## Creator Layer

The Creator Layer is where users can create and edit plugins using Microsoft Copilot Studio. These Microsoft Copilot Studio supports four types of plugins: Prompt, Flow, Connector, and Topic.

- **Prompt** plugins are plugins that can answer natural language queries from users using natural language processing (NLP) and natural language generation (NLG) techniques. For example, a prompt plugin can answer a question like "What are the sales opportunities for ACME Corp?" by querying data in Microsoft Dataverse and generating a natural language response that can be customized (such as a bulleted list).

- **Flow** plugins are plugins that can execute multi-step workflows using Microsoft Power Automate. For example, a flow plugin can create a new contact in Microsoft Dynamics 365 after manager approval or send an email to a customer with a prescribed template.

- **Connector** plugins are plugins that can connect to external systems or data sources using Microsoft Power Platform connectors. For example, a connector plugin can connect to Salesforce or SAP using Power Platform connectors and retrieve or update data. Connector plugins can be certified connectors that are shared across tenants or environment-specific custom connectors.

- **Topic** plugins are single turn conversational threads between a user and a copilot that can be created to answer a specific user utterance. For example: a topic about store hours with a trigger phrase *check store hours* can return the store hours. These topics can still handle user utterances such as "see store opening hours" due to the power of LLMs.

## Business Applications and Power Platform Plugin Registry

The Plugin Registry stores and manages the plugin metadata and execution information. The main goal of the registry is to act as the single source for discovery of plugins authored from the Microsoft Copilot Studio. The registry can be used to discover integrated apps(used in Microsoft Admin center by M365 teams) available at a tenant level , and plugins available to a user (used by copilots on Microsoft copilot studio) thereby providing flexibility to the copilots for different altitudes of discovery . The registry surfaces plugins that the user has access to(a plugin's security is the same as that of the underlying artifact such as that of a flow) and can provide a customized list of plugins to a user based on their role.

## Copilot 

This is a sample set of the various copilots that integrate with the Biz Apps registry to consume plugins. These include Microsoft copilots for Dynamics 365 apps, Microsoft copilots for Teams, and custom copilots authored using Microsoft Copilot Studio. The list is expected to grow in the future as more first-party and third-party copilots are developed.

# A plugin is used in Microsoft Copilot 

![A screenshot of a computer Description automatically generated](media/image2.png)

Figure Plugin used in Microsoft Copilot

## Admin Layer

The administration layer is where administrators can use the Microsoft Admin Center to choose the Integrated Apps available for their tenant and allow, deploy or block them for specific or all users. An Integrated App can be comprised of many plugins. The apps available from Microsoft Copilot Studio created plugins are retrieved from the Biz Apps plugin registry and include:

- **Dynamics 365 and Microsoft Copilot Studio** - This includes Dynamics 365 plugins from various dynamics teams including Microsoft Dynamics 365 Sales, Microsoft Dynamics 365 Field Services as well as custom created prompt and topic plugins.

- **Power Automate**– This includes Power Automate flow plugins.

- **Connector specific \]**- A sample of Salesforce and SAP plugins are called out here. Every certified connector plugin created by Microsoft or ISVs shows up as their own Integrated App for fine grained management.

(Note that these app names are subject to modification.)

## Plugin Discovery and Execution

The Biz Apps plugin available to a user is a net of the plugins assigned to the user via deployed Integrated apps and the ones the user has access to. The plugins available to a user are discovered using the Biz Apps plugin registry for each user. Users are then free to further customize the plugins based on how they want to use the plugin flyout experience. The plugin execution information is also retrieved from the Biz Apps registry and carries with it the details on the runtime path to execute a plugin.

There are two runtime execution paths supported today:

1.  Plugins that are Dataverse based: These are Microsoft Dynamics 365 plugins that access or modify Dataverse data, Microsoft Copilot Studio Topic plugins, and prompt plugins. This path supports Microsoft Entra ID auth and the calls are made to the underlying system on behalf of the user.

2.  Plugins that use the the Power platform connector ecosystem. This helps execute connectors that provide access to internal systems, as well as external systems of record. This path supports explicit configuration of credentials per user such as Salesforce connection credentials that are then maintained per user.

If a user does not find a plugin to help with their task, they can choose to navigate to the Microsoft Copilot Studio to continue their authoring experience and create the perfect plugin that addresses their needs.

## Data/AI Layer

This represents the various data stores and systems where the data and business logic reside. They include Sales, Field Service and other Dynamics 365 products; Microsoft Copilot Studio; Power Automate; as well as external systems such as Salesforce and SAP (and others).

### Data and Control flows for some plugin types

For all the below flows, as a pre-requisite, an administrator uses the Microsoft Admin Center to configure the corresponding Integrated Apps and assigns them to users including the Copilot user referenced here. In these flows, we first see the **configuration phase** for a copilot user in Copilot for Teams. After the user signs in, the plugins applicable for that user are retrieved from the Plugin registry. The plugins that the user sees in their flyout will be the plugins that belong to the Integrated Apps their administrator has configured for them and the ones they have access to in the plugin registry. The user can then configure the plugins they want to use in the copilot experience in the flyout in their Copilot for Teams experience.

![A screenshot of a computer program Description automatically generated](media/image3.png)

Figure Flows for Dynamics 365 plugins

In the runtime flow for the Dynamics 365 plugins, the copilot user's utterance of *"Get opportunities for ACME corp"* is mapped by the orchestrator to a set of candidate plugins. A plugin from the Dyanmics 365 is found to be best candidate and then executed translating the user's utterance to SQL against the Dynamic data the user has access to. The results are then returned to the user. Teams copilot can additionally add data from M365 and summarize the results.

![A screenshot of a computer program Description automatically generated](media/image4.png)

Figure Flow for Microsoft Copilot Studio plugins

In the runtime flow for MCS prompt plugins, the user's utterance is again mapped to a plugin. In this case however the matching plugin is a prompt authored in Microsoft Copilot Studio. The prompt grounds data in Dataverse table Orders and calls into Open AI to summarize the results for order 123 and returns the summary to the user.

![A screenshot of a computer program Description automatically generated](media/image5.png)

Figure Flow for connector plugins

The configuration flow for Salesforce or other connector based plugins starts with a "Connect" experience in the flyout where the user can enter connection information for Salesforce. At runtime, the user utterance is mapped to a candidate plugin and this plugin is executed using the Power Platform Connector infrastructure. The results are then returned to the user.

# 

# A plugin is used in Microsoft Copilot Studio 

Microsoft Copilot Studio can be used to create copilots in addition to plugins. These copilots can be built by Dynamics 365 teams as well as third parties.

![A screenshot of a computer Description automatically generated](media/image6.png)

Figure A plugin is used in Microsoft Copilot Studio copilots

The creator layer has been discussed before. If one looks closely, the plugin discovery and execution as well as the Data/AI layer looks the same as Figure 2. The difference lies in the management of curation of plugins for the copilot which is done by the copilot creator who chooses among the various plugins available in their Dataverse environment.

### Data and Control flows for some plugin types

![A screenshot of a computer program Description automatically generated](media/image7.png)

Figure Flow for prompt plugin types in MCS

This is an example of a prompt plugin used from a copilot built on Microsoft Copilot Studio. The configuration flow includes a copilot creator curating the plugins for the copilot from the plugin registry. At runtime, the copilot user after authentication can summarize order 123 for Northwind traders. This results in mapping the utterance to candidate plugins- in this case the matching plugin is a prompt authored on Copilot Studio. The prompt uses data from Orders table in Dataverse and the results are summarized using OpenAI and the results are returned to the user.

# Conclusion

By authoring a plugin in Microsoft Copilot Studio, you can further the reach of your plugin across copilots in Microsoft Dynamics 365, Microsoft Copilot for Teams and other third-party copilots. A plugin reaches its utopia of being created once and serving multiple copilots.
