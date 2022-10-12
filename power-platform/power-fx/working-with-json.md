---
title: Working with JSON (experimental)
description: Guide to working with JSON in Power Fx.
author: jorisdg

ms.topic: reference
ms.custom: canvas
ms.reviewer: tapanm
ms.date: 09/10/2022
ms.subservice: power-fx
ms.author: jorisde
search.audienceType: 
  - maker
search.app: 
  - PowerApps
contributors:
  - jorisdg
---
# Working with JSON (experimental)

> [!IMPORTANT]
> - This is an experimental feature.
> - Experimental features aren’t meant for production use and may have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback. More information: [Understand experimental, preview, and deprecated features in Power Apps](/power-apps/maker/canvas-apps/working-with-experimental-preview)
> - The behavior that this article describes is available only when the _ParseJSON function and untyped objects_ experimental feature in [Settings > Upcoming features > Experimental](/power-apps/maker/canvas-apps/working-with-experimental-preview#controlling-which-features-are-enabled) is turned on (off by default).
> - Your feedback is very valuable to us - please let us know what you think in the [Power Apps experimental features community forum](https://powerusers.microsoft.com/t5/Power-Apps-Experimental-Features/bd-p/PA_ExperimentalFeatures).

Power Fx allows makers to read **JSON** into an [Untyped object](untyped-object.md) using the [ParseJSON](reference/function-parsejson.md) function.

## Reading and converting values

**ParseJSON** will convert the following **JSON** record string into an **Untyped object** with fields `ItemName`, `Quantity`, `ReleaseDate` and `AvailableForPreOrder`.

```JSON
{
  "ItemName" : "Widget 1",
  "Quantity" : 46,
  "ReleaseDate" : "2022-09-01",
  "AvailableForPreOrder" : true
}
```

Each of the fields can be accessed using the dot notation on the **Untyped object** value returned from **ParseJSON**.

```powerapps-dot
Set( untyped, ParseJSON( jsonStringVariable ) );

Set( item, Text ( untyped.ItemName ) );
Set( quantity, Value ( untyped.Quantity ) );
Set( release, DateValue ( untyped.ReleaseDate ) );
Set( preorder, Boolean ( untyped.AvailableForPreOrder ) );
```

In case a field name consists of an invalid identifier name, for example when the field names starts with a number or contains invalid characters such as a hyphen, you can put the field names in single quotes:

```powerapps-dot
untyped.'01'
untyped.'my-field'
```

Power Fx won't evaluate the existence of the field until the formula is run. This allows flexibility in the incoming **JSON**. For example, the previous **JSON** may sometimes contain an extra field called `Discount`. But in our previous example, this field isn't present. Writing a formula that uses the `Discount` field won't result in any errors, during the app making process or when users use the app. If the field is missing when the formula runs, the value will just result in a [Blank()](reference/function-isblank-isempty.md) value.

> [!NOTE]
> **JSON** supports `null` values for fields. These will also result in **Blank()** values. Currently, there is no distinction in Power Fx between a missing field, or a field that has the value `null`.

As accessing fields on **Untyped objects** isn't evaluated when writing the formula, there's also no **Intellisense** available. Both **JSON** and **Power Fx** are case sensitive, so take extra care in writing out field names.

**JSON** values don't have to be in a record-style notation. Valid **JSON** can be just a value, such as `"text value"`,  `true` or `123.456`. In such a case, the **Untyped object** that **ParseJSON** returns is the value itself and the dot notation isn't used.

```powerapps-dot
Set( myText, Boolean( ParseJSON( "true" ) ) );

Set( myNumber, Value( ParseJSON( "123.456" ) ) );
```

Finally, **JSON** supports nested records. Converting such **JSON** to **Untyped object** results in nested objects, and the dot notation can be used to traverse the hierarchy.

```JSON
{
  "Version" : 1,
  "RootElement" : {
    "Parent" : {
      "Name" : "This is the parent",
      "Child" : {
        "Name" : "This is the child"
      }
    }
  }
}
```

When converting this **JSON** string to an **Untyped object** variable named `jsonObject`, the fields can be accessed using the dot notation.

```powerapps-dot
Set( jsonObject, ParseJSON( jsonStringVariable ) );

Set( parentName, Text( jsonObject.RootElement.Parent.Name ) ); // "This is the parent"

Set( childName, Text( jsonObject.RootElement.Parent.Child.Name ) ); // "This is the child"
```

If any of the fields in the dot notation expression don't exist, **Blank()** will be returned.

## Arrays and tables

**JSON** can contain arrays of values or records. These arrays can be accessed directly, or converted into **Power Fx** tables.

```JSON
{
  "OrderNumber" : "SO000010",
  "CustomerID" : "CUST0126",
  "OrderLines" : [
    {
      "Item" : "Widget 1",
      "Quantity" : 3
    },
    {
      "Item" : "Widget 2",
      "Quantity" : 5
    }
  ]
}
```

This **JSON** contains a record with a field named `OrderLines` which contains an array of records. Each record has two fields: `Item` and `Quantity`. If the **JSON** is converted into an **Untyped object** using the **ParseJSON** function and set to a variable named `jsonOrder`, we can access the individual order lines in several ways.

```powerapps-dot
Set( jsonOrder, ParseJSON( jsonStringVariable ) );
```

You can retrieve individual records and values using the [Index()](reference/function-first-last.md) function. For example, to get the second record in the `OrderLines` field, then access the `Quantity` field and convert it to a value.
```powerapps-dot
Set( line2Quantity, Value( Index( jsonOrder.OrderLines, 2 ).Quantity ); // 5
```

You can convert the array of order lines directly to a table. This will create a single-column table with an **Untyped object** representing the record.

```powerapps-dot
Set( orderLines, Table( jsonOrder.OrderLines ) );
```

Single column table 'orderLines' now has a 'Value' column that represents the **Untyped object**. To use any of the fields from a record in this table, use the dot notation to access the specific **JSON** field on the **Untyped object** in the `Value` column.

```powerapps-dot
Set( jsonRecord, Index( orderLines, 2 ) ); // Get the second record in the table

Set( line2Item, Text( jsonRecord.Value.Item ) ); // "Widget 2"
```

To make the use of the order line records easier and more straightforward in other parts of your app, you can convert the whole **Untyped object** to an entirely typed record using the [ForAll()](reference/function-forall.md) function.

```powerapps-dot
Set( typedOrderLines, ForAll( Table( jsonOrder.OrderLines ), { Item : Text( Value.Item ), Quantity : Value( Value.Quantity ) } ) );
```

The new `typedOrderLines` variable is now a fully typed **Power Fx** table with the following columns and values:

| Item | Quantity |
| --- | --- |
| "Widget 1" | 3 |
| "Widget 2" | 5 |

The previous examples use arrays of records, but **JSON** can also contain arrays of just values. Consider the following example that is a valid **JSON** string containing an array of three strings.

```JSON
[ "First Item", "Second Item", "Third Item"]
```

We can retrieve one of the items from the array using the **Index()** function, and convert it to text.

```powerapps-dot
Text( Index( ParseJSON( jsonStringVariable ), 2 ) ) // "Second Item"
```
