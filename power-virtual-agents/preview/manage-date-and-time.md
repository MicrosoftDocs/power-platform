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

You can use the **Date and time** entity to capture a date and time in Coordinated Universal Time (UTC). However, as you build bots you'll likely run into scenarios where you want to display the date and time based on the user's current location.

## Prerequisites

- [Use variables](authoring-variables.md)
- [Use conditions](authoring-using-conditions.md)
- [Create expressions using Power Fx](advanced-power-fx.md)

## System-level variables

Use these system-level variables to get information about the conversation's time zone.

- `Conversation.LocalTimeZone`, read-write, stores the conversation's time zone as a string. You can use any time zone listed on the [Noda Time][] website. For information on how your bot determines local time, see [Time zone determination](#time-zone-determination).

- `Conversation.LocalTimeZoneOffset`, read-only, gets the UTC offset for the local time. This value is stored as a time value.

[Noda Time]: https://nodatime.org/timezones

## Time zone determination

Power Virtual Agents uses the following steps, in order, to determine the conversation's time zone:

1. If the `Conversation.LocalTimeZone` system variable is set to a valid time zone from [Noda Time][], use that as the time zone.

1. If the channel included the local time zone in the user's message, use that.

1. Otherwise, use UTC as the time zone.

## Manually set a conversation's time zone

Power Virtual Agents will [automatically determine a user's time zone](#time-zone-determination) when your bot prompts the user for a date and time. To manually set the timezone:

1. Open the topic in which to set the conversation's time zone.

1. Add a **Set Variable Value** node.

    1. For **Set variable**, choose the `Conversation.LocalTimeZone` system topic.

    1. For **To value**, enter `America/Los_Angeles`, one of the **Zone ID** values from the [Noda Time][] website.

1. Add a **Message** node. In the text box type, enter `The local time zone is: `, then select _Insert variable_ (**{x}**) and insert the system `Conversation.LocalTimeZone` variable.

1. Add a second **Message** node. In the text box type, enter `The local time zone offset is: `, then select _Insert variable_ (**{x}**) and insert the system `Conversation.LocalTimeZoneOffset` variable.

1. Save and test the chatbot.

    :::image type="content" source="media/manage-date-and-time/test-bot.png" alt-text="Screenshot of the test bot pane.":::

## Display date and time in a local timezone

Power Virtual Agents stores date and time in UTC. Before displaying a date and time value to customers, add the time zone offset to convert the value to the user's local time zone.

In this example, we get the current date and time using Power Fx's `Now()` function, then add the timezone offset:

<!-- At time of writing, there was no way to use the Conversation.LocalTimeZoneOffset system variable directly in a Power Fx formula. As a workaround, the following instructions have you use a Set Variable Vale node to create a new variable and assign it to the value of Conversation.LocalTimeZoneOffset  -->

1. Create a new topic and add the trigger phrase `what time is it`.

1. On the authoring canvas, select **Add node** (**+**). Select **Set a variable value** to add a new **Set Variable Value** node.
    1. For **Set variable**, create a new variable named `offset`.
    1. For **To value**, choose the system variable **Conversation.LocalTimeZoneOffset**.

    :::image type="content" source="media/manage-date-and-time/time-offset.png" alt-text="Screenshot of a Set Variable Value node assigning a value to the offset variable.":::

1. Add a second **Set Variable Value** node.
    1. For **Set variable**, create a new variable named `nowLocal`.
    1. For **To value**, enter the Power Fx formula `DateAdd(Now(), Topic.offset)`.

    :::image type="content" source="media/manage-date-and-time/time-convert.png" alt-text="Screenshot of a Set Variable Value node assigning a value to the nowLocal variable.":::

1. Add a **Message** node. Enter the message `The current date and time is {Topic.nowLocal}`.

    :::image type="content" source="media/manage-date-and-time/time-send-message.png" alt-text="Screenshot of a Message node.":::

1. Test your bot in the test bot pane to get the current date and time.

    :::image type="content" source="media/manage-date-and-time/time-test-bot.png" alt-text="Screenshot of a bot replying with the current date and time in the test bot pane.":::

## Reference

[Power Fx date time reference](/power-platform/power-fx/data-types#date-time-and-datetime)
