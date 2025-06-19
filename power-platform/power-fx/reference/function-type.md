---
title: RecordOf and Type functions
description: Reference information including syntax and examples for the RecordOf and Type functions.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 06/18/2025
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# RecordOf and Type functions
[!INCLUDE[function-type-applies-to](includes/function-type-applies-to.md)]



Constructs a user defined type for use with user defined functions and untyped values.

> [!IMPORTANT]
> - These functions are experimental.
> - Experimental features aren't meant for production use and might not be complete. These features are available before an official release so that you can get early access and provide feedback. More information: [**Understand experimental, preview, and retired features in canvas apps**](/power-apps/maker/canvas-apps/working-with-experimental-preview)
> - This behavior is available only when the **User-defined types** experimental feature in [**Settings > Upcoming features > Experimental**](/power-apps/maker/canvas-apps/working-with-experimental-preview#controlling-which-features-are-enabled) is turned on (it's off by default).
> - Your feedback is valuable. Let us know what you think in the [**Power Apps experimental features community forum**](https://community.powerplatform.com/forums/thread/details/?threadid=c8824a08-8198-ef11-8a69-7c1e52494f33).

## Description

Every function in Power Fx defines the types of values that can be passed in as parameters and the type of the output. Types are checked when you write a formula and errors shown if they don't agree with what is expected. Types are also used by the editor to suggest good options for what to pass into the function and detect errors as early as possible. 

When creating your own user defined functions, you need to specify the input and output types. For simple types like [**Decimal**](../data-types.md) or [**Text**](../data-types.md), this is easy as these basic types are predefined. For more complex types, such as records or tables, use the **Type** function to create the type.

The **Type** function also makes dynamic values easier to work with. With [**ParseJSON**](function-parsejson.md), [**IsType**](function-astype-istype.md), and [**AsType**](function-astype-istype.md) functions, a dynamic value can be converted to a typed object in which columns no longer need to be individually typed at the point of usage.

The **Type** function takes a *TypeSpecification* as its only argument. The simplest type specification is to reference an existing type, for example `Type( Text )`. A type specification for a record or table is similar to defining a record or table with literal values, where the values are replaced by type names. For example, `{Name: "Jane"}` would be typed with `Type( {Name: Text} )`. Tables are specified with square brackets, not the [**Table**](function-table.md) function, and only one record can be provided. For example, `[1,2,3]` would be typed with `Type( [Number] )`.

Use the **RecordOf** function to extract the record type from a table type. For example, `Type( RecordOf( Library ) )` would return the type of a single book from the library. To make a table type from a record type, wrap the record type in square brackets. For example, `Type( [ Book ] )` defines a library. **RecordOf** can only be used within the **Type** function.

The **Type** function and the type value it returns can only be used in specific places in Power Fx, such as the second argument to **ParseJSON**. In Canvas apps, the **Type** function can be used with a named formula in [**App.Formulas**](object-app.md#formulas-property).

## Syntax

**RecordOf**( *TableType* )

- _TableType_ – Required. The type name of a table. This doesn't accept a type specification, it needs to be the name of a previously defined type for a table.

**Type**( *TypeSpecification* )

- _TypeSpecification_ – Required. A type specification.

## Examples

### Type function

Consider the following definitions in **App.Formulas**:

```powerapps-dot
Library = 
  [ { Title: "A Study in Scarlet", Author: "Sir Arthur Conan Doyle", Published: 1887 }, 
    { Title: "And Then There Were None", Author: "Agatha Christie", Published: 1939 },
    { Title: "The Marvelous Land of Oz", Author: "L. Frank Baum", Published: 1904 } ];

// Type definition for a single book
BookType := Type( { Title: Text, Author: Text, Published: Number } );

// Type definition for a table of books
LibraryType := Type( [ BookType ] );
```

Notice how the actual title text `"A Study in Scarlet"` is replaced with the type name `Text` in the type specification, a placeholder for any text value. A parameter or variable of type `BookType` can hold one of the books in `Library`, while `LibraryType` can hold the entire table. With these types in place, we can define these user defined functions:

```powerapps-dot
SortedBooks( books: LibraryType ): LibraryType = 
    SortByColumns( Library, Author, SortOrder.Ascending, Title, SortOrder.Ascending );

PublishedInLeapYear( book: BookType ): Boolean = 
    Mod( book.Published, 4 ) = 0 And 
    (Mod( book.Published, 100 ) <> 0 Or Mod( book.Published, 400 ) = 0);
```

You can also use the `BookType` to parse a JSON string that contains a book:

```powerapps-dot
ParseJSON( "{""Title"":""Gulliver's Travels"", ""Author"": ""Jonathan Swift"", ""Published"": 1900}", BookType
)
```

Using `BookType` as the second argument to **ParseJSON** results in a typed record that can be used like any other Power Fx record.

### RecordOf function

In the **Type** function example, you start with `BookType` and build `LibraryType` by wrapping a table around it. We could have defined these types in reverse with:

```powerapps-dot
// Type definition for a table of books
RecordOfLibraryType := Type( [ { Title: Text, Author: Text, Published: Number } ] );

// Type definition for a single book
RecordOfBookType := Type( RecordOf( RecordOfLibraryType ) );
```

[!INCLUDE[footer-include](../../includes/footer-banner.md)]






































































































































