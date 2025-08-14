---
title: Test Engine and Playwright Integration (preview)
description: Learn how Test Engine applies Playwright to provide robust browser automation capabilities.
author: pvillads
ms.author: pvillads
ms.subservice: test-engine
ms.date: 05/19/2025
ms.reviewer: jdaly
ms.topic: article
contributors:
- grant-archibald-ms
---

# Test Engine and Playwright integration (preview)

> [!NOTE]
> [!INCLUDE [cc-preview-features-definition](../includes/cc-preview-features-definition.md)]

## Overview

Power Apps Test Engine uses [Playwright](https://playwright.dev/) as its core browser automation technology. This integration provides Test Engine with powerful, reliable, and cross-browser testing capabilities while adding several layers of abstraction to simplify test creation for Power Platform applications.

## How Test Engine enhances Playwright

While Playwright offers excellent browser automation capabilities, Test Engine extends these capabilities specifically for Power Platform:

| Test Engine Enhancement | Description |
|------------------------|-------------|
| **App-Level Abstractions** | Test Engine works with app-level objects rather than DOM elements, making tests more resilient to UI changes |
| **Power Fx Integration** | Test Engine adds [Power Fx](./powerfx.md) support, enabling a low-code approach to test authoring |
| **Built-in Authentication** | Prebuilt authentication mechanisms handle Microsoft Entra and conditional access scenarios |
| **Dataverse Integration** | Direct integration with [Dataverse](./dataverse.md) allows for comprehensive end-to-end testing |
| **Specialized Providers** | Optimized providers for [Canvas apps](./canvas-application.md) and [Model-driven apps](./model-driven-application.md) |


## Technical implementation

The following sections describe how Test Engine builds on Playwright's browser automation foundation and integrates it with Power Platform-specific abstractions, enabling robust and maintainable test automation.

### Browser automation foundation

Test Engine utilizes Playwright's core capabilities for consistent browser automation:

- **Cross-browser support** for Chrome, Firefox, and Microsoft Edge
- **Reliable waiting mechanisms** that automatically wait for elements to be ready
- **Network request interception** for simulating API responses
- **Tracing and debugging tools** to diagnose test failures

### Test Engine's architectural integration

- **Provider Layer**: The provider layer in Test Engine interfaces directly with Playwright APIs to control browser behavior
- **Object Model**: Rather than working with raw DOM elements, Test Engine maps to application-specific object models
- **Power Fx Layer**: Test steps written in Power Fx are interpreted and executed through the provider layer

## Key technical features

The following sections highlight important technical features that Test Engine adds on top of Playwright, including app-specific selectors, browser context management, and direct access to Playwright functions for advanced scenarios.

### App-specific selectors

Test Engine uses app-specific selectors instead of CSS or XPath selectors:

```yaml
# Test Engine (using app-level selectors)
- testSteps: |
    Select(Button1)

# Equivalent in raw Playwright (using DOM selectors)
    Select(Button1)
# page.locator('div[data-control-name="Button1"]').click();
```

### Browser context management

Test Engine manages browser contexts to support various authentication scenarios:

```powershell
# Test Engine handles browser context automatically
pac test run `
   --provider canvas `
   --test-plan-file testplan.te.yaml `
   --tenant $tenantId `
   --environment-id $environmentId
```

## Direct Playwright functions

While Test Engine abstracts many Playwright interactions, there are scenarios where directly accessing Playwright capabilities can be valuable. Test Engine provides several preview functions that enable direct interaction with Playwright from within your Power Fx test steps.

### Using Playwright functions in Test Engine

Test Engine includes the following preview functions that allow you to apply Playwright's element selection capabilities:

| Function | Description | Example |
|----------|-------------|---------|
| [Preview.PlaywrightAction](powerfx-functions.md#previewplaywrightaction)| Execute an action on elements using CSS or DOM selectors | `Preview.PlaywrightAction("//button", "click")` <br/> See [Common Playwright Action Operations](#common-playwright-action-operations)|
| [Preview.PlaywrightActionValue](powerfx-functions.md#previewplaywrightactionvalue) | Execute an action that requires a value parameter | `Preview.PlaywrightActionValue("//input[@data-id='1']", "fill", "Hello")` <br /> See [Common Playwright Action Value Operations](#common-playwright-action-value-operations) |
| [Preview.PlaywrightScript](powerfx-functions.md#previewplaywrightscript)| Execute a custom C# script that interfaces with Playwright | `Preview.PlaywrightScript("sample.csx")` <br /> See [Advanced: Custom Playwright Scripts](#advanced-custom-playwright-scripts)|
| [Preview.Pause](powerfx-functions.md#previewpause)| Pause test execution and display the Playwright Inspector | `Preview.Pause()` |

> [!NOTE]
> To use these preview functions, you must add the preview functions to the allowed list in your test settings section.

### Common Playwright action operations

The following operations can be performed with [Preview.PlaywrightAction](powerfx-functions.md#previewplaywrightaction):

| Action | Description | Example |
|--------|-------------|---------|
| `click` | Selection of an element using click event | `Preview.PlaywrightAction("//button[@id='submit']", "click")` |
| `exists` | Check if an element exists | `Preview.PlaywrightAction("//div[@class='error-message']", "exists")` |
| `wait` | Wait for an element to be available | `Preview.PlaywrightAction("//table[@data-loading='false']", "wait")` |

### Common Playwright action value operations

The following operations can be performed with [Preview.PlaywrightActionValue](powerfx-functions.md#previewplaywrightactionvalue):

| Action | Description | Example |
|--------|-------------|---------|
| `fill` | Fill a form field with text | `Preview.PlaywrightActionValue("//input[@name='search']", "fill", "Product name")` |
| `select` | Select an option from a selection list | `Preview.PlaywrightActionValue("//select", "select", "Option2")` |
| `setAttribute` | Set an attribute on an element | `Preview.PlaywrightActionValue("//div", "setAttribute", "data-custom='value'")` |

### When to use direct Playwright functions

While app-level abstractions are preferred, direct Playwright functions are useful in these scenarios:

- **Complex UI interactions** not covered by standard Test Engine functions
- **Third-party components** within Power Platform applications that need special handling
- **Debugging complex test scenarios** where more control is needed
- **Advanced validation** of element states or properties

### Example: Combined approach

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

### Advanced: Custom Playwright scripts

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
> [Preview.PlaywrightScript](powerfx-functions.md#previewplaywrightscript) is only implemented for debug builds of Test Engine built from source, not in the released `pac test run` tool.

## Integration with development process

The following sections describe how Test Engine and Playwright can be used in both local development and CI/CD environments, supporting a range of workflows from interactive debugging to automated pipeline execution.

### Local development

For local development, Test Engine provides a complete environment:

- Local browser execution with UI visibility
- Step-by-step test execution
- Detailed logs and diagnostics

### CI/CD integration

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

## Best practices

When working with Test Engine's Playwright integration:

- **Focus on app-level objects** rather than DOM elements
- **Use Power Fx functions** for complex logic rather than raw JavaScript
- **Take advantage of built-in authentication** mechanisms
- **Reserve direct Playwright functions** for scenarios where app-level abstractions are insufficient
- **Review generated tests** to optimize for readability and maintenance

[!INCLUDE [footer-banner](../includes/footer-banner.md)]
