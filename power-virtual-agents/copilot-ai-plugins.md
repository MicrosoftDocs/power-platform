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




## Prompts
Generate content or extract insights with AI Builder dynamic prompts

Generate content or extract insights  
When selecting Generate content or extract insights in the plugin selection screen, Makers enter the Prompt Builder experience providing a point and click experience to create content generation capabilities using natural language like summarizing, classifying, extracting entities, translating, assessing sentiment and much more.
 

Building a prompt is performed by following these steps:
1.	Either start with one of the existing templates or write a sentence describing what you want to achieve. For instance, summarize this text as paragraph of less than 50 words.
2.	Insert in your sentence a dynamic value for each input expected to be provided by the end user in the Copilot and required to deliver your expected behavior. In the above example, the text to be summarized is expected to be provided and is a dynamic value of the prompt.
 
3.	Text your prompt to confirm that it is behaving as expected by selecting Try out prompt and entering sample values for each dynamic value.
4.	Edit the name of your prompt to properly reflect what it is doing and select Create AI plugin.


## Flow
Custom automation with Power Automate flows


Custom automation   
Power Automate flow plugins let you define flows that can be called from AI surfaces in Power platform. Flow plugins leverage the new Run from Copilot trigger and Respond to copilot action to define custom processes that can be invoked via natural language. Follow these steps in order to create your own flow plugin
1.	Select New Plugin on the Power Platform AI plugin page
2.	Select Custom Automation to get started creating a plugin using flow
3.	This automatically places you within the flow editor with the Run from Copilot trigger and Respond to copilot action present.
4.	You can add inputs to your trigger for information you might want to collect from your users, provide helpful text descriptions for each input so the LLM can make best use of it
5.	Add actions to your flow such as the Create an approval and Post a message to Teams chat to create a simple Approval process 
 
6.	Optionally add parameters to the Respond to copilot action for any output you want to send back to the bot.
7.	Save your flow with a meaningful flow name and test or run it at least once. The LLM uses the title and description of the flow to determine when to invoke the flow plugins. Ensure flows run as only tested flows show up as available plugins in Copilot.
The following screenshot shows an example of a simple approval flow with a Teams notification built in. 


## Connectors
Update or get answers about external data with connectors


Update or get answers about external data  
Connector plugins let you define connector actions that can be invoked from AI surfaces in Power platform. Connector plugins require identification of actions that are enabled for use in copilot as well as capture of information that large language models require to effectively identify and utilize the plugin such as Summary and Description fields. 
Follow these steps in order to create your connector plugin. Please note at this time, connector plugins are required to be certified before they can be used in M365 copilot. 
1.	Select New Plugin on the Power Platform AI plugin page
2.	Select Update or get answers about external data to get started creating a plugin using a connector
 
3.	This automatically places you within the Custom connector editor page where you can open your connector from the available list or you can create a new one using the many options available including import of OpenAPI specs etc.
 
4.	You will notice a new AI plugin tab in the custom connector wizard. Under Manifest details, add plugin information such as a summary and description. Now select the connector actions you would like to enable for copilot one at a time and provide helpful text descriptions to help LLM identify and utilize said actions.
 
5.	Click on the input parameter in the “Request” section of the action. Type in the Description here. For selected action, where the input parameters don’t have descriptive names and descriptions, it is helpful to add human readable text to aid LLM to use these effectively. For example, a field “id” can be better described as the “Account Identifier” or b_date can be described as “Birth Day of Contact in MM/DD/YYYY format.”  Such descriptions help LLMs interact effectively with the plugin.
 

6.	Click "Create/Update Connector", and the connector's Swagger will be updated with appropriate annotations. 
7.	Follow the instructions to certify the connector so that the plugin is available to use in M365 copilot. 
Internal notes Additional information : <Link to public doc> based on Public documentation Connector Plugin Dev Experience for ISVs.docx Authoring section. Also, we should place link to certification section here. 


## OpenAI
Add an OpenAI plugin


Add an OpenAI plugin  

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
 
5.	After providing your manifest, click Next
6.	Select the authentication type for your plugin from the available options, depending on the type selected you may be asked to provide authentication details. 
 
	The following Authentication types are supported:
•	No Auth – This is used for anonymous plugins and require no additional credentials.
•	API Key - This will require you to provide a Parameter label and name, as well as the location for the label. Later, when creating a connection to toe connector or plugin, you will be prompted to provide your API Key.
•	OAuth 2.0 – This will require a client ID< client secret, authentication URL, token URL, refresh URL, and scope
7.	Click Add Plugin
 
Your CoPilot plugin has now been generated along with your custom connector for the plugin. Both are available for use within your organization and can be included in solutions that you export
Additional information: https://learn.microsoft.com/en-us/connectors/custom-connectors/define-openapi-definition
