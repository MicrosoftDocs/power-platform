---
title: ParseJSON function
description: Reference information including syntax and examples for the ParseJSON function.
author: gregli

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 06/18/2025
ms.subservice: power-fx
ms.author: gregli
search.audienceType: 
  - maker
contributors:
  - gregli
  - mduelae
no-loc: ["ParseJSON"]
---
# ParseJSON function
[!INCLUDE[function-parsejson-applies-to](includes/function-parsejson-applies-to.md)]



Interprets a JSON string and returns a [Dynamic value](../untyped-object.md) or a specific typed value if a type is provided.

> [!IMPORTANT]
> - Using the second argument to **ParseJSON** to convert to a typed object is an experimental feature.
> - Experimental features aren't meant for production use and may have restricted functionality. These features are available before an official release so that you can get early access and provide feedback. More information: [**Understand experimental, preview, and retired features in canvas apps**](/power-apps/maker/canvas-apps/working-with-experimental-preview)
> - The behavior that this article describes is available only when the **User-defined types** experimental feature in [**Settings &gt; Upcoming features &gt; Experimental**](/power-apps/maker/canvas-apps/working-with-experimental-preview#controlling-which-features-are-enabled) is turned on (it's off by default).
> - Your feedback is very valuable to us. Please let us know what you think in the [**Power Apps experimental features community forum**](https://community.powerplatform.com/forums/thread/details/?threadid=c8824a08-8198-ef11-8a69-7c1e52494f33).

## Description
The ParseJSON function parses a valid JSON string and returns a [Dynamic](../untyped-object.md) value representing the JSON structure. 

Optionally, use the second argument to convert the JSON to a typed object that can be directly used in Power Fx formulas. This makes the result easier to consume as conversions and coercions at the point of use are no longer required. The untyped JSON is mapped to the type with these rules:
- Columns in the type which are not present in the JSON are filled in with *blank*.
- Columns in the JSON which are not present in the type are ignored.
- Columns that are both in the type and JSON, the JSON value must be coercible to the type.

The ParseJSON function can return errors if the text isn't valid JSON according to the JavaScript Object Notation (JSON) format described in [ECMA-404](https://www.ecma-international.org/publications-and-standards/standards/ecma-404) and [IETF RFC 8259](https://tools.ietf.org/html/rfc8259).

## Syntax
**ParseJSON**( *JSONString* [ , *Type* ] )

- *JSONString* – Required. The JSON structure represented as text.
- *Type* - Optional. The Power Fx type definition for the JSON structure. Without this argument, **ParseJSON** returns a dynamic value; with it the function returns a specific typed value.

## Converting Dynamic values
Without the second argument, ParseJSON returns a [Dynamic value](../untyped-object.md) which requires explicit conversion of field values in supported data types. The following table lists the [data types](../data-types.md) in Power Apps and a corresponding JSON data type and how to convert it.

| Data type | JSON examples | Description  | Example conversion |
| --- | --- | --- | --- |
| Boolean | `{ "bool": true }` | Boolean is an explicit type in JSON and can be directly converted. | **Boolean( ParseJSON("{ ""bool"": true }").bool )** |
| Color | `{ "color": "#102030" }`<br/>`{ "r": 255, "g": 128, "b": 0, "a": 0.5 }` | There's no color type in JSON. Color values can be created from RGBA integers or hexadecimal strings. | **ColorValue( ParseJSON( "{ ""color"": ""#102030"" }" ).color )**<br/>**With( { uo: ParseJSON( "{ ""r"": 255, ""g"": 128, ""b"": 0, ""a"": 0.5 }" ) }, RGBA( Value( uo.r ), Value( uo.g ), Value( uo.b ), Value( uo.a ) ) )** |
| Currency, Number | `{ "numbervalue": 123.5 }` | Numbers are represented directly in JSON with a period ( . ) as the decimal separator. | **Value( ParseJSON("{ ""numbervalue"": 123.5 }").numbervalue )** |
| Date, DateTime, Time | `{ "start": "2022-05-10" }`<br/>`{ "start": "23:12:49.000" }` | JSON doesn't have a date or time type so can only represent dates and times as strings. A dynamic value can be directly converted from a string in ISO 8601 format to a date, time or datetime. For other formats, first convert the JSON field to text using the [Text()](function-text.md) function and then use the [DateValue(), TimeValue() or DateTimeValue()](function-datevalue-timevalue.md) function that by default will use the language of the current user's settings. | **DateValue( ParseJSON("{ ""appointment"": ""2022-05-10"" }").appointment )**<br/>**DateValue( Text( ParseJSON("{ ""appointment"": ""May 5, 2022"" }").appointment ) )** |
| GUID | `{ "id": "123e4567-e89b-12d3-a456-426655440000" }` | JSON doesn't have a data type for GUIds so they can only be represented as strings. | **GUID( ParseJSON("{ ""id"": ""123e4567-e89b-12d3-a456-426655440000"" }").id )** |
| HyperLink, Image, Media | `{ "URI": "https://northwindtraders.com/logo.jpg" }` | These data types are text data types, and can be converted to text and then used in Power Apps. | **Text( ParseJSON("{ ""URI"": ""https://northwindtraders.com/logo.jpg"" }").URI )** |
| Choice | `{ "status": 1 }`<br/>`{ "status": "Closed" }` | Choices are presented as localized strings, backed by a number. The [JSON() function](function-json.md) serializes a choice to its backing number. There's no direct conversion from number or string to a choice, but the [Switch()](function-if.md) or [If()](function-if.md) functions can be used on the text or number value. | **Switch( Value( ParseJSON( "{ ""status"": 1 }" ).status ), 0, Status.Open, 1, Status.Closed )** |
| Record | `{ "field": "value" }` | There's no direct conversion from a JSON object to a record structure, but individual fields can be retrieved from the **Dynamic** value to form a record. | **{ field: Text( ParseJSON( "{ ""field"": ""value"" }" ).field ) }** |
| Record Reference | n/a | Record references are unique to datasources and can't be serialized or unserialized. Field values that represent unique keys could be used in JSON to identify records that can then be looked up. | n/a |
| Table | `[ { "id": 1, "name": "one" }, { "id": 2, "name": "two" } ]`<br/>`[1, 2, 3]` | JSON can contain arrays, which can be converted into tables. These values can be arrays of records, or arrays of values that are effectively single column tables. **ParseJSON()** arrays can only be converted into a single column table of **Dynamic** values, and can be used as such or converted to typed tables of records using **ForAll()**. | **ForAll( Table( ParseJSON( "[ { ""id"": 1, ""name"": ""one"" }, { ""id"": 2, ""name"": ""two"" } ]" ) ), { id: Value(ThisRecord.Value.id), name: Text(ThisRecord.Value.name) } )** |
| Text | `{ "stringField": "this is text" }` | Text is an explicit type in JSON and can be directly converted. | **Text( ParseJSON( "{ ""stringField"": ""this is text"" }").stringField )** |
| Two options | `{ "available": true }`<br/>`{ "available": "Yes" }` | Two options are presented as localized strings, backed by a boolean. The [JSON() function](function-json.md) serializes a two options to its boolean value. There's no direct conversion from boolean, number or string to a two options, but the [Switch()]() or [If()]() functions can be used on the text, number or boolean value. | **Switch( Boolean( ParseJSON( "{ ""available"": true }" ).available ), false, Availability.No, true, Availability.Yes )** |

## Examples

### Accessing field values
Given the following JSON string in a variable named `JsonString`
```JSON
{ "parent": { "child": "text value" }, "number": 567 }
```

1. The following formula returns the text `text value`:
    ```power-fx
    Text( ParseJSON( JsonString ).parent.child )
    ```
2. The following formula returns the number `567`:
    ```power-fx
    Value( ParseJSON( JsonString ).number )
    ```

In case a field name consists of an invalid identifier name, you can put the field names in single quotes.
Given the following JSON string in a variable named `JsonString`
```JSON
{ "0": { "child-field": "text value" } }
```

1. The following formula returns the text `text value`:
    ```power-fx
    Text( ParseJSON( JsonString ).'0'.'child-field' )
    ```

### Blanks
Given the following JSON string in a variable named `JsonString`
```JSON
{ "text": "text value" , "number": 567, "empty": null }
```

1. Attempting to access non-existing fields returns **Blank()**. The following formula returns `true`:
    ```power-fx
    IsBlank( Text( ParseJSON( JsonString ).parent.child ) )
    ```
2. JSON `null` values are considered **Blank()**. The following formula returns `true`:
    ```power-fx
    IsBlank( Text( ParseJSON( JsonString ).empty ) )
    ```

### Simple Arrays
Given the following JSON string in a variable named `JsonString`
```JSON
{ "array": [1, 2, 3] }
```

1. Accessing the second number in the array field's single-column table of **Dynamic** values and converting to a number using **Value()** returns `2`:
    ```power-fx
    Value( Index( ParseJSON( JsonString ).array, 2 ) )
    ```
2. Converting the single-column table of **dynamic** values in the array field, to a single column table of numbers `{ Value: 1 }, { Value: 2 }, { Value: 3 }`:
    ```power-fx
    ForAll( ParseJSON( JsonString ).array, Value( ThisRecord ) )
    ```

### Arrays of Records
Given the following JSON string in a variable named `JsonString`
```JSON
{ "array": [
    { "id": 1, "name": "One"},
    { "id": 2, "name": "Two"}
    ] }
```

1. Converting to a typed table of records directly with **ForAll()** can be done by using `ThisRecord.[fieldname]` to access **dynamic** fields and convert them to specific types:

    ```power-fx
    ForAll( ParseJSON( JsonString ).array, { id: Value(ThisRecord.id), name: Text(ThisRecord.name) })
    ```

### Array to Table

1. Converting **dynamic** values to a table by using the **Table()** function results in a single-column table of **dynamic** values. The object needs to then be accessed using `Value` (single) column and be converted to types as explained previously.

Given the following JSON string in a variable named `JsonString`
```JSON
{ "array": [1, 2, 3] }
```

**Table()** returns a single-column table of **dynamic** values with a single-column Value for number in the array...

   ```power-fx
    Set(untypedTable, Table( ParseJSON( JsonString ).array ));
    
    Value( Index(untypedTable, 1).Value.Value )
    ```

Given the following JSON string in a variable named `JsonString`
```JSON
{ "array": [
    { "id": 1, "name": "One"},
    { "id": 2, "name": "Two"}
    ] }
```

**Table()** returns a single-column table of **dynamic** values that represents each json object in the array.

  ```power-fx
    Set(untypedTable, Table( ParseJSON( JsonString ).array ) );
    
    Text( Index(untypedTable, 1).Value.name )
   ```

[!INCLUDE[footer-include](../../includes/footer-banner.md)]







































































































































