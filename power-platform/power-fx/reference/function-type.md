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

Use the **Type** function to define a custom type for the parameters and return value of a user defined function.

The **Type** function, and the value it returns, can only be used in very specific places, such as the second argument to **ParseJSON**. In Canvas apps, the **Type** function can only be used with a named formula in **App.Formulas**.

## Type specification

Types are specified in the same manner as a literal value, with the values replaced by type names.

For example, this named formula defines the speed of light by the default number type of the Power Fx host:

```powerapps-dot
c = 3e8;        // speed of light in meters per second
```
This defines the type of the speed of light:

```powerapps-dot
cType := Type( Number );
```
A parameter or variable of type `cType` can hold `c`.

Now, let's look at a more complex example:

```powerapps-dot
books = [ { Title: "A Study in Scarlet", Author: "Sir Arthur Conan Doyle", Published: 1887 }, 
{ Title: "And Then There Were None", Author: "Agatha Christie", Published: 1939 } ];
```

```powerapps-dot
booksType := Type( [ { Title: Text, Author: Text, Published: Number } ] )
```

A parameter or variable of type `booksType` can hold `books`.






## Syntax

**Type**( *TypeSpecification* )

- _TypeSpecification_ – Required. A type specification.

## Examples

The current Power Apps user has the following information:

- Full Name: **"John Doe"**
- Email address: **"john.doe@contoso.com"**
- Entra Object Id: **a90c6800-e58c-4495-81f7-55819b56fe2a** _(GUID)_
- Image: ![Image icon.](media/function-user/john-doe-picture.png "Image icon")

| Formula             | Description                                                                                                                                       | Result                                                                                                                              |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| **User()**          | Record of all information for the current Power Apps user.                                                                                        | { FullName:&nbsp;"John Doe", Email:&nbsp;"john.doe@contoso.com", Image:&nbsp;"blob:1234...5678", EntraObjectId:&nbsp;a90c6800&#8209;e58c&#8209;4495&#8209;81f7&#8209;55819b56fe2a }                                   |
| **User().Email**    | The email address of the current Power Apps user.                                                                                                 | "john.doe@contoso.com"                                                                                                              |
| **User().FullName** | The full name of the current Power Apps user.                                                                                                     | "John Doe"                                                                                                                          |
| **User().EntraObjectId** | Microsoft Entra Object ID of the current user.                                                                                                   | a90c6800-e58c-4495-81f7-55819b56fe2a _(GUID)_                                                                                           |
| **User().Image**    | The image URL for the current Power Apps user. Set the **Image** property of the **Image** control to this value to display the image in the app. | "blob:1234...5678"<br><br>With **ImageControl.Image**:<br>![Image icon 1.](media/function-user/john-doe-picture.png "Image icon 1") |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
