﻿---
title: Calendar and Clock functions
description: Reference information including syntax and examples for the Calendar and Clock functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 6/10/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# Calendar and Clock functions
[!INCLUDE[function-clock-calendar-applies-to](includes/function-clock-calendar-applies-to.md)]



Retrieves calendar and clock information about the current locale.

## Description

The **Calendar** and **Clock** functions are a set of functions that retrieve information about the current locale.

You can use these functions to display dates and times in the language of the current user. The single-column tables returned by **Calendar** and **Clock** functions can be used directly with the **[Items](/power-apps/maker/canvas-apps/controls/properties-core)** property of Dropdown and Listbox controls.

| Function                     | Description                                                                                                                                  |
| ---------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| **Calendar.MonthsLong()**    | Single-column table containing the full names of each month, starting with "January".                                                        |
| **Calendar.MonthsShort()**   | Single-column table containing the abbreviated names of each month, starting with "Jan" for January.                                         |
| **Calendar.WeekdaysLong()**  | Single-column table containing the full names of each weekday, starting with "Sunday".                                                       |
| **Calendar.WeekdaysShort()** | Single-column table containing the full names of each weekday, starting with "Sun" for Sunday.                                               |
| **Clock.AmPm()**             | Single-column table containing the long uppercase "AM" and "PM" designations. If the language uses a 24-hour clock, the table will be empty. |
| **Clock.AmPmShort()**        | Single-column table containing the short uppercase "A" and "P" designations. If the language uses a 24-hour clock, the table will be empty.  |
| **Clock.IsClock24()**        | Boolean indicating if a 24-hour clock is used in this locale.                                                                                |

Use the **[Text](function-text.md)** function to format date and time values using this same information. The **[Language](function-language.md)** function returns the current language and region code.

## Syntax

**Calendar.MonthsLong**()

**Calendar.MonthsShort**()

**Calendar.WeekdaysLong**()

**Calendar.WeekdaysShort**()

**Clock.AmPm**()

**Clock.AmPmShort**()

**Clock.IsClock24**()

## Examples

1. Insert a Dropdown control.
2. Set the formula for the **[Items](/power-apps/maker/canvas-apps/controls/properties-core)** property to:

   - **Calendar.MonthsLong()**

3. Users of your app can now select a month in their own language. **MonthsLong** can be replaced with any of the single-column tables that are returned by **Calendar** to create weekday and time selectors.

In the United States, with **[Language](function-language.md)** returning "en-US", the following is returned by the **Calendar** functions:

| Formula                      | Description                                                                                                               | Result                                                                                                                       |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------- |
| **Calendar.MonthsLong()**    | The return value contains the full name of each month, starting with "January".                                           | [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ] |
| **Calendar.MonthsShort()**   | The return value contains the abbreviated name of each month, starting with "January".                                    | [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ]                                       |
| **Calendar.WeekdaysLong()**  | The return value contains the full name of each day, starting with "Sunday".                                              | [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ]                                             |
| **Calendar.WeekdaysShort()** | The return value contains the abbreviated name of each day, starting with "Sunday".                                       | [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]                                                                          |
| **Clock.AmPm()**             | This language uses a 12-hour clock. The return value contains the uppercase versions of the full AM and PM designations.  | [ "AM", "PM" ]                                                                                                               |
| **Clock.AmPmShort()**        | This language uses a 12-hour clock. The return value contains the uppercase versions of the short AM and PM designations. | [ "A", "P" ]                                                                                                                 |
| **Clock.IsClock24()**        | This language uses a 12-hour clock.                                                                                       | **false**                                                                                                                    |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]









































































































































