---
title: Shuffle function in Power Apps
description: Reference information including syntax and examples for the Shuffle function in Power Apps.
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

# Shuffle function in Power Apps

Randomly reorders the [records](/power-apps/maker/canvas-apps/working-with-tables#records) of a [table](/power-apps/maker/canvas-apps/working-with-tables).

## Description

The **Shuffle** function reorders the records of a table.

**Shuffle** returns a table that has the same [columns](/power-apps/maker/canvas-apps/working-with-tables#columns) and number of rows as the argument.

## Syntax

**Shuffle**( _Table_ )

- _Table_ - Required. Table to shuffle.

## Example

If you stored details about playing cards in a [collection](/power-apps/maker/canvas-apps/working-with-data-sources#collections) named **Deck**, this formula would return a copy of that collection that has been randomly shuffled.

**Shuffle(Deck)**

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
