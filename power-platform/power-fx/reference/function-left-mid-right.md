---
title: Left, Mid, and Right functions
description: Reference information including syntax and examples for the Left, Mid, and Right functions.
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
no-loc: ["Left","Mid","Right"]
---

# Left, Mid, and Right functions
[!INCLUDE[function-left-mid-right-applies-to](includes/function-left-mid-right-applies-to.md)]



Extracts the left, middle, or right portion of a string of text.

## Description

The **Left**, **Mid**, and **Right** functions return a portion of a string.

- **Left** returns the beginning characters of a string.
- **Mid** returns the middle characters of a string.
- **Right** returns the ending characters of a string.

If you specify a single string as an argument, the function returns the portion that you requested of the string. If you specify a single-column [table](/power-apps/maker/canvas-apps/working-with-tables) that contains strings, the function returns a single-column table with a **Value** column containing the portions that you requested of those strings. If you specify a multi-column table, you can shape it into a single-column table, as [working with tables](/power-apps/maker/canvas-apps/working-with-tables) describes.

If the starting position is negative or beyond the end of the string, **Mid** returns _blank_. You can check the length of a string by using the **[Len](function-len.md)** function. If you request more characters than the string contains, the function returns as many characters as possible.

## Syntax

**Left**( _String_, _NumberOfCharacters_ )<br>**Mid**( _String_, _StartingPosition_ [, *NumberOfCharacters* ] )<br>**Right**( _String_, _NumberOfCharacters_ )

- _String_ - Required. The string to from which to extract the result.
- _StartingPosition_ - Required (**Mid** only). The starting position. The first character of the string is position 1.
- _NumberOfCharacters_ - Required (**Left** and **Right** only). The number of characters to return. If omitted for the **Mid** function, the function returns the portion from the starting position until the end of the string.

**Left**( _SingleColumnTable_, _NumberOfCharacters_ )<br>**Mid**( _SingleColumnTable_, _StartingPosition_ [, *NumberOfCharacters* ] )<br>**Right**( _SingleColumnTable_, _NumberOfCharacters_ )

- _SingleColumnTable_ - Required. A single-column table of strings from which to extract the results.
- _StartingPosition_ - Required (**Mid** only). The starting position. The first character of the string is position 1.
- _NumberOfCharacters_ - Required (**Left** and **Right** only). The number of characters to return. If omitted for the **Mid** function, the function returns the portion from the starting position until the end of the string.

## Examples

### Single string

The examples in this section use a text-input control as their [data source](/power-apps/maker/canvas-apps/working-with-data-sources). The control is named **Author** and contains the string "E. E. Cummings".

| Formula                      | Description                                                                           | Result     |
| ---------------------------- | ------------------------------------------------------------------------------------- | ---------- |
| **Left( Author.Text, 5 )**   | Extracts up to five characters from the start of the string.                          | "E. E."    |
| **Mid( Author.Text, 7, 4 )** | Extracts up to four characters, starting with the seventh character, from the string. | "Cumm"     |
| **Mid( Author.Text, 7 )**    | Extracts all characters, starting with the seventh character, from the string.        | "Cummings" |
| **Right( Author.Text, 5 )**  | Extracts up to five characters from the end of the string.                            | "mings"    |

### Single-column table

Each example in this section extracts strings from the **Address** [column](/power-apps/maker/canvas-apps/working-with-tables#columns) of this data source, named **People**, and returns a single-column table that contains the results:

| Name | Address |
| --- | --- |
| "Jean" | "123 Main St NE" |
| "Fred" | "789 SW 39th #3B" |

| Formula | Description | Result |
| --- | --- | --- |
| **Left( ShowColumns(&nbsp;People,&nbsp;"Address"&nbsp;), 8 )** | Extracts the first eight characters of each string. | A single-column table with a `Value` column containing the following values: "123 Main", "789 SW 3" |
| **Mid( ShowColumns(&nbsp;People,&nbsp;"Address"&nbsp;), 5, 7 )** | Extracts the middle seven characters of each string, starting with the fifth character. | A single-column table with a `Value` column containing the following values: "Main St", "SW 39th" |
| **Right( ShowColumns(&nbsp;People,&nbsp;"Address"&nbsp;), 7 )** | Extracts the last seven characters of each string. | A single-column table with a `Value` column containing the following values: "n St NE", "9th #3B" |

### Step-by-step example

1. Import or create a [collection](/power-apps/maker/canvas-apps/working-with-data-sources#collections) named **Inventory**, and show it in a gallery, as the first procedure in [Show images and text in a gallery](/power-apps/maker/canvas-apps/show-images-text-gallery-sort-filter) describes.
2. Set the **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property of the lower label in the gallery to this function:

   **Right( ThisItem.ProductName, 3 )**

   The label shows the last three characters of each product name.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































