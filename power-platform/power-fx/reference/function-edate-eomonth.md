---
title: EDate and EOMonth functions
description: Reference information including syntax and examples for the EDate and EOMonth functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 10/27/2023
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# EDate and EOMonth functions

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Model-driven apps   

Adds or subtracts a specified number of months from a date, and either leaves the day of the month unchanged or changes the day to the end of the month.

## Description


All functions return a date.

See [working with dates and times](/power-apps/maker/canvas-apps/show-text-dates-times) for more information.

## Syntax

**EDate**( _DateTime_, _NumberOfMonths_ )

- _DateTime_ - Required. Date/Time value to operate on.
- _NumberOfMonths_ - Required. Number of months to adjust the Date/Time by.

**EOMonth**( _DateTime_, _NumberOfMonths_ )

- _DateTime_ - Required. Date/Time value to operate on.
- _NumberOfMonths_ - Required. Number of months to adjust the Date/Time by.

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
