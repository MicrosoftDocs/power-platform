---
title: Reset function
description: Reference information including syntax and examples for the Reset function.
author: gregli-msft

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 3/22/2024
ms.subservice: power-fx
ms.author: gregli
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - gregli
no-loc: ["Reset"]
---

# Reset function
[!INCLUDE[function-reset-applies-to](includes/function-reset-applies-to.md)]



Resets a control to its default value, discarding any user changes.

## Description

The **Reset** function resets a control to its **Default** property value. Any user changes are discarded.

You cannot reset controls that are within a [**Gallery**](/power-apps/maker/canvas-apps/controls/control-gallery) or [**Edit form**](/power-apps/maker/canvas-apps/controls/control-form-detail) control from outside those controls. You can reset controls from formulas on controls within the same gallery or form. You can also reset all the controls within a form with the [**ResetForm**](function-form.md) function.

Using the **Reset** function is an alternative to toggling the **Reset** property of input controls and is generally preferred. The **Reset** property may be a better choice if many controls need to be reset together from multiple formulas. Toggling the **Reset** property can be done from a [**Button**](/power-apps/maker/canvas-apps/controls/control-button) control with the formula **Reset = Button.Pressed** or from a variable with **Reset = MyVar** and toggling **MyVar** with the formula **Button.OnSelect = Set( MyVar, true ); Set( MyVar, false )**.

Input controls are also reset when their **Default** property changes.

**Reset** has no return value, and you can use it only in [behavior formulas](/power-apps/maker/canvas-apps/working-with-formulas-in-depth).

## Syntax

**Reset**( _Control_ )

- _Control_ – Required. The control to reset.

## Example

1. Insert a **Text input** control on a screen. By default, its name will be **TextInput1** and its **Default** property will be set to **"Text input"**.
2. Type a new value in the text box.
3. Insert a **Button** control on the screen.
4. Set the button's **OnSelect** property to **Reset( TextInput1 )**.
5. Select the button. This can be done even when authoring by selecting toward the ends of the control.
6. The contents of the text box will return to the value of the **Default** property.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]







































































































































