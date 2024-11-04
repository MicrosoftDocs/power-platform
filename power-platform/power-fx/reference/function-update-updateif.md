---
title: Update and UpdateIf functions
description: Reference information including syntax and examples for the Update and UpdateIf functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 10/31/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# Update and UpdateIf functions

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps :::image type="icon" source="media/yes-icon.svg" border="false"::: Model-driven apps   

Updates [records](/power-apps/maker/canvas-apps/working-with-tables#records) in a [data source](/power-apps/maker/canvas-apps/working-with-data-sources).

## Description

### Update function

Use the **Update** function to replace an entire record in a data source. In contrast, the **UpdateIf** and the **[Patch](function-patch.md)** functions modify one or more values in a record, leaving the other values alone.

For a [collection](/power-apps/maker/canvas-apps/working-with-data-sources#collections), the entire record must match. Collections allow duplicate records, so multiple records might match. You can use the **RemoveFlags.All** argument to update all copies of a record; otherwise, only one copy of the record is updated.

If the data source generates a column's value automatically, the value of that [column](/power-apps/maker/canvas-apps/working-with-tables#columns) must be reaffirmed.

### UpdateIf function

Use the **UpdateIf** function to modify one or more values in one or more records that match one or more conditions. The condition can be any formula that results in a **true** or **false** and can reference columns of the data source by name. The function evaluates the condition for each record and modifies any record for which the result is **true**.

To specify a modification, use a change record that contains new property values. If you provide this change record inline with curly braces, property formulas can reference properties of the record that's being modified. You can use this behavior to modify records based on a formula.

Similar to **UpdateIf**, you can also use the **[Patch](function-patch.md)** function to change specific columns of a record without affecting other columns.

Both **Update** and **UpdateIf** return the modified data source as a [table](/power-apps/maker/canvas-apps/working-with-tables). You must use either function in a [behavior formula](/power-apps/maker/canvas-apps/working-with-formulas-in-depth).

### Delegation

When used with a data source, these functions cannot be delegated.  Only the first portion of the data source will be retrieved and then the function applied.  This may not represent the complete story.  A warning may appear at authoring time to remind you of this limitation.

#### Delegation support

Only some data sources support UpdateIf. If a data source does not support this feature, Power Apps will now send a query to the server and retrieve all data that matches the filter expression up to the maximum of either 500 or 2000, or the data page size. Then, it will update those records and send each  back to the server to be updated. 

## Syntax

**Update**( _DataSource_, _OldRecord_, _NewRecord_ [, **RemoveFlags.All** ] )

- _DataSource_ – Required. The data source that contains the record that you want to replace.
- _OldRecord_ – Required. The record to replace.
- _NewRecord_ – Required. The replacement record. This isn't a change record. The entire record is replaced, and missing properties will contain _blank_.
- _RemoveFlags.All_ – Optional. In a collection, the same record may appear more than once. Specify the **RemoveFlags.All** argument to update all copies of the record.

**UpdateIf**( _DataSource_, _Condition1_, _ChangeRecord1_ [, *Condition2*, *ChangeRecord2*, ... ] )

- _DataSource_ – Required. The data source that contains the record or records that you want to modify.
- _Condition(s)_ – Required. A formula that evaluates to **true** for the record or records that you want to modify. You can use column names of _DataSource_ in the formula.
- _ChangeRecord(s)_ - Required. For each corresponding condition, a change record of new property values to apply to records of _DataSource_ that satisfy the condition. If you provide the record inline using curly braces, property values of the existing record can be used in the property formulas.

## Examples

In these examples, you'll replace or modify records in a data source that's named **IceCream** and that starts with the data in this table:

![IceCream example.](media/function-update-updateif/icecream.png)

| Formula                                                                                                                                                                                        | Description                                                                                                                                                       | Result                                                                                                                                                       |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **Update(&nbsp;IceCream,<br>First(&nbsp;Filter(&nbsp;IceCream,&nbsp;Flavor="Chocolate"&nbsp;)&nbsp;), {&nbsp;ID:&nbsp;1,&nbsp;Flavor:&nbsp;"Mint&nbsp;Chocolate",&nbsp;Quantity:150&nbsp;} )** | Replaces a record from the data source.                                                                                                                           | ![Replace a record.](media/function-update-updateif/icecream-mint.png)<br><br>The **IceCream** data source has been modified.                                |
| **UpdateIf(&nbsp;IceCream, Quantity > 175, {&nbsp;Quantity:&nbsp;Quantity&nbsp;+&nbsp;10&nbsp;} )**                                                                                            | Modifies records that have a **Quantity** that is greater than **175**. The **Quantity** field is incremented by 10, and no other fields are modified.            | ![Modify records.](media/function-update-updateif/icecream-mint-plus10.png)<br><br>The **IceCream** data source has been modified.                           |
| **Update(&nbsp;IceCream,<br>First(&nbsp;Filter(&nbsp;IceCream, Flavor="Strawberry"&nbsp;)&nbsp;),<br>{&nbsp;ID:&nbsp;3, Flavor:&nbsp;"Strawberry Swirl"} )**                                   | Replaces a record from the data source. The **Quantity** property hasn't been supplied in the replacement record, so that property will be _blank_ in the result. | ![Replace record when quantity not supplied.](media/function-update-updateif/icecream-mint-swirl.png)<br><br>The **IceCream** data source has been modified. |
| **UpdateIf(&nbsp;IceCream, true, {&nbsp;Quantity:&nbsp;0&nbsp;} )**                                                                                                                            | Sets the value of the **Quantity** property for all records in the data source to 0.                                                                              | ![Set quantity for all to 0.](./media/function-update-updateif/icecream-mint-zero.png)<br> <br>The **IceCream** data source has been modified.               |

### Step by step

1. Import or create a collection named **Inventory**, and show it in a gallery as [Show data in a gallery](/power-apps/maker/canvas-apps/show-images-text-gallery-sort-filter) describes.
2. Name the gallery **ProductGallery**.
3. Add a slider named **UnitsSold**, and set its **Max** property to this expression:<br>**ProductGallery.Selected.UnitsInStock**
4. Add a button, and set its **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:<br>**UpdateIf(Inventory, ProductName = ProductGallery.Selected.ProductName, {UnitsInStock:UnitsInStock-UnitsSold.Value})**
5. Press F5, select a product in the gallery, specify a value with the slider, and then select the button.

   The number of units in stock for the product you specified decreases by the amount that you specified.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
