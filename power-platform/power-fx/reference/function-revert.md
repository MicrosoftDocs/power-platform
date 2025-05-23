﻿---
title: Revert function
description: Reference information including syntax and examples for the Revert function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 3/22/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# Revert function
[!INCLUDE[function-revert-applies-to](includes/function-revert-applies-to.md)]



Refreshes and clears errors for the [records](/power-apps/maker/canvas-apps/working-with-tables#records) of a [data source](/power-apps/maker/canvas-apps/working-with-data-sources).

## Description

The **Revert** function refreshes an entire data source or a single record in that data source. You'll see changes that other users made.

For the records reverted, **Revert** also clears any errors from the [table](/power-apps/maker/canvas-apps/working-with-tables) that the **[Errors](function-errors.md)** function returned.

If the **[Errors](function-errors.md)** function reports a conflict after a **[Patch](function-patch.md)** or other data operation, **Revert** the record to start with the conflicting version and reapply the change.

**Revert** has no return value. You can use it only in a [behavior formula](/power-apps/maker/canvas-apps/working-with-formulas-in-depth).

## Syntax

**Revert**( _DataSource_ [, *Record* ] )

- _DataSource_ – Required. The data source that you want to revert.
- _Record_ - Optional. The record that you want to revert. If you don't specify a record, the entire data source is reverted.

## Example

In this example, you'll revert the data source named **IceCream**, which starts with the data in this table:

![IceCream example.](media/function-revert/icecream.png)

A user on another device changes the **Quantity** property of the **Strawberry** record to **400**. At about the same time, you change the same property of the same record to **500**, not knowing about the other change.

You use the **[Patch](function-patch.md)** function to update the record:<br>
**Patch( IceCream, LookUp( IceCream, Flavor = "Strawberry" ), { Quantity: 500 } )**

You check the **[Errors](function-errors.md)** table and find an error:

| Record                                             | [Column](/power-apps/maker/canvas-apps/working-with-tables#columns) | Message                                                                                                              | Error                  |
| -------------------------------------------------- | ------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | ---------------------- |
| **{ ID: 1, Flavor: "Strawberry", Quantity: 300 }** | _blank_                                                             | **"The record you are trying to modify has been modified by another user. Please revert the record and try again."** | **ErrorKind.Conflict** |

Based on the **Error** column, you have a **Reload** button for which the **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property to set to this formula:<br>
**Revert( IceCream, LookUp( IceCream, Flavor = "Strawberry" ) )**

After you select the **Reload** button, the **[Errors](function-errors.md)** table is [empty](function-isblank-isempty.md), and the new value for **Strawberry** has been loaded:

![New value for Strawberry ice cream.](media/function-revert/icecream-after.png)

You reapply your change on top of the previous change, and your change succeed because the conflict has been resolved.

![Reapplied changes with resolved conflict.](media/function-revert/icecream-success.png)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]







































































































































