---
title: "Rate limits for Power Virtual Agents chatbots"
description: "Rate limits determine how often messages can be sent to a chatbot"
keywords: ""
ms.date: 4/8/2020
ms.service:
  - dynamics-365-ai
ms.topic: article
author: iaanw
ms.author: iawilt
manager: shellyha
ms.custom: "quotas, admin"
ms.collection: virtual-agent
---

# Quotas and rate limit capacity considerations for Power Virtual Agents

Quotas are default constraints applied to chatbots that limit how often messages can be sent to the chatbot. The purpose of quotas is to throttle the service load for a client, which protects a service from being overloaded and the client from unexpected resource usage.

Quotas are applied to the bots alongside the capacity constraints you gained by purchasing a [Power Virtual Agents plan](https://go.microsoft.com/fwlink/?linkid=2099502). Also see [Licensing and capacity considerations](requirements-licensing.md).

The following quotas, defined as requests per minute (RPM) and requests per second (RPS), apply to Power Virtual Agents bots. A request is a message from the user to the bot, or a message from an Azure Bot Framework Skill, in a single chat session.

Action | Paid Plan
--|--
**Messages to a bot.**<br/>Includes any message from the user or from integrations, such as Azure Bot Framework Skills, to a single bot. | 800 requests per minute (RPM)\* 	
**Messages in a conversation.**<br/>Includes messages in a single conversation. | 5 RPS and 30 RPM	

\*Bots created in the North America region support 600 RPM. 800 RPM applies to all other supported regions.

## Error messages when quotas are met

If the quota for messages to a bot is met, the user chatting with the bot will see a failure notice when they try to send a message. They’ll be prompted to retry.

![Error message that says Send failed. Retry. In the chat bot window](media/requirements-quota-error.png “Error message that says Send failed. Retry. In the chat bot window”)
 
If the quota for messages in a conversation is met, the user will see a response from the bot asking the user to repeat the message again later.

![Error message that says Please wait….I’m still processing your previous messages. Try again in a moment.](media/ requirements-quota-messages-throttle.png “Error message that says Please wait….I’m still processing your previous messages. Try again in a moment.”)



