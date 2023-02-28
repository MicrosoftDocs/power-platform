---
title: "Transcripts analysis"
description: "Set of best practices on how to improve deflection rate in a PVA chatbot"
author: athinesh

ms.date: 1/20/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: athinesh
ms.collection: virtual-agent
---
# Technique 5: agent transcript analysis
Analyzing the agent transcripts can provide insights on what new topics or self-service actions can be added to the bot to reduce escalation and improve deflection. The agent transcript review process is similar to the bot transcript review we discussed earlier in this playbook:
1.	Identify the top escalation driver topics
2.	Download the Agent conversation transcriopts from Dynamics 365 Omni-channel
3.	Select the most recent sample set of human agent conversation transcripts for that topic (e.g., 10 sessions). The size of the sample set depends on how much accuracy you are looking for. For a quick analysis you can start with 10 sessions.
4.	Read through each of the human agent conversations and identify the resolution path provided by the human agents and patterns that are emerging for that conversation. 
5.	List out the resolution paths identified for each session and group them as per the resolution paths.
6.	For each resolution path group, come up with a recommendation for implementing it in the bot as a topic or self-service action etc.
7.	Implement the recommendations in the PVA bot topics and observe the change in the escalation rate and deflection.
