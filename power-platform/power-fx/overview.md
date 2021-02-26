---
title: Power Fx Overview | Microsoft Docs
description: Overview of the Power Fx language
author: gregli-msft
manager: kvivek
ms.service: powerapps
ms.topic: conceptual
ms.reviewer: tapanm
ms.date: 02/26/2021
ms.author: gregli
search.audienceType: 
  - maker
search.app: 
  - PowerApps
---
# Power Fx

Power Fx is the low-code language used across the Power Platform.  It is a general purpose, declarative, and functional programming language.

At its heart, Power Fx binds objects together with declarative spreadsheet-like formulas.  Think of a UI control's **Visible** property like a spreadsheet cell, with an associated formula that calculates its value based on other control properties.  The formula logic recalculates automatically just like a spreadsheet does which affects the control's visibility.  

In addition, Power Fx offers imperative logic when needed.  Spreadsheets don't typically have buttons, that may submit changes to a database, but apps often do.  The same expression language is used for both declarative and imperative logic.

Power Fx is expressed in human friendly text.  It is considered a "low-code" language that makers can work with directly in a Excel like formula bar or Visual Studio Code text window.  The "low" is due to the concise and simple nature of the language, making common programming tasks easy for both makers and developers.

Power Fx will be made available as open source.  It is currently integrated into Canvas Power Apps where you can experience it today.  We are in the process of extracting it from this product for use in other products and as open source.  Power Fx's open source home is [https://github.com/microsoft/power-fx](https://github.com/microsoft/power-fx).  

This article is an overview of the language and its design principles.  Further details can be found in these articles:

- [Data types](data-types.md)
- [Operators and identifiers](operators.md)
- [Tables](tables.md)
- [Variables](variables.md)
- [Imperative logic](imperative.md)
- [Global supprt](global-support.md)
- [Expression grammar](expression-grammar.md)
- [YAML formula grammar](yaml-formula-grammar.md)

> [!NOTE]
> This documentation is incomplete.  Just as we are extracting and generalizing the code for Power Fx from canvas Power Apps, so too we are the documentation.  If you don't find an answer here, please check the [canvas Power Apps documentation](../../powerapps/maker/canvas-apps/formula-reference.md).

## Audience 

Power Fx is designed to be an easy to use programming language.  It serves the needs of a wide spectrum ranging from those who have never explicitly programmed to seasoned professionals.

Spreadsheets are the most widely used tool for expressing logic by a wide margin.  Without even realizing it, people are programming when they write spreadsheet cell formulas.  Power Fx was built on the hypothesis that we could leverage spreadsheet patterns and knowledge beyond the spreadsheet, to the creation of apps, workflows, virtual agents, and many other domains.  In doing so, we could enable the general population to express logic in more places for more purposes.  We refer to anyone who has the ability and motivation to express logic as a *maker*.

Professional developers will also use this language as it offers speed of development benefits over more traditional languages.  These folks may have written code in JavaSciprt, C#, Python, or any other professional programming language.  Where we need to differentiate, we refer to anyone who writes traditional code as a *developer*.

In this document we refer to makers when referring to a feature that could be used by either end of the spectrum.  We refer to the user as a developer if the feature is more advanced and is beyond the scope of an Excel user.

## Environment

A defining aspect of spreadsheets is that they are always live and changes are reflected instantaneously.  There is no compile or run mode in a spreadsheet.  When a formula is modified or a value is entered, the spreadsheet immediately recalculates to reflect the change.

So it is with Power Fx as well.  An incremental compiler is used to continuously keep the program and the data it is operating upon in sync.  Changes automatically propagate through the program's graph, affecting the results of dependent calculations, which may drive properties on controls such as color or position.  The incremental compiler also provides a rich formula editing experience with IntelliSense, suggestions, auto complete, and type checking.

For convenience, this document refers to the *compiler* in the same way most programming languages do.     
 
## Formulas vs. Expressions

Nearly all programming languages, including Power Fx, have expressions: a way to represent a calculation over numbers, strings, and other data types.  For example `mass * acceleration` in most languages expresses multiplication of `mass` and `acceleration`.  The result of an expression can be placed in a variable, used as an argument to a procedure, or nested in a bigger expression.

Power Fx takes this a step further.  An expression by itself says nothing about what it is calculating.  It is up to the maker to place it in a variable or pass it to a function. In Power Fx, instead of only writing an expression that has no specific meaning, one writes a *formula* that binds the expression to an identifier.  One writes `force = mass * acceleration` as a formula, in the mathematical sense, for calculating `force` that is always true.  As `mass` or `acceleartion` changes, `force` automatically updates to a new value.  An expression described a calculation, a formula gives that calculation a name and uses it as a recipe.  This is why we refer to Power Fx as a formula language.

The **Fx** in the Power Fx name is a reference to the script *fx* icon that can be commonly found next to the formula bar in spreadsheets.  Technically the *fx* icon refers to functions, but the association with formulas is strong and can be found in many other products beyond spreadsheets.  Either way, both formulas and functions are at the heart of Power Fx.    

## Principles 

### Simple 

Our target audience includes makers who are not trained as developers.  Wherever possible, we leverage knowledge that this audience would already know or can pick up quickly.  The number of concepts required to be successful is kept to a minimum.

Being simple is also good for developers.  For this audience, we aim to be a low code language that cuts down the time required to build a solution.

For example, all operations are presented to the maker as synchronous when under the covers they may be done asynchronously.  There is no need to setup a callback to free up the UI thread or otherwise be aware of threading.  The compiler may also reorder or parallelize operations that have no dependencies.  All of these are important implementation details that the maker need not concern themselves with and likely would get wrong if they did.

### Excel consistency 

The PowerApps language borrows heavily from the Excel formula language.  We seek to leverage as much Excel knowledge and experience from the many makers who also use Excel.  Types, operators, and function semantics are as close to Excel as possible.

If Excel does not have an answer, we next look to SQL.  After Excel, SQL is the next most commonly used declarative language and can provide guidance on data operations and strong typing that Excel does not.

### Declarative 

The maker describes "what" they want their logic to do, not exactly "how" or "when" it is to be done.  This allows the compiler to optimize by performing operations in parallel, deferring work until needed, pre-fetching and reusing cached data, etc.

For example, in an Excel spreadsheet the author defines the relationships between cells but Excel decides when and in what order formulas are evaluated.  Similarly, formulas in an app can be thought of as "recalcing" as needed based on user actions, database changes, or timer events.  

### Functional 

We favor pure functions without side effects.  This results in logic which is easier to understand and gives the compiler the most freedom to optimize.

However, unlike Excel, apps by their nature do mutate state.  For example, apps have buttons that save changes to the record in a database.  Some functions therefore do have side effects, although we limit this as much as is practical. 

### Composition 

Where possible, functionality is added that composes well with existing functionality.  Powerful functions be decomposed into smaller parts that can be more easily used independently.

For example, a Gallery control does not have separate Sort and Filter properties.  Instead, the Sort and Filter functions are composed together into a single Items property.  User interface for expressing Sort and Filter behavior is layered on top of the Items property with a two way editor for this property.

### Strongly typed 

The types of all values are known at compile time.  This allows for the early detection of errors and rich suggestions while authoring. 

Polymorphic types are supported, but before being used their type must be pinned to a static type and that type must be known at compile time.  The **IsType** and **AsType** functions are provided for testing and casting types.

### Type inference 

Types are derived from their use without being declared.  For example, setting a variable to a number results in that variable's type being established as a number.

Conflicting type usage results in a compile time error.

### Locale-sensitive decimal separators

Some regions of the world use a **.** (dot or period) as the decimal separator while others use a **,** (comma).  This is what Excel does too.  This is commonly not done in other programming languages, using a canonical **.** as the decimal separator for all users worldwide.  To be as approachable as possible for makers at all levels, it is important that `3,14` is a decimal number for a person in France who has used that syntax all their lives.  

The choice of decimal separator has a cascading impact on the list separator, used for function call arguments, and the chaining operator:

| Author's language decimal separator | Power Fx decimal separator | Power Fx list separator | Power Fx chaining operator |
| --- | --- | --- | --- |
| **.** (dot or period) |**.** (dot or period) |**,** (comma) |**;** (semi-colon) |
| **,** (comma) |**,** (comma) |**;** (semi-colon) |**;;** (double semi-colon) |

See [global supprt](global-support.md) for more details.

### Not object oriented 

Excel is not object oriented and neither is Power Fx.  

For example, in some languages the length of a string is expressed as a property of the string such as `"Hello World".length` in JavaScript.  Excel and PowerApps instead express this in terms of a function as `Len( "Hello World" )`. 

Obviously components with properties and methods are object oriented and Power Fx easily works with them.  But where possible we prefer a functional approach.  

### Extensible 

Makers can create their own components and functions using the formula language itself.  

Developers can create their own components and functions by writing JavaScript.

### Developer friendly 

Although makers are our primary target, we try to be developer friendly wherever possible.  If it would not conflict with the above principles, we do things in such a way that a developer would appreciate.  

For example, Excel had no answer for comments, so we use C like line and inline comments.

### Language evolution 

Like most languages, Power Fx is a work in progress.  Backward compatibility is obviously important and nobody wants existing apps to break.  However, there are times when language features should be changed or deprecated.

Power Fx has facilities for actively moving code forward without breaking it.  Apps are stamped with the version of the language they were written in.  When compiled in a newer version of the language, upgrade code in the compiler will rewrite the maker's formulas as needed to move them forward.

As a result, Power Fx may evolve faster and more aggressively than the norm.  It is possible for us to rename functions, for example, we changed **ShowError** to **Notify** when the function expanded beyond just errors.  

### No Undefined value

Some language such as JavaScript use the concept of an "undefined" value for uninitialized variables or a missing property.  For simplicity's sake, we have avoided this concept, treating instances that would be undefined elsewhere as either an error or a blank value.  For example, all uninitialized variables start with a blank value.  All data types can take on the value of blank.



