---
title: Blank, Coalesce, IsBlank, and IsEmpty functions
description: Reference information including syntax and examples for the Blank, Coalesce, IsBlank, and IsEmpty functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.component: canvas
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

# Blank, Coalesce, IsBlank, and IsEmpty functions
[!INCLUDE[function-isblank-isempty-applies-to](includes/function-isblank-isempty-applies-to.md)]


 

Tests whether a value is blank or a [table](/power-apps/maker/canvas-apps/working-with-tables) contains no [records](/power-apps/maker/canvas-apps/working-with-tables#records), and provides a way to create _blank_ values.

## Overview

_Blank_ is a placeholder for "no value" or "unknown value." For example, a **[Combo box](/power-apps/maker/canvas-apps/controls/control-combo-box)** control's **Selected** property is _blank_ if the user hasn't made a selection. Many data sources can store and return NULL values, which are represented in Power Apps as _blank_.

Any property or calculated value in Power Apps can be _blank_. For example, a Boolean value normally has one of two values: **true** or **false**. But in addition to these two, it can also be _blank_ indicating that the state is not known. This is similar to Microsoft Excel, where a worksheet cell starts out as blank with no contents but can hold the values **TRUE** or **FALSE** (among others). At any time, the contents of the cell can again be cleared, returning it to a _blank_ state.

_Empty string_ refers to a string that contains no characters. The [**Len** function](function-len.md) returns zero for such a string and it can be written in a formulas as two double quotes with nothing in between `""`. Some controls and data sources use an empty string to indicate a "no value" condition. To simplify app creation, the **IsBlank** and **Coalesce** functions test for both _blank_ values or empty strings.

In the context of the **IsEmpty** function, _empty_ is specific to tables that contain no records. The table structure may be intact, complete with [column](/power-apps/maker/canvas-apps/working-with-tables#columns) names, but no data is in the table. A table may start as empty, take on records and no longer be empty, and then have the records removed and again be empty.

> [!NOTE]
> We are in a period of transition. Until now, _blank_ has also been used to report errors, making it impossible to differentiate a valid "no value" from an error. For this reason, at this time, storing _blank_ values is supported only for local collections. You can store _blank_ values in other data sources if you turn on the **Formula-level error management** experimental feature under **Settings** > **Upcoming features** > **Experimental**. We are actively working to finish this feature and complete the proper separation of _blank_ values from errors.

## Blank

  

The **Blank** function returns a _blank_ value. Use this to store a NULL value in a data source that supports these values, effectively removing any value from the field.

## IsBlank

 

The **IsBlank** function tests for a _blank_ value or an empty string. The test includes empty strings to ease app creation since some data sources and controls use an empty string when there is no value present. To test specifically for a _blank_ value use `if( Value = Blank(), ...` instead of **IsBlank**. The **IsBlank** function considers empty tables as not blank, and **IsEmpty** should be used to test a table.

When enabling error handling for existing apps, consider replacing **IsBlank** with [**IsBlankOrError**](function-iferror.md#isblankorerror) to preserve existing app behavior. Prior to the addition of error handling, a _blank_ value was used to represent both null values from databases and error values. Error handling separates these two interpretations of _blank_ which could change the behavior of existing apps that continue to use **IsBlank**.

The return value for **IsBlank** is a boolean **true** or **false**.

## Coalesce

 

The **Coalesce** function evaluates its arguments in order and returns the first value that isn't _blank_ or an empty string. Use this function to replace a _blank_ value or empty string with a different value but leave non-_blank_ and non-empty string values unchanged. If all the arguments are _blank_ or empty strings then the function returns _blank_, making **Coalesce** a good way to convert empty strings to _blank_ values.

`Coalesce( value1, value2 )` is the more concise equivalent of `If( Not IsBlank( value1 ), value1, Not IsBlank( value2 ), value2 )` and doesn't require **value1** and **value2** to be evaluated twice. The [**If** function](function-if.md) returns _blank_ if there is no "else" formula as is the case here.

All arguments to **Coalesce** must be of the same type; for example, you can't mix numbers with text strings. The return value from **Coalesce** is of this common type.

## IsEmpty

 

The **IsEmpty** function tests whether a table contains any records. It's equivalent to using the **[CountRows](function-table-counts.md)** function and checking for zero. You can check for data-source errors by combining **IsEmpty** with the **[Errors](function-errors.md)** function.

The return value for **IsEmpty** is a Boolean **true** or **false**.

## Syntax

**Blank**()

**Coalesce**( _Value1_ [, *Value2*, ... ] )

- _Value(s)_ – Required. Values to test. Each value is evaluated in order until a value that is not _blank_ and not an empty string is found. Values after this point are not evaluated.

**IsBlank**( _Value_ )

- _Value_ – Required. Value to test for a _blank_ value or empty string.

**IsEmpty**( _Table_ )

- _Table_ - Required. Table to test for records.

## Examples

### Blank

> [!NOTE]
> At this time, the following example only works for local collections. You can store _blank_ values in other data sources if you turn on the **Formula-level error management** experimental feature under **Settings** > **Upcoming features** > **Experimental**. We are actively working to finish this feature and complete the separation of _blank_ values from errors.

1. Create an app from scratch, and add a **Button** control.
2. Set the button's **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:

   ```power-fx
   ClearCollect( Cities, { Name: "Seattle", Weather: "Rainy" } )
   ```

3. Preview your app, click or tap the button that you added, and then close Preview.
4. On the **File** menu, click or tap **Collections**.

   The **Cities** collection appears, showing one record with "Seattle" and "Rainy":

   ![Collection showing Seattle with Rainy weather.](./media/function-isblank-isempty/seattle-rainy.png)

5. Click or tap the back arrow to return to the default workspace.
6. Add a **Label** control, and set its **Text** property to this formula:

   ```power-fx
   IsBlank( First( Cities ).Weather )
   ```

   The label shows **false** because the **Weather** field contains a value ("Rainy").

7. Add a second button, and set its **OnSelect** property to this formula:

   ```power-fx
   Patch( Cities, First( Cities ), { Weather: Blank() } )
   ```

8. Preview your app, click or tap the button that you added, and then close Preview.

   The **Weather** field of the first record in **Cities** is replaced with a _blank_, removing the "Rainy" that was there previously.

   ![Collection showing Seattle with a blank Weather field.](./media/function-isblank-isempty/seattle-blank.png)

   The label shows **true** because the **Weather** field no longer contains a value.

### Coalesce

| Formula                                            | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                | Result  |
| -------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| **Coalesce(&nbsp;Blank(),&nbsp;1&nbsp;)**          | Tests the return value from the **Blank** function, which always returns a _blank_ value. Because the first argument is _blank_, evaluation continues with the next argument until a non-_blank_ value and non-empty string is found.                                                                                                                                                                                                                      | **1**   |
| **Coalesce( "", "2" )**                            | Tests the first argument which is an empty string. Because the first argument is an empty string, evaluation continues with the next argument until a non-_blank_ value and non-empty string is found.                                                                                                                                                                                                                                                     | **2**   |
| **Coalesce( Blank(), "", Blank(), "", "3", "4" )** | **Coalesce** starts at the beginning of the argument list and evaluates each argument in turn until a non-_blank_ value and non-empty string is found. In this case, the first four arguments all return _blank_ or an empty string, so evaluation continues to the fifth argument. The fifth argument is non-_blank_ and non-empty string, so evaluation stops here. The value of the fifth argument is returned, and the sixth argument isn't evaluated. | **3**   |
| **Coalesce( "" )**                                 | Tests the first argument which is an empty string. Because the first argument is an empty string, and there are no more arguments, the function returns _blank_.                                                                                                                                                                                                                                                                                           | _blank_ |

### IsBlank

1. Create an app from scratch, add a text-input control, and name it **FirstName**.
2. Add a label, and set its **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:

   ```power-fx
   If( IsBlank( FirstName.Text ), "First Name is a required field." )
   ```

   By default, the **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property of a text-input control is set to **"Text input"**. Because the property contains a value, it isn't blank, and the label doesn't display any message.

3. Remove all the characters from the text-input control, including any spaces.

   Because the **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property no longer contains any characters, it's an empty string, and **IsBlank( FirstName.Text )** will be **true**. The required field message is displayed.

For information about how to perform validation by using other tools, see the **[Validate](function-validate.md)** function and [working with data sources](/power-apps/maker/canvas-apps/working-with-data-sources).

Other examples:

| Formula                              | Description                                                                                                                                                                                                              | Result    |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------- |
| **IsBlank(&nbsp;Blank()&nbsp;)**     | Tests the return value from the **Blank** function, which always returns a _blank_ value.                                                                                                                                | **true**  |
| **IsBlank( "" )**                    | A string that contains no characters.                                                                                                                                                                                    | **true**  |
| **IsBlank( "Hello" )**               | A string that contains one or more characters.                                                                                                                                                                           | **false** |
| **IsBlank( _AnyCollection_ )**       | Because the [collection](/power-apps/maker/canvas-apps/working-with-data-sources#collections) exists, it isn't blank, even if it doesn't contain any records. To check for an empty collection, use **IsEmpty** instead. | **false** |
| **IsBlank( Mid( "Hello", 17, 2 ) )** | The starting character for **[Mid](function-left-mid-right.md)** is beyond the end of the string. The result is an empty string.                                                                                         | **true**  |
| **IsBlank( If( false, false ) )**    | An **[If](function-if.md)** function with no _ElseResult_. Because the condition is always **false**, this **[If](function-if.md)** always returns _blank_.                                                              | **true**  |

### IsEmpty

1. Create an app from scratch, and add a **Button** control.
2. Set the button's **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:

   **Collect( IceCream, { Flavor: "Strawberry", Quantity: 300 }, { Flavor: "Chocolate", Quantity: 100 } )**

3. Preview your app, click or tap the button that you added, and then close Preview.

   A collection named **IceCream** is created and contains this data:

   ![A table with Strawberry and Chocolate flavours with quantity 300 and 100.](media/function-isblank-isempty/icecream-strawberry-chocolate.png)

   This collection has two records and isn't empty. **IsEmpty( IceCream )** returns **false**, and **CountRows( IceCream )** returns **2**.

4. Add a second button, and set its **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:

   **Clear( IceCream )**

5. Preview your app, click or tap the second button, and then close Preview.

   The collection is now empty:

   ![A collection with Flavor and Quantity as empty collection.](media/function-isblank-isempty/icecream-clear.png)

   The **[Clear](function-clear-collect-clearcollect.md)** function removes all the records from a collection, resulting in an empty collection. **IsEmpty( IceCream )** returns **true**, and **CountRows( IceCream )** returns **0**.

You can also use **IsEmpty** to test whether a calculated table is empty, as these examples show:

| Formula                                                             | Description                                                                                                                              | Result    |
| ------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------- | --------- |
| **IsEmpty( [&nbsp;1,&nbsp;2,&nbsp;3 ] )**                           | The single-column table contains three records and, therefore, isn't empty.                                                              | **false** |
| **IsEmpty( [&nbsp;] )**                                             | The single-column table contains no records and is empty.                                                                                | **true**  |
| **IsEmpty( Filter( [&nbsp;1,&nbsp;2,&nbsp;3&nbsp;], Value > 5 ) )** | The single-column table contains no values that are greater than 5. The result from the filter doesn't contain any records and is empty. | **true**  |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































