---
title: DateValue, TimeValue, and DateTimeValue functions
description: Reference information including syntax and examples for the DateValue, TimeValue, and DateTimeValue functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 06/18/2025
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
no-loc: ["DateValue","TimeValue","DateTimeValue"]
---

# DateValue, TimeValue, and DateTimeValue functions
[!INCLUDE[function-datevalue-timevalue-applies-to](includes/function-datevalue-timevalue-applies-to.md)]



Converts date, time, or both in a _string_ to a _date/time_ value.

## Description

- **DateValue** function converts a _date string_ (like "10/01/2014") to a _date/time_ value.

- **TimeValue** function converts a _time string_ (like "12:15 PM") to a _date/time_ value.

- **DateTimeValue** function converts a _date and time string_ (like "January 10, 2013 12:13 AM") to a _date/time_ value.

**DateValue** function ignores any time information in the date string, and **TimeValue** function ignores any date information in the time string.

> [!NOTE]
> The DateValue, TimeValue, and DateTimeValue functions by default use the language from the current user's settings. You can override it to ensure that strings are interpreted properly. For example, "10/1/1920" is interpreted as _October 1<sup>st</sup>_ in "_en_" and as _January 10<sup>th</sup>_ in "_fr_".

Dates must use one of these formats:

- MM/DD/YYYY or MM-DD-YYYY
- DD/MM/YYYY or DD-MM-YYYY
- YYYY/MM/DD or YYYY-MM-DD
- MM/DD/YY or MM-DD-YY
- DD/MM/YY or DD-MM-YY
- DD Mon YYYY
- Month DD, YYYY

To convert from numeric date, month and year components, read [Date](function-date-time.md). <br>
To convert from numeric hour, minute and second components, read [Time](function-date-time.md).

For more information, see:

- [Working with date and time](/power-apps/maker/canvas-apps/show-text-dates-times)
- [Date/time and data types](../data-types.md#date-time-and-datetime)

## Syntax

**DateValue**( _String_ [, *Language* ])<br>
**DateTimeValue**( _String_ [, *Language* ])<br>
**TimeValue**( _String_ [, *Language* ])

- _String_ - Required. A text string that contains a date, time, or combination date and time value.
- _Language_ - Optional. A language string, such as would be returned by the first two characters from the [Language](function-language.md) function. If not provided, the language of the current user's settings is used.

**DateValue**( _Dynamic_ )<br>
**DateTimeValue**( _Dynamic_ )<br>
**TimeValue**( _Dynamic_ )

- _Dynamic_ - Required. [**Dynamic** value](../untyped-object.md) that represents a date or time. Acceptable values are dependent on the untyped provider.  For [**JSON**](function-parsejson.md), the dynamic value is expected to be a JSON string that contains a date and time in ISO 8601 format. Dates or times in other formats will result in an error. Consider converting such values to [**Text**](function-text.md) first, then to a date or time. Keep in mind that time zones and locale-related formats are important considerations when communicating with external systems.

## Examples

### DateValue

If you type **10/11/2014** into a text-input control named **Startdate**, and then set the [Text](/power-apps/maker/canvas-apps/controls/properties-core) property of a label to these formulas:

- Convert a date from a string in the user's locale and show the result as a long date.

  ```power-fx
  Text( DateValue( Startdate.Text ), DateTimeFormat.LongDate )
  ```

  Device set to **en** locale shows the label as **Saturday, October 11, 2014**.

  > [!NOTE]
  > You can use several options with the **DateTimeFormat** enum. To display a list of options, type the parameter followed by a dot or period (**.**) in the formula bar or check [**Text** function reference](function-text.md).

- Convert date from a string in the French locale and show the result as a long date. In this example, the months and day of the month are interpreted differently from English.

  ```power-fx
  Text( DateValue( Startdate.Text, "fr" ), DateTimeFormat.LongDate )
  ```

  Device set to **en** locale shows the label as **Monday, November 10, 2014**.

If you enter **October 20, 2014** instead:

- Convert a date from a string in the user's locale and calculate the difference between two days, in days

  ```power-fx
  DateDiff( DateValue( Startdate.Text ), Today() )
  ```

  Device set to **en** locale shows the label as **9**, indicating the number of days between October 11 and October 20. The [DateDiff](function-dateadd-datediff.md) function can also show the difference in months, quarters, or years.

### DateTimeValue

If you typed **10/11/2014 1:50:24.765 PM** into a text-input control named **Start**, and then set the [Text](/power-apps/maker/canvas-apps/controls/properties-core) property of a label to the following formula:

- Convert both a date and time string in the current locale.

  ```power-fx
  Text( DateTimeValue( Start.Text ), DateTimeFormat.LongDateTime )
  ```

  Device set to **en** locale shows the label as **Saturday, October 11, 2014 1:50:24 PM**.

  > [!NOTE]
  > You can use several options with the **DateTimeFormat** enum. To display a list of options, type the parameter followed by a dot or period (**.**) in the formula bar or check [**Text** function reference](function-text.md).

- Convert both a date and time string in the French locale. Month and day of the month are interpreted differently.

  ```power-fx
  Text( DateTimeValue( Start.Text, "fr"), DateTimeFormat.LongDateTime )
  ```

  Device set to **en** locale shows the label as **Monday, November 10, 2014 1:50:24 PM**.

- Convert both a date and time string in the user's locale, and display the result with a fractional second.

  ```power-fx
  Text( DateTimeValue( Start.Text ), "dddd, mmmm dd, yyyy hh:mm:ss.fff AM/PM" )
  ```

  Device set to **en** locale shows the label as **Saturday, October 11, 2014 01:50:24.765 PM**.

  As an alternative, you can specify **hh:mm:ss.f** or **hh:mm:ss.ff** to round the time to the nearest 10<sup>th</sup> or 100<sup>th</sup> of a second.

### TimeValue

Name a text-input control **FinishedAt**, and set the [Text](/power-apps/maker/canvas-apps/controls/properties-core) property of a label to this formula:

```power-fx
If( TimeValue( FinishedAt.Text ) < TimeValue( "5:00:00.000 PM" ),
    "You made it!",
    "Too late!"
)
```

- If you type **4:59:59.999 PM** in the **FinishedAt** control, the label shows "_You made it!_"
- If you type **5:00:00.000 PM** in the **FinishedAt** control, the label shows "_Too late!_"

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































