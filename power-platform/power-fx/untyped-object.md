---
title: Untyped object data type
description: Reference information about the untyped object type in Power Fx.
author: jorisdg

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 09/10/2022
ms.subservice: power-fx
ms.author: jorisde
search.audienceType: 
  - maker
contributors:
  - jorisdg
  - mduelae
---
# Untyped object data type

**Untyped object** is a data type in Power Fx that can hold any data structure, complex or simple. It can't be used directly and requires explicit conversion to a data type. Fields in records in an **untyped object** can be accessed using the dot notation, and existence of fields is only verified at runtime.

**Untyped object** is the return type of specific untyped providers. Currently, only the [ParseJSON()](./reference/function-parsejson.md) function returns **untyped object**.

## Simple Types

The value of a variable of type **untyped object** can't be used directly. You always have to correctly type it using the corresponding type constructor.

The following examples convert the value of an **untyped object** variable named `UOValue`.

```powerapps-dot
Text(UOValue)
```
```powerapps-dot
Value(UOValue)
```

The following table lists the data types and corresponding functions to convert **untyped object** to that data type.

| Data Type | Function  | Description |
| --- | --- | --- |
| Boolean | [Boolean()](./reference/function-boolean.md) | When converting **untyped object** to **boolean**, the underlying value has to represent a boolean or a type that can be automatically converted (such as a string "true"). |
| Color | [ColorValue() or RGBA()](./reference/function-colors.md) | Colors can be represented in Cascading Style Sheet (CSS) color definition notation as a string, or as individual RGBA components. The **untyped object** can be converted directly from a Cascading Style Sheet (CSS) color definition string using the [ColorValue()](./reference/function-colors.md) function, or from individual RGBA [numbers](./reference/function-value.md) into color using the [RGBA()](./reference/function-colors.md) function. |
| Currency, Number | [Value()](./reference/function-value.md) | When converting **untyped object** to **number**, the underlying value has to represent a number or a type that can be automatically converted (such as a string "123.456"). |
| Date, DateTime, Time | [DateValue(), TimeValue() or DateTimeValue()](./reference/function-datevalue-timevalue.md) | Date, time and datetime can be directly converted from **untyped object** to their respective type, when represented in ISO 8601 format. Other formats must first be converted to text using the [Text()](./reference/function-text.md) function and then passed into the [DateValue(), TimeValue() or DateTimeValue()](./reference/function-datevalue-timevalue.md) function that by default will use the language of the current user's settings to interpret the date and time. |
| GUID | [GUID()](./reference/function-guid.md) | An **untyped object** can be directly converted to GUID if the underlying object represents a GUID, or if it represents a string. |
| HyperLink, Image, Media | [Text()](./reference/function-text.md) | These data types are text data types, and can be converted to text and then used in Power Fx. |
| Choice, Two Option | [Switch() or If()](./reference/function-if.md) | **Choices** and **two options** are presented as localized strings in Power Fx. **Choices** are backed by a number and **two options** as booleans. There's no direct conversion from boolean, number or string to a **choice** or **two option**, but the [Switch()](./reference/function-if.md) or [If()](./reference/function-if.md) functions can be used on the boolean, text or number value to correctly assign the **choice** or **two option** value. |
| Record | n/a | There's no direct conversion from **untyped object** to a record structure, but individual fields can be retrieved from the **untyped object** to create a new record. |
| Record Reference | n/a | Record references are unique to datasources and have no meaningful representation in **untyped objects**. |
| Table | [Table()](./reference/function-table.md) and [ForAll()](./reference/function-forall.md) | An **untyped object** can represent an array, which can be converted into a table. These objects can be arrays of records, or arrays of values that are effectively single-column tables. [ForAll()](./reference/function-forall.md) can be used to create a table with fully typed records. Review the examples further down this article for more information. |
| Text | [Text()](./reference/function-text.md) | Text can be directly converted. If an **untyped object** represents a number, you need to convert the **untyped object** to number first using [Value()](./reference/function-value.md) before converting to text. |

## Record Types

You can access fields on a variable representing an **untyped object** record using regular dot-notation used for records. However, the existence of the fields won't be verified until runtime. As a result, there's also no intellisense available. If a field doesn't exist or has an underlying **null** value, accessing it will result in a **Blank()** value.

Each field on the record is also of type **untyped object**, and needs to be properly typed. The field can be an untyped record of simple type. In case it's a record, you can chain the dot-notation. If any field in the chain doesn't exist, **Blank()** is returned.

The following examples use fields from an **untyped object** variable named `UORecord`.

```powerapps-dot
Text(UORecord.StringField)
```
```powerapps-dot
Value(UORecord.Field.ChildField)
```

In case a field name consists of an invalid identifier name, for example when the field names starts with a number or contains invalid characters such as a hyphen, you can put the field names in single quotes:

```powerapps-dot
untyped.'01'
untyped.'my-field'
```

## Arrays

An **untyped object** variable can contain an array. Even though the array could be either an array of records or array of simple types, converting the **untyped object** array to a table using the [Table()](./reference/function-table.md) function will always result in a single-column table of **untyped objects**. Functions such as [ForAll()](./reference/function-forall.md) and [Index()](./reference/function-first-last.md) do not require you to first create a **Table()** and as result don't require you to use the single-column `Value` field,

For example, to get the second number in an array of **untyped object** containing number values ( `[1, 2, 3]` ), the following formula can be used to retrieve the second row in the table and convert column to a number:

```powerapps-dot
Value( Index( UOArray, 2 ) )
```

If the **untyped object** was converted to a **Table()** first, the second row in the result single-column table is a `Value` column containing the **untyped object**:

```powerapps-dot
Value( Index( Table( UOArray ), 2 ).Value )
```

For an array of records that have a text column called `Field`, the same logic applies. The **untyped object** can be accessed directly, or if using the **Table()** function will result in a single-column table of **untyped object**.

The `Field` column can be access directly from the **untyped object** returned by the **Index()** function.

```powerapps-dot
Text( Index( UORecordArray, 2 ).Field )
```

When using the **Table()** function, first retrieve the single-column `Value` column to get the **untyped object**, then access the `Field` column:

```powerapps-dot
Text( Index( Table( UORecordArray ), 2 ).Value.Field )
```

To convert an array of records to a typed table, you can use the [ForAll()](./reference/function-forall.md) function and convert each individual field.

```powerapps-dot
ForAll( UORecordArray, { FirstField: Value(ThisRecord.FirstField), SecondField: Text(ThisRecord.SecondField) } )
```

If the **untyped object** is first converted to a table, again, the resulting single-column table of **untyped object** will require you to use the `Value` column to get the fields.

```powerapps-dot
ForAll( Table(UORecordArray), { FirstField: Value(ThisRecord.Value.FirstField), SecondField: Text(ThisRecord.Value.SecondField) } )
```


[!INCLUDE[footer-include](../includes/footer-banner.md)]
