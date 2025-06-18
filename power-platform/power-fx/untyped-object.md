---
title: Dynamic values
description: Reference information about Dynamic values in Power Fx.
author: gregli

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 6/11/2025
ms.subservice: power-fx
ms.author: jorisde
search.audienceType: 
  - maker
contributors:
  - gregli
  - mduelae
---
# Dynamic values

**Dynamic** is a data type in Power Fx that can hold any data structure, complex or simple. It can't be used directly and conversion to another data type at runtime, either explicitly or implicitly. Fields of records in a **Dynamic** value can be accessed using the dot notation, and existence of fields is only verified at runtime.

There are two ways to create a **Dynamic** value:
- Using the [**ParseJSON** function](./reference/function-parsejson.md).
- Using a connector that returns a "dynamic" type.

> [!NOTE]
> **Dynamic** was formerly called **UntypedObject**. Only the name has changed, there is no change in the semantics. The only place where the name would have appeared in a formula is in the experimental versions of User Defined Functions and User Defined Types.

## Simple Types

The value of a variable containing a **Dynamic** value can't be used directly. You always have to correctly type it using the corresponding type constructor or by converting it to a specific type with **AsType** and **ParseJSON** functions.

The following examples convert the value of a **Dynamic** variable named `DynValue`.

```powerapps-dot
Text(DynValue)
```
```powerapps-dot
Value(DynValue)
```

The following table lists the data types and corresponding functions to convert **Dynamic** to that data type.

| Data Type | Function  | Description |
| --- | --- | --- |
| Boolean | [Boolean()](./reference/function-boolean.md) | When converting **Dynamic** to **Boolean**, the underlying value has to represent a boolean or a type that can be automatically converted (such as a string "true"). |
| Color | [ColorValue() or RGBA()](./reference/function-colors.md) | Colors can be represented in Cascading Style Sheet (CSS) color definition notation as a string, or as individual RGBA components. The **Dynamic** can be converted directly from a Cascading Style Sheet (CSS) color definition string using the [ColorValue()](./reference/function-colors.md) function, or from individual RGBA [numbers](./reference/function-value.md) into color using the [RGBA()](./reference/function-colors.md) function. |
| Currency, Number | [Value()](./reference/function-value.md) | When converting **Dynamic** to **Number**, the underlying value has to represent a number or a type that can be automatically converted (such as a string "123.456"). |
| Date, DateTime, Time | [DateValue(), TimeValue() or DateTimeValue()](./reference/function-datevalue-timevalue.md) | Date, time and datetime can be directly converted from **Dynamic** to their respective type, when represented in ISO 8601 format. Other formats must first be converted to text using the [Text()](./reference/function-text.md) function and then passed into the [DateValue(), TimeValue() or DateTimeValue()](./reference/function-datevalue-timevalue.md) function that by default will use the language of the current user's settings to interpret the date and time. |
| GUID | [GUID()](./reference/function-guid.md) | A **Dynamic** value can be directly converted to GUID if the underlying object represents a GUID, or if it represents a string. |
| HyperLink, Image, Media | [Text()](./reference/function-text.md) | These data types are text data types, and can be converted to text and then used in Power Fx. |
| Choice, Two Option | [Switch() or If()](./reference/function-if.md) | **Choices** and **two options** are presented as localized strings in Power Fx. **Choices** are backed by a number and **two options** as booleans. There's no direct conversion from boolean, number or string to a **choice** or **two option**, but the [Switch()](./reference/function-if.md) or [If()](./reference/function-if.md) functions can be used on the boolean, text or number value to correctly assign the **choice** or **two option** value. |
| Record | n/a | There's no direct conversion from **Dynamic** to a record structure, but individual fields can be retrieved from the **Dynamic** to create a new record. |
| Record Reference | n/a | Record references are unique to datasources and have no meaningful representation in **Dynamic**. |
| Table | [Table()](./reference/function-table.md) and [ForAll()](./reference/function-forall.md) | An **Dynamic** can represent an array, which can be converted into a table. These objects can be arrays of records, or arrays of values that are effectively single-column tables. [ForAll()](./reference/function-forall.md) can be used to create a table with fully typed records. Review the examples further down this article for more information. |
| Text | [Text()](./reference/function-text.md) | Text can be directly converted. If a **Dynamic** value represents a number, you need to convert the **Dynamic** to number first using [Value()](./reference/function-value.md) before converting to text. |

## Record Types

You can access fields on a variable representing a **Dynamic** record using regular dot-notation used for records. However, the existence of the fields won't be verified until runtime. As a result, there's also no intellisense available. If a field doesn't exist or has an underlying **null** value, accessing it will result in a **Blank()** value.

Each field on the record is also of type **Dynamic**, and needs to be properly typed. The field can be a dynamic record of simple type. In case it's a record, you can chain the dot-notation. If any field in the chain doesn't exist, **Blank()** is returned.

The following examples use fields from a **Dynamic** variable named `DynRecord`.

```powerapps-dot
Text(DynRecord.StringField)
```
```powerapps-dot
Value(DynRecord.Field.ChildField)
```

In case a field name consists of an invalid identifier name, for example when the field names starts with a number or contains invalid characters such as a hyphen, you can put the field names in single quotes:

```powerapps-dot
dynamic.'01'
dynamic.'my-field'
```

### Dynamic column access

Sometimes the names of columns in a record will be dynamic. Use the [**ColumnNames** function](reference/function-columnnames-column.md) to determine which column names are available in a record, and then use the [**Column** function](reference/function-columnnames-column.md) to retrieve the value of a named column.

For example, 
```powerapps-dot
LettersUsed = ParseJSON( "{ ""d"": 2, ""p"": 3 }" );

Concat( ColumnNames( LettersUsed ) As Names, Names.Value, ", " )
// returns "d, p"

Sum( ForAll( ColumnNames( LettersUsed ) As Names, Column( LettersUsed, Names.Value ) ), Value )
// returns 5
```

## Arrays

A **Dynamic** variable can contain an array. Even though the array could be either an array of records or array of simple types, converting the **Dynamic** array to a table using the [Table()](./reference/function-table.md) function will always result in a single-column table of **Dynamic**. Functions such as [ForAll()](./reference/function-forall.md) and [Index()](./reference/function-first-last.md) do not require you to first create a **Table()** and as result don't require you to use the single-column `Value` field,

For example, to get the second number in an array of **Dynamic** containing number values ( `[1, 2, 3]` ), the following formula can be used to retrieve the second row in the table and convert column to a number:

```powerapps-dot
Value( Index( UOArray, 2 ) )
```

If the **Dynamic** was converted to a **Table()** first, the second row in the result single-column table is a `Value` column containing the **Dynamic**:

```powerapps-dot
Value( Index( Table( UOArray ), 2 ).Value )
```

For an array of records that have a text column called `Field`, the same logic applies. The **Dynamic** can be accessed directly, or if using the **Table()** function will result in a single-column table of **Dynamic**.

The `Field` column can be access directly from the **Dynamic** returned by the **Index()** function.

```powerapps-dot
Text( Index( UORecordArray, 2 ).Field )
```

When using the **Table()** function, first retrieve the single-column `Value` column to get the **Dynamic**, then access the `Field` column:

```powerapps-dot
Text( Index( Table( UORecordArray ), 2 ).Value.Field )
```

To convert an array of records to a typed table, you can use the [ForAll()](./reference/function-forall.md) function and convert each individual field.

```powerapps-dot
ForAll( UORecordArray, { FirstField: Value(ThisRecord.FirstField), SecondField: Text(ThisRecord.SecondField) } )
```

If the **Dynamic** is first converted to a table, again, the resulting single-column table of **Dynamic** will require you to use the `Value` column to get the fields.

```powerapps-dot
ForAll( Table(UORecordArray), { FirstField: Value(ThisRecord.Value.FirstField), SecondField: Text(ThisRecord.Value.SecondField) } )
```

## Converting to typed records and tables

> [!IMPORTANT]
> - Using **AsType** and **IsType** with **Dynamic** values is an experimental feature.
> - Experimental features aren't meant for production use and may not be complete. These features are available before an official release so that you can get early access and provide feedback. More information: [**Understand experimental, preview, and retired features in canvas apps**](/power-apps/maker/canvas-apps/working-with-experimental-preview)
> - The behavior that this article describes is available only when the **User-defined types** experimental feature in [**Settings &gt; Upcoming features &gt; Experimental**](/power-apps/maker/canvas-apps/working-with-experimental-preview#controlling-which-features-are-enabled) is turned on (it's off by default).
> - Your feedback is valuable to us. Let us know what you think in the [**Power Apps experimental features community forum**](https://community.powerplatform.com/forums/thread/details/?threadid=c8824a08-8198-ef11-8a69-7c1e52494f33).

Instead of converting each simple value individually, the **ParseJSON**, [**IsType**](reference/function-astype-istype.md), and [**AsType**](reference/function-astype-istype.md) functions can be used to convert a **Dynamic** to a typed object in bulk. Use the [**Type**](reference/function-type.md) function to create a type that will map the dynamic structure to a typed structure.

For example, here we are interpreting the JSON strings as date time values, without needing to call the [**DateTimeValue** function](reference/function-datevalue-timevalue.md):

```powerapps-dot
Eclipse = ParseJSON( "{ ""Start"": ""2026-08-12T18:26:00.000Z"", ""End"": ""2026-08-12T18:33:00.000Z"" }",
                     Type( { Start: DateTime, End: DateTime } ) );

DateDiff( Eclipse.Start, Eclipse.End, TimeUnit.Minutes )
// 7
```

[!INCLUDE[footer-include](../includes/footer-banner.md)]
