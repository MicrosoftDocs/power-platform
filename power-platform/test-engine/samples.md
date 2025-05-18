---
title: Power Apps Test Engine Samples (preview)
description: Examples and sample tests for Power Apps Test Engine
# Update samples.md that reads all the folders from https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples and uses any readme.md to summarize the sample. Generate samples as table with link to the sample and a second column with the description
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/17/2025
ms.reviewer: jdaly
ms.topic: article
---

# Power Apps Test Engine Samples

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

This page provides an overview of the sample projects available in the Power Apps Test Engine repository. These samples demonstrate various testing capabilities and scenarios to help you understand how to create effective tests for your Power Platform solutions.

## Available Samples

The following samples are available in the [PowerApps-TestEngine GitHub repository](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples):

| Sample | Description |
|--------|-------------|
| [Basic Gallery](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/basicgallery) | Demonstrates how to test interactions with controls within a basic gallery in a canvas app. Sample shows how to assert label text values and navigate between gallery items. |
| [Button Clicker](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/buttonclicker) | Simple test that verifies a counter increments when a button is clicked. Shows how to use test lifecycle hooks (OnTestCaseStart, OnTestCaseComplete) and basic control interactions. |
| [Calculator](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/calculator) | Tests a calculator component with multiple operations (Add, Subtract, Multiply, Divide). Demonstrates how to test components with input and output controls. |
| [Copilot Studio Kit](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/copilotstudiokit) | Advanced sample demonstrating tests for the Power CAT Copilot Studio Kit. Features testing of multiple custom pages, report generation, and entity-based testing. |
| [Containers](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/containers) | Shows how to interact with controls inside container components, verifying property changes and event handling. |
| [Dataverse](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/dataverse) | Demonstrates testing Dataverse operations using Power Fx actions. Shows how to create, read, update, and delete records directly with Dataverse. |
| [Different Variable Types](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/differentvariabletypes) | Showcases testing with multiple data types (String, Number, Boolean, Date, Record, Table) using various controls like TextInput, Rating, Toggle, DatePicker, Dropdown, and ComboBox. |
| [Many Screens](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/manyscreens) | Tests navigation between multiple screens in a canvas app, verifying correct screen transitions and content. |
| [MDA Header Control](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/mdaheadercontrol) | Tests the header control interactions in a model-driven app, demonstrating testing of model-driven app UI elements. |
| [Nested Gallery](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/nestedgallery) | Demonstrates testing nested galleries with both row and column galleries. Shows how to select items in nested galleries and validate selection state. |
| [PCF Component](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/pcfcomponent) | Shows how to test Power Apps Component Framework (PCF) components, specifically an increment control component. |
| [Permissions](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/permissions) | Demonstrates testing with different user permission scenarios. Tests how applications behave with various security roles and access levels. |
| [Screen Navigation](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/screennavigation) | Focuses on testing screen navigation capabilities, verifying correct transitions between screens. |
| [Weather](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/weather) | Shows how to mock connector responses for the MSN Weather connector. Demonstrates testing with simulated external service calls. |

## Sample Structure

Most samples follow a common structure:

- **README.md**: Explains the sample's purpose, prerequisites, and usage instructions
- **RunTests.ps1**: PowerShell script to execute the tests
- **config.json**: Configuration settings for the test environment
- **Test YAML files**: Test definitions (.fx.yaml or .te.yaml)
- **Solution package**: A .zip file containing the sample app (for some samples)

## Common Features Demonstrated

These samples demonstrate several key testing capabilities:

### Basic Test Operations

Basic test operations include:

- Setting and getting control properties
- Verifying control values and visibility
- Clicking buttons and interacting with controls
- Waiting for conditions before proceeding

### Advanced Testing Features

Advanced testing feature include:

- Navigation between screens and forms
- Working with galleries and collections
- Testing with different data types
- Mocking external services and connectors
- Testing with different user contexts

### Test Lifecycle Management

These are examples of test lifecycle management:

- Using `OnTestCaseStart` and `OnTestCaseComplete` hooks
- Configuration for different environments
- Error handling and test diagnostics
- Video recording and screenshot capabilities

## Getting Started with Samples

To use a sample, follow these general steps:

1. Clone the [PowerApps-TestEngine repository](https://github.com/microsoft/PowerApps-TestEngine)
2. Install prerequisites as described in the sample's README
3. Configure your environment in the config.json file
4. Import the sample solution if provided
5. Run the tests using the RunTests.ps1 script

For detailed instructions, refer to each sample's README.md file and the [Test Engine documentation](overview.md).

## Using Samples for Learning

The samples provide excellent learning resources:

1. **Start simple**: Begin with the [Button Clicker](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/buttonclicker) or [Basic Gallery](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples/basicgallery) samples for fundamental concepts
1. **Progress gradually**: Move to more complex samples as you gain confidence
1. **Customize tests**: Modify the samples to match your own application's requirements
1. **Learn by example**: Use the sample code patterns as templates for your own tests

### Related articles

[Test Engine Overview](overview.md)  
[Power Fx Functions for Testing](powerfx-functions.md)  
[YAML Test Format](yaml.md)  
[Authentication Guide](authentication-guide.md)  
[AI-assisted Test Authoring](ai-authoring.md)  

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
