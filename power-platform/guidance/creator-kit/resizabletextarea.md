---
title: Resizable text area control reference | Creator Kit
description: Learn about the details and properties of Resizable text area control in the Creator Kit.
author: denisem-msft
manager: devkeydet

ms.component: pa-maker
ms.topic: conceptual
ms.date: 05/06/2022
ms.subservice: guidance
ms.author: demora
ms.reviewer: tapanm
search.audienceType: 
  - maker
search.app: 
  - D365CE
  - PowerApps
  - Powerplatform
contributors:
  - tapanm-msft
  - demora-msft
  - mehdis-msft
---
# Resizable text area control

A component for user input.

![Resizable text area](media/resizable-textarea.png "Resizable text area")

## Description

Text areas give people a way to enter and edit text. They're used in forms, modal dialogs, tables, and other surfaces where text input is required. 

This component allows the user to resize the text area for convenienience.

## Limitations
This PCF component can only be used in Canvas apps, Custom Pages and Model driven apps.

## Key properties

| Property | Description |
| -------- | ----------- |
| Text | Text value currently populating the control |
| Default | Initial text value of the control |
| Default height | Initial height of the control |
| Default width | Initial width of the control |
| Allow resize | Determines if resize is available and has options for direction (horizontal, vertical) |

## Additional properties

| Property | Description |
| -------- | ----------- |
| Resized height | The current value of the control |
| Resized width | The current width of the control |
| Min height | Min height the user is allowed to resize |
| Max height | Max height the user is allowed to resize |
| Min width | Min width the user is allowed to resize |
| Max width | Max width the user is allowed to resize |
| Left padding adjustment | Compensates for padding on the right |

Other properties are the same as the standard [text input control](https://docs.microsoft.com/en-us/power-apps/maker/canvas-apps/controls/control-text-input).

## Best Practices
Refer to [Fluent UI text field control best practices](https://developer.microsoft.com/en-us/fluentui#/controls/web/textfield) for more guidance.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]