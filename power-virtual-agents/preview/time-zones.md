---
title: "Managing date and time in PVA (Preview)"
description: "How to manage date and time in PVA bots"
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

# Managing date and time in chatbots

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

As you build bots in PVA, you'll likely run into scenarios where you need to display the date and time based on the user's location instead of using Coordinated Universal Time (UTC). Internally, PVA stores date and time in UTC, but does provide additional capabilities to handle user's local time. There are a few things that you must understand:

- Prebuilt entities 
- System level vairables 
- Determine which time zone to use

## Prebuild entitities:
To manage data and time in your bots, PVA provides the following prebuilt entities:  
- Date: A date without a time, in the time zone of the bot user.
- DateTime: A date with a time, in the time zone of the bot user. 
- DateTimeNoTimeZone: A date with a time, in Coordinated Universal Time (UTC).

## Sytem level variables
PVA also provides the following system level variables to help you manage time zone in your bot:
- `Conversation.LocalTimeZone` stores the bot user's time zone. Supports both read and write operations. You can set the Conversation.LocalTimeZone to any valid time zone listed on the [Noda Time](https://nodatime.org/timezones) website. After you do that, the bot uses this time zone to determine the date and time for your chatbot. 
- `Conversation.LocalTimeZoneOffset` is a read-only variable that you can use to determine the UTC offset for the local time. 

## Determine time zone
To determine the chatbot user's time zone, PVA attempts the following in order:
1. If the bot developer has set the `Conversation.LocalTimeZone` with a valid time zone from [Noda Time](https://nodatime.org/timezones), use that as the time zone.
1. If `Conversation.LocalTimeZone` has not been set, PVA tries to determine the time from the message the user sent to the bot
1. If time zone is not available becasue a channel does not provide it in the message, PVA uses UTC.

## Set bot's time zone
1. Add a Set a variable value node to a topic in your bot as shown below:

:::image type="content" source="media/timezone/select-set-variable-node.png" alt-text="Screenshot set variable node.":::

1. In the Set a Variable node, click on the Select a variable arrow. Select System in the Select a variable panel that opens up. Select Conversation.LocalTimeZone.

:::image type="content" source="media/timezone/set-variable-value.png" alt-text="Screenshot set variable value.":::

1. In the To value text box type America/Los_Angeles (this is the values that you can get from Noda Time website mentioned above).

:::image type="content" source="media/timezone/set-time-zone.png" alt-text="Screenshot set time zone.":::

1. Next, add a Message node.
1. In the message text box type, "The local time zone is: " and then click on {x} to insert Conversation.LocalTimeZone variable on the System tab. Next, add "The local time zone offset is: " and insert Conversation.LocalTimeZoneOffset on the System tab. 

:::image type="content" source="media/timezone/set-message.png" alt-text="Screenshot send message":::

1. Save and test the chbot.


## Reference
[Power Fx date time reference](https://learn.microsoft.com/power-platform/power-fx/data-types#date-time-and-datetime)
