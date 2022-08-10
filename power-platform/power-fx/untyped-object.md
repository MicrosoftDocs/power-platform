---
title: Untyped Object Data Type in Power Fx
description: Reference information about the untyped object type in Power Fx.
author: jorisdg

ms.topic: reference
ms.custom: canvas
ms.reviewer: tapanm
ms.date: 5/10/2021
ms.subservice: power-fx
ms.author: jorisde
search.audienceType: 
  - maker
search.app: 
  - PowerApps
contributors:
  - jorisdg
---
# Untyped Object data type in Power Fx

## Overview

**Untyped object** is a data type in Power Fx that can hold any data structure, complex or simple. It cannot be used directly and requires explicit conversion to a data type. Fields in records in an **untyped object** can be accessed using the dot notation, and existence of fields is only verified at runtime.

**Untyped object** is the return type of specific untyped providers. Currently, only the [ParseJSON()](./reference/function-parsejson.md) function returns **untyped object**.

## Simple Types

The value of a variable of type **untyped object** cannot be used directly. You always have to correctly type it using the corresponding type constructor.

The following examples use fields from an **untyped object** variable named `UOValue`.

```powerapps-dot
Text(UOValue)
```
```powerapps-dot
Value(UOValue)
```

The following table lists the data types and corresponding functions to convert **untyped object** to that data type.

| Data Type | Function  | Description |
| --- | --- | --- |
| Boolean | [Boolean()](./reference/function-boolean.md) | When converting **untyped object** to **boolean**, the value may need to be converted to [text](./reference/function-text.md) or [number](./reference/function-value.md) first if the **untyped object** represents the **boolean** in those types. |
| Color | [ColorValue() or RGBA()](./reference/function-colors.md) | Colors can be represented in hexadecimal notiation as a string, or as individual RGBA components. In either case the **untyped object** needs to be first converted to individual RGBA [numbers](./reference/function-value.md), or to a [text](./reference/function-text.md) string containing the hexadecimal notation. |
| Currency, Number | [Value()](./reference/function-value.md) | Numbers in **untyped object** can be directly converted to numbers. However, if the original **untyped object** value was represented as text, for example as `ParseJSON("""123""")` then it must first be converted to [text](./reference/function-text.md) before converting to a number. |
| Date, DateTime, Time | [DateValue(), TimeValue() or DateTimeValue()](./reference/function-datevalue-timevalue.md) | Date, time and datetime can be directly converted from **untyped object** to their respective type, when represented in ISO 8601 format. Other formats must first be converted to text using the [Text()](./reference/function-text.md) function and then passed into the [DateValue(), TimeValue() or DateTimeValue()](./reference/function-datevalue-timevalue.md) function which by default will use the language of the current user's settings to interpret the date and time. |
| GUID | [GUID()](./reference/function-guid.md) | An **untyped object** can be directly converted to GUID. |
| HyperLink, Image, Media | [Text()](./reference/function-text.md) | These data types are text data types, and can be converted to text and subsequently used in Power Fx. |
| Choice, Two Option | [Switch() or If()](./reference/function-if.md) | **Choices** and **two options** are presented as localized strings in Power Fx. **Choices** are backed by a number and **two options** as booleans. There is no direct conversion from boolean, number or string to a **choice** or **two option**, but the [Switch()](./reference/function-if.md) or [If()](./reference/function-if.md) functions can be used on the boolean, text or number value to the correctly assign the **choice** or **two option** value. |
| Record | n/a | There is no direct conversion from **untyped object** to a record structure, but individual fields can be retrieved from the **untyped object** to create a new record. |
| Record Reference | n/a | Record references are unique to datasources and have no meaningful representation in **untyped objects**. |
| Table | [Table()](./reference/function-table.md) and [ForAll()](./reference/function-forall.md) | An **untyped object** can represent an arrays, which can be converted into a table. These can be arrays of records, or arrays of values that are effectively single-column tables. [ForAll()](./reference/function-forall.md) can be used to create a table with fully typed records. Review the examples further down this article for more information. |
| Text | [Text()](./reference/function-text.md) | Text can be directly converted. If an **untyped object** represents a number, you need to convert the **untyped object** to number first using [Value()](./reference/function-value.md) before converting to text. |

## Record Types

You can access fields on a variable representing an **untyped object** record using regular dot-notation used for records. However, the existence of the fields will not be verified until runtime. As a result, there is also no intellisense available. If a field does not exist or has an underlying **null** value, accessing it will result in a **Blank()** value.

Each field on the record is also of type **untyped object**, and needs to be properly typed. The field can be an untyped record of simple type. In case it is a record, you can chain the dot-notation. If any field in the chain does not exist, **Blank()** is returned.

The following examples use fields from an **untyped object** variable named `UORecord`.

```powerapps-dot
Text(UORecord.StringField)
```
```powerapps-dot
Value(UORecord.Field.ChildField)
```

## Arrays

An **untyped object** variable can contain an array. Even though the array could be either an array of records or array of simple types, converting the **untyped object** array to a table using the [Table()](./reference/function-table.md) function will always result in a single-column table of **untyped objects**.

For example, to get the second number in an array of **untyped object** containing number values ( `[1, 2, 3]` ), the following formula can be used to retrieve the second row in the table and convert the single-column `Value` column to a number:

```powerapps-dot
Value( Index( Table(UOArray), 2 ).Value )
```

For an array of records that have a text column called `Field`, the **Table()** function will convert the **untyped object** array of records to a single-column table of **untyped object**. To get the `Field` column, first retrieve the single-column `Value` to get the **untyped object**, then access the `Field` column:

```powerapps-dot
Text( Index( Table(UORecordArray), 2 ).Value.Field )
```

To convert an array of records to a typed table, you can use the [ForAll()](./reference/function-forall.md) function to get the single-column `Value` representing the **untyped object** record, and converting each individual field:

```powerapps-dot
ForAll( Table(UORecordArray), { FirstField: Value(ThisRecord.Value.FirstField), SecondField: Text(ThisRecord.Value.SecondField) } )
```


[!INCLUDE[footer-include](../includes/footer-banner.md)]