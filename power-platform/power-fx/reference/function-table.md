---
title: Table function
description: Reference information including syntax and examples for the Table function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur tapanm
ms.date: 03/27/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# Table function
[!INCLUDE[function-table-applies-to](includes/function-table-applies-to.md)]



Creates a temporary [table](/power-apps/maker/canvas-apps/working-with-tables).

## Description

The **Table** function creates a table from an argument list of [records](/power-apps/maker/canvas-apps/working-with-tables#records) or tables.

The result table's [columns](/power-apps/maker/canvas-apps/working-with-tables#columns) are the union of all the columns from all the argument records and tables. A _blank_ value is added to any column for which a record doesn't include a value.

A table is a value in Power Apps, just like a string or a number. You can specify a table as an argument for a function, and functions can return a table as a result. **Table** doesn't create a permanent table. Instead it returns a temporary table made of its arguments. You can specify this temporary table as an argument for another function, visualize it in a gallery, or embed it in another table. Fore more information, see [working with tables](/power-apps/maker/canvas-apps/working-with-tables).

You can also create a single-column table with the **[ value1, value2, ... ]** syntax.

## Syntax

**Table**( _RecordOrTable1_ [, *RecordOrTable2*, ... ] )

- _RecordOrTable(s)_ - Required. The records or table to add to the result table. If a table is provided, the records of the table are added to the resulting table as if they had been individually added.

**Table**( _Untyped_ )

- _Untyped_ - Required. [**Untyped object**](../untyped-object.md) that represents a table or array. Acceptable values are dependent on the untyped provider. For [**JSON**](function-parsejson.md), the untyped object is expected to be a JSON array. Regardless of the content type of the Untyped array, the resulting table is a single-column table of Untyped objects.

## Examples

- Set the **[Items](/power-apps/maker/canvas-apps/controls/properties-core)** property of a listbox to this formula:
  ```power-fx
  Table( {Color: "red"}, {Color: "green"}, {Color: "blue" } )
  ```

  The listbox shows each color as an option.

- Add a text gallery, and set its **[Items](/power-apps/maker/canvas-apps/controls/properties-core)** property to this function:<br>
  ```power-fx
  Table( {Item: "Violin123", Location:"France", Owner:"Fabrikam"}, {Item:"Violin456", Location:"Chile"} )
  ```

  The gallery shows two records, both of which contain the name and location of an item. Only one record contains the name of the owner.

- This formula combines standard sizes with extended sizes into a single table
  ```power-fx
  Table( { Value: "XS" }, [ "S", "M", "L" ], { Value: "XL" } )
  ```

[!INCLUDE[footer-include](../../includes/footer-banner.md)]






































































































































