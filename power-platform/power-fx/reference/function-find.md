---
title: Find function
description: Reference information including syntax and examples for the Find function.
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

# Find function
[!INCLUDE[function-find-applies-to](includes/function-find-applies-to.md)]



Finds a string of text, if it exists, within another string.

## Description

The **Find** function looks for a string within another string and is case sensitive. To ignore case, first use the **[Lower](function-lower-upper-proper.md)** function on the arguments.

**Find** returns the starting position of the string that was found. Position 1 is the first character of the string. **Find** returns _blank_ if the string in which you're searching doesn't contain the string for which you're searching.

## Syntax

**Find**( _FindString_, _WithinString_ [, *StartingPosition* ] )

- _FindString_ - Required. The string to find.
- _WithinString_ - Required. The string to search within.
- _StartingPosition_ - Optional. The starting position to start searching. Position 1 is the first character.

## Examples

| Formula                                          | Description                                                                    | Result                                                                                                         |
| ------------------------------------------------ | ------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------- |
| **Find("World", "Hello World")**                  | Returns the starting position of **"World"**.                                      | 7                                                                         |
| **Find("World", "Hello World, Hello World", 10)** | Returns the starting position of the first occurrence of **"World"** after the 10th character. | 20                                                                         |
| **Find("Mars", "Hello World")**                   | Returns blank since the FindString is not in the WithinString                   | Blank()                                                                        |


[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































