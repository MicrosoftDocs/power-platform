---
title: "Test Engine Samples"
description: "Introduces the information about the controls and test engine features demonstrated for each sample."
author: jt000
ms.subservice: developer
ms.author: jasontre
ms.date: 08/02/2023
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
---
# Test Engine Samples

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Learn about the controls and test engine features demonstrated for each sample. Most sample contains one zipped msapp and one YAML test plan. YAML test plans are defined in [Test Engine Yaml format](yaml.md). In order to test a sample, follow instructions in [Power Apps Test Engine](overview.md).

## Type of Samples


| Sample Name|Description |  Features Demonstrated |
|---|---|---|
| [Basic Gallery](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/basicgallery) | Interact with controls within a basic gallery | <ul><li>Assert `Label` Text to be the first item("Lorem ipsum 1") in the gallery. </li><li>Select on the `NextArrow` in first row on gallery. </li><li>Assert `Label` Text to be second item("Lorem ipsum 2") to validate the label in the second row of the gallery.|
|[Button Clicker](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/buttonclicker) | Counter increments when the button is clicked | <ul><li>Test settings and environment can be a pointer to another YAML file. </li><li>`OnTestCaseStart`, `OnTestCaseComplete`, and `OnTestSuiteComplete` are supported.  </li><li>Wait for the `label`to be certain number("0"). </li><li>Select on the `Button`. </li><li>Assert `label` to be number+1("1").
| [Calculator](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/calculator) |  Calculator app works as a component |<ul><li>A component for Calculator with two labels for number input, one `lable` for calculated result and four `Button` for Add, Subtract, Multiply and Divide. </li><li>Assert two input label to certain number("100", "100"). </li><li>Select on one of four `Button`(Add). </li><li>Assert result `Label` to right value("200").
| [Connector](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/connector) | Shows how to mock network requests with MSN Weather connector | <ul><li>Use `SetProperty` to set `TextInput` to a String("Atlanta"). </li><li>Select on `Button`. </li><li>Assert `Label` to a string ("You're seeing the mock response"). </li><li>Check [connector](/connectors/connector-reference/connector-reference-powerapps-connectors) for more information.
| [Container](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/containers) | Interact with control in the container |<ul><li>Select on the `Button`. </li><li>Assert `label` to be number+1("1"). </li><li>Check [Container control](/power-apps/maker/canvas-apps/controls/control-container) for more information.
 |[DifferentVariableTypes](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/differentvariabletypes) | Showcases usage of Assert/Wait/SetProperty with multiple types |<ul><li>Use Wait, SetProperty, and Assert function to test `TextInput`, `Rating`, `Toggle`, `DatePicker`, `Dropdown`, `ComboBox` control to make sure DateType like String, Number, Boolean, Date, Record, and Table works.
 |[ManyScreens](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/manyscreens) | Interact with controls with different screens |<ul><li>Three Screens on the canvas app. </li><li>First 'Home Screen' have two `Button` navigate to other two screens. </li><li>Other two Screens 'Label Screen' and 'Gallery Screen' each have one `Button` navigate to the 'Home Screen'. </li><li>Select on the 'Label Screen ' `Button`. </li><li>Assert `label1` to be string on 'Label Screen'("Hello world!").
 |[Nested Gallery](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/nestedgallery)| Interact with controls within a nested gallery |<ul><li>Two Gallery and two label each with column and row. </li><li>Column Gallery inside row Gallery.  </li><li>`Select` first row in the row gallery. </li><li>`Assert` row `Label` to validate that the selected row is updated. </li><li>`Select` second column in the column gallery. </li><li>`Assert` column `Label` to validate that the selected column is updated. 
 |[PCF Component](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/pcfcomponent) | Interact with increment control of the PCF Component |<ul><li>Import PCF Component in the canvas app. </li><li>Use SetProperty to set `IncrementControl1` to a number(10). </li><li>Assert `IncrementControl1` to a number (10). </li><li>Check [PCF Component](/power-apps/developer/component-framework/overview) for more information.
 |[Screen Navigation](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/screennavigation) | Interact with controls for navigate to different screen |<ul><li>Two Screens and labels on the canvas app. </li><li>'Screen1' have `Button2` navigate to second screen. </li><li>'Screen2' have `Button1` navigate to first screen. </li><li>Select on the `Button2`. </li><li>Assert `label2` to be the string("Screen2").
