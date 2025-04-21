---
title: If and Switch functions
description: Reference information including syntax and examples for the If and Switch functions.
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

# If and Switch functions
[!INCLUDE[function-if-applies-to](includes/function-if-applies-to.md)]



Determines whether any condition in a set is true (**If**) or the result of a formula matches any value in a set (**Switch**) and then returns a result or executes an action.

## Description

The **If** function tests one or more conditions until a **true** result is found. If such a result is found, a corresponding value is returned. If no such result is found, a default value is returned. In either case, the returned value might be a string to show, a formula to evaluate, or another form of result.

The **Switch** function evaluates a formula and determines whether the result matches any value in a sequence that you specify. If a match is found, a corresponding value is returned. If no match is found, a default value is returned. In either case, the returned value might be a string to show, a formula to evaluate, or another form of result.

**If** and **Switch** are very similar, but you should use the best function for your situation:

- Use **If** to evaluate a single condition. The most common syntax for this function is **If**( _Condition_, _ThenResult_, _DefaultResult_ ), which provides the common "if … then … else …" pattern seen in other programming tools.
- Use **If** to evaluate multiple unrelated conditions. In Power Apps (unlike Microsoft Excel), you can specify multiple conditions without having to nest **If** formulas.
- Use **Switch** to evaluate a single condition against multiple possible matches. You can also use **If** in this case, but you'd need to repeat the formula for each possible match.

You can use both of these functions in [behavior formulas](/power-apps/maker/canvas-apps/working-with-formulas-in-depth) to branch between two or more actions. Only one branch will trigger an action. Conditions and matches are evaluated in order, and they stop if a condition is **true** or a match is found.

_Blank_ is returned if no conditions are **true**, no matches are found, and you don't specify a default result.

## Syntax

**If**( _Condition_, _ThenResult_ [, *DefaultResult* ] )<br>**If**( _Condition1_, _ThenResult1_ [, _Condition2_, _ThenResult2_, ... [ , *DefaultResult* ] ] )

- _Condition(s)_ - Required. Formula(s) to test for **true**. Such formulas commonly contain comparison [operators](operators.md) (such as **<**, **>**, and **=**) and test functions such as **[IsBlank](function-isblank-isempty.md)** and **[IsEmpty](function-isblank-isempty.md)**.
- _ThenResult(s)_ - Required. The corresponding value to return for a condition that evaluates to **true**.
- _DefaultResult_ - Optional. The value to return if no condition evaluates to **true**. If you don't specify this argument, _blank_ is returned.

**Switch**( _Formula_, _Match1_, _Result1_ [, _Match2_, _Result2_, ... [, *DefaultResult* ] ] )

- _Formula_ - Required. Formula to evaluate for matches. This formula is evaluated only once.
- _Match(s)_ - Required. Values to compare with the result from _Formula_. If an exact match is found, the corresponding _Result_ is returned.
- _Result(s)_ - Required. The corresponding value to return when an exact match is found.
- _DefaultResult_ - Optional. If an exact match isn't found, this value is returned. If you don't specify this argument, _blank_ is returned.

## Examples

### Values in formulas

In the following examples, a **Slider** control (named **Slider1**) has a value of **25**.

| Formula                                                                                                  | Description                                                                                                                                                                                                                         | Result          |
| -------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------- |
| **If( Slider1.Value&nbsp;=&nbsp;25, "Result1" )**                                                        | The condition is **true**, and the corresponding result is returned.                                                                                                                                                                | "Result1"       |
| **If( Slider1.Value&nbsp;=&nbsp;25, "Result1", "Result2" )**                                             | The condition is **true**, and the corresponding result is returned.                                                                                                                                                                | "Result1"       |
| **If( Slider1.Value&nbsp;>&nbsp;1000, "Result1" )**                                                      | The condition is **false**, and no _DefaultResult_ was provided.                                                                                                                                                                    | _blank_         |
| **If( Slider1.Value&nbsp;>&nbsp;1000, "Result1", "Result2" )**                                           | The condition is **false**, a _DefaultResult_ was provided, and it's returned.                                                                                                                                                      | "Result2"       |
| **If( Slider1.Value&nbsp;=&nbsp;25, "Result1", Slider1.Value&nbsp;>&nbsp;0, "Result2" )**                | The first condition is **true**, and the corresponding result is returned. The second condition is also **true**, but it isn't evaluated because it appears later in the argument list than a condition that evaluates to **true**. | "Result1"       |
| **If( IsBlank(&nbsp;Slider1.Value&nbsp;), "Result1", IsNumeric(&nbsp;Slider1.Value&nbsp;), "Result2" )** | The first condition is **false** because the slider isn't _blank_. The second condition is **true** because the slider's value is a number, and the corresponding result is returned.                                               | "Result2"       |
| **If( Slider1.Value&nbsp;>&nbsp;1000, "Result1", Slider1.Value&nbsp;>&nbsp;50, "Result2", "Result3")**   | Both the first and second conditions are **false**, a _DefaultResult_ was provided, and it's returned.                                                                                                                              | "Result3"       |
| **Switch( Slider1.Value, 25, "Result1" )**                                                               | The slider's value matches the first value to be checked, and the corresponding result is returned.                                                                                                                                 | "Result1"       |
| **Switch( Slider1.Value, 20, "Result1", 25, "Result2", 30, "Result3" )**                                 | The slider's value matches the second value to be checked, and the corresponding result is returned.                                                                                                                                | "Result2"       |
| **Switch( Slider1.Value, 20, "Result1", 10, "Result2", 0, "Result3", "DefaultResult" )**                 | The slider's value doesn't match any value to be checked. A _DefaultResult_ was provided, so it's returned.                                                                                                                         | "DefaultResult" |

### Branching in behavior formulas

In these examples, a **[Text input](/power-apps/maker/canvas-apps/controls/control-text-input)** control named **FirstName** has the value "John" typed into it.

| Formula                                                                                                                                                                                            | Description                                                                                                                                                                                                                                                                                                        | Result                                                                         |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------ |
| **If( ! IsBlank( FirstName.Text ), Navigate(&nbsp;Screen1, ScreenTransition.None ) )**                                                                                                             | The condition is **true**, so the **[Navigate](function-navigate.md)** function runs. You can use the **[IsBlank](function-isblank-isempty.md)** function to test whether a required form field has been filled in. If **FirstName** were [blank](function-isblank-isempty.md), this formula would have no effect. | **true**<br><br>The display is changed to **Screen1**.                         |
| **If( IsBlank( FirstName.Text ), Navigate(&nbsp;Screen1, ScreenTransition.None ), Back() )**                                                                                                       | Without the **!** operator, the condition is **false**, so the **[Navigate](function-navigate.md)** function doesn't run. The **[Back](function-navigate.md)** function was provided as a _DefaultResult_, so it runs.                                                                                             | **true**<br><br>The display goes back to the screen that was previously shown. |
| **Switch( FirstName.Text, "Carlos", Navigate(&nbsp;Screen1, ScreenTransition.None ), "Kirstin", Navigate( Screen2, ScreenTransition.None ), "John", Navigate( Screen3, ScreenTransition.None ) )** | The value of **FirstName.Text** is compared against "Carlos", "Kirstin", and "John" in that order. A match is found with "John", so the app navigates to **Screen3**.                                                                                                                                              | **true**<br><br>The display is changed to **Screen3**.                         |

### Step by step

1. Add a **[Text input](/power-apps/maker/canvas-apps/controls/control-text-input)** control, and name it **Text1** if it doesn't have that name by default.
2. In **Text1**, type **30**.
3. Add a **Label** control, and set its **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:<br>
   **If( Value(Text1.Text) < 20, "Order MANY more!", Value(Text1.Text) < 40, "Order more!", Text1.Text )**

   The **Label** control shows **Order more!** because the value of **Text1** is more than 20 but less than 40.

4. In **Text1**, type **15**.

   The **Label** control shows **Order MANY more!** because the value of **Text1** is less than 20.

5. In **Text1**, type **50**.

   The **Label** control shows the value that you typed because it's more than 40.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































