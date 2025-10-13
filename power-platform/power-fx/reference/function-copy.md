---
title: Copy function
description: Reference information for the Copy function.
author: gregli
ms.subservice: power-fx
ms.topic: reference
ms.custom: canvas
ms.reviewer: 
ms.date: 3/22/2024
ms.author: jorisde
search.audienceType: 
  - maker
no-loc: ["Copy"]
---
# Copy function
[!INCLUDE[function-copy-applies-to](includes/function-copy-applies-to.md)]



Copies text to the clipboard on the device where the app is running.

## Description

The **Copy** function takes any text value and copies it to the clipboard. Regardless of the contents of the text, the clipboard will contain plain text without any special mime type. The function is considered a side-effects function and as a result it can only be used in behavior properties.

> [!NOTE]
> The **Copy()** function is limited to the access given to clipboard by the host of the app. As a result, embedded apps scenarios such as Power Apps in SharePoint, embedded apps in Power BI, Teams, etc. don't support **Copy()**. Other embedded scenarios might not support the function either. Makers should use **[IfError()](./function-iferror.md)** to ensure the action to copy to clipboard was effective and if not, to properly alert the user that the copy failed.

## Syntax

**Copy**( _text_ )

- _text_ - Required. The text to be copied to the clipboard.

## Examples

### Text Input with Copy Button
The **Copy** function can be used to create a style of input controls seen in many apps, where a button right now to the input text allows for a quick copy of the input's text to the clipboard.

1. Insert a **Text input** control on a screen. By default, the name will be **TextInput1**.
2. Insert a **Button** control on the screen, next to the input control.
3. Set the button's **OnSelect** property to **Copy( TextInput1.Text )**.

When the button is selected, the text from the text input control will be copied to the clipboard.

### Processing text to put on clipboard

The **Copy** function accepts text, which can be itself an expression that manipulates text from your app in some way. For example, an app may have an employee record that contain the employee's first name, last name, and title. A formula could put this information on the clipboard as one piece of text. The following example uses string interpolation to combine the data into one string:

```power-fx
Copy( $"{employeeRecord.Name} {employeeRecord.LastName} ({employeeRecord.Title})" )
```

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































