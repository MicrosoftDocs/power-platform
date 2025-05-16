# Test Engine Module Functions Reference

This table provides an overview of the various modules available in the Power Apps Test Engine and their specialized functions.

| Function | Description | GitHub Link |
|----------|-------------|------------|
| **testengine.module.mda**<br/>ConsentDialogFunction | Checks custom pages of a model-driven app for consent dialogs and handles them automatically during test execution. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.mda) |
| **testengine.module.pause**<br/>PauseFunction | Pauses the current test and allows the user to interact with the browser and inspect state when headless mode is false. Useful for debugging tests. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.pause) |
| **testengine.module.playwrightaction**<br/>PlaywrightActionFunction | Executes Playwright actions for the current page, allowing direct manipulation of DOM elements using CSS and XPath selectors. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.playwrightaction) |
| **testengine.module.playwrightaction**<br/>PlaywrightActionValueFunction | Executes Playwright actions that require extra value parameters, such as filling form fields or selecting dropdown options. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.playwrightaction) |
| **testengine.module.playwrightscript**<br/>PlaywrightScriptFunction | Enables execution of custom C# scripts that interact with Playwright APIs, providing maximum flexibility for complex automation scenarios. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.playwrightscript) |
| **testengine.module.powerapps.portal**<br/>CheckConnectionExistsFunction | Checks if a specific connection exists in the Power Platform using the Power Apps portal provider. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.powerapps.portal) |
| **testengine.module.powerapps.portal**<br/>CreateConnectionFunction | Creates Power Platform connections during test execution. Note: This approach should be considered a backup as connections ideally should be created with service principals where possible. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.powerapps.portal) |
| **testengine.module.powerapps.portal**<br/>ExportConnectionsFunction | Exports connection information to a JSON file for documentation or reuse purposes. Compatible with the PowerApps portal provider. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.powerapps.portal) |
| **testengine.module.powerapps.portal**<br/>GetConnectionsFunction | Queries and retrieves available connection information from the Power Platform. Compatible with the PowerApps portal provider. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.powerapps.portal) |
| **testengine.module.powerapps.portal**<br/>UpdateConnectionReferencesFunction | Updates Power Platform connection references. Should be used as a backup approach, as connections ideally should be managed by service principals. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.powerapps.portal) |
| **testengine.module.sample**<br/>SampleFunction | A simple sample function that demonstrates how to implement a basic ReflectionFunction. Useful as a starting template for new function development. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.sample) |
| **testengine.module.simulation**<br/>SimulateConnectorFunction | Enables mocking of connector responses, allowing tests to run without actual external service dependencies. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.simulation) |
| **testengine.module.simulation**<br/>SimulateDataverseFunction | Provides capabilities to simulate Dataverse responses, enabling testing without actual Dataverse dependencies. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.simulation) |
| **testengine.module.visualcompare**<br/>VisualCompareFunction | Performs visual comparison between screenshots using OpenCV, enabling image-based verification of UI elements. | [View Code](https://github.com/microsoft/PowerApps-TestEngine/tree/main/src/testengine.module.visualcompare) |

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
