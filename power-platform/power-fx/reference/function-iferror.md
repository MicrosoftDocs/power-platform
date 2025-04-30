---
title: Error, IfError, IsError, and IsBlankOrError functions
description: Reference information including syntax and examples for the Error, IfError, IsError, IsBlankOrError functions.
author: gregli-msft
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 10/16/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# Error, IfError, IsError, IsBlankOrError functions
[!INCLUDE[function-iferror-applies-to](includes/function-iferror-applies-to.md)]



Detects errors and provides an alternative value or takes action. Create a custom error or pass through an error.

> [!NOTE]
>
> If an app has disabled the _Formula-level error management_ feature under **Settings** > **Updates** > **Retired**, those functions will not work correctly.


## IfError

The **IfError** function tests values until it finds an error. If the function discovers an error, the function evaluates and returns a corresponding replacement value and stops further evaluation. A default value can also be supplied for when no errors are found. The structure of **IfError** resembles that of the **If** function: **IfError** tests for errors, while **If** tests for **true**.

Use **IfError** to replace an error with a valid value so that downstream calculations can continue. For example, use this function if user input might result in a division by zero:

```powerapps-dot
IfError( 1/x, 0 )
```

This formula returns `0` if the value of `x` is zero, as `1/x` produces an error. If `x` isn't zero, then `1/x` is returned.

### Stopping further processing

When [chaining](operators.md) formulas together in [behavior formulas](/power-apps/maker/canvas-apps/working-with-formulas-in-depth), such as:

```powerapps-dot
Patch( DS1, ... );
Patch( DS2, ... )
```

The second [**Patch**](function-patch.md) function to `DS2` will be attempted even if the **Patch** to `DS1` fails. The scope of an error is limited to each formula that is chained.

Use **IfError** to do an action and only continue processing if the action was successful. Applying **IfError** to this example:

```powerapps-dot
IfError(
    Patch( DS1, ... ), Notify( "problem in the first action" ),
    Patch( DS2, ... ), Notify( "problem in the second action" )
)
```

If the **Patch** of `DS1` has a problem, the first **Notify** is executed. No further processing occurs including the second **Patch** of `DS2`. If the first **Patch** succeeds, the second **Patch** will execute.

If supplied, the optional _DefaultResult_ argument is returned if no errors are discovered. Without this argument, the last _Value_ argument is returned.

Building on the last example, the return value from **IfError** can be checked to determine if there were any problems:

```powerapps-dot
IfError(
    Patch( DS1, ... ), Notify( "problem in the first action" );  false,
    Patch( DS2, ... ), Notify( "problem in the second action" ); false,
    true
)
```

### Type compatibility

**IfError** returns the value of one of its arguments. The types of all values that might be returned by **IfError** must be compatible.

In the last example, **Patch** returns a record that isn't compatible with the Booleans used for the _Replacement_ formulas or the _DefaultResult_. Which is fine, since there's no situation in which the return value from these **Patch** calls would be returned by **IfError**.

> [!NOTE]
> While the behavior in process for a change, the types of all arguments to **IfError** must be compatible currently.

In the simple example described earlier:

```powerapps-dot
IfError( 1/x, 0 )
```

The types of `1/x` and `0` were compatible as both were numbers. If they're not, the second argument is coerced to match the type of the first argument.

Excel displays **#DIV/0!** when a division by zero occurs.

Consider **IfError** with the following instead:

```powerapps-dot
IfError( 1/x, "#DIV/0!" )
```

The above formula won't work. The text string `"#DIV/0!"` is coerced to the type of the first argument to **IfError**, which is a number. The result of **IfError** is yet another error since the text string can't be coerced. As a fix, convert the first argument to a text string so that **IfError** always returns a text string:

```powerapps-dot
IfError( Text( 1/x ), "#DIV/0!" )
```

As seen above, **IfError** can return an error if the _Replacement_ or _DefaultResult_ is an error.

### FirstError / AllErrors

Within in the replacement formulas, information about the errors found is available through the **FirstError** record and **AllErrors** table. **AllErrors** is a table of error information records with **FirstError** being a shortcut to the first record of this table. **FirstError** always returns the same value as **First( AllErrors )**.

Error records include:

| Field        | Type                    | Description                                                                                                                                                                                                                                                |
| ------------ | ----------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Kind**     | ErrorKind enum (number) | Category of the error.                                                                                                                                                                                                                                     |
| **Message**  | Text string             | Message about the error, suitable to be displayed to the end user.                                                                                                                                                                                         |
| **Source**   | Text string             | Location in where the error originated, used for reporting. For example, for a formula bound to a control property, this value is in the form _ControlName.PropertyName_.                                                                                   |
| **Observed** | Text string             | Location in where the error is surfaced to the user, used for reporting. For example, for a formula bound to a control property, this value is in the form _ControlName.PropertyName_.                                                                      |
| **Details**  | Record                  | Details about the error. Currently, details are provided only for network errors. This record includes **HttpStatusCode** which contains the HTTP status code and **HttpResponse** which contains the body of the response from the connector or service. |

For example, consider the following formula as a [**Button**](/power-apps/maker/canvas-apps/controls/control-button) control's **OnSelect** property:

```powerapps-dot
Set( a, 1/0 )
```

And this formula on the **OnSelect** property of a second [**Button**](/power-apps/maker/canvas-apps/controls/control-button) control:

```powerapps-dot
IfError( a, Notify( "Internal error: originated on " & FirstError.Source & ", surfaced on " & FirstError.Observed ) )
```

The example formula above would display the following banner when the two buttons are activated in sequence:

![Button control activated, showing a notification from the Notify function.](media/function-iferror/notify-firsterror.png)

Typically, there will be only one error that **FirstError** can sufficiently work with. However, there are scenarios where multiple errors may be returned. For example, when using a [formula chaining operator](./operators.md) or the [**Concurrent** function](./function-concurrent.md). Even in these situations, reporting **FirstError** might be enough to reveal a problem instead overloading a user with multiple errors. If you still have a requirement to work with each error individually, you can use the **AllErrors** table.

## IsError

The **IsError** function tests for an error value.

The return value is a Boolean _true_ or _false_.

Using **IsError** prevents any further processing of the error.

## IsBlankOrError

The **IsBlankOrError** function tests for either a blank value or an error value and is the equivalent of `Or( IsBlank( X ), IsError( X ) )`.

When enabling error handling for existing apps, consider replacing **IsBlank** with **IsBlankOrError** to preserve existing app behavior. Before the addition of error handling, a _blank_ value was used to represent both null values from databases and error values. Error handling separates these two interpretations of _blank_ which could change the behavior of existing apps that continue to use **IsBlank**.

The return value is a boolean _true_ or _false_.

Using **IsBlankOrError** prevents any further processing of the error.

Use the **Error** function to create and report a custom error. For example, you might have logic to determine whether any given value is valid for your context or not&mdash;something not checked for a problem automatically. You can create and return your own error, complete with **Kind** and **Message**, using the same record described above for the **IfError** function.

In the context of **IfError**, use the **Error** function to rethrow or pass through an error. For example, your logic in **IfError** may decide that in some cases an error can be safely ignored, but in other cases the error is important to send through. Within **IfError** or **App.OnError**, use **Error( FirstError )** to pass through an error.

The **Error** function can also be passed a table of errors, as would be found in the **AllErrors** table. Use **Error( AllErrors )** to rethrow all the errors and not just the first.

A _blank_ record or empty table passed to **Error** results in no error.

## Syntax

**Error**( **ErrorRecord** )<br>**Error**( **ErrorTable** )

- _ErrorRecord_ – Required. Error information record, including **Kind**, **Message**, and other fields. **Kind** is required. **FirstError** can be passed directly.
- _ErrorTable_ – Required. Table of error information records. **AllErrors** can be passed directly.

**IfError**( _Value1_, _Replacement1_ [, _Value2_, _Replacement2_, ... [, *DefaultResult* ] ] )

- _Value(s)_ – Required. Formula(s) to test for an error value.
- _Replacement(s)_ – Required. The formulas to evaluate and values to return if matching _Value_ arguments returned an error.
- _DefaultResult_ – Optional. The formulas to evaluate if the formula doesn't find any errors.

**IsError**( _Value_ )<br>**IsBlankOrError**( _Value_ )

- _Value_ – Required. Formula to test.

## Examples

### Simple IfError

| Formula                                                       | Description                                                                                                                                                                                                                                                                                                                                                                                                                      | Result |
| ------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| **IfError( 1, 2 )**                                           | The first argument isn't an error. The function has no other errors to check and no default return value. The function returns the last _value_ argument evaluated.                                                                                                                                                                                                                                                              | 1      |
| **IfError( 1/0, 2 )**                                         | The first argument returns an error value (because of division by zero). The function evaluates the second argument and returns it as the result.                                                                                                                                                                                                                                                                                | 2      |
| **IfError( 10, 20, 30 )**                                     | The first argument isn't an error. The function has no other errors to check but does have a default return value. The function returns the _DefaultResult_ argument.                                                                                                                                                                                                                                                            | 30     |
| **IfError( 10, 11, 20, 21, 300 )**                            | The first argument **10** isn't an error, so the function doesn't evaluate that argument's corresponding replacement **11**. The third argument **20** isn't an error either, so the function doesn't evaluate that argument's corresponding replacement **21**. The fifth argument **300** has no corresponding replacement and is the default result. The function returns that result because the formula contains no errors. | 300    |
| **IfError( 1/0, Notify( "There was an internal problem" ) )** | The first argument returns an error value (due to division by zero). The function evaluates the second argument and displays a message to the user. The return value of **IfError** is the return value of **Notify**, coerced to the same type as the first argument to **IfError** (a number).                                                                                                                                 | 1      |

### Simple IsError

| Formula                                                             | Description                                                                                                                                                                                                                                                                                                                                | Result  |
| ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------- |
| **IsError( 1 )**                                                    | The argument isn't an error.                                                                                                                                                                                                                                                                                                               | _false_ |
| **IsError( Blank() )**                                              | The argument is a blank, but not an error.                                                                                                                                                                                                                                                                                                 | _false_ |
| **IsError( 1/0 )**                                                  | The argument is an error.                                                                                                                                                                                                                                                                                                                  | _true_  |
| **If( IsError( 1/0 ), Notify( "There was an internal problem" ) )** | The argument to **IsError** returns an error value (because of division by zero). This function returns _true_, which causes the **If** to display a message to the user with the **Notify** function. The return value of **If** is the return value of **Notify**, coerced to the same type as the first argument to **If** (a boolean). | _true_  |

### Simple IsBlankOrError

| Formula                       | Description                             | Result  |
| ----------------------------- | --------------------------------------- | ------- |
| **IsBlankOrError( 1 )**       | The argument isn't an error or a blank. | _false_ |
| **IsBlankOrError( Blank() )** | The argument is a blank.                | _true_  |
| **IsBlankOrError( 1/0 )**     | The argument is an error.               | _true_  |

### Simple Error

In this example, dates are validated relative to one another, resulting in an error if there is a problem.

```powerapps-dot
If( StartDate > EndDate,
    Error( { Kind: ErrorKind.Validation, Message: "Start Date must be before End Date" } ) )
```

In this example, some errors are allowed to pass through while others are suppressed and replaced with a value. In the first case, **b** is in an error state because the **Value** function has an invalid argument. Because this is unexpected by the formula writer, it is passed through so the user sees it. In the second case, with the same formula, **b** has the value 0, resulting in a division by zero. In this case, the formula writer may know that this is acceptable for this logic, suppress the error (no banner is shown), and return -1 instead.

```powerapps-dot
With( {a: 1, b: Value("a")},
      IfError( a/b, If( FirstError.Kind <> ErrorKind.Div0, Error( FirstError ), -1 ) ) )
// returns an error with Kind = ErrorKind.InvalidArgument

With( {a: 1, b: 0} )
      IfError( a/b, If( FirstError.Kind <> ErrorKind.Div0, Error( FirstError ), -1 ) ) )
// returns -1
```

The **AllErrors** table can be filtered like any other table. Used with the **Error** function, expected errors can be removed and the remaining errors retained and reported. For example, if we knew that division by zero wasn't going to be a problem in a particular context, those errors could be filtered out, leaving all other errors intact with the following formula:

```powerapps-dot
Error( Filter( AllErrors, Kind <> ErrorKind.Div0 ) )
```

### Step by step

1. Add a **[Text input](/power-apps/maker/canvas-apps/controls/control-text-input)** control, and name it **TextInput1** if it doesn't have that name by default.

1. Add a **[Label](/power-apps/maker/canvas-apps/controls/control-text-box)** control, and name it **Label1** if it doesn't have that name by default.

1. Set the formula for **Label1**'s **Text** property to:

   ```powerapps-dot
   IfError( Value( TextInput1.Text ), -1 )
   ```

1. In **TextInput1**, enter **1234**.

   Label1 shows the value **1234** as this is a valid input to the Value function.

1. In **TextInput1**, enter **ToInfinity**.

   Label1 shows the value **-1** as this isn't a valid input to the Value function. Without wrapping the Value function with IfError, the label would show no value as the error value is treated as a _blank_.

### See also

[Formula reference for Power Apps](/power-apps/maker/canvas-apps/formula-reference)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































