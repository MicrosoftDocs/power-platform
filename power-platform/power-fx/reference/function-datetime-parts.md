﻿---
title: Day, Month, Year, Hour, Minute, Second, and Weekday functions
description: Reference information including syntax and examples for the Day, Month, Year, Hour, Minute, Second, and Weekday functions.
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

# Day, Month, Year, Hour, Minute, Second, and Weekday functions
[!INCLUDE[function-datetime-parts-applies-to](includes/function-datetime-parts-applies-to.md)]



Returns individual components of a Date/Time value.

## Description

The **Day** function returns the day component of a Date/Time value, ranging from 1 to 31.

The **Month** function returns the month component of a Date/Time value, ranging from 1 to 12.

The **Year** function returns the year component of a Date/Time value, starting with 1900.

The **Hour** function returns the hour component of a Date/Time value, ranging from 0 (12:00 AM) to 23 (11:00 PM).

The **Minute** function returns the minute component of a Date/Time value, ranging from 0 to 59.

The **Second** function returns the second component of a Date/Time value, ranging from 0 to 59.

The **Weekday** function returns the weekday of a Date/Time value. By default, the result ranges from 1 (Sunday) to 7 (Saturday). You can specify a different range with a Microsoft Excel Weekday function code or a StartOfWeek enumeration value:

| Excel code    | StartOfWeek enumeration    | Description                                       |
| ------------- | -------------------------- | ------------------------------------------------- |
| **1**, **17** | **StartOfWeek.Sunday**     | Numbers 1 (Sunday) through 7 (Saturday). Default. |
| **2**, **11** | **StartOfWeek.Monday**     | Numbers 1 (Monday) through 7 (Sunday).            |
| **3**         | **StartOfWeek.MondayZero** | Numbers 0 (Monday) through 6 (Sunday).            |
| **12**        | **StartOfWeek.Tuesday**    | Numbers 1 (Tuesday) through 7 (Monday).           |
| **13**        | **StartOfWeek.Wednesday**  | Numbers 1 (Wednesday) through 7 (Tuesday).        |
| **14**        | **StartOfWeek.Thursday**   | Numbers 1 (Thursday) through 7 (Wednesday).       |
| **15**        | **StartOfWeek.Friday**     | Numbers 1 (Friday) through 7 (Thursday).          |
| **16**        | **StartOfWeek.Saturday**   | Numbers 1 (Saturday) through 7 (Friday).          |

All functions return a number.

See [working with dates and times](/power-apps/maker/canvas-apps/show-text-dates-times) for more information.

## Syntax

**Day**( _DateTime_ )<br>**Month**( _DateTime_ )<br>**Year**( _DateTime_ )<br>**Hour**( _DateTime_ )<br>**Minute**( _DateTime_ )<br>**Second**( _DateTime_ )

- _DateTime_ - Required. Date/Time value to operate on.

**Weekday**( _DateTime_ [, *WeekdayFirst* ] )<br>

- _DateTime_ - Required. Date/Time value to operate on.
- _WeekdayFirst_ - Optional. Excel code specifying which day starts the week. If not supplied, 1 (Sunday first) is used.

## Examples

For the following example, the current time is **3:59:37 PM** on **Thursday, April 9, 2015**.

| Formula                                                    | Description                                                                                                                                    | Result |
| ---------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| **Year(&nbsp;Now()&nbsp;)**                                | Returns the year component of the current time and date.                                                                                       | 2015   |
| **Month(&nbsp;Now()&nbsp;)**                               | Returns the month component of the current time and date.                                                                                      | 4      |
| **Day(&nbsp;Now()&nbsp;)**                                 | Returns the day component of the current time and date.                                                                                        | 9      |
| **Hour(&nbsp;Now()&nbsp;)**                                | Returns the hour component of the current time and date.                                                                                       | 15     |
| **Minute(&nbsp;Now()&nbsp;)**                              | Returns the minute component of the current time and date.                                                                                     | 59     |
| **Second(&nbsp;Now()&nbsp;)**                              | Returns the second component of the current time and date.                                                                                     | 37     |
| **Weekday(&nbsp;Now()&nbsp;)**                             | Returns the weekday component of the current time and date, using the default start of the week as Sunday.                                     | 5      |
| **Weekday(&nbsp;Now(),&nbsp;14&nbsp;)**                    | Returns the weekday component of the current time and date, using an Excel code to specify the start of the week as Thursday.                  | 1      |
| **Weekday(&nbsp;Now(),&nbsp;StartOfWeek.Wednesday&nbsp;)** | Returns the weekday component of the current time and date, using a **StartOfWeek** enumeration to specify the start of the week as Wednesday. | 2      |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































