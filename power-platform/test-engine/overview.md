---
title: Power Apps Test Engine overview (preview)
description: Learn about how you can automate tests of standalone canvas apps using the Power Apps Test Engine within Power Platform CLI.
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/15/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - jt000
 - FrankDahl
 - grant-archibald-ms
---

# Power Apps Test Engine overview (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

Power Apps Test Engine is a testing solution designed specifically for Power Platform applications. Whether you're new to automated testing, familiar with [Test Studio](/power-apps/maker/canvas-apps/test-studio), or an experienced developer with [Playwright](https://playwright.dev/) knowledge, Test Engine offers a scalable approach to testing that aligns with the low-code philosophy of Power Platform.

Learn more about how Test Engine helps you regardless of where you're starting from:


## [Manual Testers](#tab/manual)

If you're testing your Power Platform applications manually, Test Engine provides an accessible entry point to test automation:

- **Low-code approach**: Create automated tests using YAML and Power Fx, the same formula language used in Power Apps
- **No DOM knowledge required**: You don't need to understand HTML or CSS selectors to interact with your app's components
- **Familiar terminology**: Tests reference control names as they appear in Power Apps Studio, making tests easy to read and maintain

Test Engine can help you:

- **Save time**: Automate repetitive test scenarios that you're currently performing manually
- **Increase coverage**: Run more comprehensive tests more frequently
- **Create a test baseline**: Document your testing process in a format that can be reused and shared
- **Learn gradually**: Start with simple tests and expand as your comfort level increases

## [Test Studio users](#tab/teststudio)

If you're familiar with testing canvas apps using Test Studio, Test Engine represents an evolution in Power Platform testing:

- **Command-line interface**: Run tests from the Power Platform CLI, enabling integration with CI/CD pipelines
- **Broader application support**: Test Model-driven applications, Dataverse extensions, and canvas apps.
- **Enhanced capabilities**: Access features like connector mocking, screenshot capture, and video recording for comprehensive test coverage

Test Engine offers these advantages:

- **Command-line execution**: Run tests from terminals or CI/CD pipelines
- **Broader application support**: Test Model-driven apps and Dataverse integrations, not just Canvas apps
- **Greater control**: Customize test behavior with fine-grained settings
- **Programmatic approach**: Create test patterns that can be reused across multiple apps

## [Professional Developers](#tab/prodev)

If you're a pro developer experienced with tools like Playwright, Test Engine offers:

- **Domain-specific advantages**: While Playwright operates at the DOM level, Test Engine applies the JavaScript object model of Power Apps for more resilient tests
- **Efficiency gains**: Create and maintain tests faster than traditional code-first approaches
- **Integration options**: Use the [Preview.PlaywrightAction function](powerfx-functions.md#previewplaywrightaction) when you need direct Playwright capabilities like locators

Test Engine provides:

- **Power Platform optimization**: Tests that understand the unique structure of Power Platform applications
- **Lower maintenance**: Tests that are more resilient to UI changes
- **Team collaboration**: A testing approach that both developers and low-code makers can understand
- **Hybrid options**: Use Playwright actions directly when needed for specialized scenarios

---

Currently, Power Apps Test Engine works with the following Power Platform components:

- [Canvas Apps](/power-apps/maker/canvas-apps/index)
- [Model Driven Application](/power-apps/maker/model-driven-apps/index)
- [Dataverse extensions](/power-apps/maker/data-platform/index)

You must [Install Microsoft Power Platform CLI](../developer/cli/introduction.md#install-microsoft-power-platform-cli) to use the Test Engine.


## Getting Started with Test Engine

The approach to getting started depends on your role and experience level:

### [Manual Testers](#tab/manual)

1. **Install the Tools**: 
   - [Install Microsoft Power Platform CLI](../developer/cli/introduction.md#install-microsoft-power-platform-cli)
   - Familiarize yourself with basic command-line operations

1. **Start with a Simple Test**:
   - Begin with a basic test that validates a single screen or function
   - Use the [YAML format](yaml.md) to structure your test
   - Learn common [Power Fx functions](powerfx-functions.md) for testing

1. **Build Your Testing Skills**:
   - Follow tutorials and examples in the [Test Engine documentation](https://github.com/microsoft/PowerApps-TestEngine/tree/main/samples)
   - Gradually add more complex scenarios to your tests

### [Test Studio users](#tab/teststudio)

1. **Understand the Differences**:
   - Test Engine uses a command-line approach instead of the interactive designer
   - Tests are written in YAML files with Power Fx expressions
   - Test Engine supports broader application types

1. **Learn the Test Structure**:
   - Review the [YAML format](yaml.md) to understand how tests are structured
   - See how [authentication](authentication.md) works differently in Test Engine

1. **Expand Your Testing Scope**:
   - Explore testing [Model-driven applications](model-driven-application.md)
   - Learn about [Dataverse integration](dataverse.md) for more comprehensive tests


### [Professional Developers](#tab/prodev)

1. **Evaluate the Architecture**:
   - Review how Test Engine [compares to Playwright](playwright.md)
   - Understand the application types:
     - [Canvas applications](canvas-application.md)
     - [Model-driven applications](model-driven-application.md)
     - [Dataverse extensions](dataverse.md)

1. **Integrate with Development Workflows**:
   - Add Test Engine to your CI/CD pipelines
   - Explore the [extensibility options](extensibility.md) for custom providers and functions

1. **Use Advanced Features**:
   - Implement [connector mocking](simulation.md) for isolated testing
   - Use [Dataverse integration](dataverse.md) for end-to-end testing
   - Apply [PlaywrightAction](powerfx-functions.md#previewplaywrightaction) for specialized control interactions

---

## Key Features and Benefits

- **[Authentication Flexibility](authentication.md)**: Multiple authentication methods including interactive, service principal, and session persistence
- **[Power Fx Test Authoring](powerfx.md)**: Write tests using the same formula language used in Power Apps
- **[Dataverse Integration](dataverse.md)**: Test Dataverse-dependent functionality with built-in support
- **Control Name References**: Reference controls by their studio names rather than complex DOM selectors
- **Multiple Application Types**: Test [Canvas apps](canvas-application.md), [Model-driven apps](model-driven-application.md), and more with specialized providers
- **[Connector Mocking](simulation.md)**: Simulate connector responses for reliable, isolated testing
- **Visual Diagnostics**: Capture screenshots and videos to troubleshoot test failures

## Limitations

As Test Engine is in preview, be aware of these current limitations:

- Browser locale settings follow your default browser settings
- Some specialized controls can require using the [Preview.PlaywrightAction function](powerfx-functions.md#previewplaywrightaction)
- Performance testing capabilities are still in development

### Supported Browsers

The Test Engine works with the following browsers:

- Chromium (Chrome, Microsoft Edge)
- Firefox
- WebKit (Safari)

## Regional and Language Considerations

Test Engine supports various language and regional settings:

- **Decimal Separators**: Use the `locale` property in `testSettings` to handle different decimal separators (`.` vs `,`) and list separators (`,` vs `;`). [Learn more about testSettings](yaml.md#testsettings).

- **Sample Configurations**:
  1. For regions using semicolons as list separators: [Sample with semicolon separators](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/basicgallery/testPlanForRegionUseSemicolonAsSeparator.fx.yaml)
  1. For regions using commas as decimal separators: [Sample with comma decimals](https://github.com/microsoft/PowerApps-TestEngine/blob/main/samples/calculator/testPlanWithCommaForDecimal.fx.yaml)

## Working with Apps in Test Plans

### Solution-Based Apps (Recommended)

For apps in solutions, tests remain portable across environments:

1. **Locate the app's logical name**:
   - Open the solution containing your app in Power Apps
   - Note the app's **Name** (not Display name) in the list

1. **Reference in test plan**:
   - Use `appLogicalName` in your test plan YAML
   - This ensures tests work when the solution is moved to a different environment

### Standalone Apps

For apps not in solutions, update tests when moving environments:

1. **Find the App ID**:
   - Locate the app in the Power Apps list
   - Open Details and note the App ID GUID

1. **Update your test plan**:
   - Use `appId` in your test plan YAML
   - Update this value when moving to a new environment

## Next Steps

- [Explore Test Engine Features](features.md)
- [Test Canvas applications](canvas-application.md)
- [Test Model-driven applications](model-driven-application.md)
- [Test Dataverse extensions](dataverse.md)
- [View YAML Test Plan Format](yaml.md)
- [Browse Power Fx Functions for Testing](powerfx-functions.md)
- [Read Test Engine Release Notes](https://github.com/microsoft/PowerApps-TestEngine/releases)

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
