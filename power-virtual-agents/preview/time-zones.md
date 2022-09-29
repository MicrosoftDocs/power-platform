---
title: "Handling time zone in PVA (Preview)"
description: "Use time zone functionality to manage date and time in PVA bots"
keywords: "PVA"
ms.date: 10/10/2022
ms.topic: article
author: v-alarioza
ms.author: v-alarioza
ms.reviewer: kamrani
manager: iawilt
ms.collection: virtual-agent
ms.custom: ceX, advanced-authoring
---

# Managing time zone in PVA bots

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

PVA provides the following system level variables to help you manage time zone in your bot:
- `Conversation.LocalTimeZone` stores the user's time zone who is communicating with the bot. Supports both read and write operations. You can set the Conversation.LocalTimeZone to any valid time zone listed on the 
[Noda Time](https://nodatime.org/timezones) website.  
- `Conversation.LocalTimeZoneOffset` is a read-only variable that you can use to determine the UTC offset for the local time. 

If you don't set the value, PVA uses the time from the message the user sends to the bot to 
determine user's time zone. It is possible because at the protocol level all messages include the date and time information. 

provided by the 
protocol layer as part of the message that was sent from the user to the bot. If you use UTC time. 
PVa persists all date and time values in UTC, the conversation happens automatically when you input or retrieve the value. 

# Reference
https://nodatime.org/timezones
