---
title: Int, Round, RoundDown, RoundUp, and Trunc functions
description: Reference information, including syntax, for the Int, Round, RoundDown, RoundUp, and Trunc functions
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
no-loc: ["Int","Round","RoundDown","RoundUp","Trunc"]
---

# Int, Round, RoundDown, RoundUp, and Trunc functions
[!INCLUDE[function-round-applies-to](includes/function-round-applies-to.md)]



Rounds a number.

## Round, RoundDown, and RoundUp

The **Round**, **RoundDown**, and **RoundUp** functions round a number to the specified number of decimal places:

- **Round** rounds up if the next digit is 5 or higher. Otherwise, this function rounds down.
- **RoundDown** always rounds down to the previous lower number, towards zero.
- **RoundUp** always rounds up to the next higher number, away from zero.

The number of decimal places can be specified for these functions:

| Decimal places | Description                                                  | Example                           |
| -------------- | ------------------------------------------------------------ | --------------------------------- |
| Greater than 0 | The number is rounded to the right of the decimal separator. | `Round( 12.37, 1 )` returns 12.4. |
| 0              | The number is rounded to the nearest integer.                | `Round( 12.37, 0 )` returns 12.   |
| Less than 0    | The number is rounded to the left of the decimal separator.  | `Round( 12.37, -1 )` returns 10.  |

## Int and Trunc

The **Int** and **Trunc** functions round a number to an integer (whole number without a decimal):

- **Int** rounds down to the nearest integer.
- **Trunc** truncates the number to just the integer portion by removing any decimal portion.

The difference between **Int** and **Trunc** is in the handling of negative numbers. For example, for an argument of `-4.3`, **Int** will return the integer further away from zero, `-5`, while **Trunc** will return the integer closer to zero, `-4`. **Int** returns values that are unique amongst the five rounding functions, while **Trunc** returns the same values as **RoundDown**.

Use **Trunc** to extract the decimal portion of a number by subtracting it from the original, for example `X - Trunc(X)`.

Decimal places cannot be specified with **Trunc** as it can with Microsoft Excel. Use **RoundDown** instead when this is needed.

## Single-column tables

These functions support single-column tables. If you pass a single number, the return value is the rounded version of that number. If you pass a single-column [table](/power-apps/maker/canvas-apps/working-with-tables) that contains numbers, the return value is a single-column table of rounded numbers. The _DecimalPlaces_ parameter can be a single value or a single-column table. If the single-column table has less values that the _Number_, zero is used for the remaining values. Use [**ShowColumns**](function-table-shaping.md) and other table shaping functions to extract a single-column table from a larger table.

## Syntax

**Round**(_Number_, _DecimalPlaces_)<br>**RoundDown**(_Number_, _DecimalPlaces_)<br>**RoundUp**(_Number_, _DecimalPlaces_)

- _Number_ - Required. The number to round.
- _DecimalPlaces_ - Required. Number of decimal places to round to. Use a positive value to indicate decimal places right of the decimal separator, a negative value to the left, and zero for a whole number.

**Int**(_Number_)<br>**Trunc**(_Number_)

- _Number_ - Required. The number to be rounded to an integer.

## Examples

Rounding to a whole number.

| `X`  | `Round( X, 0 )` | `RoundUp( X, 0 )` | `RoundDown( X, 0 )` | `Int( X )` | `Trunc( X )` |
| :--: | :-------------: | :---------------: | :-----------------: | :--------: | :----------: |
| 7.9  |        8        |         8         |          7          |     7      |      7       |
| -7.9 |       -8        |        -8         |         -7          |     -8     |      -7      |
| 7.5  |        8        |         8         |          7          |     7      |      7       |
| -7.5 |       -8        |        -8         |         -7          |     -8     |      -7      |
| 7.1  |        7        |         8         |          7          |     7      |      7       |
| -7.1 |       -7        |        -8         |         -7          |     -8     |      -7      |

Rounding to two decimal places to the right of the decimal separator (0.01).

|   `X`   | `Round( X, 2 )` | `RoundUp( X, 2 )` | `RoundDown( X, 2 )` |
| :-----: | :-------------: | :---------------: | :-----------------: |
| 430.123 |     430.12      |      430.13       |       430.12        |
| 430.125 |     430.13      |      430.13       |       430.12        |
| 430.128 |     430.13      |      430.13       |       430.12        |

Rounding to two decimal places to the left of the decimal separator (100).

|   `X`   | `Round( X, -2 )` | `RoundUp( X, -2 )` | `RoundDown( X, -2 )` |
| :-----: | :--------------: | :----------------: | :------------------: |
| 430.123 |       400        |        500         |         400          |
| 449.942 |       400        |        500         |         400          |
| 450.000 |       500        |        500         |         400          |
| 450.124 |       500        |        500         |         400          |
| 479.128 |       500        |        500         |         400          |

Rounding a single-column table of values.

|                  `X`                  |        `Int( X )`         |          `Round( X, 2 )`           | `RoundDown( X, [ 0, 1, 2 ] )`  |    `RoundUp( X, [ 2 ] )`     |
| :-----------------------------------: | :-----------------------: | :--------------------------------: | :----------------------------: | :--------------------------: |
| [ 123.456, <br>987.593, <br>542.639 ] | [ 123, <br>987, <br>542 ] | [ 123.46, <br>987.59, <br>542.64 ] | [ 123, <br>987.5, <br>542.63 ] | [ 123.46, <br>988, <br>543 ] |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]







































































































































