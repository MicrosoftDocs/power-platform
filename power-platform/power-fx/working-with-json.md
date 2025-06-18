---
title: Working with JSON in Power Fx
description: Guide to working with JSON in Power Fx.
author: gregli
ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 3/22/2024
ms.subservice: power-fx
ms.author: jorisde
contributors:
  - gregli-msft
  - mduelae
  - gregli
---
# Working with JSON in Power Fx

Power Fx allows makers to read **JSON** into a [Dynamic value](untyped-object.md) using the [ParseJSON](reference/function-parsejson.md) function.

## Reading and converting values

**ParseJSON** will convert the following **JSON** record string into a **Dynamic** record with fields `ItemName`, `Quantity`, `ReleaseDate` and `AvailableForPreOrder`.

```JSON
{
  "ItemName" : "Widget 1",
  "Quantity" : 46,
  "ReleaseDate" : "2022-09-01",
  "AvailableForPreOrder" : true
}
```

Each of the fields can be accessed using the dot notation on the **Dynamic** value returned from **ParseJSON**.

```power-fx
Set( dynvalue, ParseJSON( jsonStringVariable ) );

Set( item, Text ( dynamic.ItemName ) );
Set( quantity, Value ( dynamic.Quantity ) );
Set( release, DateValue ( dynamic.ReleaseDate ) );
Set( preorder, Boolean ( dynamic.AvailableForPreOrder ) );
```

It is generally a good idea to explicitly convert a dynamic value to a specific type. Setting a dynamic as a variable value makes the variable a dynamic value as well. So, converting such value explicitly when setting to a variable is likely needed. But in most cases dynamic values will convert to a specific type automatically ("coerce") when used as function parameters where the type is a simple type like boolean, number, or text, and the function's parameter profile does not have potential conflicting overloads.

```power-fx
Left( dynamic.ItemName, 1 ); // "W"
Radians( dynamic.Quantity ); // 0.80285146
If (dynamic.AvailableForPreOrder, "Available", "Not Available" ); // "Available"
```

In addition to automatically converting the type in function calls, dynamic values will also be converted when assigned to control properties, where possible.

```power-fx
Label1.Text: dynamic.Quantity
InputText1.Default: dynamic.ItemName
```

And finally, when [using operators](./operators.md) such as **&** or **+**, a dynamic value will be coerced if there is no ambiguity on the expected type.

```power-fx
dynamic.Quantity + 1 // result is a number
dynamic.ItemName & " (preorder)" // result is text
dynamic.Quantity + dynamic.Quantity // result is a number
dynamic.Quantity & dynamic.ItemName // result is text
```

> [!NOTE]
> **JSON** does not have a **GUID**, **Color**, **Time** or **DateTime** type. These values are represented as a string. If you assign a **JSON** dynamic value containing a date to a text property directly, the original text of the **JSON** will be used. This may be important when dealing with time zones, date formats, etc. In such cases you should explicitly convert the values using **GUID()**, **ColorValue()**, **DateValue()**, **DateTimeValue()**, etc.

In case a field name consists of an invalid identifier name, for example when the field names starts with a number or contains invalid characters such as a hyphen, you can put the field names in single quotes:

```power-fx
dynamic.'01'
dynamic.'my-field'
```

Power Fx won't evaluate the existence of the field until the formula is run. This allows flexibility in the incoming **JSON**. For example, the previous **JSON** may sometimes contain an extra field called `Discount`. But in our previous example, this field isn't present. Writing a formula that uses the `Discount` field won't result in any errors, during the app making process or when users use the app. If the field is missing when the formula runs, the value will just result in a [Blank()](reference/function-isblank-isempty.md) value.

> [!NOTE]
> **JSON** supports `null` values for fields. These will also result in **Blank()** values. Currently, there is no distinction in Power Fx between a missing field, or a field that has the value `null`.

As accessing fields of a dynamic value isn't evaluated when writing the formula, there's also no **Intellisense** available. Both **JSON** and **Power Fx** are case sensitive, so take extra care in writing out field names.

**JSON** values don't have to be in a record-style notation. Valid **JSON** can be just a value, such as `"text value"`,  `true` or `123.456`. In such a case, the dynamic value that **ParseJSON** returns is the value itself and the dot notation isn't used.

```power-fx
Set( myText, Boolean( ParseJSON( "true" ) ) );

Set( myNumber, Value( ParseJSON( "123.456" ) ) );
```

Finally, **JSON** supports nested records. Converting such **JSON** to a **Dynamic** value results in nested objects, and the dot notation can be used to traverse the hierarchy.

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

When converting this **JSON** string to a **Dynamic** variable named `jsonObject`, the fields can be accessed using the dot notation.

```power-fx
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

This **JSON** contains a record with a field named `OrderLines` which contains an array of records. Each record has two fields: `Item` and `Quantity`. If the **JSON** is converted into a **Dynamic** value using the **ParseJSON** function and set to a variable named `jsonOrder`, we can access the individual order lines in several ways.

```power-fx
Set( jsonOrder, ParseJSON( jsonStringVariable ) );
```

You can retrieve individual records and values using the [Index()](reference/function-first-last.md) function. For example, to get the second record in the `OrderLines` field, then access the `Quantity` field and convert it to a value.

```power-fx
Set( line2Quantity, Value( Index( jsonOrder.OrderLines, 2 ).Quantity ) ); // 5
```

You can convert the array of order lines directly to a table. This will create a single-column table with a **Dynamic** value representing the record.

```power-fx
Set( orderLines, Table( jsonOrder.OrderLines ) );
```

Single column table 'orderLines' now has a 'Value' column that represents the **Dynamic** value. To use any of the fields from a record in this table, use the dot notation to access the specific **JSON** field on the **Dynamic** value in the `Value` column.

```power-fx
Set( jsonRecord, Index( orderLines, 2 ) ); // Get the second record in the table

Set( line2Item, Text( jsonRecord.Value.Item ) ); // "Widget 2"
```

To make the use of the order line records easier and more straightforward in other parts of your app, you can convert the whole **Dynamic** value to an entirely typed record using the [ForAll()](reference/function-forall.md) function. Providing the **Dynamic** value directly to **ForAll()** means you can access the object fields directly instead of using the single-column `Value` field.

```power-fx
Set( typedOrderLines, ForAll( jsonOrder.OrderLines, { Item : Text( ThisRecord.Item ), Quantity : Value( ThisRecord.Quantity ) } ) );
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

```power-fx
Text( Index( ParseJSON( jsonStringVariable ), 2 ) ) // "Second Item"
```
