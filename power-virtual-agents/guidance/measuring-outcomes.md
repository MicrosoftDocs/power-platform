---
title: "Measuring chatbot outcomes"
description: "Measuring chatbot outcomes in Power Virtual Agents"
author: HenryJammes

ms.date: 04/28/2023
ms.subservice: guidance
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
ms.collection: virtual-agent
---

# Measuring chatbot outcomes

Unengaged sessions always have an outcome of None.

Once it's engaged, it remains engaged. An engaged session has one of the following outcomes: resolved, escalated, or abandoned.
A session ends and is considered escalated when the Escalate topic is triggered or a Transfer to agent node is run. (The current analytics session ends, whether the conversation transfers to a live agent or not.)
A session ends and is considered resolved when either:
The Confirmed Success topic is triggered.
The End of Conversation topic is triggered and the user confirms that the interaction was a success or lets the session time out.
A session ends and is considered abandoned when an engaged session times out and it didn't reach a resolved or escalated state.
The summary tab includes various charts with graphical views of your bot's key performance indicators. The remainder of this article describes each chart in more detail.
