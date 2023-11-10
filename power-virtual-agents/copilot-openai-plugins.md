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
