---
title: Accommodate time zones (preview)
description: Learn how Microsoft Copilot Studio bots work with datetime values. Learn how to adjust the user's time zone, which affects how datetime values are output.
keywords: "PVA"
ms.date: 03/24/2023

ms.topic: how-to
author: iaanw
ms.author: iawilt
manager: leeclontz
ms.reviewer: kamrani

ms.custom: ceX, advanced-authoring, bap-template
---

# Accommodate time zones

[!INCLUDE[pva-rebrand](includes/pva-rebrand.md)]

Copilot Studio bots store and output datetime values based on the user's time zone. This article includes steps for changing a user's time zone, which in turn will change the output of datetime values.

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

Microsoft Copilot Studio [automatically determines the user's time zone](#how-microsoft-copilot-studio-determines-the-users-time-zone) when your bot prompts the user for a date and time. You can also manually set the time zone.

1. Open the topic in which you want to set the user's time zone.

1. Add a **Set Variable Value** node.

    - For **Set variable**, choose the `Conversation.LocalTimeZone` system topic.

    - For **To value**, enter one of the **Zone ID** values from the [Noda Time][] website; for example, `America/Los_Angeles`. (if you want to force Universal Time, enter the     value `UTC`)

1. Add a **Message** node.

1. In the text box type, enter `The local time zone is: `, then select _Insert variable_ (**{x}**), and insert the system variable `Conversation.LocalTimeZone`.

1. Add a second **Message** node.

1. In the text box type, enter `The local time zone offset is: `, then select _Insert variable_ (**{x}**), and insert the system variable `Conversation.LocalTimeZoneOffset`.

1. Save and test the chatbot.

    :::image type="content" source="media/manage-date-and-time/test-bot.png" alt-text="Screenshot of the Test bot pane.":::

## Related topics

[Power Fx date and time reference](/power-platform/power-fx/data-types#date-time-and-datetime)

[!INCLUDE[footer-include](includes/footer-banner.md)]

