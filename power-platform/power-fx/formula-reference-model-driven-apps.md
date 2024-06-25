---
title: Formula reference - Model-driven apps
description: Reference information for functions, signals, and enumerations available with model-driven apps in Power Apps.
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

# Formula reference - model-driven apps

In this article, learn about all the functions available with [commanding in Power Apps model-driven apps](/power-apps/maker/model-driven-apps/commanding-use-powerfx).

## A

**[Abs](reference/function-numericals.md )** – Absolute value of a number.

**[Acceleration](reference/signals.md)** – Reads the acceleration sensor in your device.

**[Acos](reference/function-trig.md)** – Returns the arccosine of a number, in radians.

**[Acot](reference/function-trig.md)** – Returns the arccotangent of a number, in radians.

**[AddColumns](reference/function-table-shaping.md)** – Returns a table with [columns](/power-apps/maker/canvas-apps/working-with-tables#columns) added.

**[And](reference/function-logicals.md )** – Boolean logic AND. Returns true if all arguments are true. You can also use the [&& operator](reference/operators.md).

**[App](reference/object-app.md)** – Provides information about the currently running app and control over the app's behavior.

**[Asin](reference/function-trig.md)** – Returns the arcsine of a number, in radians.

**[Assert](reference/function-assert.md)** – Evaluates to true or false in a test.

**[As](reference/operators.md#thisitem-thisrecord-and-as-operators)** – Names the current record in gallery, form, and record scope functions such as **ForAll**, **With**, and **Sum**.

**[AsType](reference/function-astype-istype.md)** – Treats a record reference as a specific table type.

**[Atan](reference/function-trig.md)** – Returns the arctangent of a number, in radians.

**[Atan2](reference/function-trig.md)** – Returns the arctangent based on an (_x_,_y_) coordinate, in radians.

**[Average](reference/function-aggregates.md )** – Calculates the average of a table expression or a set of arguments.

## B

**[Blank](reference/function-isblank-isempty.md )** – Returns a *blank* value that can be used to insert a NULL value in a data source.

**[Boolean](reference/function-boolean.md)** – Converts a text string, number, or untyped value to a Boolean value.

## C

**[Calendar](reference/function-clock-calendar.md)** – Retrieves information about the calendar for the current locale.

**[Char](reference/function-char.md )** – Translates a character code into a string.

**[Choices](reference/function-choices.md)** – Returns a table of the possible values for a lookup column.

**[Clock](reference/function-clock-calendar.md)** – Retrieves information about the clock for the current locale.

**[Coalesce](reference/function-isblank-isempty.md)** – Replaces _blank_ values while leaving non-_blank_ values unchanged.

**[Collect](reference/function-clear-collect-clearcollect.md)** – Creates a collection or adds data to a data source.

**[Color](reference/function-colors.md)** – Sets a property to a built-in color value.

**[ColorFade](reference/function-colors.md)** – Fades a color value.

**[ColorValue](reference/function-colors.md)** – Translates a CSS color name or a hex code to a color value.

**[Column](reference/function-columnnames-column.md)** – Retrieves column names and values from an [Untyped object data type](untyped-object.md).

**[ColumnNames](reference/function-columnnames-column.md)** – Retrieves column names and values from an [Untyped object data type](untyped-object.md).

**[Compass](reference/signals.md)** – Returns your compass heading.

**[Concat](reference/function-concatenate.md)** – Concatenates strings in a data source.

**[Concatenate](reference/function-concatenate.md )** – Concatenates strings.

**[Concurrent](reference/function-concurrent.md)** – Evaluates multiple formulas concurrently with one another.

**[Connection](reference/signals.md)** – Returns information about your network connection.

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

**[DateAdd](reference/function-dateadd-datediff.md )** – Adds days, months, quarters, or years to a date/time value.

**[DateDiff](reference/function-dateadd-datediff.md )** – Subtracts two date values, and shows the result in days, months, quarters, or years.

**[DateTime](reference/function-date-time.md)** – Returns a date/time value, based on both date and time components.

**[DateTimeValue](reference/function-datevalue-timevalue.md)** – Converts a date and time string to a date/time value.

**[DateValue](reference/function-datevalue-timevalue.md)** – Converts a date-only string to a date/time value.

**[Day](reference/function-datetime-parts.md )** – Retrieves the day portion of a date/time value.

**[Dec2Hex](reference/function-hexdec.md)** – Convert a number to a hexadecimal text string.

**[Defaults](reference/function-defaults.md)** – Returns the default values for a data source.

**[Defaults](reference/function-defaults.md )** – Returns the default values for a data source.

**[Degrees](reference/function-trig.md)** – Converts radians to degrees.

**[Disable](reference/function-enable-disable.md)** – Disables a signal, such as **[Location](reference/signals.md)** for reading the GPS.

**[Download](reference/function-download.md)** – Downloads a file from the web to the local device.

**[DropColumns](reference/function-table-shaping.md)** – Returns a table with one or more columns removed.

## E

**[EDate](reference/function-edate-eomonth.md)** – Adds or subtracts months to a date, without changing the day of the month.

**[EncodeHTML](reference/function-encode-decode.md)** – Encodes characters that need to be escaped to be used in an HTML context.

**[EncodeUrl](reference/function-encode-decode.md)** – Encodes special characters using URL encoding.

**[EndsWith](reference/function-startswith.md )** – Checks whether a text string ends with another text string.

**[EOMonth](reference/function-edate-eomonth.md)** – Adds or subtracts months to a date, returning the last day of that month.

**[Error](reference/function-iferror.md)** – Create a custom error or pass through an error.

**[Errors](reference/function-errors.md)** – Provides error information for previous changes to a data source.

**[exactin](reference/operators.md#in-and-exactin-operators)** – Checks if a text string is contained within another text string or table, case dependent. Also used to check if a record is in a table.

**[Exp](reference/function-numericals.md)** – Returns _e_ raised to a power.

## G

**[GroupBy](reference/function-groupby.md )** – Returns a table with records grouped together.

## H

**[Hour](reference/function-datetime-parts.md )** – Returns the hour portion of a date/time value.

## I

**[If](reference/function-if.md )** – Returns one value if a condition is true and another value if not.

**[IfError](reference/function-iferror.md )** – Detects errors and provides an alternative value or takes action.


**[Int](reference/function-round.md )** – Rounds down to the nearest integer.

**[IsBlank](reference/function-isblank-isempty.md )** – Checks for a [blank](reference/function-isblank-isempty.md) value.

**[IsError](reference/function-iferror.md )** – Checks for an error.

**[ISOWeekNum](reference/function-weeknum.md )** – Returns the ISO week number of a date/time value.

**[IsUTCToday](reference/function-now-today-istoday.md )** – Checks whether a date/time value is sometime today in Coordinated Universal Time (UTC).

## J

**[JSON](reference/function-json.md )** – Generates a JSON text string for a table, a record, or a value.

## L

**[Lower](reference/function-lower-upper-proper.md )** – Converts letters in a string of text to all lowercase.

## M

**[Max](reference/function-aggregates.md )** – Maximum value of a table expression or a set of arguments.

**[Mid](reference/function-left-mid-right.md )** – Returns the middle portion of a string.

**[Min](reference/function-aggregates.md )** – Minimum value of a table expression or a set of arguments.

**[Minute](reference/function-datetime-parts.md )** – Retrieves the minute portion of a date/time value.

**[Mod](reference/function-mod.md )** – Returns the remainder after a dividend is divided by a divisor.

**[Month](reference/function-datetime-parts.md )** – Retrieves the month portion of a date/time value.

## N

**[Not](reference/function-logicals.md )** – Boolean logic NOT. Returns true if its argument is false, and returns false if its argument is true. You can also use the [! operator](reference/operators.md).

## O

**[Or](reference/function-logicals.md )** – Boolean logic OR. Returns true if any of its arguments are true. You can also use the [|| operator](reference/operators.md).

## P

**[PlainText](reference/function-encode-decode.md )** – Removes HTML and XML tags from a string.

## R

**[Replace](reference/function-replace-substitute.md )** – Replaces part of a string with another string, by starting position of the string.

**[Right](reference/function-left-mid-right.md )** – Returns the right-most portion of a string.

**[Round](reference/function-round.md )** – Rounds to the closest number.

**[RoundDown](reference/function-round.md )** – Rounds down to the largest previous number.

**[RoundUp](reference/function-round.md )** – Rounds up to the smallest next number.

## S

**[Second](reference/function-datetime-parts.md )** – Retrieves the second portion of a date/time value.

**[StartsWith](reference/function-startswith.md )** – Checks if a text string begins with another text string.

**[Substitute](reference/function-replace-substitute.md )** – Replaces part of a string with another string, by matching strings.

**[Sum](reference/function-aggregates.md )** – Calculates the sum of a table expression or a set of arguments.

**[Switch](reference/function-if.md )** – Matches with a set of values and then evaluates a corresponding formula.

## T

**[Text](reference/function-text.md )** – Converts any value and formats a number or date/time value to a string of text.

**[Trim](reference/function-trim.md )** – Removes extra spaces from the ends and interior of a string of text.

**[Trunc](reference/function-round.md )** – Truncates the number to only the integer portion by removing any decimal portion.

**[TrimEnds](reference/function-trim.md )** – Removes extra spaces from the ends of a string of text only.

## U

**[Upper](reference/function-lower-upper-proper.md )** – Converts letters in a string of text to all uppercase.

**[UTCNow](reference/function-now-today-istoday.md )** – Returns the current date/time value in Coordinated Universal Time (UTC).

**[UTCToday](reference/function-now-today-istoday.md )** – Returns the current date-only value in Coordinated Universal Time (UTC).

## V

**[Value](reference/function-value.md )** – Converts a string to a number.

**[Validate](reference/function-validate.md )** – Checks whether the value of a single column or a complete record is valid for a data source.

## W

**[WeekNum](reference/function-weeknum.md )** – Returns the week number of a date/time value.

## Y

**[Year](reference/function-datetime-parts.md )** – Retrieves the year portion of a date/time value.