---
title: AddColumns, DropColumns, RenameColumns, and ShowColumns functions
description: Reference information including syntax and examples for the AddColumns, DropColumns, RenameColumns, and ShowColumns functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 4/11/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# AddColumns, DropColumns, RenameColumns, and ShowColumns functions
[!INCLUDE[function-table-shaping-applies-to](includes/function-table-shaping-applies-to.md)]



Shapes a [table](/power-apps/maker/canvas-apps/working-with-tables) by adding, dropping, renaming, and selecting its [columns](/power-apps/maker/canvas-apps/working-with-tables#columns).

The [ForAll](function-forall.md) function can also be used to shape a table, by returning a table of new records created from existing columns.

## Overview

These functions shape a table by adjusting its columns:

- Reduce a table that contains multiple columns down to a single column for use with single-column functions, such as **[Lower](function-lower-upper-proper.md)** or **[Sqrt](function-numericals.md)**.
- Add a calculated column to a table (for example, a **Total Price** column that shows the results of multiplying **Quantity** by **Unit Price**).
- Rename a column to something more meaningful, for display to users or for use in formulas.

A table is a value in Power Apps, just like a string or a number. You can specify a table as an argument in a formula, and functions can return a table as a result.

> [!NOTE]
> The functions that this topic describes don't modify the original table. Instead, they take that table as an argument and return a new table with a transform applied. For more information, see [working with tables](/power-apps/maker/canvas-apps/working-with-tables).

You can't modify the columns of a [data source](/power-apps/maker/canvas-apps/working-with-data-sources) by using these functions. You must modify the data at its source. You can add columns to a [collection](/power-apps/maker/canvas-apps/working-with-data-sources#collections) with the **[Collect](function-clear-collect-clearcollect.md)** function. For more information, see [working with data sources](/power-apps/maker/canvas-apps/working-with-data-sources).

## Description

The **AddColumns** function adds a column to a table, and a formula defines the values in that column. Existing columns remain unmodified.

The formula is evaluated for each record of the table.
[!INCLUDE [record-scope](../../includes/record-scope.md)]

The **DropColumns** function excludes columns from a table. All other columns remain unmodified. **DropColumns** excludes columns, and **ShowColumns** includes columns.

Use the **RenameColumns** function to rename one or more columns of a table by providing at least one argument pair that specifies the name of a column that the table contains (the old name, which you want to replace) and the name of a column that the table doesn't contain (the new name, which you want to use). The old name must already exist in the table, and the new name must not exist. Each column name might appear only once in the argument list as either an old column name or a new column name. To rename a column to an existing column name, first drop the existing column with **DropColumns**, or rename the existing column out of the way by nesting one **RenameColumns** function within another.

The **ShowColumns** function includes columns of a table and drops all other columns. You can use **ShowColumns** to create a single-column table from a multi-column table. **ShowColumns** includes columns, and **DropColumns** excludes columns.

For all these functions, the result is a new table with the transform applied. The original table isn't modified. You can't modify an existing table with a formula. SharePoint, Microsoft Dataverse, SQL Server, and other data sources provide tools for modifying the columns of lists, tables, and tables, which are often referred to as the schema. The functions in this article only transform an input table, without modifying the original, into an output table for further use.

The arguments to these functions support delegation. For example, a **Filter** function used as an argument to pull in related records searches through all listings, even if the **'[dbo].[AllListings]'** data source contains a million rows:

```power-fx
AddColumns( RealEstateAgents,
   Listings,
   Filter(  '[dbo].[AllListings]', ListingAgentName = AgentName )
)
```

However, the output of these functions is subject to the [non-delegation record limit](/power-apps/maker/canvas-apps/delegation-overview#non-delegable-limits). In this example, only 500 records are returned even if the **RealEstateAgents** data source has 501 or more records.

If you use **AddColumns** in this manner, **Filter** must make separate calls to the data source for each of those first records in **RealEstateAgents**, which causes lots of network chatter. If **[dbo](.[AllListings]** is small enough and doesn't change often. You can call the **Collect** function in [**OnStart**](signals.md#app) to cache the data source in your app when it starts. As an alternative, you could restructure your app so that you pull in the related records only when the user asks for them.

> [!NOTE]
> In Power Apps prior to version 3.24042, column names were specified with a text string using double quotes, and if connected to a data source they also needed to be logical names. For example, the logical name **"cr43e_name"** with double quotes was used instead of the display name **Name** without quotes. For SharePoint and Excel data sources that contain column names with spaces, each space was specified with **"\_x0020\_"**, for example **"Column Name"** as **"Column_x0020_Name"**. After this version, all apps were automatically updated to the new syntax described in this article. 

## Syntax

**AddColumns**( _Table_, _ColumnName1_, _Formula1_ [, *ColumnName2*, *Formula2*, ... ] )

- _Table_ - Required. Table to operate on.
- _ColumnName(s)_ - Required. Names of the columns to add. 
- _Formula(s)_ - Required. Formulas to evaluate for each record. The result is added as the value of the corresponding new column. You can reference other columns of the table in this formula.

**DropColumns**( _Table_, _ColumnName1_ [, *ColumnName2*, ... ] )

- _Table_ - Required. Table to operate on.
- _ColumnName(s)_ - Required. Names of the columns to drop. 

**RenameColumns**( _Table_, _OldColumnName1_, _NewColumnName1_ [, *OldColumnName2*, *NewColumnName2*, ... ] )

- _Table_ - Required. Table to operate on.
- _OldColumnName(s)_ - Required. Names of the columns to rename from the original table. This element appears first in the argument pair (or first in each argument pair if the formula includes more than one pair).
- _NewColumnName(s)_ - Required. Replacement names. This element appears last in the argument pair (or last in each argument pair if the formula includes more than one pair). 

**ShowColumns**( _Table_, _ColumnName1_ [, *ColumnName2*, ... ] )

- _Table_ - Required. Table to operate on.
- _ColumnName(s)_ - Required. Names of the columns to include. 

## Examples

The examples in this section use the **IceCreamSales** data source, which contains the data in this table:

![IceCream example.](media/function-table-shaping/icecream.png)

None of these examples modify the **IceCreamSales** data source. Each function transforms the value of the data source as a table and returns that value as the result.

| Formula                                                                                                                                                | Description                                                                                                                                                                                                                                                                                                                                                                                 | Result                                                                                                                               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| **AddColumns( IceCreamSales, Revenue, UnitPrice \* QuantitySold )**                                                                                  | Adds a **Revenue** column to the result. For each record, **UnitPrice \* QuantitySold** is evaluated, and the result is placed in the new column.                                                                                                                                                                                                                                           | ![Result with Srawberry, Chocolate and Vanilla.](media/function-table-shaping/icecream-add-revenue.png)                              |
| **DropColumns( IceCreamSales, UnitPrice )**                                                                                                          | Excludes the **UnitPrice** column from the result. Use this function to exclude columns, and use **ShowColumns** to include them.                                                                                                                                                                                                                                                           | ![Result with Strawberry, Chocolate, Vanilla having only QuantitySold column.](media/function-table-shaping/icecream-drop-price.png) |
| **ShowColumns( IceCreamSales, Flavor )**                                                                                                             | Includes only the **Flavor** column in the result. Use this function include columns, and use **DropColumns** to exclude them.                                                                                                                                                                                                                                                              | ![Only Flavor column.](media/function-table-shaping/icecream-select-flavor.png)                                                      |
| **RenameColumns( IceCreamSales, UnitPrice, Price)**                                                                                                | Renames the **UnitPrice** column in the result.                                                                                                                                                                                                                                                                                                                                             | ![Result with Flavor, Price and Revenue.](media/function-table-shaping/icecream-rename-price.png)                                    |
| **RenameColumns( IceCreamSales, UnitPrice, Price, QuantitySold, Number)**                                                                      | Renames the **UnitPrice** and **QuantitySold** columns in the result.                                                                                                                                                                                                                                                                                                                       | ![Result with 3 IceCreams and columns as Flavor, Price, Revenue.](media/function-table-shaping/icecream-rename-price-quant.png)      |
| **DropColumns(<br>RenameColumns(<br>AddColumns( IceCreamSales, Revenue,<br>UnitPrice \* QuantitySold ),<br>UnitPrice, Price ),<br>Quantity )** | Performs the following table transforms in order, starting from the inside of the formula: <ol><li>Adds a **Revenue** column based on the per record calculation of **UnitPrice \* Quantity**.<li>Renames **UnitPrice** to **Price**.<li>Excludes the **Quantity** column.</ol> Order is important, for example we can't calculate with **UnitPrice** after it's renamed. | ![IceCream example for unit price.](media/function-table-shaping/icecream-all-transforms.png)                                        |

### Step by step

Let's try some of the examples from earlier in this article.

1. Create a collection by adding a **[Button](/power-apps/maker/canvas-apps/controls/control-button)** control and setting its **OnSelect** property to this formula:

   ```power-fx
   ClearCollect( IceCreamSales,
      Table(
          { Flavor: "Strawberry", UnitPrice: 1.99, QuantitySold: 20 },
          { Flavor: "Chocolate", UnitPrice: 2.99, QuantitySold: 45 },
          { Flavor: "Vanilla", UnitPrice: 1.50, QuantitySold: 35 }
      )
   )
   ```

1. Run the formula by selecting the button while holding down the Alt key.

1. Add a second **Button** control, set its **OnSelect** property to this formula, and then run it:

   ```power-fx
   ClearCollect( FirstExample,
      AddColumns( IceCreamSales, Revenue, UnitPrice * QuantitySold )
   )
   ```

1. On the **File** menu, select **Collections**, and then select **IceCreamSales** to show that collection.

   As this graphic shows, the second formula didn't modify this collection. The **AddColumns** function used **IceCreamSales** as a read-only argument; the function didn't modify the table to which that argument refers.

   ![Collection viewer showing three records of the Ice Cream Sales collection that doesn't include a Revenue column.](media/function-table-shaping/ice-cream-sales-collection.png)

1. Select **FirstExample**.

   As this graphic shows, the second formula returned a new table with the added column. The **ClearCollect** function captured the new table in the **FirstExample** collection, adding something to the original table as it flowed through the function without modifying the source:

   ![Collection viewer showing three records of the First Example collection that includes a new Revenue column.](media/function-table-shaping/first-example-collection.png)

### Map columns in a component

See [Map columns](/power-apps/maker/canvas-apps/map-component-input-fields#map-columns).

[!INCLUDE[footer-include](../../includes/footer-banner.md)]






































































































































