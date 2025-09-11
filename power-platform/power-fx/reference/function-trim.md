---
title: Trim and TrimEnds functions
description: Reference information including syntax and examples for the Trim and TrimEnds functions.
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
no-loc: ["Trim","TrimEnds"]
---

# Trim and TrimEnds functions
[!INCLUDE[function-trim-applies-to](includes/function-trim-applies-to.md)]



Removes extra spaces from a string of text.

## Description

The **Trim** function removes all spaces from a string of text except for single spaces between words.

The **TrimEnds** function removes all spaces from the start and end of a string of text but leaves spaces between words intact.

If you specify a single string of text, the return value for either function is the string with any extra spaces removed. If you specify a single-column [table](/power-apps/maker/canvas-apps/working-with-tables) that contains strings, the return value is a single-column table of trimmed strings. If you have a multi-column table, you can shape it into a single-column table, as [working with tables](/power-apps/maker/canvas-apps/working-with-tables) describes.

By trimming spaces between words, **Trim** is consistent with the function of the same name in Microsoft Excel. However, **TrimEnds** is consistent with programming tools that trim spaces only from the start and end of each string.

## Syntax

**Trim**( _String_ )<br>**TrimEnds**( _String_ )

- _String_ - Required. The string of text to remove spaces from.

**Trim**( _SingleColumnTable_ )<br>**TrimEnds**( _SingleColumnTable_ )

- _SingleColumnTable_ - Required. A single-column table of strings to remove spaces from.

## Example

| Formula | Description | Result |
| --- | --- | --- |
| **Trim(&nbsp;"&nbsp;&nbsp;&nbsp;Hello&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;World&nbsp;&nbsp;&nbsp;"&nbsp;)** | Removes all spaces from the start and end of a string and extra spaces from within the string. | "Hello World" |
| **TrimEnds(&nbsp;"&nbsp;&nbsp;&nbsp;Hello&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;World&nbsp;&nbsp;&nbsp;"&nbsp;)** | Removes all spaces from the start and end of a string. | "Hello&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;World" |

The following examples use a single-column collection, named **Spaces**, that contains these strings:

| Value |
| --- |
| "&nbsp;&nbsp;&nbsp;Jane&nbsp;&nbsp;&nbsp;Doe&nbsp;&nbsp;&nbsp;" |
| "&nbsp;&nbsp;&nbsp;&nbsp;Jack&nbsp;&nbsp;&nbsp;and&nbsp;&nbsp;&nbsp;Jill" |
| "Already&nbsp;trimmed" |
| "&nbsp;&nbsp;&nbsp;Venus,&nbsp;&nbsp;&nbsp;Earth,&nbsp;&nbsp;&nbsp;Mars&nbsp;&nbsp;" |
| "Oil&nbsp;and&nbsp;Water&nbsp;&nbsp;&nbsp;" |

To create this collection, set the **OnSelect** property of a **[Button](/power-apps/maker/canvas-apps/controls/control-button)** control to this formula, open Preview mode, and then click or tap the button:
<br>**ClearCollect( Spaces, [ "&nbsp;&nbsp;&nbsp;Jane&nbsp;&nbsp;&nbsp;Doe&nbsp;&nbsp;&nbsp;", "&nbsp;&nbsp;&nbsp;&nbsp;Jack&nbsp;&nbsp;&nbsp;and&nbsp;&nbsp;&nbsp;Jill", "Already&nbsp;trimmed", "&nbsp;&nbsp;&nbsp;Venus,&nbsp;&nbsp;&nbsp;Earth,&nbsp;&nbsp;&nbsp;Mars&nbsp;&nbsp;", "Oil&nbsp;and&nbsp;Water&nbsp;&nbsp;&nbsp;" ] )**

| Formula | Description | Result |
| --- | --- | --- |
| **Trim(&nbsp;Spaces&nbsp;)** | Trims all spaces from the start and end of each string and extra spaces from within each string in the **Spaces** collection. | A single-column table with a `Value` column containing the following values: "Jane&nbsp;Doe", "Jack&nbsp;and&nbsp;Jill", "Already&nbsp;trimmed", "Venus,&nbsp;Earth,&nbsp;Mars", "Oil&nbsp;and&nbsp;Water" |
| **TrimEnds(&nbsp;Spaces&nbsp;)** | Trims all spaces from the start and end of each string in the **Spaces** collection. | A single-column table with a `Value` column containing the following values: "Jane&nbsp;&nbsp;&nbsp;Doe", "Jack&nbsp;&nbsp;&nbsp;and&nbsp;&nbsp;&nbsp;Jill", "Already&nbsp;trimmed", "Venus,&nbsp;&nbsp;&nbsp;Earth,&nbsp;&nbsp;&nbsp;Mars", "Oil&nbsp;and&nbsp;Water" |

> [!NOTE]
> Extra spaces don't appear if you display a collection by clicking or tapping **Collections** on the **File** menu. To verify string length, use the **[Len](function-len.md)** function.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]






































































































































