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
 
