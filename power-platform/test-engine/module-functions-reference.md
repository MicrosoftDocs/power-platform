---
title: Test Engine Module Functions Reference (preview)
description: Find available test engine module functions you can use.
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/15/2025
ms.reviewer: jdaly
ms.topic: reference
---

# Test Engine Module Functions Reference (preview)

This table provides an overview of the specialized functions and the Test Engine modules that they are implemented in.

various modules available in the Power Apps Test Engine and their specialized functions.

| Function | Description | Module Link |
|----------|-------------|------------|
|`ConsentDialogFunction` | Checks custom pages of a model-driven app for consent dialogs and handles them automatically during test execution. | [testengine.module.mda](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.mda) |
| `PauseFunction` | Pauses the current test and allows the user to interact with the browser and inspect state when headless mode is false. Useful for debugging tests. | [testengine.module.pause](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.pause) |
| `PlaywrightActionFunction` | Executes Playwright actions for the current page, allowing direct manipulation of DOM elements using CSS and XPath selectors. | [testengine.module.playwrightaction](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.playwrightaction) |
| `PlaywrightActionValueFunction` | Executes Playwright actions that require extra value parameters, such as filling form fields or selecting dropdown options. | [testengine.module.playwrightaction](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.playwrightaction) |
| `PlaywrightScriptFunction` | Enables execution of custom C# scripts that interact with Playwright APIs, providing maximum flexibility for complex automation scenarios. | [testengine.module.playwrightscript](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.playwrightscript) |
| `CheckConnectionExistsFunction` | Checks if a specific connection exists in the Power Platform using the Power Apps portal provider. | [testengine.module.powerapps.portal](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.powerapps.portal) |
| `CreateConnectionFunction` | Creates Power Platform connections during test execution. Note: This approach should be considered a backup as connections ideally should be created with service principals where possible. | [testengine.module.powerapps.portal](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.powerapps.portal) |
| `ExportConnectionsFunction` | Exports connection information to a JSON file for documentation or reuse purposes. Compatible with the PowerApps portal provider. | [testengine.module.powerapps.portal](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.powerapps.portal) |
| `GetConnectionsFunction` | Queries and retrieves available connection information from the Power Platform. Compatible with the PowerApps portal provider. | [testengine.module.powerapps.portal](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.powerapps.portal) |
| `UpdateConnectionReferencesFunction` | Updates Power Platform connection references. Should be used as a backup approach, as connections ideally should be managed by service principals. | [testengine.module.powerapps.portal](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.powerapps.portal) |
| `SampleFunction` | A simple sample function that demonstrates how to implement a basic [ReflectionFunction](/dotnet/api/microsoft.powerfx.reflectionfunction). Useful as a starting template for new function development. | [testengine.module.sample](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.sample) |
| `SimulateConnectorFunction` | Enables mocking of connector responses, allowing tests to run without actual external service dependencies. | [testengine.module.simulation](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.simulation) |
| `SimulateDataverseFunction` | Provides capabilities to simulate Dataverse responses, enabling testing without actual Dataverse dependencies. | [testengine.module.simulation](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.simulation) |
| `VisualCompareFunction` | Performs visual comparison between screenshots using OpenCV, enabling image-based verification of UI elements. | [testengine.module.visualcompare](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.visualcompare) |

## How to Use These Functions

These functions are available through the Power Fx Preview namespace when the corresponding modules are enabled. To enable a module in your test settings, add the following to your YAML configuration:

```yaml
testSettings:
  extensionModules:
    enable: true
    allowNamespaces:
      - Preview
```

For example, to use the PlaywrightAction function in your test:

```powerappsfl
Preview.PlaywrightAction("//button[@id='submit']", "click")
```

## Contribution Process

If you would like to develop more modules and functions for Test Engine, refer to the [Feature Lifecycle](./feature-lifecycle.md) documentation for information about the progression of features from open source contributions to general availability.
