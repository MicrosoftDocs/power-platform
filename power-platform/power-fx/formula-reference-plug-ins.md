---
title: Formula reference - Dataverse plug-ins
description: Reference information for functions, signals, and enumerations available with low-code plug-ins in Microsoft Dataverse.
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

# Formula reference - Dataverse functions and low-code plug-ins

In this article, learn about all the formulas available with [functions](/power-apps/maker/data-platform/functions-overview) and [low-code plug-ins](/power-apps/maker/data-platform/low-code-plug-ins?tabs=instant) in Microsoft Dataverse.

## A

**[Abs](reference/function-numericals.md)** – Absolute value of a number.

**[Acos](reference/function-trig.md)** – Returns the arccosine of a number, in radians.

**[Acot](reference/function-trig.md)** – Returns the arccotangent of a number, in radians.

**[AddColumns](reference/function-table-shaping.md)** – Returns a table with [columns](/power-apps/maker/canvas-apps/working-with-tables#columns) added.

**[AIClassify](reference/function-ai.md)** – Classifies text into one or more of categories.

**[AIExtract](reference/function-ai.md)** – Extracts specified entities such as registration numbers, phone numbers, or names of people.

**[AIReply](reference/function-ai.md)** – Drafts a reply to the message that you provide.

**[AISentiment](reference/function-ai.md)** – Detects the sentiment of the text that you provide.

**[AISummarize](reference/function-ai.md)** – Summarizes the text that you provide.

**[AITranslate](reference/function-ai.md)** – Translates text from another language.

**[And](reference/function-logicals.md)** – Boolean logic AND. Returns **true** if all arguments are **true**. You can also use the [**&&** operator](reference/operators.md).

**[Asin](reference/function-trig.md)** – Returns the arcsine of a number, in radians.

**[AsType](reference/function-astype-istype.md)** – Treats a record reference as a specific table type.

**[Atan](reference/function-trig.md)** – Returns the arctangent of a number, in radians.

**[Atan2](reference/function-trig.md)** – Returns the arctangent based on an (_x_,_y_) coordinate, in radians.

**[Average](reference/function-aggregates.md)** – Calculates the average of a table expression or a set of arguments.

## B

**[Blank](reference/function-isblank-isempty.md)** – Returns a _blank_ value that can be used to insert a NULL value in a data source.

**[Boolean](reference/function-boolean.md)** – Converts a text string, number, or dynamic value to a Boolean value.

## C

**[Char](reference/function-char.md)** – Translates a character code into a string.

**[Clear](reference/function-clear-collect-clearcollect.md)** – Deletes all data from a [collection](/power-apps/maker/canvas-apps/working-with-data-sources#collections).

**[Coalesce](reference/function-isblank-isempty.md)** – Replaces _blank_ values while leaving non-_blank_ values unchanged.

**[Collect](reference/function-clear-collect-clearcollect.md )** – Creates a collection or adds data to a data source.

**[Color](reference/function-colors.md)** – Sets a property to a built-in color value.

**[ColorFade](reference/function-colors.md)** – Fades a color value.

**[ColorValue](reference/function-colors.md)** – Translates a CSS color name or a hex code to a color value.

**[Column](reference/function-columnnames-column.md)** – Retrieves column names and values from a [Dynamic data type](untyped-object.md).

**[ColumnNames](reference/function-columnnames-column.md)** – Retrieves column names and values from a [Dynamic data type](untyped-object.md).

**[Concat](reference/function-concatenate.md)** – Concatenates strings in a data source.

**[Concatenate](reference/function-concatenate.md)** – Concatenates strings.

**[Count](reference/function-table-counts.md)** – Counts table records that contain numbers.

**[Cos](reference/function-trig.md)** – Returns the cosine of an angle specified in radians.

**[Cot](reference/function-trig.md)** – Returns the cotangent of an angle specified in radians.

**[CountA](reference/function-table-counts.md)** – Counts table records that aren't [empty](reference/function-isblank-isempty.md).

**[CountIf](reference/function-table-counts.md)** – Counts table records that satisfy a condition.

**[CountRows](reference/function-table-counts.md)** – Counts table records.

## D

**[Date](reference/function-date-time.md)** – Returns a date/time value, based on **Year**, **Month**, and **Day** values.

**[DateAdd](reference/function-dateadd-datediff.md)** – Adds days, months, quarters, or years to a date/time value.

**[DateDiff](reference/function-dateadd-datediff.md)** – Subtracts two date values, and shows the result in days, months, quarters, or years.

**[DateTime](reference/function-date-time.md)** – Returns a date/time value, based on both date and time components.

**[DateTimeValue](reference/function-datevalue-timevalue.md)** – Converts a date and time string to a date/time value.

**[DateValue](reference/function-datevalue-timevalue.md)** – Converts a date-only string to a date/time value.

**[Day](reference/function-datetime-parts.md)** – Retrieves the day portion of a date/time value.

**[Dec2Hex](reference/function-hexdec.md)** – Convert a number to a hexadecimal text string.

**[Decimal](reference/function-value.md)** – Converts a string to a [decimal number](data-types.md#decimal-numbers).

**[Degrees](reference/function-trig.md)** – Converts radians to degrees.

**[Distinct](reference/function-distinct.md)** – Summarizes records of a table, removing duplicates.

**[DropColumns](reference/function-table-shaping.md)** – Returns a table with one or more columns removed.

## E

**[EDate](reference/function-edate-eomonth.md)** – Adds or subtracts months to a date, without changing the day of the month.

**[EncodeHTML](reference/function-encode-decode.md)** – Encodes characters that need to be escaped to be used in an HTML context.

**[EncodeUrl](reference/function-encode-decode.md)** – Encodes special characters using URL encoding.

**[EndsWith](reference/function-startswith.md)** – Checks whether a text string ends with another text string.

**[EOMonth](reference/function-edate-eomonth.md)** – Adds or subtracts months to a date, returning the last day of that month.

**[Error](reference/function-iferror.md)** – Create a custom error or pass through an error.

**[exactin](reference/operators.md#in-and-exactin-operators)** – Checks if a text string is contained within another text string or table, case dependent. Also used to check if a record is in a table.

**[Exp](reference/function-numericals.md)** – Returns _e_ raised to a power.

## F

**[Filter](reference/function-filter-lookup.md)** – Returns a filtered table based on one or more criteria.

**[Find](reference/function-find.md)** – Checks whether one string appears within another and returns the location.

**[First](reference/function-first-last.md)** – Returns the first record of a table.

**[FirstN](reference/function-first-last.md)** – Returns the first set of records (N records) of a table.

**[Float](reference/function-value.md)** – Converts a string to a [floating point number](data-types.md#floating-point-numbers).

**[ForAll](reference/function-forall.md)** – Calculates values and performs actions for all records of a table.

## G

**[GUID](reference/function-guid.md)** – Converts a GUID string to a GUID value or creates a new GUID value.

## H

**[Hex2Dec](reference/function-hexdec.md)** – Convert a hexadecimal text string to a number.

**[Hour](reference/function-datetime-parts.md)** – Returns the hour portion of a date/time value.

## I

**[If](reference/function-if.md)** – Returns one value if a condition is true and another value if not.

**[IfError](reference/function-iferror.md)** – Detects errors and provides an alternative value or takes action.

**[in](reference/operators.md#in-and-exactin-operators)** – Checks if a text string is contained within another text string or table, case independent. Also used to check if a record is in a table.

**[Index](reference/function-first-last.md)** – Returns a record from a table based on ordered position.

**[Int](reference/function-round.md)** – Rounds down to the nearest integer.

**[IsBlank](reference/function-isblank-isempty.md)** – Checks for a [blank](reference/function-isblank-isempty.md) value.

**[IsBlankOrError](reference/function-iferror.md)** – Checks for a [blank](reference/function-isblank-isempty.md) value or error.

**[IsEmpty](reference/function-isblank-isempty.md)** – Checks for an empty table.

**[IsError](reference/function-iferror.md)** – Checks for an error.

**[IsMatch](reference/function-ismatch.md)** – Checks a string against a pattern. Regular expressions can be used.

**[IsNumeric](reference/function-isnumeric.md)** – Checks for a numeric value.

**[IsToday](reference/function-now-today-istoday.md)** – Checks whether a date/time value is sometime today in the user's time zone.

**[IsType](reference/function-astype-istype.md)** – Checks whether a record reference refers to a specific table type.

## J

**[JSON](reference/function-json.md)** – Generates a JSON text string for a table, a record, or a value.

## L

**[Language](reference/function-language.md)** – Returns the language tag of the current user.

**[Last](reference/function-first-last.md)** – Returns the last record of a table.

**[LastN](reference/function-first-last.md)** – Returns the last set of records (N records) of a table.

**[Left](reference/function-left-mid-right.md)** – Returns the left-most portion of a string.

**[Len](reference/function-len.md)** – Returns the length of a string.

**[Ln](reference/function-numericals.md)** – Returns the natural log.

**[Log](reference/function-numericals.md)** – Returns the logarithm in any base of a number.

**[LookUp](reference/function-filter-lookup.md)** – Looks up a single record in a table based on one or more criteria.

**[Lower](reference/function-lower-upper-proper.md)** – Converts letters in a string of text to all lowercase.

## M

**[Match](reference/function-ismatch.md)** – Extracts a substring based on a pattern. Regular expressions can be used.

**[MatchAll](reference/function-ismatch.md)** – Extracts multiple substrings based on a pattern. Regular expressions can be used.

**[Max](reference/function-aggregates.md)** – Maximum value of a table expression or a set of arguments.

**[Mid](reference/function-left-mid-right.md)** – Returns the middle portion of a string.

**[Min](reference/function-aggregates.md)** – Minimum value of a table expression or a set of arguments.

**[Minute](reference/function-datetime-parts.md)** – Retrieves the minute portion of a date/time value.

**[Mod](reference/function-mod.md)** – Returns the remainder after a dividend is divided by a divisor.

**[Month](reference/function-datetime-parts.md)** – Retrieves the month portion of a date/time value.

## N

**[Not](reference/function-logicals.md)** – Boolean logic NOT. Returns **true** if its argument is **false**, and returns **false** if its argument is **true**. You can also use the [**!** operator](reference/operators.md).

**[Now](reference/function-now-today-istoday.md)** – Returns the current date/time value in the user's time zone.

## O

**[Or](reference/function-logicals.md)** – Boolean logic OR. Returns **true** if any of its arguments are **true**. You can also use the [**||** operator](reference/operators.md).

## P

**[Parent](reference/operators.md#self-and-parent-operators)** – Provides access to a container control's properties.

**[ParseJSON](reference/function-parsejson.md)** – Converts JSON document represented as text to a [Dynamic](untyped-object.md) value.

**[Patch](reference/function-patch.md)** – Modifies or creates a record in a data source, or merges records outside of a data source.

**[Pi](reference/function-trig.md)** – Returns the number &pi;.

**[PlainText](reference/function-encode-decode.md)** – Removes HTML and XML tags from a string.

**[Power](reference/function-numericals.md)** – Returns a number raised to a power. You can also use the [**^** operator](reference/operators.md).

**[Proper](reference/function-lower-upper-proper.md)** – Converts the first letter of each word in a string to uppercase, and converts the rest to lowercase.

## R

**[Radians](reference/function-trig.md)** – Converts degrees to radians.

**[Rand](reference/function-rand.md)** – Returns a pseudo-random number between 0 and 1.

**[RandBetween](reference/function-rand.md)** – Returns a pseudo-random number between two numbers.

**[Refresh](reference/function-refresh.md)** – Refreshes the records of a data source.

**[Remove](reference/function-remove-removeif.md)** – Removes one or more specific records from a data source.

**[Replace](reference/function-replace-substitute.md)** – Replaces part of a string with another string, by starting position of the string.

**[RenameColumns](reference/function-table-shaping.md)** – Renames columns of a table.

**[RGBA](reference/function-colors.md)** – Returns a color value for a set of red, green, blue, and alpha components.

**[Right](reference/function-left-mid-right.md)** – Returns the right-most portion of a string.

**[Round](reference/function-round.md)** – Rounds to the closest number.

**[RoundDown](reference/function-round.md)** – Rounds down to the largest previous number.

**[RoundUp](reference/function-round.md)** – Rounds up to the smallest next number.

## S

**[Search](reference/function-filter-lookup.md)** – Finds records in a table that contain a string in one of their columns.

**[Second](reference/function-datetime-parts.md)** – Retrieves the second portion of a date/time value.

**[Self](reference/operators.md#self-and-parent-operators)** – Provides access to the properties of the current control.

**[Sequence](reference/function-sequence.md)** – Generate a table of sequential numbers, useful when iterating with **ForAll**.

**[Set](reference/function-set.md )** – Sets the value of a global variable.

**[ShowColumns](reference/function-table-shaping.md)** – Returns a table with only selected columns.

**[Shuffle](reference/function-shuffle.md)** – Randomly reorders the records of a table.

**[Sin](reference/function-trig.md)** – Returns the sine of an angle specified in radians.

**[Sort](reference/function-sort.md)** – Returns a sorted table based on a formula.

**[SortByColumns](reference/function-sort.md)** – Returns a sorted table based on one or more columns.

**[Split](reference/function-split.md)** – Splits a text string into a table of substrings.

**[Sqrt](reference/function-numericals.md)** – Returns the square root of a number.

**[StartsWith](reference/function-startswith.md)** – Checks if a text string begins with another text string.

**[StdevP](reference/function-aggregates.md)** – Returns the standard deviation of its arguments.

**[Substitute](reference/function-replace-substitute.md)** – Replaces part of a string with another string, by matching strings.

**[Sum](reference/function-aggregates.md)** – Calculates the sum of a table expression or a set of arguments.

**[Summarize](reference/function-summarize.md)** – Groups records by selected columns and summarizes the remainder.

**[Switch](reference/function-if.md)** – Matches with a set of values and then evaluates a corresponding formula.

## T

**[Table](reference/function-table.md)** – Creates a temporary table.

**[Tan](reference/function-trig.md)** – Returns the tangent of an angle specified in radians.

**[Text](reference/function-text.md)** – Converts any value and formats a number or date/time value to a string of text.

**[ThisItem](reference/operators.md#thisitem-thisrecord-and-as-operators)** – Returns the record for the current item in a gallery or form control.

**[ThisRecord](reference/operators.md#thisitem-thisrecord-and-as-operators)** – Returns the record for the current item in a record scope function, such as **ForAll**, **With**, and **Sum**.

**[Time](reference/function-date-time.md)** – Returns a date/time value, based on **Hour**, **Minute**, and **Second** values.

**[TimeValue](reference/function-datevalue-timevalue.md)** – Converts a time-only string to a date/time value.

**[TimeZoneOffset](reference/function-dateadd-datediff.md)** – Returns the difference between UTC and the user's local time in minutes.

**[Today](reference/function-now-today-istoday.md)** – Returns the current date-only value.

**[Trace](reference/function-trace.md)** – Provide additional information in your test results.

**[Trim](reference/function-trim.md)** – Removes extra spaces from the ends and interior of a string of text.

**[TrimEnds](reference/function-trim.md)** – Removes extra spaces from the ends of a string of text only.

**[Trunc](reference/function-round.md)** – Truncates the number to only the integer portion by removing any decimal portion.

## U

**[UniChar](reference/function-char.md)** – Translates a Unicode code into a string.

**[Upper](reference/function-lower-upper-proper.md)** – Converts letters in a string of text to all uppercase.

**[User](reference/function-user.md)** – Returns information about the current user.

## V

**[Value](reference/function-value.md)** – Converts a string to a number.

**[VarP](reference/function-aggregates.md)** – Returns the variance of its arguments.

## W

**[Weekday](reference/function-datetime-parts.md)** – Retrieves the weekday portion of a date/time value.

**[WeekNum](reference/function-weeknum.md)** – Returns the week number of a date/time value.

**[With](reference/function-with.md)** – Calculates values and performs actions for a single record, including inline records of named values.

## Y

**[Year](reference/function-datetime-parts.md)** – Retrieves the year portion of a date/time value.
