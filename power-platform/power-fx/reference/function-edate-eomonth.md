---
title: EDate and EOMonth functions
description: Reference information including syntax and examples for the EDate and EOMonth functions.
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
no-loc: ["EDate","EOMonth"]
---

# EDate and EOMonth functions
[!INCLUDE[function-edate-eomonth-applies-to](includes/function-edate-eomonth-applies-to.md)]



Adds or subtracts months to a Date/Time value, with optional adjustment to the day of the month.

## Description

The **EDate** and **EOMonth** functions move a Date/Time forward or backward by a specified number of months.

After the month adjustment, **EDate** leaves the day portion unmodified unless the new value would be beyond the end of the month. For example, moving July 31 backward by one month yields June 30. Use **EDate** to calculate the maturity dates or due dates that fall on the same day of the month as the date of issue.

After the month adjustment, **EOMonth** changes the day potion to the last day of the resulting month. Use **EOMonth** to calculate the maturity dates or due dates that fall on the last day of the month. **EOMonth** can be used to move a Date/Time to the end of the month by adding zero months.

All functions return a Date value. No time component is included, even if one was present in the input Date/Time.

See [working with dates and times](/power-apps/maker/canvas-apps/show-text-dates-times) for more information.

## Syntax

**EDate**( _DateTime_, _NumberOfMonths_ )

- _DateTime_ - Required. Date/Time value to operate on.
- _NumberOfMonths_ - Required. Number of months to add or subtract to _DateTime_. A positive value yields a future date, a negative value yields a past date, and zero leaves the entire input _DateTime_ unchanged.

**EOMonth**( _DateTime_, _NumberOfMonths_ )

- _DateTime_ - Required. Date/Time value to operate on.
- _NumberOfMonths_ - Required. Number of months to add or subtract to _DateTime_. A positive value yields a future date, a negative value yields a past date, and zero changes the day portion of the input _DateTime_ to the end of the month.

## Examples

### EDate

| Formula                                                    | Description                                                                       | Result            |
| ---------------------------------------------------------- | --------------------------------------------------------------------------------- | ----------------- |
| **EDate(&nbsp;Date(2023,5,15)&nbsp;,&nbsp;4&nbsp;)**       | Adds four months to May 15, 2023, leaving the date unchanged.                     | Date(2023,9,15)   |
| **EDate(&nbsp;Date(2023,5,15)&nbsp;,&nbsp;-1002&nbsp;)**   | Subtracts 1,002 months from May 15, 2023, leaving the date unchanged.             | Date(1939,11,15)   |
| **EDate(&nbsp;Date(2023,5,15)&nbsp;,&nbsp;0&nbsp;)**       | Adds zero months to May 15, 2023 leaving the month and year unchanged, also leaves the date unchanged. | Date(2023,5,15)   |
| **EDate(&nbsp;Date(2023,5,31)&nbsp;,&nbsp;1&nbsp;)**       | Adds one month to May 15, 2023, adjusting the date since June doesn't have as many days as May. | Date(2023,6,30)   |

### EOMonth

| Formula                                                     | Description                                                                       | Result            |
| ----------------------------------------------------------- | --------------------------------------------------------------------------------- | ----------------- |
| **EOMonth(&nbsp;Date(2023,5,15);&nbsp;,&nbsp;4&nbsp;)**     | Adds four months to May 15, 2023, moving the date to the end of the month.        | Date(2023,9,30)   |
| **EOMonth(&nbsp;Date(2023,5,15);&nbsp;,&nbsp;-1002&nbsp;)** | Subtracts 1,002 months from May 15, 2023, moving the date to the end of the resulting month.  | Date(1939,11,30)   |
| **EOMonth(&nbsp;Date(2023,5,15);&nbsp;,&nbsp;0&nbsp;)**     | Adds zero months to May 15, 2023 leaving the month and year unchanged, moving the date to the end of the unmodified month.  | Date(2023,5,31)   |
| **EOMonth(&nbsp;Date(2023,5,31);&nbsp;,&nbsp;1&nbsp;)**     | Adds one month to May 15, 2023, moving the date to the end of the resulting month. | Date(2023,6,30)   |


[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































