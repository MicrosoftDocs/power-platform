---
title: Test Engine and Playwright Integration (preview)
description: Learn how Test Engine applies Playwright to provide robust browser automation capabilities.
author: grant-archibald-ms
ms.author: grarchib
ms.date: 05/15/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
 - JimDaly
 - pvillads
---

# Test Engine and Playwright Integration (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

## Overview

Power Apps Test Engine uses [Playwright](https://playwright.dev/) as its core browser automation technology. This integration provides Test Engine with powerful, reliable, and cross-browser testing capabilities while adding several layers of abstraction to simplify test creation for Power Platform applications.

## How Test Engine Enhances Playwright

While Playwright offers excellent browser automation capabilities, Test Engine extends these capabilities specifically for Power Platform:

| Test Engine Enhancement | Description |
|------------------------|-------------|
| **App-Level Abstractions** | Test Engine works with app-level objects rather than DOM elements, making tests more resilient to UI changes |
| **Power Fx Integration** | Test Engine adds [Power Fx](./powerfx.md) support, enabling a low-code approach to test authoring |
| **Built-in Authentication** | Prebuilt authentication mechanisms handle Microsoft Entra and conditional access scenarios |
| **Dataverse Integration** | Direct integration with [Dataverse](./dataverse.md) allows for comprehensive end-to-end testing |
| **Specialized Providers** | Optimized providers for [Canvas apps](./canvas-application.md) and [Model-driven apps](./model-driven-application.md) |


## Technical Implementation

### Browser Automation Foundation

Test Engine utilizes Playwright's core capabilities for consistent browser automation:

- **Cross-browser support** for Chrome, Firefox, and Microsoft Edge
- **Reliable waiting mechanisms** that automatically wait for elements to be ready
- **Network request interception** for simulating API responses
- **Tracing and debugging tools** to diagnose test failures

### Test Engine's Architectural Integration

1. **Provider Layer**: The provider layer in Test Engine interfaces directly with Playwright APIs to control browser behavior
2. **Object Model**: Rather than working with raw DOM elements, Test Engine maps to application-specific object models
3. **Power Fx Layer**: Test steps written in Power Fx are interpreted and executed through the provider layer

## Key Technical Features

### App-Specific Selectors

Test Engine uses app-specific selectors instead of CSS or XPath selectors:

```yaml
# Test Engine (using app-level selectors)
- testSteps: |
    Select(Button1)

# Equivalent in raw Playwright (using DOM selectors)
    Select(Button1)
# page.locator('div[data-control-name="Button1"]').click();
```

### Browser Context Management

Test Engine manages browser contexts to support various authentication scenarios:

```powershell
# Test Engine handles browser context automatically
pac test run `
   --provider canvas `
   --test-plan-file testplan.te.yaml `
   --tenant $tenantId `
   --environment-id $environmentId
```

## Direct Playwright Functions

While Test Engine abstracts many Playwright interactions, there are scenarios where directly accessing Playwright capabilities can be valuable. Test Engine provides several preview functions that enable direct interaction with Playwright from within your Power Fx test steps.

### Using Playwright Functions in Test Engine

Test Engine includes the following preview functions that allow you to apply Playwright's element selection capabilities:

| Function | Description | Example |
|----------|-------------|---------|
| `Preview.PlaywrightAction(selector, action)` | Execute an action on elements using CSS or DOM selectors | `Preview.PlaywrightAction("//button", "click")` |
| `Preview.PlaywrightActionValue(selector, action, value)` | Execute an action that requires a value parameter | `Preview.PlaywrightActionValue("//input[@data-id='1']", "fill", "Hello")` |
| `Preview.PlaywrightScript(scriptPath)` | Execute a custom C# script that interfaces with Playwright | `Preview.PlaywrightScript("sample.csx")` |
| `Preview.Pause()` | Pause test execution and display the Playwright Inspector | `Preview.Pause()` |

> [!NOTE]
> To use these preview functions, you must add the Preview functions to the allowed list in your test settings section.

### Common Playwright Action Operations

The following operations can be performed with `Preview.PlaywrightAction`:

| Action | Description | Example |
|--------|-------------|---------|
| `click` | Selection of an element using click event | `Preview.PlaywrightAction("//button[@id='submit']", "click")` |
| `exists` | Check if an element exists | `Preview.PlaywrightAction("//div[@class='error-message']", "exists")` |
| `wait` | Wait for an element to be available | `Preview.PlaywrightAction("//table[@data-loading='false']", "wait")` |

### Common Playwright Action Value Operations

The following operations can be performed with `Preview.PlaywrightActionValue`:

| Action | Description | Example |
|--------|-------------|---------|
| `fill` | Fill a form field with text | `Preview.PlaywrightActionValue("//input[@name='search']", "fill", "Product name")` |
| `select` | Select an option from a selection list | `Preview.PlaywrightActionValue("//select", "select", "Option2")` |
| `setAttribute` | Set an attribute on an element | `Preview.PlaywrightActionValue("//div", "setAttribute", "data-custom='value'")` |

### When to Use Direct Playwright Functions

While app-level abstractions are preferred, direct Playwright functions are useful in these scenarios:

1. **Complex UI interactions** not covered by standard Test Engine functions
2. **Third-party components** within Power Platform applications that need special handling
3. **Debugging complex test scenarios** where more control is needed
4. **Advanced validation** of element states or properties

### Example: Combined Approach

This example demonstrates combining app-level abstractions with direct Playwright actions:

```yaml
testSteps: |
  # Use app-level abstraction for Power Apps control
  Select(SubmitButton);
  
  # Use direct Playwright action for a third-party component
  Preview.PlaywrightAction("//div[@class='custom-calendar']//button[@data-day='15']", "click");
  
  # Wait for a specific condition using Playwright
  Preview.PlaywrightAction("//div[@data-status='complete']", "wait");
  
  # Resume using app-level abstractions
  Assert(Label1.Text = "Submission Complete");
```

### Advanced: Custom Playwright Scripts

For highly specialized scenarios, you can create custom Playwright scripts:

1. Create a `.csx` file with your custom Playwright logic
2. Reference required Playwright assemblies
3. Implement the required class structure
4. Call the script from your test steps

```csharp
// sample.csx
#r "Microsoft.Playwright.dll"
#r "Microsoft.Extensions.Logging.dll"
using Microsoft.Playwright;
using Microsoft.Extensions.Logging;

public class PlaywrightScript {
    public static void Run(IBrowserContext context, ILogger logger) {
        Execute(context, logger).Wait();
    }

    public static async Task Execute(IBrowserContext context, ILogger logger) {
        var page = context.Pages.First();
        // Custom Playwright logic here
    }
}
```

> [!NOTE]
> `Preview.PlaywrightScript` is only implemented for debug builds of Test Engine built from source, not in the released `pac test run` tool.

## Integration with Development Process

### Local Development

For local development, Test Engine provides a complete environment:

- Local browser execution with UI visibility
- Step-by-step test execution
- Detailed logs and diagnostics

### CI/CD Integration

In CI/CD environments, Test Engine can run Playwright in headless mode:

```yaml
# Example Azure DevOps pipeline step
- task: PowerShell@2
  displayName: 'Run Test Engine Tests'
  inputs:
    script: |
      pac test run `
        --provider canvas `
        --test-plan-file "$(Build.SourcesDirectory)/tests/testplan.te.yaml" `
        --tenant "$(TenantId)" `
        --environment-id "$(EnvironmentId)"
```

## Best Practices

When working with Test Engine's Playwright integration:

1. **Focus on app-level objects** rather than DOM elements
2. **Use Power Fx functions** for complex logic rather than raw JavaScript
3. **Take advantage of built-in authentication** mechanisms
4. **Reserve direct Playwright functions** for scenarios where app-level abstractions are insufficient
5. **Review generated tests** to optimize for readability and maintenance

## Summary

Test Engine provides the power of Playwright with abstraction layers designed specifically for Power Platform applications. This approach combines the reliability of browser automation with the simplicity of app-level testing, resulting in more robust, maintainable test suites.

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
