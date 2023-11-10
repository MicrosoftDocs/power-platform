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
