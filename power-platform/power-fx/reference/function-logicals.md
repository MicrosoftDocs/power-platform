---
title: And, Or, and Not functions
description: Reference information including syntax and examples for the And, Or, and Not functions.
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

# And, Or, and Not functions
[!INCLUDE[function-logicals-applies-to](includes/function-logicals-applies-to.md)]



Boolean logic functions, commonly used to manipulate the results of comparisons and tests.

## Description

The **And** function returns **true** if all of its arguments are **true**.

The **Or** function returns **true** if any of its arguments are **true**.

The **Not** function returns **true** if its argument is **false**; it returns **false** if its argument is **true**.

These functions work the same way as they do in Excel. You can also use [operators](operators.md) to perform these same operations, using either Visual Basic or JavaScript syntax:

| Function notation | Visual Basic operator notation | JavaScript operator notation |
| ----------------- | ------------------------------ | ---------------------------- |
| **And( x, y )**   | **x And y**                    | **x && y**                   |
| **Or( x, y )**    | **x Or y**                     | **x &#124;&#124; y**         |
| **Not( x )**      | **Not x**                      | **! x**                      |

These functions work with logical values. You can't pass them a number or a string directly; instead, you must make a comparison or a test. For example, this logical formula **x > 1** evaluates to the Boolean value **true** if **x** is greater than **1**. If **x** is less than **1**, the formula evaluates to **false**.

## Syntax

**And**( _LogicalFormula1_, _LogicalFormula2_ [, *LogicalFormula3*, ... ] )<br>
**Or**( _LogicalFormula1_, _LogicalFormula2_ [, *LogicalFormula3*, ... ] )<br>
**Not**( _LogicalFormula_ )

- _LogicalFormula(s)_ - Required. Logical formulas to evaluate and operate on.

## Examples

The examples in this section use these global variables:

- **a** = _false_
- **b** = _true_
- **x** = 10
- **y** = 100
- **s** = "Hello World"

To create these global variables in an app, insert a [**Button**](/power-apps/maker/canvas-apps/controls/control-button) control, and set its **OnSelect** property to this formula:

```power-fx
Set( a, false ); Set( b, true ); Set( x, 10 ); Set( y, 100 ); Set( s, "Hello World" )
```

Select the button (by clicking it while you hold down the Alt key), and then set the **Text** property of a [**Label**](/power-apps/maker/canvas-apps/controls/control-text-box) control to a formula in the first column of the next table.

| Formula                                                                                     | Description                                                                                                                                                                                                                         | Result  |
| ------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| **And( a, b )**                                                                             | Tests the values of **a** and **b**. One of the arguments is _false_, so the function returns _false_.                                                                                                                              | _false_ |
| **a And b**                                                                                 | Same as the previous example, using Visual Basic notation.                                                                                                                                                                          | _false_ |
| **a && b**                                                                                  | Same as the previous example, using JavaScript notation.                                                                                                                                                                            | _false_ |
| **Or( a, b )**                                                                              | Tests the values of **a** and **b**. One of the arguments is _true_, so the function returns _true_.                                                                                                                                | _true_  |
| **a Or b**                                                                                  | Same as the previous example, using Visual Basic notation.                                                                                                                                                                          | _true_  |
| **a &#124;&#124; b**                                                                        | Same as the previous example, using JavaScript notation.                                                                                                                                                                            | _true_  |
| **Not( a )**                                                                                | Tests the value of **a**. The argument is _false_, so the function returns the opposite result.                                                                                                                                     | _true_  |
| **Not a**                                                                                   | Same as the previous example, using Visual Basic notation.                                                                                                                                                                          | _true_  |
| **! a**                                                                                     | Same as the previous example, using JavaScript notation.                                                                                                                                                                            | _true_  |
| **Len(&nbsp;s&nbsp;)&nbsp;<&nbsp;20 And&nbsp;Not&nbsp;IsBlank(&nbsp;s&nbsp;)**              | Tests whether the length of **s** is less than 20 and whether it isn't a **blank** value. The length is less than 20, and the value isn't blank. Therefore, the result is _true_.                                                   | _true_  |
| **Or(&nbsp;Len(&nbsp;s&nbsp;)&nbsp;<&nbsp;10, x&nbsp;<&nbsp;100, y&nbsp;<&nbsp;100&nbsp;)** | Tests whether the length of **s** is less than 10, whether **x** is less than 100, and whether **y** is less than 100. The first and third arguments are false, but the second one is true. Therefore, the function returns _true_. | _true_  |
| **Not IsBlank(&nbsp;s&nbsp;)**                                                              | Tests whether **s** is _blank_, which returns _false_. **Not** returns the opposite of this result, which is _true_.                                                                                                                | _true_  |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































