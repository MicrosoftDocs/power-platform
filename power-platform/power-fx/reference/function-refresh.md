---
title: Refresh function
description: Reference information including syntax and examples for the Refresh function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 10/21/2015
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# Refresh function

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Model-driven apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Power Platform CLI

Refreshes the [records](/power-apps/maker/canvas-apps/working-with-tables#records) of a [data source](/power-apps/maker/canvas-apps/working-with-data-sources).

## Description

The **Refresh** function retrieves a fresh copy of a data source. You'll see changes that other users made.

**Refresh** has no return value, and you can use it only in [behavior formulas](/power-apps/maker/canvas-apps/working-with-formulas-in-depth).

## Syntax

**Refresh**( _DataSource_ )

- _DataSource_ – Required. The data source that you want to refresh.

## Example

In this example, you'll refresh the data source named **IceCream**, which starts with this data:

![IceCream example.](media/function-refresh/icecream.png)

A user on another device changes the **Quantity** in the **Strawberry** record to **400**. You won't see this change until this formula executes:

**Refresh( IceCream )**

After that formula executes, galleries that are bound to the **IceCream** data source will show the updated value for **Strawberry**:

![IceCream after refresh.](media/function-refresh/icecream-after.png)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
