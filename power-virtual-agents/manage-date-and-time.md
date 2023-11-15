---
title: Accommodate time zones (preview)
description: Learn how Microsoft Copilot Studio bots collect and store date and time. Learn how to adjust the user's time zone and to display dates and times correctly in their time zone.
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: how-to
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: kamrani
ms.service: power-virtual-agents
ms.collection: virtual-agent
ms.custom: ceX, advanced-authoring, bap-template
---

# Accommodate time zones

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

The **Date and time** entity captures a date and time in Coordinated Universal Time (UTC). However, you may want to display the date and time based on the user's location instead.

## Prerequisites

- [Use variables](authoring-variables.md)
- [Use conditions](authoring-using-conditions.md)
- [Create expressions using Power Fx](advanced-power-fx.md)

## How Microsoft Copilot Studio determines the user's time zone

Microsoft Copilot Studio follows these steps, in order, to determine the user's time zone:

1. If the `Conversation.LocalTimeZone` system variable is set to a valid time zone from [Noda Time][], use that as the time zone.

1. If the channel included the local time zone in the user's message, use that.

1. Otherwise, use UTC as the time zone.

## Get the user's time zone

Use these system-level variables to get information about the user's time zone:

- `Conversation.LocalTimeZone` (read-write): Stores the user's time zone as a string. You can optionally set this variable to any time zone listed on the [Noda Time][] website.

- `Conversation.LocalTimeZoneOffset` (read-only): Gets the UTC offset from `Conversation.LocalTimeZone` and stores it as a time value.

[Noda Time]: https://nodatime.org/timezones

## Manually set the user's time zone

Microsoft Copilot Studio [automatically determines the user's time zone](#how-microsoft-copilot-studio-determines-the-users-time-zone) when your bot prompts the user for a date and time. You can also manually set the timezone.

1. Open the topic in which you want to set the user's time zone.

1. Add a **Set Variable Value** node.

    - For **Set variable**, choose the `Conversation.LocalTimeZone` system topic.

    - For **To value**, enter one of the **Zone ID** values from the [Noda Time][] website; for example, `America/Los_Angeles`.

1. Add a **Message** node.

1. In the text box type, enter `The local time zone is: `, then select _Insert variable_ (**{x}**), and insert the system variable `Conversation.LocalTimeZone`.

1. Add a second **Message** node.

1. In the text box type, enter `The local time zone offset is: `, then select _Insert variable_ (**{x}**), and insert the system variable `Conversation.LocalTimeZoneOffset`.

1. Save and test the chatbot.

    :::image type="content" source="media/manage-date-and-time/test-bot.png" alt-text="Screenshot of the Test bot pane.":::

## Display the date and time in the local time zone

Microsoft Copilot Studio stores the date and time in UTC. Before displaying a date and time to customers, add the time zone offset to convert the value to the user's local time zone.

In this example, we'll get the current date and time using the Power Fx `Now()` function, and then add the time zone offset. It isn't possible to use the `Conversation.LocalTimeZoneOffset` system variable directly in a Power Fx formula. Instead, we'll use a **Set Variable Value** node to create a variable and then assign it the value of `Conversation.LocalTimeZoneOffset`.

1. Create a topic and add the trigger phrase `what time is it`.

1. In the authoring canvas, select **Add node** (**+**). Select **Set a variable value**.

    - For **Set variable**, create a variable named `offset`.
    - For **To value**, select the system variable `Conversation.LocalTimeZoneOffset`.

    :::image type="content" source="media/manage-date-and-time/time-offset.png" alt-text="Screenshot of a Set Variable Value node assigning a value to the offset variable.":::

1. Add a second **Set Variable Value** node.

    - For **Set variable**, create a variable named `nowLocal`.
    - For **To value**, enter the Power Fx formula `DateAdd(Now(), Topic.offset)`.

    :::image type="content" source="media/manage-date-and-time/time-convert.png" alt-text="Screenshot of a Set Variable Value node assigning a value to the nowLocal variable.":::

1. Add a **Message** node. Enter the message `The current date and time is {Topic.nowLocal}`.

    :::image type="content" source="media/manage-date-and-time/time-send-message.png" alt-text="Screenshot of a Message node.":::

1. Test your bot in the **Test bot** pane to get the date and time in your time zone.

    :::image type="content" source="media/manage-date-and-time/time-test-bot.png" alt-text="Screenshot of a bot replying with the current date and time in the test bot pane.":::

## Related topics

[Power Fx date and time reference](/power-platform/power-fx/data-types#date-time-and-datetime)

[!INCLUDE[footer-include](includes/footer-banner.md)]

