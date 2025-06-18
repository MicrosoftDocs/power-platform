---
title: AsType and IsType functions
description: Reference information including syntax and examples for the AsType and IsType functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 1/14/2025
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# AsType and IsType functions
[!INCLUDE[function-astype-istype-applies-to](includes/function-astype-istype-applies-to.md)]



Checks if a record reference is a specific table type (**IsType**) and treats the reference as that type (**AsType**).

> [!NOTE]
> [PAC CLI pac power-fx commands](/power-platform/developer/cli/reference/power-fx) don't support **IsType**.

## Description

The **AsType** and **IsType** functions can be used to convert record references (for example polymorphic lookups in Dataverse) and dynamic values to typed values that can be used directly.

### Record References

Read [Understand record references and polymorphic lookups](/power-apps/maker/canvas-apps/working-with-references) for a broader introduction and more details.

A lookup field usually refers to records in a particular table. Because the table type is well established, access the fields of the lookup using simple dot notation. For example, **First( Accounts ).'Primary Contact'.'Full Name'** walks from the **Accounts** table to the **Primary Contact** record in the **Contacts** table and extracts the **Full Name** field.

Microsoft Dataverse also supports polymorphic lookup fields, which can refer to records from a set of tables, as in these examples.

| Lookup field  | Can refer to                                             |
| ------------- | -------------------------------------------------------- |
| **Owner**     | **Users** or **Teams**                                   |
| **Customer**  | **Accounts** or **Contacts**                             |
| **Regarding** | **Accounts**, **Contacts**, **Knowledge Articles**, etc. |

In canvas-app formulas, use record references to work with polymorphic lookups. Because a record reference can refer to different tables, it's unclear which fields are available at runtime when writing a formula. The _Record.Field_ notation isn't available. Those formulas must adapt to the records that the app encounters when it runs.

The **IsType** function tests if a record reference refers to a specific table type. The function returns a Boolean TRUE or FALSE.

The **AsType** function treats a record reference as a specific table type, also known as _casting_. You can use the result as if it were a record of the table and again use the _Record.Field_ notation to access all of the fields of that record. An error occurs if the reference isn't of the specific type.

Use these functions together to first test the table type of a record and then treat it as a record of that type so that the fields are available:

```power-fx
If( IsType( First( Accounts ).Owner, Users ),
    AsType( First( Accounts ).Owner, Users ).'Full Name',
    AsType( First( Accounts ).Owner, Teams ).'Team Name'
)
```

These functions are needed only if accessing the fields of a record reference. For example, you can use record references in the [**Filter**](function-filter-lookup.md) function without **IsType** or **AsType**:

```power-fx
Filter( Accounts, Owner = First( Users ) )
```

Similarly, you can use record references with the [**Patch**](function-patch.md) function:

```power-fx
Patch( Accounts, First( Accounts ), { Owner: First( Teams ) } )
```

When used in a record context, such as within a [**Gallery**](/power-apps/maker/canvas-apps/controls/control-gallery) or [**Edit form**](/power-apps/maker/canvas-apps/controls/control-form-detail) control, the [global disambiguation operator](operators.md#disambiguation-operator) might be needed to reference the table type. For example, this formula would be effective for a gallery that's displaying a list of contacts where **Company Name** is a **Customer** lookup:

```power-fx
If( IsType( ThisItem.'Company Name', Accounts ),
    AsType( ThisItem.'Company Name', Accounts ).'Account Name',
    AsType( ThisItem.'Company Name', Contacts ).'Full Name'
)
```

For both functions, specify the type through the name of the data source connected to the table. For the formula to work, you must also add a data source to the app for any types that you want to test or cast. For example, you must add the **Users** table as a data source if you want to use **IsType** and **AsType** with an **Owner** lookup and records from that table. You can add only the data sources that you actually use in your app; you don't need to add all the tables that a lookup could reference.

If the record reference is _blank_, **IsType** returns FALSE, and **AsType** returns _blank_. All fields of a _blank_ record are also _blank_.

### Dynamic values

> [!IMPORTANT]
> - Using **AsType** and **IsType** with **Dynamic** values is an experimental feature.
> - Experimental features aren't meant for production use and may not be complete. These features are available before an official release so that you can get early access and provide feedback. More information: [**Understand experimental, preview, and retired features in canvas apps**](/power-apps/maker/canvas-apps/working-with-experimental-preview)
> - The behavior that this article describes is available only when the **User-defined types** experimental feature in [**Settings &gt; Upcoming features &gt; Experimental**](/power-apps/maker/canvas-apps/working-with-experimental-preview#controlling-which-features-are-enabled) is turned on (it's off by default).
> - Your feedback is valuable to us. Let us know what you think in the [**Power Apps experimental features community forum**](https://community.powerplatform.com/forums/thread/details/?threadid=c8824a08-8198-ef11-8a69-7c1e52494f33).

A **Dynamic** value from a web API or the [**ParseJSON** function] needs to be converted to a specific typed value before it can be used in Power Fx. Options to do this include:
1. Implicitly type the field at the point it's used. For example, an object is converted to a number if it's used with the `+` operator, if it can be converted to a number. This option can have unexpected conversions and can't convert records and tables as a whole.
1. Explicitly type each field individually with the **Decimal**, **Text**, **DateTime**, **GUID**, and other type constructor functions. This is the most invasive to your formulas as each field must be done separately.
1. Explicitly type JSON with the second argument to the **ParseJSON** function. This is an easy option that avoids needing the **Dynamic** value.
1. Explicitly type a **Dynamic** value using the **AsType** function. You can also test type before attempting the conversion with the **IsType** function.

## Syntax

**AsType**( _RecordReference_, _TableType_ )

- _RecordReference_ - Required. A record reference, often a lookup field that can refer to a record in any of multiple tables.
- _TableType_ - Required. The specific table to which the record should be cast.
 
**AsType**( _DynamicValue_, _TypeSpecification_ )

- _DynamicValue_ - Required. A record reference, often a lookup field that can refer to a record in any of multiple tables.
- _TypeSpecification_ - Required. A type name or type specification defined with the [**Type** function](function-type.md).

**IsType**( _RecordReference_, _TableType_ )

- _RecordReference_ - Required. A record reference, often a lookup field that can refer to a record in any of multiple tables.
- _TableType_ - Required. The specific table for which to test.

**IsType**( _DynamicValue_, _TypeSpecification_ )

- _DynamicValue_ - Required. A record reference, often a lookup field that can refer to a record in any of multiple tables.
- _TypeSpecification_ - Required. A type name or type specification defined with the [**Type** function](function-type.md).

## Examples

### Record References

[Understand record references and polymorphic lookups](/power-apps/maker/canvas-apps/working-with-references) contains extensive examples.

1. Create a blank canvas app for tablets.

1. On the left-pane, select **Data** > **Add data**. And then, add **Accounts** and **Contacts** tables.

   ![Blank app with two data sources: accounts and contacts.](media/function-astype-istype/contacts-add-datasources.png)

1. On the left-pane, select **+** (Insert) > **Layout** > **Blank vertical gallery**.

   ![Insert a gallery control with a blank vertical layout.](media/function-astype-istype/contacts-customer-gallery.png)

1. Select **Connect to data**, and then select **Contacts** as the data source.

1. Set the gallery's layout to **Title and subtitle**.

    > [!div class="mx-imgBorder"] 
    > ![Open the layout picker from the properties pane.](media/function-astype-istype/contacts-customer-layout.png)

    > [!div class="mx-imgBorder"] 
    > ![Set layout to Title and subtitle.](media/function-astype-istype/contacts-customer-flyout.png)

1. In the **Data** pane, open the **Title1** list, and then select **Full Name**.

    > [!div class="mx-imgBorder"] 
    > ![Set title value.](media/function-astype-istype/contacts-customer-title.png)

1. Select the **Subtitle1** label control.

    > [!div class="mx-imgBorder"] 
    > ![Set subtitle value.](media/function-astype-istype/contacts-customer-subtitle.png)

1. Set the **Text** property of **Subtitle1** to this formula:

   ```power-fx
   If( IsBlank( ThisItem.'Company Name' ), "--",
       IsType( ThisItem.'Company Name', Accounts ),
           "Account: " & AsType( ThisItem.'Company Name', Accounts ).'Account Name',
       "Contact: " & AsType( ThisItem.'Company Name', Contacts ).'Full Name'
   )
   ```

    > [!div class="mx-imgBorder"] 
    > ![Screen is now complete showing accounts and contacts intermixed in the gallery.](media/function-astype-istype/contacts-customer-complete.png)

   The subtitle in the gallery shows these values:

   - "--" if the **'Company Name'** is _blank_.
   - "Account: " and then the **Account Name** field from the **Accounts** table if the **Company Name** field refers to an account.
   - "Contact: " and then the **Full Name** field from the **Contacts** table if the **Company Name** field refers to a contact.

   Your results might differ because the sample data might have been modified to show more types of results.

### Dynamic values

The following examples show a simple JSON record interpreted in various ways by **ParseJSON**, **AsType**, and **IsType** in the [Pac CLI Power Fx REPL](../../developer/cli/reference/power-fx.md).

In this first example, no type information is provided to **ParseJSON**, so it returns a dynamic value.

```powerapps-dot
>> Set( rec, ParseJSON( "{""a"":1}" ) )
rec: <Dynamic: Use Value, Text, Boolean, or other functions to establish the type>
```

The field is implicitly converted to a number when used in a numerical context.

```powerapps-dot
>> 1 + rec.a
2
```

As an alternative, this example explicitly converts the record to a typed Power Fx record with the second argument to **ParseJSON**.

```powerapps-dot
>> ParseJSON( "{""a"":1}", Type( {a: Number} ) )
{a:1}
```

And another alternative, this example explicitly converts the record to a typed Power Fx record using **AsType**.

```powerapps-dot
>> AsType( ParseJSON( "{""a"":1}" ), Type( {a: Number} ) )
{a:1}
```

Finally, if we weren't sure, this example tests the type before converting it with the **IsType** function.

```powerapps-dot
>> IsType( ParseJSON( "{""a"":1}" ), Type( {a: Number} ) )
true
```

[!INCLUDE[footer-include](../../includes/footer-banner.md)]









































































































































