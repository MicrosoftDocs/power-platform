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

# Create and configure copilot plugins (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]



Create plugins in Microsoft Copilot Studio that can be used in your copilots to call connected services, perform actions, and provide answers for your copilot users without needing to manually author complex conversation flows. 

This article gives an overview of the ways you can create and use copilot plugins. To see the end to end work flow for creating, publishing, and using plugins in Microsoft Copilot

Plugins are discrete, reusable building blocks that work across Power Platform, Dynamics 365, and Microsoft 365. All of the plugins within your [Microsoft 365 tenant](/microsoft-365/solutions/tenant-management-overview?view=o365-worldwide#a-microsoft-365-tenant-defined) are shared from a central plugin registry in Dataverse. This means that when you create or change a plugin and publish it, the changes are pushed to all of your copilots that use the plugin.

When you create a plugin, you use simple language to describe what the plugin should do, and then provide a data source or additional connection that the copilot should use when it determines the plugin should be used in a conversation. The copilot uses the plugin's description to determine when the plugin would be most useful, and will automatically ask the user for any additional information it needs for the plugin to work.

For example, say you've built an app to manage leads. You add a copilot to improve the efficiency of end users when using the app; in particular, you want to streamline the creation of leads from contacts and help users get insights into the next actions they should take.

However, when your copilot user says to the copilot "Create a new lead from this contact" or "What are the key things I need to do?" the copilot doesn't have the information to correctly answer the question or create the lead.

Instead of manually designing a conversation flow within the copilot to account for these scenarios, you create and connect the following plugins to the copilot:    
- A Power Automate flow plugin which takes the contact data provided by the copilot user to create the lead.
- A prompt plugin to provide a summary from the latest conversations the copilot user has had with the contact.

Now when the copilot user asks to create a lead, the flow plugin will be triggered and the lead will be created from the data already provided by the user. The use can also ask for an abstract or summary, which will trigger the prompt plugin and return a summary of actions.

## Plugin categories

There are two categories of plugin:

- Conversational plugins, which are similar to standard topics in Copilot Studio that you use to create a functional copilot. 
- AI plugins, which let you connect your copilot to data or perform activities . <!--as [plugin actions within Copilot Studio](advanced-plugin-actions.md).-->

Both categories of plugin can be authored and edited in Copilot Studio. You can also create and edit some types of AI plugins in Power Apps.


## Create plugins

During this preview, you can create AI plugins in multiple places across Power Platform and Microsoft Copilot Studio.

AI plugin type | Creation in Copilot Studio | Creation in Power Platform
- | - | -
AI builder dynamic prompts | [Create AI plugins for Microsoft Copilot](copilot-ai-plugins.md) | [Create a custom prompt (preview) in Power Automate or Power Apps](/ai-builder/create-a-custom-prompt?branch=pr-en-us-766) 
Power Automate flows | [Create Power Automate flow plugins in Copilot Studio](copilot-flow-plugins.md) | Not available
Power Platform custom connectors | [Create a connector AI plugin (preview) in](/connectors/create-a-connector-ai-plugin?branch=pr-en-us-1461)
OpenAI plugins | [Create OpenAI plugins in Copilot Studio](copilot-openai-plugins.md) | Not available |


## Enable plugins Microsoft Copilot


The plugins will automatically appear for your tenant's users to enable in their version of Microsoft Copilot if your tenant's admin has  copilots if the Dynamics 365 and Admins enable these plugins in the Microsoft Admin Center so they can be used across your entire tenant.

End users in your tenant can use plugins you've created in their chats with Microsoft Copilot if:

1. Your Microsoft 365 tenant admin has <mark>[deployed the Dynamics 365 and Copilot Studio app in the Microsoft 365 admin center](#).</mark>
1. Your Power Platform environment admin has <mark>[enabled the M365 Copilot setting in the Power Platform admin center](#).</mark>
1. The <mark>[end user has enabled the connection from within their chat with Microsoft Copilot](#)</mark>.
1. 
1. 
1. has already a connection, the plugins will show up in Copilot plugin flyout. If not, the user will need to create a connection. This can be done by directly visiting the Power platform Copilot plugins configuration portal.
In addition, the user can ask Copilot about plugins, which will return a response with a link to the portal:
•	How can I use a plugin?
•	Tell me about Power platform Copilot plugins
•	How can I get data from an external system?
•	How can I get data from Salesforce?

 
User can visit the link where they can enable the plugins they want:
 
The same portal can be used to enable Power Automate flows supported for Copilot:
 





## Related topics

| Topic | Description |
|-|-|
| [Create conversational plugins for Microsoft Copilot (preview)](copilot-conversational-plugins.md)| Create plugins that can respond to a user's question with additional data.|
| [Create AI plugins for Microsoft Copilot (preview)](copilot-ai-plugins.md)
| [Use plugin actions in Microsoft Copilot Studio (preview)](advanced-plugin-actions.md) | 
| [Power Platform connectors](copilot-connector-plugins.md) | Doc on this from AI plugins.docx
| [OpenAI plugins](copilot-openai-plugins.md) | Doc on this
| [Power Automate plugins](copilot-flow-plugins.md) | Docs on this
| [AI Builder dynamic prompts](/ai-builder/create-a-custom-prompt?branch=pr-en-us-766) | 