---
title: Confirm function reference for Power Fx
description: Learn how to use the Confirm function to display customizable confirmation dialogs in Power Fx apps, including options for titles, subtitles, and button labels.
author: gregli-msft
ms.subservice: power-fx
ms.topic: reference
ms.custom: canvas
ms.reviewer: nabuthuk
ms.date: 03/22/2024
ms.author: gregli
search.audienceType: 
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
no-loc: ["Confirm"]
---

# Confirm function
[!INCLUDE[function-confirm-applies-to](includes/function-confirm-applies-to.md)]

Use this function to display a confirmation dialog box to the user.

## Description

The **Confirm** function displays a dialog box on top of the current screen with two buttons: a _confirm_ button and a _cancel_ button. In model-driven apps, these buttons default to localized versions of "OK" and "Cancel" respectively. Confirm is also available in canvas apps for showing a simple confirmation dialog and returning a Boolean result.

The user must choose one of the buttons before the dialog is dismissed. Besides selecting the Cancel button, the dialog can be dismissed through platform-specific gestures (such as the Esc key or clicking outside the dialog). In canvas apps, this dismissal path is treated as no action (that is, it returns `blank`).


> [!NOTE]
> In canvas apps, the **Confirm** function uses the Fluent dialog. Make sure [modern controls are enabled](/power-apps/maker/canvas-apps/controls/modern-controls/overview-modern-controls#enable-modern-controls-and-themes-for-your-app); otherwise, the native browser dialog appears.

## Syntax

```
Confirm( Message [, OptionsRecord ] )
```

- _Message_ - Required. Message to display to the user.
- _OptionsRecord_ - Optional. Provide option settings for the dialog box. See below for available options.

## Options

Use the _OptionsRecord_ parameter to customize the confirmation dialog:

| Option | Description |
|--------|-------------|
| **ConfirmButton** | The text to display on the confirm button, replacing the default localized "OK" or "Confirm" text. |
| **CancelButton** | The text to display on the cancel button, replacing the default localized "Cancel" text. |
| **Title** | The text to display as the dialog title. Displayed in a larger, bolder font than the message. It might be truncated if very long. |
| **Subtitle** | The text to display as the dialog subtitle. Displayed between the title and message. It might be truncated if very long. |

## Default behavior

**Button labels:** If you don't provide custom button labels, Confirm uses localized default button text:
- In canvas apps (preview), the defaults are **"Confirm"** and **"Cancel"** (localized).
- In model-driven apps, the defaults are **"OK"** and **"Cancel"** (localized).

**Return value:** Confirm returns `true` if the user selects the confirm button, and `false` otherwise.

## Examples

### Model-driven apps

#### Simple confirmation before removing a record

```powerfx
If( Confirm( "Are you sure?" ), Remove( ThisItem ) )
```

Displays a confirmation dialog with default buttons. If the user selects the confirm button, the record is removed.

#### Confirmation with custom title

```powerfx
If( Confirm( "Are you sure?", { Title: "Delete Confirmation" } ), Remove( ThisItem ) )
```

Adds a title to the confirmation dialog before removing a record.

#### Custom button labels for user preference

```powerfx
Set( FavColor,
     If( Confirm( "What is your favorite color?",
                  { ConfirmButton: "Red", CancelButton: "Green" }
         ),
         "Red",
         "Green"
     )
)
```

Uses custom button labels to capture a simple preference. The result is stored in the global variable `FavColor`.

#### Modal message without checking return value

```powerfx
Confirm( "There was a problem, please review your order." )
```

Displays a modal message that the user must acknowledge before continuing. The return value isn't checked.

---

### Canvas apps 

#### Confirm before delete 

Use **Confirm** to prevent accidental deletion of records:

```powerfx
// Button.OnSelect
If(
    Confirm(
        "Are you sure you want to delete this record?",
        {
            Title: "Delete confirmation",
            Subtitle: "This action can't be undone.",
            ConfirmButton: "Delete",
            CancelButton: "Cancel"
        }
    ),
    Remove(YourDataSource, Gallery1.Selected);
    Notify("Record deleted.", NotificationType.Success)
)
```

Displays a confirmation dialog with title, subtitle, and custom button labels. The record is only deleted if the user selects **Delete**.

#### Confirm before saving a form

Use **Confirm** to validate user intent before submitting data:

```powerfx
// Save button.OnSelect
If(
    Confirm(
        "Do you want to save these changes?",
        { Title: "Save changes" }
    ),
    SubmitForm(EditForm1);
    ResetForm(EditForm1);
    Notify("Changes saved successfully.", NotificationType.Success)
)
```

Displays a confirmation dialog before submitting the form. The form is only submitted if the user confirms.

#### Store result in a variable for multiple actions

Store the confirmation result to use in multiple downstream operations:

```powerfx
// Button.OnSelect
Set(
    varConfirmed,
    Confirm("Do you want to proceed with this operation?")
);

If(
    varConfirmed,
    Notify("Processing your request...", NotificationType.Information);
    /* Additional operations */,
    Notify("Operation canceled.", NotificationType.Warning)
)
```

The Boolean result is stored in `varConfirmed` and can be referenced multiple times for conditional logic.

#### Full customization with all options

Showcase all available customization options:

```powerfx
// Button.OnSelect
If(
    Confirm(
        "This is the main message that describes what the user needs to confirm.",
        {
            Title: "Action Required 🔔",
            Subtitle: "Please choose one of the options below.",
            ConfirmButton: "Yes, proceed",
            CancelButton: "No, cancel"
        }
    ),
    Notify("User confirmed!", NotificationType.Success),
    Notify("User canceled.", NotificationType.Warning)
)
```

Displays a fully customized dialog with title, subtitle, message, and custom button labels.

## FAQs

### Can I hide the Cancel button?
No. The current design always shows both the Confirm and Cancel buttons. Users must have the ability to dismiss or cancel the dialog.

### Can I add a third button or more than two options?
No. Confirm supports exactly two options: a confirm action and a cancel action. For scenarios requiring multiple choices, consider using a different UI pattern such as a custom screen or dropdown control.

### Does Confirm block other operations?
Yes. Confirm displays as a modal dialog that the user must dismiss before they can interact with other parts of the app.

## See also

[**Notify**](function-showerror.md) - Displays a non-modal banner message at the top of the screen that doesn't require user dismissal.
















































































































