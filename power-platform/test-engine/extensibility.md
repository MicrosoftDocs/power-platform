---
title: "Test Engine extensibility (preview)"
description: Understanding the extensibility model for Test Engine and the role of Microsoft-signed components
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: article
---
# Test Engine extensibility (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

## Overview

Power Apps Test Engine features a robust extensibility framework that allows the core testing capabilities to be expanded through various extension points. This article explains:

- How Microsoft signs and validates first-party extensions
- How the extensibility model works using the Managed Extensibility Framework (MEF)
- Options for organizations to create their own extensions

## Microsoft-signed components

> [!IMPORTANT]
> During the public preview phase, the [pac test run](../developer/cli/reference/test.md#pac-test-run) command only loads Microsoft-signed extensions. This design ensures security, stability, and performance of the Test Engine platform.

Microsoft builds, signs, and validates first-party components to ensure they meet quality and security standards. These components include:

- Core authentication providers
- Canvas app and model-driven app providers
- Standard Power Fx functions and actions

## Extensibility framework (MEF)

Test Engine uses the **[Managed Extensibility Framework (MEF)](/dotnet/framework/mef/)** to enable a pluggable architecture. This framework allows three primary types of extensions:

### Authentication extensions

Authentication extensions enable different ways to authenticate with Power Platform:

- **Storage State Authentication** - The default browser-based authentication method
- **Certificate-based Authentication** - For non-interactive test execution
- **Custom Authentication Providers** - For specialized authentication scenarios

For more information, see [Authentication in Test Engine](./authentication.md).

### Provider extensions

Provider extensions enable testing different types of applications:

- **Canvas App Provider** - For testing Power Apps canvas applications
- **Model-driven App Provider** - For testing Dataverse model-driven apps
- **Power Fx Provider** - For executing Power Fx statements independently
- **Portal Provider** - For automating operations in [Power Apps](https://make.powerapps.com)

For more information, see [Canvas Applications](./canvas-application.md), [Model-driven Applications](./model-driven-application.md), and [Dataverse Extensions](./dataverse.md).

### Power Fx extensions

Power Fx extensions add new testing capabilities through custom functions:

- **User-defined Functions** - Low-code functions defined in the test plan
- **C# ReflectionFunction Implementations** - Custom functions implemented in C# modules

For more information, see [Power Fx Functions](./powerfx.md) and [C# ReflectionFunction Implementations](./powerfx-csharp.md).

## Extension development options

Organizations have multiple options for extending Test Engine:

### Using the open source version

The [Power Apps Test Engine](https://github.com/microsoft/PowerApps-TestEngine) is available as an open source project under the MIT license. First-party Microsoft, third-party teams, and organizations can:

- Create new providers for specialized testing scenarios
- Develop custom authentication mechanisms
- Build new C# ReflectionFunction implementations
- Create modules that extend the core functionality
- Submit contributions for consideration in the core product

### Power Fx user-defined functions

For simpler scenarios, you can create user-defined functions directly in your test plans:

```yaml
testSuite:
  testCases:
    - testCaseName: "Test with custom functions"
      userDefineFunctions:
        - name: "FormatDateString"
          parameters: [date]
          expression: "Text(date, 'yyyy-MM-dd')"
      steps:
        # Use the custom function in your test steps
        - action: PowerFxTestStep
          expression: FormatDateString(Now())
```

### Custom C# Power Fx functions with ReflectionFunction

For more complex scenarios, organizations can develop custom C# functions by implementing the `ReflectionFunction` class and registering them through a module:

```csharp
// Define your function class
public class SampleFunction : ReflectionFunction
{
    public SampleFunction() : base(DPath.Root.Append(new DName("Preview")), "Sample", FormulaType.Blank)
    {
    }

    public BlankValue Execute()
    {
        Console.WriteLine("Sample function executed");
        return BlankValue.NewBlank();
    }
}

// Register your function in a module
[Export(typeof(ITestEngineModule))]
public class TestEngineSampleModule : ITestEngineModule
{
    public void RegisterPowerFxFunction(PowerFxConfig config, ITestInfraFunctions testInfraFunctions, 
        ITestWebProvider testWebProvider, ISingleTestInstanceState singleTestInstanceState, 
        ITestState testState, IFileSystem fileSystem)
    {
        config.AddFunction(new SampleFunction());
    }
    
    // Implement other required interface methods...
}
```

## Collaboration with the Test Engine team

Organizations that develop valuable extensions using the open source Test Engine can consider creating a pull request for their extensions to make them available in the official product. The process typically involves:

1. **Development** - Create your extension using the open source Test Engine
2. **Validation** - Test your extension thoroughly in your own environment
3. **Collaboration** - Work with the Core Test Engine team to evaluate the extension
4. **Integration** - If approved, Microsoft signs and integrates the extension into the product

This collaboration model enables innovation while maintaining the security and reliability of the official Test Engine product.

## Technical integration points

The following sections describe how Test Engine extensibility integrates with core technologies such as Playwright and the feature lifecycle. Understanding these integration points help you develop and deploy custom extensions effectively.

### Playwright integration

Power Apps Test Engine is built on top of [Playwright](https://playwright.dev/), which provides the foundation for browser automation. Custom extensions can interact with Playwright's [IBrowserContext](https://playwright.dev/dotnet/docs/api/class-browsercontext) to create sophisticated browser-based testing capabilities.

### Feature Lifecycle

New extensions follow a [Feature Lifecycle](./feature-lifecycle.md):

1. **Preview Namespace** - New extensions are first available in the Preview namespace for early testing
2. **TestEngine Namespace** - After validation, extensions move to the core TestEngine namespace

## Benefits of the extensibility model

The extensibility model provides significant benefits:

- **Standardization** - Microsoft-signed components ensure consistent quality and security
- **Innovation** - The open source model allows for community-driven innovation
- **Flexibility** - Organizations can create specialized extensions for unique requirements
- **Integration** - Valuable extensions are considered for inclusion in the official product

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
