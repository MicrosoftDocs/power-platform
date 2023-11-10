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



Create plugins in Microsoft Copilot Studio that can be used in your copilots across Microsoft products to call connected services, perform actions, and provide answers for your copilot users without needing to manually author complex conversation flows. 

Due to the cross-functional nature of copilot plugin building, the Microsoft 365 tenant and the Power Platform environment are connected when you [enable the M365 Copilot setting in the Power Platform admin center](#). 

This allows you to use plugins in Microsoft Copilot for Microsoft 365 that leverage data and connections across Dynamics 365, Power Platform, and Microsoft 365.

This article gives an overview of the ways you can create and use copilot plugins, and provides links for individual configuration steps.

To get started creating, publishing, and using plugins in Microsoft Copilot, see the [Quickstart guide for creating plugins in Microsoft Copilot Studio](copilot-plugins-quickstart.md).

## Prerequisites

- You'll need an account for Microsoft Copilot Studio. 

    > [!NOTE]
    >  
    > If you don't have a Microsoft Copilot Studio account, or you haven't created chatbots with Microsoft Copilot Studio before, see the [Quickstart guide for building bots with GPT](nlu-gpt-quickstart.md).

- You'll also need:
  - Admin access to [A Microsoft 365 tenant](/microsoft-365/solutions/tenant-management-overview?view=o365-worldwide) <mark>need roles</mark>
  - Admin access to [A Power Platform environment](/power-platform/admin/environments-overview) <mark>need roles</mark>


  ## Copilot plugins

Plugins are discrete, reusable building blocks that work across Power Platform, Dynamics 365, and Microsoft 365. All of the plugins within your [Microsoft 365 tenant](/microsoft-365/solutions/tenant-management-overview?view=o365-worldwide#a-microsoft-365-tenant-defined) are shared from a central plugin registry in Dataverse. This means that when you create or change a plugin and publish it, the changes are pushed to all of your copilots that use the plugin.

When you create a plugin, you use simple language to describe what the plugin should do, and then provide a data source or additional connection that the copilot should use when it determines the plugin should be used in a conversation. The copilot uses the plugin's description to determine when the plugin would be most useful, and will automatically ask the user for any additional information it needs for the plugin to work.

For example, say you've built an app to manage leads. You add a copilot to improve the efficiency of end users when using the app; in particular, you want to streamline the creation of leads from contacts and help users get insights into the next actions they should take.

However, when your copilot user says to the copilot "Create a new lead from this contact" or "What are the key things I need to do?" the copilot doesn't have the information to correctly answer the question or create the lead.

Instead of manually designing a conversation flow within the copilot to account for these scenarios, you create and connect the following plugins to the copilot:    
- A Power Automate flow plugin which takes the contact data provided by the copilot user to create the lead.
- A prompt plugin to provide a summary from the latest conversations the copilot user has had with the contact.

Now when the copilot user asks to create a lead, the flow plugin will be triggered and the lead will be created from the data already provided by the user. The use can also ask for an abstract or summary, which will trigger the prompt plugin and return a summary of actions.

### Plugin categories and types

There are two categories of plugin:

- Conversational plugins, which are similar to standard topics in Copilot Studio that you use to create a functional copilot. 
- AI plugins, which let you connect your copilot to data or perform activities. 

Both categories of plugin can be authored and edited in Copilot Studio. 

You can also create and edit some types of AI plugins in Power Apps, indicated in the following table:

AI plugin type | Creation in Copilot Studio | Creation in Power Platform
- | - | -
AI builder dynamic prompts | [Generate content or extract insights with AI Builder dynamic prompts](copilot-ai-plugins.md#prompts) | [Create a custom prompt (preview) in Power Automate or Power Apps](/ai-builder/create-a-custom-prompt?branch=pr-en-us-766) 
Power Automate flows | [Create custom automation with Power Automate flows](copilot-ai-plugins.md#flow) | Not available
Power Platform custom connectors | [Update or get answers about external data with connectors](copilot-ai-plugins.md#connectors) | [Create a connector AI plugin (preview) in Power Automate or Power Apps](/connectors/create-a-connector-ai-plugin?branch=pr-en-us-1461)
OpenAI plugins | [Add an OpenAI plugin](copilot-ai-plugins.md#openai) | Not available |

During this preview, you can use plugins in Microsoft Copilot. You can't use plugins in custom copilots that you build with Microsoft Copilot Studio.

## Use plugins in Microsoft Copilot


End users in your tenant can use the plugins in their chats with Microsoft Copilot if:

1. Your Microsoft 365 tenant admin has <mark>[deployed the Dynamics 365 and Copilot Studio app in the Microsoft 365 admin center](#).</mark>
1. Your Power Platform environment admin has <mark>[enabled the M365 Copilot setting in the Power Platform admin center](#).</mark>
1. The <mark>[end user has enabled the connection from within their chat with Microsoft Copilot](#)</mark>.

**To deploy the Dynamics 365 and Copilot Studio app:**

1. Sign in to the Microsoft 365 admin center with your admin account.
2.	Expand **Settings** on the side navigation pane and select **Integrated apps**.
3.	Go to the **Available apps** tab and select the entry **Dynamics 365 and Copilot Studio**. The app's details pane opens.
4. Select **Deploy** to enable the app in chats with Microsoft Copilot.

**To enable the M365 Copilot setting:**

1. Sign in to the Power Platform admin center at https\://admin.powerplatform.microsoft.com with your admin account.
2.	Select **Environments** on the side navigation pane and select **Integrated apps**.
3.	Go to the **Available apps** tab and select the entry **Dynamics 365 and Copilot Studio**. The app's details pane opens.
4. Select **Deploy** to enable the app in chats with Microsoft Copilot.


<mark>
If not, the user will need to create a connection. This can be done by directly visiting the Power platform Copilot plugins configuration portal.
In addition, the user can ask Copilot about plugins, which will return a response with a link to the portal:
•   How can I use a plugin?
•   Tell me about Power platform Copilot plugins
•   How can I get data from an external system?
•   How can I get data from Salesforce?

 
 User can visit the link where they can enable the plugins they want:
  
  The same portal can be used to enable Power Automate flows supported for Copilot:</mark>
 





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