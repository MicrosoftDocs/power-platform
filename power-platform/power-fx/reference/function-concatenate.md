---
title: Concat and Concatenate functions
description: Reference information including syntax and examples for the Concat and Concatenate functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 06/20/2025
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
no-loc: ["Concat","Concatenate"]
---

# Concat and Concatenate functions
[!INCLUDE[function-concatenate-applies-to](includes/function-concatenate-applies-to.md)]



Concatenates individual strings of text and strings in [tables](/power-apps/maker/canvas-apps/working-with-tables).

## Description

The **Concatenate** function concatenates a mix of individual strings and a single-column table of strings. When you use this function with individual strings, it's equivalent to using the **&** [operator](operators.md).

The **Concat** function concatenates the result of a formula applied across all the [records](/power-apps/maker/canvas-apps/working-with-tables#records) of a table, resulting in a single string. Use this function to summarize the strings of a table, just as the **[Sum](function-aggregates.md)** function does for numbers.

[!INCLUDE [record-scope](../../includes/record-scope.md)]

Use the [**Split**](function-split.md) or [**MatchAll**](function-ismatch.md) function to split a string into a table of substrings.

## Syntax

**Concat**( _Table_, _Formula_, _separator_)

- _Table_ - Required. Table to operate on.
- _Formula_ - Required. Formula to apply across the records of the table.
- _Separator_ - Optional. A text value to be inserted between concatenated rows of the table.

**Concatenate**( _String1_ [, *String2*, ...] )

- _String(s)_ - Required. Mix of individual strings or a single-column table of strings.

## Examples

The examples in this section use these global variables:

- **FirstName** = "Jane"
- **LastName** = "Doe"
- **Products** = ![Table with two columns and four rows.](media/function-concatenate/products.png)

To create these global variables in an app, insert a [**Button**](/power-apps/maker/canvas-apps/controls/control-button) control, and set its **OnSelect** property to this formula:

```power-fx
Set( FirstName, "Jane" ); Set( LastName, "Doe" );
Set( Products,
    Table(
        { Name: "Violin", Type: "String" },
        { Name: "Cello", Type: "String" },
        { Name: "Trumpet", Type: "Wind" }
    )
)
```

Select the button (by clicking it while you hold down the Alt key).

### Concatenate function and the & operator

For these examples, set the **Text** property of a [**Label**](/power-apps/maker/canvas-apps/controls/control-text-box) control to a formula from the first column of the next table.

| Formula | Description | Result |
| --- | --- | --- |
| **Concatenate(&nbsp;LastName,&nbsp;",&nbsp;",&nbsp;FirstName&nbsp;)** | Concatenates the value in **LastName**, the string **", "** (a comma followed by a space), and the value in **FirstName**. | "Doe,&nbsp;Jane" |
| **LastName&nbsp;&&nbsp;",&nbsp;"&nbsp;&&nbsp;FirstName** | Same as the previous example except using the **&** operator instead of the function. | "Doe,&nbsp;Jane" |
| **Concatenate(&nbsp;FirstName,&nbsp;"&nbsp;",&nbsp;LastName&nbsp;)** | Concatenates the value in **FirstName**, the string **" "** (a single space), and the value in **LastName**. | "Jane&nbsp;Doe" |
| **FirstName&nbsp;&&nbsp;"&nbsp;"&nbsp;&&nbsp;LastName** | Same as the previous example, using the **&** operator instead of the function. | "Jane&nbsp;Doe" |

### Concatenate with a single-column table

For this example, add a blank, vertical [**Gallery**](/power-apps/maker/canvas-apps/controls/control-gallery) control, set its **Items** property to the formula in the next table, and then add a label in the gallery template.

| Formula | Description | Result |
| --- | --- | --- |
| **Concatenate( "Name:&nbsp;",&nbsp;Products.Name, ",&nbsp;Type:&nbsp;",&nbsp;Products.Type )** | For each record in the **Products** table, concatenates the string **"Name: "**, the name of the product, the string **", Type: "** and the type of the product. | A single-column table with a `Value` column containing the following values: "Name: Violin, Type: String", "Name: "Cello, Type: String", "Name: Trumpet, Type: Wind" |

### Concat function

For these examples, set the **Text** property of a label to a formula from the first column of the next table.

| Formula | Description | Result |
| --- | --- | --- |
| **Concat( Products, Name, ", " )** | Evaluates the expression **Name** for each record of **Products** and concatenates the results together into a single text string separated by **", "**. | "Violin,&nbsp;Cello,&nbsp;Trumpet" |
| **Concat( Products, "'" & Name & "'", ", " )** | Evaluates the expression **"'" & Name & "'"** for each record of **Products** and concatenates the results together into a single text string separated by **", "**. | "'Violin',&nbsp;'Cello',&nbsp;'Trumpet'" |
| **Concat( Filter(&nbsp;Products,&nbsp;Type&nbsp;=&nbsp;"String"&nbsp;), Name, ", " )** | Evaluates the formula **Name** for each record of **Products** that satisfies the filter **Type = "String"**, and concatenates the results into a single text string separated by **", "**. | "Violin,&nbsp;Cello" |


### Split and MatchAll

If you used **Concat** with a separator, you can reverse the operation by using the **Split** function.

For these examples, add a blank, vertical gallery, set its **Items** property to a formula in the next table, and then add a label in the gallery template.

| Formula | Description | Result |
| --- | --- | --- |
| **Split( Concat(&nbsp;Products,&nbsp;Name,&nbsp;",&nbsp;"&nbsp;), ", " )** | Splits the text string with the separator **", "**. | A single-column table with a `Value` column containing the following values: "Violin", "Cello", "Trumpet" |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]









































































































































