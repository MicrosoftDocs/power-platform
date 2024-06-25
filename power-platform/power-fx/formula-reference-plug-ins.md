---
title: Formula reference - Dataverse plug-ins
description: Reference information for functions, signals, and enumerations available with plug-ins in Microsoft Dataverse.
author: gregli-msft
ms.topic: reference
ms.reviewer: matp
ms.date: 6/25/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - Mattp123
  - gregli-msft
  - gregli
---

# Formula reference - Dataverse plug-ins

In this article, learn about all the functions available with [plug-ins in Microsoft Dataverse](/power-apps/maker/data-platform/low-code-plug-ins?tabs=instant).

## A

**[Abs](reference/function-numericals.md)** – Absolute value of a number.

**[Acos](reference/function-trig.md)** – Returns the arccosine of a number, in radians.

**[Acot](reference/function-trig.md)** – Returns the arccotangent of a number, in radians.

**[And](reference/function-logicals.md)** – Boolean logic AND. Returns **true** if all arguments are **true**. You can also use the [**&&** operator](reference/operators.md).

**[Asin](reference/function-trig.md)** – Returns the arcsine of a number, in radians.

**[Assert](reference/function-assert.md)** – Evaluates to true or false in a test.

**[AsType](reference/function-astype-istype.md)** – Treats a record reference as a specific table type.

**[Atan](reference/function-trig.md)** – Returns the arctangent of a number, in radians.

**[Atan2](reference/function-trig.md)** – Returns the arctangent based on an (_x_,_y_) coordinate, in radians.

**[Average](reference/function-aggregates.md)** – Calculates the average of a table expression or a set of arguments.

## B

**[Blank](reference/function-isblank-isempty.md)** – Returns a _blank_ value that can be used to insert a NULL value in a data source.

**[Boolean](reference/function-boolean.md)** – Converts a text string, number, or untyped value to a Boolean value.

## C

**[Char](reference/function-char.md)** – Translates a character code into a string.

**[Coalesce](reference/function-isblank-isempty.md)** – Replaces _blank_ values while leaving non-_blank_ values unchanged.

**[Collect](reference/function-clear-collect-clearcollect.md )** – Creates a collection or adds data to a data source.

**[Color](reference/function-colors.md)** – Sets a property to a built-in color value.

**[ColorFade](reference/function-colors.md)** – Fades a color value.

**[ColorValue](reference/function-colors.md)** – Translates a CSS color name or a hex code to a color value.

**[Column](reference/function-columnnames-column.md)** – Retrieves column names and values from an [Untyped object data type](untyped-object.md).

**[ColumnNames](reference/function-columnnames-column.md)** – Retrieves column names and values from an [Untyped object data type](untyped-object.md).

**[Concatenate](reference/function-concatenate.md)** – Concatenates strings.

**[Concurrent](reference/function-concurrent.md)** – Evaluates multiple formulas concurrently with one another.

**[Copy](reference/function-copy.md)** – Copies text to the clipboard on the device where the app is running.

**[Count](reference/function-table-counts.md)** – Counts table records that contain numbers.

**[Cos](reference/function-trig.md)** – Returns the cosine of an angle specified in radians.

**[Cot](reference/function-trig.md)** – Returns the cotangent of an angle specified in radians.

**[CountA](reference/function-table-counts.md)** – Counts table records that aren't [empty](reference/function-isblank-isempty.md).

**[CountIf](reference/function-table-counts.md)** – Counts table records that satisfy a condition.

**[CountRows](reference/function-table-counts.md)** – Counts table records.

## D

**[DataSourceInfo](reference/function-datasourceinfo.md)** – Provides information about a data source.

**[Date](reference/function-date-time.md)** – Returns a date/time value, based on **Year**, **Month**, and **Day** values.

**[DateAdd](reference/function-dateadd-datediff.md)** – Adds days, months, quarters, or years to a date/time value.

**[DateDiff](reference/function-dateadd-datediff.md)** – Subtracts two date values, and shows the result in days, months, quarters, or years.

**[DateTime](reference/function-date-time.md)** – Returns a date/time value, based on both date and time components.

**[DateTimeValue](reference/function-datevalue-timevalue.md)** – Converts a date and time string to a date/time value.

**[DateValue](reference/function-datevalue-timevalue.md)** – Converts a date-only string to a date/time value.

**[Day](reference/function-datetime-parts.md)** – Retrieves the day portion of a date/time value.

**[Dec2Hex](reference/function-hexdec.md)** – Convert a number to a hexadecimal text string.

**[Degrees](reference/function-trig.md)** – Converts radians to degrees.

**[Disable](reference/function-enable-disable.md)** – Disables a signal, such as **[Location](reference/signals.md)** for reading the GPS.

**[Distinct](reference/function-distinct.md)** – Summarizes records of a table, removing duplicates.

## E

**[EDate](reference/function-edate-eomonth.md)** – Adds or subtracts months to a date, without changing the day of the month.

**[EncodeHTML](reference/function-encode-decode.md)** – Encodes characters that need to be escaped to be used in an HTML context.

**[EncodeUrl](reference/function-encode-decode.md)** – Encodes special characters using URL encoding.

**[EndsWith](reference/function-startswith.md)** – Checks whether a text string ends with another text string.

**[EOMonth](reference/function-edate-eomonth.md)** – Adds or subtracts months to a date, returning the last day of that month.

**[Error](reference/function-iferror.md)** – Create a custom error or pass through an error.

**[exactin](reference/operators.md#in-and-exactin-operators)** – Checks if a text string is contained within another text string or table, case dependent. Also used to check if a record is in a table.

**[Exit](reference/function-exit.md)** – Exits the currently running app and optionally signs out the current user.

**[Exp](reference/function-numericals.md)** – Returns _e_ raised to a power.

## F

<!-- Start here-->

## H

**[Hex2Dec](reference/function-hexdec.md)** – Convert a hexadecimal text string to a number.

## S

**[Set](reference/function-set.md )** – Sets the value of a global variable.


