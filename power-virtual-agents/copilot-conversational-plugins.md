---
title: Create conversational plugins for Microsoft Copilot (preview)
description: "Using Microsoft Copilot Studio to publish a topic as an Microsoft Copilot Enabled App within Microsoft Copilot"
ms.reviewer: jameslew
ms.date: 11/14/2023
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.collection: virtual-agent
ms.service: power-virtual-agents
searchScope:
  - "Power Virtual Agents"
---

# Create conversational plugins for Microsoft Copilot (preview)

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Microsoft Copilot provides out of the box experiences to engage with content and resources from across your organization. In some situations answers and interaction with external systems are required. With Microsoft Copilot Studio, you can author a conversational topic that can be published to the Microsoft Copilot catalog as a Copilot Enabled App, and once approved by your Tenant Admin, can be added to you and your orgnization's Microsoft Copilot Chat experiences.

For this preview, you will be able to create a conversational plugin that recieves the user's query (stored in the **Activity.Text** variable), processes it by completing one or more operations and then send one or more responses back to the user in the Microsoft Copilot chat.

>[!IMPORTANT]
>  
> You can't use conversational plugins that you've created in Microsoft Copilot Studio as a [plugin action](advanced-plugin-actions.md).

## What is a Copilot Enabled App and how does it work?

Microsoft Copilot's conversational system uses orchestration logic and large langauge models to help the user achieve their goals by interpreting their request, determining the best course of action, and then activating the appropriate system, component, plugin, or series of components to achieve the goal, finally returning a generated result to the user.

A conversational plugin built in Microsoft Copilot Studio enables you to extend the behavior of the Microsoft Copilot by authoring a conversational plugin for some capbility the Microsoft Copilot doesn't natively have such as calling a specific API, or applying some sophisticated business logic, or accessing one or more data sources that requires additional configuration ouside of what the Microsoft Copilot has access to.

Unlike a traditional component model, instead of creating a hard-coded integration point with the copilot, a maker will create a conversational plugin in Microsoft Copilot Studio and then provide descriptive text to tell the orchestrator about what the plugin can do and what it needs to know to do so, such that orchestrator can make it's own decision about when the plugin would be most useful and ask the user appropriate questions to fill plugin parameters.

## Prerequisites

- End users must have a license to use the Microsoft Copilot 
- The Microsoft Copilot Studio application must be a Microsoft Copilot Studio Copilot not a PVA "Classic" bot
- Before end to end will work, M365 Tenant Admin will need to have enabled the **Dynamics and Microsoft Copilot Studio** Integrated Apps category in the Microsoft Admin Center

> [!IMPORTANT]
> In this preview, there are some limitations to be aware of:
> 1. Your topic will not be able to interact (ask questions of) the user, and can only process the incoming query from the user (in the variable **Activity.Text**) and send a response.
> 1. Responses will be limited to text, no media or adaptive cards will be supported
> 1. In this preview Copilot Studio will not be able to authenticate the user, so sharepoint/onedrive sources for generative answers will not be functional.
> 1. This preview will be limited to English language copilots.
> 1. All users of Microsoft Copilot within your organization will be able to interact with the copilot, the copilot will not support authenticting the user itself
> 1. If your Dataverse Environment has a security group assigned, users not within that Security Group will not be able to access the plugin in Microsoft Copilot

## Creating a basic Converational Plugin to publish to Microsoft Copilot

Your topic that will be used within Microsoft Copilot chat will use the System variable **Activity.Text** as an input that represents the user's question in Microsoft Copilot, process it in some way (such as passing it to **Generative Answers**), and then returning the result via one or more messages. These could include the response that comes from **Generative Answers**, or **Send a Message** nodes. Multiple messages can be included sent separately to form the output.

The steps below will take you through creating a new Conversational Plugin within Microsoft Copilot Studio, authoring some basic capabilities, publishing it to the Microsoft Admin Center, and your user choosing and enabling the plugin in the UI.

1. From the left navigation pane in Copilot Studio, choose the **Extend Microsoft Copilot (preview)** option, and then **Conversational plugins**
1. From this page, choose **Add conversational plugin** affordance in the bar above the authoring canvas; which will open the authoring canvas with a new conversational plugin
1. The authoring canvas will come up, with a new **Microsoft Copilot (preview)** trigger node on it.
1. Before authoring futher, set the name of the toipc in the top of the panel above the authoring canvas. This name will be visible to the user and admin in the Microsoft Copilot and Microsoft Admin Center respectively.
1. In the Trigger node’s description, provide a clear description of how the conversational plugin can help the user and what it can do. Unlike other descriptions, this one has functional purpose and is used by the Microsoft Copilot to determine whether to invoke your plugin or not. Use clear prose/sentences to describe what your plugin will do for the user and what it will return.
1. In the conversational plugin, create whatever logic you want, so long as it does not require user interaction (no buttons, questions, cards, or other prompts). The authoring canvas menu for Covnversational Plugins have been limited to remove options that could require user interaction.
1. For this example we will use the **Generative Answers** node to execute a search over web content and provide an answer to the user in Microsoft Copilot.
1. To use the Generate Answers node as in the screen shot above, click the plus on the canvas under the trigger node, then select **Generative answers** under the Advanced tab of the popup menu
1. For the **Input** field, invoked the variable picker by clicking the arrow in the Input box
1. Choose the System Variable **Activity.Text** which represents the user’s last query to the M365 Coplilot that caused it to invoke the plugin
1. Click the Data Sources link in the center of the Generative Answers tile
1. For now, enter a link to a public website which would have content you’d like your bot to be able to answer questions about (note, no 301 redirects, etc. which aren’t indexed by Bing).
1. Once the link is added (don't forget to hit "+" once entering the URL), the properties panel can be closed
1. If you wish, you send one or more messages to the user as a response. You can use a **Send a Message** node, or another **Generate Answer** node call, or multiple of these actions as your conversational plugin needs.
1. Finally, the conversational plugin can be saved with the Save/Floppy Disk icon in the top right corner of the page

## Publishing your Conversational Plugin to Microsoft Copilot

Publishing your conversational plugin will create a new plugin in the Dataverse registry for your Tenant. Once available there, your tenant admin will need to approve your plugin to be available to users in the Microsoft Copilot plugins catalog.

In Microsoft Copilot, your conversational plugin will be labeled as *Conversational plugin name* in the add plugins UI. As such, please specify your conversational plugin name and copilot name for readability.

> [!IMPORTANT]
> During this preview, the first time you publish your conversational plugin, the Microsoft Copilot admin UI will show your conversational plugin after approximately four hours. Changes you make to the internals of your conversational plugin after that will happen immedately.
>
> If you disable, then publish your conversational plugin, and then to reenable and republish, the four hour wait will reoccur.

To publish your conversational plugin:

1. First, create and save your conversational plugin as described in the prior section
1. Navigate to the Publish panel on the left side menu of the Copilot Studio shell
1. Choose publish, which will start the publish process. The publish should complete quickly; however actual availability in the Microsoft Admin Center may take up to 4 hours.
1. Your Admin can find the Dataverse and Microsoft Copilot Studio integrated app in the Microsoft Admin Center under Settings->Integrations to be reviewed and approved.  In this preview, Deploy/Block is that this category level only.
1. Once your Tenant admin has approved the Dataverse and Microsoft Copilot Studio integrated app, it should appear in the user's list of plugins in their Microsoft Copilot UI

Once enabled, your user should be able to ask questions of the Microsoft Copilot, and where your plugin is deemed to most likely be able to provide the most relevant results, it will be invoked.

> [!NOTE]
> To unpublish your conversational plugin from the catalog, in conversational plugin details, unclick the **Status** checkbox, save your conversational plugin, and then re-publish, which will remove it from the Dataverse registry and Microsoft Copilot app catalog.

> [!TIP]
> Interacting with the Microsoft Copilot orchestrator is likely to be a different experience than you might have had integrating with previous systems.
>
> 1. The Microsoft Copilot will always rewrite your answers with it's own voice. It's not possible in this preview to have the content passed through unchanged to the end user.
> 1. The description of your conversational plugin is critical to how reliably it will be invoked. The description teaches the Orchestrator what your plugin is good at and what answers it can provide. Be sure to use clear prose when writing the description, and consider experimenting with changes to get the best outcome.
