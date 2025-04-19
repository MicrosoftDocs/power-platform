---
title: EditForm, NewForm, SubmitForm, ResetForm, and ViewForm functions
description: Reference information including syntax and examples for the EditForm, NewForm, SubmitForm, ResetForm, and ViewForm functions.
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
---

# EditForm, NewForm, SubmitForm, ResetForm, and ViewForm functions
[!INCLUDE[function-form-applies-to](includes/function-form-applies-to.md)]



View, edit, or create an item, save the contents, and reset the controls in an **[Edit form](/power-apps/maker/canvas-apps/controls/control-form-detail)** control.

## Overview

These functions change the state of the **Edit form** control. The form control can be in one of these modes:

| Mode              | Description                                                                                                                                                 |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **FormMode.Edit** | The form is populated with an existing record and the user can modify the values of the fields. Once complete, the user can save the changes to the record. |
| **FormMode.New**  | The form is populated with default values and the user can modify the values of the fields. Once complete, the user can add the record to the data source.  |
| **FormMode.View** | The form is populated with an existing record but the user cannot modify the values of the fields.                                                          |

## Description

These functions are often invoked from the **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** formula of a **[Button](/power-apps/maker/canvas-apps/controls/control-button)** or **[Image](/power-apps/maker/canvas-apps/controls/control-image)** control so that the user can save edits, abandon edits, or create a record. You can [use controls and these functions together](/power-apps/maker/canvas-apps/working-with-forms) to create a complete solution.

These functions return no values.

You can use these functions only in [behavior formulas](/power-apps/maker/canvas-apps/working-with-formulas-in-depth).

### SubmitForm

Use the **SubmitForm** function in the **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property of a Button control to save any changes in a Form control to the data source.

Before submitting any changes, this function checks for validation issues with any field that's marked as required or that has one or more constraints on its value. This behavior matches that of the **[Validate](function-validate.md)** function.

**SubmitForm** also checks the **[Valid](/power-apps/maker/canvas-apps/controls/control-form-detail)** property of the Form, which is an aggregation of all the **[Valid](/power-apps/maker/canvas-apps/controls/control-card)** properties of the **[Card](/power-apps/maker/canvas-apps/controls/control-card)** controls that the Form control contains. If a problem occurs, the data isn't submitted, and the **[Error](/power-apps/maker/canvas-apps/controls/control-form-detail)** and **[ErrorKind](/power-apps/maker/canvas-apps/controls/control-form-detail)** properties of the Form control are set accordingly.

If validation passes, **SubmitForm** submits the change to the data source.

- If successful, the Form's **[OnSuccess](/power-apps/maker/canvas-apps/controls/control-form-detail)** behavior runs, and the **[Error](/power-apps/maker/canvas-apps/controls/control-form-detail)** and **[ErrorKind](/power-apps/maker/canvas-apps/controls/control-form-detail)** properties are cleared. If the form was in **FormMode.New** mode, it is returned to **FormMode.Edit** mode.
- If unsuccessful, the Form's **[OnFailure](/power-apps/maker/canvas-apps/controls/control-form-detail)** behavior runs, and the **[Error](/power-apps/maker/canvas-apps/controls/control-form-detail)** and **[ErrorKind](/power-apps/maker/canvas-apps/controls/control-form-detail)** properties are set accordingly. The mode of the form is unchanged.

### EditForm

The **EditForm** function changes the Form control's mode to **FormMode.Edit**. In this mode, the contents of the Form control's **[Item](/power-apps/maker/canvas-apps/controls/control-form-detail)** property are used to populate the form. If the **SubmitForm** function runs when the form is in this mode, a record is changed, not created. **FormMode.Edit** is the default for the Form control.

>[!NOTE]
> When the form is in edit mode and Item is null, data card properties are not evaluated and will return default values. 

### NewForm

The **NewForm** function changes the Form control's mode to **FormMode.New**. In this mode, the contents of the Form control's **[Item](/power-apps/maker/canvas-apps/controls/control-form-detail)** property are ignored, and the default values of the Form's **[DataSource](/power-apps/maker/canvas-apps/controls/control-form-detail)** property populate the form. If the **SubmitForm** function runs when the form is in this mode, a record is created, not changed.

### ResetForm

The **ResetForm** function resets the contents of a form to their initial values, before the user made any changes. If the form is in **FormMode.New** mode, the form is reset to **FormMode.Edit** mode. The **[OnReset](/power-apps/maker/canvas-apps/controls/control-form-detail)** behavior of the form control also runs. You can also reset individual controls with the **[Reset](function-reset.md)** function but only from within the form.

### ViewForm

The **ViewForm** function changes the Form control's mode to **FormMode.View**. In this mode, the contents of the Form control's **[Item](/power-apps/maker/canvas-apps/controls/control-form-detail)** property are used to populate the form. The **SubmitForm** and **ResetForm** functions have no effect when in this mode.

### DisplayMode Property

The current mode can be read through the **Mode** property. The mode also determines the value of the **DisplayMode** property, which can be used by data cards and controls within the form control. Often, the data card's **DisplayMode** property will be set to **Parent.DisplayMode** (referencing the form) as will the control's **DisplayMode** property (referencing the data card):

| Mode              | DisplayMode          | Description                                                                |
| ----------------- | -------------------- | -------------------------------------------------------------------------- |
| **FormMode.Edit** | **DisplayMode.Edit** | Data cards and controls are editable, ready to accept changes to a record. |
| **FormMode.New**  | **DisplayMode.Edit** | Data cards and controls are editable, ready to accept a new record.        |
| **FormMode.View** | **DisplayMode.View** | Data cards and controls are not editable and optimized for viewing.        |

## Syntax

**SubmitForm**( _FormName_ )

- _FormName_ - Required. Form control to submit to the data source.

**EditForm**( _FormName_ )

- _FormName_ - Required. Form control to switch to **FormMode.Edit** mode.

**NewForm**( _FormName_ )

- _FormName_ - Required. Form control to switch to **FormMode.New** mode.

**ResetForm**( _FormName_ )

- _FormName_ - Required. Form control to reset to initial values. Also switches the form from **FormMode.New** mode to **FormMode.Edit** mode.

**ViewForm**( _FormName_ )

- _FormName_ - Required. Form control to switch to **FormMode.View** mode.

## Examples

See [Understand data forms](/power-apps/maker/canvas-apps/working-with-forms) for complete examples.

1. Add a Button control, set its **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property to show **Save**, and set its **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:

   **SubmitForm( EditForm )**

2. Set the **[OnFailure](/power-apps/maker/canvas-apps/controls/control-form-detail)** property of a Form control to blank and its **[OnSuccess](/power-apps/maker/canvas-apps/controls/control-form-detail)** property to this formula:

   **Back()**

3. Name a **[Label](/power-apps/maker/canvas-apps/controls/control-text-box)** control **ErrorText**, and set its **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:

   **EditForm.Error**

   When the user selects the **Save** button, any changes in the Form control are submitted to the underlying data source.

   - If the submission succeeds, any changes are saved or, if the Form control is in **New** mode, a record is created. **ErrorText** is _blank_ and the previous screen reappears.
   - If the submission fails, **ErrorText** shows a user-friendly error message, and the current screen remains visible so that the user can correct the problem and try again.

4. Add a Button control, set its **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property to show **Cancel**, and set its **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:

   **ResetForm( EditForm ); Back()**

   When the user selects the **Cancel** button, the values in the Form control are reset to what they were before the user started to edit it, the previous screen reappears, and the Form control is returned to **Edit** mode if it was in **New** mode.

5. Add a Button control, set its **[Text](/power-apps/maker/canvas-apps/controls/properties-core)** property to show **New**, and set its **[OnSelect](/power-apps/maker/canvas-apps/controls/properties-core)** property to this formula:

   **NewForm( EditForm ); Navigate( EditScreen, None )**

   When the user selects the **New** button, the Form control switches to **New** mode, the default values for the Form control's data source populate that control, and the screen that contains the Form control appears. When the **SubmitForm** function runs, a record is created instead of updated.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]








































































































































