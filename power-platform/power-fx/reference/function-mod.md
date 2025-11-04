---
title: Mod function
description: Reference information including syntax and examples for the Mod function.
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
no-loc: ["Mod"]
---

# Mod function
[!INCLUDE[function-mod-applies-to](includes/function-mod-applies-to.md)]



Returns the remainder of a division.

## Description

The **Mod** function returns the remainder after a number is divided by a divisor.

The result has the same sign as the divisor.

## Syntax

**Mod**( _Number_, _Divisor_ )

- _Number_ - Required. Number to divide.
- _Divisor_ - Required. Number to divide by.

## Examples

| Formula | Description | Result |
| --- | --- | --- |
| **Mod(25, 4)** | The number that remains after dividing 25 by 4 | 1 |
| **Mod(25, -4)** | The number that remains after dividing 25 by -4 | -3 |
| **Mod(-25, -4)** | The number that remains after dividing -25 by -4 | -1 |
| **Mod(-25, 4)** | The number that remains after dividing -25 by 4 | 3 |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































