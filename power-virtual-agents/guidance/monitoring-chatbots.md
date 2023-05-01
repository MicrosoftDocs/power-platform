---
title: "Monotiring chatbots"
description: "Monitoring chatbots in Power Virtual Agents"
author: HenryJammes
ms.date: 05/01/2023
ms.topic: conceptual
ms.custom: guidance
ms.author: hejammes
---

# Monitoring chatbots


Chatbot is down   : For example Chabot endpoint is down
Chatbot is not working : For example Deployment issue or Code/Topic related issue or Upstream and downstream application issue
Chatbot Slowness issue - Chatbot is taking longer time to respond  or Dataverse DB performance issue or Network latency issue between Teams and PVA or Massive load on PVA Chatbot end points


#1: Regular tests over the Direct Line API

#2: Cloud flow monitoring + any BF skill called by the PVA bot.

For #1 and #2 you can have a look at https://aka.ms/PVASamples/BotTestFramework for a sample to automate bot testing (useful in regular monitoring or CI/CD)

On #2, you can also customize the OnError topic (in PVA unified authoring canvas) to hand bot errors differently.

#3: Cloud flow monitoring (if they are the bottleneck) + Azure Application Insights integration  