---
title: Date and Time functions in Power Apps
description: Reference information including syntax and examples for the Date and Time functions in Power Apps.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 11/07/2015
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# Date and Time functions in Power Apps

Converts date and time components to a date/time value.

## Description

The **Date** function converts individual Year, Month, and Day values to a Date/Time value. The time portion is midnight.

- If Year is between 0 and 1899 (inclusive), the function adds that value to 1900 to calculate the year. **70** becomes **1970**.
- If Month is less than 1 or more than 12, the result subtracts or adds that many months from the beginning of the specified year.
- If Day is greater than the number of days in the specified month, the function adds that many days to the first day of the month and returns the corresponding date from a subsequent month. If Day is less than 1, the function subtracts that many days, plus 1, from the first day of the specified month.

The **Time** function converts individual Hour, Minute, and Second values to a Date/Time value. The result has no date associated with it.

See the **[DateValue](function-datevalue-timevalue.md)**, **[TimeValue](function-datevalue-timevalue.md)**, and **[DateTimeValue](function-datevalue-timevalue.md)** functions for information about how to convert a string to a value.

Also see [working with dates and times](/power-apps/maker/canvas-apps/show-text-dates-times) for more information.

## Syntax

**Date**( _Year_, _Month_, _Day_ )

- _Year_ - Required. Numbers greater than 1899 are interpreted as absolute (1980 is interpreted as 1980); numbers that range from 0 to 1899 are interpreted as relative to 1900. (For example, 80 is interpreted as 1980.)
- _Month_ - Required. A number that ranges from 1 to 12.
- _Day_ - Required. A number that ranges from 1 to 31.

**Time**( _Hour_, _Minute_, _Second_ )

- _Hour_ - Required. A number that ranges from 0 (12:00 AM) to 23 (11:00 PM).
- _Minute_ - Required. A number that ranges from 0 to 59.
- _Second_ - Required. A number that ranges from 0 to 59.

## Examples

### Date

If a user typed **1979** in a text-input control named **HireYear**, **3** in a text-input control named **HireMonth**, and **17** in a text-input control named **HireDay**, this function would return **3/17/1979**:

**Date(Value(HireYear.Text), Value(HireMonth.Text), Value(HireDay.Text))**

### Time

If a user typed **14** in a text-input control named **BirthHour**, **50** in a text-input control named **BirthMinute**, and **24** in a text-input control named **BirthSecond**, this function would return **02:50:24 p**.

**Text(Time(Value(BirthHour.Text), Value(BirthMinute.Text), Value(BirthSecond.Text)), "hh:mm:ss a/p")**

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
