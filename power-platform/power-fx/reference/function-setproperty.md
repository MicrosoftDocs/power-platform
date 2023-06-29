---
title: SetProperty function in Power Apps Test Studio
description: Reference information including syntax and examples for the SetProperty function in Power Apps Test Studio.
author: mduelae

ms.topic: reference
ms.custom: canvas
ms.reviewer: mkaur
ms.date: 12/19/2018
ms.subservice: power-fx
ms.author: jorisde
search.audienceType:
  - maker
contributors:
  - gregli-msft
  - mduelae
  - jorisdg
---

# SetProperty function in Power Apps Test Studio

The SetProperty function simulates interactions with input controls as if the user had entered or set a value on the control. This function is only available if you are writing tests in the Power Apps Test Studio. The following properties can be set using the SetProperty function.

## Syntax

_SetProperty(Control Property, value)_

- _Control Property_ – Required. The control property to set on behalf of the user.
- _Value_ – Required. The value of the property to set on behalf of the user.

## Examples

| Control        | Property      | Example expression                                                                            |
| :------------- | :------------ | :-------------------------------------------------------------------------------------------- |
| TextInput      | Text          | `SetProperty(TextInput1.Text, "Sample text")`                                                 |
| RichTextEditor | HtmlText      | `SetProperty(RichTextEditor1.HtmlText, "<p>Sample text</p>")`                                 |
| Toggle         | Value         | `SetProperty(Toggle1.Value, false)`                                                           |
| Checkbox       | Value         | `SetProperty(Checkbox1.Value, false)`                                                         |
| Slider         | Value         | `SetProperty(Slider1.Value, 10)`                                                              |
| Rating         | Value         | `SetProperty(Rating1.Value, 5)`                                                               |
| DatePicker     | SelectedDate  | `SetProperty(DatePicker1.SelectedDate, Date(2020,3,10))`                                      |
| Radio          | Selected      | `SetProperty(Radio1.Selected, "Yes")`                                                         |
| Radio          | SelectedText  | `SetProperty(Radio1.SelectedText, "Yes")`                                                     |
| Dropdown       | Selected      | `SetProperty(Dropdown1.Selected, {Value:"Sample value"})`                                     |
| Dropdown       | SelectedText  | `SetProperty(Dropdown1.SelectedText, {Value:"Sample value"})`                                 |
| Combobox       | Selected      | `SetProperty(Dropdown1.Selected, {Value:"Sample value"})`                                     |
| Combobox       | SelectedItems | `SetProperty(ComboBox1.SelectedItems, Table({Value:"Sample value"},({Value:"Sample value"}))` |
| ListBox        | Selected      | `SetProperty(Listbox1.Selected, {'Value':"Sample value"})`                                    |
| ListBox        | SelectedItems | `SetProperty(Listbox1.SelectedItems, Table({Value:"Sample value"},({Value:"Sample value"}))`  |

### See Also

[Test Studio Overview](/power-apps/maker/canvas-apps/test-studio) <br>
[Working with Test Studio](/power-apps/maker/canvas-apps/working-with-test-studio)

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
