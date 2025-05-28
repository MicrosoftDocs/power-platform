---
title: Abs, Exp, Ln, Power, Log, and Sqrt functions
description: Reference information including syntax and examples for the Abs, Exp, Ln, Power, and Sqrt functions.
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

# Abs, Exp, Ln, Power, Log, and Sqrt functions
[!INCLUDE[function-numericals-applies-to](includes/function-numericals-applies-to.md)]



Calculates absolute values, logarithms, square roots, and the results of raising _e_ or any number to specified powers.

## Description

The **Abs** function returns the non-negative value of its argument. If a number is negative, **Abs** returns the positive equivalent.

The **Exp** function returns _e_ raised to the power of its argument. The transcendental number _e_ begins 2.7182818...

The **Ln** function returns the natural logarithm (base _e_) of its argument.

The **Power** function returns a number raised to a power. It's equivalent to using the [**^** operator](operators.md).

The **Log** function returns the logarithm of its first argument in the base specified by its second argument (or 10 if not specified).

The **Sqrt** function returns the number that, when multiplied by itself, equals its argument.

If you pass a single number, the return value is a single result based on the function called. If you pass a single-column [table](/power-apps/maker/canvas-apps/working-with-tables) that contains numbers, the return value is a single-column table of results in a **Value** column, one result for each record in the argument's table. If you have a multi-column table, you can shape it into a single-column table, as [working with tables](/power-apps/maker/canvas-apps/working-with-tables) describes.

If an argument would result in an undefined valued, the result is _blank_. Which can happen with square roots and logarithms of negative numbers.

## Syntax

**Abs**( _Number_ )<br>**Exp**( _Number_ )<br>**Ln**( _Number_ )<br>**Sqrt**( _Number_ )

- _Number_ - Required. Number to operate on.

**Power**( _Base_, _Exponent_ )

- _Base_ - Required. Base number to raise.
- _Exponent_ - Required. The exponent to which the base number is raised.

**Log**( _Number_, _Base_ )

- _Number_ - Required. Number to calculate the logarithm.
- _Base_ - Optional. The base of the logarithm to calculate. By default, 10 (when not specified).

**Abs**( _SingleColumnTable_ )<br>**Exp**( _SingleColumnTable_ )<br>**Ln**( _SingleColumnTable_ )<br>**Sqrt**( _SingleColumnTable_ )

- _SingleColumnTable_ - Required. A single-column table of numbers to operate on.

## Examples

### Single number

| Formula | Description | Result |
| --- | --- | --- |
| **Abs( -55 )** | Returns the number without the negative sign. | 55 |
| **Exp( 2 )** | Returns _e_ raised to the power of 2, or _e_ \* _e_. | 7.389056... |
| **Ln( 100 )** | Returns the natural logarithm (base _e_) of the number 100. | 4.605170... |
| **Log( 100 )** | Returns the logarithm in base 10 of the number 100. | 2 |
| **Log( 64, 2 )** | Returns the logarithm in base 2 of the number 64. | 6 |
| **Power( 5, 3 )** | Returns 5 raised to the power of 3, or 5 \* 5 \* 5. | 125 |
| **Sqrt( 9 )** | Returns the number that, when multiplied by itself, results in 9. | 3 |

### Single-column table

The examples in this section use a [data source](/power-apps/maker/canvas-apps/working-with-data-sources) that's named **ValueTable** and that contains this data:

| Value |
| --- |
| 9 |
| -4 |
| 2 |

| Formula | Description | Result |
| --- | --- | --- |
| **Abs(&nbsp;ValueTable&nbsp;)** | Returns the absolute value of each number in the table. | A single-column table with a `Value` column containing the following values: 9, 4, 2 |
| **Exp(&nbsp;ValueTable&nbsp;)** | Returns _e_ raised to the power of each number in the table. | A single-column table with a `Value` column containing the following values: 8103.083927..., 0.018315..., 7.389056... |
| **Ln(&nbsp;ValueTable&nbsp;)**   | Returns the natural logarithm of each number in the table. | A single-column table with a `Value` column containing the following values: 2.197224..., Blank(), 0.693147... |
| **Sqrt(&nbsp;ValueTable&nbsp;)** | Returns the square root of each number in the table | A single-column table with a `Value` column containing the following values: 3, Blank(), 1.414213... |

### Step-by-step example

1. Add a **[Text input](/power-apps/maker/canvas-apps/controls/control-text-input)** control, and name it **Source**.
2. Add a **Label** control, and set its **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:
   <br>
   **Sqrt( Value( Source.Text ) )**
3. Type a number into **Source**, and confirm that the **Label** control shows the square root of the number that you typed.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]







































































































































