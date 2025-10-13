---
title: DateAdd, DateDiff, and TimeZoneOffset functions
description: Reference information including syntax and examples for the DateAdd, DateDiff, and TimeZoneOffset functions.
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
no-loc: ["DateAdd","DateDiff","TimeZoneOffset"]
---

# DateAdd, DateDiff, and TimeZoneOffset functions
[!INCLUDE[function-dateadd-datediff-applies-to](includes/function-dateadd-datediff-applies-to.md)]

| Function | Applies to |
| - | - |
| **DateAdd** | |
| **DateDiff** | |
| **TimeZoneOffset** | |


Adds to or finds the difference in date/time values and converts between local time and UTC.

## Description

The **DateAdd** function adds a number of units to a date/time value. The result is a new date/time value. You can also subtract a number of units from a date/time value by specifying a negative value.

The **DateDiff** function returns the difference between two date/time values. The result is a whole number of units.

For both functions, units can be **TimeUnit.Milliseconds**, **TimeUnit.Seconds**, **TimeUnit.Minutes**, **TimeUnit.Hours**, **TimeUnit.Days**, **TimeUnit.Months**, **TimeUnit.Quarters**, or **TimeUnit.Years**. By default, both functions use **TimeUnit.Days** as units.

The **TimeZoneOffset** function returns the number of minutes between the user's local time and UTC (Coordinated Universal Time).

You can use **DateAdd** with the **TimeZoneOffset** to convert between the user's local time and UTC (Coordinated Universal Time). Adding **TimeZoneOffset** will convert a local time to UTC, and subtracting it (adding the negative) will convert from UTC to local time.

Also see [Date, Time, and DateTime data types](../data-types.md#date-time-and-datetime) and [working with dates and times](/power-apps/maker/canvas-apps/show-text-dates-times) for more information.

## Syntax

**DateAdd**( _DateTime_, _Addition_ [, *Units* ] )

- _DateTime_ - Required. Date/time value to operate on.
- _Addition_ - Required. Number, in _Units_, to add to the _DateTime_.
- _Units_ - Optional. The type of _Units_ to add: **TimeUnit.Milliseconds**, **TimeUnit.Seconds**, **TimeUnit.Minutes**, **TimeUnit.Hours**, **TimeUnit.Days**, **TimeUnit.Months**, **TimeUnit.Quarters**, or **TimeUnit.Years**. If not specified, **TimeUnit.Days** are used.

**DateDiff**( _StartDateTime_, _EndDateTime_ [, *Units* ] )

- _StartDateTime_ - Required. Starting date/time value.
- _EndDateTime_ - Required. Ending date/time value.
- _Units_ - Optional. The type of _Units_ to subtract: **TimeUnit.Milliseconds**, **TimeUnit.Seconds**, **TimeUnit.Minutes**, **TimeUnit.Hours**, **TimeUnit.Days**, **TimeUnit.Months**, **TimeUnit.Quarters**, or **TimeUnit.Years**. If not specified, **TimeUnit.Days** are used.

**TimeZoneOffset**( [ *DateTime* ] )

- _DateTime_ - Optional. Date/time value for which to return the offset. By default, the current date/time is used.

## Examples

In all of these examples, assume that the current date and time is **July 15, 2013, 1:02 PM**.

### Simple DateAdd

| Formula                                                                 | Description                                                                                    | Result             |
| ----------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ------------------ |
| **Text( DateAdd( Now(), 3 ),<br>"dd-mm-yyyy hh:mm" )**                  | Adds three days (default units) to the current date and time.                                  | "18-07-2013 13:02" |
| **Text( DateAdd( Now(), 4, TimeUnit.Hours ),<br>"dd-mm-yyyy hh:mm" )**           | Add four hours to the current date and time.                                                   | "15-07-2013 17:02" |
| **Text( DateAdd( Today(), 1, TimeUnit.Months ),<br>"dd-mm-yyyy hh:mm" )**        | Adds one month to the current date, without time as **Today** doesn't return a time component. | "15-08-2013 00:00" |
| **Text( DateAdd( Now(), &#8209;30, TimeUnit.Minutes ),<br>"dd-mm-yyyy hh:mm" )** | Subtracts 30 minutes from the current date and time.                                           | "15-07-2013 12:32" |

### Simple DateDiff

| Formula                                              | Description                                                                                                                                                                 | Result |
| ---------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| **DateDiff( Now(), DateValue("1/1/2014") )**         | Returns the difference between the two units in the default units of **TimeUnit.Days**                                                                                               | 170    |
| **DateDiff( Now(), DateValue("1/1/2014"), TimeUnit.Months )** | Returns the difference between the two values in **TimeUnit.Months**                                                                                                                 | 6      |
| **DateDiff( Now(), Today(), TimeUnit.Minutes )**              | Returns the difference between the current date/time and the current date only (no time) in minutes. Since the **Now** is later than **Today** the result will be negative. | -782   |

### Difference of dates with fractional results

The function DateDiff only returns a whole number of the units being subtracted, and the precision is given in the unit specified. To calculate the difference with a higher precision, use a smaller unit, and convert the result appropriately, like in the examples below.

| Formula                                                                    | Description                                                                                                        | Result |
| -------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------ |
| **DateDiff( TimeValue("09:45:00"), TimeValue("10:15:36"), TimeUnit.Hours )**        | The minutes/seconds are ignored, the difference is based on the time up to the hour.                               | 1      |
| **DateDiff( TimeValue("09:45:00"), TimeValue("10:15:36"), TimeUnit.Minutes )/60**   | The minutes are used in the difference, and the result is divided by 60 to have the difference in hours.           | 0.5    |
| **DateDiff( TimeValue("09:45:00"), TimeValue("10:15:36"), TimeUnit.Seconds )/3600** | The minutes and seconds are used in the difference; the result is divided by 3600 to have the difference in hours. | 0.51   |

### Converting to UTC

To convert to UTC (Coordinated Universal Time), add the **TimeZoneOffset** for the given time.

For example, imagine the current date and time is **July 15, 2013, 1:02 PM** in Pacific Daylight Time (PDT, UTC-7). To determine the current time in UTC, use:

- **DateAdd( Now(), TimeZoneOffset(), TimeUnit.Minutes )**

**TimeZoneOffset** defaults to the current time, so you don't need to pass it an argument.

To see the result, use the **Text** function with the format _dd-mm-yyyy hh:mm_, which will return **15-07-2013 20:02**.

### Converting from UTC

To convert from UTC, subtract the **TimeZoneOffset** (by adding the negative) for the given time.

For example, imagine the UTC date and time **July 15, 2013, 8:02 PM** is stored in a variable named **StartTime**. To adjust the time for the user's time zone, use:

- **DateAdd( StartTime, &minus;TimeZoneOffset( StartTime ), TimeUnit.Minutes )**

Note the negative sign before **TimeZoneOffset** to subtract the offset rather than add it.

To see the result, use the **Text** function with the format _dd-mm-yyyy hh:mm_, which will result in **15-07-2013 13:02** if you're in Pacific Daylight Time.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































