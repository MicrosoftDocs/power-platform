---
title: GUID function
description: Reference information including syntax and examples for the GUID function.
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

# GUID function
[!INCLUDE[function-guid-applies-to](includes/function-guid-applies-to.md)]



Convert a GUID ([globally unique identifier](https://en.wikipedia.org/wiki/Universally_unique_identifier)) string to a GUID value, or create a new GUID value.

## Description

Use the **GUID** function to convert a string with the hexadecimal representation of a GUID into a GUID value you can pass to a database. Database systems like Microsoft Dataverse and SQL Server use GUID values as keys.

The string can have uppercase or lowercase letters, but it must be 32 hexadecimal digits in one of these formats:

- **"123e4567-e89b-12d3-a456-426655440000"** (hyphens in standard locations)
- **"123e4567e89b12d3a456426655440000"** (no hyphens)

If you don't specify an argument, the function creates a new GUID.

To convert a GUID value to a string, use it in a string context. The GUID value converts to a hexadecimal string with hyphens and lowercase letters.

When generating a new GUID, the function uses pseudo-random numbers to create a version 4 [IETF RFC 4122](https://www.ietf.org/rfc/rfc4122.txt) GUID. When converting a string to a GUID, the function supports any GUID version by accepting any string of 32 hexadecimal digits.

## Volatile functions

**GUID** is a volatile function when used without an argument. Each time the function runs, it returns a different value.

When you use a volatile function in a data-flow formula, it returns a different value only if the formula is reevaluated. If nothing else changes in the formula, it keeps the same value while your app runs.

For example, if you set the **Text** property of a label control to **GUID()**, it doesn't change while your app is active. You get a different value only when you close and reopen the app.

The function is reevaluated if it's part of a formula where something else changes. For example, if you set the **Text** property of a **Label** control to this formula, a GUID is generated each time the user changes the value of the **Text input** control:

**TextInput1.Text & " " & GUID()**

When you use **GUID** in a [behavior formula](/power-apps/maker/canvas-apps/working-with-formulas-in-depth), it's evaluated each time the formula runs. For more information, see the examples later in this topic.

## Syntax

**GUID**( [ *GUIDString* ] )

- _GUIDString_ – Optional. A text string that has the hexadecimal representation of a GUID. If you don't supply a string, the function creates a new GUID.

**GUID**( _Dynamic_ )

- _Dynamic_ – Required. [**Dynamic**](../untyped-object.md) value that represents a GUID. Acceptable values depend on the untyped provider. For [**JSON**](function-parsejson.md), the dynamic value is expected to be a GUID represented as a JSON string.

## Examples

#### Basic usage

To return a GUID value based on the hexadecimal string representation:

```power-fx
GUID( "0f8fad5b-d9cb-469f-a165-70867728950e" )
```

You can also provide the GUID string without hyphens. This formula returns the same GUID value:

```power-fx
GUID( "0f8fad5bd9cb469fa16570867728950e" )
```

Used in context, to set the **Status** field of a new database record to a well-established value:

```power-fx
Patch( Products, Default( Products ), { Status: GUID( "F9168C5E-CEB2-4faa-B6BF-329BF39FA1E4" ) } )
```

You probably don't want to show GUIDs to users, but GUIDs can help you debug your app. To show the value of the **Status** field in the record you created in the previous example, set the **Text** property of a **Label** control to this formula:

```power-fx
First( Products ).Status
```

The **Label** control shows **f9168c5e-ceb2-4faa-b6bf-329bf39fa1e4**.

#### Create a table of GUIDs

1. Set the **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property of a **[Button](/power-apps/maker/canvas-apps/controls/control-button)** control to this formula:

   ```power-fx
   ClearCollect( NewGUIDs, ForAll( Sequence(5), GUID() ) )
   ```

   This formula creates a single-column table that's used to iterate five times, resulting in five GUIDs.

1. Add a **[Data table](/power-apps/maker/canvas-apps/controls/control-data-table)** control, set its **Items** property to **NewGUIDs**, and show the **Value** field.

1. Hold down the Alt key and select the button.

   The data table shows a list of GUIDs:

   ![A screen showing a data table with five different GUID values.](media/function-guid/guid-collection-1.png)

1. Select the button again to show a new list of GUIDs:

   ![The same screen showing a data table with a new set of five different GUID values.](media/function-guid/guid-collection-2.png)

To generate a single GUID instead of a table, use this formula:

```power-fx
Set( NewGUID, GUID() )
```

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































