---
title: IsNumeric function
description: Reference information including syntax and examples for the IsNumeric function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 11/01/2015
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# IsNumeric function

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Model-driven apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Power Platform CLI

Tests whether a value is numeric.

## Description

The **IsNumeric** function tests whether a value is numeric. Other kinds of values include Boolean, string, [table](/power-apps/maker/canvas-apps/working-with-tables), and [record](/power-apps/maker/canvas-apps/working-with-tables#records).

The return value is a Boolean **true** or **false**.

## Syntax

**IsNumeric**( _Value_ )

- _Value_ – Required. Value to test.

## Examples

| Formula | Description | Result |
| **IsNumeric(1)** | Evaluates if the number 1 is a number | _true_ |
| **IsNumeric("1")** | Evaluates if the text "1" is a number | _true_ |
| **IsNumeric("A")** | Evaluates if the text A is a number | _false_ |
| **IsNumeric(1+1)** | Evaluates if the outcome of 1+1 is a number | _true_ |
| **IsNumeric("1+1")** | Evaluates if the text 1+1 is a number | _false_ |




[!INCLUDE[footer-include](../../includes/footer-banner.md)]
