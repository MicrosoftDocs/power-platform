---
title: Find function in Power Apps
description: Reference information including syntax and examples for the Find function in Power Apps.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 11/07/2015
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# Find function in Power Apps

Finds a string of text, if it exists, within another string.

## Description

The **Find** function looks for a string within another string and is case sensitive. To ignore case, first use the **[Lower](function-lower-upper-proper.md)** function on the arguments.

**Find** returns the starting position of the string that was found. Position 1 is the first character of the string. **Find** returns _blank_ if the string in which you're searching doesn't contain the string for which you're searching.

## Syntax

**Find**( _FindString_, _WithinString_ [, *StartingPosition* ] )

- _FindString_ - Required. The string to find.
- _WithinString_ - Required. The string to search within.
- _StartingPosition_ - Optional. The starting position to start searching. Position 1 is the first character.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
