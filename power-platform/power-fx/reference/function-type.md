---
title: Type function
description: Reference information including syntax and examples for the Type function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 10/28/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# Type function

**Applies to:** :::image type="icon" source="media/yes-icon.svg" border="false"::: Canvas apps

Returns a user defined type.

## Description

Power Fx is a strongly typed language. The parameters and return values of built-in functions are pre-defined and usage is checked for consistency when writing a formula. You will need to provide type information when creating your own user defined functions. User defined types can also be useful with JSON payloads returned by web APIs that become untyped values.

Basic types such as **Text** and **Number** can be used directly without the **Type** function. 

Use the **Type** function to create a custom type made up of tables and records for:
- Passing a table or record to a user defined function.  
- Returning a table or record from a user defined function.
- Converting an untyped record to a typed record for easier use and error checking.

The **Type** function, and the type value it returns, can only be used in specific places such as the second argument to **ParseJSON**. In Canvas apps, the **Type** function can only be used with a named formula in **App.Formulas**.

## Type specification

Types are specified in the same manner as a standard record or table, with values replaced by type names.

For example, consider the following definitions:

```powerapps-dot
// Table of books
bookTable = 
  [ { Title: "A Study in Scarlet", Author: "Sir Arthur Conan Doyle", Published: 1887 }, 
    { Title: "And Then There Were None", Author: "Agatha Christie", Published: 1939 },
    { Title: "The Marvelous Land of Oz", Author: "L. Frank Baum", Published: 1904 } ];

// Type definition for a single book
bookRecordType := Type( { Title: Text, Author: Text, Published: Number } );

// Type definition for a table of books
bookTableType := Type( [ bookRecordType ] );
```

Notice how the actual title text `"A Study in Scarlet"` has been replaced with the type name `Text` in the type definition, a placeholder for any text value.  A parameter or variable of type `bookRecordType` can hold one of the books in `bookTable`, while `bookTableType` can hold the entire table.  With these types in place, we can define these user defined functions:

```powerapps-dot
SortedBooks( books: bookTableType ): bookTableType = 
    SortByColumns( bookTable, Author, SortOrder.Ascending, Title, SortOrder.Ascending );

PublishedInLeapYear( book: bookRecordType ): Boolean = 
    Mod( book.Published, 4 ) = 0 And 
    (Mod( book.Published, 100 ) <> 0 Or Mod( book.Published, 400 ) = 0);
```

We can also use the `bookRecordType` to parse a JSON string that contains a book:

```powerapps-dot
ParseJSON( "{""Title"":""Gulliver's Travels"", ""Author"": ""Jonathan Swift"", ""Published"": 1900}", bookRecordType
)
```

Using `bookRecordType` as the second argument ensures that the fields have the right names and data types, and also returns a strongly typed value for easier use. For example, if the field `Title` is renamed to `BookTitle` then an error will be produced. Likewise, if the Boolean value `true` is passed for the field `Published` then an error will be produced as it needs to be a number.

## Syntax

**Type**( *TypeSpecification* )

- _TypeSpecification_ – Required. A type specification.

## Examples



[!INCLUDE[footer-include](../../includes/footer-banner.md)]
