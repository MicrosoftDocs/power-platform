---
title: IsNumeric function
description: Reference information including syntax and examples for the IsNumeric function.
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
---

# IsNumeric function
[!INCLUDE[function-isnumeric-applies-to](includes/function-isnumeric-applies-to.md)]

Tests whether a value is numeric.

## Description

The **IsNumeric** function tests whether a value is numeric. Other kinds of values include Boolean, string, [table](/power-apps/maker/canvas-apps/working-with-tables), and [record](/power-apps/maker/canvas-apps/working-with-tables#records).

The return value is a Boolean **true** or **false**.

## Syntax

**IsNumeric**( _Value_ )

## Examples

| Formula              | Description                                 | Result   |
|----------------------|---------------------------------------------|----------|
| **IsNumeric(1)**     | Evaluates if the number 1 is a number       | _true_   |
| **IsNumeric("1")**   | Evaluates if the text "1" is a number       | _true_   |
| **IsNumeric("A")**   | Evaluates if the text A is a number         | _false_  |
| **IsNumeric(1+1)**   | Evaluates if the outcome of 1+1 is a number | _true_   |
| **IsNumeric("1+1")** | Evaluates if the text 1+1 is a number       | _false_  |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































