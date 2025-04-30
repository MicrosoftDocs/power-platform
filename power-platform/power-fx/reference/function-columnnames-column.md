---
title: ColumnNames and Column functions
description: Reference information including syntax and examples for the ColumnNames and Column functions.
author: carlosff

ms.topic: reference
ms.custom: canvas
ms.date: 3/22/2024
ms.subservice: power-fx
ms.author: carlosff
search.audienceType: 
  - maker
contributors:
  - carlosff
---
# ColumnNames and Column functions
[!INCLUDE[function-columnnames-column-applies-to](includes/function-columnnames-column-applies-to.md)]



Retrieves column names and values from an [untyped object](../untyped-object.md).

## Description
The ColumnNames function returns the names of all columns from an [untyped record](../untyped-object.md), returning a table with all the names from that record.

The Column function returns the value of a property from an [untyped record](../untyped-object.md) with the given column name. The value is returned as an [untyped object](../untyped-object.md).

The ColumnNames and Column functions return errors if the [untyped object](../untyped-object.md) doesn't represent a record (that is, if it represents a table or a scalar or primitive value).

## Syntax
**ColumnNames**( *UntypedRecord* )

* *UntypedRecord* – Required. An [untyped object](../untyped-object.md) that represents a record.

**Column**( *UntypedRecord*, *ColumnName* )

* *UntypedRecord* – Required. An [untyped object](../untyped-object.md) that represents a record.
* *ColumnName* - Required. The name of the column to be retrieved from the given record.

## Examples

### Accessing field values
Given the following JSON string in a variable named `JsonString`
```JSON
{ "name": "Seattle", "population": 737000 }
```

1. The following formula returns a single-column table with a `Value` column containing the following values: "name", "population":
    ```power-fx
    ColumnNames( ParseJSON( JsonString ) )
    ```
2. The following formula returns the number `737000`:
    ```power-fx
    Value( Column( ParseJSON( JsonString ), "population" ) )
    ```
    2.1. Notice that this is similar to the `.` operator for [untyped records](../untyped-object.md#record-types), but the column name doesn't have to be known beforehand.

3. The following formula returns the text value `"name: Seattle, population: 737000"`:
    ```power-fx
    With(
        { untyped: ParseJSON( JsonString ) },
        Concat(
            ColumnNames( untyped ),
            $"{Value}: {Column( untyped, Value )}",
            ", "))
    ```

### Blanks
Given the following JSON string in a variable named `JsonString`
```JSON
{ "text": "text value" , "number": 567, "empty": null }
```

1. Attempting to access nonexisting fields returns **Blank()**. The following formula returns `true`:
    ```power-fx
    IsBlank( Column( ParseJSON( JsonString ), "does not exist" ) )
    ```
2. JSON `null` values are considered **Blank()**. The following formula returns `true`:
    ```power-fx
    IsBlank( Column( ParseJSON( JsonString ), "empty" ) )
    ```

### Nonrecords
Calling the Column or ColumnNames functions with untyped objects that don't represent records return an error. All of those expressions below are erroneous:

| Formula                                          | Reason for error                                 |
| ------------------------------------------------ | ------------------------------------------- |
| **ColumnNames( ParseJSON ( "[1, 2, 3]" ) )**       | Untyped object represents an array          |
| **Column( ParseJSON ( "23.45" ), "Value" )**           | Untyped object represents a number          |
| **ColumnNames( ParseJSON ( """hello""" ) )**       | Untyped object represents a text            |
| **Column( ParseJSON ( "{""a"":false}" ).a, "a" )** | Untyped object represents a boolean value   |


[!INCLUDE[footer-include](../../includes/footer-banner.md)]









































































































































