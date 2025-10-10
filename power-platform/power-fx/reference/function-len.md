---
title: Len function
description: Reference information including syntax and examples for the Len function.
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
no-loc: ["Len"]
---

# Len function
[!INCLUDE[function-len-applies-to](includes/function-len-applies-to.md)]



Returns the length of a string of text.

## Description

If you specify a single string as the argument, the return value is the length as a number. If you specify a single-column [table](/power-apps/maker/canvas-apps/working-with-tables) that contains strings, the return value is a single-column table with a **Value** column that contains the length of each string. If you have a multi-column table, you can shape it into a single-column table, as [working with tables](/power-apps/maker/canvas-apps/working-with-tables) describes.

If you specify a [blank](function-isblank-isempty.md) string, **Len** returns 0.

## Syntax

**Len**( _String_ )

- _String_ - Required. The string to measure.

**Len**( _SingleColumnTable_ )

- _SingleColumnTable_ - Required. A single-column table of strings to measure.

## Examples

### Single string

For the examples in this section, the [data source](/power-apps/maker/canvas-apps/working-with-data-sources) is a text-input control that's named **Author** and that contains the string "E. E. Cummings".

| Formula | Description | Result |
| --- | --- | --- |
| **Len( Author.Text )** | Measures the length of the string in the **Author** control. | 14 |
| **Len( "" )** | Measures the length of an empty string. | 0 |

### Single-column table

For the first example in this section, the data source is named **People** and contains this data:

| Name | Address |
| --- | --- |
| "Jean" | "123 Main St NE" |
| "Fred" | "789 SW 39th #3B" |

| Formula | Description | Result |
| --- | --- | --- |
| **Len( ShowColumns(&nbsp;People,&nbsp;"Address"&nbsp;) )** | In the **Address** [column](/power-apps/maker/canvas-apps/working-with-tables#columns) of the **People** table:<br><ul><li>Measures the length of each string.</li><li>Returns a single-column table that contains the length of each string.</li> | A single-column table with a `Value` column containing the following values: 14, 15 |
| **Len( [ "Hello", "to the", "World", "" ] )** | In the **[Value](function-value.md)** column of the inline table:<br><ul><li>Measures the length of each string.</li><li>Returns a single-column table that contains the length of each string.</li> | A single-column table with a `Value` column containing the following values: 5, 6, 5, 0 |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































