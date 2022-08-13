---
title: Understand errors in canvas apps
description: Reference information about working with errors in canvas apps.
author: gregli-msft
ms.topic: conceptual
ms.custom: canvas
ms.reviewer: tapanm
ms.date: 08/15/2022
ms.subservice: canvas-maker
ms.author: gregli
search.audienceType: 
  - maker
search.app: 
  - PowerApps
contributors:
  - tapanm-msft
  - gregli-msft
---
# Error handling

Errors happen.  Networks go down, storage fills up, unexpected values flow in.  

By default, errors flow thorugh the formulas of an app and are reported to the end user of the app.  In this way, the end user knows something unexpected happen and they can report a problem to the creator of the app.  

As an app maker, you can take control of errors in your app:
- Detecting and handling an error.  If there is a chance an error may occur, for example a network problem, the app's formulas can be written to detect the error condition and retry the operation.  The end user need to be concerned that an error occurred because the maker took the possibility into account.  This is done with the [**IfError**, **IsError**, and **IsErrorOrBlank**](reference/function-iferror.md) functions within a formula.
- Reporting an error.  If an error is not handled in the formula where it was encountered, the error is then bubbled up to the **App.OnError** handler.  Here, the error can no longer be replaced as it has already occurred and is a part of formula calculations.  But you can use **App.OnError** to control how the error is reported to the end user, including suppressing the error reporting all together.  **App.OnError** also provides a common choke point for error reporting across the entire app.
- Creating and rethrowing an error.  Finally, you may detect an error condition with your own logic, a condition that is specific to your app.  Use the [**Error**](reference/function-iferror.md) function to create custom erorrs.  THe **Error** function is also used to rethrow an error after being interrogated in **IfError** or **App.OnError**.

## Getting started

Let's start with a simple example.

1. Create a new screen in a Power Apps Canvas app.
1. Insert a **TextInput** control.  It will default to the name **TextInput1**.
1. Insert a **Label** control.
1. Set the **Text** property of the **Label** control to the formula

```powerapps-dot
1/Value( TextInput1.Text )
```
![](media/error-handling/intro-error-default.png)

We have an error because the default text of a **TextInput** control is **"Text input"**, which cannot be converted to a number.   By default this is a good thing: the end user will get a notification that something isn't working as expected in the app.

But of course we don't want an error to greet the user each time they start this app.  Likely *"Text input"* isn't the right default for the text input box anyway.  To remedy this, let's change the **Default** property of the **TextInput** control to:

```powerapps-dot
Blank()
```
![](media/error-handling/intro-error-blank.png)

Hmm, now we have a different error.  Mathematical operations with *blank*, such as division, will coerce the blank to a zero.  And that is causing a division by zero error.  To rememdy this, we need to decice what the appropriate behavior is for this situation in this app.  The answer may be to show *blank* when the text input is *blank*.  We can accomplish this vy wrapping our formula with the **IfError** function:

```powerapps-dot
IfError( 1/Value( TextInput1.Text ), Blank() )
```
![](media/error-handling/intro-error-iferror-all.png)

Now the erorr is replaced with a valid value and the error banner has gone away.  But, we may have overshot, the **IfError** we used covers *all* errors, including typing in a bad value such as **"hello"**.  We can address this by tuning our **IfError** to handle the division by zero case only with and rethrowing all other errors:

```powerapps-dot
IfError( 1/Value( TextInput1.Text ), 
         If( FirstError.Kind = ErrorKind.Div0, Blank(), Error( First Error ) ) )
```
![](media/error-handling/intro-error-iferror-div0.png)

So, let's run our app and try some differen values.  

Without any value, as when the app starts due to the default, there is no answer displayed, but also no error as the **IfError** repalces the diviosn by zero error.  

![](media/error-handling/intro-enter-blank.png)

If we type in a 4, we get the expected result of 0.25:

![](media/error-handling/intro-enter-4.png)

And if we type in somehting illegal, like "hello", then we will receive an error banner:

![](media/error-handling/intro-enter-hello.png)

This is a very simple introductory example.  There are many directions we could have taken this:

1. Instead of an error banner, we could have shown **"#Error"** in the label control with the formula.  Note that to keep the types of the replacements copmatible with the first argument to **IfError** we need to expliclity convert to a text string with the **Text** function.
    ```powerapps-dot
    IfError( Text( 1/Value( TextInput1.Text ) ), 
             If( FirstError.Kind = ErrorKind.Div0, Blank(), "#Error" )
    ```
    ![](media/error-handling/intro-error-inlinestring.png)
2. Instead of wrapping this specific instance with **IfError** we could have written a centralized **App.OnError** handler. Note that we cannot replace the string shown with "#Error" as the error has already happened and **App.OnError** is only about reporting.
    ```powerapps-dot
    If( FirstError.Kind <> ErrorKind.Div0, Error( FirstError ) )
    ```

## Error propogation

Errors flow through formulas much as they do in Excel.  For example in Excel, if cell `A1` has the formula `=1/0`, then A1 will display the error value `#DIV0!`:

![](media/error-handling/excel-div0-1.png)

If cell `A2` refers to `A1` with a formula such as `=A1*2`, then the error propogates through that formula too:

![](media/error-handling/excel-div0-2.png)

The error replaces the value that would have otherwise been calculated.  There is no result for the multiplication in cell `A2`, only the error from the division in `A1`.  

Power Fx works the same way.  In general, if an error is provided as an argument to a function or operator, the operation will not take place and the input error will flow through as the result of the operation.  For example, `Mid( Text( 1/0 ), 1, 1 )` will return a Division by Zero error, as the inner most error passes through the [**Text**](reference/function-text.md) function and [**Mid**](reference/function-left-mid-right.md) function:

![](media/error-handling/pa-formula-div0.png)

In general, errors do not flow through Power Apps control properties. Let's extend the previous example with an additional control that displays if the first label's `Text` property is an error state:

![](media/error-handling/pa-formula-div0-control.png)

It's fine that errors don't propagate through a control because the system will observe errors on the input to all control properties.  The error won't be lost.

Most funcitons and operators follow the "error in, error out" rule, but there are some exceptions.  The functions **IsError**, **IsErrorOrBlank**, and **IfError** are specifically designed for working with errors, as such they may not return an error even if one is passed into them.

## Observing errors

Errors are not observed until their value is actually used.

As a result, the **If** and **Select** functions also may not always return an error if one is passed in.  Consider the formula `If( false, 1/0, 3 )`.  There is a division by zero error present in this formula, but since the `If` is not taking that branch because of the `false`, Power Fx and Power Apps will not report an error:

![](media/error-handling/pa-not-observed.png)

Using the **Set** function with an error will not report an error at the point the error is placed into the variable.  For example in Power Apps, here is a formula in **App.OnStart** that places a division by zero error into the variable `x`:

![](media/error-handling/pa-set-not-observed-1.png)

No error is reported, because `x` is not being referneced.  However, the moment we add a label control and set its **Text** property to `x`, the error is displayed:

![](media/error-handling/pa-set-not-observed-2.png)

You can observe errors within a formula with the **IfError**, **IsError**, and **IsErrorOrBlank** functions.  With these functions, you can return an alternate value, take alternate action, or modify the error before it is observed and reported.

## Reporting errors

After an error is observed, the next step is to report the error to the end user.  

Unlike Excel, there isn't always a convenient place to show an error result, as the result of a formula may drive a property such as X and Y coordinates of a control for which there is no convenient place to show some text.  Each Power Fx host controls how errors are ultimately displayed to the end user and how much control the maker has over this process.  In Power Apps, an error banner is shown and **App.OnError** is used to control how the error is reported.

It is important to note that **App.OnError** cannot replace the error in the same way that **IfError** can.  At the point that **App.OnError** is executed, the error has already happened, and the result has propagated through other formulas.  **App.OnError** only controls how the error is reported to the end user and provides a hook for the maker to log the error if desired.

The scope variables **FirstError** and **AllErrors** provide context information about the error or errors.  This provides information on the kind of error and where the error originated and where it was observed.

## Imperative logic

Power Fx supports two kinds of logic: functional and imperative.  Functional is like 

Multiple errors

There are a couple of situations in which multiple errors may be returned:
- Using the chaining operator `;` to 
- Using the **Concurrent** function.

Imperative 

Stopping on an error

Power Fx does not stop 

Chaining operator

## Errors in tables

## Createing your own errors

Custom errors

Custom kind values
