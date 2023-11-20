---
title: "Alternate Escalation Paths"
description: "Set of best practices based on alternate escalation paths to improve the deflection rate of a Microsoft Copilot Studio chatbot."
author: athinesh
ms.date: 05/23/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.reviewer: iawilt
---
# Alternate escalation paths

[!INCLUDE[pva-rebrand](../includes/pva-rebrand.md)]

> [!TIP]
> There are a few strategies you can use to deflect the user from reaching the human agent when the bot user decides to escalate, without deprecating the user experience.

## Check for operating hours and queue size during escalation

In this approach, you can have a self-service action inside Microsoft Copilot Studio, for example, a Power Automate cloud flow. 

The action that checks for the operating hours of the human agent and agent queue size from the engagement hub using, for example, Dynamics 365 Omnichannel for Customer Service. It then transfers the chat only if the agent is available in the current hour or if the queue isn't full. 

If the escalation happens outside the operating hours of the agent or the agent queue is full, then the bot can redirect the user to email support or schedule a call back. 

This approach avoids unnecessary escalation and, in turn, improves the deflection rate.

## Provide an option to create a support ticket during escalation

When the user escalates to an agent, the chatbot can redirect through a self-service action to create a support ticket by providing the required details.

> [!div class="nextstepaction"]
> [Agent transcript analysis](deflection-transcripts-analysis.md)
