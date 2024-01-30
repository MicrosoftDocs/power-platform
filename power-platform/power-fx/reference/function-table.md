---
title: Table function
description: Reference information including syntax and examples for the Table function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur tapanm
ms.date: 12/18/2023
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# Table function

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Desktop flows :::image type="icon" source="media/yes-icon.svg" border="false"::: Model-driven apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Power Platform CLI

Creates a temporary [table](/power-apps/maker/canvas-apps/working-with-tables).

## Description

The **Table** function creates a table from an argument list of [records](/power-apps/maker/canvas-apps/working-with-tables#records).

The table's [columns](/power-apps/maker/canvas-apps/working-with-tables#columns) will be the union of all the properties from all the argument records. A _blank_ value is added to any column for which a record doesn't include a value.

A table is a value in Power Apps, just like a string or a number. You can specify a table as an argument for a function, and functions can return a table as a result. **Table** doesn't create a permanent table. Instead it returns a temporary table made of its arguments. You can specify this temporary table as an argument for another function, visualize it in a gallery, or embed it in another table. See [working with tables](/power-apps/maker/canvas-apps/working-with-tables) for more details.

You can also create a single-column table with the **[ value1, value2, ... ]** syntax.

## Syntax

**Table**( _Record1_ [, *Record2*, ... ] )

- _Record(s)_ - Required. The records to add to the table.

**Table**( _Untyped_ )

- _Untyped_ - Required. [**Untyped object**](../untyped-object.md) that represents a table or array. Acceptable values are dependent on the untyped provider.  For [**JSON**](function-parsejson.md), the untyped object is expected to be a JSON array. Note that regardless of the content type of the Untyped array, the resulting table will be a single-column table of Untyped objects.

## Examples

- Set the **[Items](/power-apps/maker/canvas-apps/controls/properties-core)** property of a listbox to this formula:
  <br>**Table({Color:"red"}, {Color:"green"}, {Color:"blue"})**

  The listbox shows each color as an option.

- Add a text gallery, and set its **[Items](/power-apps/maker/canvas-apps/controls/properties-core)** property to this function:<br>
  **Table({Item:"Violin123", Location:"France", Owner:"Fabrikam"}, {Item:"Violin456", Location:"Chile"})**

  The gallery shows two records, both of which contain the name and location of an item. Only one record contains the name of the owner.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
