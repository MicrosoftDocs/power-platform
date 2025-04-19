---
title: User function
description: Reference information including syntax and examples for the User function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 6/10/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# User function
[!INCLUDE[function-user-applies-to](includes/function-user-applies-to.md)]



Returns information about the current user.

## Description

The **User** function returns a [record](/power-apps/maker/canvas-apps/working-with-tables#records) of information about the current user:

| Property            | Description                                                                                                                                                                                                                                                                                                  |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **User().Email**    | Email address of the current user. The `User().Email` function returns the user's UPN and not the SMTP email address.                                                                                                                                                                                        |
| **User().EntraObjectId**    | Microsoft Entra Object ID of the current user, useful for calling APIs that use this value. This is a GUID value and unique for each user.                                                                                                                                                                                     |
| **User().FullName** | Full name of the current user, including first and last names.                                                                                                                                                                                                                                               |
| **User().Image**    | Image of the current user. This will be an image URL of the form "blob:_identifier_". Set the **[Image](/power-apps/maker/canvas-apps/controls/properties-visual)** property of the **[Image](/power-apps/maker/canvas-apps/controls/control-image)** control to this value to display the image in the app. |

> [!NOTE]
> The information returned is for the current Power Apps user. It will match the "Account" information that is displayed in the Power Apps players and studio, which can be found outside of any authored apps. This may not match the current user's information in Office 365 or other services.

> [!NOTE]
> If you published your application with a User function prior to March 2020, you may find that it, intermittently, will not retrieve photos. The issues were fixed in the late March 2020 release. To take advantage of the updated implementation, simply re-open your application, save it, and republish it.

## Syntax

**User**()

## Examples

The current Power Apps user has the following information:

- Full Name: **"John Doe"**
- Email address: **"john.doe@contoso.com"**
- Entra Object Id: **aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb** _(GUID)_
- Image: ![Image icon.](media/function-user/john-doe-picture.png "Image icon")

| Formula             | Description                                                                                                                                       | Result                                                                                                                              |
| ------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
| **User()**          | Record of all information for the current Power Apps user.                                                                                        | { FullName:&nbsp;"John Doe", Email:&nbsp;"john.doe@contoso.com", Image:&nbsp;"blob:1234...5678", EntraObjectId:&nbsp;a90c6800&#8209;e58c&#8209;4495&#8209;81f7&#8209;55819b56fe2a }                                   |
| **User().Email**    | The email address of the current Power Apps user.                                                                                                 | "john.doe@contoso.com"                                                                                                              |
| **User().FullName** | The full name of the current Power Apps user.                                                                                                     | "John Doe"                                                                                                                          |
| **User().EntraObjectId** | Microsoft Entra Object ID of the current user.                                                                                                   | aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb _(GUID)_                                                                                           |
| **User().Image**    | The image URL for the current Power Apps user. Set the **Image** property of the **Image** control to this value to display the image in the app. | "blob:1234...5678"<br><br>With **ImageControl.Image**:<br>![Image icon 1.](media/function-user/john-doe-picture.png "Image icon 1") |

[!INCLUDE[footer-include](../../includes/footer-banner.md)]






































































































































