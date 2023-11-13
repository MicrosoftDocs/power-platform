---
title: Create AI plugins for Microsoft Copilot (preview)
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
# Create AI plugins for Microsoft Copilot (preview)

You can create multiple types of AI plugins in Microsoft Copilot Studio, which let you customize how Microsoft Copilot responds to your end users:

- Prompt plugins, which use AI Builder and natural language understanding to target the specific scenarios and workflows within your business.
- Flow plugins, which use Power Automate flows to perform actions, and retrieve and work with data.
- Connector plugins, which use Power Platform connectors to access data from other systems, such as popular enterprise products like Salesforce, Zendesk, MailChimp, and Github.
- OpenAI plugins, which use connections to custom OpenAI models that you've created.

This article provides instructions for creating and sharing or publishing plugins.

After you've created plugins, you'll need to [enable them for use in Microsoft Copilot](copilot-plugins-overview.md#use-plugins-in -microsoft-copilot).

AI plugins can be created on the **AI plugins (preview)** page in Copilot Studio, under **Plugins (preview)** on the side navigation pane:

![Ai Plugins Page](media/copilot-ai-plugins/ai-plugins-page.png)

The remainder of this article describes how to create each type of plugin.

## Generate content or extract insights with AI Builder dynamic prompts

The experience to create prompt plugins in Copilot Studio is the same as in Power Apps. Any plugins you create in either Copilot Studio or Power Apps will be shared to the plugin registry and populated in both apps.

**To create prompt plugins:**

1. Log in to Copilot Studio and select **Plugins (preview)** on the side navigattion pane.
1. Select **Add a Power Platform component as an AI plugin**.
1. Select **Generate content or extract insights**.
1. Enter a name for your prompt, and then use plain, conversational language to describe what you want to achieve, for example *Summarize this text as a paragraph with less than 50 words*. You can also use pre-built templates to help identify what your prompt can do and how it could be worded.
1. In your prompt, add a dynamic value for each input that the end user should provide in their chat with Microsoft Copilot. You can add dynamic values as phrases or words in your prompt by selecting the phrase and then selecting **Add dynamic value**, or you can add dynamic values without selecting any text and then provide your own label. In this example, the word `text` has been turned into a dynamic variable.
3. Expand the **Test your prompt** section and enter sample data for each dynamic value. Select **Test prompt** to evaluate how well the prompt works.
4.Select **Save custom prompt**.

After you've created your plugin, you'll need to [enable it for use in Microsoft Copilot](copilot-plugins-overview.md#use-plugins-in -microsoft-copilot).

See [AI Builder dynamic prompts](/ai-builder/create-a-custom-prompt?branch=pr-en-us-766) for more information about building and using prompt plugins.

## Custom automation with Power Automate flows

Power Automate flow plugins let you define flows that can be called from AI surfaces in Power platform. Flow plugins leverage the new Run from Copilot trigger and Respond to copilot action to define custom processes that can be invoked via natural language. Follow these steps in order to create your own flow plugin
1.	Select New Plugin on the Power Platform AI plugin page
2.	Select Custom Automation to get started creating a plugin using flow
3.	This automatically places you within the flow editor with the Run from Copilot trigger and Respond to copilot action present.
4.	You can add inputs to your trigger for information you might want to collect from your users, provide helpful text descriptions for each input so the LLM can make best use of it
5.	Add actions to your flow such as the Create an approval and Post a message to Teams chat to create a simple Approval process 
 ![Create Flow Plugin](media/copilot-ai-plugins/create-flow-plugin.png)
6.	Optionally add parameters to the Respond to copilot action for any output you want to send back to the bot.
7.	Save your flow with a meaningful flow name and test or run it at least once. The LLM uses the title and description of the flow to determine when to invoke the flow plugins. Ensure flows run as only tested flows show up as available plugins in Copilot.
The following screenshot shows an example of a simple approval flow with a Teams notification built in. 
![Create Flow Plugin Path](media/copilot-ai-plugins/create-flow-plugin-path.png)

After you've created your plugin, you'll need to [enable it for use in Microsoft Copilot](copilot-plugins-overview.md#use-plugins-in -microsoft-copilot).

## Update or get answers about external data with connectors


Update or get answers about external data  
Connector plugins let you define connector actions that can be invoked from AI surfaces in Power platform. Connector plugins require identification of actions that are enabled for use in copilot as well as capture of information that large language models require to effectively identify and utilize the plugin such as Summary and Description fields. 
Follow these steps in order to create your connector plugin. Please note at this time, connector plugins are required to be certified before they can be used in M365 copilot. 
1.	Select New Plugin on the Power Platform AI plugin page
2.	Select Update or get answers about external data to get started creating a plugin using a connector
 
3.	This automatically places you within the Custom connector editor page where you can open your connector from the available list or you can create a new one using the many options available including import of OpenAPI specs etc.
 ![Create Connector Editor](media/copilot-ai-plugins/create-connector-editor.png)
4.	You will notice a new AI plugin tab in the custom connector wizard. Under Manifest details, add plugin information such as a summary and description. Now select the connector actions you would like to enable for copilot one at a time and provide helpful text descriptions to help LLM identify and utilize said actions.
 ![Create Connectror Details](media/copilot-ai-plugins/create-connectror-details.png)
5.	Click on the input parameter in the “Request” section of the action. Type in the Description here. For selected action, where the input parameters don’t have descriptive names and descriptions, it is helpful to add human readable text to aid LLM to use these effectively. For example, a field “id” can be better described as the “Account Identifier” or b_date can be described as “Birth Day of Contact in MM/DD/YYYY format.”  Such descriptions help LLMs interact effectively with the plugin.
 ![Create Connector Description](media/copilot-ai-plugins/create-connector-description.png)

6.	Click "Create/Update Connector", and the connector's Swagger will be updated with appropriate annotations. 
7.	Follow the instructions to certify the connector so that the plugin is available to use in M365 copilot. 
Internal notes Additional information : <Link to public doc> based on Public documentation Connector Plugin Dev Experience for ISVs.docx Authoring section. Also, we should place link to certification section here. 

After you've created your plugin, you'll need to [enable it for use in Microsoft Copilot](copilot-plugins-overview.md#use-plugins-in -microsoft-copilot).

## Add an OpenAI plugin


Open AI plugins provide the ability for Large Language Models to access data that normally would not be available to them based on their available training data. This can include:
•	Personal information
•	Specific product, feature, content details not available publicly
•	Access to line of business application records
•	Data accessed as part of an integration with specific websites, software, or services
Depending on the plugin, users can also perform actions against the data such as make updates, additions, or deletion of content.
Once an Open AI plugin is created ISVs and Developers can use them to implement AI functionality within their apps, bots, and more. 
Users can create Open AI plugins and use them to generate connectors to integrate the data sources with the Power Platform, as well as create CoPilot plugins that can be used to integrate AI chat capabilities in Microsoft products like Microsoft Teams.
To turn an Open AI plugin into a connector and a copilot plugin follow these steps:
1.	From https://make.powerapps.com click on More in the left hand panel
 
2.	Scroll down to locate AI Plugins  and select it (You can select to pin this to your left hand navigation list if you wish).
 
3.	In the AI Plugins page, select Add an OpenAI Plugin
 
4.	A wizard will appear, provide your manifest for the Open AI plugin. This can be done by providing a link to the location of the manifest file, or by manually selecting and uploading the manifest from a local machine.
 ![Create Openai Manifest](media/copilot-ai-plugins/create-openai-manifest.png)
5.	After providing your manifest, click Next
6.	Select the authentication type for your plugin from the available options, depending on the type selected you may be asked to provide authentication details. 
 ![Create Openai Auth](media/copilot-ai-plugins/create-openai-auth.png)
	The following Authentication types are supported:
•	No Auth – This is used for anonymous plugins and require no additional credentials.
•	API Key - This will require you to provide a Parameter label and name, as well as the location for the label. Later, when creating a connection to toe connector or plugin, you will be prompted to provide your API Key.
•	OAuth 2.0 – This will require a client ID< client secret, authentication URL, token URL, refresh URL, and scope
7.	Click Add Plugin
 ![Create Openai Added](media/copilot-ai-plugins/create-openai-added.png)
 
Your CoPilot plugin has now been generated along with your custom connector for the plugin. Both are available for use within your organization and can be included in solutions that you export
Additional information: https://learn.microsoft.com/en-us/connectors/custom-connectors/define-openapi-definition

After you've created your plugin, you'll need to [enable it for use in Microsoft Copilot](copilot-plugins-overview.md#use-plugins-in -microsoft-copilot).


