---
title: "Manage date and time in Power Virtual Agents (preview)"
description: "How to manage date and time in Power Virtual Agents bots."
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

# Manage date and time in chatbots (preview)

[!INCLUDE [Preview disclaimer](includes/public-preview-disclaimer.md)]

As you build bots, you'll likely run into scenarios where you must display the date and time based on the user's location instead of using Coordinated Universal Time (UTC). Internally, Power Virtual Agents stores date and time as a UTC value; however, you have some ways in which to manage time zones in your bots.

- Prebuilt entities
- System-level variables
- Time zone determination

## Prebuilt entities

Use these prebuilt entities to identify dates and times.

<!-- TODO check back, currently _Date and time_ is the only one enabled so far. -->

- _Date_: A date without a time in the time zone of the bot user.
- _Date and time_: A date with a time in the time zone of the bot user.
- _Date and time (UTC)_: A date with a time in Coordinated Universal Time (UTC).

## System-level variables

Use these system-level variables to get information about the user's time zone.

- `Conversation.LocalTimeZone`, read-write, stores the bot user's time zone as a string. You can use any time zone listed on the [Noda Time][] website. For information on how your bot determines local time, see [Time zone determination](#time-zone-determination).
- `Conversation.LocalTimeZoneOffset`, read-only, gets the UTC offset for the local time. This value is stored as a time value.

[Noda Time]: https://nodatime.org/timezones

## Time zone determination

Power Virtual Agents uses the following steps, in order, to determine the chatbot user's time zone.

1. If the `Conversation.LocalTimeZone` system variable is set to a valid time zone from [Noda Time][], use that as the time zone.
1. If the channel included the local time zone in the user's message, use that.
1. Otherwise, use UTC as the time zone.

## Set bot's time zone

For general information on how to set and use variables, see [Use variables (preview)](authoring-variables.md).

1. Open the topic in which to set the user's time zone.
1. Add a **Set Variable Value** node.
    1. For **Set variable**, choose the `Conversation.LocalTimeZone` system topic.
    1. For **To value**, enter `America/Los_Angeles`, one of the **Zone ID** values from the [Noda Time][] website.
1. Add a **Message** node. In the text box type, enter `The local time zone is: `, then select _Insert variable_ (**{x}**) and insert the system `Conversation.LocalTimeZone` variable.
1. Add a second **Message** node. In the text box type, enter `The local time zone offset is: `, then select _Insert variable_ (**{x}**) and insert the system `Conversation.LocalTimeZoneOffset` variable.
1. Save and test the chatbot.

    :::image type="content" source="media/timezone/test-bot.png" alt-text="Screenshot of the test bot pane.":::

## Reference

[Power Fx date time reference](/power-platform/power-fx/data-types#date-time-and-datetime)
