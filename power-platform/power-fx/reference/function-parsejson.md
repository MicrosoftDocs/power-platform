---
title: ParseJSON function in Power Apps
description: Reference information including syntax and examples for the ParseJSON function in Power Apps.
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
# ParseJSON function in Power Apps
Interprets a JSON string and returns an [untyped object](../untyped-object.md).

## Description
The ParseJSON function will parse a valid JSON string and return an [untyped object](../untyped-object.md) representing the JSON structure. 

The ParseJSON function may return errors if the text is not valid JSON according to the JavaScript Object Notation (JSON) format described in [ECMA-404](https://www.ecma-international.org/publications/files/ECMA-ST/ECMA-404.pdf) and [IETF RFC 8259](https://tools.ietf.org/html/rfc8259).


Any JSON array becomes a single-column table of **untyped object**, even if the underlying data is a record.

## Syntax
**ParseJSON**( *JSONString* )

* *JSONString* – Required. The JSON structure represented as text.

## Converting Untyped Object Data Type
ParseJSON returns an [untyped object](../untyped-object.md) which requires explicit conversion of field values in supported data types. The following table lists the [data types](data-types.md) in Power Apps and a corresponding JSON data type and how to convert it.

| Data Type | JSON Examples | Description  | Example Conversion |
| --- | --- | --- | --- |
| Boolean | `{ "bool": true }` | Boolean is an explicit type in JSON and can be directly converted. | **Boolean( ParseJSON("{ ""bool"": true }").bool )** |
| Color | `{ "color": "#102030" }`<br/>`{ "r": 255, "g": 128, "b": 0, "a": 0.5 }` | There is no color type in JSON. Color values can be created from RGBA integers or hexadecimal strings. | **ColorValue( Text( ParseJSON( "{ ""color"": ""#102030"" }" ).color ) )**<br/>**RGBA( Value( ParseJSON( "{ ""r"": 255, ""g"": 128, ""b"": 0, ""a"": 0.5 }" ).r ), Value( ParseJSON( "{ ""r"": 255, ""g"": 128, ""b"": 0, ""a"": 0.5 }" ).g ), Value( ParseJSON( "{ ""r"": 255, ""g"": 128, ""b"": 0, ""a"": 0.5 }" ).b ), Value( ParseJSON( "{ ""r"": 255, ""g"": 128, ""b"": 0, ""a"": 0.5 }" ).a ) )** |
| Currency, Number | `{ "numbervalue": 123.5 }` | Numbers are represented directly in JSON with a period ( . ) as the decimal separator. | **Value( ParseJSON("{ ""numbervalue"": 123.5 }").numbervalue )** |
| Date, DateTime, Time | `{ "start": "2022-05-10" }`<br/>`{ "start": "23:12:49.000" }` | JSON does not have a date or time type so can only represent dates and times as strings. An untyped object can be directly converted from a string in ISO 8601 format to a date, time or datetime. For other formats, first convert the JSON field to text using the [Text()](function-text.md) function and then use the [DateValue(), TimeValue() or DateTimeValue()](function-datevalue-timevalue.md) function which by default will use the language of the current user's settings. | **DateValue( ParseJSON("{ ""appointment"": ""2022-05-10"" }").appointment )**<br/>**DateValue( Text( ParseJSON("{ ""appointment"": ""May 5, 2022"" }").appointment ) )** |
| GUID | `{ "id": "123e4567-e89b-12d3-a456-426655440000" }` | JSON does not have a data type for GUIds so they can only be represented as strings. | **GUID( ParseJSON("{ ""id"": ""123e4567-e89b-12d3-a456-426655440000"" }").id )** |
| HyperLink, Image, Media | `{ "URI": "https://northwindtraders.com/logo.jpg" }` | These data types are text data types, and can be converted to text and subsequently used in Power Apps. | **Text( ParseJSON("{ ""URI"": ""https://northwindtraders.com/logo.jpg"" }").URI )** |
| Choice | `{ "status": 1 }`<br/>`{ "status": "Closed" }` | Choices are presented as localized strings, backed by a number. The [JSON() function](function-json.md) serializes a choice to its backing number. There is no direct conversion from number or string to a choice, but the [Switch()](function-if.md) or [If()](function-if.md) functions can be used on the text or number value. | **Switch( Value( ParseJSON( "{ ""status"": 1 }" ).status ), 0, Status.Open, 1, Status.Closed )** |
| Record | `{ "field": "value" }` | There is no direct conversion from a JSON object to a record structure, but individual fields can be retrieved from the **untyped object** to form a record. | **{ field: Text( ParseJSON( "{ ""field"": ""value"" }" ).field ) }** |
| Record Reference | n/a | Record references are unique to datasources and cannot be serialized or unserialized. Field values that represent unique keys could be used in JSON to identify records that can then be looked up. | n/a |
| Table | `[ { "id": 1, "name": "one" }, { "id": 2, "name": "two" } ]`<br/>`[1, 2, 3]` | JSON can contain arrays, which can be converted into tables. These can be arrays of records, or arrays of values that are effectively single column tables. **ParseJSON()** arrays can only be converted into a single column table of **untyped objects**, and can be used as such or converted to typed tables of records using **ForAll()**. | **ForAll( Table( ParseJSON( "[ { ""id"": 1, ""name"": ""one"" }, { ""id"": 2, ""name"": ""two"" } ]" ) ), { id: Value(ThisRecord.Value.id), name: Text(ThisRecord.Value.name) } )** |
| Text | `{ "stringField": "this is text" }` | Text is an explicit type in JSON and can be directly converted. | **Text( ParseJSON( "{ ""stringField"": ""this is text"" }").stringField )** |
| Two option | `{ "available": true }`<br/>`{ "available": "Yes" }` | Two options are presented as localized strings, backed by a boolean. The [JSON() function](function-json.md) serializes a two option to its boolean value. There is no direct conversion from boolean, number or string to a two option, but the [Switch()]() or [If()]() functions can be used on the text, number or boolean value. | **Switch( Boolean( ParseJSON( "{ ""available"": true }" ).available ), false, Availability.No, true, Availability.Yes )** |

## Examples

### Accessing field values
Given the following JSON string in a variable named `JsonString`
```JSON
{ "parent": { "child": "text value" }, "number": 567 }
```

1. The following formula returns the text `text value`:
    ```powerapps-dot
    Text( ParseJSON( JsonString ).parent.child )
    ```
2. The following formula returns the number `567`:
    ```powerapps-dot
    Value( ParseJSON( JsonString ).number )
    ```

### Blanks
Given the following JSON string in a variable named `JsonString`
```JSON
{ "text": "text value" , "number": 567, "empty": null }
```

1. Attempting to access non-existing fields returns **Blank()**. The following formula returns `true`:
    ```powerapps-dot
    IsBlank( Text( ParseJSON( JsonString ).parent.child ) )
    ```
2. JSON `null` values are considered **Blank()**. The following formula returns `true`:
    ```powerapps-dot
    IsBlank( Text( ParseJSON( JsonString ).empty ) )
    ```

### Simple Arrays
Given the following JSON string in a variable named `JsonString`
```JSON
{ "array": [1, 2, 3] }
```

1. Accessing the second number in the array field's single-column table of **untyped object** and converting to a number using **Value()** returns `2`:
    ```powerapps-dot
    Value( Index( ParseJSON( JsonString ).array, 2 ) )
    ```
2. Converting the single-column table of **untyped object** in the array field, to a single column table of numbers `{ Value: 1 }, { Value: 2 }, { Value: 3 }`:
    ```powerapps-dot
    ForAll( Table( ParseJSON( JsonString ).array ), Value( ThisRecord.Value ) )
    ```

### Arrays of Records
Given the following JSON string in a variable named `JsonString`
```JSON
{ "array": [
    { "id": 1, "name": "One"},
    { "id": 2, "name": "Two"}
    ] }
```

1. Converting to a typed table of records requires accessing the **untyped object** in the single-column table returned by **Table()**, then using `ThisRecord.Value` in **ForAll()** to access **untyped object** fields and convert them to known types:
    ```powerapps-dot
    ForAll( Table( ParseJSON( JsonString ).array ), { id: Value(ThisRecord.Value.id), name: Text(ThisRecord.Value.name) })
    ```

[!INCLUDE[footer-include](../../includes/footer-banner.md)]