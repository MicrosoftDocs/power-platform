---
title: Patch function
description: Reference information including syntax and examples for the Patch function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 05/04/2026
ms.subservice: power-fx
ms.collection:
  - ai-assisted
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
no-loc: ["Patch"]
---

# Patch function
[!INCLUDE[function-patch-applies-to](includes/function-patch-applies-to.md)]




Modifies or creates one or more [records](/power-apps/maker/canvas-apps/working-with-tables#records) in a [data source](/power-apps/maker/canvas-apps/working-with-data-sources), or merges records outside of a data source.

Use the **Patch** function to modify records in complex situations, such as when you do updates that require no user interaction or use forms that span multiple screens.

To update records in a data source more easily for simple changes, use the **Edit form** control instead. When you add an **Edit form** control, you provide users with a form to fill in and then save the changes to a data source. For more information, see [Understand data forms](/power-apps/maker/canvas-apps/working-with-forms).

Watch this video to learn how to use the Patch function:

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=4f09e796-64f3-4895-89d9-70c8462dac37]

## Overview

Use the **Patch** function to modify one or more records of a data source. It updates the values of specific [fields](/power-apps/maker/canvas-apps/working-with-tables#elements-of-a-table) without affecting other properties. For example, this formula changes the phone number for a customer named Contoso:

`Patch( Customers, LookUp( Customers, Name = "Contoso" ), { Phone: "1-212-555-1234" } )`

Use **Patch** with the **[Defaults](function-defaults.md)** function to create records. Use this behavior to build a [single screen](/power-apps/maker/canvas-apps/working-with-data-sources) for both creating and editing records. For example, this formula creates a record for a customer named Contoso:

`Patch( Customers, Defaults( Customers ), { Name: "Contoso" } )`

> [!NOTE]
>  When you patch a collection by using a record from a data source with default values, the patch operation updates the collection with both the specified patch values and the default values from the data source. The DataSource of the patch statement and the DataSource of the Defaults function must match to create a new record.

Even if you're not working with a data source, you can use **Patch** to merge two or more records. For example, this formula merges two records into one that identifies both the phone number and the location for Contoso:

`Patch( { Name: "Contoso", Phone: "1-212-555-1234" }, { Name: "Contoso", Location: "Midtown" } )`

## Description

### Modify or create a record in a data source

To use this function with a data source, specify the data source, and then specify a base record:

- To modify a record, the base record needs to come from a data source. You might get the base record through a gallery's **[Items](/power-apps/maker/canvas-apps/controls/properties-core)** property, place it in a [context variable](/power-apps/maker/canvas-apps/working-with-variables#use-a-context-variable), or obtain it through some other path. But, you must be able to trace the base record back to the data source. This requirement is important because the record includes extra information that helps you find the record again for modification.
- To create a record, use the **[Defaults](function-defaults.md)** function to create a base record with default values.

Then specify one or more change records, each of which contains new property values that override property values in the base record. Change records are processed in order from the beginning of the argument list to the end, with later property values overriding earlier ones.

The return value of **Patch** is the record that you modified or created. If you created a record, the return value might include properties that the data source generated automatically. However, the return value doesn't provide a value for fields of a related table.

For example, you use `Set(MyAccount, Patch(Accounts, First(Account), 'Account Name': "Example name"));` and then `MyAccount.'Primary Contact'.'Full Name'`. You can't yield a full name in this case. Instead, to access the fields of a related table, use a separate lookup such as:

```powerapps-dot
LookUp(Accounts, Account = MyAccount.Account).'Primary Contact'.'Full Name'
```

When you update a data source, one or more issues might arise. Use **[IfError](function-iferror.md)** and **[IsError](function-iferror.md)** with the return value from **Patch** to detect and respond to errors, as [Error Handling](../error-handling.md) describes.  You can also use the **[Errors](function-errors.md)** function to identify and examine issues, as [Working with Data Sources](/power-apps/maker/canvas-apps/working-with-data-sources) describes.

Related functions include the **[Update](function-update-updateif.md)** function to replace an entire record, and the **[Collect](function-clear-collect-clearcollect.md)** function to create a record. Use the **[UpdateIf](function-update-updateif.md)** function to modify specific properties of multiple records based on a condition.

### Modify or create a set of records in a data source

You can also use **Patch** to create or modify multiple records with a single call.

Instead of passing a single base record, provide a table of base records in the second argument. Provide change records in a table as well, corresponding one-for-one with the base records. The number of records in each change table must be the same as the number of records in the base table.

When you use **Patch** in this manner, the return value is also a table with each record corresponding one-for-one with the base and change records.

### Merge records outside of a data source

Specify two or more records that you want to merge. The function processes records in the order from the beginning of the argument list to the end, with later property values overriding earlier ones.

**Patch** returns the merged record and doesn't modify its arguments or records in any data sources.

## Syntax

#### Modify or create a record in a data source

**Patch**( _DataSource_, _BaseRecord_, _ChangeRecord1_ [, *ChangeRecord2*, … ])

- _DataSource_ – Required. The data source that contains the record that you want to modify or will contain the record that you want to create.
- _BaseRecord_ – Required. The record to modify or create. If the record came from a data source, the function finds and modifies the record. If the result of **[Defaults](function-defaults.md)** is used, the function creates a record. The DataSource of the patch statement and the DataSource of the Defaults function must match in order to create a new record. 
- _ChangeRecord(s)_ – Required. One or more records that contain properties to modify in the _BaseRecord_. The function processes change records in order from the beginning of the argument list to the end, with later property values overriding earlier ones.

#### Modify or create a set of records in a data source

**Patch**( _DataSource_, _BaseRecordsTable_, _ChangeRecordTable1_ [, *ChangeRecordTable2*, … ] )

- _DataSource_ – Required. The data source that contains the records that you want to modify or will contain the records that you want to create.
- _BaseRecordTable_ – Required. A table of records to modify or create. If the record came from a data source, the function finds and modifies the record. If the result of **[Defaults](function-defaults.md)** is used, the function creates a record. The DataSource of the patch statement and the DataSource of the Defaults function must match in order to create a new record. 
- _ChangeRecordTable(s)_ – Required. One or more tables of records that contain properties to modify for each record of the _BaseRecordTable_. The function processes change records in order from the beginning of the argument list to the end, with later property values overriding earlier ones.

#### Merge records

**Patch**( _Record1_, _Record2_ [, …] )

- _Record(s)_ - Required. At least two records that you want to merge. The function processes records in order from the beginning of the argument list to the end, with later property values overriding earlier ones.

## Examples

#### Modify or create a record (in a data source)

In these examples, you modify or create a record in a data source named **IceCream**. The data source contains the data in this [table](/power-apps/maker/canvas-apps/working-with-tables) and automatically generates the values in the **ID** [column](/power-apps/maker/canvas-apps/working-with-tables#columns):

:::image type="content" source="media/function-patch/icecream.png" alt-text="Screenshot of the IceCream data source example table showing flavors and quantities.":::


To create an in-memory version of this data source so you can try these examples, evaluate this formula:

```powerapps-dot
ClearCollect( IceCream,
    { ID: 1, Flavor: "Chocolate", Quantity: 100 },
    { ID: 2, Flavor: "Vanilla", Quantity: 200 }
)
```

| Formula                                                                                                   | Description                                                                                                                                                                                                                                                                                                                                                                                                         | Result                                                                                                                                              |
| --------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Patch(&nbsp;IceCream,<br>LookUp( IceCream, Flavor = "Chocolate" ), {&nbsp;Quantity:&nbsp;400&nbsp;} )** | Modifies a record in the **IceCream** data source:<ul><li> The **ID** column of the record to modify contains the value of **1**. (The **Chocolate** record has that ID.)</li><li>The value in the **Quantity** column changes to **400**.                                                                                                                                                                          | {&nbsp;ID:&nbsp;1, Flavor:&nbsp;"Chocolate", Quantity:&nbsp;400 }<br><br>The **Chocolate** entry in the **IceCream** data source is modified. |
| **Patch( IceCream, Defaults(&nbsp;IceCream ), {&nbsp;Flavor:&nbsp;"Strawberry"&nbsp;}&nbsp;)**            | Creates a record in the **IceCream** data source:<ul><li>The **ID** column contains the value **3**, which the data source generates automatically.</li><li>The **Quantity** column contains **0**, which is the default value for that column in the **IceCream** data source, as the **[Defaults](function-defaults.md)** function specifies.<li>The **Flavor** column contains the value of **Strawberry**.</li> | { ID:&nbsp;3, Flavor:&nbsp;"Strawberry", Quantity:&nbsp;0&nbsp;}<br><br>The **Strawberry** entry in the **IceCream** data source is created.  |

After the previous formulas are evaluated, the data source ends with these values:

:::image type="content" source="media/function-patch/icecream-after.png" alt-text="Screenshot of the IceCream data source after the Patch formulas have been evaluated.":::

#### Merge records (outside of a data source)

| Formula                                                                                                                         | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | Result                                                            |
| ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------- |
| **Patch(&nbsp;{&nbsp;Name:&nbsp;"James",&nbsp;Score:&nbsp;90&nbsp;}, {&nbsp;Name:&nbsp;"Jim",&nbsp;Passed:&nbsp;true&nbsp;} )** | Merges two records outside of a data source:<br><ul><li>The values in the **Name** column of each record don't match. The result contains the value (**Jim**) in the record that's closer to the end of the argument list instead of the value (**James**) in the record that's closer to the start.</li><li>The first record contains a column (**Score**) that doesn't exist in the second record. The result contains that column with its value (**90**).</li><li>The second record contains a column (**Passed**) that doesn't exist in the first record. The result contains that column with its value (**true**). | {&nbsp;Name:&nbsp;"Jim", Score:&nbsp;90, Passed:&nbsp;true&nbsp;} |

#### Modify or create a set of records (in a data source)

When you use **Patch** with tables instead of single records, you can create or modify multiple records in a single call. The return value is a table of records that corresponds one-for-one with the input tables.

This example updates the **Quantity** for multiple flavors in the **IceCream** data source at once:

```powerapps-dot
Patch(
    IceCream,
    Table(
        { ID: 1, Flavor: "Chocolate", Quantity: 150 },
        { ID: 2, Flavor: "Vanilla", Quantity: 200 }
    ),
    Table(
        { Quantity: 300 },
        { Quantity: 400 }
    )
)
```

The result is a table with the updated records: `{ ID: 1, Flavor: "Chocolate", Quantity: 300 }` and `{ ID: 2, Flavor: "Vanilla", Quantity: 400 }`.

This example creates multiple new records using **Defaults**:

```powerapps-dot
Patch(
    IceCream,
    Table( Defaults( IceCream ), Defaults( IceCream ) ),
    Table(
        { Flavor: "Mint", Quantity: 60 },
        { Flavor: "Peach", Quantity: 80 }
    )
)
```

> [!NOTE]
> When you use **Patch** with tables, the number of records in each change table must match the number of records in the base table. Otherwise, an error occurs.

To detect errors when you modify multiple records, use **[IfError](function-iferror.md)**. `IfError` is the preferred mechanism and works across Power Fx hosts:

```powerapps-dot
IfError(
    Patch(
        IceCream,
        baseRecords,
        changeRecords
    ),
    Notify( "Some records failed to update: " & FirstError.Message, NotificationType.Error )
)
```

#### Patch with Dataverse column types

The following examples apply specifically to **Microsoft Dataverse** data sources. Record shapes vary by data source (for example, SharePoint and SQL Server have different formats).

**Choice column:** To set a Choice column, use the enum value directly. This example sets a **Status** choice column on an **Accounts** table:

```powerapps-dot
Patch(
    Accounts,
    LookUp( Accounts, 'Account Name' = "Contoso" ),
    { 'Status': 'Status (Accounts)'.Active }
)
```

**Lookup column:** To set a Lookup column, provide a record with the primary key of the related table. This example sets the **Primary Contact** lookup on an **Accounts** record:

```powerapps-dot 
Patch(
    Accounts,
    LookUp( Accounts, 'Account Name' = "Contoso" ),
    { 'Primary Contact': LookUp( Contacts, 'Full Name' = "John Smith" ) }
)
```

> [!NOTE]
> These column-type examples are Dataverse-specific. Other data sources, such as SharePoint or SQL Server, might require different record shapes for similar column types. Refer to the documentation for your specific data source for the correct format.

### Delegation in formulas that use Patch

The **Patch** function itself isn't subject to [delegation](/power-apps/maker/canvas-apps/delegation-overview) because it writes to the data source rather than querying it. However, delegation warnings might appear in formulas that use **Patch** if the record-selection portion of the formula (such as **[Filter](function-filter-lookup.md)**, **[LookUp](function-filter-lookup.md)**, or **[ForAll](function-forall.md)**) involves a query that exceeds the data source delegation limits.

When you see a delegation warning in a formula that includes **Patch**, check whether the warning applies to the data retrieval functions rather than to **Patch** itself. For more information about delegation, see [Understand delegation in a canvas app](/power-apps/maker/canvas-apps/delegation-overview).

### Common errors with the Patch function

When you use the **Patch** function, errors might occur because of data source connectivity, permissions, or data conflicts. Use **[IfError](function-iferror.md)** and **[IsError](function-iferror.md)** to detect errors and respond appropriately.

- **"Network error when using Patch function"**: This error typically indicates that the app can't reach the data source. Common causes include a lost internet connection, the data source being temporarily unavailable, or insufficient permissions for the current user. Wrap the **Patch** call in **IfError** to provide a meaningful message to users.

- **"Conflicts exist with changes on the server"**: This error occurs when another user or process modifies the same record between the time your app reads the record and writes the change. Refresh the data source by calling the **[Refresh](function-refresh.md)** function and retry the operation.

- **Permission errors**: If the user doesn't have permission to create or modify records in the data source, the **Patch** call fails. Use **IfError** to catch permission-related errors and guide the user.

For general error-handling patterns, see [Error handling](../error-handling.md).

### Use of **As** or **ThisRecord**

Use the **As** or **ThisRecord** keyword in your formula to avoid ambiguous evaluation context.

In the following example, consider the first `Lookup` in the `If` statement. `(OrderID = A[@OrderID])` is expected to compare the `OrderId` in the `Lookup` scope with the `OrderId` of collection `A` in the `ForAll` scope. In this case, you likely want `A[@OrderId]` to resolve as a local parameter. But it's ambiguous.

Power Apps currently interprets both the left-hand side `OrderId` and right-hand side `A[@OrderId]` as a field in the `Lookup` scope. Therefore, `Lookup` always finds the first row in `[dbo].[Orders1]` because the condition is always true (that is, any row's `OrderId` is equal to itself).

```power-fx
ClearCollect(
    A,
    Filter(
        '[dbo].[Orders1]',
        OrderId = 8888888
    )
);
ForAll(
    A,
    If(
        LookUp(
            '[dbo].[Orders1]',
            OrderId = A[@OrderId],
            "OK"
        ) = "OK",
        Patch(
            '[dbo].[Orders1]',
            LookUp(
                '[dbo].[Orders1]',
                OrderId = A[@OrderId]
            ),
            {
      OrderName: "val1"
       }
   ),
   Patch(
            '[dbo].[Orders1]',
            Defaults('[dbo].[Orders1]'),
            {
      OrderName: "val2"
       }
   )
    )
)
```

#### Using **As** or **ThisRecord**

Whenever possible, use the **As** operator or the **ThisRecord** keyword to disambiguate the left-hand side. **As** is recommended for the preceding scenario.

When your formula uses multiple scopes with `ForAll`, `Filter`, and `Lookup` on the same data source or table, scope parameters might collide with a same field elsewhere. Therefore, use the **As** operator or **ThisRecord** to resolve the field name and avoid ambiguity.

For example, you can use the **As** operator to disambiguate in the following example.

```power-fx
ClearCollect(
    A,
    Filter(
        '[dbo].[Orders1]',
        OrderId = 8888888
    )
);
ForAll(
    A,
    If(
        LookUp(
            '[dbo].[Orders1]' As B,
            B.OrderId = A[@OrderId],
            "OK"
        ) = "OK",
        Patch(
            '[dbo].[Orders1]',
            LookUp(
                '[dbo].[Orders1]' As C,
                C.OrderId = A[@OrderId]
            ),
            {
      OrderName: "val1"
       }
   ),
   Patch(
            '[dbo].[Orders1]',
            Defaults('[dbo].[Orders1]'),
            {
      OrderName: "val2"
       }
   )
    )
)
```

Alternatively, you can use **ThisRecord** for the same purpose.

```power-fx
ClearCollect(
    A,
    Filter(
        '[dbo].[Orders1]',
        OrderId = 8888888
    )
);
ForAll(
    A,
    If(
        LookUp(
            '[dbo].[Orders1]',
            ThisRecord.OrderId = A[@OrderId],
            "OK"
        ) = "OK",
        Patch(
            '[dbo].[Orders1]',
            LookUp(
                '[dbo].[Orders1]',
                ThisRecord.OrderId = A[@OrderId]
            ),
            {
      OrderName: "val1"
       }
   ),
   Patch(
            '[dbo].[Orders1]',
            Defaults('[dbo].[Orders1]'),
            {
      OrderName: "val2"
       }
   )
    )
)
```

To learn more about the usage of the **As** operator and **ThisRecord**, see the **[Operators](operators.md)** article.



[!INCLUDE[footer-include](../../includes/footer-banner.md)]

