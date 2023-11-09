---
title: Use plugin actions in Microsoft Copilot Studio (preview)
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

# Create and configure plugins (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Create plugins in Microsoft Copilot Studio that can be used in your copilots to call connected services, perform actions, and provide answers for your copilot users without needing to manually author complex conversation flows. 


Plugins are discrete, reusable building blocks that work across Power Platform, Dynamics 365, and Microsoft 365. All of the plugins within your <mark>environment? tenant? dataverse environment?</mark> are shared from a central plugin registry. This means that when you create or change a plugin and publish it, the changes are pushed to all of your copilots that use the plugin (unless you have [created a local override for individual copilots](#)).

When you create a plugin, you use simple language to describe what the plugin should do, and then provide a data source or additional connection that the copilot should use when it determines the plugin should be used in a conversation. The copilot uses the plugin's description to determine when the plugin would be most useful, and will automatically ask the user for any additional information it needs for the plugin to work.


This means you can create complex-seeming conversations without needing to manually create and design complex conversation flows with multiple question nodes in the authoring canvas.

There are two categories of plugin:

- Conversational plugins, which are similar to standard topics in Copilot Studio that you use to create a functional copilot. Admins enable these plugins in your tenant's instance of Microsoft Copilot so they can be used across your entire tenant.
- AI plugins, which let you connect your copilot to data or perform activities as [plugin actions within Copilot Studio](advanced-plugin-actions.md).

Both categories of plugin can be authored and edited in Copilot Studio. You can also [create and edit AI plugins in Power Apps](#aib doc, Angie).

During this preview, you can create AI plugins from:

- <mark>AI Builder dynamic prompts</mark>
- <mark>Power Automate flows</mark>
- [Power Platform connectors](/connectors/connectors)
- <mark>OpenAI plugins</mark>



## Related topics

| Topic | Description |
|-|-|
| [Create conversational plugins for Microsoft Copilot (preview)](copilot-conversational-plugins.md)| Create plugins that can respond to a user's question with additional data.|
| [Create AI plugins for Microsoft Copilot (preview)](copilot-ai-plugins.md)
| [Use plugin actions in Microsoft Copilot Studio (preview)](advanced-plugin-actions.md) | 
| [Power Platform connectors](copilot-connector-plugins.md) | Doc on this from AI plugins.docx
| [OpenAI plugins](copilot-openai-plugins.md) | Doc on this
| [Power Automate plugins](copilot-flow-plugins.md) | Docs on this
| [AI Builder dynamic prompts] | Doc on this