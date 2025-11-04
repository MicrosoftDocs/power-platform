---
title: Sort and SortByColumns functions
description: Reference information including syntax and examples for the Sort and SortByColumns functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 6/10/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
no-loc: ["Sort","SortByColumns"]
---

# Sort and SortByColumns functions
[!INCLUDE[function-sort-applies-to](includes/function-sort-applies-to.md)]



Sorts a [table](/power-apps/maker/canvas-apps/working-with-tables).

> [!NOTE]
> [PAC CLI pac power-fx commands](/power-platform/developer/cli/reference/power-fx) do not support the **SortByColumns** function.

## Description

The **Sort** function sorts a table based on a formula.

The formula is evaluated for each [record](/power-apps/maker/canvas-apps/working-with-tables#records) of the table, and the results are used to sort the table. The formula must result in a number, a string, or a Boolean value; it can't result in a table or a record.

[!INCLUDE [record-scope](../../includes/record-scope.md)]

To sort first by one column and then by another, you embed a **Sort** formula within another. For example, you can use this formula to sort a **Contacts** table first by a **LastName** column and then by a **FirstName** column: **Sort( Sort( Contacts, LastName ), FirstName )**

The **SortByColumns** function can also be used to sort a table based on one or more columns.

The parameter list for **SortByColumns** provides the names of the columns to sort by and the sort direction per column. Sorting is performed in the order of the parameters (sorted first by the first column, then the second, and so on). Column names are specified as strings, requiring double quotes if directly included in the parameter list. For example, **SortByColumns( CustomerTable, "LastName" )**.

You can combine **SortByColumns** with a **[Drop down](/power-apps/maker/canvas-apps/controls/control-drop-down)** or **[List box](/power-apps/maker/canvas-apps/controls/control-list-box)** control to enable users to select which column to sort by.

In addition to sorting ascending or descending, **SortByColumns** can sort based on a single column table of values. For example, you can sort record based on the name of a day of the week by supplying **[ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" ]** as the sort order. All records which have **Monday"** will come first, followed by **Tuesday**, and so on. Records found that do not appear in the sort table are put at the end of the list.

[Tables](/power-apps/maker/canvas-apps/working-with-tables) are a value in Power Apps, just like a string or number. They can be passed to and returned from functions. **Sort** and **SortByColumn** don't modify a table; instead they take a table as an argument and return a new table that has been sorted. See [working with tables](/power-apps/maker/canvas-apps/working-with-tables) for more details.

[!INCLUDE [delegation](../../includes/delegation.md)]

## Syntax

**Sort**( _Table_, _Formula_ [, *SortOrder* ] )

- _Table_ - Required. Table to sort.
- _Formula_ - Required. This formula is evaluated for each record of the table, and the results are used to sort the table. You can reference columns within the table.
- _SortOrder_ - Optional. Specify **SortOrder.Descending** to sort the table in descending order. **SortOrder.Ascending** is the default value.

**SortByColumns**( _Table_, _ColumnName1_ [, *SortOrder1*, *ColumnName2*, *SortOrder2*, ... ] )

- _Table_ - Required. Table to sort.
- _ColumnName(s)_ - Required. The column names to sort on, as strings.
- _SortOrder(s)_ - Optional. **SortOrder.Ascending** or **SortOrder.Descending**. **SortOrder.Ascending** is the default. If multiple _ColumnNames_ are supplied, all but the last column must include a _SortOrder_.

  > [!NOTE]
  > For SharePoint and Excel data sources that contain column names with spaces, specify each space as **"\_x0020\_"**. For example, specify **"Column Name"** as **"Column_x0020_Name"**.

**SortByColumns**( _Table_, _ColumnName_, _SortOrderTable_ )

- _Table_ - Required. Table to sort.
- _ColumnName_ - Required. The column name to sort on, as strings.
- _SortOrderTable_ - Required. Single column table of values to sort by.

  > [!NOTE]
  > For SharePoint and Excel data sources that contain column names with spaces, specify each space as **"\_x0020\_"**. For example, specify **"Column Name"** as **"Column_x0020_Name"**.

## Examples

For the following examples, we'll use the **IceCream** [data source](/power-apps/maker/canvas-apps/working-with-data-sources), which contains the data in this table:

![IceCream example.](media/function-sort/icecream.png)

| Formula                                                                                                                           | Description                                                                                                                                                                                                                                                                                                                                                                            | Result                                                                                          |
| --------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------- |
| **Sort( IceCream, Flavor )**<br><br>**SortByColumns( IceCream, "Flavor" )**                                                       | Sorts **IceCream** by its **Flavor** column. The **Flavor** column contains strings, so the table is sorted alphabetically. By default, the sort order is ascending.                                                                                                                                                                                                                   | ![Alphabetically sorted.](media/function-sort/icecream-flavor.png)                              |
| **Sort( IceCream, Quantity )**<br><br>**SortByColumns( IceCream, "Quantity" )**                                                   | Sorts **IceCream** by its **Quantity** column. The **Quantity** column contains numbers, so the table is sorted numerically. By default, the sort order is ascending.                                                                                                                                                                                                                  | ![Sorted numerically.](media/function-sort/icecream-quantity-asc.png)                           |
| **Sort( IceCream, Quantity, SortOrder.Descending )**<br><br>**SortByColumns( IceCream, "Quantity", SortOrder.Descending )**       | Sorts **IceCream** by its **Quantity** column. The **Quantity** column contains numbers, so the sort is done numerically. The sort order has been specified as descending.                                                                                                                                                                                                             | ![Sorted numerically and descending.](media/function-sort/icecream-quantity-desc.png)           |
| **Sort( IceCream, Quantity + OnOrder )**                                                                                          | Sorts **IceCream** by the sum of its **Quantity** and **OnOrder** columns for each record individually. The sum is a number, so the table is sorted numerically. By default, the sort order is ascending. Since we are sorting by a formula and not by raw column values, there is no equivalent using **SortByColumns**.                                                              | ![Sorted numerically and ascending.](media/function-sort/icecream-total.png)                    |
| **Sort( Sort( IceCream, OnOrder ), Quantity )**<br><br>**SortByColumns( IceCream, "OnOrder", SortOrder.Ascending, "Quantity", SortOrder.Ascending )** | Sorts **IceCream** first by its **OnOrder** column, and then by its **Quantity** column. Note that "Pistachio" rose above "Vanilla" in the first sort based on **OnOrder**, and then together they moved to their appropriate place based on **Quantity**.                                                                                                                             | ![Sorted with Pistachio above Vanilla.](media/function-sort/icecream-onorder-quantity.png)      |
| **SortByColumns( IceCream, "Flavor", [&nbsp;"Pistachio",&nbsp;"Strawberry"&nbsp;] )**                                             | Sorts **IceCream** by it's **Flavor** column based on the single column table containing "Pistachio" and "Strawberry". Records which have a **Flavor** of "Pistachio" will appear first in the result, followed by records that contain "Strawberry". For values in the **Flavor** column that are not matched, such as "Vanilla", they will appear after the items that were matched. | ![Sorted with Pistachio above Strawberry.](media/function-sort/icecream-onflavor-sorttable.png) |

### Step by step

To run these examples yourself, create the **IceCream** data source as a [collection](/power-apps/maker/canvas-apps/working-with-data-sources#collections):

1. Add a button, and set its **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:<br>**ClearCollect( IceCream, { Flavor: "Chocolate", Quantity: 100, OnOrder: 150 }, { Flavor: "Vanilla", Quantity: 200, OnOrder: 20 }, { Flavor: "Strawberry", Quantity: 300, OnOrder: 0 }, { Flavor: "Mint Chocolate", Quantity: 60, OnOrder: 100 }, { Flavor: "Pistachio", Quantity: 200, OnOrder: 10 } )**
2. Preview the app, select the button, and then press Esc to return to the default workspace.
3. Select **Collections** on the **File** menu to display the collection that you just created, and then press Esc to return to the default workspace.

#### Sort

1. Add another button, and set its **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:<br>
   **ClearCollect( SortByFlavor, Sort( IceCream, Flavor ) )**

   The previous formula creates a second collection, named **SortByFlavor**, that contains the same data as **Ice Cream**. However, the new collection contains the data sorted alphabetically by the **Flavor** column in ascending order.

2. Press F5, select the new button, and then press Esc.
3. Select **Collections** on the **File** menu to display both collections, and then press Esc to return to the default workspace.
4. Repeat the last three steps, but change the name of the collection that you want to create, and replace the **Sort** formula with a different formula from the table of examples earlier in this section that uses **Sort**.

#### SortByColumns

1. Add another button, and set its **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:<br>
   **ClearCollect( SortByQuantity, SortByColumns( IceCream, "Quantity", SortOrder.Ascending, "Flavor", SortOrder.Descending ) )**

   The previous formula creates a third collection, named **SortByQuantity**, that contains the same data as **Ice Cream**. However, the new collection contains the data sorted numerically by the **Quantity** column in ascending order, and then by the **Flavor** column in descending order.

2. Press F5, select the new button, and then press Esc.
3. Select **Collections** on the **File** menu to display all three collections, and then press Esc to return to the default workspace.
4. Repeat the last three steps, but change the name of the collection that you want to create, and replace the **SortByColumns** formula with a different formula from the table of examples earlier in this section that uses **SortByColumns**.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]







































































































































