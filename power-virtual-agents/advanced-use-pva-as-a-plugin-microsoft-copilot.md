```yaml
---
title: "Creating an Microsoft Copilot Enabled App (preview)"
description: "Using Microsoft Copilot Studio to publish a topic as an Microsoft Copilot Enabled App within Microsoft Copilot"
ms.reviewer: jameslew
ms.date: 11/14/2023

//Do not update these; the docs team uses them for content management
ms.topic: how-to
author: iaanw
ms.author: iawilt
ms.collection: virtual-agent
ms.service: power-virtual-agents
searchScope:
  - "Power Virtual Agents"
---
```

# Publish your topic as an Microsoft Copilot Enabled App (preview)

The Microsoft Copilot provides out of the box experiences to engage with content and resources from across your organization. In some situations answers and interaction with external systems are required. With Microsoft Copilot Studio, you can author a topic that can be published to the Microsoft Copilot catalog as a Copilot Enabled App, and once approved by your Tenant Admin, can be added to you and your orgnization's Microsoft Copilot Chat experiences.

For this preview, you will be able to create a topic that recieves the user's query (stored in the **Activity.Text** variable), processes it by completing one or more operations and then send one or more responses back to the user in the Microsoft Copilot chat.

## What is a Copilot Enabled App and how does it work?

Microsoft Copilot's conversational system uses orchestration logic and large langauge models to help the user achieve their goals by interpreting their request, determining the best course of action, and then activating the appropriate system, component, plugin, or series of components to achieve the goal, finally returning a generated result to the user.

A plugin built in Microsoft Copilot Studio enables you to extend the behavior of the Microsoft Copilot by creating a function for some capbility the Microsoft Copilot doesn't natively have such as calling a specific API, or applying some sophisticated business logic, or accessing a data source that requires additional configuration ouside of what the Microsoft Copilot has access to.

Unlike a traditional component model, instead of creating a hard-coded integration point with the copilot, a maker will create a topic in Microsoft Copilot Studio and then provide descriptive text to tell the orchestrator about what the plugin can do and what it needs to know to do so, such that orchestrator can make it's own decision about when the plugin would be most useful and ask the user appropriate questions to fill plugin parameters.

## Prerequisites

- End users must have a license to use the Microsoft Copilot 
- The Microsoft Copilot Studio application must be a Microsoft Copilot Studio Copilot not a PVA "Classic" bot
- **M365 Copilot** control in the **Power Platform Admin Center** for this environment must be Enabled
- Before end to end will work, M365 Tenant Admin will need to have enabled the **Microsoft Copilot Studio and Dynamics** Integrated Apps category in the Microsoft Admin Center

> [!IMPORTANT]
> In this preview, there are some limitations to be aware of:
> 1. Your topic will not be able to interact (ask questions of) the user, and can only process the incoming parameters/activity.text and send a response.
> 1. Responses will be limited to text, no media or adaptive cards will be supported
> 1. In this preview PVA will not be able to search Sharepoint/Onedrive on behalf of the user, so sharepoint/onedrive sources for generative answers will not be functional.
> 1. This preview will be limited to English language copilots.
> 1. All users of Microsoft Copilot within your organization will be able to interact with the copilot, the copilot will not support authenticting the user itself
> 1. If your Dataverse Environment has a security group assigned, users not within that Security Group will not be able to access the plugin in Microsoft Copilot

## Creating a basic Topic to publish as a plugin

Your topic that will be used within Microsoft Copilot chat will take the **Activity.Text** variable as an input that represents the user's question in Microsoft Copilot, process it in some way (such as passing it to Generative Answers), and then returning the result via one or more messages; which could include the response that comes from Generative Answers, or **Send a Message** nodes. Multiple messages can be included in the output.

1. From the left navigation pane in Copilot Studio, choose the **Extend Microsoft Copilot (preview)** option, and then **Conversational plugins**
1. From this page, choose **Add conversational plugin** affordance in the bar above the authoring canvas
1. The authoring canvas will come up, with a new **Microsoft Copilot (preview)** trigger.
1. In the Trigger's description, provide a clear description of how the topic can help the user and what it can do. Unlike other descriptions, this one has function and is used by the Microsoft Copilot to determine whether to invoke your plugin or not.
1. The Topic Name will be used in the name of the plugin in Microsoft Copilot
1. In the Topic, create whatever logic you want, so long as it does not require user interaction (no buttons, questions, cards, or other prompts). The authoring canvas menu for Covnversational Plugins have been limited to remove options that could require user interaction.
1. To close the topic, send one or more messages to the user as a response. You can use a **Send a Message** node, or as the **Generate Answer** node, or multiple of these actions as your topic needs.

## Publishing your Topic to Microsoft Copilot

Publishing your Topic will create a new Copilot Enabled App in the Dataverse registry for your Tenant. Once available there, your tenant admin will need to approve your Copilot Enabled App to be available to users in the Microsoft Copilot plugins catalog.

In Microsoft Copilot, your topic will be labeled as *Copilot Name-Topic Name* in the add plugins UI. As such, please specify your topic name and copilot name for readability.

> [!IMPORTANT]
> During this preview, the first time you publish your topic, the Microsoft Copilot admin UI will show your topic after approximately four hours. Changes you make to the internals of your topic after that will happen immedately.
>
> If you disable, then publish your topic, and then to reenable and republish, the four hour wait will reoccur.

To publish your topic:

1. First, create and save your topic as described in the prior section
1. After validating, publish your Copilot within Microsoft Copilot Studio
1. The plugin should now should appear in your Microsoft Admin Center in M365 console to be reviewed and approved
1. Once your Tenant admin has approved the plugin, it should appear in the user's list of plugins in their Microsoft Copilot UI

Once enabled, your user should be able to ask questions of the Microsoft Copilot, and where your plugin is deemed to most likely be able to provide the most relevant results, it will be invoked.

> [!NOTE]
> To unpublish your topic from the catalog, in topic details, unclick the **Status** checkbox, save your topic, and then re-publish, which will remove it from the Dataverse registry and Microsoft Copilot app catalog.

> [!TIP]
> Interacting with the Microsoft Copilot orchestrator is likely to be a different experience than you might have had integrating with previous systems.
>
> 1. The Microsoft Copilot will always rewrite your answers with it's own voice. It's not possible in this preview to have the content passed through unchanged to the end user.
> 1. The description of your topic is critical to how reliably it will be invoked. The description teaches the Orchestrator what your plugin is good at and what answers it can provide. Be sure to use clear prose when writing the description, and consider experimenting with changes to get the best outcome.