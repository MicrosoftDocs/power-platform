---
title: Remove and RemoveIf functions
description: Reference information including syntax and examples for the Remove and RemoveIf functions.
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
no-loc: ["Remove","RemoveIf"]
---

# Remove and RemoveIf functions
[!INCLUDE[function-remove-removeif-applies-to](includes/function-remove-removeif-applies-to.md)]



Removes [records](/power-apps/maker/canvas-apps/working-with-tables#records) from a [data source](/power-apps/maker/canvas-apps/working-with-data-sources).

> [!NOTE]
> [PAC CLI pac power-fx commands](/power-platform/developer/cli/reference/power-fx) do not support the **RemoveIf** function.

## Description

### Remove function

Use the **Remove** function to remove a specific record or records from a data source.

For [collections](/power-apps/maker/canvas-apps/working-with-data-sources#collections), the entire record must match. You can use the **RemoveFlags.All** argument to remove all copies of a record; otherwise, only one copy of the record is removed.

### RemoveIf function

Use the **RemoveIf** function to remove a record or records based on a condition or a set of conditions. Each condition can be any formula that results in a **true** or **false** and can reference [columns](/power-apps/maker/canvas-apps/working-with-tables#columns) of the data source by name. Each condition is evaluated individually for each record, and the record is removed if all conditions evaluate to **true**.

**Remove** and **RemoveIf** return the modified data source as a [table](/power-apps/maker/canvas-apps/working-with-tables). You can use both functions only in [behavior formulas](/power-apps/maker/canvas-apps/working-with-formulas-in-depth).

You can also use the **[Clear](function-clear-collect-clearcollect.md)** function to remove all of the records in a collection.

### Delegation

RemoveIf is supported by only a few data sources. For data sources that don't upport this feature, Power Apps will query the server and retrieve all data matching the filter expression, up to a maximum of either 500 or 2000 records or the data page size. Subsequently, it will delete each of those records individually by making separate calls to the server.

## Syntax

**Remove**( _DataSource_, _Record1_ [, *Record2*, ... ] [, **RemoveFlags.All** ] )

- _DataSource_ – Required. The data source that contains the record or records that you want to remove.
- _Record(s)_ – Required. The record or records to remove.
- **RemoveFlags.All** – Optional. In a collection, the same record may appear more than once. You can add the **RemoveFlags.All** argument to remove all copies of the record.

**Remove**( _DataSource_, _Table_ [, **RemoveFlags.All** ] )

- _DataSource_ – Required. The data source that contains the records that you want to remove.
- _Table_ – Required. A table of records to remove.
- **RemoveFlags.All** – Optional. In a collection, the same record may appear more than once. You can add the **RemoveFlags.All** argument to remove all copies of the record.

**RemoveIf**( _DataSource_, _Condition_ [, ... ] )

- _DataSource_ – Required. The data source that contains the record or records that you want to remove.
- _Condition(s)_ – Required. A formula that evaluates to **true** for the record or records to remove. You can use column names from the _DataSource_ in the formula. If you specify multiple _Conditions_, all must evaluate to **true** for the record or records to be removed.

## Examples - single formulas

In these examples, you'll remove a record or records in a data source that's named **IceCream** and that starts with the data in this table:

![IceCream example.](media/function-remove-removeif/icecream.png)

#### Create a collection with sample records

To create a collection with this data:

1. Insert a [**Button**](/power-apps/maker/canvas-apps/controls/control-button) control.
1. Set button control's **OnSelect** property to the below formula:

   ```power-fx
   ClearCollect( IceCream,
                 { ID: 1, Flavor: "Chocolate",  Quantity: 100 },
                 { ID: 2, Flavor: "Vanilla",    Quantity: 200 },
                 { ID: 3, Flavor: "Strawberry", Quantity: 300 }
   )
   ```

1. Select the button [while holding down the Alt key](/power-apps/maker/canvas-apps/keyboard-shortcuts#alternate-behavior):

#### Remove sample records from collection using a formula

| Formula                                                                                                                                                                            | Description                                                                                           | Result                                                                                                                                                      |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Remove(&nbsp;IceCream,<br>LookUp(&nbsp;IceCream,&nbsp;Flavor="Chocolate"&nbsp;))**                                                                           | Removes the **Chocolate** record from the data source.                                                | ![Result with Vanilla and Strawberry.](media/function-remove-removeif/icecream-no-chocolate.png)<br><br>The **IceCream** data source has been modified.     |
| **Remove(&nbsp;IceCream,<br>LookUp(&nbsp;IceCream,&nbsp;Flavor="Chocolate"&nbsp;), LookUp(&nbsp;IceCream,&nbsp;Flavor="Strawberry"&nbsp;) )** | Removes two records from the data source.                                                             | ![Result with only Vanilla.](media/function-remove-removeif/icecream-only-vanilla.png)<br><br>The **IceCream** data source has been modified.               |
| **RemoveIf(&nbsp;IceCream, Quantity&nbsp;>&nbsp;150 )**                                                                                                                            | Removes records that have a **Quantity** that's greater than **150**.                                 | ![Result with only Chocolate.](media/function-remove-removeif/icecream-only-chocolate.png)<br><br>The **IceCream** data source has been modified.           |
| **RemoveIf(&nbsp;IceCream, Quantity&nbsp;>&nbsp;150, Left(&nbsp;Flavor,&nbsp;1&nbsp;) = "S" )**                                                                                    | Removes records that have a **Quantity** that's greater than 150 and **Flavor** starts with an **S**. | ![Result with Chocolate and Vanilla.](media/function-remove-removeif/icecream-no-strawberry.png)<br><br><br>The **IceCream** data source has been modified. |
| **RemoveIf(&nbsp;IceCream, true )**                                                                                                                                                | Removes all records from the data source.                                                             | ![Result with no IceCream.](media/function-remove-removeif/icecream-empty.png)<br><br>The **IceCream** data source has been modified.                       |

## Examples - remove button outside a gallery

In this example, you'll use a [**Gallery** control](/power-apps/maker/canvas-apps/controls/control-gallery) to list the records in a table. And then use the **Remove** function to selectively remove an item.

### Prepare for sample data

This example uses the **Contacts** table in Microsoft Dataverse available with the _sample apps and data_. You can deploy _sample apps and data_ when you [create an environment](/power-platform/admin/create-environment#create-an-environment-with-a-database). You can also use any other data source instead.

### Remove button outside a gallery

In this example, you'll remove an item by using a _button_ that is outside the gallery.

1. Create a [new blank canvas app](/power-apps/maker/canvas-apps/data-platform-create-app-scratch) using a Phone layout.

   ![A blank canvas app using the phone layout.](media/function-remove-removeif/gallery-new.png)

1. Select the **Insert** from the left pane.

1. Select **Vertical gallery**. <br>
   A **Gallery** control is be added to your screen.

   ![Using the Insert tool pane to add a vertical gallery control.](media/function-remove-removeif/gallery-add.png)

1. You're prompted to select a data source where you can select a data source from the available data sources. <br>
   For example, select the **Contacts** table to use _sample data_:

   ![Selecting the Contacts table to display in the gallery.](media/function-remove-removeif/gallery-datasource.png)

   The gallery shows items from this table:

   ![Gallery added showing the Contacts table.](media/function-remove-removeif/gallery-data.png)

1. Insert a [**Button**](/power-apps/maker/canvas-apps/controls/control-button) control from left pane:

   ![Using the Insert tool pane to add a button control.](media/function-remove-removeif/gallery-addbutton.png)

1. Move the added button below the gallery items:

   ![Move button.](media/function-remove-removeif/move-button-down.png)

1. Update button text property to _Remove record_. You can also use text of your choice:

   ![Rename button.](media/function-remove-removeif/button-text.png)

1. Set the **OnSelect** property for this button control to the following formula:

   ```power-fx
   Remove( Contacts, Gallery1.Selected )
   ```

   ![Setting the OnSelect property of the button control.](media/function-remove-removeif/gallery-button-onselect.png)

   The gallery control makes the currently selected record available using **Selected** property. **Remove** function refers to this selected record to remove it.

1. Preview the app using the _Play_ button on the top right, or press _F5_ on keyboard:

   ![Preview app.](media/function-remove-removeif/preview-app.png)

1. Select a record to remove, such as _Nancy_'s record in this example:

   ![Select a record.](media/function-remove-removeif/select-nancy-record.png)

1. Select **Remove record**:

   ![Gallery of contacts, now without the Nancy record that has been removed.](media/function-remove-removeif/gallery-activatebutton.png)

   Selecting the button removes the selected record (in this example, Nancy's record).

1. Close the app preview.

   > [!TIP]
   > You can also use alternate behavior with [_Alt key_](/power-apps/maker/canvas-apps/keyboard-shortcuts#alternate-behavior) instead of using the app preview with _Play_ button or _F5_.

## Examples - trash can icon inside a gallery

In this example, you'll remove an item by using an _icon_ placed inside the gallery.

### Create a collection with sample data

If you already have [prepared sample data](#prepare-for-sample-data), skip this step and move to [Trash can icon inside a gallery](#trash-can-icon-inside-a-gallery).

1. Add a [**Button**](/power-apps/maker/canvas-apps/controls/control-button) control to your screen.
1. Set the **OnSelect** property to the following formula:

   ```power-fx
   ClearCollect( SampleContacts,
         { 'Full Name': "Yvonne McKay (sample)",      'Primary Email': "someone_a@example.com" },
         { 'Full Name': "Susanna Stubberod (sample)", 'Primary Email': "someone_b@example.com" },
         { 'Full Name': "Nancy Anderson (sample)",    'Primary Email': "someone_c@example.com" },
         { 'Full Name': "Maria Campbell (sample)",    'Primary Email': "someone_d@example.com" },
         { 'Full Name': "Robert Lyon (sample)",       'Primary Email': "someone_e@example.com" },
         { 'Full Name': "Paul Cannon (sample)",       'Primary Email': "someone_f@example.com" },
         { 'Full Name': "Rene Valdes (sample)",       'Primary Email': "someone_g@example.com" }
   )
   ```

1. Select the button [while holding down the Alt key](/power-apps/maker/canvas-apps/keyboard-shortcuts#alternate-behavior).

Sample collection is created that you can use in the following example.

### Trash can icon inside a gallery

1. Create a [new blank canvas app](/power-apps/maker/canvas-apps/data-platform-create-app-scratch) using a Phone layout.

   ![A blank canvas app using the phone layout.](media/function-remove-removeif/gallery-new.png)

1. Select the **Insert** from the left pane.

1. Select **Vertical gallery**. <br>
   A **Gallery** control is be added to your screen.

   ![Using the Insert tool pane to add a vertical gallery control.](media/function-remove-removeif/gallery-add.png)

1. You're prompted to select a data source where you can select a data source from the available data sources. <br>
   For example, select the **Contacts** table to use _sample data_:

   ![Selecting the Contacts table to display in the gallery.](media/function-remove-removeif/gallery-datasource.png)

   If you created a [collection](#create-a-collection-with-sample-data), select your collection instead:

   ![Sample contacts collection.](media/function-remove-removeif/sample-contacts.png)

1. Select a control within the top item in the gallery. <br>

   To ensure next step inserts item into gallery's template and not outside the gallery, ensure you follow this step before moving to the next step.

   ![Select top record in a gallery.](media/function-remove-removeif/gallery-select-template.png)

1. Select **Add icon** from left pane. <br>

   ![Using the Insert tool pane to add an icon control.](media/function-remove-removeif/gallery-addicon.png)

    > [!NOTE] 
    > **Add icon** inserts a **+** icon on the left side of the gallery, replicated for each item in the gallery.

1. In the top item, move the icon to the right side of the screen.

   ![Move icon.](media/function-remove-removeif/move-icon.png)

1. Select the **Icon** property for icon and set it to the following formula to update the icon image as trash icon:

   ```power-fx
   Icon.Trash
   ```

   > [!NOTE]
   > The **Icon.** prefix is only shown when you're actively editing the formula.

   ![Changing the icon to the trash can icon.](media/function-remove-removeif/gallery-icontrash.png)

1. Set the **OnSelect** property to the following formula:

   ```power-fx
   Remove( [@Contacts], ThisItem )
   ```

   > [!NOTE]
   > You must use [global disambiguation operator](operators.md#disambiguation-operator) **[@**...**]** in this example with sample data that uses the _Contacts_ table to avoid conflict with a _One-to-Many_ relationship. If you use data sources such as a list or a SQL Server table, using _global disambiguation operator_ is not required.

   ![OnSelect for trash icon.](media/function-remove-removeif/gallery-onselect.png)

1. Preview the app using the _Play_ button on the top right, or press _F5_ on keyboard.

1. Select the trash icon next to a record, for example _Maria_'s:

   ![Gallery with one of the contacts removed.](media/function-remove-removeif/gallery-activateicon.png)

   The record is deleted:

   ![Deleted record.](media/function-remove-removeif/deleted-record.png)

1. Close the app preview.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]







































































































































