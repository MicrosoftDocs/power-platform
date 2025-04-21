---
title: Confirm function
description: Reference information for the Confirm function.
author: gregli-msft
ms.subservice: power-fx
ms.topic: reference
ms.custom: canvas
ms.reviewer: nabuthuk
ms.date: 3/22/2024
ms.author: gregli
search.audienceType: 
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
---

# Confirm function
[!INCLUDE[function-confirm-applies-to](includes/function-confirm-applies-to.md)]



Display a confirmation dialog box to the user.

## Description

> [!NOTE]
> At this time, the **Confirm** function is only available when writing Power Fx commands for model-driven apps.

The **Confirm** function displays a dialog box on top of the current screen. Two buttons are provided: a *confirm* button and a *cancel* button, which default to localized versions of "OK" and "Cancel" respectively. The user must confirm or cancel before the dialog box is dismissed and the function returns. Besides the dialog button, *cancel* can also be selected with the **Esc** key or other gestures that are platform specific.

The *Message* parameter is displayed in the body of the dialog box. If the message is long, it may be truncated, or a scroll bar may be provided.

Use the *OptionsRecord* parameter to specify options for the dialog box. Not all options are available on every platform and are handled on a best effort basis. These options are not supported in canvas apps.

| Option Field | Description |
|--------------|-------------|
| **ConfirmButton** | The text to display on the *confirm* button, replacing the default, localized "OK" text. |
| **CancelButton** | The text to display on the *cancel* button, replacing the default, localized "Cancel" text.  |
| **Title** | The text to display as the title of the dialog box.  A larger, bolder font than the message font may be used to display this text.  The text will be truncated if it is long. |
| **Subtitle** | The text to display as the subtitle of the dialog box.  A larger, bolder font than the message font may be used to display this text.  The text will be truncated if it is long. |

**Confirm** returns *true* if the *confirm* button was selected, *false* otherwise. 

Use the [**Notify**](function-showerror.md) function to display a message banner at the top of the app that doesn't need to be dismissed.

## Syntax

**Confirm**( *Message* [, *OptionsRecord* ] )

- *Message* - Required. Message to display to the user.
- *OptionsRecord* - Optional.  Provide option settings for the dialog box.  Not all options are available on every platform and are handled on a "best effort" basis.  

## Examples

```power-fx
If( Confirm( "Are you sure?" ), Remove( ThisItem ) )
```

Simple confirmation dialog, asking the user to confirm deletion of a record before it's removed.  Unless the user presses the "OK" button, the record won't be deleted.

```power-fx
If( Confirm( "Are you sure?", {Title: "Delete Confirmation"} ), Remove( ThisItem ) )
```

Same dialog as the last example, but adds Title text. 

```power-fx
Set( FavColor, 
     If( Confirm( "What is your favorite color?", 
                  { ConfirmButton: "Red", CancelButton: "Green" } 
         ), 
         "Red", 
         "Green" 
     ) 
)
```

Asks the user for their favorite color, capturing the result into a global variable.  The result that will be placed in **FavColor** will be the text string "Red" or "Green".  As the *confirm* choice, "Red" is the default.  This only works on platforms that support **ConfirmButton** and **CancelButton** options.

```power-fx
Confirm( "There was a problem, please review your order." )
```

Displays a message much like the **Notify** function does, but is modal and requires the user to select a button to proceed.  Use when it's important that the user acknowledges the message before proceeding.  In this situation, which button was selected isn't important and the result isn't checked.








































































































































